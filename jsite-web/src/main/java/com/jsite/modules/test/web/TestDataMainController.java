/**
 * Copyright &copy; 2017-2019 <a href="https://gitee.com/baseweb/JSite">JSite</a> All rights reserved.
 */
package com.jsite.modules.test.web;

import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.persistence.Page;
import com.jsite.common.web.BaseController;
import com.jsite.modules.test.entity.TestDataMain;
import com.jsite.modules.test.service.TestDataMainService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 主子表生成测试Controller
 * @author liuruijun
 * @version 2019-01-02
 */
@Controller
@RequestMapping(value = "${adminPath}/test/testDataMain")
public class TestDataMainController extends BaseController {

	@Autowired
	private TestDataMainService testDataMainService;
	
	@ModelAttribute
	public TestDataMain get(@RequestParam(required=false) String id) {
		TestDataMain entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = testDataMainService.get(id);
		}
		if (entity == null){
			entity = new TestDataMain();
		}
		return entity;
	}
	
	@RequiresPermissions("test:testDataMain:view")
	@RequestMapping(value = {"list", ""})
	public String list() {
		return "modules/test/testDataMainList";
	}
	
	@RequiresPermissions("test:testDataMain:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public Page<TestDataMain> listData(TestDataMain testDataMain, HttpServletRequest request, HttpServletResponse response) {
		Page<TestDataMain> page = testDataMainService.findPage(new Page<>(request, response), testDataMain);
		return page;
	}

	@RequiresPermissions("test:testDataMain:view")
	@RequestMapping(value = "form")
	public String form(TestDataMain testDataMain, Model model) {
		model.addAttribute("testDataMain", testDataMain);
		return "modules/test/testDataMainForm";
	}

	@RequiresPermissions("test:testDataMain:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public String save(TestDataMain testDataMain) {
		testDataMainService.save(testDataMain);
		return renderResult(Global.TRUE, "保存主子表生成成功");
	}
	
	@RequiresPermissions("test:testDataMain:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(TestDataMain testDataMain) {
		testDataMainService.delete(testDataMain);
		return renderResult(Global.TRUE, "删除主子表生成成功");
	}

}