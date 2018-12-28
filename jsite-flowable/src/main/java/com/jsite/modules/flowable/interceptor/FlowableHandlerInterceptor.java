package com.jsite.modules.flowable.interceptor;

import org.flowable.idm.api.User;
import org.flowable.idm.engine.impl.persistence.entity.UserEntityImpl;
import org.flowable.ui.common.security.SecurityUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 请求拦截器，Flowable动态设置用户信息
 * @author liuruijun
 * @version 2018-8-19
 * 需要增加拦截器，动态设置Flowable用户信息
 *
 */
public class FlowableHandlerInterceptor implements HandlerInterceptor {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String servletPath = request.getServletPath();
		if (servletPath.startsWith("/app") || servletPath.startsWith("/idm")) {
			User currentUserObject = SecurityUtils.getCurrentUserObject();
			if (currentUserObject == null) {
				User user = new UserEntityImpl();
				user.setId("admin");
				user.setFirstName("Test");
				user.setLastName("Administrator");
				user.setEmail("admin@flowable.org");
				SecurityUtils.assumeUser(user);
			}
		}
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}
}
