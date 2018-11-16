package com.jsite.modules.file.dao;

import com.jsite.common.persistence.CrudDao;
import com.jsite.common.persistence.annotation.MyBatisDao;
import com.jsite.modules.file.entity.SysFile;

/**
 * 文件管理DAO接口
 * @author liulin
 * @version 2018-03-28
 */
@MyBatisDao
public interface SysFileDao extends CrudDao<SysFile> {
	
}