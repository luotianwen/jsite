package com.jeesite;

import com.jeesite.common.io.PropertiesUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.liquibase.LiquibaseAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.UserDetailsServiceAutoConfiguration;
import org.springframework.boot.autoconfigure.web.servlet.MultipartAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(scanBasePackages={"com.jeesite.modules", "org.flowable.ui.modeler", "org.flowable.ui.common"},
        exclude = {
                SecurityAutoConfiguration.class,
                UserDetailsServiceAutoConfiguration.class,
                LiquibaseAutoConfiguration.class,
                MultipartAutoConfiguration.class})
public class JeesiteWebApplication  extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(JeesiteWebApplication.class);
        app.setDefaultProperties(PropertiesUtils.getInstance().getProperties());
        app.run(args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        this.setRegisterErrorPageFilter(false);
        builder.properties(PropertiesUtils.getInstance().getProperties());
        return builder.sources(JeesiteWebApplication.class);
    }
}
