package com.jsite.modules.business.service.listener;

import org.flowable.engine.delegate.TaskListener;
import org.flowable.task.service.delegate.DelegateTask;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LeaveModifyProcessor implements TaskListener {
	
	private static final long serialVersionUID = 1L;

//	@Autowired
//	private LeaveDao leaveDao;
//	@Autowired
//	private RuntimeService runtimeService;

	@Override
	public void notify(DelegateTask delegateTask) {
//		String processInstanceId = delegateTask.getProcessInstanceId();
//		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
//		Leave leave = new Leave(processInstance.getBusinessKey());
//		leave.setLeaveType((String) delegateTask.getVariable("leaveType"));
//		leave.setStartTime((Date) delegateTask.getVariable("startTime"));
//		leave.setEndTime((Date) delegateTask.getVariable("endTime"));
//		leave.setReason((String) delegateTask.getVariable("reason"));
//		leave.preUpdate();
//		leaveDao.update(leave);
	}

}
