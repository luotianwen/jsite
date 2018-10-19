package com.jeesite.common.beetl.fn;

import com.jeesite.common.lang.StringUtils;
import org.beetl.core.Context;
import org.beetl.core.Function;

public class IsBlank implements Function {

	@Override
	public Object call(Object[] paras, Context ctx) {
		return StringUtils.isBlank((CharSequence) paras[0]);
	}
	
}
