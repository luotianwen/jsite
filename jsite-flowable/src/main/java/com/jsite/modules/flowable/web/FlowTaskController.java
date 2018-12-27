package com.jsite.modules.flowable.web;

import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.persistence.Page;
import com.jsite.common.web.BaseController;
import com.jsite.modules.flowable.entity.Flow;
import com.jsite.modules.flowable.entity.ReProcDef;
import com.jsite.modules.flowable.service.FlowTaskService;
import com.jsite.modules.flowable.service.ReProcDefService;
import com.jsite.modules.flowable.utils.FlowableUtils;
import com.jsite.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 流程个人任务相关Controller
 ** @author liuruijun
 * @version 2017-11-03
 */
@Controller
@RequestMapping(value = "${adminPath}/act/task")
public class FlowTaskController extends BaseController {

	@Autowired
	private FlowTaskService actTaskService;
	
	@Autowired
	private ReProcDefService reProcDefService;
	/**
	 * 获取待办列表
	 * @return
	 */
	@RequestMapping(value = {"todo", ""})
	public String todoList(Flow act, HttpServletResponse response, Model model) {
		if (UserUtils.getPrincipal().isMobileLogin()){
			Page<Flow> list = actTaskService.todoList(act);
			model.addAttribute("list", list);
			return renderString(response, list);
		}
		return "modules/flow/flowTaskTodoList";
	}
	
	@ResponseBody
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = {"todoData"})
	public Page<Flow> todoData(Flow act) {
		Page<Flow> list = actTaskService.todoList(act);

		return list;
	}
	
	@RequestMapping(value="diagramViewer")
	public String diagramViewer(String definitionId, String instanceId, String hisInsId, Model model) {
		
		model.addAttribute("definitionId", StringUtils.isBlank(definitionId)?"":definitionId);
		model.addAttribute("instanceId", StringUtils.isBlank(instanceId)?"":instanceId);
		model.addAttribute("hisInsId", StringUtils.isBlank(hisInsId)?"":hisInsId);
		
		return "modules/flow/flowDiagramViewer";
	}
	
	/**
	 * 获取已办任务
	 * @return
	 */
	@RequestMapping(value = "historic")
	public String historicList() {
		return "modules/flow/flowTaskHistoricList";
	}
	
	@ResponseBody
	@RequestMapping(value = "historicData")
	public Page<Flow> historicDataList(Flow act, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		Page<Flow> page = new Page<>(request, response);
		page = actTaskService.historicList(page, act);
		return page;
	}
	
	
	/**
	 * 获取已发任务
	 * @return
	 */
	@RequestMapping(value = "hasSent")
	public String hasSentList() {
		return "modules/flow/flowTaskHasSentList";
	}
	
	@ResponseBody
	@RequestMapping(value = "hasSentData")
	public Page<Flow> hasSentDataList(Flow act, HttpServletRequest request, HttpServletResponse response) {
		Page<Flow> page = new Page<>(request, response);
		page = actTaskService.hasSentList(page, act);
		return page;
	}
	
	

	/**
	 * 获取流转历史列表
	 * @param act 流程实例
	 * @param startAct 开始活动节点名称
	 * @param endAct 结束活动节点名称
	 */
	@RequestMapping(value = "histoicFlow")
	public String histoicFlow(Flow act, String startAct, String endAct, Model model){
		if (StringUtils.isNotBlank(act.getProcInsId())){
			List<Flow> histoicFlowList = actTaskService.histoicFlowList(act.getProcInsId(), startAct, endAct);
			model.addAttribute("histoicFlowList", histoicFlowList);
		}
		return "modules/flow/flowTaskHistoricFlow";
	}
	
	/**
	 * 获取流程表单
	 * @param act 工作流Entity
	 */
	@RequestMapping(value = "form")
	public String form(Flow act){
		
		// 获取流程XML上的表单KEY
		String formKey = actTaskService.getFormKey(act.getProcDefId(), act.getTaskDefKey());
		
		// 获取流程实例对象
		if (act.getProcInsId() != null){
			ProcessInstance procIns = actTaskService.getProcIns(act.getProcInsId());
			if(procIns!=null) {
				String[] ss = procIns.getBusinessKey().split(":");
				act.setBusinessTable(ss[0]);
				act.setBusinessId(ss[1]);
			}else {
				HistoricProcessInstance history = actTaskService.getHistoryProcIns(act.getProcInsId());
				String[] ss =history.getBusinessKey().split(":");
				act.setBusinessTable(ss[0]);
				act.setBusinessId(ss[1]);
			}
		}
		
		return "redirect:" + FlowableUtils.getFormUrl(formKey, act);
	}
	
	
	
	/**
	 * 获取流程 发起流程列表
	 */
	@RequestMapping(value = "process")
	public String processList() {
		return "modules/flow/flowTaskProcessList";
	}
	
	/**
	 * 获取流程列表
	 * @param category 流程分类
	 */
	@RequestMapping(value = "processDataList")
	@ResponseBody
	public Page<ReProcDef>  processDataList(String category, HttpServletRequest request, HttpServletResponse response, Model model) {
	    Page<ReProcDef> page = new Page<ReProcDef>(request, response);
	    page = reProcDefService.processList(page, category);
	    
		return page;
	}
	
	/**
	 * 启动流程
	 * @param act FlowEntity
	 */
	@RequestMapping(value = "start")
	@ResponseBody
	public String start(Flow act) {
		actTaskService.startProcess(act.getProcDefKey(), act.getBusinessId(), act.getBusinessTable());
		return "true";//adminPath + "/act/task";
	}

	/**
	 * 签收任务
	 * @param taskId 任务ID
	 */
	@RequestMapping(value = "claim")
	@ResponseBody
	public String claim(String taskId) {
		String userId = UserUtils.getUser().getLoginName();
		actTaskService.claim(taskId, userId);
		return renderResult(Global.TRUE, "签收成功");
	}
	
	/**
	 * 完成任务
	 * @param act FlowEntity
	 */
	@RequestMapping(value = "complete")
	@ResponseBody
	public String complete(Flow act) {
		actTaskService.complete(act.getTaskId(), act.getProcInsId(), act.getComment(), act.getVars().getVariableMap());
		return "true";
	}
	
	/**
	 * 输出跟踪流程信息
	 * 
	 * @param proInsId
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "trace/info/{proInsId}")
	public List<Map<String, Object>> traceInfo(@PathVariable("proInsId") String proInsId) throws Exception {
		List<Map<String, Object>> activityInfos = actTaskService.traceProcess(proInsId);
		return activityInfos;
	}

	/**
	 * 删除任务
	 * @param taskId 流程实例ID
	 * @param reason 删除原因
	 */
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "deleteTask")
	@ResponseBody
	public String deleteTask(String taskId, String reason) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}

		if (StringUtils.isBlank(reason)){
			renderResult(Global.FALSE, "删除失败，请填写删除原因！");
		}else{
			actTaskService.deleteTask(taskId, reason);
		}
		return renderResult(Global.FALSE, "删除任务成功，任务ID=" + taskId);
	}
}
