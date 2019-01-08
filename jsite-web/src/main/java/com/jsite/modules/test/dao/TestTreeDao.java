package com.jsite.modules.test.dao;

import com.jsite.common.persistence.TreeDao;
import com.jsite.common.persistence.annotation.MyBatisDao;
import com.jsite.modules.test.entity.TestTree;

/**
 * 树结构表生成DAO接口
 * @author liuruijun
 * @version 2019-01-08
 */
@MyBatisDao
public interface TestTreeDao extends TreeDao<TestTree> {
	
}