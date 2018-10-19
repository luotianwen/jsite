package com.jeesite.modules.flowable.dao;

import com.jeesite.common.persistence.CrudDao;
import com.jeesite.common.persistence.annotation.MyBatisDao;
import com.jeesite.modules.flowable.entity.Flow;

/**
 * 审批DAO接口
 * @author liuruijun
 * @version 2018-08-02
 */
@MyBatisDao
public interface FlowDao extends CrudDao<Flow> {

	int updateProcInsIdByBusinessId(Flow act);
	
}
