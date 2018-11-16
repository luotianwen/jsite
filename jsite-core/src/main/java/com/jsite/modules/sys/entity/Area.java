package com.jsite.modules.sys.entity;

import com.jsite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

/**
 * 区域Entity
 ** @author liuruijun
 * @version 2013-05-15
 */
public class Area extends DataEntity<Area> {

	private static final long serialVersionUID = 1L;
//	private Area parent;	// 父级编号
	private String parentIds; // 所有父级编号
	private String code; 	// 区域编码
	private String name; 	// 区域名称
	private Integer sort;		// 排序
	private String type; 	// 区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）
	private String treeLeaf;      // 是否树形叶子
	private Integer treeLevel; // 树形层级
	
	private Boolean isRoot;			//是否是根节点
	private Boolean isTreeLeaf;		//是否是叶子节点
	
	private String parentId;  //父级编号
	private String parentName; //父级名称
	
	private String label;
	
	public Area(){
		super();
	}

	public Area(String id){
		super(id);
	}
	
	@Length(min=1, max=2000)
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	@Length(min=1, max=100)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Length(min=1, max=1)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Length(min=0, max=100)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
//
//	public String getParentId() {
//		return parent != null && parent.getId() != null ? parent.getId() : "0";
//	}
	
	public String getTreeLeaf() {
		return treeLeaf;
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

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
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
	
	@Override
	public String toString() {
		return name;
	}
}