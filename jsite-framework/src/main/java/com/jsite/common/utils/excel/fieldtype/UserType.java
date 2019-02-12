/**
 * Copyright &copy; 2017-2019 <a href="https://gitee.com/baseweb/JSite">JSite</a> All rights reserved.
 */
package com.jsite.common.utils.excel.fieldtype;

import com.jsite.common.lang.StringUtils;
import com.jsite.modules.sys.entity.User;
import com.jsite.modules.sys.utils.UserUtils;

/**
 * 字段类型转换
 * @author liuruijun
 * @version 2019-01-24
 */
public class UserType {

	/**
	 * 获取对象值（导入）
	 */
	public static Object getValue(String val) {
		for (User user : UserUtils.getUserList()){
			if (StringUtils.trimToEmpty(val).equals(user.getName())){
				return user;
			}
		}

		User u = new User();
		u.setName(val);
		return u;
	}

	/**
	 * 设置对象值（导出）
	 */
	public static String setValue(Object val) {
		if (val != null && ((User)val).getName() != null){
			return ((User)val).getName();
		}
		return "";
	}
}
