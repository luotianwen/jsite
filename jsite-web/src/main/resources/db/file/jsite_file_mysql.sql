SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS sys_file;
DROP TABLE IF EXISTS sys_file_tree;




/* Create Tables */

-- 文件
CREATE TABLE sys_file
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 文件分类
	file_tree_id varchar(64) NOT NULL COMMENT '文件分类',
	-- 文件名称
	name varchar(256) NOT NULL COMMENT '原文件名称',
	-- 文件路径
	path varchar(256) COMMENT '文件路径',
	save_name varchar(255) NOT NULL COMMENT '服务器保存文件名称',
	-- 文件大小
	file_size varchar(255) COMMENT '文件大小',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '文件';


-- 文件分类
CREATE TABLE sys_file_tree
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 父级编号
	parent_id varchar(64) NOT NULL COMMENT '父级编号',
	-- 所有父级编号
	parent_ids varchar(2000) NOT NULL COMMENT '所有父级编号',
	-- 名称
	name varchar(100) NOT NULL COMMENT '名称',
	-- 排序
	sort decimal(10,0) NOT NULL COMMENT '排序',
	-- 是否树形叶子节点（0:不是,1:是）
	tree_leaf char(1) DEFAULT '0' NOT NULL COMMENT '是否为叶子节点',
	-- 树形层级(0:根级)
	tree_level decimal(4,0) NOT NULL COMMENT '树形层级',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '文件分类';



/* Create Foreign Keys */

ALTER TABLE sys_file
	ADD FOREIGN KEY (file_tree_id)
	REFERENCES sys_file_tree (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



