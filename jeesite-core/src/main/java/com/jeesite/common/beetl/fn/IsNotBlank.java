package com.jeesite.common.beetl.fn;

import com.jeesite.common.lang.StringUtils;
import org.beetl.core.Context;
import org.beetl.core.Function;

public class IsNotBlank implements Function {

	@Override
	public Object call(Object[] paras, Context ctx) {
		return paras[0] == null?false:StringUtils.isNotBlank((CharSequence) paras[0]);
	}
	

}
