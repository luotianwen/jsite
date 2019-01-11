package com.jsite.modules.sys.web;


import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.persistence.Page;
import com.jsite.common.web.BaseController;
import com.jsite.modules.sys.entity.JobAndTrigger;
import com.jsite.modules.sys.service.JobAndTriggerService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping(value = "${adminPath}/sys/job")
public class JobController extends BaseController {
	@Autowired
	private JobAndTriggerService jobAndTriggerService;


	@ModelAttribute
	public JobAndTrigger get(@RequestParam(required=false) String jobName,@RequestParam(required=false) String jobClassName) {
		if (StringUtils.isNotBlank(jobName)&&StringUtils.isNotBlank(jobClassName)){
			return jobAndTriggerService.getJobAndTriggerByJobName(jobName);
		}else{
			return new JobAndTrigger();
		}
	}

	//job列表页面
	@RequiresPermissions("sys:job:view")
	@RequestMapping(value = {"list", ""})
	public String list() {
		return "modules/sys/jobList";
	}

	@RequiresPermissions("sys:job:view")
	@RequestMapping(value = "listAll")
	@ResponseBody
	public Page<JobAndTrigger> listAll(JobAndTrigger jobAndTrigger, HttpServletRequest request, HttpServletResponse response) {
		Page<JobAndTrigger> page = jobAndTriggerService.findJobAndTrigger(new Page<JobAndTrigger>(request, response),jobAndTrigger);
		return page;
	}

	@RequiresPermissions("sys:job:view")
	@RequestMapping(value = "form")
	public String form(JobAndTrigger jobAndTrigger,Model model) {
		model.addAttribute("jobAndTrigger",jobAndTrigger);
		return "modules/sys/jobForm";
	}

	@RequiresPermissions("sys:job:edit")
	@RequestMapping(value = "resetform")
	public String resetform(JobAndTrigger jobAndTrigger,Model model) {
		model.addAttribute("jobAndTrigger",jobAndTrigger);
		return "modules/sys/jobResetForm";
	}

	/**
	 * @Title: addJob
	 * @Description: TODO(添加Job)
	 * @param jobClassName
	 *            类名
	 * @param jobGroupName
	 *            组名
	 * @param cronExpression
	 *            表达式，如：0/5 * * * * ? (每隔5秒)
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@RequiresPermissions("sys:job:add")
	@ResponseBody
	public String addJob(
			@RequestParam(value = "jobClassName") String jobClassName,
			@RequestParam(value = "jobGroupName") String jobGroupName,
			@RequestParam(value = "cronExpression") String cronExpression,
			HttpServletResponse response){
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}
		try {
			jobAndTriggerService.addJob(jobClassName, jobGroupName, cronExpression);
			return renderResult(Global.TRUE,"添加定时任务成功!");
		} catch (Exception e) {
			e.printStackTrace();
			return renderResult(Global.FALSE,"添加定时任务失败!");
		}
	}

	/**
	 * @Title: pauseJob
	 * @Description: TODO(暂停Job)
	 * @param jobClassName
	 *            类名
	 * @param jobGroupName
	 *            组名
	 */
	@RequestMapping(value = "/pause", method = RequestMethod.POST)
	@RequiresPermissions("sys:job:pause")
	@ResponseBody
	public String  pauseJob(
			@RequestParam(value = "jobClassName") String jobClassName,
			@RequestParam(value = "jobGroupName") String jobGroupName,
			HttpServletResponse response) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}
		try {
			jobAndTriggerService.pauseJob(jobClassName, jobGroupName);
			return renderResult(Global.TRUE,"暂停定时任务成功!");
		} catch (Exception e) {
			e.printStackTrace();
			return renderResult(Global.FALSE,"暂停定时任务失败!");
		}
	}

	/**
	 * @Title: resumeJob
	 * @Description: TODO(恢复Job)
	 * @param jobClassName
	 *            类名
	 * @param jobGroupName
	 *            组名
	 */
	@RequestMapping(value = "/resume", method = RequestMethod.POST)
	@RequiresPermissions("sys:job:resume")
	@ResponseBody
	public String resumeJob(
			@RequestParam(value = "jobClassName") String jobClassName,
			@RequestParam(value = "jobGroupName") String jobGroupName,
			HttpServletResponse response) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}
		try {
			jobAndTriggerService.resumejob(jobClassName, jobGroupName);
			return renderResult(Global.TRUE,"恢复定时任务成功!");
		} catch (Exception e) {
			e.printStackTrace();
			return renderResult(Global.FALSE,"恢复定时任务失败!");
		}
	}

	/**
	 * @Title: rescheduleJob
	 * @Description: TODO(重新设置Job)
	 * @param jobClassName
	 *            类名
	 * @param jobGroupName
	 *            组名
	 * @param cronExpression
	 *            表达式
	 */
	@RequestMapping(value = "/reschedule", method = RequestMethod.POST)
	@RequiresPermissions("sys:job:edit")
	@ResponseBody
	public String rescheduleJob(
			@RequestParam(value = "jobClassName") String jobClassName,
			@RequestParam(value = "jobGroupName") String jobGroupName,
			@RequestParam(value = "cronExpression") String cronExpression,
			HttpServletResponse response) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}
		try {
			jobAndTriggerService.updateJob(jobClassName, jobGroupName, cronExpression);
			return renderResult(Global.TRUE,"重新设置定时任务成功!");
		} catch (Exception e) {
			e.printStackTrace();
			return renderResult(Global.FALSE,"重新设置定时任务失败!");
		}
	}

	/**
	 * @Title: deleteJob
	 * @Description: TODO(删除Job)
	 * @param jobClassName
	 *            类名
	 * @param jobGroupName
	 *            组名
	 */
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@RequiresPermissions("sys:job:del")
	@ResponseBody
	public String deleteJob(@RequestParam(value = "jobClassName") String jobClassName,
							@RequestParam(value = "jobGroupName") String jobGroupName,
                             HttpServletResponse response) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}
		try {
			jobAndTriggerService.deleteJob(jobClassName, jobGroupName);
			return renderResult(Global.TRUE,"删除定时任务成功!");
		} catch (Exception e) {
			e.printStackTrace();
			return renderResult(Global.FALSE,"删除定时任务失败!");
		}
	}


}
