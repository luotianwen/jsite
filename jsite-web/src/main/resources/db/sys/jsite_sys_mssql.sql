
/* Drop Indexes */

DROP INDEX [sys_area_parent_id];
DROP INDEX [sys_area_parent_ids];
DROP INDEX [sys_area_del_flag];
DROP INDEX [sys_dict_value];
DROP INDEX [sys_dict_label];
DROP INDEX [sys_dict_del_flag];
DROP INDEX [sys_log_create_by];
DROP INDEX [sys_log_request_uri];
DROP INDEX [sys_log_type];
DROP INDEX [sys_log_create_date];
DROP INDEX [sys_mdict_parent_id];
DROP INDEX [sys_mdict_parent_ids];
DROP INDEX [sys_mdict_del_flag];
DROP INDEX [sys_menu_parent_id];
DROP INDEX [sys_menu_parent_ids];
DROP INDEX [sys_menu_del_flag];
DROP INDEX [sys_office_parent_id];
DROP INDEX [sys_office_parent_ids];
DROP INDEX [sys_office_del_flag];
DROP INDEX [sys_office_type];
DROP INDEX [sys_role_del_flag];
DROP INDEX [sys_role_enname];
DROP INDEX [sys_user_office_id];
DROP INDEX [sys_user_login_name];
DROP INDEX [sys_user_company_id];
DROP INDEX [sys_user_update_date];
DROP INDEX [sys_user_del_flag];



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
	[id] varchar(64) NOT NULL,
	[parent_id] varchar(64) NOT NULL,
	[parent_ids] varchar(2000) NOT NULL,
	[name] nvarchar(100) NOT NULL,
	[sort] decimal(10,0) NOT NULL,
	[tree_leaf] char NOT NULL,
	[tree_level] int NOT NULL,
	[code] varchar(100),
	[type] char(1),
	[create_by] varchar(64) NOT NULL,
	[create_date] datetime NOT NULL,
	[update_by] varchar(64) NOT NULL,
	[update_date] datetime NOT NULL,
	[remarks] nvarchar(255),
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 字典表
CREATE TABLE [sys_dict]
(
	[id] varchar(64) NOT NULL,
	[value] varchar(100) NOT NULL,
	[label] varchar(100) NOT NULL,
	[type] varchar(100) NOT NULL,
	[description] nvarchar(100) NOT NULL,
	[sort] decimal(10,0) NOT NULL,
	[parent_id] varchar(64) DEFAULT '0',
	[create_by] varchar(64) NOT NULL,
	[create_date] datetime NOT NULL,
	[update_by] varchar(64) NOT NULL,
	[update_date] datetime NOT NULL,
	[remarks] nvarchar(255),
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 日志表
CREATE TABLE [sys_log]
(
	[id] varchar(64) NOT NULL IDENTITY ,
	[type] char(1) DEFAULT '1',
	[title] nvarchar(500),
	[create_by] varchar(64),
	[create_date] datetime,
	[remote_addr] varchar(255),
	[user_agent] varchar(255),
	[request_uri] varchar(255),
	[method] varchar(5),
	[params] text,
	[exception] text,
	PRIMARY KEY ([id])
);


-- 多级字典表
CREATE TABLE [sys_mdict]
(
	[id] varchar(64) NOT NULL,
	[parent_id] varchar(64) NOT NULL,
	[parent_ids] varchar(2000) NOT NULL,
	[name] nvarchar(100) NOT NULL,
	[sort] decimal(10,0) NOT NULL,
	[tree_leaf] char NOT NULL,
	[tree_level] int NOT NULL,
	[description] nvarchar(100),
	[create_by] varchar(64) NOT NULL,
	[create_date] datetime NOT NULL,
	[update_by] varchar(64) NOT NULL,
	[update_date] datetime NOT NULL,
	[remarks] nvarchar(255),
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 菜单表
CREATE TABLE [sys_menu]
(
	[id] varchar(64) NOT NULL,
	[parent_id] varchar(64) NOT NULL,
	[parent_ids] varchar(2000) NOT NULL,
	[name] nvarchar(100) NOT NULL,
	[sort] decimal(10,0) NOT NULL,
	[tree_leaf] char NOT NULL,
	[tree_level] int NOT NULL,
	[href] varchar(2000),
	[target] varchar(20),
	[icon] varchar(100),
	[is_show] char(1) NOT NULL,
	[permission] varchar(200),
	[create_by] varchar(64) NOT NULL,
	[create_date] datetime NOT NULL,
	[update_by] varchar(64) NOT NULL,
	[update_date] datetime NOT NULL,
	[remarks] nvarchar(255),
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 机构表
CREATE TABLE [sys_office]
(
	[id] varchar(64) NOT NULL,
	[parent_id] varchar(64) NOT NULL,
	[parent_ids] varchar(2000) NOT NULL,
	[name] nvarchar(100) NOT NULL,
	[sort] decimal(10,0) NOT NULL,
	[tree_leaf] char NOT NULL,
	[tree_level] int NOT NULL,
	[area_id] varchar(64) NOT NULL,
	[code] varchar(100),
	[type] char(1) NOT NULL,
	[grade] char(1) NOT NULL,
	[address] nvarchar(255),
	[zip_code] varchar(100),
	[master] nvarchar(100),
	[phone] nvarchar(200),
	[fax] nvarchar(200),
	[email] nvarchar(200),
	[USEABLE] varchar(64),
	[PRIMARY_PERSON] varchar(64),
	[DEPUTY_PERSON] varchar(64),
	[create_by] varchar(64) NOT NULL,
	[create_date] datetime NOT NULL,
	[update_by] varchar(64) NOT NULL,
	[update_date] datetime NOT NULL,
	[remarks] nvarchar(255),
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 角色表
CREATE TABLE [sys_role]
(
	[id] varchar(64) NOT NULL,
	[office_id] varchar(64),
	[name] nvarchar(100) NOT NULL,
	[enname] varchar(255),
	[role_type] varchar(255),
	[user_type] char(1),
	[data_scope] char(1),
	[is_sys] varchar(64),
	[useable] varchar(64),
	[create_by] varchar(64) NOT NULL,
	[create_date] datetime NOT NULL,
	[update_by] varchar(64) NOT NULL,
	[update_date] datetime NOT NULL,
	[remarks] nvarchar(255),
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 角色-菜单
CREATE TABLE [sys_role_menu]
(
	[role_id] varchar(64) NOT NULL,
	[menu_id] varchar(64) NOT NULL,
	PRIMARY KEY ([role_id], [menu_id])
);


-- 角色-机构
CREATE TABLE [sys_role_office]
(
	[role_id] varchar(64) NOT NULL,
	[office_id] varchar(64) NOT NULL,
	PRIMARY KEY ([role_id], [office_id])
);


-- 用户表
CREATE TABLE [sys_user]
(
	[id] varchar(64) NOT NULL,
	[company_id] varchar(64) NOT NULL,
	[office_id] varchar(64) NOT NULL,
	[login_name] varchar(100) NOT NULL,
	[password] varchar(100) NOT NULL,
	[no] varchar(100),
	[name] nvarchar(100) NOT NULL,
	[email] nvarchar(200),
	[phone] varchar(200),
	[mobile] varchar(200),
	[user_type] char(1),
	[photo] varchar(1000),
	[login_ip] varchar(100),
	[login_date] datetime,
	[login_flag] varchar(64),
	[create_by] varchar(64) NOT NULL,
	[create_date] datetime NOT NULL,
	[update_by] varchar(64) NOT NULL,
	[update_date] datetime NOT NULL,
	[remarks] nvarchar(255),
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 用户-角色
CREATE TABLE [sys_user_role]
(
	[user_id] varchar(64) NOT NULL,
	[role_id] varchar(64) NOT NULL,
	PRIMARY KEY ([user_id], [role_id])
);



/* Create Indexes */

CREATE INDEX [sys_area_parent_id] ON [sys_area] ([parent_id]);
CREATE INDEX [sys_area_parent_ids] ON [sys_area] ([parent_ids]);
CREATE INDEX [sys_area_del_flag] ON [sys_area] ([del_flag]);
CREATE INDEX [sys_dict_value] ON [sys_dict] ([value]);
CREATE INDEX [sys_dict_label] ON [sys_dict] ([label]);
CREATE INDEX [sys_dict_del_flag] ON [sys_dict] ([del_flag]);
CREATE INDEX [sys_log_create_by] ON [sys_log] ([create_by]);
CREATE INDEX [sys_log_request_uri] ON [sys_log] ([request_uri]);
CREATE INDEX [sys_log_type] ON [sys_log] ([type]);
CREATE INDEX [sys_log_create_date] ON [sys_log] ([create_date]);
CREATE INDEX [sys_mdict_parent_id] ON [sys_mdict] ([parent_id]);
CREATE INDEX [sys_mdict_parent_ids] ON [sys_mdict] ([parent_ids]);
CREATE INDEX [sys_mdict_del_flag] ON [sys_mdict] ([del_flag]);
CREATE INDEX [sys_menu_parent_id] ON [sys_menu] ([parent_id]);
CREATE INDEX [sys_menu_parent_ids] ON [sys_menu] ([parent_ids]);
CREATE INDEX [sys_menu_del_flag] ON [sys_menu] ([del_flag]);
CREATE INDEX [sys_office_parent_id] ON [sys_office] ([parent_id]);
CREATE INDEX [sys_office_parent_ids] ON [sys_office] ([parent_ids]);
CREATE INDEX [sys_office_del_flag] ON [sys_office] ([del_flag]);
CREATE INDEX [sys_office_type] ON [sys_office] ([type]);
CREATE INDEX [sys_role_del_flag] ON [sys_role] ([del_flag]);
CREATE INDEX [sys_role_enname] ON [sys_role] ([enname]);
CREATE INDEX [sys_user_office_id] ON [sys_user] ([office_id]);
CREATE INDEX [sys_user_login_name] ON [sys_user] ([login_name]);
CREATE INDEX [sys_user_company_id] ON [sys_user] ([company_id]);
CREATE INDEX [sys_user_update_date] ON [sys_user] ([update_date]);
CREATE INDEX [sys_user_del_flag] ON [sys_user] ([del_flag]);



