package com.jsite.modules.sys.dao;

import com.jsite.common.persistence.CrudDao;
import com.jsite.common.persistence.annotation.MyBatisDao;
import com.jsite.modules.sys.entity.Office;

/**
 * 机构DAO接口
 ** @author liuruijun
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends CrudDao<Office> {
	
}
