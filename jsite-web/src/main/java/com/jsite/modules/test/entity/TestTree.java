package com.jsite.modules.test.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import com.jsite.common.persistence.TreeEntity;

/**
 * 树结构表生成Entity
 * @author liuruijun
 * @version 2019-01-08
 */
public class TestTree extends TreeEntity<TestTree> {
	
	private static final long serialVersionUID = 1L;

	
	public TestTree() {
		super();
	}

	public TestTree(String id){
		super(id);
	}


	@Override
	public TestTree getParent() {
		return parent;
	}

    @Override
	public void setParent(TestTree parent) {
		this.parent = parent;
	}
}