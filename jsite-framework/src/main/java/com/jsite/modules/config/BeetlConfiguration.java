package com.jsite.modules.config;


import org.beetl.core.resource.ClasspathResourceLoader;
import org.beetl.ext.spring.BeetlGroupUtilConfiguration;
import org.beetl.ext.spring.BeetlSpringViewResolver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternUtils;

/**
 * 控制器支持类
 ** @author liuruijun
 * @version 2018-10-23
 */

@Configuration
public class BeetlConfiguration {
    protected Logger logger = LoggerFactory.getLogger(getClass());

    @Value("${web.view.suffix}")
    private String viewSuffix;

    @Autowired
    protected ResourceLoader resourceLoader;

    @Value("${beetl.root.path}") String templatesPath;//模板根目录 ，比如 "templates"
    @Bean(name = "beetlConfig")
    public BeetlGroupUtilConfiguration getBeetlGroupUtilConfiguration() {
        BeetlGroupUtilConfiguration beetlGroupUtilConfiguration = new BeetlGroupUtilConfiguration();
        //获取Spring Boot 的ClassLoader
        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        if(loader==null){
            loader = BeetlConfiguration.class.getClassLoader();
        }

        ResourcePatternResolver resouce = ResourcePatternUtils.getResourcePatternResolver(resourceLoader);
        //额外的配置，可以覆盖默认配置，一般不需要
        beetlGroupUtilConfiguration.setConfigFileResource(resouce.getResource("classpath:config/beetl.properties"));
        ClasspathResourceLoader cploder = new ClasspathResourceLoader(loader, templatesPath);

        beetlGroupUtilConfiguration.setResourceLoader(cploder);
        beetlGroupUtilConfiguration.init();
//        //如果使用了优化编译器，涉及到字节码操作，需要添加ClassLoader
//        beetlGroupUtilConfiguration.getGroupTemplate().setClassLoader(loader);
        return beetlGroupUtilConfiguration;

    }

//    @Bean(initMethod = "init", name = "beetlConfig")
//    public BeetlGroupUtilConfiguration getBeetlGroupUtilConfiguration() {
//        BeetlGroupUtilConfiguration beetlGroupUtilConfiguration = new BeetlGroupUtilConfiguration();
//        ResourcePatternResolver patternResolver = ResourcePatternUtils.getResourcePatternResolver(new DefaultResourceLoader());
//        try {
//            // WebAppResourceLoader 配置root路径是关键
//            WebAppResourceLoader webAppResourceLoader =
//                    new WebAppResourceLoader(patternResolver.getResource("classpath:/views/").getFile().getPath());
//            beetlGroupUtilConfiguration.setResourceLoader(webAppResourceLoader);
//
//            logger.debug("BEETL rootPath------------------" + webAppResourceLoader.getRoot());
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        //读取配置文件信息
//        return beetlGroupUtilConfiguration;
//    }

    @Bean(name = "beetlViewResolver")
    public BeetlSpringViewResolver getBeetlSpringViewResolver(@Qualifier("beetlConfig") BeetlGroupUtilConfiguration beetlGroupUtilConfiguration) {
        BeetlSpringViewResolver beetlSpringViewResolver = new BeetlSpringViewResolver();
        beetlSpringViewResolver.setContentType("text/html;charset=UTF-8");
        beetlSpringViewResolver.setOrder(0);
        beetlSpringViewResolver.setViewNames("modules/**", "error/**");
//        beetlSpringViewResolver.setPrefix("modules/");
        beetlSpringViewResolver.setSuffix(viewSuffix);
        beetlSpringViewResolver.setConfig(beetlGroupUtilConfiguration);
        return beetlSpringViewResolver;
    }
}
