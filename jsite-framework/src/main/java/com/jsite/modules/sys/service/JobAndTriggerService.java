package com.jsite.modules.sys.service;


import com.jsite.common.persistence.Page;
import com.jsite.common.quartz.job.BaseJob;
import com.jsite.modules.sys.dao.JobAndTriggerDao;
import com.jsite.modules.sys.entity.JobAndTrigger;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**/
@Service
public class JobAndTriggerService  {
	
	@Autowired
	private Scheduler scheduler;

	@Autowired
	private JobAndTriggerDao jobAndTriggerDao;


	public Page<JobAndTrigger> findJobAndTrigger(Page<JobAndTrigger> page, JobAndTrigger jobAndTrigger) {
		jobAndTrigger.setPage(page);
		List<JobAndTrigger> jobsList = jobAndTriggerDao.findList(jobAndTrigger);
		page.setList(jobsList);
		return page;
	}

	public JobAndTrigger getJobAndTriggerByJobName(String jobName) {
		return jobAndTriggerDao.getJobAndTriggerByJobName(jobName);
	}

	public void addJob(String jobClassName, String jobGroupName, String cronExpression) throws Exception {
		// 启动调度器
				scheduler.start();
				// 构建job信息
				JobDetail jobDetail = JobBuilder.newJob(getClass(jobClassName).getClass())
						.withIdentity(jobClassName, jobGroupName).build();

				// 表达式调度构建器(即任务执行的时间)
				CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(cronExpression);

				// 按新的cronExpression表达式构建一个新的trigger
				CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(jobClassName, jobGroupName)
						.withSchedule(scheduleBuilder).build();

				try {
					scheduler.scheduleJob(jobDetail, trigger);
					System.out.println("创建定时任务成功");

				} catch (SchedulerException e) {
					System.out.println("创建定时任务失败" + e);
					throw new Exception("创建定时任务失败");
				}
		
	}

	public void updateJob(String jobClassName, String jobGroupName, String cronExpression) throws Exception {
		try {
			TriggerKey triggerKey = TriggerKey.triggerKey(jobClassName, jobGroupName);
			// 表达式调度构建器
			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(cronExpression);

			CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);

			// 按新的cronExpression表达式重新构建trigger
			trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();

			// 按新的trigger重新设置job执行
			scheduler.rescheduleJob(triggerKey, trigger);
		} catch (SchedulerException e) {
			System.out.println("更新定时任务失败" + e);
			throw new Exception("更新定时任务失败");
		}
	}

	public void deleteJob(String jobClassName, String jobGroupName) throws Exception {
		scheduler.pauseTrigger(TriggerKey.triggerKey(jobClassName, jobGroupName));
		scheduler.unscheduleJob(TriggerKey.triggerKey(jobClassName, jobGroupName));
		scheduler.deleteJob(JobKey.jobKey(jobClassName, jobGroupName));
	}

	public void pauseJob(String jobClassName, String jobGroupName) throws Exception {
		scheduler.pauseJob(JobKey.jobKey(jobClassName, jobGroupName));
	}

	public void resumejob(String jobClassName, String jobGroupName) throws Exception {
		scheduler.resumeJob(JobKey.jobKey(jobClassName, jobGroupName));
	}
	
	public static BaseJob getClass(String classname) throws Exception {
		Class<?> class1 = Class.forName(classname);
		return (BaseJob) class1.newInstance();
	}
	
}