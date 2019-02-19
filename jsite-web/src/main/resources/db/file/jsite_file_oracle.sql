
/* Drop Tables */

DROP TABLE sys_file CASCADE CONSTRAINTS;
DROP TABLE sys_file_tree CASCADE CONSTRAINTS;




/* Create Tables */

-- 文件
CREATE TABLE sys_file
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 文件分类
	file_tree_id varchar2(64) NOT NULL,
	-- 原文件名称
	name varchar2(256) NOT NULL,
	-- 文件路径
	path varchar2(256),
	-- 服务器保存文件名称
	save_name varchar2(255) NOT NULL,
	-- 文件大小
	file_size varchar2(255),
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


-- 文件分类
CREATE TABLE sys_file_tree
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 父级编号
	parent_id varchar2(64) NOT NULL,
	-- 所有父级编号
	parent_ids varchar2(2000) NOT NULL,
	-- 名称
	name nvarchar2(100) NOT NULL,
	-- 排序
	sort number(10,0) NOT NULL,
	-- 是否为叶子节点
	tree_leaf char(1) DEFAULT '0' NOT NULL,
	-- 树形层级
	tree_level number(4,0) NOT NULL,
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

ALTER TABLE sys_file
	ADD FOREIGN KEY (file_tree_id)
	REFERENCES sys_file_tree (id)
;



/* Comments */

COMMENT ON TABLE sys_file IS '文件';
COMMENT ON COLUMN sys_file.id IS '编号';
COMMENT ON COLUMN sys_file.file_tree_id IS '文件分类';
COMMENT ON COLUMN sys_file.name IS '原文件名称';
COMMENT ON COLUMN sys_file.path IS '文件路径';
COMMENT ON COLUMN sys_file.save_name IS '服务器保存文件名称';
COMMENT ON COLUMN sys_file.file_size IS '文件大小';
COMMENT ON COLUMN sys_file.create_by IS '创建者';
COMMENT ON COLUMN sys_file.create_date IS '创建时间';
COMMENT ON COLUMN sys_file.update_by IS '更新者';
COMMENT ON COLUMN sys_file.update_date IS '更新时间';
COMMENT ON COLUMN sys_file.remarks IS '备注信息';
COMMENT ON COLUMN sys_file.del_flag IS '删除标记';
COMMENT ON TABLE sys_file_tree IS '文件分类';
COMMENT ON COLUMN sys_file_tree.id IS '编号';
COMMENT ON COLUMN sys_file_tree.parent_id IS '父级编号';
COMMENT ON COLUMN sys_file_tree.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_file_tree.name IS '名称';
COMMENT ON COLUMN sys_file_tree.sort IS '排序';
COMMENT ON COLUMN sys_file_tree.tree_leaf IS '是否为叶子节点';
COMMENT ON COLUMN sys_file_tree.tree_level IS '树形层级';
COMMENT ON COLUMN sys_file_tree.create_by IS '创建者';
COMMENT ON COLUMN sys_file_tree.create_date IS '创建时间';
COMMENT ON COLUMN sys_file_tree.update_by IS '更新者';
COMMENT ON COLUMN sys_file_tree.update_date IS '更新时间';
COMMENT ON COLUMN sys_file_tree.remarks IS '备注信息';
COMMENT ON COLUMN sys_file_tree.del_flag IS '删除标记';



