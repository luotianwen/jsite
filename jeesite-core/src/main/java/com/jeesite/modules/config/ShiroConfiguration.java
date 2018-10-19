package com.jeesite.modules.config;

import com.jeesite.common.idgen.IdGenerate;
import com.jeesite.common.security.shiro.session.CacheSessionDAO;
import com.jeesite.common.security.shiro.session.SessionManager;
import com.jeesite.modules.sys.security.FormAuthenticationFilter;
import com.jeesite.modules.sys.security.SystemAuthorizingRealm;
import net.sf.ehcache.CacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.cas.CasFilter;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.Cookie;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternUtils;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfiguration {

    @Autowired
    protected ResourceLoader resourceLoader;

    @Autowired
    protected SystemAuthorizingRealm systemAuthorizingRealm;

    @Autowired
    protected FormAuthenticationFilter formAuthenticationFilter;

    @Value("${ehcache.configFile}")
    private String configFile;

    @Value("${session.sessionTimeout}")
    private String sessionTimeout;

    @Value("${session.sessionTimeoutClean}")
    private String sessionTimeoutClean;

    @Value("${adminPath}")
    private String adminPath;

    @Bean
    public static LifecycleBeanPostProcessor getLifecycleBeanPostProcessor(){
        return new LifecycleBeanPostProcessor();
    }


    /**
     * ShiroFilterFactoryBean 处理拦截资源文件问题。
     * 注意：单独一个ShiroFilterFactoryBean配置是或报错的，因为在
     * 初始化ShiroFilterFactoryBean的时候需要注入：SecurityManager
     *
     Filter Chain定义说明
     1、一个URL可以配置多个Filter，使用逗号分隔
     2、当设置多个过滤器时，全部验证通过，才视为通过
     3、部分过滤器可指定参数，如perms，roles
     *
     */
    @Bean(name="shiroFilter")
    public ShiroFilterFactoryBean shiroFilter(SecurityManager securityManager){
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        shiroFilterFactoryBean.setLoginUrl(adminPath+"/login");
        shiroFilterFactoryBean.setSuccessUrl(adminPath+"?login");

        Map<String, Filter> filterMap = new HashMap<>();
        filterMap.put("cas", casFilter());
        filterMap.put("authc", formAuthenticationFilter);
        shiroFilterFactoryBean.setFilters(filterMap);

        LinkedHashMap<String, String> filterChainDefinitionMap=new LinkedHashMap<>();
        filterChainDefinitionMap.put("/static/**","anon");
        filterChainDefinitionMap.put("/userfiles/**","anon");
        filterChainDefinitionMap.put(adminPath+"/cas","cas");
        filterChainDefinitionMap.put(adminPath+"/login","authc");
        filterChainDefinitionMap.put(adminPath+"/logout","logout");
        filterChainDefinitionMap.put(adminPath+"/**","user");
        filterChainDefinitionMap.put("/act/editor/**","user");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);

        return shiroFilterFactoryBean;
    }

    @Bean(name="securityManager")
    public SecurityManager securityManager(){
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        //设置realm.
        securityManager.setRealm(systemAuthorizingRealm);
        // 自定义缓存实现 使用redis
        securityManager.setCacheManager(shiroCacheManager());
        // 自定义session管理 使用redis
        securityManager.setSessionManager(sessionManager());
        return securityManager;
    }

    @Bean
    public EhCacheManager shiroCacheManager() {
        EhCacheManager ehCacheManager = new EhCacheManager();
        ehCacheManager.setCacheManager(cacheManager());
        return ehCacheManager;
    }

    @Bean
    public CacheManager cacheManager() {
        EhCacheManagerFactoryBean ehCacheManagerFactoryBean = new EhCacheManagerFactoryBean();
        ResourcePatternResolver resource = ResourcePatternUtils.getResourcePatternResolver(resourceLoader);
        ehCacheManagerFactoryBean.setConfigLocation(resource.getResource("classpath:" + configFile));

        return ehCacheManagerFactoryBean.getObject();
    }

    @Bean
    public SessionManager sessionManager() {
        SessionManager sessionManager = new SessionManager();
        sessionManager.setSessionDAO(sessionDAO());
        sessionManager.setGlobalSessionTimeout(Long.valueOf(sessionTimeout));
        sessionManager.setSessionValidationInterval(Long.valueOf(sessionTimeoutClean));
        sessionManager.setSessionValidationSchedulerEnabled(true);
        sessionManager.setSessionIdCookie(sessionIdCookie());
        sessionManager.setSessionIdCookieEnabled(true);
        return sessionManager;
    }

    @Bean
    public CacheSessionDAO sessionDAO() {
        CacheSessionDAO cacheSessionDAO = new CacheSessionDAO();
        cacheSessionDAO.setSessionIdGenerator(idGenerate());
        cacheSessionDAO.setActiveSessionsCacheName("activeSessionsCache");
        cacheSessionDAO.setCacheManager(shiroCacheManager());
        return cacheSessionDAO;
    }

    @Bean
    public IdGenerate idGenerate() {
        IdGenerate idGenerate = new IdGenerate();
        return idGenerate;
    }

    @Bean
    public Cookie sessionIdCookie() {
        SimpleCookie simpleCookie = new SimpleCookie("jeesite.session.id");
        return simpleCookie;
    }


    @Bean
    public CasFilter casFilter() {
        CasFilter casFilter = new CasFilter();
        casFilter.setFailureUrl("");
        return casFilter;
    }

    @Bean
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        defaultAdvisorAutoProxyCreator.setProxyTargetClass(true);
        return defaultAdvisorAutoProxyCreator;
    }

    /**
     * 开启shiro aop注解支持.
     * 使用代理方式;所以需要开启代码支持;
     * @param securityManager
     * @return
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager){
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

//    @Bean(name = "exceptionHandler")
//    public HandlerExceptionResolver handlerExceptionResolver() {
//        return new MyExceptionHandler();
//    }
}
