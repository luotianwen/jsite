package com.jsite.modules.sys.web;

import com.jsite.common.persistence.Page;
import com.jsite.common.web.BaseController;
import com.jsite.modules.sys.entity.Log;
import com.jsite.modules.sys.service.LogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 日志Controller
 ** @author liuruijun
 * @version 2018-6-2
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/log")
public class LogController extends BaseController {

	@Autowired
	private LogService logService;
	
	@RequiresPermissions("sys:log:view")
	@RequestMapping(value = {"list", ""})
	public String list() {
		return "modules/sys/logList";
	}
	
	
	@RequiresPermissions("sys:log:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public Page<Log> listData(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<Log> page = logService.findPage(new Page<>(request, response), log);
		return page;
	}
	
	@RequiresPermissions("sys:log:view")
	@RequestMapping(value = "form")
	@ResponseBody
	public Log form(@RequestParam String id) {
		return logService.get(id);
	}

}
