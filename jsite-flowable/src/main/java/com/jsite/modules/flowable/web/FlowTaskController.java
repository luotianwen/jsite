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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
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
	 * @param procDefKey 流程定义标识
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
	public Page<Flow> todoData(Flow act, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Flow> list = actTaskService.todoList(act);
//		if (UserUtils.getPrincipal().isMobileLogin()){
//			return renderString(response, list);
//		}
		
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
	 * @param page
	 * @param procDefKey 流程定义标识
	 * @return
	 */
	@RequestMapping(value = "historic")
	public String historicList(Flow act, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		/*Page<Flow> page = new Page<Flow>(request, response);
		page = actTaskService.historicList(page, act);
		model.addAttribute("page", page);
		if (UserUtils.getPrincipal().isMobileLogin()){
			return renderString(response, page);
		}*/
		return "modules/flow/flowTaskHistoricList";
	}
	
	@ResponseBody
	@RequestMapping(value = "historicData")
	public Page<Flow> historicDataList(Flow act, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		Page<Flow> page = new Page<Flow>(request, response);
		page = actTaskService.historicList(page, act);
		/*model.addAttribute("page", page);
		if (UserUtils.getPrincipal().isMobileLogin()){
			return renderString(response, page);
		}*/
		return page;
	}
	
	
	/**
	 * 获取已发任务
	 * @param page
	 * @param procDefKey 流程定义标识
	 * @return
	 */
	@RequestMapping(value = "hasSent")
	public String hasSentList(Flow act, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		return "modules/flow/flowTaskHasSentList";
	}
	
	@ResponseBody
	@RequestMapping(value = "hasSentData")
	public Page<Flow> hasSentDataList(Flow act, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		Page<Flow> page = new Page<Flow>(request, response);
		page = actTaskService.hasSentList(page, act);
		return page;
	}
	
	

	/**
	 * 获取流转历史列表
	 * @param procInsId 流程实例
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
	 * @param taskId	任务ID
	 * @param taskName	任务名称
	 * @param taskDefKey 任务环节标识
	 * @param procInsId 流程实例ID
	 * @param procDefId 流程定义ID
	 */
	@RequestMapping(value = "form")
	public String form(Flow act, HttpServletRequest request, Model model){
		
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
	 * @param category 流程分类
	 */
	@RequestMapping(value = "process")
	public String processList(String category, HttpServletRequest request, HttpServletResponse response, Model model) {
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
	 * @param procDefKey 流程定义KEY
	 * @param businessTable 业务表表名
	 * @param businessId	业务表编号
	 */
	@RequestMapping(value = "start")
	@ResponseBody
	public String start(Flow act, String table, String id, Model model) throws Exception {
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
		String userId = UserUtils.getUser().getLoginName();//ObjectUtils.toString(UserUtils.getUser().getId());
		actTaskService.claim(taskId, userId);
		return renderResult(Global.TRUE, "签收成功");
	}
	
	/**
	 * 完成任务
	 * @param taskId 任务ID
	 * @param procInsId 流程实例ID，如果为空，则不保存任务提交意见
	 * @param comment 任务提交意见的内容
	 * @param vars 任务流程变量，如下
	 * 		vars.keys=flag,pass
	 * 		vars.values=1,true
	 * 		vars.types=S,B  @see com.jsite.modules.act.utils.PropertyType
	 */
	@RequestMapping(value = "complete")
	@ResponseBody
	public String complete(Flow act) {
		actTaskService.complete(act.getTaskId(), act.getProcInsId(), act.getComment(), act.getVars().getVariableMap());
		return "true";//adminPath + "/act/task";
	}
	
//	/**
//	 * 读取带跟踪的图片
//	 */
//	@RequestMapping(value = "trace/photo/{procDefId}/{execId}")
//	public void tracePhoto(@PathVariable("procDefId") String procDefId, @PathVariable("execId") String execId, HttpServletResponse response) throws Exception {
//		InputStream imageStream = actTaskService.tracePhoto(procDefId, execId);
//
//		// 输出资源内容到相应对象
//		byte[] b = new byte[1024];
//		int len;
//		while ((len = imageStream.read(b, 0, 1024)) != -1) {
//			response.getOutputStream().write(b, 0, len);
//		}
//	}
	
	/**
	 * 输出跟踪流程信息
	 * 
	 * @param processInstanceId
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
	 * 显示流程图
	 
	@RequestMapping(value = "processPic")
	public void processPic(String procDefId, HttpServletResponse response) throws Exception {
		ProcessDefinition procDef = repositoryService.createProcessDefinitionQuery().processDefinitionId(procDefId).singleResult();
		String diagramResourceName = procDef.getDiagramResourceName();
		InputStream imageStream = repositoryService.getResourceAsStream(procDef.getDeploymentId(), diagramResourceName);
		byte[] b = new byte[1024];
		int len = -1;
		while ((len = imageStream.read(b, 0, 1024)) != -1) {
			response.getOutputStream().write(b, 0, len);
		}
	}*/
	
	
	/**
	 * 删除任务
	 * @param taskId 流程实例ID
	 * @param reason 删除原因
	 */
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "deleteTask")
	public String deleteTask(String taskId, String reason, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}

		if (StringUtils.isBlank(reason)){
//			addMessage(redirectAttributes, "请填写删除原因");
		}else{
			actTaskService.deleteTask(taskId, reason);
//			addMessage(redirectAttributes, "删除任务成功，任务ID=" + taskId);
		}
		return "redirect:" + adminPath + "/act/task";
	}
}
