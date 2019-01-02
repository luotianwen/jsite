package com.jsite.modules.business.service.listener;

import org.flowable.engine.delegate.TaskListener;
import org.flowable.task.service.delegate.DelegateTask;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 销假后处理器
 * @author liuruijun
 */
@Service
@Transactional
public class LeaveReportProcessor implements TaskListener {

	private static final long serialVersionUID = 1L;

//	@Autowired
//	private LeaveDao leaveDao;
//	@Autowired
//	private RuntimeService runtimeService;
	
	/**
	 * 销假完成后执行，保存实际开始和结束时间
	 */
	@Override
	public void notify(DelegateTask delegateTask) {
//		String processInstanceId = delegateTask.getProcessInstanceId();
//		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
//		Leave leave = new Leave(processInstance.getBusinessKey());
//		leave.setRealityStartTime((Date) delegateTask.getVariable("realityStartTime"));
//		leave.setRealityEndTime((Date) delegateTask.getVariable("realityEndTime"));
//		leave.preUpdate();
//		leaveDao.updateRealityTime(leave);
	}


}
