package com.jsite.modules.flowable.dao;

import com.jsite.common.persistence.CrudDao;
import com.jsite.common.persistence.annotation.MyBatisDao;
import com.jsite.modules.flowable.entity.Flow;

/**
 * 审批DAO接口
 * @author liuruijun
 * @version 2018-08-02
 */
@MyBatisDao
public interface FlowDao extends CrudDao<Flow> {

	int updateProcInsIdByBusinessId(Flow act);
	
}
