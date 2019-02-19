
/* Drop Tables */

IF ObJECt_ID('[sys_file]') IS NOT NULL DROP TABLE [sys_file];
IF ObJECt_ID('[sys_file_tree]') IS NOT NULL DROP TABLE [sys_file_tree];




/* Create Tables */

-- 文件
CREATE TABLE [sys_file]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 文件分类
	[file_tree_id] varchar(64) NOT NULL,
	-- 原文件名称
	[name] varchar(256) NOT NULL,
	-- 文件路径
	[path] varchar(256),
	-- 服务器保存文件名称
	[save_name] varchar(255) NOT NULL,
	-- 文件大小
	[file_size] varchar(255),
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


-- 文件分类
CREATE TABLE [sys_file_tree]
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
	-- 是否为叶子节点
	[tree_leaf] char(1) DEFAULT '0' NOT NULL,
	-- 树形层级
	[tree_level] decimal(4,0) NOT NULL,
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

ALTER TABLE [sys_file]
	ADD FOREIGN KEY ([file_tree_id])
	REFERENCES [sys_file_tree] ([id])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



