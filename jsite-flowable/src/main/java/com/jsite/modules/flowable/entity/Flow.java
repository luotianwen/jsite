package com.jsite.modules.flowable.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.persistence.BaseEntity;
import com.jsite.modules.flowable.utils.FlowableUtils;
import com.jsite.modules.flowable.utils.Variable;

import java.util.Date;
import java.util.Map;

/**
 * 工作流Entity
 * @author liuruijun
 * @version 2018-08-01
 */
public class Flow extends BaseEntity<Flow> {
	
	private static final long serialVersionUID = 1L;
	
	private String taskId; 		// 任务编号
	private String taskName; 	// 任务名称
	private String taskDefKey; 	// 任务定义Key（任务环节标识）
	private String assignee; // 任务执行人编号
	private String assigneeName; // 任务执行人名称
	
	private Date createTime;
	private Date endTime;
	
	private Date hisTaskEndTime; // 历史任务结束时间
	private String executionId;

	private String procInsId; 	// 流程实例ID
	private String hisProcInsId;//已办任务流程实例ID 查看流程图会用到
	private String processIsFinished ;//流程实例是否结束(true:结束，false:未结束)
	
	//ProcessDefinition
	private String procDefId; 	// 流程定义ID
	private String procDefKey;
	private String procDefname;
	private int procDefversion;
	private String proceDefDesc;
	private String proceDefDiagramResName;
	private String proceDefResName;
	
	// HistoricActivityInstance
	private String hisActInsActName;
	private String hisActInsDuTime; // 历史活动耗时
	// 开始时间、结束时间 字段公用上面的 createTime、endTime

	
	private String businessTable;	// 业务绑定Table
	private String businessId;		// 业务绑定ID

	private String status; 		// 任务状态（todo/claim/finish）

	private String comment; 	// 任务意见
	private String flag; 		// 意见状态

	private Variable vars; 		// 流程变量
//	private Variable taskVars; 	// 流程任务变量
	
	private Date beginDate;	// 开始查询日期
	private Date endDate;	// 结束查询日期
	
	public Flow() {
		super();
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getTaskDefKey() {
		return taskDefKey;
	}

	public void setTaskDefKey(String taskDefKey) {
		this.taskDefKey = taskDefKey;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public String getAssigneeName() {
		return assigneeName;
	}

	public void setAssigneeName(String assigneeName) {
		this.assigneeName = assigneeName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getHisTaskEndTime() {
		return hisTaskEndTime;
	}

	public void setHisTaskEndTime(Date hisTaskEndTime) {
		this.hisTaskEndTime = hisTaskEndTime;
	}

	public String getExecutionId() {
		return executionId;
	}

	public void setExecutionId(String executionId) {
		this.executionId = executionId;
	}

	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	public String getHisProcInsId() {
		return hisProcInsId;
	}

	public void setHisProcInsId(String hisProcInsId) {
		this.hisProcInsId = hisProcInsId;
	}

	public String getProcDefId() {
		return procDefId;
	}

	public void setProcDefId(String procDefId) {
		this.procDefId = procDefId;
	}

	public String getProcDefKey() {
		return procDefKey;
	}

	public void setProcDefKey(String procDefKey) {
		this.procDefKey = procDefKey;
	}

	public String getProcDefname() {
		return procDefname;
	}

	public void setProcDefname(String procDefname) {
		this.procDefname = procDefname;
	}

	public int getProcDefversion() {
		return procDefversion;
	}

	public void setProcDefversion(int procDefversion) {
		this.procDefversion = procDefversion;
	}

	public String getHisActInsActName() {
		return hisActInsActName;
	}

	public void setHisActInsActName(String hisActInsActName) {
		this.hisActInsActName = hisActInsActName;
	}

//	public String getHisActInsDuTime() {
//		return TimeUtils.toTimeString(hisActInsDuTime);
//	}
//
//	public void setHisActInsDuTime(Long hisActInsDuTime) {
//		this.hisActInsDuTime = hisActInsDuTime;
//	}

	public String getHisActInsDuTime() {
		return hisActInsDuTime;
	}

	public void setHisActInsDuTime(Long duTime) {
		if(duTime == null) {
			this.hisActInsDuTime = "";
		} else {
			hisActInsDuTime = FlowableUtils.toTimeString(duTime);
		}
	}

	public String getBusinessTable() {
		return businessTable;
	}

	public void setBusinessTable(String businessTable) {
		this.businessTable = businessTable;
	}

	public String getBusinessId() {
		return businessId;
	}

	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	public boolean isPass() {
		return flag==null?false:flag.equals("yes");
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	
	public Variable getVars() {
		return vars;
	}

	public void setVars(Variable vars) {
		this.vars = vars;
	}

	/**
	 * 通过Map设置流程变量值
	 * 
	 * @param map
	 */
	public void setVars(Map<String, Object> map) {
		this.vars = new Variable(map);
	}
	
	

//public Variable getTaskVars() {
//	return taskVars;
//}
//
//public void setTaskVars(Variable taskVars) {
//	this.taskVars = taskVars;
//}
//
///**
// * 通过Map设置流程任务变量值
// * @param map
// */
//public void setTaskVars(Map<String, Object> map) {
//	this.taskVars = new Variable(map);
//}

	public String getProceDefDesc() {
		return proceDefDesc;
	}

	public void setProceDefDesc(String proceDefDesc) {
		this.proceDefDesc = proceDefDesc;
	}

	public String getProceDefDiagramResName() {
		return proceDefDiagramResName;
	}

	public void setProceDefDiagramResName(String proceDefDiagramResName) {
		this.proceDefDiagramResName = proceDefDiagramResName;
	}

	public String getProceDefResName() {
		return proceDefResName;
	}

	public void setProceDefResName(String proceDefResName) {
		this.proceDefResName = proceDefResName;
	}

	/**
	 * 是否是一个待办任务
	 * 
	 * @return
	 */
	public boolean isTodoTask() {
		return "todo".equals(status) || "claim".equals(status);
	}

	/**
	 * 是否是已完成任务
	 * 
	 * @return
	 */
	public boolean isFinishTask() {
		return "finish".equals(status) || StringUtils.isBlank(taskId);
	}
	
	public String getProcessIsFinished() {
		return processIsFinished;
	}

	public void setProcessIsFinished(String processIsFinished) {
		this.processIsFinished = processIsFinished;
	}

	@Override
	public void preInsert() {
		// TODO Auto-generated method stub
		
	}

	

	@Override
	public void preUpdate() {
		// TODO Auto-generated method stub
		
	}
}


