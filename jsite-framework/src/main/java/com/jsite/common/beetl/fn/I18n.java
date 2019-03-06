package com.jsite.common.beetl.fn;

import com.jsite.common.config.Global;
import com.jsite.common.lang.ObjectUtils;
import org.beetl.core.Context;
import org.beetl.core.Function;

public class I18n implements Function {


    @Override
    public Object call(Object[] paras, Context ctx) {
        Object obj = paras[0];
        if (obj == null) {
            return "";
        } else {
            String code = (String) paras[0];
            String[] arr = new String[paras.length-1];
            for (int i=1; i<paras.length; i++) {
                arr[i-1] = ObjectUtils.toString(paras[i]);
            }

            return Global.getText(code, (String[])arr);
        }
    }
}
