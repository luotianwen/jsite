package com.jsite.modules.business.service;

import com.google.common.collect.Maps;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.service.CrudService;
import com.jsite.modules.business.dao.LeaveDao;
import com.jsite.modules.business.entity.Leave;
import com.jsite.modules.flowable.service.FlowTaskService;
import com.jsite.modules.flowable.utils.FlowableUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;


@Service
@Transactional(readOnly = true)
public class LeaveService extends CrudService<LeaveDao, Leave> {

	@Autowired
	private FlowTaskService actTaskService;
	
	@Transactional(readOnly = false)
	public String save(Leave leave, Map<String, Object> variables) {
		String businessTable = FlowableUtils.getBusinessTable("leave");
		if (StringUtils.isBlank(businessTable)) {
		    return "流程启动失败，请先设置业务表";
        }

		// 申请发起 保存业务数据
		if (StringUtils.isBlank(leave.getId())){
			leave.preInsert();
			dao.insert(leave);

			String procIns = actTaskService.startProcess("leave", businessTable, leave.getId(), variables);
			
			logger.debug("流程已启动，流程ID："+ procIns);

			return "流程已启动，流程ID："+ procIns;
		}
		
		// 重新编辑申请		
		else{
			leave.preUpdate();
			dao.update(leave);
			
			leave.getAct().setComment(leave.getAct().isPass()?"[重申] ":"[销毁] " + leave.getAct().getComment());
			
			// 完成流程任务
			variables.put("auditPass", leave.getAct().isPass());
			actTaskService.complete(leave.getAct().getTaskId(), leave.getAct().getProcInsId(), leave.getAct().getComment(), variables);

            return "流程已" + (leave.getAct().isPass()?"[重申] ":"[销毁] ");
		}
	}
	
	
	/**
	 * 审核审批保存
	 * @param leave
	 */
	@Transactional(readOnly = false)
	public String auditSave(Leave leave) {
		
		// 设置意见
		leave.getAct().setComment((leave.getAct().isPass()?"[同意] ":"[驳回] ")+leave.getAct().getComment());
		
		leave.preUpdate();
		
		// 对不同环节的业务逻辑进行操作
		String taskDefKey = leave.getAct().getTaskDefKey();

		Map<String, Object> vars = Maps.newHashMap();
		// 部门领导审批
		if ("deptLeaderAudit".equals(taskDefKey)){
			leave.setDeptLeadText(leave.getAct().getComment());
			dao.updateLeadText(leave);
		}
		// HR审批
		else if ("hrAudit".equals(taskDefKey)){
			leave.setHrText(leave.getAct().getComment());
			dao.updateHRText(leave);
		}
		// 重新修改
		else if ("modifyApply".equals(taskDefKey)){
			dao.update(leave);
		}
		
		// 未知环节，直接返回
		else{
			return "未知环节";
		}

		vars.put("auditPass", leave.getAct().isPass());

		// 提交流程任务
		actTaskService.complete(leave.getAct().getTaskId(), leave.getAct().getProcInsId(), leave.getAct().getComment(), vars);

        return "处理成功";
	}

}
