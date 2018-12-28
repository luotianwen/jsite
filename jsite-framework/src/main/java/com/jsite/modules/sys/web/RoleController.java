package com.jsite.modules.sys.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.persistence.Page;
import com.jsite.common.web.BaseController;
import com.jsite.modules.sys.entity.Office;
import com.jsite.modules.sys.entity.Role;
import com.jsite.modules.sys.entity.User;
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

import java.util.List;
import java.util.Map;

/**
 * 角色Controller
 ** @author liuruijun
 * @version 2018-12-05
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/role")
public class RoleController extends BaseController {

	@Autowired
	private SystemService systemService;
	
	@ModelAttribute("role")
	public Role get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return systemService.getRole(id);
		}else{
			return new Role();
		}
	}
	
	@RequiresPermissions("sys:role:view")
	@RequestMapping(value = {"list", ""})
	public String list() {
		return "modules/sys/roleList";
	}
	
	@RequiresPermissions("sys:role:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public List<Role> listData() {
		List<Role> list = systemService.findAllRole();
		return list;
	}

	@RequiresPermissions("sys:role:view")
	@RequestMapping(value = "form")
	public String form(Role role, Model model) {
		if (role.getOffice() == null){
			role.setOffice(UserUtils.getUser().getOffice());
		}

		model.addAttribute("role", role);
		model.addAttribute("menuList", systemService.findAllMenu());

		//AreaOfficeUtils.getOfficeList()
		List<Office> officeList = null;
		try{
            Class<?> areaOfficeUtils = Class.forName("com.jsite.modules.sys.utils.AreaOfficeUtils");
			officeList = (List<Office>) areaOfficeUtils.getMethod("getOfficeList").invoke(null);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

		model.addAttribute("officeList", officeList);
		return "modules/sys/roleForm";
	}

	@ResponseBody
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "save")
	public String save(Role role) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}
		if(!UserUtils.getUser().isAdmin()&&role.getSysData().equals(Global.YES)){
			return renderResult(Global.FALSE, "越权操作，只有超级管理员才能修改此数据！");
		}
		if (!"true".equals(checkName(role.getOldName(), role.getName()))){
			return renderResult(Global.FALSE, "保存角色 “" + role.getName() + "” 失败, 角色名已存在");
		}
		if (!"true".equals(checkEnname(role.getOldEnname(), role.getEnname()))){
			return renderResult(Global.FALSE, "保存角色 “" + role.getName() + "” 失败, 英文名已存在");
		}
		
		systemService.saveRole(role);
		return renderResult(Global.TRUE, "保存角色 “" + role.getName() + "” 成功");
	}

    @ResponseBody
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "delete")
	public String delete(Role role) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}

		if (!UserUtils.getUser().isAdmin() && role.getSysData().equals(Global.YES)) {
			return renderResult(Global.FALSE, "越权操作，只有超级管理员才能修改此数据！");
		}

		systemService.deleteRole(role);
		return renderResult(Global.TRUE, "删除角色成功");
	}
	
	/**
	 * 角色分配页面
	 * @return
	 */
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "assign")
	public String assign() {
		return "modules/sys/roleAssign";
	}
	
	/**
	 * 角色分配 -- 打开角色分配对话框
	 * @param selectData
	 * @param checkbox
     * @param model
	 * @return
	 */
	@RequiresPermissions("sys:role:view")
	@RequestMapping(value = "usertorole")
	public String selectUserToRole(Role role, String selectData, String checkbox, Model model) {
		model.addAttribute("selectData", selectData);
		model.addAttribute("checkbox", checkbox);
		
		return "modules/sys/selectUserToRole";
	}
	
	/**
	 * 角色分配 -- 根据部门编号获取用户列表
	 * @param officeId
	 * @return
	 */
    @ResponseBody
	@RequiresPermissions("sys:role:view")
	@RequestMapping(value = "users")
	public List<Map<String, Object>> users(String officeId) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		User user = new User();
		user.setOffice(new Office(officeId));
		Page<User> page = systemService.findUser(new Page<>(1, -1), user);
		for (User e : page.getList()) {
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", 0);
			map.put("name", e.getName());
			mapList.add(map);			
		}
		return mapList;
	}
	
	/**
	 * 角色分配 -- 从角色中移除用户
	 * @param role
	 * @return
	 */
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "outrole")
	@ResponseBody
	public String outrole(Role role) {
		if (Global.isDemoMode()) {
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}

		StringBuilder msg = new StringBuilder();
		int newNum = 0;
		for (User u : role.getUserList()) {
			User user = systemService.getUser(u.getId());
			if (UserUtils.getUser().getId().equals(user.getId())) {
				msg.append("<br/>无法从角色【" + role.getName() + "】中移除用户【" + user.getName() + "】自己！");
			} else {
				if (user.getRoleList().size() <= 1) {
					msg.append("<br/>用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除失败！这已经是该用户的唯一角色，不能移除。");
				} else {
					Boolean flag = systemService.outUserInRole(role, user);
					if (flag) {
						msg.append("<br/>用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除成功！");
						newNum++;
					} else {
						msg.append("<br/>用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除失败！");
					}
				}
			}
		}

		return renderResult(Global.TRUE, "已成功移除 " + newNum + " 个用户" + msg.toString());
	}
	
	/**
	 * 角色分配
	 * @param role
	 * @return
	 */
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "assignrole")
	@ResponseBody
	public String assignRole(Role role) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}
		
		StringBuilder msg = new StringBuilder();
		int newNum = 0;
		for (User u : role.getUserList()) {
			User user = systemService.assignUserToRole(role, systemService.getUser(u.getId()));
			if (null != user) {
				msg.append("<br/>新增用户【" + user.getName() + "】到角色【" + role.getName() + "】！");
				newNum++;
			}
		}
		
		return renderResult(Global.TRUE, "已成功分配 "+newNum+" 个用户"+msg);
	}

	/**
	 * 验证角色名是否有效
	 * @param oldName
	 * @param name
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "checkName")
	public String checkName(String oldName, String name) {
		if (name!=null && name.equals(oldName)) {
			return "true";
		} else if (name!=null && systemService.getRoleByName(name) == null) {
			return "true";
		}
		return "false";
	}

	/**
	 * 验证角色英文名是否有效
	 * @param oldEnname
	 * @param enname
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "checkEnname")
	public String checkEnname(String oldEnname, String enname) {
		if (enname!=null && enname.equals(oldEnname)) {
			return "true";
		} else if (enname!=null && systemService.getRoleByEnname(enname) == null) {
			return "true";
		}
		return "false";
	}

}
