package com.jsite.modules.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jsite.common.config.Global;
import com.jsite.common.i18n.I18nLocaleResolver;
import com.jsite.common.i18n.I18nMessageSource;
import com.jsite.common.mapper.JsonMapper;
import com.jsite.common.persistence.BaseEntity;
import com.jsite.common.utils.SpringContextHolder;
import com.jsite.modules.sys.interceptor.LogInterceptor;
import com.thoughtworks.xstream.io.xml.StaxDriver;
import org.beetl.ext.spring.BeetlSpringViewResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Primary;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.MediaType;
import org.springframework.http.converter.*;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.converter.support.AllEncompassingFormHttpMessageConverter;
import org.springframework.http.converter.xml.MarshallingHttpMessageConverter;
import org.springframework.http.converter.xml.SourceHttpMessageConverter;
import org.springframework.oxm.xstream.XStreamMarshaller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

/**
 * 控制器支持类
 ** @author liuruijun
 * @version 2018-10-23
 */
@Configuration
public class WebMvcConfiguration extends WebMvcConfigurationSupport {

    @Value("${adminPath}")
    private String adminPath;

    @Autowired
    protected BeetlSpringViewResolver beetlSpringViewResolver;

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/views/modules/");
        resolver.setSuffix(".jsp");
        resolver.setOrder(256);
        registry.viewResolver(resolver);

        registry.viewResolver(beetlSpringViewResolver);
//        MappingJackson2JsonView mappingJackson2JsonView = new MappingJackson2JsonView();
//        mappingJackson2JsonView.setPrettyPrint(false);
//        registry.enableContentNegotiation(true);
    }


    @Override
    public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
//        configurer
////                .defaultContentType(MediaType.TEXT_HTML)
//                .mediaType("xml", MediaType.APPLICATION_XML)
//                .mediaType("json", MediaType.APPLICATION_JSON)
//                .favorPathExtension(false)
//                .ignoreAcceptHeader(true)
//                .favorParameter(false);
//        configurer.favorPathExtension(false)
//                .ignoreAcceptHeader(true)
//                .favorParameter(false).defaultContentType(MediaType.APPLICATION_JSON);
//        configurer.defaultContentType(MediaType.APPLICATION_JSON);
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
        registry.addResourceHandler("/swagger/**")
                .addResourceLocations("classpath:/swagger/");
//        registry.addResourceHandler("/modler/**")
//                .addResourceLocations("classpath:/modler/");
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(stringHttpMessageConverter());
        converters.add(mappingJackson2HttpMessageConverter());
        converters.add(marshallingHttpMessageConverter());
        converters.add(new ByteArrayHttpMessageConverter());

        converters.add(new ResourceHttpMessageConverter());
        converters.add(new ResourceRegionHttpMessageConverter());
        converters.add(new SourceHttpMessageConverter());
        converters.add(new AllEncompassingFormHttpMessageConverter());

    }

    public StringHttpMessageConverter stringHttpMessageConverter() {
        return new StringHttpMessageConverter(Charset.forName("UTF-8"));
    }

    public MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter() {
        MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter = new MappingJackson2HttpMessageConverter();
        List<MediaType> mediaTypes = new ArrayList<MediaType>();
        mediaTypes.add(MediaType.APPLICATION_JSON_UTF8);
        mediaTypes.add(MediaType.APPLICATION_FORM_URLENCODED);
        mappingJackson2HttpMessageConverter.setSupportedMediaTypes(mediaTypes);
        mappingJackson2HttpMessageConverter.setPrettyPrint(false);
        mappingJackson2HttpMessageConverter.setObjectMapper(objectMapper());

        return mappingJackson2HttpMessageConverter;
    }

    @Bean
    public ObjectMapper objectMapper() {
        return new JsonMapper();
    }

    @Bean
    public LocaleResolver localeResolver() {
        return new I18nLocaleResolver();
    }

    @Primary
    @Bean
    public MessageSource reloadableResourceBundleMessageSource() {
        return new I18nMessageSource();
    }

    public MarshallingHttpMessageConverter marshallingHttpMessageConverter(){
        XStreamMarshaller xStreamMarshaller=new XStreamMarshaller();
        xStreamMarshaller.setStreamDriver(new StaxDriver());
        xStreamMarshaller.setAnnotatedClasses(BaseEntity.class);

        MarshallingHttpMessageConverter marshallingHttpMessageConverter = new MarshallingHttpMessageConverter(xStreamMarshaller);

        List<MediaType> mediaTypes = new ArrayList<MediaType>();
        mediaTypes.add(MediaType.APPLICATION_XML);
        marshallingHttpMessageConverter.setSupportedMediaTypes(mediaTypes);

        return marshallingHttpMessageConverter;
    }

//    public ByteArrayHttpMessageConverter byteArrayHttpMessageConverter() {
//        ByteArrayHttpMessageConverter byteArrayHttpMessageConverter = new ByteArrayHttpMessageConverter();
//        List<MediaType> mediaTypes = new ArrayList<MediaType>();
//        mediaTypes.add(MediaType.IMAGE_GIF);
//        mediaTypes.add(MediaType.IMAGE_JPEG);
//        mediaTypes.add(MediaType.IMAGE_PNG);
//        byteArrayHttpMessageConverter.setSupportedMediaTypes(mediaTypes);
//
//        return byteArrayHttpMessageConverter;
//    }

    @Bean
    @Lazy(false)
    @Order(-2147481648)
    public SpringContextHolder springUtils() {
        return new SpringContextHolder();
    }

    //拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(new LogInterceptor())
                .addPathPatterns(adminPath+"/**")
                .excludePathPatterns(
                        adminPath+"/",
                        adminPath+"/login",
                        adminPath+"/logout",
                        adminPath+"/sys/menu/tree",
                        adminPath+"/sys/menu/treeData",
                        adminPath+"/oa/oaNotify/self/count");
        //需要增加拦截器，动态设置Flowable用户信息
        if(Global.isFlowableEnable()) {
            try {
                Class<?> flowableHandlerInterceptor = Class.forName("com.jsite.modules.flowable.interceptor.FlowableHandlerInterceptor");
                registry.addInterceptor((HandlerInterceptor) flowableHandlerInterceptor.newInstance())
                        .addPathPatterns("/app/**");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            }
        }

        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("lang");
        registry.addInterceptor(localeChangeInterceptor);

        super.addInterceptors(registry);
    }


    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("redirect:" + adminPath);
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
    }

//    @Bean
//    public MultipartResolver multipartResolver() {
//        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
//        multipartResolver.setMaxUploadSize(500 * 1024 * 1024);
//        return multipartResolver;
//    }

//    @Bean
//    public SimpleMappingExceptionResolver simpleMappingExceptionResolver() {
//        SimpleMappingExceptionResolver simpleMappingExceptionResolver = new SimpleMappingExceptionResolver();
//        Properties properties = new Properties();
//        properties.setProperty("org.apache.shiro.authz.UnauthorizedException", "error/403");
//        properties.setProperty("java.lang.Throwable", "error/500");
//
//        simpleMappingExceptionResolver.setExceptionMappings(properties);
//
//        return simpleMappingExceptionResolver;
//    }

}
