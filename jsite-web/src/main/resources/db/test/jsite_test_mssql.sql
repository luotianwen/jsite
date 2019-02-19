
/* Drop Tables */

IF ObJECt_ID('[test_data]') IS NOT NULL DROP TABLE [test_data];
IF ObJECt_ID('[test_data_child]') IS NOT NULL DROP TABLE [test_data_child];
IF ObJECt_ID('[test_data_main]') IS NOT NULL DROP TABLE [test_data_main];
IF ObJECt_ID('[test_tree]') IS NOT NULL DROP TABLE [test_tree];




/* Create Tables */

-- 业务数据表
CREATE TABLE [test_data]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 归属用户
	[user_id] varchar(64),
	-- 归属部门
	[office_id] varchar(64),
	-- 归属区域
	[area_id] nvarchar(64),
	-- 名称
	[name] varchar(100),
	-- 性别
	[sex] char(1),
	-- 加入日期
	[in_date] date,
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


-- 业务数据子表
CREATE TABLE [test_data_child]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 业务主表ID
	[test_data_main_id] varchar(64),
	-- 名称
	[name] varchar(100),
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


-- 业务数据表
CREATE TABLE [test_data_main]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 归属用户
	[user_id] varchar(64),
	-- 归属部门
	[office_id] varchar(64),
	-- 归属区域
	[area_id] nvarchar(64),
	-- 名称
	[name] varchar(100),
	-- 性别
	[sex] char(1),
	-- 加入日期
	[in_date] date,
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


-- 树结构表
CREATE TABLE [test_tree]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 父级编号
	[parent_id] varchar(64) NOT NULL,
	-- 所有父级编号
	[parent_ids] varchar(2000) NOT NULL,
	-- 名称
	[name] varchar(100),
	-- 排序
	[sort] decimal(10,0),
	-- 是否树形叶子节点
	[tree_leaf] char,
	-- 树形层级
	[tree_level] int,
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



/* Create Foreign Keys */

ALTER TABLE [test_data_child]
	ADD FOREIGN KEY ([test_data_main_id])
	REFERENCES [test_data_main] ([id])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



