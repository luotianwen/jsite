package com.jsite;

import com.jsite.common.config.Global;
import com.jsite.common.io.PropertiesUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.liquibase.LiquibaseAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.UserDetailsServiceAutoConfiguration;
import org.springframework.boot.autoconfigure.web.servlet.MultipartAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(scanBasePackages={"com.jsite.modules", "org.flowable.ui.modeler", "org.flowable.ui.common"},
        exclude = {
                SecurityAutoConfiguration.class,
                UserDetailsServiceAutoConfiguration.class,
                LiquibaseAutoConfiguration.class,
                MultipartAutoConfiguration.class})
public class JSiteWebApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(JSiteWebApplication.class);
        app.setDefaultProperties(PropertiesUtils.getInstance().getProperties());
        app.run(args);

        printKeyLoadMessage();
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        this.setRegisterErrorPageFilter(false);
        builder.properties(PropertiesUtils.getInstance().getProperties());
        return builder.sources(JSiteWebApplication.class);
    }


    /**
     * 获取Key加载信息
     */
    public static boolean printKeyLoadMessage(){
        StringBuilder sb = new StringBuilder();
        sb.append("\r\n======================================================================\r\n");
        sb.append("\r\n    欢迎使用 "+Global.getProperty("productName")+"  - Powered By http://jsite.org.cn\r\n");
        sb.append("\r\n======================================================================\r\n");
        System.out.println(sb.toString());
        return true;
    }
}
