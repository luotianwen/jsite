package com.jeesite.common.beetl.fn;

import com.jeesite.common.config.Global;
import com.jeesite.common.lang.ObjectUtils;
import org.beetl.core.Context;
import org.beetl.core.Function;

public class Text implements Function {


    @Override
    public Object call(Object[] paras, Context ctx) {
        Object objText = paras[0];
        if(objText == null) {
            return "";
        }

        String text = ObjectUtils.toString(objText);

        return Global.getProperty(text, "");
    }


}
