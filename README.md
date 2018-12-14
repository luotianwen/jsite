# JSite 后台管理系统·快速开发框架

### 平台介绍
1. 框架基于Maven构建，拆分成多个子模块，层次结构清晰。可用于所有Web应用，如企业后台管理系统、OA系统、CMS、CRM等。
2. 框架本身集成了最新的 **Flowable工作流引擎** https://www.flowable.org/ ，内置了流程流程设计器moduler，有完整的流程管理模块，可以轻松实现流程的在线设计、部署，流程发起、流程流转跟踪等一系列OA办公业务。
3. 框架主模块包含：系统管理、流程管理、在线办公、文件管理、代码生成。系统管理子模块--用户管理、机构管理、区域管理、菜单管理、角色管理、字典管理、日志查询、连接池监视，实现权限精细控制，支持跨部门、跨公司数据权限授权。
4. 框架支持前后端基础代码自动生成，免去重复劳动。

### 软件架构·技术选型
#### 环境要求
1. JDK 8
2. Tomcat 8
3. Apache Maven 3.x
#### 基础框架
1. Spring Boot 2.0.4
2. Apache Shiro 1.4
3. Spring Framework 5.0.8
4. Jackson 2.9.5
5. Flowable 6.4.0 (工作流引擎)
6. Ehcache 2.6.11
#### 持久层
1. Alibaba Druid 1.0.18
2. Apache MyBatis 3.4.6
3. Hibernate Validation 6.0
#### 视图层
1. Beetl 2.8.6
2. CSS框架：Bootstrap 3.3  AdminLTE 2.4.8
3. 其他组件：jquery 1.12.4  jqGrid 4.7  jquery-zTree 3.5  jquery-toastr  jquery-validation  layer 3.1 webuploader  select2.4.0 cropper3.1.3

### 使用说明
1. 框架基于IntelliJ IDEA 开发
2. 初始化数据库 jsite-web module 下 jsite-init.sql

### 系统展示
登录
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E7%99%BB%E5%BD%95.png)
主页
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E4%B8%BB%E9%A1%B5.png)
用户管理
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86.png)
区域管理
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E5%8C%BA%E5%9F%9F%E7%AE%A1%E7%90%86.png)
菜单管理
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E8%8F%9C%E5%8D%95%E7%AE%A1%E7%90%86.png)
角色管理
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%86.png)
角色分配
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E8%A7%92%E8%89%B2%E5%88%86%E9%85%8D.png)
流程模型管理
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E6%B5%81%E7%A8%8B-%E6%A8%A1%E5%9E%8B%E7%AE%A1%E7%90%86.png)
流程设计器
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E6%B5%81%E7%A8%8B-%E6%B5%81%E7%A8%8B%E8%AE%BE%E8%AE%A1%E5%99%A8.png)
流程管理
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E6%B5%81%E7%A8%8B%E7%AE%A1%E7%90%86.png)
流程部署
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E6%B5%81%E7%A8%8B%E9%83%A8%E7%BD%B2.png)
文件夹管理
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E6%96%87%E4%BB%B6%E5%A4%B9%E7%AE%A1%E7%90%86.png)
文件管理
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E6%96%87%E4%BB%B6%E7%AE%A1%E7%90%86.png)
文件上传
![image](https://gitee.com/lruijun/JSite/blob/master/img/%E6%96%87%E4%BB%B6%E4%B8%8A%E4%BC%A0.png)


### 参与贡献

1. Fork 本项目
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request



#### 码云特技

1. 使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2. 码云官方博客 [blog.gitee.com](https://blog.gitee.com)
3. 你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解码云上的优秀开源项目
4. [GVP](https://gitee.com/gvp) 全称是码云最有价值开源项目，是码云综合评定出的优秀开源项目
5. 码云官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6. 码云封面人物是一档用来展示码云会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)