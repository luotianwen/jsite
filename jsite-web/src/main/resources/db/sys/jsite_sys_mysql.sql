SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS sys_role_office;
DROP TABLE IF EXISTS sys_user_role;
DROP TABLE IF EXISTS sys_user;
DROP TABLE IF EXISTS sys_office;
DROP TABLE IF EXISTS sys_area;
DROP TABLE IF EXISTS sys_dict;
DROP TABLE IF EXISTS sys_log;
DROP TABLE IF EXISTS sys_mdict;
DROP TABLE IF EXISTS sys_role_menu;
DROP TABLE IF EXISTS sys_menu;
DROP TABLE IF EXISTS sys_role;




/* Create Tables */

-- 区域表
CREATE TABLE sys_area
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
	tree_leaf char NOT NULL COMMENT '是否叶子节点',
	-- 树形层级(0:根级)
	tree_level int NOT NULL COMMENT '树形层级',
	-- 区域编码
	code varchar(100) COMMENT '区域编码',
	-- 区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）
	type char(1) COMMENT '区域类型',
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
) COMMENT = '区域表';


-- 字典表
CREATE TABLE sys_dict
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 数据值
	value varchar(100) NOT NULL COMMENT '数据值',
	-- 标签名
	label varchar(100) NOT NULL COMMENT '标签名',
	-- 类型
	type varchar(100) NOT NULL COMMENT '类型',
	-- 描述
	description varchar(100) NOT NULL COMMENT '描述',
	-- 排序（升序）
	sort decimal(10,0) NOT NULL COMMENT '排序（升序）',
	-- 父级编号
	parent_id varchar(64) DEFAULT '0' COMMENT '父级编号',
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
) COMMENT = '字典表';


-- 日志表
CREATE TABLE sys_log
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 日志类型（1：接入日志；2：异常日志）
	type char(1) DEFAULT '1' COMMENT '日志类型',
	title varchar(500) COMMENT '日志标题',
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 操作IP地址
	remote_addr varchar(255) COMMENT '操作IP地址',
	-- 用户代理
	user_agent varchar(255) COMMENT '用户代理',
	-- 请求URI
	request_uri varchar(255) COMMENT '请求URI',
	-- 操作方式
	method varchar(5) COMMENT '操作方式',
	-- 操作提交的数据
	params text COMMENT '操作提交的数据',
	-- 异常信息
	exception text COMMENT '异常信息',
	PRIMARY KEY (id)
) COMMENT = '日志表';


-- 多级字典表
CREATE TABLE sys_mdict
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
	tree_leaf char NOT NULL COMMENT '是否叶子节点',
	-- 树形层级(0:根级)
	tree_level int NOT NULL COMMENT '树形层级',
	-- 描述
	description varchar(100) COMMENT '描述',
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
) COMMENT = '多级字典表';


-- 菜单表
CREATE TABLE sys_menu
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
	tree_leaf char NOT NULL COMMENT '是否叶子节点',
	-- 树形层级(0:根级)
	tree_level int NOT NULL COMMENT '树形层级',
	-- 链接
	href varchar(2000) COMMENT '链接',
	-- 目标（mainFrame、 _blank、_self、_parent、_top）
	target varchar(20) COMMENT '目标',
	-- 图标
	icon varchar(100) COMMENT '图标',
	-- 是否在菜单中显示（1：显示；0：不显示）
	is_show char(1) NOT NULL COMMENT '是否在菜单中显示',
	-- 权限标识
	permission varchar(200) COMMENT '权限标识',
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
) COMMENT = '菜单表';


-- 机构表
CREATE TABLE sys_office
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
	tree_leaf char NOT NULL COMMENT '是否叶子节点',
	-- 树形层级(0:根级)
	tree_level int NOT NULL COMMENT '树形层级',
	-- 归属区域
	area_id varchar(64) NOT NULL COMMENT '归属区域',
	-- 区域编码
	code varchar(100) COMMENT '区域编码',
	-- 机构类型（1：公司；2：部门；3：小组）
	type char(1) NOT NULL COMMENT '机构类型',
	-- 机构等级（1：一级；2：二级；3：三级；4：四级）
	grade char(1) NOT NULL COMMENT '机构等级',
	-- 联系地址
	address varchar(255) COMMENT '联系地址',
	-- 邮政编码
	zip_code varchar(100) COMMENT '邮政编码',
	-- 负责人
	master varchar(100) COMMENT '负责人',
	-- 电话
	phone varchar(200) COMMENT '电话',
	-- 传真
	fax varchar(200) COMMENT '传真',
	-- 邮箱
	email varchar(200) COMMENT '邮箱',
	USEABLE varchar(64) COMMENT '是否启用',
	PRIMARY_PERSON varchar(64) COMMENT '主负责人',
	DEPUTY_PERSON varchar(64) COMMENT '副负责人',
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
) COMMENT = '机构表';


-- 角色表
CREATE TABLE sys_role
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 归属机构
	office_id varchar(64) COMMENT '归属机构',
	-- 角色名称
	name varchar(100) NOT NULL COMMENT '角色名称',
	-- 英文名称
	enname varchar(255) COMMENT '英文名称',
	-- 角色类型
	role_type varchar(255) COMMENT '角色类型',
	-- 用户类型
	user_type char(1) COMMENT '用户类型',
	-- 数据范围（0：所有数据；1：所在公司及以下数据；2：所在公司数据；3：所在部门及以下数据；4：所在部门数据；8：仅本人数据；9：按明细设置）
	data_scope char(1) COMMENT '数据范围',
	is_sys varchar(64) COMMENT '是否系统数据',
	useable varchar(64) COMMENT '是否可用',
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
) COMMENT = '角色表';


-- 角色-菜单
CREATE TABLE sys_role_menu
(
	-- 角色编号
	role_id varchar(64) NOT NULL COMMENT '角色编号',
	-- 菜单编号
	menu_id varchar(64) NOT NULL COMMENT '菜单编号',
	PRIMARY KEY (role_id, menu_id)
) COMMENT = '角色-菜单';


-- 角色-机构
CREATE TABLE sys_role_office
(
	-- 角色编号
	role_id varchar(64) NOT NULL COMMENT '角色编号',
	-- 机构编号
	office_id varchar(64) NOT NULL COMMENT '机构编号',
	PRIMARY KEY (role_id, office_id)
) COMMENT = '角色-机构';


-- 用户表
CREATE TABLE sys_user
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 归属公司
	company_id varchar(64) NOT NULL COMMENT '归属公司',
	-- 归属部门
	office_id varchar(64) NOT NULL COMMENT '归属部门',
	-- 登录名
	login_name varchar(100) NOT NULL COMMENT '登录名',
	-- 密码
	password varchar(100) NOT NULL COMMENT '密码',
	-- 工号
	no varchar(100) COMMENT '工号',
	-- 姓名
	name varchar(100) NOT NULL COMMENT '姓名',
	-- 邮箱
	email varchar(200) COMMENT '邮箱',
	-- 电话
	phone varchar(200) COMMENT '电话',
	-- 手机
	mobile varchar(200) COMMENT '手机',
	-- 用户类型
	user_type char(1) COMMENT '用户类型',
	photo varchar(1000) COMMENT '用户头像',
	-- 最后登陆IP
	login_ip varchar(100) COMMENT '最后登陆IP',
	-- 最后登陆时间
	login_date datetime COMMENT '最后登陆时间',
	login_flag varchar(64) COMMENT '是否可登录',
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
) COMMENT = '用户表';


-- 用户-角色
CREATE TABLE sys_user_role
(
	-- 用户编号
	user_id varchar(64) NOT NULL COMMENT '用户编号',
	-- 角色编号
	role_id varchar(64) NOT NULL COMMENT '角色编号',
	PRIMARY KEY (user_id, role_id)
) COMMENT = '用户-角色';



/* Create Foreign Keys */

ALTER TABLE sys_office
	ADD FOREIGN KEY (area_id)
	REFERENCES sys_area (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sys_role_menu
	ADD FOREIGN KEY (menu_id)
	REFERENCES sys_menu (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sys_role_office
	ADD FOREIGN KEY (office_id)
	REFERENCES sys_office (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sys_user
	ADD FOREIGN KEY (company_id)
	REFERENCES sys_office (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sys_user
	ADD FOREIGN KEY (office_id)
	REFERENCES sys_office (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sys_role_menu
	ADD FOREIGN KEY (role_id)
	REFERENCES sys_role (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sys_role_office
	ADD FOREIGN KEY (role_id)
	REFERENCES sys_role (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sys_user_role
	ADD FOREIGN KEY (role_id)
	REFERENCES sys_role (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sys_user_role
	ADD FOREIGN KEY (user_id)
	REFERENCES sys_user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



