package com.jsite.common.i18n;

import com.jsite.common.beetl.i18n.JSiteLocaleResolver;
import com.jsite.common.config.Global;
import org.springframework.context.i18n.LocaleContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

public class I18nLocaleResolver extends JSiteLocaleResolver {

    private static Boolean enabled;

    public static boolean enabled() {
        if(enabled == null) {
            if(!Global.getPropertyBoolean("i18nEnable", "true").booleanValue()) {
                enabled = Boolean.valueOf(false);
            } else {
                enabled = Boolean.valueOf(true);
            }
        }

        return enabled.booleanValue();
    }

    @Override
    public LocaleContext resolveLocaleContext(HttpServletRequest request) {
        return super.resolveLocaleContext(request);
    }

    @Override
    public Locale resolveLocale(HttpServletRequest request) {
        return super.resolveLocale(request);
    }

    @Override
    public void setLocaleContext(HttpServletRequest request, HttpServletResponse response, LocaleContext localeContext) {
        super.setLocaleContext(request, response, localeContext);
    }


    @Override
    protected Locale determineDefaultLocale(HttpServletRequest request) {
        return super.determineDefaultLocale(request);
    }
}
