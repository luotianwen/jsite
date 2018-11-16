package com.jsite.modules.cms.service;

import com.jsite.common.service.CrudService;
import com.jsite.modules.cms.dao.ArticleDataDao;
import com.jsite.modules.cms.entity.ArticleData;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 站点Service
 * @author JSite
 * @version 2013-01-15
 */
@Service
@Transactional(readOnly = true)
public class ArticleDataService extends CrudService<ArticleDataDao, ArticleData> {

}
