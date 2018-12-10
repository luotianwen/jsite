package com.jsite.common.persistence;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.jsite.modules.flowable.entity.Flow;

import java.io.Serializable;

/**
 * Activiti Entity类
 ** @author liuruijun
 * @version 2017-05-28
 */
public abstract class ActEntity<T> extends DataEntity<T> implements Serializable {

	private static final long serialVersionUID = 1L;

	protected Flow flow; 		// 流程任务对象

	public ActEntity() {
		super();
	}
	
	public ActEntity(String id) {
		super(id);
	}
	
	@JsonIgnore
	public Flow getAct() {
		if (flow == null){
			flow = new Flow();
		}
		return flow;
	}

	public void setAct(Flow flow) {
		this.flow = flow;
	}

	/**
	 * 获取流程实例ID
	 * @return
	 */
	public String getProcInsId() {
		return this.getAct().getProcInsId();
	}

	/**
	 * 设置流程实例ID
	 * @param procInsId
	 */
	public void setProcInsId(String procInsId) {
		this.getAct().setProcInsId(procInsId);
	}
}
