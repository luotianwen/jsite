
/* Drop Tables */

IF ObJECt_ID('[gen_scheme]') IS NOT NULL DROP TABLE [gen_scheme];
IF ObJECt_ID('[gen_table_column]') IS NOT NULL DROP TABLE [gen_table_column];
IF ObJECt_ID('[gen_table]') IS NOT NULL DROP TABLE [gen_table];
IF ObJECt_ID('[gen_template]') IS NOT NULL DROP TABLE [gen_template];




/* Create Tables */

-- 生成方案
CREATE TABLE [gen_scheme]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 名称
	[name] nvarchar(200),
	-- 分类
	[category] varchar(2000),
	-- 生成包路径
	[package_name] varchar(500),
	-- 生成模块名
	[module_name] varchar(30),
	-- 生成子模块名
	[sub_module_name] varchar(30),
	-- 生成功能名
	[function_name] nvarchar(500),
	-- 生成功能名（简写）
	[function_name_simple] nvarchar(100),
	-- 生成功能作者
	[function_author] nvarchar(100),
	-- 生成表编号
	[gen_table_id] varchar(200),
	-- 创建者
	[create_by] varchar(64),
	-- 创建时间
	[create_date] datetime,
	-- 更新者
	[update_by] varchar(64),
	-- 更新时间
	[update_date] datetime,
	-- 备注信息
	[remarks] nvarchar(255),
	-- 删除标记
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 业务表
CREATE TABLE [gen_table]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 名称
	[name] nvarchar(200),
	-- 描述
	[comments] nvarchar(500),
	-- 实体类名称
	[class_name] varchar(100),
	-- 关联父表
	[parent_table] varchar(200),
	-- 关联父表外键
	[parent_table_fk] varchar(100),
	-- 创建者
	[create_by] varchar(64),
	-- 创建时间
	[create_date] datetime,
	-- 更新者
	[update_by] varchar(64),
	-- 更新时间
	[update_date] datetime,
	-- 备注信息
	[remarks] nvarchar(255),
	-- 删除标记
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 业务表字段
CREATE TABLE [gen_table_column]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 归属表编号
	[gen_table_id] varchar(64),
	-- 名称
	[name] nvarchar(200),
	-- 描述
	[comments] nvarchar(500),
	-- JDBC类型
	[jdbc_type] varchar(100),
	-- JAVA类型
	[java_type] varchar(500),
	-- JAVA字段名
	[java_field] varchar(200),
	-- 是否独占一行
	[is_row] char,
	-- 是否主键
	[is_pk] char(1),
	-- 是否可为空
	[is_null] char(1),
	-- 是否为插入字段
	[is_insert] char(1),
	-- 是否编辑字段
	[is_edit] char(1),
	-- 是否列表字段
	[is_list] char(1),
	-- 是否查询字段
	[is_query] char(1),
	-- 查询方式
	[query_type] varchar(200),
	-- 显示类型
	[show_type] varchar(200),
	-- 字典类型
	[dict_type] varchar(200),
	-- 其它设置
	[settings] nvarchar(2000),
	-- 排序（升序）
	[sort] decimal,
	-- 创建者
	[create_by] varchar(64),
	-- 创建时间
	[create_date] datetime,
	-- 更新者
	[update_by] varchar(64),
	-- 更新时间
	[update_date] datetime,
	-- 备注信息
	[remarks] nvarchar(255),
	-- 删除标记
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);


-- 代码模板表
CREATE TABLE [gen_template]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 名称
	[name] nvarchar(200),
	-- 分类
	[category] varchar(2000),
	-- 生成文件路径
	[file_path] varchar(500),
	-- 生成文件名
	[file_name] varchar(200),
	-- 内容
	[content] text,
	-- 创建者
	[create_by] varchar(64),
	-- 创建时间
	[create_date] datetime,
	-- 更新者
	[update_by] varchar(64),
	-- 更新时间
	[update_date] datetime,
	-- 备注信息
	[remarks] nvarchar(255),
	-- 删除标记
	[del_flag] char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY ([id])
);



/* Create Foreign Keys */

ALTER TABLE [gen_table_column]
	ADD FOREIGN KEY ([gen_table_id])
	REFERENCES [gen_table] ([id])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



