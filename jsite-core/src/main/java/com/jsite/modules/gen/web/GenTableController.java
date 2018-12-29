/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jsite.modules.gen.web;

import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.persistence.Page;
import com.jsite.common.web.BaseController;
import com.jsite.modules.gen.entity.GenTable;
import com.jsite.modules.gen.service.GenTableService;
import com.jsite.modules.gen.util.GenUtils;
import com.jsite.modules.sys.entity.User;
import com.jsite.modules.sys.utils.UserUtils;
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
import java.util.List;

/**
 * 生成方案Controller
 * @author ThinkGem
 * @version 2013-10-15
 *
 * @author liuruijun 重构修改
 * @version 2018-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/gen/genTable")
public class GenTableController extends BaseController {

	@Autowired
	private GenTableService genTableService;
	
	@ModelAttribute
	public GenTable get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return genTableService.get(id);
		}else{
			return new GenTable();
		}
	}
	
	@RequiresPermissions("gen:genTable:view")
	@RequestMapping(value = {"list", ""})
	public String list() {
		return "modules/gen/genTableList";
	}
	
	@RequiresPermissions("gen:genTable:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public Page<GenTable> listData(GenTable genTable, HttpServletRequest request, HttpServletResponse response) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			genTable.setCreateBy(user);
		}
        Page<GenTable> page = genTableService.find(new Page<>(request, response), genTable);
		return page;
	}

	@RequiresPermissions("gen:genTable:view")
	@RequestMapping(value = "formAdd")
	public String formAdd(Model model) {
		List<GenTable> tableList = genTableService.findTableListFormDb(new GenTable());
		model.addAttribute("tableList", tableList);
		return "modules/gen/genTableFormAdd";
	}

    @RequiresPermissions("gen:genTable:view")
    @RequestMapping(value = "next")
    @ResponseBody
    public String next(GenTable genTable) {
        // 验证表是否存在
        if (StringUtils.isBlank(genTable.getId()) && genTableService.checkTableExitByName(genTable.getName())){
            return renderResult(Global.FALSE, "下一步失败！" + genTable.getName() + " 表已经添加！");
        }
        return renderResult(Global.TRUE, "下一步成功！", genTable);
    }

    @RequiresPermissions("gen:genTable:view")
    @RequestMapping(value = "formEdit")
    public String formEdit(GenTable genTable, Model model) {
        // 获取物理表列表
        List<GenTable> tableList = genTableService.findTableListFormDb(new GenTable());
        model.addAttribute("tableList", tableList);
        model.addAttribute("genTable", genTableService.getTableFormDb(genTable));
        model.addAttribute("config", GenUtils.getConfig());
        return "modules/gen/genTableFormEdit";
    }

	@RequiresPermissions("gen:genTable:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public String save(GenTable genTable) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}

		genTableService.save(genTable);
        return renderResult(Global.TRUE, "保存业务表'" + genTable.getName() + "'成功");
	}
	
	@RequiresPermissions("gen:genTable:edit")
	@RequestMapping(value = "delete")
    @ResponseBody
	public String delete(GenTable genTable) {
        if(Global.isDemoMode()){
            return renderResult(Global.FALSE, "演示模式，不允许操作！");
        }

		genTableService.delete(genTable);
        return renderResult(Global.TRUE, "删除业务表成功");
	}

}
