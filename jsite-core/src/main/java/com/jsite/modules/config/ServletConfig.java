package com.jsite.modules.config;

import com.alibaba.druid.support.http.StatViewServlet;
import com.jsite.common.servlet.ValidateCodeServlet;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Servlet 配置
 * @author liuruijun
 * @version 2017年11月30日
 */
@Configuration
public class ServletConfig {

    // 使用代码注册Servlet（不需要@ServletComponentScan注解）
    @Bean
    public ServletRegistrationBean validateCodeServlet() {
        return new ServletRegistrationBean(new ValidateCodeServlet(), "/servlet/validateCodeServlet");// ServletName默认值为首字母小写，即myServlet
    }


    // 使用代码注册Servlet（不需要@ServletComponentScan注解）
    @Bean
    public ServletRegistrationBean druidStatViewServlet() {
        return new ServletRegistrationBean(new StatViewServlet(), "/druid/*");
    }

}
