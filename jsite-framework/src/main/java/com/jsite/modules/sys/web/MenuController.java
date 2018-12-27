package com.jsite.modules.sys.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.web.BaseController;
import com.jsite.modules.sys.entity.Menu;
import com.jsite.modules.sys.service.SystemService;
import com.jsite.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 菜单Controller
 ** @author liuruijun
 * @version 2018-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/menu")
public class MenuController extends BaseController {

	@Autowired
	private SystemService systemService;

	@ModelAttribute("menu")
	public Menu get(@RequestParam(required = false) String id) {
		Menu entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = systemService.getMenu(id);
		}
		if (entity == null) {
			entity = new Menu();
			entity.setIsNewRecord(true);
		}
		return entity;
	}

	@RequiresPermissions("sys:menu:view")
	@RequestMapping(value = {"list", ""})
	public String list() {
		return "modules/sys/menuList";
	}
	
	@RequiresPermissions("sys:menu:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public List<Menu> listData() {
		List<Menu> list = Lists.newArrayList();
		List<Menu> sourcelist = systemService.findAllMenu();
		Menu.sortList(list, sourcelist, Menu.getRootId(), true);

		return list;
	}

	@RequiresPermissions("sys:menu:view")
	@RequestMapping(value = "form")
	public String form(Menu menu,  Model model) {
        if (menu.getParent() == null) {
            menu.setParent(new Menu(Menu.getRootId()));
        }

		// 获取排序号，最末节点排序号+30
		if (StringUtils.isBlank(menu.getId())){
			List<Menu> list = Lists.newArrayList();
			List<Menu> sourcelist = systemService.findAllMenu();
			Menu.sortList(list, sourcelist, menu.getParent().getId(), false);
			if (list.size() > 0){
				menu.setSort(list.get(list.size()-1).getSort() + 30);
			}
		}
		model.addAttribute("menu", menu);
		return "modules/sys/menuForm";
	}
	
	@RequiresPermissions("sys:menu:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public String save(Menu menu) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}

		if(!UserUtils.getUser().isAdmin()){
			return renderResult(Global.FALSE, "越权操作，只有超级管理员才能添加或修改数据！");
		}
		
		systemService.saveMenu(menu);
		
		return renderResult(Global.TRUE, ("保存菜单'" + menu.getName() + "'成功"));
	}

    @RequiresPermissions("sys:menu:edit")
    @RequestMapping(value = "delete")
    @ResponseBody
    public String delete(Menu menu) {
        if (Global.isDemoMode()) {
            return renderResult(Global.FALSE, "演示模式，不允许操作！");
        }
        if (menu.getIsRoot()) {
            return renderResult(Global.FALSE, "删除菜单失败, 不允许删除顶级菜单或编号为空");
        } else {
            systemService.deleteMenu(menu);
        }
        return renderResult(Global.TRUE, "删除菜单成功");
    }

	@RequiresPermissions("user")
	@RequestMapping(value = "tree")
	public String tree() {
		return "modules/sys/menuTree";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "treeselect")
	public String treeselect(String parentId, Model model) {
		model.addAttribute("parentId", parentId);
		return "modules/sys/menuTreeselect";
	}
	
	/**
	 * 批量修改菜单排序
	 */
	@RequiresPermissions("sys:menu:edit")
	@RequestMapping(value = "updateSort")
	@ResponseBody
	public String updateSort(String[] ids, Integer[] sorts) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}
		
    	for (int i = 0; i < ids.length; i++) {
    		Menu menu = new Menu(ids[i]);
    		menu.setSort(sorts[i]);
    		systemService.updateMenuSort(menu);
    	}
		return renderResult(Global.TRUE, "保存菜单排序成功!");
	}
	
	/**
	 * isShowHide是否显示隐藏菜单
	 * @param extId
	 * @param response
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, @RequestParam(required=false) String isShowHide, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Menu> list = systemService.findAllMenu();
		for (int i=0; i<list.size(); i++){
			Menu e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
				if(isShowHide != null && isShowHide.equals("0") && e.getIsShow().equals("0")){
					continue;
				}
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParent().getId());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}
}
