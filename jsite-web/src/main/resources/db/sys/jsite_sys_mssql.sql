
/* Drop Tables */

IF ObJECt_ID('[sys_role_office]') IS NOT NULL DROP TABLE [sys_role_office];
IF ObJECt_ID('[sys_user_role]') IS NOT NULL DROP TABLE [sys_user_role];
IF ObJECt_ID('[sys_user]') IS NOT NULL DROP TABLE [sys_user];
IF ObJECt_ID('[sys_office]') IS NOT NULL DROP TABLE [sys_office];
IF ObJECt_ID('[sys_area]') IS NOT NULL DROP TABLE [sys_area];
IF ObJECt_ID('[sys_dict]') IS NOT NULL DROP TABLE [sys_dict];
IF ObJECt_ID('[sys_log]') IS NOT NULL DROP TABLE [sys_log];
IF ObJECt_ID('[sys_mdict]') IS NOT NULL DROP TABLE [sys_mdict];
IF ObJECt_ID('[sys_role_menu]') IS NOT NULL DROP TABLE [sys_role_menu];
IF ObJECt_ID('[sys_menu]') IS NOT NULL DROP TABLE [sys_menu];
IF ObJECt_ID('[sys_role]') IS NOT NULL DROP TABLE [sys_role];




/* Create Tables */

-- 区域表
CREATE TABLE [sys_area]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 父级编号
	[parent_id] varchar(64) NOT NULL,
	-- 所有父级编号
	[parent_ids] varchar(2000) NOT NULL,
	-- 名称
	[name] nvarchar(100) NOT NULL,
	-- 排序
	[sort] decimal(10,0) NOT NULL,
	-- 是否叶子节点
	[tree_leaf] char NOT NULL,
	-- 树形层级
	[tree_level] int NOT NULL,
	-- 区域编码
	[code] varchar(100),
	-- 区域类型
	[type] char(1),
	-- 创建者
	[create_by] varchar(64) NOT NULL,
	-- 创建时间
	[create_date] datetime NOT NULL,
	-- 更新者
	[update_by] varchar(64) NOT NULL,
	-- 更新时间
	[update_date] datetime NOT NULL,
	-- 备注信息
	[remarks] nvarchar(255),
	-- 删除标记
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 字典表
CREATE TABLE [sys_dict]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 数据值
	[value] varchar(100) NOT NULL,
	-- 标签名
	[label] varchar(100) NOT NULL,
	-- 类型
	[type] varchar(100) NOT NULL,
	-- 描述
	[description] nvarchar(100) NOT NULL,
	-- 排序（升序）
	[sort] decimal(10,0) NOT NULL,
	-- 父级编号
	[parent_id] varchar(64) DEFAULT '0',
	-- 创建者
	[create_by] varchar(64) NOT NULL,
	-- 创建时间
	[create_date] datetime NOT NULL,
	-- 更新者
	[update_by] varchar(64) NOT NULL,
	-- 更新时间
	[update_date] datetime NOT NULL,
	-- 备注信息
	[remarks] nvarchar(255),
	-- 删除标记
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 日志表
CREATE TABLE [sys_log]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 日志类型
	[type] char(1) DEFAULT '1',
	-- 日志标题
	[title] nvarchar(500),
	-- 创建者
	[create_by] varchar(64),
	-- 创建时间
	[create_date] datetime,
	-- 操作IP地址
	[remote_addr] varchar(255),
	-- 用户代理
	[user_agent] varchar(255),
	-- 请求URI
	[request_uri] varchar(255),
	-- 操作方式
	[method] varchar(5),
	-- 操作提交的数据
	[params] text,
	-- 异常信息
	[exception] text,
	PRIMARY KEY ([id])
);


-- 多级字典表
CREATE TABLE [sys_mdict]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 父级编号
	[parent_id] varchar(64) NOT NULL,
	-- 所有父级编号
	[parent_ids] varchar(2000) NOT NULL,
	-- 名称
	[name] nvarchar(100) NOT NULL,
	-- 排序
	[sort] decimal(10,0) NOT NULL,
	-- 是否叶子节点
	[tree_leaf] char NOT NULL,
	-- 树形层级
	[tree_level] int NOT NULL,
	-- 描述
	[description] nvarchar(100),
	-- 创建者
	[create_by] varchar(64) NOT NULL,
	-- 创建时间
	[create_date] datetime NOT NULL,
	-- 更新者
	[update_by] varchar(64) NOT NULL,
	-- 更新时间
	[update_date] datetime NOT NULL,
	-- 备注信息
	[remarks] nvarchar(255),
	-- 删除标记
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 菜单表
CREATE TABLE [sys_menu]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 父级编号
	[parent_id] varchar(64) NOT NULL,
	-- 所有父级编号
	[parent_ids] varchar(2000) NOT NULL,
	-- 名称
	[name] nvarchar(100) NOT NULL,
	-- 排序
	[sort] decimal(10,0) NOT NULL,
	-- 是否叶子节点
	[tree_leaf] char NOT NULL,
	-- 树形层级
	[tree_level] int NOT NULL,
	-- 链接
	[href] varchar(2000),
	-- 目标
	[target] varchar(20),
	-- 图标
	[icon] varchar(100),
	-- 是否在菜单中显示
	[is_show] char(1) NOT NULL,
	-- 权限标识
	[permission] varchar(200),
	-- 创建者
	[create_by] varchar(64) NOT NULL,
	-- 创建时间
	[create_date] datetime NOT NULL,
	-- 更新者
	[update_by] varchar(64) NOT NULL,
	-- 更新时间
	[update_date] datetime NOT NULL,
	-- 备注信息
	[remarks] nvarchar(255),
	-- 删除标记
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 机构表
CREATE TABLE [sys_office]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 父级编号
	[parent_id] varchar(64) NOT NULL,
	-- 所有父级编号
	[parent_ids] varchar(2000) NOT NULL,
	-- 名称
	[name] nvarchar(100) NOT NULL,
	-- 排序
	[sort] decimal(10,0) NOT NULL,
	-- 是否叶子节点
	[tree_leaf] char NOT NULL,
	-- 树形层级
	[tree_level] int NOT NULL,
	-- 归属区域
	[area_id] varchar(64) NOT NULL,
	-- 区域编码
	[code] varchar(100),
	-- 机构类型
	[type] char(1) NOT NULL,
	-- 机构等级
	[grade] char(1) NOT NULL,
	-- 联系地址
	[address] nvarchar(255),
	-- 邮政编码
	[zip_code] varchar(100),
	-- 负责人
	[master] nvarchar(100),
	-- 电话
	[phone] nvarchar(200),
	-- 传真
	[fax] nvarchar(200),
	-- 邮箱
	[email] nvarchar(200),
	-- 是否启用
	[USEABLE] varchar(64),
	-- 主负责人
	[PRIMARY_PERSON] varchar(64),
	-- 副负责人
	[DEPUTY_PERSON] varchar(64),
	-- 创建者
	[create_by] varchar(64) NOT NULL,
	-- 创建时间
	[create_date] datetime NOT NULL,
	-- 更新者
	[update_by] varchar(64) NOT NULL,
	-- 更新时间
	[update_date] datetime NOT NULL,
	-- 备注信息
	[remarks] nvarchar(255),
	-- 删除标记
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 角色表
CREATE TABLE [sys_role]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 归属机构
	[office_id] varchar(64),
	-- 角色名称
	[name] nvarchar(100) NOT NULL,
	-- 英文名称
	[enname] varchar(255),
	-- 角色类型
	[role_type] varchar(255),
	-- 用户类型
	[user_type] char(1),
	-- 数据范围
	[data_scope] char(1),
	-- 是否系统数据
	[is_sys] varchar(64),
	-- 是否可用
	[useable] varchar(64),
	-- 创建者
	[create_by] varchar(64) NOT NULL,
	-- 创建时间
	[create_date] datetime NOT NULL,
	-- 更新者
	[update_by] varchar(64) NOT NULL,
	-- 更新时间
	[update_date] datetime NOT NULL,
	-- 备注信息
	[remarks] nvarchar(255),
	-- 删除标记
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 角色-菜单
CREATE TABLE [sys_role_menu]
(
	-- 角色编号
	[role_id] varchar(64) NOT NULL,
	-- 菜单编号
	[menu_id] varchar(64) NOT NULL,
	PRIMARY KEY ([role_id], [menu_id])
);


-- 角色-机构
CREATE TABLE [sys_role_office]
(
	-- 角色编号
	[role_id] varchar(64) NOT NULL,
	-- 机构编号
	[office_id] varchar(64) NOT NULL,
	PRIMARY KEY ([role_id], [office_id])
);


-- 用户表
CREATE TABLE [sys_user]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 归属公司
	[company_id] varchar(64) NOT NULL,
	-- 归属部门
	[office_id] varchar(64) NOT NULL,
	-- 登录名
	[login_name] varchar(100) NOT NULL,
	-- 密码
	[password] varchar(100) NOT NULL,
	-- 工号
	[no] varchar(100),
	-- 姓名
	[name] nvarchar(100) NOT NULL,
	-- 邮箱
	[email] nvarchar(200),
	-- 电话
	[phone] varchar(200),
	-- 手机
	[mobile] varchar(200),
	-- 用户类型
	[user_type] char(1),
	-- 用户头像
	[photo] varchar(1000),
	-- 最后登陆IP
	[login_ip] varchar(100),
	-- 最后登陆时间
	[login_date] datetime,
	-- 是否可登录
	[login_flag] varchar(64),
	-- 创建者
	[create_by] varchar(64) NOT NULL,
	-- 创建时间
	[create_date] datetime NOT NULL,
	-- 更新者
	[update_by] varchar(64) NOT NULL,
	-- 更新时间
	[update_date] datetime NOT NULL,
	-- 备注信息
	[remarks] nvarchar(255),
	-- 删除标记
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 用户-角色
CREATE TABLE [sys_user_role]
(
	-- 用户编号
	[user_id] varchar(64) NOT NULL,
	-- 角色编号
	[role_id] varchar(64) NOT NULL,
	PRIMARY KEY ([user_id], [role_id])
);



/* Create Foreign Keys */

ALTER TABLE [sys_office]
	ADD FOREIGN KEY ([area_id])
	REFERENCES [sys_area] ([id])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE [sys_role_menu]
	ADD FOREIGN KEY ([menu_id])
	REFERENCES [sys_menu] ([id])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE [sys_role_office]
	ADD FOREIGN KEY ([office_id])
	REFERENCES [sys_office] ([id])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE [sys_user]
	ADD FOREIGN KEY ([company_id])
	REFERENCES [sys_office] ([id])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE [sys_user]
	ADD FOREIGN KEY ([office_id])
	REFERENCES [sys_office] ([id])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE [sys_role_menu]
	ADD FOREIGN KEY ([role_id])
	REFERENCES [sys_role] ([id])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE [sys_role_office]
	ADD FOREIGN KEY ([role_id])
	REFERENCES [sys_role] ([id])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE [sys_user_role]
	ADD FOREIGN KEY ([role_id])
	REFERENCES [sys_role] ([id])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE [sys_user_role]
	ADD FOREIGN KEY ([user_id])
	REFERENCES [sys_user] ([id])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



