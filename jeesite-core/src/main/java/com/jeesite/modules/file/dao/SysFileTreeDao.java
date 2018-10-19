package com.jeesite.modules.file.dao;

import com.jeesite.common.persistence.CrudDao;
import com.jeesite.common.persistence.annotation.MyBatisDao;
import com.jeesite.modules.file.entity.SysFileTree;

import java.util.List;

/**
 * 文件分类DAO接口
 * @author liulin
 * @version 2018-03-28
 */
@MyBatisDao
public interface SysFileTreeDao extends CrudDao<SysFileTree> {
	List<SysFileTree> selectChildrenByParentId(String parentId);
}