package com.jsite.modules.flowable.web;

import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.persistence.Page;
import com.jsite.common.web.BaseController;
import com.jsite.modules.flowable.entity.DeModel;
import com.jsite.modules.flowable.service.DeModelService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.flowable.idm.engine.impl.persistence.entity.UserEntityImpl;
import org.flowable.ui.common.model.UserRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 流程模型相关Controller
 * @author liuruijun
 * @version 2018-07-29
 */
@Controller
@RequestMapping(value = "${adminPath}/act/model")
public class DeModelController extends BaseController {

	@Autowired
	private DeModelService deModelService;
	
	@ModelAttribute
	public DeModel get(@RequestParam(required=false) String id) {
		DeModel entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = deModelService.get(id);
		}
		if(entity == null){
			entity = new DeModel();
		}
		return entity;
	}
	
	@RequestMapping(value="account", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
    public UserRepresentation account() {
		UserEntityImpl fUser = new UserEntityImpl();
		fUser.setId("admin");
		fUser.setFirstName("Test");
		fUser.setLastName("Administrator");
		fUser.setEmail("admin@flowable.org");
        
        UserRepresentation userRepresentation = new UserRepresentation(fUser);
        
        return userRepresentation;
    }
	
	/**
	 * 流程模型列表
	 */
	@RequiresPermissions("act:model:edit")
	@RequestMapping(value = { "list", "" })
	public String modelList(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/flow/flowModelList";
	}
	
	@ResponseBody
	@RequiresPermissions("act:model:edit")
	@RequestMapping(value = {"listData"})
	public Page<DeModel> listData(DeModel deModel, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DeModel> page = deModelService.findPage(new Page<DeModel>(request, response), deModel);
		return page;
	}
	
	/**
	 * 根据Model部署流程
	 */
	@RequiresPermissions("act:model:edit")
	@RequestMapping(value = "deploy")
	@ResponseBody
	public String deploy(DeModel deModel, String category) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}
		String result = deModelService.doDeploy(deModel.getId(), category);
		return  renderResult(Global.TRUE, result);
	}
	
	/**
	 * 删除Model
	 * @param deModel
	 * @return
	 */
	@RequiresPermissions("act:model:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(DeModel deModel) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}

		deModelService.delete(deModel);
		
		return  renderResult(Global.TRUE, "删除模型成功");
	}
	
	
	@RequiresPermissions("act:model:edit")
	@RequestMapping(value = "choose/category")
	public String chooseCategory(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/flow/flowChooseCategory";
	}
}
