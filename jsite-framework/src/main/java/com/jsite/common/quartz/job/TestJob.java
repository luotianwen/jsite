package com.jsite.common.quartz.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;


public class TestJob implements BaseJob {

    private static Logger _log = LoggerFactory.getLogger(TestJob.class);

    public TestJob() {
          
    }  


    public void execute(JobExecutionContext context)  
        throws JobExecutionException {  
        _log.error("Test Job执行时间: " + new Date());
        System.err.println("Test Job执行时间: " + new Date());
    }  
}  
