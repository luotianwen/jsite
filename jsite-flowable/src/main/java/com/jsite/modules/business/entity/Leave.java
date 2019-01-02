package com.jsite.modules.business.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jsite.common.persistence.ActEntity;
import com.jsite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

public class Leave extends ActEntity<Leave> {
	
	private static final long serialVersionUID = 1L;
	private String reason; 	// 请假原因
	private String procInsId; // 流程实例编号
	private Date startTime;	// 请假开始日期
	private Date endTime;	// 请假结束日期
	private String leaveType;	// 假种

	private String deptLeadText;
	private String hrText;
	
	public Leave() {
		super();
	}

	public Leave(String id){
		super(id);
	}
	
	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}
	
	@Length(min=1, max=255)
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	
	public User getUser() {
		return createBy;
	}
	
	public void setUser(User user) {
		this.createBy = user;
	}

	public String getDeptLeadText() {
		return deptLeadText;
	}

	public void setDeptLeadText(String deptLeadText) {
		this.deptLeadText = deptLeadText;
	}

	public String getHrText() {
		return hrText;
	}

	public void setHrText(String hrText) {
		this.hrText = hrText;
	}
}


