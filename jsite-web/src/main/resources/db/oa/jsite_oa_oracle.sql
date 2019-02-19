
/* Drop Tables */

DROP TABLE oa_leave CASCADE CONSTRAINTS;




/* Create Tables */

-- 请假流程表
CREATE TABLE oa_leave
(
	-- 编号
	id varchar2(64) NOT NULL,
	-- 流程实例编号
	proc_ins_id varchar2(64),
	-- 开始时间
	start_time timestamp,
	-- 结束时间
	end_time timestamp,
	-- 请假类型
	leave_type varchar2(20),
	-- 请假理由
	reason nvarchar2(255),
	-- 部门领导意见
	dept_lead_text varchar2(200),
	-- 人力资源意见
	hr_text varchar2(200),
	-- 申请时间
	apply_time timestamp,
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



/* Comments */

COMMENT ON TABLE oa_leave IS '请假流程表';
COMMENT ON COLUMN oa_leave.id IS '编号';
COMMENT ON COLUMN oa_leave.proc_ins_id IS '流程实例编号';
COMMENT ON COLUMN oa_leave.start_time IS '开始时间';
COMMENT ON COLUMN oa_leave.end_time IS '结束时间';
COMMENT ON COLUMN oa_leave.leave_type IS '请假类型';
COMMENT ON COLUMN oa_leave.reason IS '请假理由';
COMMENT ON COLUMN oa_leave.dept_lead_text IS '部门领导意见';
COMMENT ON COLUMN oa_leave.hr_text IS '人力资源意见';
COMMENT ON COLUMN oa_leave.apply_time IS '申请时间';
COMMENT ON COLUMN oa_leave.create_by IS '创建者';
COMMENT ON COLUMN oa_leave.create_date IS '创建时间';
COMMENT ON COLUMN oa_leave.update_by IS '更新者';
COMMENT ON COLUMN oa_leave.update_date IS '更新时间';
COMMENT ON COLUMN oa_leave.remarks IS '备注信息';
COMMENT ON COLUMN oa_leave.del_flag IS '删除标记';



