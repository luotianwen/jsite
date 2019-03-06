/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jsite.common.config;

import com.google.common.collect.Maps;
import com.jsite.common.i18n.I18nLocaleResolver;
import com.jsite.common.i18n.I18nMessageSource;
import com.jsite.common.io.PropertiesUtils;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.utils.SpringContextHolder;
import com.jsite.common.web.Servlets;
import org.apache.commons.lang3.LocaleUtils;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.io.DefaultResourceLoader;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.Locale;
import java.util.Map;

/**
 * 全局配置类 懒汉式单例类.在第一次调用的时候实例化自己
 * @author ThinkGem,长春叭哥
 * @version 2018年1月5日
 *
 * @author liuruijun
 * @version 2018年1月5日 框架升级改造
 */

public class Global {

	private static final Global INSTANCE = new Global();

	public static Global getInstance() {
		return INSTANCE;
	}

	/**
	 * 保存全局属性值
	 */
	private static Map<String, String> map = Maps.newHashMap();

	/**
	 * 显示/隐藏
	 */
	public static final String SHOW = "1";
	public static final String HIDE = "0";

	/**
	 * 是/否
	 */
	public static final String YES = "1";
	public static final String NO = "0";

	/**
	 * 对/错
	 */
	public static final String TRUE = "true";
	public static final String FALSE = "false";

	/**
	 * 上传文件基础虚拟路径
	 */
	public static final String USERFILES_BASE_URL = "/userfiles/";

	/**
	 * 获取配置
	 * 
	 * @see ${fns:getProperty('adminPath')}
	 */
	public static String getProperty(String key) {
		String value = map.get(key);
		if (value == null) {
            value = PropertiesUtils.getInstance().getProperty(key);
			map.put(key, value != null ? value : StringUtils.EMPTY);
		}
		return value;
	}
	
	/**
	 * 获取配置
	 * 
	 * @see ${fns:getProperty('adminPath', '/a')}
	 */
	public static String getProperty(String key, String defValue) {
		String value = map.get(key);
		if (value == null) {
            value = PropertiesUtils.getInstance().getProperty(key);
			map.put(key, value != null ? value : defValue);
		}
		return value;
	}
	

	/**
	 * 获取管理端根路径
	 */
	public static String getAdminPath() {
		return getProperty("adminPath");
	}

	/**
	 * 获取前端根路径
	 */
	public static String getFrontPath() {
		return getProperty("frontPath");
	}

	/**
	 * 获取URL后缀
	 */
	public static String getUrlSuffix() {
		return getProperty("urlSuffix");
	}

	/**
	 * 是否是演示模式，演示模式下不能修改用户、角色、密码、菜单、授权
	 */
	public static Boolean isDemoMode() {
		String dm = getProperty("demoMode");
		return "true".equals(dm) || "1".equals(dm);
	}

	public static Boolean isFlowableEnable() {
		String dm = getProperty("flowableEnable");
		return "true".equals(dm) || "1".equals(dm);
	}

	public static Boolean getPropertyBoolean(String key, String defValue) {
		String value = map.get(key);
		if (value == null) {
		    String tmp = PropertiesUtils.getInstance().getProperty(key);
			value = tmp==null?defValue:tmp;
			map.put(key, value != null ? value : defValue);
		}
		return value.equals("true");
	}

	/**
	 * 在修改系统用户和角色时是否同步到Activiti
	 */
	public static Boolean isSynActivitiIndetity() {
		String dm = getProperty("activiti.isSynActivitiIndetity");
		return "true".equals(dm) || "1".equals(dm);
	}

	/**
	 * 页面获取常量
	 * 
	 * @see ${fns:getConst('YES')}
	 */
	public static Object getConst(String field) {
		try {
			return Global.class.getField(field).get(null);
		} catch (Exception e) {
			// 异常代表无配置，这里什么也不做
		}
		return null;
	}

	/**
	 * 获取工程路径
	 * 
	 * @return
	 */
	public static String getProjectPath() {
		// 如果配置了工程路径，则直接返回，否则自动获取。
		String projectPath = Global.getProperty("projectPath");
		if (StringUtils.isNotBlank(projectPath)) {
			return projectPath;
		}
		try {
			File file = new DefaultResourceLoader().getResource("").getFile();
			if (file != null) {
				while (true) {
					File f = new File(file.getPath() + File.separator + "src" + File.separator + "main");
					if (f == null || f.exists()) {
						break;
					}
					if (file.getParentFile() != null) {
						file = file.getParentFile();
					} else {
						break;
					}
				}
				projectPath = file.toString();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return projectPath;
	}


    public static String getLang() {
        if(I18nLocaleResolver.enabled()) {
            HttpServletRequest httpServletRequest = Servlets.getRequest();
			Locale locale = httpServletRequest==null?null:I18nUtils.i18nLocaleResolver().resolveLocale(httpServletRequest);

            if(locale != null) {
                return locale.toString();
            }
        }

        return Locale.CHINA.toString();
    }


    public static String getText(String code, String ... params) {
        if(StringUtils.isBlank(code)) {
            return code;
        } else {
            Locale locale = Locale.CHINA;

            try {
                locale = LocaleUtils.toLocale(getLang());
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            }

            try {
                return I18nUtils.i18nMessageSource().getMessage(code, params, locale);
            } catch (NoSuchMessageException var5) {
                return (params != null && params.length > 0) ? new MessageFormat(code != null?code:"", LocaleContextHolder.getLocale()).format(params):code;
            }
        }
    }
}
