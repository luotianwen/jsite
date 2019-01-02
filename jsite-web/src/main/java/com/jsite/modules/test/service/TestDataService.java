/**
 * Copyright &copy; 2017-2019 <a href="https://gitee.com/baseweb/JSite">JSite</a> All rights reserved.
 */
package com.jsite.modules.test.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jsite.common.persistence.Page;
import com.jsite.common.service.CrudService;
import com.jsite.modules.test.entity.TestData;
import com.jsite.modules.test.dao.TestDataDao;

/**
 * 单表生成测试Service
 * @author liuruijun
 * @version 2019-01-02
 */
@Service
@Transactional(readOnly = true)
public class TestDataService extends CrudService<TestDataDao, TestData> {

	public TestData get(String id) {
		return super.get(id);
	}
	
	public List<TestData> findList(TestData testData) {
		return super.findList(testData);
	}
	
	public Page<TestData> findPage(Page<TestData> page, TestData testData) {
		return super.findPage(page, testData);
	}
	
	@Transactional(readOnly = false)
	public void save(TestData testData) {
		super.save(testData);
	}
	
	@Transactional(readOnly = false)
	public void delete(TestData testData) {
		super.delete(testData);
	}
	
}