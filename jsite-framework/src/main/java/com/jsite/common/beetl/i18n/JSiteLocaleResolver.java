package com.jsite.common.beetl.i18n;

import com.jsite.common.i18n.I18nLocaleResolver;
import org.springframework.context.i18n.LocaleContext;
import org.springframework.context.i18n.SimpleLocaleContext;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

public class JSiteLocaleResolver extends CookieLocaleResolver {

    public static final String DEFAULT_SESSION_NAME = I18nLocaleResolver.class.getName() + ".LOCALE";

    @Override
    public Locale resolveLocale(HttpServletRequest request) {
        return !I18nLocaleResolver.enabled()?Locale.CHINA:super.resolveLocale(request);
    }

    public JSiteLocaleResolver() {
        super();
        this.setDefaultLocale(Locale.CHINA);
    }

    @Override
    public LocaleContext resolveLocaleContext(HttpServletRequest request) {
        return !I18nLocaleResolver.enabled()?new SimpleLocaleContext(Locale.CHINA):super.resolveLocaleContext(request);
    }

    @Override
    public void setLocaleContext(HttpServletRequest request, HttpServletResponse response, LocaleContext localeContext) {
        super.setLocaleContext(request, response, localeContext);
        request.getSession().setAttribute(DEFAULT_SESSION_NAME, localeContext.getLocale());
    }

    @Override
    protected Locale determineDefaultLocale(HttpServletRequest request) {
        Locale locale = (Locale) request.getSession().getAttribute(DEFAULT_SESSION_NAME);
        return locale != null?locale:super.determineDefaultLocale(request);
    }

}
