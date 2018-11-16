package com.jsite.modules.cms.dao;

import com.jsite.common.persistence.CrudDao;
import com.jsite.common.persistence.annotation.MyBatisDao;
import com.jsite.modules.cms.entity.Guestbook;

/**
 * 留言DAO接口
 ** @author liuruijun
 * @version 2013-8-23
 */
@MyBatisDao
public interface GuestbookDao extends CrudDao<Guestbook> {

}
