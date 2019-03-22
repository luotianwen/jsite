package com.jsite.common.beetl.fn;

import com.jsite.common.config.Global;
import org.beetl.core.Context;
import org.beetl.core.Function;

public class Lang implements Function {
    @Override
    public Object call(Object[] paras, Context ctx) {
        return Global.getLang();
    }
}
