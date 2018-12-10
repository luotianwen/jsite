package com.jsite.modules.cms.dao;

import com.jsite.common.persistence.CrudDao;
import com.jsite.common.persistence.annotation.MyBatisDao;
import com.jsite.modules.cms.entity.Site;

/**
 * 站点DAO接口
 ** @author liuruijun
 * @version 2017-8-23
 */
@MyBatisDao
public interface SiteDao extends CrudDao<Site> {

}
