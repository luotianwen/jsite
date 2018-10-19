package com.jeesite.modules.flowable.dao;

import com.jeesite.common.persistence.CrudDao;
import com.jeesite.common.persistence.annotation.MyBatisDao;
import com.jeesite.modules.flowable.entity.DeModel;

/**
 * 流出模型DAO接口
 * @author liuruijun
 * @version 2018-08-02
 */
@MyBatisDao
public interface DeModelDao extends CrudDao<DeModel> {

}
