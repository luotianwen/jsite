package com.jsite.modules.flowable.service;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.mapper.JsonMapper;
import com.jsite.common.persistence.Page;
import com.jsite.common.service.BaseService;
import com.jsite.modules.flowable.dao.FlowDao;
import com.jsite.modules.flowable.entity.Flow;
import com.jsite.modules.flowable.utils.ProcessDefCache;
import com.jsite.modules.sys.entity.User;
import com.jsite.modules.sys.utils.UserUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.flowable.common.engine.api.delegate.Expression;
import org.flowable.engine.*;
import org.flowable.engine.history.HistoricActivityInstance;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.history.HistoricProcessInstanceQuery;
import org.flowable.engine.impl.RepositoryServiceImpl;
import org.flowable.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Comment;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskQuery;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flowable.task.api.history.HistoricTaskInstanceQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 流程定义相关Service
 ** @author liuruijun
 * @version 2017-11-03
 */
@Service
@Transactional(readOnly = true)
public class FlowTaskService extends BaseService {

	@Autowired
	private FlowDao actDao;

	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private FormService formService;
	@Autowired
	private HistoryService historyService;
	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private IdentityService identityService;

	/**
	 * 获取待办列表
	 * @param procDefKey 流程定义标识
	 * @return
	 */
	public Page<Flow> todoList(Flow act){
		String userId = UserUtils.getUser().getLoginName();//ObjectUtils.toString(UserUtils.getUser().getId());
		
		Page<Flow> result = new Page<Flow>();
		
		List<Flow> flowList = new ArrayList<Flow>();
		
		// =============== 已经签收的任务  ===============
		TaskQuery todoTaskQuery = taskService.createTaskQuery().taskAssignee(userId).active()
				.includeProcessVariables().orderByTaskCreateTime().desc();
		
		// 设置查询条件
		if (StringUtils.isNotBlank(act.getProcDefKey())){
			todoTaskQuery.processDefinitionKey(act.getProcDefKey());
		}
		if (act.getBeginDate() != null){
			todoTaskQuery.taskCreatedAfter(act.getBeginDate());
		}
		if (act.getEndDate() != null){
			todoTaskQuery.taskCreatedBefore(act.getEndDate());
		}
		
		result.setCount(todoTaskQuery.count());
		// 查询列表
		List<Task> todoList = todoTaskQuery.list();
		for (Task task : todoList) {
			Flow e = new Flow();
			e.setTaskId(task.getId());
			e.setTaskDefKey(task.getTaskDefinitionKey());
			e.setTaskName(task.getName());
			e.setAssignee(task.getAssignee());
			e.setCreateTime(task.getCreateTime());
			e.setExecutionId(task.getExecutionId());
			e.setVars(task.getProcessVariables());
			
			ProcessDefinition pd = ProcessDefCache.get(task.getProcessDefinitionId());
			e.setProcDefId(pd.getId());
			e.setProcDefname(pd.getName());
			e.setProcDefKey(pd.getKey());
			e.setProcDefversion(pd.getVersion());
			
			e.setProcInsId(task.getProcessInstanceId());
			e.setStatus("todo");
			flowList.add(e);
		}
		
		// =============== 等待签收的任务  ===============
		TaskQuery toClaimQuery = taskService.createTaskQuery().taskCandidateUser(userId)
				.includeProcessVariables().active().orderByTaskCreateTime().desc();
		
		// 设置查询条件
		if (StringUtils.isNotBlank(act.getProcDefKey())){
			toClaimQuery.processDefinitionKey(act.getProcDefKey());
		}
		if (act.getBeginDate() != null){
			toClaimQuery.taskCreatedAfter(act.getBeginDate());
		}
		if (act.getEndDate() != null){
			toClaimQuery.taskCreatedBefore(act.getEndDate());
		}
		
		// 查询列表
		List<Task> toClaimList = toClaimQuery.list();
		for (Task task : toClaimList) {
			Flow e = new Flow();
			e.setTaskId(task.getId());
			e.setTaskDefKey(task.getTaskDefinitionKey());
			e.setTaskName(task.getName());
			e.setAssignee(task.getAssignee());
			e.setCreateTime(task.getCreateTime());
			e.setExecutionId(task.getExecutionId());
			e.setVars(task.getProcessVariables());
			
			ProcessDefinition pd = ProcessDefCache.get(task.getProcessDefinitionId());
			e.setProcDefId(pd.getId());
			e.setProcDefname(pd.getName());
			e.setProcDefKey(pd.getKey());
			e.setProcDefversion(pd.getVersion());
			
			e.setProcInsId(task.getProcessInstanceId());
			e.setStatus("claim");
			flowList.add(e);
		}
		logger.info("==FLOWABLE LIST=="+JsonMapper.toJsonString(flowList));
		result.setList(flowList);
		return result;
	}
	
	/**
	 * 获取已发任务
	 * @param page
	 * @param procDefKey 流程定义标识
	 * @return
	 */
	public Page<Flow> hasSentList(Page<Flow> page, Flow act){
		String userId = UserUtils.getUser().getLoginName();//ObjectUtils.toString(UserUtils.getUser().getId());
		
		HistoricProcessInstanceQuery historyProQuery =  historyService.createHistoricProcessInstanceQuery().startedBy(userId).orderByProcessInstanceStartTime().desc();
		
		// 查询总数
		page.setCount(historyProQuery.count());
		
		// 查询列表
		List<HistoricProcessInstance> hispList = historyProQuery.listPage(page.getFirstResult(), page.getMaxResults());
		//处理分页问题
		List<Flow> actList=Lists.newArrayList();
		for (HistoricProcessInstance hisprocIns : hispList) {
			Flow e = new Flow();
			
			ProcessDefinition pd = ProcessDefCache.get(hisprocIns.getProcessDefinitionId());
			e.setProcDefId(pd.getId());
			e.setProcDefname(pd.getName());
			e.setProcDefKey(pd.getKey());
			e.setProcDefversion(pd.getVersion());
			e.setProcInsId(hisprocIns.getId());
		    
			HistoricTaskInstance historytask = getHistoryTask(hisprocIns.getId());
			e.setTaskId(historytask.getId());
		    e.setTaskName(historytask.getName());
		    e.setTaskDefKey(historytask.getTaskDefinitionKey());
			
		    e.setCreateTime(hisprocIns.getStartTime());
			e.setEndTime(hisprocIns.getEndTime());
			e.setVars(hisprocIns.getProcessVariables());
			e.setBusinessId(hisprocIns.getBusinessKey());
			
//			e.setDeployId(hisprocIns.getDeploymentId());
			e.setHisActInsActName(hisprocIns.getName());
			e.setProcInsId(hisprocIns.getId());
			e.setHisProcInsId(hisprocIns.getId());
			if(hisprocIns.getEndActivityId()!=null) {
				e.setProcessIsFinished("finished");
			}else {
				e.setProcessIsFinished("unfinished");
			}
			e.setStatus("finish");
			actList.add(e);
		}
		page.setList(actList);
		return page;
	}
	
	
	/**
	 * 获取已办任务
	 * @param page
	 * @param procDefKey 流程定义标识
	 * @return
	 */
	public Page<Flow> historicList(Page<Flow> page, Flow act){
		String userId = UserUtils.getUser().getLoginName();//ObjectUtils.toString(UserUtils.getUser().getId());

		HistoricTaskInstanceQuery histTaskQuery = historyService.createHistoricTaskInstanceQuery().taskAssignee(userId).finished()
				.includeProcessVariables().orderByHistoricTaskInstanceEndTime().desc();
		
		// 设置查询条件
		if (StringUtils.isNotBlank(act.getProcDefKey())){
			histTaskQuery.processDefinitionKey(act.getProcDefKey());
		}
		if (act.getBeginDate() != null){
			histTaskQuery.taskCompletedAfter(act.getBeginDate());
		}
		if (act.getEndDate() != null){
			histTaskQuery.taskCompletedBefore(act.getEndDate());
		}
		
		// 查询总数
		page.setCount(histTaskQuery.count());
		
		// 查询列表
		List<HistoricTaskInstance> histList = histTaskQuery.listPage(page.getFirstResult(), page.getMaxResults());
		//处理分页问题
		List<Flow> actList=Lists.newArrayList();
		for (HistoricTaskInstance histTask : histList) {
			Flow e = new Flow();
			e.setTaskId(histTask.getId());
			e.setTaskDefKey(histTask.getTaskDefinitionKey());
			e.setTaskName(histTask.getName());
			e.setAssignee(histTask.getAssignee());
			e.setCreateTime(histTask.getCreateTime());
			e.setExecutionId(histTask.getExecutionId());
			e.setHisTaskEndTime(histTask.getEndTime());
			e.setVars(histTask.getProcessVariables());
			
			ProcessDefinition pd = ProcessDefCache.get(histTask.getProcessDefinitionId());
			e.setProcDefId(pd.getId());
			e.setProcDefname(pd.getName());
			e.setProcDefKey(pd.getKey());
			e.setProcDefversion(pd.getVersion());
			
			e.setProcInsId(histTask.getProcessInstanceId());
			e.setHisProcInsId(histTask.getProcessInstanceId());
			if(getHistoryProcIns(histTask.getProcessInstanceId()).getEndActivityId()!=null) {
				e.setProcessIsFinished("finished");
			}else {
				e.setProcessIsFinished("unfinished");
			}
			e.setStatus("finish");
			actList.add(e);
			//page.getList().add(e);
		}
		page.setList(actList);
		return page;
	}
	
	/**
	 * 获取流转历史列表
	 * @param procInsId 流程实例
	 * @param startAct 开始活动节点名称
	 * @param endAct 结束活动节点名称
	 */
	public List<Flow> histoicFlowList(String procInsId, String startAct, String endAct){
		List<Flow> actList = Lists.newArrayList();
		List<HistoricActivityInstance> list = historyService.createHistoricActivityInstanceQuery().processInstanceId(procInsId)
				.orderByHistoricActivityInstanceStartTime().asc().orderByHistoricActivityInstanceEndTime().asc().list();
		
		boolean start = false;
		Map<String, Integer> actMap = Maps.newHashMap();
		
		for (int i=0; i<list.size(); i++){
			
			HistoricActivityInstance histIns = list.get(i);
			
			// 过滤开始节点前的节点
			if (StringUtils.isNotBlank(startAct) && startAct.equals(histIns.getActivityId())){
				start = true;
			}
			if (StringUtils.isNotBlank(startAct) && !start){
				continue;
			}
			
			// 只显示开始节点和结束节点，并且执行人不为空的任务
			if (StringUtils.isNotBlank(histIns.getAssignee())
					 || "startEvent".equals(histIns.getActivityType())
					 || "endEvent".equals(histIns.getActivityType())){
				
				// 给节点增加一个序号
				Integer actNum = actMap.get(histIns.getActivityId());
				if (actNum == null){
					actMap.put(histIns.getActivityId(), actMap.size());
				}
				
				Flow e = new Flow();
//				e.setHistIns(histIns);
				e.setHisActInsActName(histIns.getActivityName());
				e.setCreateTime(histIns.getStartTime());
				e.setEndTime(histIns.getEndTime());
				e.setHisActInsDuTime(histIns.getDurationInMillis());
				// 获取流程发起人名称
				if ("startEvent".equals(histIns.getActivityType())){
					List<HistoricProcessInstance> il = historyService.createHistoricProcessInstanceQuery().processInstanceId(procInsId).orderByProcessInstanceStartTime().asc().list();
//					List<HistoricIdentityLink> il = historyService.getHistoricIdentityLinksForProcessInstance(procInsId);
					if (il.size() > 0){
						if (StringUtils.isNotBlank(il.get(0).getStartUserId())){
							User user = UserUtils.getByLoginName(il.get(0).getStartUserId());
							if (user != null){
								e.setAssignee(histIns.getAssignee());
								e.setAssigneeName(user.getName());
							}
						}
					}
				}
				// 获取任务执行人名称
				if (StringUtils.isNotEmpty(histIns.getAssignee())){
					User user = UserUtils.getByLoginName(histIns.getAssignee());
					if (user != null){
						e.setAssignee(histIns.getAssignee());
						e.setAssigneeName(user.getName());
					}
				}
				// 获取意见评论内容
				if (StringUtils.isNotBlank(histIns.getTaskId())){
					List<Comment> commentList = taskService.getTaskComments(histIns.getTaskId());
					if (commentList.size()>0){
						e.setComment(commentList.get(0).getFullMessage());
					}
				}
				actList.add(e);
			}
			
			// 过滤结束节点后的节点
			if (StringUtils.isNotBlank(endAct) && endAct.equals(histIns.getActivityId())){
				boolean bl = false;
				Integer actNum = actMap.get(histIns.getActivityId());
				// 该活动节点，后续节点是否在结束节点之前，在后续节点中是否存在
				for (int j=i+1; j<list.size(); j++){
					HistoricActivityInstance hi = list.get(j);
					Integer actNumA = actMap.get(hi.getActivityId());
					if ((actNumA != null && actNumA < actNum) || StringUtils.equals(hi.getActivityId(), histIns.getActivityId())){
						bl = true;
					}
				}
				if (!bl){
					break;
				}
			}
		}
		return actList;
	}

	/**
	 * 获取流程表单（首先获取任务节点表单KEY，如果没有则取流程开始节点表单KEY）
	 * @return
	 */
	public String getFormKey(String procDefId, String taskDefKey){
		String formKey = "";
		if (StringUtils.isNotBlank(procDefId)){
			if (StringUtils.isNotBlank(taskDefKey)){
				try{
					formKey = formService.getTaskFormKey(procDefId, taskDefKey);
				}catch (Exception e) {
					formKey = "";
				}
			}
			if (StringUtils.isBlank(formKey)){
				formKey = formService.getStartFormKey(procDefId);
			}
			if (StringUtils.isBlank(formKey)){
				formKey = "/404";
			}
		}
		logger.debug("getFormKey: {}", formKey);
		return formKey;
	}
	
	/**
	 * 获取流程实例对象
	 * @param procInsId
	 * @return
	 */
	@Transactional(readOnly = false)
	public ProcessInstance getProcIns(String procInsId) {
		return runtimeService.createProcessInstanceQuery().processInstanceId(procInsId).singleResult();
	}
	
	/**
	 * 获取历史流程实例对象
	 * @param procInsId
	 * @return
	 */
	@Transactional(readOnly = false)
	public HistoricProcessInstance getHistoryProcIns(String procInsId) {
		return historyService.createHistoricProcessInstanceQuery().processInstanceId(procInsId).singleResult();
	}

	/**
	 * 启动流程
	 * @param procDefKey 流程定义KEY
	 * @param businessTable 业务表表名
	 * @param businessId	业务表编号
	 * @return 流程实例ID
	 */
	@Transactional(readOnly = false)
	public String startProcess(String procDefKey, String businessTable, String businessId) {
		return startProcess(procDefKey, businessTable, businessId, null);
	}
	
	/**
	 * 启动流程
	 * @param procDefKey 流程定义KEY
	 * @param businessTable 业务表表名
	 * @param businessId	业务表编号
	 * @param title			流程标题，显示在待办任务标题
	 * @param vars			流程变量
	 * @return 流程实例ID
	 */
	@Transactional(readOnly = false)
	public String startProcess(String procDefKey, String businessTable, String businessId, Map<String, Object> vars) {
		String userId = UserUtils.getUser().getLoginName();//ObjectUtils.toString(UserUtils.getUser().getId())
		
		// 用来设置启动流程的人员ID，引擎会自动把用户ID保存到activiti:initiator中
		identityService.setAuthenticatedUserId(userId);
		
		// 设置流程变量
		if (vars == null){
			vars = Maps.newHashMap();
		}
		
		// 设置流程标题
//		if (StringUtils.isNotBlank(title)){
//			vars.put("title", title);
//		}
		
		// 启动流程
		ProcessInstance procIns = runtimeService.startProcessInstanceByKey(procDefKey, businessTable+":"+businessId, vars);
		
		// 更新业务表流程实例ID
		Flow act = new Flow();
		act.setBusinessTable(businessTable);// 业务表名
		act.setBusinessId(businessId);	// 业务表ID
		act.setProcInsId(procIns.getId());
		actDao.updateProcInsIdByBusinessId(act);
		return act.getProcInsId();
	}

	/**
	 * 获取任务
	 * @param taskId 任务ID
	 */
	public Task getTask(String taskId){
		return taskService.createTaskQuery().taskId(taskId).singleResult();
	}
	
	/**
	 * 获取历史任务
	 * @param procInsId 流程实例ID
	 */
	public HistoricTaskInstance getHistoryTask(String procInsId){
		return historyService.createHistoricTaskInstanceQuery().processInstanceId(procInsId).orderByHistoricTaskInstanceEndTime().desc().list().get(0);
	}
	
	/**
	 * 删除任务
	 * @param taskId 任务ID
	 * @param deleteReason 删除原因
	 */
	@Transactional(readOnly = false)
	public void deleteTask(String taskId, String deleteReason){
		taskService.deleteTask(taskId, deleteReason);
	}
	
	/**
	 * 签收任务
	 * @param taskId 任务ID
	 * @param userId 签收用户ID（用户登录名）
	 */
	@Transactional(readOnly = false)
	public void claim(String taskId, String userId){
		taskService.claim(taskId, userId);
	}
	
	/**
	 * 提交任务, 并保存意见
	 * @param taskId 任务ID
	 * @param procInsId 流程实例ID，如果为空，则不保存任务提交意见
	 * @param comment 任务提交意见的内容
	 * @param vars 任务变量
	 */
	@Transactional(readOnly = false)
	public void complete(String taskId, String procInsId, String comment, Map<String, Object> vars){
		complete(taskId, procInsId, comment, "", vars);
	}
	
	/**
	 * 提交任务, 并保存意见
	 * @param taskId 任务ID
	 * @param procInsId 流程实例ID，如果为空，则不保存任务提交意见
	 * @param comment 任务提交意见的内容
	 * @param title			流程标题，显示在待办任务标题
	 * @param vars 任务变量
	 */
	@Transactional(readOnly = false)
	public void complete(String taskId, String procInsId, String comment, String title, Map<String, Object> vars){
		// 添加意见
		if (StringUtils.isNotBlank(procInsId) && StringUtils.isNotBlank(comment)){
			taskService.addComment(taskId, procInsId, comment);
		}
		
		// 设置流程变量
		if (vars == null){
			vars = Maps.newHashMap();
		}
		
		// 设置流程标题
		if (StringUtils.isNotBlank(title)){
			vars.put("title", title);
		}
		
		// 提交任务
		taskService.complete(taskId, vars);
	}

	/**
	 * 完成第一个任务
	 * @param procInsId
	 */
	@Transactional(readOnly = false)
	public void completeFirstTask(String procInsId){
		completeFirstTask(procInsId, null, null, null);
	}
	
	/**
	 * 完成第一个任务
	 * @param procInsId
	 * @param comment
	 * @param title
	 * @param vars
	 */
	@Transactional(readOnly = false)
	public void completeFirstTask(String procInsId, String comment, String title, Map<String, Object> vars){
		String userId = UserUtils.getUser().getLoginName();
		Task task = taskService.createTaskQuery().taskAssignee(userId).processInstanceId(procInsId).active().singleResult();
		if (task != null){
			complete(task.getId(), procInsId, comment, title, vars);
		}
	}

//	/**
//	 * 委派任务
//	 * @param taskId 任务ID
//	 * @param userId 被委派人
//	 */
//	public void delegateTask(String taskId, String userId){
//		taskService.delegateTask(taskId, userId);
//	}
//	
//	/**
//	 * 被委派人完成任务
//	 * @param taskId 任务ID
//	 */
//	public void resolveTask(String taskId){
//		taskService.resolveTask(taskId);
//	}
//	
	
	/**
	 * 添加任务意见
	 */
	public void addTaskComment(String taskId, String procInsId, String comment){
		taskService.addComment(taskId, procInsId, comment);
	}
	
	
//	/**
//	 * 读取带跟踪的图片
//	 * @param executionId	环节ID
//	 * @return	封装了各种节点信息
//	 */
//	public InputStream tracePhoto(String processDefinitionId, String executionId) {
////		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(executionId).singleResult();
//		BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);
//
//		List<String> activeActivityIds = Lists.newArrayList();
//		if (runtimeService.createExecutionQuery().executionId(executionId).count() > 0){
//			activeActivityIds = runtimeService.getActiveActivityIds(executionId);
//		}
//
//		// 不使用spring请使用下面的两行代码
//		// ProcessEngineImpl defaultProcessEngine = (ProcessEngineImpl)ProcessEngines.getDefaultProcessEngine();
//		// Context.setProcessEngineConfiguration(defaultProcessEngine.getProcessEngineConfiguration());
//
//		// 使用spring注入引擎请使用下面的这行代码
////		Context.setProcessEngineConfiguration(processEngineFactory.getProcessEngineConfiguration());
////		return ProcessDiagramGenerator.generateDiagram(bpmnModel, "png", activeActivityIds);
//		return processEngine.getProcessEngineConfiguration().getProcessDiagramGenerator()
//				.generateDiagram(bpmnModel, "png", activeActivityIds);
//	}
	
	/**
	 * 流程跟踪图信息
	 * @param processInstanceId		流程实例ID
	 * @return	封装了各种节点信息
	 */
	public List<Map<String, Object>> traceProcess(String processInstanceId) throws Exception {
		Execution execution = runtimeService.createExecutionQuery().executionId(processInstanceId).singleResult();//执行实例
		Object property = PropertyUtils.getProperty(execution, "activityId");
		String activityId = "";
		if (property != null) {
			activityId = property.toString();
		}
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId)
				.singleResult();
		ProcessDefinitionEntity processDefinition = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService)
				.getDeployedProcessDefinition(processInstance.getProcessDefinitionId());
//		List<ActivityImpl> activitiList = processDefinition.getActivities();//获得当前任务的所有节点

		List<Map<String, Object>> activityInfos = new ArrayList<Map<String, Object>>();
//		for (ActivityImpl activity : activitiList) {
//
//			boolean currentActiviti = false;
//			String id = activity.getId();
//
//			// 当前节点
//			if (id.equals(activityId)) {
//				currentActiviti = true;
//			}
//
//			Map<String, Object> activityImageInfo = packageSingleActivitiInfo(activity, processInstance, currentActiviti);
//
//			activityInfos.add(activityImageInfo);
//		}

		return activityInfos;
	}
	


	/**
	 * 设置任务组
	 * @param vars
	 * @param candidateGroupIdExpressions
	 */
	private void setTaskGroup(Map<String, Object> vars, Set<Expression> candidateGroupIdExpressions) {
		String roles = "";
		for (Expression expression : candidateGroupIdExpressions) {
			String expressionText = expression.getExpressionText();
			String roleName = identityService.createGroupQuery().groupId(expressionText).singleResult().getName();
			roles += roleName;
		}
		vars.put("任务所属角色", roles);
	}


	/**
	 * 获取当前节点信息
	 * @param processInstance
	 * @return
	 */
	private Task getCurrentTaskInfo(ProcessInstance processInstance) {
		Task currentTask = null;
		try {
			String activitiId = (String) PropertyUtils.getProperty(processInstance, "activityId");
			logger.debug("current activity id: {}", activitiId);

			currentTask = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskDefinitionKey(activitiId)
					.singleResult();
			logger.debug("current task for processInstance: {}", ToStringBuilder.reflectionToString(currentTask));

		} catch (Exception e) {
			logger.error("can not get property activityId from processInstance: {}", processInstance);
		}
		return currentTask;
	}
	
}
