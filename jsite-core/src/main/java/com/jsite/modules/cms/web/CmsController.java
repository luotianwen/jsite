package com.jsite.modules.cms.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jsite.common.web.BaseController;
import com.jsite.modules.cms.entity.Category;
import com.jsite.modules.cms.service.CategoryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 内容管理Controller
 ** @author liuruijun
 * @version 2017-4-21
 */
@Controller
@RequestMapping(value = "${adminPath}/cms")
public class CmsController extends BaseController {

	@Autowired
	private CategoryService categoryService;
	
	@RequiresPermissions("cms:view")
	@RequestMapping(value = "")
	public String index() {
		return "modules/cms/cmsIndex";
	}
	
	@RequiresPermissions("cms:view")
	@RequestMapping(value = "treeData")
	@ResponseBody
	public List<Map<String, Object>> tree(Model model) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<Category> categories = categoryService.findByUser(true, null);
        for (Category category : categories) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", category.getId());
                map.put("pId", category.getParent().getId());
                map.put("pIds", category.getParentIds());
                map.put("name", category.getName());
                map.put("parentName", category.getName());
                mapList.add(map);
        }
        return mapList;
	}
	
	@RequiresPermissions("cms:view")
	@RequestMapping(value = "none")
	public String none() {
		return "modules/cms/cmsNone";
	}

}
