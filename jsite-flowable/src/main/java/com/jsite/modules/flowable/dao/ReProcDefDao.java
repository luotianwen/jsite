package com.jsite.modules.flowable.dao;

import com.jsite.common.persistence.CrudDao;
import com.jsite.common.persistence.annotation.MyBatisDao;
import com.jsite.modules.flowable.entity.ReProcDef;

/**
 * 流程定义DAO接口
 * @author liuruijun
 * @version 2018-08-02
 */
@MyBatisDao
public interface ReProcDefDao extends CrudDao<ReProcDef> {

}
