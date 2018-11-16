package com.jsite.modules.flowable.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jsite.common.persistence.DataEntity;
import com.jsite.modules.sys.utils.DictUtils;
import org.flowable.engine.impl.persistence.entity.ProcessDefinitionEntityImpl;

import java.util.Date;

/**
 * 流程定义Entity
 * @author liuruijun
 * @version 2018-08-02
 */
public class ReProcDef extends DataEntity<ReProcDef> {
	
	private static final long serialVersionUID = 1L;

	protected String name;
    protected String key;
    protected String category;
    protected String categoryName;
    protected int version;
    protected String deploymentId;
    protected String resourceName;
    protected String diagramResourceName;
    protected int suspensionState;
    
    protected Date deploymentTime;
    
	public ReProcDef() {
		
	}
	
	public ReProcDef(ProcessDefinitionEntityImpl procDef) {
		this.id = procDef.getId();
		this.name = procDef.getName();
		this.key = procDef.getKey();
		this.category = procDef.getCategory();
		this.categoryName = DictUtils.getDictLabel(category, "act_category", "无分类");
		this.version = procDef.getVersion();
		this.deploymentId = procDef.getDeploymentId();
		this.resourceName = procDef.getResourceName();
		this.diagramResourceName = procDef.getDiagramResourceName();
		this.suspensionState = procDef.getSuspensionState();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getDeploymentId() {
		return deploymentId;
	}

	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String getDiagramResourceName() {
		return diagramResourceName;
	}

	public void setDiagramResourceName(String diagramResourceName) {
		this.diagramResourceName = diagramResourceName;
	}
	
	public int getSuspensionState() {
		return suspensionState;
	}

	public void setSuspensionState(int suspensionState) {
		this.suspensionState = suspensionState;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDeploymentTime() {
		return deploymentTime;
	}

	public void setDeploymentTime(Date deploymentTime) {
		this.deploymentTime = deploymentTime;
	}
}


