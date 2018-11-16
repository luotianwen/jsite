package com.jsite.modules.flowable.dao;

import com.jsite.common.persistence.CrudDao;
import com.jsite.common.persistence.annotation.MyBatisDao;
import com.jsite.modules.flowable.entity.DeModel;

/**
 * 流出模型DAO接口
 * @author liuruijun
 * @version 2018-08-02
 */
@MyBatisDao
public interface DeModelDao extends CrudDao<DeModel> {

}
