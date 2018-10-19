package com.jeesite.common.beetl.fn;

import com.jeesite.common.lang.ObjectUtils;
import com.jeesite.common.lang.StringUtils;
import com.jeesite.modules.sys.utils.UserUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.beetl.core.Context;
import org.beetl.core.Function;

public class HasPermi implements Function {

	@Override
	public Object call(Object[] paras, Context ctx) {
		// TODO Auto-generated method stub
		String permissions = ObjectUtils.toString(paras[0]);
		if (StringUtils.isBlank(permissions)) {
			return false;
		} else {
			boolean option = true;// || true;   &&false
			if(paras.length >= 2) {
				option = (Boolean) paras[1];
	        }
			
			boolean[] bArr = UserUtils.getSubject().isPermitted(StringUtils.split(permissions, ","));
			
			return option?BooleanUtils.or(bArr):Boolean.valueOf(BooleanUtils.and(bArr));
		}
	}

}
