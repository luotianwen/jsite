package com.jsite.modules.business.dao;

import com.jsite.common.persistence.CrudDao;
import com.jsite.common.persistence.annotation.MyBatisDao;
import com.jsite.modules.business.entity.Leave;

/**
 * 请假DAO接口
 * @author liuruijun
 * @version 2018-8-23
 */
@MyBatisDao
public interface LeaveDao extends CrudDao<Leave> {
	
	int updateLeadText(Leave leave);
	
	int updateHRText(Leave leave);


}
