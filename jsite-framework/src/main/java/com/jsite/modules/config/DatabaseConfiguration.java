/* Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.jsite.modules.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.jsite.common.config.Global;
import com.jsite.common.lang.ObjectUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.ibatis.io.VFS;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.ResourcePatternUtils;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 控制器支持类
 ** @author liuruijun
 * @version 2018-10-23
 */
@Configuration
public class DatabaseConfiguration {

    private static final Logger LOGGER = LoggerFactory.getLogger(DatabaseConfiguration.class);

    @Autowired
    protected ResourceLoader resourceLoader;

    protected static Properties databaseTypeMappings = getDefaultDatabaseTypeMappings();

    public static final String DATABASE_TYPE_H2 = "h2";
    public static final String DATABASE_TYPE_HSQL = "hsql";
    public static final String DATABASE_TYPE_MYSQL = "mysql";
    public static final String DATABASE_TYPE_ORACLE = "oracle";
    public static final String DATABASE_TYPE_POSTGRES = "postgres";
    public static final String DATABASE_TYPE_MSSQL = "mssql";
    public static final String DATABASE_TYPE_DB2 = "db2";

    public static Properties getDefaultDatabaseTypeMappings() {
        Properties databaseTypeMappings = new Properties();
        databaseTypeMappings.setProperty("H2", DATABASE_TYPE_H2);
        databaseTypeMappings.setProperty("HSQL Database Engine", DATABASE_TYPE_HSQL);
        databaseTypeMappings.setProperty("MySQL", DATABASE_TYPE_MYSQL);
        databaseTypeMappings.setProperty("Oracle", DATABASE_TYPE_ORACLE);
        databaseTypeMappings.setProperty("PostgreSQL", DATABASE_TYPE_POSTGRES);
        databaseTypeMappings.setProperty("Microsoft SQL Server", DATABASE_TYPE_MSSQL);
        databaseTypeMappings.setProperty(DATABASE_TYPE_DB2, DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/NT", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/NT64", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2 UDP", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/LINUX", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/LINUX390", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/LINUXX8664", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/LINUXZ64", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/LINUXPPC64", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/400 SQL", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/6000", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2 UDB iSeries", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/AIX64", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/HPUX", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/HP64", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/SUN", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/SUN64", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/PTX", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2/2", DATABASE_TYPE_DB2);
        databaseTypeMappings.setProperty("DB2 UDB AS400", DATABASE_TYPE_DB2);
        return databaseTypeMappings;
    }


    
    
//    <!-- MyBatis begin -->
//    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
//        <property name="dataSource" ref="dataSource"/>
//        <property name="typeAliasesPackage" value="com.jsite"/>
//        <property name="typeAliasesSuperType" value="com.jsite.common.persistence.BaseEntity"/>
//        <property name="mapperLocations" value="classpath:/mappings/**/*.xml"/>
//		<property name="configLocation" value="classpath:/mybatis-config.xml"></property>
//    </bean>
    @Bean
    @Primary
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) {
        VFS.addImplClass(SpringBootVFS.class);
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        //解决myBatis下 不能嵌套jar文件的问题
//        sqlSessionFactoryBean.setVfs(SpringBootVFS.class);
        sqlSessionFactoryBean.setTypeAliasesPackage("com.jsite.modules");
		sqlSessionFactoryBean.setTypeAliasesSuperType(com.jsite.common.persistence.BaseEntity.class);
        sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("mybatis/mybatis-config.xml"));
        
        String databaseType = initDatabaseType(dataSource);
        if (databaseType == null) {
            throw new RuntimeException("couldn't deduct database type");
        }

        try {

            Resource[] resource1 = new Resource[0];
            if(Global.isFlowableEnable()) {
                Properties properties = new Properties();
                properties.put("prefix", "");
                properties.put("blobType", "BLOB");
                properties.put("boolValue", "TRUE");

                properties.load(this.getClass().getClassLoader().getResourceAsStream("org/flowable/db/properties/" + databaseType + ".properties"));
                sqlSessionFactoryBean.setConfigurationProperties(properties);

                resource1 = ResourcePatternUtils.getResourcePatternResolver(resourceLoader).getResources("classpath*:/META-INF/modeler-mybatis-mappings/*.xml");
            }

            Resource[] resource2 = ResourcePatternUtils.getResourcePatternResolver(resourceLoader).getResources("classpath*:/mappings/**/*.xml");
            Resource[] mapperLocations = ArrayUtils.addAll(resource1, resource2);

            sqlSessionFactoryBean.setMapperLocations(mapperLocations);
            sqlSessionFactoryBean.afterPropertiesSet();

            return sqlSessionFactoryBean.getObject();
        } catch (Exception e) {
            throw new RuntimeException("Could not create sqlSessionFactory", e);
        }

    }
    
    
//    <bean id="SqlSessionTemplate" class="org.mybatis.spring.SqlSessionTemplate">
//    <constructor-arg index="0" ref="sqlSessionFactory" />
//    </bean>
    @Bean(destroyMethod = "clearCache") // destroyMethod: see https://github.com/mybatis/old-google-code-issues/issues/778
    public SqlSessionTemplate SqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

//    <!-- 扫描basePackage下所有以@MyBatisDao注解的接口 -->
//    <bean id="mapperScannerConfigurer" class="org.mybatis.spring.mapper.MapperScannerConfigurer">
//        <property name="sqlSessionFactoryBeanName" value="sqlSessionFactory" />
//        <property name="basePackage" value="com.jsite"/>
//        <property name="annotationClass" value="com.jsite.common.persistence.annotation.MyBatisDao"/>
//    </bean>
    @Bean
	public MapperScannerConfigurer mapperScannerConfigurer(SqlSessionFactory sqlSessionFactory) {
		MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
		mapperScannerConfigurer.setBasePackage("com.jsite.modules");
		mapperScannerConfigurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
		mapperScannerConfigurer.setAnnotationClass(com.jsite.common.persistence.annotation.MyBatisDao.class);
		return mapperScannerConfigurer;
	}
    
    
//    <!-- 定义事务 -->
//	<bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
//		<property name="dataSource" ref="dataSource" />
//	</bean>
    @Bean
    public DataSourceTransactionManager transactionManager(DataSource dataSource) {
    	DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(dataSource);
    	return transactionManager;
    }

	@Bean
    @Primary
	public DruidDataSource dataSource() throws SQLException {
		DruidDataSource dataSource = new DruidDataSource();
		dataSource.setDbType(Global.getProperty("jdbc.type"));
		dataSource.setDriverClassName(Global.getProperty("jdbc.driver"));//"com.mysql.jdbc.Driver"
		dataSource.setUrl(Global.getProperty("jdbc.url"));
		dataSource.setUsername(Global.getProperty("jdbc.username"));
		dataSource.setPassword(Global.getProperty("jdbc.password"));
		dataSource.setInitialSize(ObjectUtils.toInteger(Global.getProperty("jdbc.pool.init")));
		dataSource.setMinIdle(ObjectUtils.toInteger(Global.getProperty("jdbc.pool.minIdle")));
		dataSource.setMaxActive(ObjectUtils.toInteger(Global.getProperty("jdbc.pool.maxActive")));
		dataSource.setMaxWait(60000);
		dataSource.setTimeBetweenEvictionRunsMillis(60000);
		dataSource.setMinEvictableIdleTimeMillis(300000);
		dataSource.setValidationQuery(Global.getProperty("jdbc.testSql"));
		dataSource.setTestWhileIdle(true);
		dataSource.setTestOnBorrow(false);
		dataSource.setTestOnReturn(false);
		dataSource.setPoolPreparedStatements(true);
		dataSource.setMaxPoolPreparedStatementPerConnectionSize(20);
		dataSource.setFilters("stat");
		
		return dataSource;
	}

    protected String initDatabaseType(DataSource dataSource) {
        String databaseType = null;
        Connection connection = null;
        try {
            connection = dataSource.getConnection();
            DatabaseMetaData databaseMetaData = connection.getMetaData();
            String databaseProductName = databaseMetaData.getDatabaseProductName();
            LOGGER.info("database product name: '{}'", databaseProductName);
            databaseType = databaseTypeMappings.getProperty(databaseProductName);
            if (databaseType == null) {
                throw new RuntimeException("couldn't deduct database type from database product name '" + databaseProductName + "'");
            }
            LOGGER.info("using database type: {}", databaseType);

        } catch (SQLException e) {
            LOGGER.error("Exception while initializing Database connection", e);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                LOGGER.error("Exception while closing the Database connection", e);
            }
        }

        return databaseType;
    }
}
