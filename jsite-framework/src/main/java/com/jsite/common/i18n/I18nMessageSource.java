package com.jsite.common.i18n;

import org.springframework.context.support.ReloadableResourceBundleMessageSource;

import java.text.MessageFormat;
import java.util.Locale;

public class I18nMessageSource extends ReloadableResourceBundleMessageSource {


    public I18nMessageSource() {
        this.setDefaultEncoding("UTF-8");
        this.setBasename("classpath:/i18n/messages");
        this.setCacheSeconds(60);
    }


    @Override
    protected MessageFormat resolveCode(String code, Locale locale) {
        return super.resolveCode(code, locale);
    }

    @Override
    protected String resolveCodeWithoutArguments(String code, Locale locale) {
        return super.resolveCodeWithoutArguments(code, locale);
    }

    @Override
    public void clearCache() {
        super.clearCache();
    }
}
