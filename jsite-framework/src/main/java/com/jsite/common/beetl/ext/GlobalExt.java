package com.jsite.common.beetl.ext;

import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.ext.web.WebRenderExt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GlobalExt implements WebRenderExt {
	
	@Override
	public void modify(Template template, GroupTemplate arg1, HttpServletRequest request, HttpServletResponse response) {
		String ctxPath = request.getContextPath();
		template.binding("ctx", (ctxPath + "/a"));
		template.binding("ctxStatic", (ctxPath + "/static"));
		template.binding("flow", ctxPath);
	}

}
