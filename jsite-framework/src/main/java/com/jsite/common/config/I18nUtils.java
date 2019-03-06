package com.jsite.common.config;

import com.jsite.common.i18n.I18nLocaleResolver;
import com.jsite.common.i18n.I18nMessageSource;
import com.jsite.common.utils.SpringContextHolder;

final class I18nUtils {
    private static I18nMessageSource I18N_MESSAGE_SOURCE = (I18nMessageSource)SpringContextHolder.getBean(I18nMessageSource.class);
    private static I18nLocaleResolver I18N_LOCALE_RESOLVER = (I18nLocaleResolver)SpringContextHolder.getBean(I18nLocaleResolver.class);


    static I18nMessageSource i18nMessageSource() {
        return I18N_MESSAGE_SOURCE;
    }

    static I18nLocaleResolver i18nLocaleResolver() {
        return I18N_LOCALE_RESOLVER;
    }
}
