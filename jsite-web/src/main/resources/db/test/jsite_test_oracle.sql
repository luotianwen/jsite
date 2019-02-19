
/* Drop Tables */

DROP TABLE test_data CASCADE CONSTRAINTS;
DROP TABLE test_data_child CASCADE CONSTRAINTS;
DROP TABLE test_data_main CASCADE CONSTRAINTS;
DROP TABLE test_tree CASCADE CONSTRAINTS;




/* Create Tables */

-- 业务数据表
CREATE TABLE test_data
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 归属用户
	user_id varchar2(64),
	-- 归属部门
	office_id varchar2(64),
	-- 归属区域
	area_id nvarchar2(64),
	-- 名称
	name varchar2(100),
	-- 性别
	sex char(1),
	-- 加入日期
	in_date date,
	-- 创建者
	create_by varchar2(64) NOT NULL,
	-- 创建时间
	create_date timestamp NOT NULL,
	-- 更新者
	update_by varchar2(64) NOT NULL,
	-- 更新时间
	update_date timestamp NOT NULL,
	-- 备注信息
	remarks nvarchar2(255),
	-- 删除标记
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 业务数据子表
CREATE TABLE test_data_child
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 业务主表ID
	test_data_main_id varchar2(64),
	-- 名称
	name varchar2(100),
	-- 创建者
	create_by varchar2(64) NOT NULL,
	-- 创建时间
	create_date timestamp NOT NULL,
	-- 更新者
	update_by varchar2(64) NOT NULL,
	-- 更新时间
	update_date timestamp NOT NULL,
	-- 备注信息
	remarks nvarchar2(255),
	-- 删除标记
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 业务数据表
CREATE TABLE test_data_main
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 归属用户
	user_id varchar2(64),
	-- 归属部门
	office_id varchar2(64),
	-- 归属区域
	area_id nvarchar2(64),
	-- 名称
	name varchar2(100),
	-- 性别
	sex char(1),
	-- 加入日期
	in_date date,
	-- 创建者
	create_by varchar2(64) NOT NULL,
	-- 创建时间
	create_date timestamp NOT NULL,
	-- 更新者
	update_by varchar2(64) NOT NULL,
	-- 更新时间
	update_date timestamp NOT NULL,
	-- 备注信息
	remarks nvarchar2(255),
	-- 删除标记
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 树结构表
CREATE TABLE test_tree
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 父级编号
	parent_id varchar2(64) NOT NULL,
	-- 所有父级编号
	parent_ids varchar2(2000) NOT NULL,
	-- 名称
	name varchar2(100),
	-- 排序
	sort number(10,0),
	-- 是否树形叶子节点
	tree_leaf char,
	-- 树形层级
	tree_level number(10,0),
	-- 创建者
	create_by varchar2(64) NOT NULL,
	-- 创建时间
	create_date timestamp NOT NULL,
	-- 更新者
	update_by varchar2(64) NOT NULL,
	-- 更新时间
	update_date timestamp NOT NULL,
	-- 备注信息
	remarks nvarchar2(255),
	-- 删除标记
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE test_data_child
	ADD FOREIGN KEY (test_data_main_id)
	REFERENCES test_data_main (id)
;



/* Comments */

COMMENT ON TABLE test_data IS '业务数据表';
COMMENT ON COLUMN test_data.id IS '编号';
COMMENT ON COLUMN test_data.user_id IS '归属用户';
COMMENT ON COLUMN test_data.office_id IS '归属部门';
COMMENT ON COLUMN test_data.area_id IS '归属区域';
COMMENT ON COLUMN test_data.name IS '名称';
COMMENT ON COLUMN test_data.sex IS '性别';
COMMENT ON COLUMN test_data.in_date IS '加入日期';
COMMENT ON COLUMN test_data.create_by IS '创建者';
COMMENT ON COLUMN test_data.create_date IS '创建时间';
COMMENT ON COLUMN test_data.update_by IS '更新者';
COMMENT ON COLUMN test_data.update_date IS '更新时间';
COMMENT ON COLUMN test_data.remarks IS '备注信息';
COMMENT ON COLUMN test_data.del_flag IS '删除标记';
COMMENT ON TABLE test_data_child IS '业务数据子表';
COMMENT ON COLUMN test_data_child.id IS '编号';
COMMENT ON COLUMN test_data_child.test_data_main_id IS '业务主表ID';
COMMENT ON COLUMN test_data_child.name IS '名称';
COMMENT ON COLUMN test_data_child.create_by IS '创建者';
COMMENT ON COLUMN test_data_child.create_date IS '创建时间';
COMMENT ON COLUMN test_data_child.update_by IS '更新者';
COMMENT ON COLUMN test_data_child.update_date IS '更新时间';
COMMENT ON COLUMN test_data_child.remarks IS '备注信息';
COMMENT ON COLUMN test_data_child.del_flag IS '删除标记';
COMMENT ON TABLE test_data_main IS '业务数据表';
COMMENT ON COLUMN test_data_main.id IS '编号';
COMMENT ON COLUMN test_data_main.user_id IS '归属用户';
COMMENT ON COLUMN test_data_main.office_id IS '归属部门';
COMMENT ON COLUMN test_data_main.area_id IS '归属区域';
COMMENT ON COLUMN test_data_main.name IS '名称';
COMMENT ON COLUMN test_data_main.sex IS '性别';
COMMENT ON COLUMN test_data_main.in_date IS '加入日期';
COMMENT ON COLUMN test_data_main.create_by IS '创建者';
COMMENT ON COLUMN test_data_main.create_date IS '创建时间';
COMMENT ON COLUMN test_data_main.update_by IS '更新者';
COMMENT ON COLUMN test_data_main.update_date IS '更新时间';
COMMENT ON COLUMN test_data_main.remarks IS '备注信息';
COMMENT ON COLUMN test_data_main.del_flag IS '删除标记';
COMMENT ON TABLE test_tree IS '树结构表';
COMMENT ON COLUMN test_tree.id IS '编号';
COMMENT ON COLUMN test_tree.parent_id IS '父级编号';
COMMENT ON COLUMN test_tree.parent_ids IS '所有父级编号';
COMMENT ON COLUMN test_tree.name IS '名称';
COMMENT ON COLUMN test_tree.sort IS '排序';
COMMENT ON COLUMN test_tree.tree_leaf IS '是否树形叶子节点';
COMMENT ON COLUMN test_tree.tree_level IS '树形层级';
COMMENT ON COLUMN test_tree.create_by IS '创建者';
COMMENT ON COLUMN test_tree.create_date IS '创建时间';
COMMENT ON COLUMN test_tree.update_by IS '更新者';
COMMENT ON COLUMN test_tree.update_date IS '更新时间';
COMMENT ON COLUMN test_tree.remarks IS '备注信息';
COMMENT ON COLUMN test_tree.del_flag IS '删除标记';



