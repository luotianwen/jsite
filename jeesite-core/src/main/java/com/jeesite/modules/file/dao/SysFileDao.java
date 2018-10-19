package com.jeesite.modules.file.dao;

import com.jeesite.common.persistence.CrudDao;
import com.jeesite.common.persistence.annotation.MyBatisDao;
import com.jeesite.modules.file.entity.SysFile;

/**
 * 文件管理DAO接口
 * @author liulin
 * @version 2018-03-28
 */
@MyBatisDao
public interface SysFileDao extends CrudDao<SysFile> {
	
}