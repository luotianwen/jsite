package com.jsite.modules.file.entity;


import com.jsite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/**
 * 文件分类Entity
 * @author liulin
 * @version 2018-03-28
 */
public class SysFileTree extends DataEntity<SysFileTree> {
	
	private static final long serialVersionUID = 1L;
	private String parentIds;		// 所有父级编号
	private String name;		// 名称
	private Integer sort;		// 排序
	private String treeLeaf;      // 是否树形叶子
	private Integer treeLevel; // 树形层级
	
	private Boolean isRoot;			//是否是根节点
	private Boolean isTreeLeaf;		//是否是叶子节点
	
	private String parentId;  //父级编号
	private String parentName; //父级名称
	
	public SysFileTree() {
		super();
	}

	public SysFileTree(String id){
		super(id);
	}

	@Length(min=1, max=2000, message="所有父级编号长度必须介于 1 和 2000 之间")
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	@Length(min=1, max=100, message="名称长度必须介于 1 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@NotNull(message="排序不能为空")
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getTreeLeaf() {
		return treeLeaf;
	}

	public void setTreeLeaf(String treeLeaf) {
		this.treeLeaf = treeLeaf;
	}

	public Integer getTreeLevel() {
		return treeLevel;
	}

	public void setTreeLevel(Integer treeLevel) {
		this.treeLevel = treeLevel;
	}

	public boolean getIsRoot()
	{
		return "0".equals(getParentId());
	}

	public Boolean getIsTreeLeaf()
    {
     return Boolean.valueOf("1".equals(treeLeaf));
   }
	
}