package com.jsite.modules.gen.dao;

import com.jsite.common.persistence.CrudDao;
import com.jsite.common.persistence.annotation.MyBatisDao;
import com.jsite.modules.gen.entity.GenTemplate;

/**
 * 代码模板DAO接口
 * @author liuruijun
 * @version 2013-10-15
 */
@MyBatisDao
public interface GenTemplateDao extends CrudDao<GenTemplate> {
	
}
