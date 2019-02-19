
/* Drop Tables */

IF ObJECt_ID('[oa_leave]') IS NOT NULL DROP TABLE [oa_leave];




/* Create Tables */

-- 请假流程表
CREATE TABLE [oa_leave]
(
	-- 编号
	[id] varchar(64) NOT NULL,
	-- 流程实例编号
	[proc_ins_id] varchar(64),
	-- 开始时间
	[start_time] datetime,
	-- 结束时间
	[end_time] datetime,
	-- 请假类型
	[leave_type] varchar(20),
	-- 请假理由
	[reason] nvarchar(255),
	-- 部门领导意见
	[dept_lead_text] varchar(200),
	-- 人力资源意见
	[hr_text] varchar(200),
	-- 申请时间
	[apply_time] datetime,
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



