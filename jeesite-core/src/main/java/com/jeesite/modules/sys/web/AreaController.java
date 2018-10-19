package com.jeesite.modules.sys.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jeesite.common.config.Global;
import com.jeesite.common.lang.StringUtils;
import com.jeesite.common.web.BaseController;
import com.jeesite.modules.sys.entity.Area;
import com.jeesite.modules.sys.service.AreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 区域Controller
 * @author ThinkGem
 * @version 2013-5-15
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/area")
public class AreaController extends BaseController {

	@Autowired
	private AreaService areaService;
	
	@ModelAttribute("area")
	public Area get(@RequestParam(required=false) String id) {
		Area entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = areaService.get(id);
		}
		if(entity == null){
			entity = new Area();
		}
		return entity;
	}

	@RequiresPermissions("sys:area:view")
	@RequestMapping(value = {"list", ""})
	public String list(Area area, Model model) {
		//model.addAttribute("list", areaService.findAll());
		return "modules/sys/areaList";
	}
	
	@RequiresPermissions("sys:area:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public List<Area> listData(Area area, Model model) {
    	if (StringUtils.isBlank(area.getParentId())) {
			area.setParentId("0");
	    }
	    if ((StringUtils.isNotBlank(area.getName()))) {
	    	area.setParentId(null);
	    }
	    return areaService.findList(area);
	}

	@RequiresPermissions("sys:area:view")
	@RequestMapping(value = "form")
	public String form(Area area, Model model) {
		model.addAttribute("area", area);
		return "modules/sys/areaForm";
	}
	
	@RequiresPermissions("sys:area:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public String save(Area area, Model model, RedirectAttributes redirectAttributes) {
		logger.info("====parentId==="+area.getParentId());
		logger.info("===isNewRecord==="+area.getIsNewRecord());
		
		if(area.getIsNewRecord()) {
			if(StringUtils.isEmpty(area.getParentId())) {
				area.setTreeLeaf("0");
				area.setTreeLevel(0);
				area.setParentIds("0");
				area.setParentId("0");
			}else {
				Area f=areaService.get(area.getParentId());
				area.setParentIds(f.getParentIds()+f.getId()+",");
				area.setTreeLeaf("1");
				area.setTreeLevel(f.getTreeLevel()+1);
				if(f.getIsTreeLeaf()) {
					f.setTreeLeaf("0");
					areaService.save(f);
				}
			}
		}
		areaService.save(area);
		//addMessage(redirectAttributes, "保存区域'" + area.getName() + "'成功");
		return renderResult(Global.TRUE, "保存区域'" + area.getName() + "'成功");
		//return "redirect:" + adminPath + "/sys/area/";
	}
	
	@RequiresPermissions("sys:area:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(Area area, RedirectAttributes redirectAttributes) {
		/*if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/sys/area";
		}*/
//		if (Area.isRoot(id)){
//			addMessage(redirectAttributes, "删除区域失败, 不允许删除顶级区域或编号为空");
//		}else{
			areaService.delete(area);
			//addMessage(redirectAttributes, "删除区域成功");
//		}
			
		return  renderResult(Global.TRUE, "删除区域成功");
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Area> list = areaService.findAll();
		for (int i=0; i<list.size(); i++){
			Area e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("pIds", e.getParentIds());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}
}
