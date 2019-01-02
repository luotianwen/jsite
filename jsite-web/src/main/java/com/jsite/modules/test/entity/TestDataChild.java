/**
 * Copyright &copy; 2017-2019 <a href="https://gitee.com/baseweb/JSite">JSite</a> All rights reserved.
 */
package com.jsite.modules.test.entity;

import org.hibernate.validator.constraints.Length;

import com.jsite.common.persistence.DataEntity;

/**
 * 主子表生成测试Entity
 * @author liuruijun
 * @version 2019-01-02
 */
public class TestDataChild extends DataEntity<TestDataChild> {
	
	private static final long serialVersionUID = 1L;
	private String testDataMainId;		// 业务主表ID 父类
	private String name;		// 名称
	
	public TestDataChild() {
		super();
	}

	public TestDataChild(String id){
		super(id);
	}

	public TestDataChild(TestDataMain testDataMainId){
		this.testDataMainId = testDataMainId.getId();
	}

	@Length(min=0, max=64, message="业务主表ID长度必须介于 0 和 64 之间")
	public String getTestDataMainId() {
		return testDataMainId;
	}

	public void setTestDataMainId(TestDataMain testDataMainId) {
		this.testDataMainId = testDataMainId.getId();
	}
	
	@Length(min=0, max=100, message="名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}