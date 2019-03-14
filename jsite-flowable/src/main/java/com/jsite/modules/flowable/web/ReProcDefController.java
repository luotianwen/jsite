package com.jsite.modules.flowable.web;

import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.persistence.Page;
import com.jsite.common.utils.UploadUtils4;
import com.jsite.common.web.BaseController;
import com.jsite.modules.flowable.entity.ReProcDef;
import com.jsite.modules.flowable.entity.RuExecution;
import com.jsite.modules.flowable.service.ReProcDefService;
import org.apache.commons.fileupload.FileItem;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.XMLStreamException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

/**
 * 流程定义相关Controller
 * @author liuruijun
 * @version 2018-08-02
 */
@Controller
@RequestMapping(value = "${adminPath}/act/process")
public class ReProcDefController extends BaseController {

	@Autowired
	private ReProcDefService actProcessService;
	
//	@ModelAttribute
//	public ReProcDef get(@RequestParam(required=false) String id) {
//		ReProcDef entity = null;
//		if (StringUtils.isNotBlank(id)){
//			entity = actProcessService.get(id);
//		}
//		if(entity == null){
//			entity = new ReProcDef();
//		}
//		return entity;
//	}

	/**
	 * 流程定义(流程管理)列表
	 */
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = {"list", ""})
	public String processList() {
		return "modules/flow/flowProcessList";
	}
	
	@ResponseBody
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = {"listData"})
	public Page<ReProcDef> listData(String category, HttpServletRequest request, HttpServletResponse response) {
		Page<ReProcDef> page = actProcessService.processList(new Page<>(request, response), category);
		return page;
	}
	
	/**
	 * 读取资源，通过部署ID
	 * @param procDefId  流程定义ID
	 * @param proInsId 流程实例ID
	 * @param resType 资源类型(xml|image)
	 * @param response
	 * @throws Exception
	 */
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "resource/read")
	public void resourceRead(String procDefId, String proInsId, String resType, HttpServletResponse response) throws Exception {
		InputStream resourceAsStream = actProcessService.resourceRead(procDefId, proInsId, resType);
		byte[] b = new byte[1024];
		int len = -1;
		while ((len = resourceAsStream.read(b, 0, 1024)) != -1) {
			response.getOutputStream().write(b, 0, len);
		}
	}
	
	/**
	 * 删除部署的流程，级联删除流程实例
	 * @param deploymentId 流程部署ID
	 */
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(String deploymentId) {
        if(Global.isDemoMode()){
            return renderResult(Global.FALSE, "演示模式，不允许操作！");
        }
		actProcessService.deleteDeployment(deploymentId);
		
		return renderResult(Global.TRUE, "删除成功");
	}
	
	/**
	 * 挂起、激活流程实例
	 */
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "update/{state}")
	@ResponseBody
	public String updateState(@PathVariable("state") String state, String procDefId) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}
		String message = actProcessService.updateState(state, procDefId);
		
		return renderResult(Global.TRUE, message);
	}
	
	
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "/deploy", method=RequestMethod.GET)
	public String deploy(Model model) {
		return "modules/flow/flowProcessDeploy";
	}
	/**
	 * 部署流程 - 保存
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "/deploy", method=RequestMethod.POST)
	@ResponseBody
	public String deploy(HttpServletRequest request) {

		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}

		String msg;
		try {
			Map<String, Object> fieldsMap = UploadUtils4.getInstance().initFields(request);
			FileItem fileItem = ((List<FileItem>) fieldsMap.get(UploadUtils4.FILE_FIELDS)).get(0);
			String category = ((Map<String, String>) fieldsMap.get(UploadUtils4.FORM_FIELDS)).get("category");
			
			if (fileItem == null || StringUtils.isBlank(fileItem.getName())){
				msg = "请选择要部署的流程文件";
			}else{
				msg = actProcessService.deploy(category, fileItem);
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			msg = "部署失败";
		}

		return renderResult(Global.TRUE, msg);
	}
	
	
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "running")
	public String runningList() {
		return "modules/flow/flowProcessRunningList";
	}
	
	/**
	 * 运行中的实例列表
	 */
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "runningData")
	@ResponseBody
	public Page<RuExecution> runningData(String procInsId, String procDefKey, HttpServletRequest request, HttpServletResponse response) {
	    Page<RuExecution> page = actProcessService.runningList(new Page<>(request, response), procInsId, procDefKey);
 	    
		return page;
	}
	
	/**
	 * 删除流程实例
	 * @param procInsId 流程实例ID
	 * @param reason 删除原因
	 */
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "deleteProcIns")
	@ResponseBody
	public String deleteProcIns(String procInsId, String reason) {
        if(Global.isDemoMode()){
            return renderResult(Global.FALSE, "演示模式，不允许操作！");
        }

		String msg;
		if (StringUtils.isBlank(reason)){
			msg = "删除流程实例失败，请填写删除原因";
		}else{
			actProcessService.deleteProcIns(procInsId, reason);
			msg = "删除流程实例成功，实例ID=" + procInsId;
		}
		return renderResult(Global.TRUE, msg);
	}

	/**
	 * 设置流程分类
	 */
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "updateCategory")
	public String updateCategory(String procDefId, String category, RedirectAttributes redirectAttributes) {
		actProcessService.updateCategory(procDefId, category);
		return "redirect:" + adminPath + "/act/process";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	


	
	/**
	 * 将部署的流程转换为模型
	 * @param procDefId
	 * @param redirectAttributes
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws XMLStreamException
	 */
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "convert/toModel")
	public String convertToModel(String procDefId, RedirectAttributes redirectAttributes) throws UnsupportedEncodingException, XMLStreamException {
		org.flowable.engine.repository.Model modelData = actProcessService.convertToModel(procDefId);
		redirectAttributes.addFlashAttribute("message", "转换模型成功，模型ID="+modelData.getId());
		return "redirect:" + adminPath + "/act/model";
	}
	
	/**
	 * 导出图片文件到硬盘
	 */
	@RequiresPermissions("act:process:edit")
	@RequestMapping(value = "export/diagrams")
	@ResponseBody
	public List<String> exportDiagrams(@Value("#{APP_PROP['activiti.export.diagram.path']}") String exportDir) throws IOException {
		List<String> files = actProcessService.exportDiagrams(exportDir);;
		return files;
	}

	
	
}
