/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jsite.modules.sys.dao;

import com.jsite.common.persistence.CrudDao;
import com.jsite.common.persistence.annotation.MyBatisDao;
import com.jsite.modules.sys.entity.Area;

/**
 * 区域DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface AreaDao extends CrudDao<Area> {
	
}
