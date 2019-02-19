SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS oa_leave;




/* Create Tables */

-- 请假流程表
CREATE TABLE oa_leave
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 流程实例编号
	proc_ins_id varchar(64) COMMENT '流程实例编号',
	-- 开始时间
	start_time datetime COMMENT '开始时间',
	-- 结束时间
	end_time datetime COMMENT '结束时间',
	-- 请假类型
	leave_type varchar(20) COMMENT '请假类型',
	-- 请假理由
	reason varchar(255) COMMENT '请假理由',
	-- 部门领导意见
	dept_lead_text varchar(200) COMMENT '部门领导意见',
	-- 人力资源意见
	hr_text varchar(200) COMMENT '人力资源意见',
	-- 申请时间
	apply_time datetime COMMENT '申请时间',
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
) COMMENT = '请假流程表';



