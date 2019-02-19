
/* Drop Tables */

DROP TABLE gen_scheme CASCADE CONSTRAINTS;
DROP TABLE gen_table_column CASCADE CONSTRAINTS;
DROP TABLE gen_table CASCADE CONSTRAINTS;
DROP TABLE gen_template CASCADE CONSTRAINTS;




/* Create Tables */

-- 生成方案
CREATE TABLE gen_scheme
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 名称
	name nvarchar2(200),
	-- 分类
	category varchar2(2000),
	-- 生成包路径
	package_name varchar2(500),
	-- 生成模块名
	module_name varchar2(30),
	-- 生成子模块名
	sub_module_name varchar2(30),
	-- 生成功能名
	function_name nvarchar2(500),
	-- 生成功能名（简写）
	function_name_simple nvarchar2(100),
	-- 生成功能作者
	function_author nvarchar2(100),
	-- 生成表编号
	gen_table_id varchar2(200),
	-- 创建者
	create_by varchar2(64),
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks nvarchar2(255),
	-- 删除标记
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 业务表
CREATE TABLE gen_table
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 名称
	name nvarchar2(200),
	-- 描述
	comments nvarchar2(500),
	-- 实体类名称
	class_name varchar2(100),
	-- 关联父表
	parent_table varchar2(200),
	-- 关联父表外键
	parent_table_fk varchar2(100),
	-- 创建者
	create_by varchar2(64),
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks nvarchar2(255),
	-- 删除标记
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 业务表字段
CREATE TABLE gen_table_column
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 归属表编号
	gen_table_id varchar2(64),
	-- 名称
	name nvarchar2(200),
	-- 描述
	comments nvarchar2(500),
	-- JDBC类型
	jdbc_type varchar2(100),
	-- JAVA类型
	java_type varchar2(500),
	-- JAVA字段名
	java_field varchar2(200),
	-- 是否独占一行
	is_row char,
	-- 是否主键
	is_pk char(1),
	-- 是否可为空
	is_null char(1),
	-- 是否为插入字段
	is_insert char(1),
	-- 是否编辑字段
	is_edit char(1),
	-- 是否列表字段
	is_list char(1),
	-- 是否查询字段
	is_query char(1),
	-- 查询方式
	query_type varchar2(200),
	-- 显示类型
	show_type varchar2(200),
	-- 字典类型
	dict_type varchar2(200),
	-- 其它设置
	settings nvarchar2(2000),
	-- 排序（升序）
	sort number,
	-- 创建者
	create_by varchar2(64),
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks nvarchar2(255),
	-- 删除标记
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


-- 代码模板表
CREATE TABLE gen_template
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 名称
	name nvarchar2(200),
	-- 分类
	category varchar2(2000),
	-- 生成文件路径
	file_path varchar2(500),
	-- 生成文件名
	file_name varchar2(200),
	-- 内容
	content clob,
	-- 创建者
	create_by varchar2(64),
	-- 创建时间
	create_date timestamp,
	-- 更新者
	update_by varchar2(64),
	-- 更新时间
	update_date timestamp,
	-- 备注信息
	remarks nvarchar2(255),
	-- 删除标记
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE gen_table_column
	ADD FOREIGN KEY (gen_table_id)
	REFERENCES gen_table (id)
;



/* Comments */

COMMENT ON TABLE gen_scheme IS '生成方案';
COMMENT ON COLUMN gen_scheme.id IS '编号';
COMMENT ON COLUMN gen_scheme.name IS '名称';
COMMENT ON COLUMN gen_scheme.category IS '分类';
COMMENT ON COLUMN gen_scheme.package_name IS '生成包路径';
COMMENT ON COLUMN gen_scheme.module_name IS '生成模块名';
COMMENT ON COLUMN gen_scheme.sub_module_name IS '生成子模块名';
COMMENT ON COLUMN gen_scheme.function_name IS '生成功能名';
COMMENT ON COLUMN gen_scheme.function_name_simple IS '生成功能名（简写）';
COMMENT ON COLUMN gen_scheme.function_author IS '生成功能作者';
COMMENT ON COLUMN gen_scheme.gen_table_id IS '生成表编号';
COMMENT ON COLUMN gen_scheme.create_by IS '创建者';
COMMENT ON COLUMN gen_scheme.create_date IS '创建时间';
COMMENT ON COLUMN gen_scheme.update_by IS '更新者';
COMMENT ON COLUMN gen_scheme.update_date IS '更新时间';
COMMENT ON COLUMN gen_scheme.remarks IS '备注信息';
COMMENT ON COLUMN gen_scheme.del_flag IS '删除标记';
COMMENT ON TABLE gen_table IS '业务表';
COMMENT ON COLUMN gen_table.id IS '编号';
COMMENT ON COLUMN gen_table.name IS '名称';
COMMENT ON COLUMN gen_table.comments IS '描述';
COMMENT ON COLUMN gen_table.class_name IS '实体类名称';
COMMENT ON COLUMN gen_table.parent_table IS '关联父表';
COMMENT ON COLUMN gen_table.parent_table_fk IS '关联父表外键';
COMMENT ON COLUMN gen_table.create_by IS '创建者';
COMMENT ON COLUMN gen_table.create_date IS '创建时间';
COMMENT ON COLUMN gen_table.update_by IS '更新者';
COMMENT ON COLUMN gen_table.update_date IS '更新时间';
COMMENT ON COLUMN gen_table.remarks IS '备注信息';
COMMENT ON COLUMN gen_table.del_flag IS '删除标记';
COMMENT ON TABLE gen_table_column IS '业务表字段';
COMMENT ON COLUMN gen_table_column.id IS '编号';
COMMENT ON COLUMN gen_table_column.gen_table_id IS '归属表编号';
COMMENT ON COLUMN gen_table_column.name IS '名称';
COMMENT ON COLUMN gen_table_column.comments IS '描述';
COMMENT ON COLUMN gen_table_column.jdbc_type IS 'JDBC类型';
COMMENT ON COLUMN gen_table_column.java_type IS 'JAVA类型';
COMMENT ON COLUMN gen_table_column.java_field IS 'JAVA字段名';
COMMENT ON COLUMN gen_table_column.is_row IS '是否独占一行';
COMMENT ON COLUMN gen_table_column.is_pk IS '是否主键';
COMMENT ON COLUMN gen_table_column.is_null IS '是否可为空';
COMMENT ON COLUMN gen_table_column.is_insert IS '是否为插入字段';
COMMENT ON COLUMN gen_table_column.is_edit IS '是否编辑字段';
COMMENT ON COLUMN gen_table_column.is_list IS '是否列表字段';
COMMENT ON COLUMN gen_table_column.is_query IS '是否查询字段';
COMMENT ON COLUMN gen_table_column.query_type IS '查询方式';
COMMENT ON COLUMN gen_table_column.show_type IS '显示类型';
COMMENT ON COLUMN gen_table_column.dict_type IS '字典类型';
COMMENT ON COLUMN gen_table_column.settings IS '其它设置';
COMMENT ON COLUMN gen_table_column.sort IS '排序（升序）';
COMMENT ON COLUMN gen_table_column.create_by IS '创建者';
COMMENT ON COLUMN gen_table_column.create_date IS '创建时间';
COMMENT ON COLUMN gen_table_column.update_by IS '更新者';
COMMENT ON COLUMN gen_table_column.update_date IS '更新时间';
COMMENT ON COLUMN gen_table_column.remarks IS '备注信息';
COMMENT ON COLUMN gen_table_column.del_flag IS '删除标记';
COMMENT ON TABLE gen_template IS '代码模板表';
COMMENT ON COLUMN gen_template.id IS '编号';
COMMENT ON COLUMN gen_template.name IS '名称';
COMMENT ON COLUMN gen_template.category IS '分类';
COMMENT ON COLUMN gen_template.file_path IS '生成文件路径';
COMMENT ON COLUMN gen_template.file_name IS '生成文件名';
COMMENT ON COLUMN gen_template.content IS '内容';
COMMENT ON COLUMN gen_template.create_by IS '创建者';
COMMENT ON COLUMN gen_template.create_date IS '创建时间';
COMMENT ON COLUMN gen_template.update_by IS '更新者';
COMMENT ON COLUMN gen_template.update_date IS '更新时间';
COMMENT ON COLUMN gen_template.remarks IS '备注信息';
COMMENT ON COLUMN gen_template.del_flag IS '删除标记';



