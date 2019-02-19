SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS test_data;
DROP TABLE IF EXISTS test_data_child;
DROP TABLE IF EXISTS test_data_main;
DROP TABLE IF EXISTS test_tree;




/* Create Tables */

-- 业务数据表
CREATE TABLE test_data
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 归属用户
	user_id varchar(64) COMMENT '归属用户',
	-- 归属部门
	office_id varchar(64) COMMENT '归属部门',
	-- 归属区域
	area_id varchar(64) COMMENT '归属区域',
	-- 名称
	name varchar(100) COMMENT '名称',
	-- 性别（字典类型：sex）
	sex char(1) COMMENT '性别',
	-- 加入日期
	in_date date COMMENT '加入日期',
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
) COMMENT = '业务数据表';


-- 业务数据子表
CREATE TABLE test_data_child
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 业务主表ID
	test_data_main_id varchar(64) COMMENT '业务主表ID',
	-- 名称
	name varchar(100) COMMENT '名称',
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
) COMMENT = '业务数据子表';


-- 业务数据表
CREATE TABLE test_data_main
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 归属用户
	user_id varchar(64) COMMENT '归属用户',
	-- 归属部门
	office_id varchar(64) COMMENT '归属部门',
	-- 归属区域
	area_id varchar(64) COMMENT '归属区域',
	-- 名称
	name varchar(100) COMMENT '名称',
	-- 性别（字典类型：sex）
	sex char(1) COMMENT '性别',
	-- 加入日期
	in_date date COMMENT '加入日期',
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
) COMMENT = '业务数据表';


-- 树结构表
CREATE TABLE test_tree
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 父级编号
	parent_id varchar(64) NOT NULL COMMENT '父级编号',
	-- 所有父级编号
	parent_ids varchar(2000) NOT NULL COMMENT '所有父级编号',
	-- 名称
	name varchar(100) COMMENT '名称',
	-- 排序
	sort decimal(10,0) COMMENT '排序',
	-- 是否树形叶子节点（0:不是,1:是）
	tree_leaf char COMMENT '是否树形叶子节点',
	-- 树形层级(0:根级)
	tree_level int COMMENT '树形层级',
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
) COMMENT = '树结构表';



/* Create Foreign Keys */

ALTER TABLE test_data_child
	ADD FOREIGN KEY (test_data_main_id)
	REFERENCES test_data_main (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



