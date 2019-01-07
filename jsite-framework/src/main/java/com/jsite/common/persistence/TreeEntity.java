package com.jsite.common.persistence;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.utils.Reflections;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/**
 * 数据Entity类 基于jeesite1.x 重构
 * @author JSite
 * @version 2014-05-16
 */
public abstract class TreeEntity<T> extends DataEntity<T> {

	private static final long serialVersionUID = 1L;

	protected T parent;	// 父级编号
    protected String parentId;
	protected String parentIds; // 所有父级编号
	protected String name; 	// 机构名称
	protected Integer sort;		// 排序

    protected String treeLeaf;      // 是否树形叶子
    protected Integer treeLevel; // 树形层级

	public TreeEntity() {
		super();
		this.sort = 30;
	}
	
	public TreeEntity(String id) {
		super(id);
	}
	
	/**
	 * 父对象，只能通过子类实现，父类实现mybatis无法读取
	 * @return
	 */
	//@JsonBackReference
	@NotNull
	public abstract T getParent();

    public void setParentId(String parentId) {

	}

    /**
	 * 父对象，只能通过子类实现，父类实现mybatis无法读取
	 * @return
	 */
	public abstract void setParent(T parent);

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
	
	private String getParentId() {
		String id = null;
		if (parent != null){
			id = (String)Reflections.getFieldValue(parent, "id");
		}
		return StringUtils.isNotBlank(id) ? id : "0";
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

    @JsonIgnore
    public static String getRootId(){
        return "0";
    }
}
