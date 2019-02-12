package com.jsite.modules.sys.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jsite.common.config.Global;
import com.jsite.common.lang.DateUtils;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.persistence.Page;
import com.jsite.common.utils.ImageBase64Util;
import com.jsite.common.utils.UploadUtils4;
import com.jsite.common.utils.excel.ExportExcel;
import com.jsite.common.utils.excel.ImportExcel;
import com.jsite.common.web.BaseController;
import com.jsite.modules.sys.entity.Office;
import com.jsite.modules.sys.entity.Role;
import com.jsite.modules.sys.entity.User;
import com.jsite.modules.sys.service.SystemService;
import com.jsite.modules.sys.utils.DictUtils;
import com.jsite.modules.sys.utils.UserUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import java.util.List;
import java.util.Map;

/**
 * 用户Controller
 ** @author liuruijun
 * @version 2018-8-29
 */
@Controller
@RequestMapping(value = "${adminPath:/a}/sys/user")
public class UserController extends BaseController {

	@Autowired
	private SystemService systemService;
	
	@ModelAttribute
	public User get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return systemService.getUser(id);
		}else{
			return new User();
		}
	}

	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"index"})
	public String index() {
		return "modules/sys/userIndex";
	}

	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"list", ""})
	public String list() {
		return "modules/sys/userList";
	}
	
	@ResponseBody
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"listData"})
	public Page<User> listData(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<User> page = systemService.findUser(new Page<User>(request, response), user);
		return page;
	}

	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = "form")
	public String form(User user, Model model) {
		if (user.getCompany()==null || user.getCompany().getId()==null){
			user.setCompany(UserUtils.getUser().getCompany());
		}
		if (user.getOffice()==null || user.getOffice().getId()==null){
			user.setOffice(UserUtils.getUser().getOffice());
		}
		model.addAttribute("user", user);
		model.addAttribute("op", "add");
		model.addAttribute("allRoles", systemService.findAllRole());
		return "modules/sys/userForm";
	}
	
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = "getUserById")
	public String getUserById(User user, HttpServletResponse response) {
		return renderString(response, user);
	}
	
	@RequiresPermissions("sys:user:edit")
	@RequestMapping(value = "changeStatus")
	@ResponseBody
	public String userStatusChange(User user) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}

		user.setLoginFlag("0".equals(user.getLoginFlag())?"1":"0");
		systemService.updateUserInfo(user);
		return renderResult(Global.TRUE, "状态更改成功");
	}
	
	@RequiresPermissions("sys:user:edit")
	@RequestMapping(value = "resetPass")
	@ResponseBody
	public String resetPass(User user) {
        if(Global.isDemoMode()){
            return renderResult(Global.FALSE, "演示模式，不允许操作！");
        }

		systemService.updatePasswordById(user.getId(), user.getLoginName(),DictUtils.getDictValue("default_password", "default_pass", "123456"));
		return renderResult(Global.TRUE, "重置密码成功");
	}
	

	@RequiresPermissions("sys:user:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public String save(User user, HttpServletRequest request) {
        if(Global.isDemoMode()){
            return renderResult(Global.FALSE, "演示模式，不允许操作！");
        }

		// 修正引用赋值问题，不知道为何，Company和Office引用的一个实例地址，修改了一个，另外一个跟着修改。
		user.setCompany(new Office(request.getParameter("company.id")));
		user.setOffice(new Office(request.getParameter("office.id")));
		// 如果新密码为空，则不更换密码
		if(user.getIsNewRecord()) {
			user.setPassword(SystemService.entryptPassword(DictUtils.getDictValue("default_password", "default_pass", "123456")));
		}
		if (!"true".equals(checkLoginName(user.getOldLoginName(), user.getLoginName()))){
			return renderResult(Global.FALSE,"保存用户'" + user.getLoginName() + "'失败，登录名已存在");
		}
		// 角色数据有效性验证，过滤不在授权内的角色
		List<Role> roleList = Lists.newArrayList();
		List<String> roleIdList = user.getRoleIdList();
		for (Role r : systemService.findAllRole()){
			if (roleIdList.contains(r.getId())){
				roleList.add(r);
			}
		}
		user.setRoleList(roleList);
		// 保存用户信息
		systemService.saveUser(user);
		// 清除当前用户缓存
		if (user.getLoginName().equals(UserUtils.getUser().getLoginName())){
			UserUtils.clearCache();
		}
		return renderResult(Global.TRUE,"保存用户'" + user.getLoginName() + "'成功");
	}
	
	@RequiresPermissions("sys:user:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
    public String delete(User user) {
        if (Global.isDemoMode()) {
            return renderResult(Global.FALSE, "演示模式，不允许操作！");
        }

        if (UserUtils.getUser().getId().equals(user.getId())) {
            return renderResult(Global.FALSE, "删除用户失败, 不允许删除当前用户");
        }

        if (User.isAdmin(user.getId())) {
            return renderResult(Global.FALSE, "删除用户失败, 不允许删除超级管理员用户");
        }

        systemService.deleteUser(user);
        return renderResult(Global.TRUE, "删除用户成功");
    }
	
	/**
	 * 导出用户数据
	 * @param user
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("sys:user:view")
    @RequestMapping(value = "export", method=RequestMethod.GET)
    public void exportFile(User user, HttpServletRequest request, HttpServletResponse response) {
		try {
            String fileName = "用户数据"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<User> page = systemService.findUser(new Page<>(request, response, -1), user);
    		new ExportExcel("用户数据", User.class).setDataList(page.getList()).write(response, fileName).dispose();
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

	/**
	 * 导入用户数据
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sys:user:edit")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    @ResponseBody
    public String importFile(HttpServletRequest request) {
        if (Global.isDemoMode()) {
            return renderResult(Global.FALSE, "演示模式，不允许操作！");
        }

        try {
            int successNum = 0;
            int failureNum = 0;
            StringBuilder failureMsg = new StringBuilder();
            Map<String, Object> fieldsMap = UploadUtils4.getInstance().initFields(request);
            FileItem fileItem = ((List<FileItem>) fieldsMap.get(UploadUtils4.FILE_FIELDS)).get(0);
            ImportExcel ei = new ImportExcel(fileItem, 1, 0);
            List<User> list = ei.getDataList(User.class);
            for (User user : list) {
                try {
                    if ("true".equals(checkLoginName("", user.getLoginName()))) {
                        user.setPassword(SystemService.entryptPassword("123456"));
                        systemService.saveUser(user);
                        successNum++;
                    } else {
                        failureMsg.append("<br/>登录名 " + user.getLoginName() + " 已存在; ");
                        failureNum++;
                    }
                } catch (ConstraintViolationException ex) {
                    failureMsg.append("<br/>登录名 " + user.getLoginName() + " 导入失败：");
                    failureNum++;
                } catch (Exception ex) {
                    failureMsg.append("<br/>登录名 " + user.getLoginName() + " 导入失败：" + ex.getMessage());
                }
            }
            if (failureNum > 0) {
                failureMsg.insert(0, "，失败 " + failureNum + " 条用户，导入信息如下：");
            }
            return renderResult(Global.TRUE, "已成功导入 " + successNum + " 条用户" + failureMsg);
        } catch (Exception e) {
            return renderResult(Global.FALSE, "导入用户失败！失败信息：" + e.getMessage());
        }
    }
	
	/**
	 * 下载导入用户数据模板
	 * @param response
	 * @return
	 */
	@RequiresPermissions("sys:user:view")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response) {
		try {
            String fileName = "用户数据导入模板.xlsx";
    		List<User> list = Lists.newArrayList();
    		list.add(UserUtils.getUser());
    		new ExportExcel("用户数据", User.class, 2).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "modules/sys/userList";
    }

	/**
	 * 验证登录名是否有效
	 * @param oldLoginName
	 * @param loginName
	 * @return
	 */
	@ResponseBody
	@RequiresPermissions("sys:user:edit")
	@RequestMapping(value = "checkLoginName")
	public String checkLoginName(String oldLoginName, String loginName) {
		if (loginName !=null && loginName.equals(oldLoginName)) {
			return "true";
		} else if (loginName !=null && systemService.getUserByLoginName(loginName) == null) {
			return "true";
		}
		return "false";
	}

	/**
	 * 用户信息显示及保存
	 * @param user
	 * @param model
	 * @return
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = "info")
	public String info(User user, Model model) {
		User currentUser = UserUtils.getUser();
		if (StringUtils.isNotBlank(user.getName())){
			if(StringUtils.isNotBlank(user.getImageBase64())) {
				String path = ImageBase64Util.GenerateImage(user.getImageBase64(),user.getId()+".jpg");
				currentUser.setPhoto(StringUtils.isNotBlank(path)?path:"");
			}
			currentUser.setEmail(user.getEmail());
			currentUser.setMobile(user.getMobile());
			currentUser.setRemarks(user.getRemarks());
			currentUser.setPhone(user.getPhone());
			systemService.updateUserInfo(currentUser);
		}
		model.addAttribute("user", currentUser);
		return "modules/sys/userInfo";
	}
	
	
	@RequestMapping(value = "headphoto")
	public String headphoto(Model model) {
		User currentUser = UserUtils.getUser();
		model.addAttribute("user", currentUser);
		return "modules/sys/imageclip";
	}

	/**
	 * 返回用户信息
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "infoData")
	public User infoData() {
		return UserUtils.getUser();
	}
	
	/**
	 * 修改个人用户密码
	 * @param oldPassword
	 * @param newPassword
	 * @param model
	 * @return
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = "modifyPwd")
	public String modifyPwd(String oldPassword, String newPassword, Model model) {
		User user = UserUtils.getUser();
		StringBuilder sb = new StringBuilder();
		if (StringUtils.isNotBlank(oldPassword) && StringUtils.isNotBlank(newPassword)){
			if (SystemService.validatePassword(oldPassword, user.getPassword())){
				systemService.updatePasswordById(user.getId(), user.getLoginName(), newPassword);
				sb.append("修改密码成功");
			}else{
				sb.append("修改密码失败，旧密码错误");
			}
		}
		model.addAttribute("user", user);
		model.addAttribute("message", sb.toString());
		return "modules/sys/userModifyPwd";
	}
	
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String officeId) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<User> list = systemService.findUserByOfficeId(officeId);
		for (int i=0; i<list.size(); i++){
			User e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", "u_"+e.getId());
			map.put("pId", officeId);
			map.put("name", StringUtils.replace(e.getName(), " ", ""));
			mapList.add(map);
		}
		return mapList;
	}

}
