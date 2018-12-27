package com.jsite.modules.sys.web;

import com.google.common.collect.Maps;
import com.jsite.common.config.Global;
import com.jsite.common.idgen.IdGenerate;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.security.shiro.session.SessionDAO;
import com.jsite.common.servlet.ValidateCodeServlet;
import com.jsite.common.utils.CacheUtils;
import com.jsite.common.utils.CookieUtils;
import com.jsite.common.web.BaseController;
import com.jsite.common.web.Servlets;
import com.jsite.modules.sys.entity.Principal;
import com.jsite.modules.sys.entity.User;
import com.jsite.modules.sys.security.FormAuthenticationFilter;
import com.jsite.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * 登录Controller
 ** @author liuruijun
 * @version 2018-5-31
 */
@Controller
public class LoginController extends BaseController{
	
	@Autowired
	private SessionDAO sessionDAO;
	
	/**
	 * 管理登录
	 */
	@RequestMapping(value = "${adminPath:/a}/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		// 地址中如果包含JSESSIONID，则跳转一次，去掉JSESSIONID信息。
//		if (StringUtils.containsIgnoreCase(request.getRequestURI(), ";JSESSIONID=")) {
//			String queryString = request.getQueryString();
//			queryString = queryString == null ? "" : "?" + queryString;
//			return "redirect:" + adminPath + "/login" + queryString;
//		}
		
		Principal principal = UserUtils.getPrincipal();

		if (logger.isDebugEnabled()){
			logger.debug("login, active session size: {}", sessionDAO.getActiveSessions(false).size());
		}
		
		// 如果已登录，再次访问主页，则退出原账号。
		if (Global.TRUE.equals(Global.getProperty("notAllowRefreshIndex"))){
			CookieUtils.setCookie(response, "LOGINED", "false");
		}
		
		// 如果已经登录，则跳转到管理首页
		if(principal != null && !principal.isMobileLogin()){
			String queryString = request.getQueryString();
			queryString = queryString == null ? "" : "?" + queryString;
			String indexUrl = adminPath + "/index" + queryString;
			if (Servlets.isAjaxRequest(request)){
				try {
					request.getRequestDispatcher(indexUrl).forward(request, response); // AJAX不支持Redirect改用Forward
				} catch (Exception ex) {
					logger.error(ex.getMessage(), ex);
				}
				return null;
			}
			
			return "redirect:" + adminPath;
		}
		
		model.addAttribute("isValidateCodeLogin", isValidateCodeLogin("", false, false));
		
		return "modules/sys/sysLogin";
	}

	/**
	 * 登录失败，真正登录的POST请求由Filter完成
	 */
	@RequestMapping(value = "${adminPath:/a}/login", method = RequestMethod.POST)
	public String loginFail(HttpServletRequest request, HttpServletResponse response, Model model) {
		Principal principal = UserUtils.getPrincipal();
		// 如果已经登录，则跳转到管理首页
		if(principal != null){
			
			if (Servlets.isAjaxRequest(request)){
				try {
					request.getRequestDispatcher(adminPath).forward(request, response); // AJAX不支持Redirect改用Forward
				} catch (Exception ex) {
					logger.error(ex.getMessage(), ex);
				}
				return null;
			}
			
			return "redirect:" + adminPath;
		}

		String username = WebUtils.getCleanParam(request, FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);
		boolean rememberMe = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM);
		boolean mobile = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_MOBILE_PARAM);
		String exception = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
		String message = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM);
		
		if (StringUtils.isBlank(message) || StringUtils.equals(message, "null")){
			message = "用户或密码错误, 请重试.";
		}

		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM, rememberMe);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_MOBILE_PARAM, mobile);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);
		
		if (logger.isDebugEnabled()){
			logger.debug("login fail, active session size: {}, message: {}, exception: {}", 
					sessionDAO.getActiveSessions(false).size(), message, exception);
		}
		
		// 非授权异常，登录失败，验证码加1。
		if (!UnauthorizedException.class.getName().equals(exception)){
			boolean isValid = isValidateCodeLogin(username, true, false);
			model.addAttribute("isValidateCodeLogin", isValid);
		}
		
		// 验证失败清空验证码
		request.getSession().setAttribute(ValidateCodeServlet.VALIDATE_CODE, IdGenerate.uuid());
		
		// 如果是手机登录，则返回JSON字符串
		if (mobile){
	        return renderString(response, model);
		}
		
		// 登录操作如果是Ajax操作，直接返回登录信息字符串。
		if (Servlets.isAjaxRequest(request)) {
			model.addAttribute("result", Global.FALSE);
			return Servlets.renderObject(response, model);
		}

		return "modules/sys/sysLogin";
	}

	/**
	 * 登录成功，进入管理首页
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = "${adminPath:/a}")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		Principal principal = UserUtils.getPrincipal();

		// 登录成功后，验证码计算器清零
		isValidateCodeLogin(principal.getLoginName(), false, true);
		
		if (logger.isDebugEnabled()){
			logger.debug("show index, active session size: {}", sessionDAO.getActiveSessions(false).size());
		}
		
		// 当前用户对象信息
		User user = UserUtils.get(principal.getId());
		if (user == null) {
			UserUtils.getSubject().logout();
			return "redirect:" + adminPath + "/login";
		}
		
		model.addAttribute("user", user); // 设置当前用户信息
		model.addAttribute("result", Global.TRUE);
		// 登录操作如果是Ajax操作，直接返回登录信息字符串。
		if (Servlets.isAjaxRequest(request)) {
			return Servlets.renderObject(response, model);
		}

		// 如果已登录，再次访问主页，则退出原账号。
		if (Global.TRUE.equals(Global.getProperty("notAllowRefreshIndex"))){
			String logined = CookieUtils.getCookie(request, "LOGINED");
			if (StringUtils.isBlank(logined) || "false".equals(logined)){
				CookieUtils.setCookie(response, "LOGINED", "true");
			}else if (StringUtils.equals(logined, "true")){
				UserUtils.getSubject().logout();
				return "redirect:" + adminPath + "/login";
			}
		}
		
		// 如果是手机登录，则返回JSON字符串
		if (principal.isMobileLogin()){
			if (request.getParameter("login") != null){
				return renderString(response, principal);
			}
			if (request.getParameter("index") != null){
				return "modules/sys/sysIndex";
			}
			return "redirect:" + adminPath + "/login";
		}

		return "modules/sys/sysIndex";
	}
	
	/**
	 * 切换主题
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = "${adminPath}/switchSkin/{skinName}")
	public String switchSkin(@PathVariable String skinName, HttpServletRequest request, HttpServletResponse response) {
		Principal principal = UserUtils.getPrincipal();
		if (StringUtils.isNotBlank(skinName) && !"select".equals(skinName)){
			CookieUtils.setCookie(response, "skinName_" + principal.getId(), skinName);
			return "redirect:" + adminPath;
		}
		return "modules/sys/sysSwitchSkin";
	}
	
	
	/**
	 * 是否是验证码登录
	 * @param useruame 用户名
	 * @param isFail 计数加1
	 * @param clean 计数清零
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static boolean isValidateCodeLogin(String useruame, boolean isFail, boolean clean){
		Map<String, Integer> loginFailMap = (Map<String, Integer>)CacheUtils.get("loginFailMap");
		if (loginFailMap==null){
			loginFailMap = Maps.newHashMap();
			CacheUtils.put("loginFailMap", loginFailMap);
		}
		Integer loginFailNum = loginFailMap.get(useruame);
		if (loginFailNum==null){
			loginFailNum = 0;
		}
		if (isFail){
			loginFailNum++;
			loginFailMap.put(useruame, loginFailNum);
		}
		if (clean){
			loginFailMap.remove(useruame);
		}
		
		return loginFailNum >= 3;
	}
	
	
	@RequiresPermissions("user")
	@RequestMapping(value = "${adminPath}/desktop")
	public String desktop(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/sys/sysIndex/sysDesktop";
	}
}
