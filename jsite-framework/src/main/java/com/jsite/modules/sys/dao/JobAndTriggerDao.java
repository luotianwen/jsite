package com.jsite.modules.sys.dao;

import com.jsite.common.persistence.CrudDao;
import com.jsite.common.persistence.annotation.MyBatisDao;
import com.jsite.modules.sys.entity.JobAndTrigger;

import java.util.List;

/**
 * @author 13258
 * @description
 * @Create 2019-01-04-14:50
 */
@MyBatisDao
public interface JobAndTriggerDao extends CrudDao<JobAndTrigger>{

    List<JobAndTrigger> getJobAndTriggerDetails(JobAndTrigger jobAndTrigger);

    List<JobAndTrigger> findList(JobAndTrigger jobAndTrigger);

    JobAndTrigger getJobAndTriggerByJobName(String jobName);

}
