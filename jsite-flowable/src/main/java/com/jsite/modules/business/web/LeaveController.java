package com.jsite.modules.business.web;

import com.google.common.collect.Maps;
import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.web.BaseController;
import com.jsite.modules.business.entity.Leave;
import com.jsite.modules.business.service.LeaveService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 请假Controller
 * @author liuruijun
 * @version 2018-04-05
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/leave")
public class LeaveController extends BaseController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	protected LeaveService leaveService;

	@ModelAttribute
	public Leave get(@RequestParam(required=false) String id){
		Leave leave = null;
		if (StringUtils.isNotBlank(id)){
			leave = leaveService.get(id);
		}
		if (leave == null){
			leave = new Leave();
		}
		return leave;
	}

	@RequiresPermissions("oa:leave:view")
	@RequestMapping(value = {"form"})
	public String form(Leave leave, Model model) {
		
		String view = "leaveForm";
		if (StringUtils.isNotBlank(leave.getId())){
			String taskDefKey = leave.getAct().getTaskDefKey();
			
			// 查看工单
			if (leave.getAct().isFinishTask()) {
				view = "leaveView";
			}
			
			// 部门领导审核环节
			else if ("deptLeaderAudit".equals(taskDefKey)) {
				view = "leaveAudit";
			}
			
			// 人事审核环节
			else if ("hrAudit".equals(taskDefKey)) {
				view = "leaveAudit";
			}
			
			// 调整申请
			else if ("modifyApply".equals(taskDefKey)) {
				view = "leaveForm";
			}
			
		}
		
		model.addAttribute("leave", leave);
		return "modules/business/" + view;
	}

	/**
	 * 启动请假流程
	 * @param leave	
	 */
	@RequiresPermissions("oa:leave:edit")
	@RequestMapping(value = "save", method = RequestMethod.POST)
	@ResponseBody
	public String save(Leave leave) {
		try {
			Map<String, Object> variables = Maps.newHashMap();

			String message = leaveService.save(leave, variables);

			return renderResult(Global.TRUE, message);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return renderResult(Global.FALSE, "系统内部错误！");
	}

	
	/**
	 * 工单执行（完成任务）
	 * @param leave
	 * @return
	 */
	@RequiresPermissions("oa:leave:edit")
	@RequestMapping(value = "saveAudit")
	@ResponseBody
	public String saveAudit(Leave leave) {
		String message = leaveService.auditSave(leave);
		return renderResult(Global.TRUE, message);
	}
}
