package com.jsite.modules.sys.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.web.BaseController;
import com.jsite.modules.sys.entity.Area;
import com.jsite.modules.sys.service.AreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 区域Controller
 ** @author liuruijun
 * @version 2018-5-15
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
	public String list() {
		return "modules/sys/areaList";
	}
	
	@RequiresPermissions("sys:area:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public List<Area> listData(Area area) {
        if (area.getParent() == null || StringUtils.isBlank(area.getParent().getId())) {
            area.setParent(new Area("0"));
        }
	    return areaService.findList(area);
	}

	@RequiresPermissions("sys:area:view")
	@RequestMapping(value = "form")
	public String form(Area area, Model model) {
        if (area.getParent() == null) {
            area.setParent(new Area(Area.getRootId()));
        }
		model.addAttribute("area", area);
		return "modules/sys/areaForm";
	}
	
	@RequiresPermissions("sys:area:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public String save(Area area) {
		areaService.save(area);
		return renderResult(Global.TRUE, "保存区域'" + area.getName() + "'成功");
	}
	
	@RequiresPermissions("sys:area:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(Area area) {
		if(Global.isDemoMode()){
            return renderResult(Global.TRUE, "演示模式，不允许操作！");
		}
		if (area.getIsRoot()){
            return renderResult(Global.TRUE, "删除区域失败, 不允许删除顶级区域或编号为空");
		}

		areaService.delete(area);
		return  renderResult(Global.TRUE, "删除区域成功");
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Area> list = areaService.findAll();
		for (int i=0; i<list.size(); i++){
			Area e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParent().getId());
				map.put("pIds", e.getParentIds());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}
}
