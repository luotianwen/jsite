
/* Drop Tables */

DROP TABLE sys_role_office CASCADE CONSTRAINTS;
DROP TABLE sys_user_role CASCADE CONSTRAINTS;
DROP TABLE sys_user CASCADE CONSTRAINTS;
DROP TABLE sys_office CASCADE CONSTRAINTS;
DROP TABLE sys_area CASCADE CONSTRAINTS;
DROP TABLE sys_dict CASCADE CONSTRAINTS;
DROP TABLE sys_log CASCADE CONSTRAINTS;
DROP TABLE sys_mdict CASCADE CONSTRAINTS;
DROP TABLE sys_role_menu CASCADE CONSTRAINTS;
DROP TABLE sys_menu CASCADE CONSTRAINTS;
DROP TABLE sys_role CASCADE CONSTRAINTS;




/* Create Tables */

-- 区域表
CREATE TABLE sys_area
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
	-- 是否叶子节点
	tree_leaf char NOT NULL,
	-- 树形层级
	tree_level number(10,0) NOT NULL,
	-- 区域编码
	code varchar2(100),
	-- 区域类型
	type char(1),
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


-- 字典表
CREATE TABLE sys_dict
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 数据值
	value varchar2(100) NOT NULL,
	-- 标签名
	label varchar2(100) NOT NULL,
	-- 类型
	type varchar2(100) NOT NULL,
	-- 描述
	description nvarchar2(100) NOT NULL,
	-- 排序（升序）
	sort number(10,0) NOT NULL,
	-- 父级编号
	parent_id varchar2(64) DEFAULT '0',
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


-- 日志表
CREATE TABLE sys_log
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 日志类型
	type char(1) DEFAULT '1',
	-- 日志标题
	title nvarchar2(500),
	-- 创建者
	create_by varchar2(64),
	-- 创建时间
	create_date timestamp,
	-- 操作IP地址
	remote_addr varchar2(255),
	-- 用户代理
	user_agent varchar2(255),
	-- 请求URI
	request_uri varchar2(255),
	-- 操作方式
	method varchar2(5),
	-- 操作提交的数据
	params clob,
	-- 异常信息
	exception clob,
	PRIMARY KEY (id)
);


-- 多级字典表
CREATE TABLE sys_mdict
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
	-- 是否叶子节点
	tree_leaf char NOT NULL,
	-- 树形层级
	tree_level number(10,0) NOT NULL,
	-- 描述
	description nvarchar2(100),
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


-- 菜单表
CREATE TABLE sys_menu
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
	-- 是否叶子节点
	tree_leaf char NOT NULL,
	-- 树形层级
	tree_level number(10,0) NOT NULL,
	-- 链接
	href varchar2(2000),
	-- 目标
	target varchar2(20),
	-- 图标
	icon varchar2(100),
	-- 是否在菜单中显示
	is_show char(1) NOT NULL,
	-- 权限标识
	permission varchar2(200),
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


-- 机构表
CREATE TABLE sys_office
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
	-- 是否叶子节点
	tree_leaf char NOT NULL,
	-- 树形层级
	tree_level number(10,0) NOT NULL,
	-- 归属区域
	area_id varchar2(64) NOT NULL,
	-- 区域编码
	code varchar2(100),
	-- 机构类型
	type char(1) NOT NULL,
	-- 机构等级
	grade char(1) NOT NULL,
	-- 联系地址
	address nvarchar2(255),
	-- 邮政编码
	zip_code varchar2(100),
	-- 负责人
	master nvarchar2(100),
	-- 电话
	phone nvarchar2(200),
	-- 传真
	fax nvarchar2(200),
	-- 邮箱
	email nvarchar2(200),
	-- 是否启用
	USEABLE varchar2(64),
	-- 主负责人
	PRIMARY_PERSON varchar2(64),
	-- 副负责人
	DEPUTY_PERSON varchar2(64),
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


-- 角色表
CREATE TABLE sys_role
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 归属机构
	office_id varchar2(64),
	-- 角色名称
	name nvarchar2(100) NOT NULL,
	-- 英文名称
	enname varchar2(255),
	-- 角色类型
	role_type varchar2(255),
	-- 用户类型
	user_type char(1),
	-- 数据范围
	data_scope char(1),
	-- 是否系统数据
	is_sys varchar2(64),
	-- 是否可用
	useable varchar2(64),
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


-- 角色-菜单
CREATE TABLE sys_role_menu
(
	-- 角色编号
	role_id varchar2(64) NOT NULL,
	-- 菜单编号
	menu_id varchar2(64) NOT NULL,
	PRIMARY KEY (role_id, menu_id)
);


-- 角色-机构
CREATE TABLE sys_role_office
(
	-- 角色编号
	role_id varchar2(64) NOT NULL,
	-- 机构编号
	office_id varchar2(64) NOT NULL,
	PRIMARY KEY (role_id, office_id)
);


-- 用户表
CREATE TABLE sys_user
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 归属公司
	company_id varchar2(64) NOT NULL,
	-- 归属部门
	office_id varchar2(64) NOT NULL,
	-- 登录名
	login_name varchar2(100) NOT NULL,
	-- 密码
	password varchar2(100) NOT NULL,
	-- 工号
	no varchar2(100),
	-- 姓名
	name nvarchar2(100) NOT NULL,
	-- 邮箱
	email nvarchar2(200),
	-- 电话
	phone varchar2(200),
	-- 手机
	mobile varchar2(200),
	-- 用户类型
	user_type char(1),
	-- 用户头像
	photo varchar2(1000),
	-- 最后登陆IP
	login_ip varchar2(100),
	-- 最后登陆时间
	login_date timestamp,
	-- 是否可登录
	login_flag varchar2(64),
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


-- 用户-角色
CREATE TABLE sys_user_role
(
	-- 用户编号
	user_id varchar2(64) NOT NULL,
	-- 角色编号
	role_id varchar2(64) NOT NULL,
	PRIMARY KEY (user_id, role_id)
);



/* Create Foreign Keys */

ALTER TABLE sys_office
	ADD FOREIGN KEY (area_id)
	REFERENCES sys_area (id)
;


ALTER TABLE sys_role_menu
	ADD FOREIGN KEY (menu_id)
	REFERENCES sys_menu (id)
;


ALTER TABLE sys_role_office
	ADD FOREIGN KEY (office_id)
	REFERENCES sys_office (id)
;


ALTER TABLE sys_user
	ADD FOREIGN KEY (company_id)
	REFERENCES sys_office (id)
;


ALTER TABLE sys_user
	ADD FOREIGN KEY (office_id)
	REFERENCES sys_office (id)
;


ALTER TABLE sys_role_menu
	ADD FOREIGN KEY (role_id)
	REFERENCES sys_role (id)
;


ALTER TABLE sys_role_office
	ADD FOREIGN KEY (role_id)
	REFERENCES sys_role (id)
;


ALTER TABLE sys_user_role
	ADD FOREIGN KEY (role_id)
	REFERENCES sys_role (id)
;


ALTER TABLE sys_user_role
	ADD FOREIGN KEY (user_id)
	REFERENCES sys_user (id)
;



/* Comments */

COMMENT ON TABLE sys_area IS '区域表';
COMMENT ON COLUMN sys_area.id IS '编号';
COMMENT ON COLUMN sys_area.parent_id IS '父级编号';
COMMENT ON COLUMN sys_area.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_area.name IS '名称';
COMMENT ON COLUMN sys_area.sort IS '排序';
COMMENT ON COLUMN sys_area.tree_leaf IS '是否叶子节点';
COMMENT ON COLUMN sys_area.tree_level IS '树形层级';
COMMENT ON COLUMN sys_area.code IS '区域编码';
COMMENT ON COLUMN sys_area.type IS '区域类型';
COMMENT ON COLUMN sys_area.create_by IS '创建者';
COMMENT ON COLUMN sys_area.create_date IS '创建时间';
COMMENT ON COLUMN sys_area.update_by IS '更新者';
COMMENT ON COLUMN sys_area.update_date IS '更新时间';
COMMENT ON COLUMN sys_area.remarks IS '备注信息';
COMMENT ON COLUMN sys_area.del_flag IS '删除标记';
COMMENT ON TABLE sys_dict IS '字典表';
COMMENT ON COLUMN sys_dict.id IS '编号';
COMMENT ON COLUMN sys_dict.value IS '数据值';
COMMENT ON COLUMN sys_dict.label IS '标签名';
COMMENT ON COLUMN sys_dict.type IS '类型';
COMMENT ON COLUMN sys_dict.description IS '描述';
COMMENT ON COLUMN sys_dict.sort IS '排序（升序）';
COMMENT ON COLUMN sys_dict.parent_id IS '父级编号';
COMMENT ON COLUMN sys_dict.create_by IS '创建者';
COMMENT ON COLUMN sys_dict.create_date IS '创建时间';
COMMENT ON COLUMN sys_dict.update_by IS '更新者';
COMMENT ON COLUMN sys_dict.update_date IS '更新时间';
COMMENT ON COLUMN sys_dict.remarks IS '备注信息';
COMMENT ON COLUMN sys_dict.del_flag IS '删除标记';
COMMENT ON TABLE sys_log IS '日志表';
COMMENT ON COLUMN sys_log.id IS '编号';
COMMENT ON COLUMN sys_log.type IS '日志类型';
COMMENT ON COLUMN sys_log.title IS '日志标题';
COMMENT ON COLUMN sys_log.create_by IS '创建者';
COMMENT ON COLUMN sys_log.create_date IS '创建时间';
COMMENT ON COLUMN sys_log.remote_addr IS '操作IP地址';
COMMENT ON COLUMN sys_log.user_agent IS '用户代理';
COMMENT ON COLUMN sys_log.request_uri IS '请求URI';
COMMENT ON COLUMN sys_log.method IS '操作方式';
COMMENT ON COLUMN sys_log.params IS '操作提交的数据';
COMMENT ON COLUMN sys_log.exception IS '异常信息';
COMMENT ON TABLE sys_mdict IS '多级字典表';
COMMENT ON COLUMN sys_mdict.id IS '编号';
COMMENT ON COLUMN sys_mdict.parent_id IS '父级编号';
COMMENT ON COLUMN sys_mdict.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_mdict.name IS '名称';
COMMENT ON COLUMN sys_mdict.sort IS '排序';
COMMENT ON COLUMN sys_mdict.tree_leaf IS '是否叶子节点';
COMMENT ON COLUMN sys_mdict.tree_level IS '树形层级';
COMMENT ON COLUMN sys_mdict.description IS '描述';
COMMENT ON COLUMN sys_mdict.create_by IS '创建者';
COMMENT ON COLUMN sys_mdict.create_date IS '创建时间';
COMMENT ON COLUMN sys_mdict.update_by IS '更新者';
COMMENT ON COLUMN sys_mdict.update_date IS '更新时间';
COMMENT ON COLUMN sys_mdict.remarks IS '备注信息';
COMMENT ON COLUMN sys_mdict.del_flag IS '删除标记';
COMMENT ON TABLE sys_menu IS '菜单表';
COMMENT ON COLUMN sys_menu.id IS '编号';
COMMENT ON COLUMN sys_menu.parent_id IS '父级编号';
COMMENT ON COLUMN sys_menu.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_menu.name IS '名称';
COMMENT ON COLUMN sys_menu.sort IS '排序';
COMMENT ON COLUMN sys_menu.tree_leaf IS '是否叶子节点';
COMMENT ON COLUMN sys_menu.tree_level IS '树形层级';
COMMENT ON COLUMN sys_menu.href IS '链接';
COMMENT ON COLUMN sys_menu.target IS '目标';
COMMENT ON COLUMN sys_menu.icon IS '图标';
COMMENT ON COLUMN sys_menu.is_show IS '是否在菜单中显示';
COMMENT ON COLUMN sys_menu.permission IS '权限标识';
COMMENT ON COLUMN sys_menu.create_by IS '创建者';
COMMENT ON COLUMN sys_menu.create_date IS '创建时间';
COMMENT ON COLUMN sys_menu.update_by IS '更新者';
COMMENT ON COLUMN sys_menu.update_date IS '更新时间';
COMMENT ON COLUMN sys_menu.remarks IS '备注信息';
COMMENT ON COLUMN sys_menu.del_flag IS '删除标记';
COMMENT ON TABLE sys_office IS '机构表';
COMMENT ON COLUMN sys_office.id IS '编号';
COMMENT ON COLUMN sys_office.parent_id IS '父级编号';
COMMENT ON COLUMN sys_office.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_office.name IS '名称';
COMMENT ON COLUMN sys_office.sort IS '排序';
COMMENT ON COLUMN sys_office.tree_leaf IS '是否叶子节点';
COMMENT ON COLUMN sys_office.tree_level IS '树形层级';
COMMENT ON COLUMN sys_office.area_id IS '归属区域';
COMMENT ON COLUMN sys_office.code IS '区域编码';
COMMENT ON COLUMN sys_office.type IS '机构类型';
COMMENT ON COLUMN sys_office.grade IS '机构等级';
COMMENT ON COLUMN sys_office.address IS '联系地址';
COMMENT ON COLUMN sys_office.zip_code IS '邮政编码';
COMMENT ON COLUMN sys_office.master IS '负责人';
COMMENT ON COLUMN sys_office.phone IS '电话';
COMMENT ON COLUMN sys_office.fax IS '传真';
COMMENT ON COLUMN sys_office.email IS '邮箱';
COMMENT ON COLUMN sys_office.USEABLE IS '是否启用';
COMMENT ON COLUMN sys_office.PRIMARY_PERSON IS '主负责人';
COMMENT ON COLUMN sys_office.DEPUTY_PERSON IS '副负责人';
COMMENT ON COLUMN sys_office.create_by IS '创建者';
COMMENT ON COLUMN sys_office.create_date IS '创建时间';
COMMENT ON COLUMN sys_office.update_by IS '更新者';
COMMENT ON COLUMN sys_office.update_date IS '更新时间';
COMMENT ON COLUMN sys_office.remarks IS '备注信息';
COMMENT ON COLUMN sys_office.del_flag IS '删除标记';
COMMENT ON TABLE sys_role IS '角色表';
COMMENT ON COLUMN sys_role.id IS '编号';
COMMENT ON COLUMN sys_role.office_id IS '归属机构';
COMMENT ON COLUMN sys_role.name IS '角色名称';
COMMENT ON COLUMN sys_role.enname IS '英文名称';
COMMENT ON COLUMN sys_role.role_type IS '角色类型';
COMMENT ON COLUMN sys_role.user_type IS '用户类型';
COMMENT ON COLUMN sys_role.data_scope IS '数据范围';
COMMENT ON COLUMN sys_role.is_sys IS '是否系统数据';
COMMENT ON COLUMN sys_role.useable IS '是否可用';
COMMENT ON COLUMN sys_role.create_by IS '创建者';
COMMENT ON COLUMN sys_role.create_date IS '创建时间';
COMMENT ON COLUMN sys_role.update_by IS '更新者';
COMMENT ON COLUMN sys_role.update_date IS '更新时间';
COMMENT ON COLUMN sys_role.remarks IS '备注信息';
COMMENT ON COLUMN sys_role.del_flag IS '删除标记';
COMMENT ON TABLE sys_role_menu IS '角色-菜单';
COMMENT ON COLUMN sys_role_menu.role_id IS '角色编号';
COMMENT ON COLUMN sys_role_menu.menu_id IS '菜单编号';
COMMENT ON TABLE sys_role_office IS '角色-机构';
COMMENT ON COLUMN sys_role_office.role_id IS '角色编号';
COMMENT ON COLUMN sys_role_office.office_id IS '机构编号';
COMMENT ON TABLE sys_user IS '用户表';
COMMENT ON COLUMN sys_user.id IS '编号';
COMMENT ON COLUMN sys_user.company_id IS '归属公司';
COMMENT ON COLUMN sys_user.office_id IS '归属部门';
COMMENT ON COLUMN sys_user.login_name IS '登录名';
COMMENT ON COLUMN sys_user.password IS '密码';
COMMENT ON COLUMN sys_user.no IS '工号';
COMMENT ON COLUMN sys_user.name IS '姓名';
COMMENT ON COLUMN sys_user.email IS '邮箱';
COMMENT ON COLUMN sys_user.phone IS '电话';
COMMENT ON COLUMN sys_user.mobile IS '手机';
COMMENT ON COLUMN sys_user.user_type IS '用户类型';
COMMENT ON COLUMN sys_user.photo IS '用户头像';
COMMENT ON COLUMN sys_user.login_ip IS '最后登陆IP';
COMMENT ON COLUMN sys_user.login_date IS '最后登陆时间';
COMMENT ON COLUMN sys_user.login_flag IS '是否可登录';
COMMENT ON COLUMN sys_user.create_by IS '创建者';
COMMENT ON COLUMN sys_user.create_date IS '创建时间';
COMMENT ON COLUMN sys_user.update_by IS '更新者';
COMMENT ON COLUMN sys_user.update_date IS '更新时间';
COMMENT ON COLUMN sys_user.remarks IS '备注信息';
COMMENT ON COLUMN sys_user.del_flag IS '删除标记';
COMMENT ON TABLE sys_user_role IS '用户-角色';
COMMENT ON COLUMN sys_user_role.user_id IS '用户编号';
COMMENT ON COLUMN sys_user_role.role_id IS '角色编号';



