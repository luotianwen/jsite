
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gen_scheme_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '生成方案' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
INSERT INTO `gen_scheme` VALUES ('35a13dc260284a728a270db3f382664b', '树结构', 'treeTable', 'com.jsite.modules', 'test', '', '树结构生成', '树结构', 'liuruijun', 'f6e4dafaa72f4c509636484715f33a96', '1', '2013-08-12 13:10:05', '1', '2018-11-20 11:18:53', '', '0');
INSERT INTO `gen_scheme` VALUES ('9c9c0fa251e2465bac25aaa659119b16', '请假流程', 'treeTableAndList', 'com.jsite.modules', 'aa', '', '请假流程', '请假流程', 'liuruijun', '67aa839ada674dbe96bc74b317f10f75', '1', '2018-08-29 12:48:36', '1', '2018-12-26 12:49:55', '', '0');
INSERT INTO `gen_scheme` VALUES ('9c9de9db6da743bb899036c6546061ac', '单表', 'curd', 'com.jsite.modules', 'test', 'danbiao', '单表生成', '单表生成', 'liuruijun', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', '2013-08-12 13:10:05', '1', '2018-12-22 10:47:39', '', '0');
INSERT INTO `gen_scheme` VALUES ('e6d905fd236b46d1af581dd32bdfb3b0', '主子表', 'curd_many', 'com.jsite.modules', 'test', '', '主子表生成', '主子表', 'liuruijun', '43d6d5acffa14c258340ce6765e46c6f', '1', '2013-08-12 13:10:05', '1', '2018-11-20 11:18:35', '', '0');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gen_table_name`(`name`) USING BTREE,
  INDEX `gen_table_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('43d6d5acffa14c258340ce6765e46c6f', 'test_data_main', '业务数据表', 'TestDataMain', NULL, NULL, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', NULL, '0');
INSERT INTO `gen_table` VALUES ('67aa839ada674dbe96bc74b317f10f75', 'oa_leave', '请假流程表', 'OaLeave', '', '', '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', '', '0');
INSERT INTO `gen_table` VALUES ('6e05c389f3c6415ea34e55e9dfb28934', 'test_data_child', '业务数据子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', '2013-08-12 13:10:05', '1', '2018-12-21 23:11:47', NULL, '0');
INSERT INTO `gen_table` VALUES ('aef6f1fc948f4c9ab1c1b780bc471cc2', 'test_data', '业务数据表', 'TestData', '', '', '1', '2013-08-12 13:10:05', '1', '2018-12-25 08:28:20', '', '0');
INSERT INTO `gen_table` VALUES ('f6e4dafaa72f4c509636484715f33a96', 'test_tree', '树结构表', 'TestTree', NULL, NULL, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', NULL, '0');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_row` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否独占一行(流程页面布局使用)',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gen_table_column_table_id`(`gen_table_id`) USING BTREE,
  INDEX `gen_table_column_name`(`name`) USING BTREE,
  INDEX `gen_table_column_sort`(`sort`) USING BTREE,
  INDEX `gen_table_column_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('109e23fedef84b5083f924fbbc46d2b7', '6e05c389f3c6415ea34e55e9dfb28934', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', NULL, NULL, NULL, '1', '1', '1', NULL, '=', 'dateselect', '', NULL, 50, '1', '2018-12-21 22:18:47', '1', '2018-12-21 23:11:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('137318031851419492867f49cc50d754', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_by', '更新者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'updateBy.id', '0', '0', '0', '1', '1', '1', '0', '=', 'input', '', NULL, 100, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('13fc1a1671af468684dc325443e01442', '67aa839ada674dbe96bc74b317f10f75', 'reason', '请假理由', 'varchar(255)', 'String', 'reason', '1', '0', '1', '1', '1', '0', '0', '=', 'textarea', '', NULL, 60, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('185fe2c1ce3e4ca3b2c5278ad4180876', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'sex', '性别', 'char(1)', 'This', 'sex', '0', '0', '1', '1', '1', '0', '0', '=', 'input', '', NULL, 60, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('1aebdd243c1f4a4faba4e1b0fe927332', '67aa839ada674dbe96bc74b317f10f75', 'apply_time', '申请时间', 'datetime', 'java.util.Date', 'applyTime', '0', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 90, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('1fd4616c314240f490570cf8846b1df2', '67aa839ada674dbe96bc74b317f10f75', 'id', '编号', 'varchar(64)', 'String', 'id', '1', '1', '1', '1', '1', '0', '0', '=', 'input', '', NULL, 10, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('216f7b2d0fbb4fd09b81605bde8012e0', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_by', '创建者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'createBy.id', '0', '0', '0', '1', '0', '0', '0', '=', 'input', '', NULL, 80, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('2658b3918d6d468f9ad7abb650b90c4c', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', NULL, NULL, NULL, '1', NULL, NULL, NULL, '=', 'radiobox', 'del_flag', NULL, 130, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('2f3405a2dd7f4bef974aa1df9bcf571e', 'e1a0555aeab445af98769e5cd3a759b8', 'test_data_main_id', '业务主表ID', 'varchar(64)', 'String', 'testDataMainId', NULL, NULL, '1', '1', '1', NULL, NULL, '=', 'input', '', NULL, 20, '1', '2018-12-21 09:44:10', '1', '2018-12-21 09:44:10', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('36de759b257248429a07556074263a0e', '67aa839ada674dbe96bc74b317f10f75', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', NULL, NULL, '1', '1', NULL, NULL, NULL, '=', 'textarea', '', NULL, 140, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('39f87fec41f340f4a405e617d2e644a6', '6e05c389f3c6415ea34e55e9dfb28934', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', NULL, NULL, '1', '1', '1', '1', NULL, '=', 'dateselect', '', NULL, 70, '1', '2018-12-21 22:18:47', '1', '2018-12-21 23:11:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('40175428396a42f989015e99b3d7db65', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'area_id', '归属区域', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'area.id|name', '0', '0', '1', '1', '1', '1', '1', '=', 'areaselect', '', NULL, 40, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('46ab9bffa1494ca29f3cc6e3ff5d196b', '6e05c389f3c6415ea34e55e9dfb28934', 'name', '名称', 'varchar(100)', 'String', 'name', NULL, NULL, '1', '1', '1', '1', '1', 'like', 'input', '', NULL, 30, '1', '2018-12-21 22:18:47', '1', '2018-12-21 23:11:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('55771d60b73148018612ed169c4ff85d', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'name', '名称', 'varchar(100)', 'Custom', 'name', '0', '0', '1', '1', '1', '1', '1', 'like', 'input', '', NULL, 50, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('5d28f1ad944541d2b0507e0ef5090dcb', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '0', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 90, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('60840f1bd21949f382ecc76a556da9fb', '6e05c389f3c6415ea34e55e9dfb28934', 'id', '编号', 'varchar(64)', 'String', 'id', NULL, '1', '1', '1', '1', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-12-21 22:18:47', '1', '2018-12-21 23:11:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('67182329980c4add89492a37ed952aec', 'e1a0555aeab445af98769e5cd3a759b8', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', NULL, NULL, NULL, '1', NULL, NULL, NULL, '=', 'dateselect', '', NULL, 50, '1', '2018-12-21 09:44:11', '1', '2018-12-21 09:44:11', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('682fb7315b3e43dea8ec4a3419924357', '67aa839ada674dbe96bc74b317f10f75', 'proc_ins_id', '流程实例编号', 'varchar(64)', 'String', 'procInsId', '1', '0', '1', '1', '1', '0', '0', '=', 'input', '', NULL, 20, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('695b6a1e4ccf41d89c7eab239a8eb4c0', '67aa839ada674dbe96bc74b317f10f75', 'leave_type', '请假类型', 'varchar(20)', 'String', 'leaveType', '1', '0', '1', '1', '1', '0', '0', '=', 'select', 'oa_leave_type', NULL, 50, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('73dfd0676f8a46c8a3206e1e25d7353a', '6e05c389f3c6415ea34e55e9dfb28934', 'update_by', '更新者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'updateBy.id', NULL, NULL, '1', '1', '1', '1', NULL, '=', 'input', '', NULL, 60, '1', '2018-12-21 22:18:47', '1', '2018-12-21 23:11:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('7eff6d1fb5834242980f1ea16f88d0ff', 'e1a0555aeab445af98769e5cd3a759b8', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', NULL, NULL, '1', '1', '1', '1', NULL, '=', 'textarea', '', NULL, 80, '1', '2018-12-21 09:44:11', '1', '2018-12-21 09:44:11', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('7f4205a1292e4c689ec8b2550c0ee02b', '6e05c389f3c6415ea34e55e9dfb28934', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', NULL, NULL, NULL, '1', NULL, NULL, NULL, '=', 'radiobox', 'del_flag', NULL, 90, '1', '2018-12-21 22:18:47', '1', '2018-12-21 23:11:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('8156527a6d334d99b281e4fa3593b4ff', '67aa839ada674dbe96bc74b317f10f75', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', NULL, NULL, '1', '1', NULL, NULL, NULL, '=', 'dateselect', '', NULL, 130, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('91cc056f39a1439eb1cf8244239cbab5', '67aa839ada674dbe96bc74b317f10f75', 'dept_lead_text', '部门经理意见', 'varchar(255)', 'String', 'deptLeadText', '1', '0', '1', '1', '1', '0', '0', '=', 'input', '', NULL, 70, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('9d189409e4b04cdc9d875fd37e4bb2f4', '6e05c389f3c6415ea34e55e9dfb28934', 'test_data_main_id', '业务主表ID', 'varchar(64)', 'String', 'testDataMainId', NULL, NULL, '1', '1', '1', '1', '1', '=', 'input', '', NULL, 20, '1', '2018-12-21 22:18:47', '1', '2018-12-21 23:11:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('9eeb04c6e4e04057b006cd99aeafb67f', 'e1a0555aeab445af98769e5cd3a759b8', 'create_by', '创建者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'createBy.id', NULL, NULL, NULL, '1', NULL, NULL, NULL, '=', 'input', '', NULL, 40, '1', '2018-12-21 09:44:11', '1', '2018-12-21 09:44:11', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('a139ab434e664fcc82cccdb5db1bf5d4', '67aa839ada674dbe96bc74b317f10f75', 'start_time', '开始时间', 'datetime', 'java.util.Date', 'startTime', '1', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 30, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('a9ba2ee1047d4a6298eee492c1957bd7', 'e1a0555aeab445af98769e5cd3a759b8', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', NULL, NULL, NULL, '1', '1', '1', NULL, '=', 'dateselect', '', NULL, 70, '1', '2018-12-21 09:44:11', '1', '2018-12-21 09:44:11', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('ac36e2526e01408396cc0fa11827f568', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'office_id', '归属部门', 'varchar(64)', 'com.jsite.modules.sys.entity.Office', 'office.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'textarea', '', NULL, 30, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('aff5abcf7b4d456585bca410729f46aa', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'user_id', '归属用户', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'user.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'select', '', NULL, 20, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('b56b0dad527c4dd297a64498593e39a4', 'e1a0555aeab445af98769e5cd3a759b8', 'id', '编号', 'varchar(64)', 'String', 'id', NULL, '1', NULL, '1', NULL, NULL, NULL, '=', 'input', '', NULL, 10, '1', '2018-12-21 09:44:10', '1', '2018-12-21 09:44:10', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('c09c6661bb414c709175f699bf151bdb', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'in_date', '加入日期', 'date', 'java.util.Date', 'inDate', '0', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 70, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('c30f6f46c5af4bd5887758a7bb3bd4cb', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'id', '编号', 'varchar(64)', 'String', 'id', '0', '1', '1', '1', '1', '0', '0', '=', 'checkbox', '', NULL, 10, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('c92aa0e5b2ad40d79c186712cd2a6219', '67aa839ada674dbe96bc74b317f10f75', 'hr_text', '人资意见', 'varchar(255)', 'String', 'hrText', '1', '0', '1', '1', '1', '0', '0', '=', 'input', '', NULL, 80, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('d1389a04cf3949e58bb3adae9b144f32', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', NULL, 120, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('d37615fd13db472daa75df6e6bd89b81', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '1', '0', '=', 'dateselect', '', NULL, 110, '1', '2018-08-29 10:42:40', '1', '2018-12-25 08:28:20', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('da139d71edc14dfa82f1dbd9ea0fe48a', '67aa839ada674dbe96bc74b317f10f75', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', NULL, NULL, NULL, '1', NULL, NULL, NULL, '=', 'radiobox', 'del_flag', NULL, 150, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('e04c6ebd8f4040e4adda96e7a61f4120', 'e1a0555aeab445af98769e5cd3a759b8', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', NULL, NULL, NULL, '1', NULL, NULL, NULL, '=', 'radiobox', 'del_flag', NULL, 90, '1', '2018-12-21 09:44:11', '1', '2018-12-21 09:44:11', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('e53223608a7641fb845504d74a225eaa', '67aa839ada674dbe96bc74b317f10f75', 'update_by', '更新者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'updateBy.id', NULL, NULL, '1', '1', NULL, NULL, NULL, '=', 'input', '', NULL, 120, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('e893aae5259e4980be325330d1b68ed4', '67aa839ada674dbe96bc74b317f10f75', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '1', '0', '0', '0', '=', 'dateselect', '', NULL, 110, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('ec9df9ffdf2a4b388e96970766cc9bcd', '6e05c389f3c6415ea34e55e9dfb28934', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', NULL, NULL, '1', '1', '1', '1', NULL, '=', 'textarea', '', NULL, 80, '1', '2018-12-21 22:18:47', '1', '2018-12-21 23:11:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('ee132c6c8a9f4b719333b31d300a7f0b', '6e05c389f3c6415ea34e55e9dfb28934', 'create_by', '创建者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'createBy.id', NULL, NULL, NULL, '1', '1', NULL, NULL, '=', 'input', '', NULL, 40, '1', '2018-12-21 22:18:47', '1', '2018-12-21 23:11:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('f1632f6e5664473aaffb9ba40bb6a158', 'e1a0555aeab445af98769e5cd3a759b8', 'name', '名称', 'varchar(100)', 'String', 'name', NULL, NULL, '1', '1', '1', '1', '1', 'like', 'input', '', NULL, 30, '1', '2018-12-21 09:44:10', '1', '2018-12-21 09:44:10', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('f8b9fe2ab4d44cdbb72b4f5c8ef8da93', '67aa839ada674dbe96bc74b317f10f75', 'create_by', '创建者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '1', '0', '0', '0', '=', 'input', '', NULL, 100, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('faf0bc828b8441be963ea3d25d2f01fd', '67aa839ada674dbe96bc74b317f10f75', 'end_time', '结束时间', 'datetime', 'java.util.Date', 'endTime', '1', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 40, '1', '2018-08-29 12:45:46', '1', '2018-12-25 19:09:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('fcb6d387a63c4b7c9dc6c0534143386e', 'e1a0555aeab445af98769e5cd3a759b8', 'update_by', '更新者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'updateBy.id', NULL, NULL, NULL, '1', '1', NULL, NULL, '=', 'input', '', NULL, 60, '1', '2018-12-21 09:44:11', '1', '2018-12-21 09:44:11', NULL, '0');

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成文件名',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '内容',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gen_template_del_falg`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代码模板表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oa_leave
-- ----------------------------
DROP TABLE IF EXISTS `oa_leave`;
CREATE TABLE `oa_leave`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `proc_ins_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程实例编号',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请假理由',
  `dept_lead_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `hr_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `apply_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oa_leave_create_by`(`create_by`) USING BTREE,
  INDEX `oa_leave_process_instance_id`(`proc_ins_id`) USING BTREE,
  INDEX `oa_leave_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '请假流程表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oa_leave
-- ----------------------------
INSERT INTO `oa_leave` VALUES ('0387efb30b3e49738b582c5d854a32b6', '577d6e71-06a1-11e9-8afd-00163e2e65eb', '2018-12-17 18:57:10', '2018-12-28 18:57:13', '1', '123132', NULL, NULL, '2018-12-23 18:56:04', '1', '2018-12-23 18:56:04', '1', '2018-12-23 18:56:04', NULL, '0');
INSERT INTO `oa_leave` VALUES ('15b0f661d6834f7987020209a87a149c', '1dd76279-066c-11e9-8afd-00163e2e65eb', '2018-11-29 12:34:57', '2018-12-20 12:34:59', '1', '222', NULL, NULL, '2018-12-23 12:35:04', '1', '2018-12-23 12:35:04', '1', '2018-12-23 12:35:04', NULL, '0');
INSERT INTO `oa_leave` VALUES ('4b87a0820d124133b860a4ecd8f61440', 'e2ae35a9-06ac-11e9-8afd-00163e2e65eb', '2018-12-12 20:18:29', '2018-12-29 20:18:33', '2', '1', NULL, NULL, '2018-12-23 20:18:42', '1', '2018-12-23 20:18:42', '1', '2018-12-23 20:18:42', NULL, '0');
INSERT INTO `oa_leave` VALUES ('56c892cfc7624d11b3a1ffa0ea0d221f', '08249e19-0692-11e9-8afd-00163e2e65eb', '2018-12-25 17:04:38', '2018-12-28 17:04:42', '1', '333', NULL, NULL, '2018-12-23 17:06:28', '1', '2018-12-23 17:06:28', '1', '2018-12-23 17:06:28', NULL, '0');
INSERT INTO `oa_leave` VALUES ('5b0025eaaee2458ba5bbc5678de4ecf5', '2000c06e-05f4-11e9-b751-c85b7643dd9e', '2018-12-22 22:15:55', '2018-12-24 22:15:58', '1', '测试', NULL, NULL, '2018-12-22 22:16:08', '1', '2018-12-22 22:16:08', '1', '2018-12-22 22:16:08', NULL, '0');
INSERT INTO `oa_leave` VALUES ('6095ceced2c54ce09cdf11ab2262768c', 'e82c7fc9-0998-11e9-a3c9-00163e2e65eb', '2018-12-27 13:33:23', '2018-12-28 13:33:25', '1', 'fsdfsd', NULL, NULL, '2018-12-27 13:33:15', '1', '2018-12-27 13:33:15', '1', '2018-12-27 13:33:15', NULL, '0');
INSERT INTO `oa_leave` VALUES ('6623a4f922754f9cae5d210ef8e02ce0', '6a2402bc-05cd-11e9-8544-00163e2e65eb', '2018-12-22 17:38:56', '2018-12-29 17:39:01', '1', '1', '[同意] 同意', '[同意] 同意', '2018-12-22 17:39:02', '1', '2018-12-22 17:39:02', '1', '2018-12-22 17:39:02', NULL, '0');
INSERT INTO `oa_leave` VALUES ('6edd39c56047432796ce9bd4759f482a', '48e8d1ec-0662-11e9-8afd-00163e2e65eb', '2018-12-13 11:24:21', '2018-12-29 11:24:25', '1', 'kkkk', '[驳回] sdsds', NULL, '2018-12-23 11:24:41', '1', '2018-12-23 11:24:41', '1', '2018-12-23 11:45:11', NULL, '0');
INSERT INTO `oa_leave` VALUES ('7790f91457a4450e9cae9e34512bbdf5', '06449ad1-068f-11e9-8afd-00163e2e65eb', '2018-12-23 16:44:45', '2018-12-23 16:44:47', '2', '显存v', NULL, NULL, '2018-12-23 16:44:57', '1', '2018-12-23 16:44:57', '1', '2018-12-23 16:44:57', NULL, '0');
INSERT INTO `oa_leave` VALUES ('81d37452db0646cb9ed93f199ec9f2cc', '0ff64c49-0684-11e9-8afd-00163e2e65eb', '2018-12-23 15:26:21', '2018-12-28 15:26:24', '1', '1', NULL, NULL, '2018-12-23 15:26:28', '1', '2018-12-23 15:26:28', '1', '2018-12-23 15:26:28', NULL, '0');
INSERT INTO `oa_leave` VALUES ('825ebaad47eb4286a33d0e63dec47fe9', '82efd342-0601-11e9-8544-00163e2e65eb', '2018-10-02 23:51:48', '2018-12-22 23:51:51', '1', '//。', '[同意] 我同意啦啊啊啊啊啊啊啊', '[同意] 我同意', '2018-12-22 23:51:57', '1', '2018-12-22 23:51:57', '1', '2018-12-22 23:51:57', NULL, '0');
INSERT INTO `oa_leave` VALUES ('945ed101245c4427aeb2e466ee09566a', 'a02ba20e-065d-11e9-8afd-00163e2e65eb', '2018-12-23 10:51:13', '2018-12-21 10:51:17', '1', 'mnm', '[驳回] jgjhg', NULL, '2018-12-23 10:51:20', '1', '2018-12-23 10:51:20', '1', '2018-12-23 11:05:14', NULL, '0');
INSERT INTO `oa_leave` VALUES ('a57eb8f4b67b4ba09bee5d49ff0882e9', '2f44cdf2-061c-11e9-8afd-00163e2e65eb', '2018-12-23 03:02:42', '2018-12-25 03:02:49', '2', '1', '[同意] fddfdfdfdfdffd', NULL, '2018-12-23 03:02:53', '1', '2018-12-23 03:02:53', '1', '2018-12-23 03:02:53', NULL, '0');
INSERT INTO `oa_leave` VALUES ('c4fdeec6a2e148029d798d7b908b11f5', '5ef97ed4-05d6-11e9-8544-00163e2e65eb', '2018-12-06 18:43:01', '2018-12-12 18:43:03', '1', 'dfffff', NULL, NULL, '2018-12-22 18:43:09', '1', '2018-12-22 18:43:09', '1', '2018-12-22 18:43:09', NULL, '0');
INSERT INTO `oa_leave` VALUES ('ebd651f8d8d340619b2f9a4a027ff1bb', '1b471351-066f-11e9-8afd-00163e2e65eb', '2018-12-06 12:56:22', '2018-12-23 12:56:25', '1', '11', NULL, NULL, '2018-12-23 12:56:28', '1', '2018-12-23 12:56:28', '1', '2018-12-23 12:56:28', NULL, '0');
INSERT INTO `oa_leave` VALUES ('f9fe90cbf5474b37b6c6ce4747a55b0c', '01ac5e41-06c8-11e9-8afd-00163e2e65eb', '2018-12-12 23:32:32', '2018-12-23 23:32:37', '3', 'yy', NULL, NULL, '2018-12-23 23:32:50', '1', '2018-12-23 23:32:50', '1', '2018-12-23 23:32:50', NULL, '0');

-- ----------------------------
-- Table structure for oa_notify
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify`;
CREATE TABLE `oa_notify`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '附件',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oa_notify_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知通告' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oa_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify_record`;
CREATE TABLE `oa_notify_record`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '通知通告ID',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '阅读标记',
  `read_date` date NULL DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oa_notify_record_notify_id`(`oa_notify_id`) USING BTREE,
  INDEX `oa_notify_record_user_id`(`user_id`) USING BTREE,
  INDEX `oa_notify_record_read_flag`(`read_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知通告发送记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oa_test_audit
-- ----------------------------
DROP TABLE IF EXISTS `oa_test_audit`;
CREATE TABLE `oa_test_audit`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `OA_TEST_AUDIT_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '审批流程测试表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '区域编码',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否树形叶子节点（0:不是,1:是）',
  `tree_level` decimal(4, 0) NULL DEFAULT NULL COMMENT '树形层级(0:根级)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_area_parent_id`(`parent_id`) USING BTREE,
  INDEX `sys_area_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '区域表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('015345144e9e40d6bbe832a9f1cba1f7', 'd36735ce07044a49ad205854fb2ca078', '0,d36735ce07044a49ad205854fb2ca078,', 'California', 10, '01', '2', '1', '2018-06-20 17:32:51', '1', '2018-06-20 17:32:51', '', '0', '1', 1);
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', 10, '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-12-26 16:43:15', '', '0', '0', 0);
INSERT INTO `sys_area` VALUES ('3fbaf3a3f58a47118f13976cb2e2544d', 'd36735ce07044a49ad205854fb2ca078', '0,d36735ce07044a49ad205854fb2ca078,', '佛罗里达州', 20, '02', '2', '1', '2018-06-20 17:38:08', '1', '2018-06-20 17:38:08', '', '0', '1', 1);
INSERT INTO `sys_area` VALUES ('576f42bae8184b4cbb39aa4640323a5f', '1', '0,1,', 'aaaaaaabb', 30, '', '2', '1', '2018-12-10 14:27:27', '1', '2018-12-10 14:27:27', '', '1', '1', 1);
INSERT INTO `sys_area` VALUES ('623c16905c3b4854b131fb8f034364d4', '1', '0,1,', '上海', 30, '34243', '2', '1', '2018-12-10 13:47:40', '1', '2018-12-10 13:47:40', '', '1', '1', 1);
INSERT INTO `sys_area` VALUES ('95d742f57c1f44af9bccac34ce0dacb4', '1', '0,1,', 'aaaaaaa', 30, '', '2', '1', '2018-12-10 14:01:28', '1', '2018-12-10 14:01:28', '', '1', '1', 1);
INSERT INTO `sys_area` VALUES ('d36735ce07044a49ad205854fb2ca078', '0', '0,', '美国', 30, '2', '1', '1', '2018-06-20 15:36:19', '1', '2018-06-20 15:36:19', '', '0', '0', 0);
INSERT INTO `sys_area` VALUES ('da2da01621b64be5a85b07a8c883228f', '1', '0,1,', '上海', 30, '34243', '2', '1', '2018-12-10 14:01:09', '1', '2018-12-10 14:01:09', '', '0', '1', 1);
INSERT INTO `sys_area` VALUES ('f762fb569d8445f28a226a9b831cfb90', '1', '0,1,', '北京', 30, '150', '2', '1', '2018-02-02 17:37:51', '1', '2018-11-20 10:22:36', '', '0', '1', 1);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据值',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '描述',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`label`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', 40, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型', 50, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('101', 'com.jsite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型', 60, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.jsite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型', 70, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.jsite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型', 80, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', 90, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('105', '1', '会议通告\0\0', 'oa_notify_type', '通知通告类型', 10, '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('106', '2', '奖惩通告\0\0', 'oa_notify_type', '通知通告类型', 20, '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('107', '3', '活动通告\0\0', 'oa_notify_type', '通知通告类型', 30, '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', 10, '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', 20, '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', 50, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', 10, '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', 20, '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份/直辖市', 'sys_area_type', '区域类型', 20, '0', '1', '2013-05-27 08:00:00', '1', '2018-06-15 14:46:37', '', '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市/州', 'sys_area_type', '区域类型', 30, '0', '1', '2013-05-27 08:00:00', '1', '2018-06-15 14:47:38', '', '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '县/区', 'sys_area_type', '区域类型', 40, '0', '1', '2013-05-27 08:00:00', '1', '2018-06-15 14:48:01', '', '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', 60, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', 70, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', 80, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', 90, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', 40, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('26f56c93297146ca869fb1924569d5fc', '0', '停用', 'sys_user_status', '用户状态（0-停用，1-正常）', 10, '0', '1', '2018-06-29 08:40:36', '1', '2018-06-29 08:40:36', '', '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', 50, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', 40, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', 40, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', 50, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', 90, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', 100, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('49fefff665614e80b8c0e91902f2c817', 'images/userinfo.png', '默认头像', 'default_headphoto_big', '默认头像(大图)', 10, '0', '1', '2018-07-30 11:58:29', '1', '2018-07-30 13:41:11', '默认头像(原图)', '0');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('631f38d9f5e24dc88fdb472f4855d68d', '1', '正常', 'sys_user_status', '用户状态（0-停用，1-正常）', 20, '0', '1', '2018-06-29 08:41:42', '1', '2018-06-29 08:41:42', '', '0');
INSERT INTO `sys_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('6437d5741af64dca861fe5bec7994891', '1', '显示', 'sys_show_hide', '显示-隐藏', 10, '0', '1', '2018-06-25 18:21:38', '1', '2018-06-25 18:21:38', '显示-隐藏', '0');
INSERT INTO `sys_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', 40, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', 60, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', 30, '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', 40, '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('71', 'leave', '请假流程', 'act_category', '流程分类', 10, '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('72', 'metting', '会议室申请流程', 'act_category', '流程分类', 20, '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', 10, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', 20, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', 30, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', 10, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', 20, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', 30, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', 40, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', 50, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', 60, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', 70, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', 80, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', 10, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', 20, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', 30, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', 40, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', 50, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', 60, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', 70, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', 80, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', 90, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', 10, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', 20, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0\0\0', 40, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', 10, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', 20, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', 30, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', 40, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('a6aff6268f1f4d77952f3424b5e843d6', '123456', 'default_password', 'default_pass', '系统默认配置密码', 10, '0', '1', '2018-07-03 11:40:03', '1', '2018-07-03 11:40:03', '', '0');
INSERT INTO `sys_dict` VALUES ('a8a0aeb824d84d73ad1cca1bdc35c8dc', '5', '乡/镇', 'sys_area_type', '区域类型', 50, '0', '1', '2018-06-15 14:48:45', '1', '2018-06-15 14:48:45', '', '0');
INSERT INTO `sys_dict` VALUES ('c3f4554124e64c4a9cf96ebe94e55ade', '6', '村/社区', 'sys_area_type', '区域类型', 60, '0', '1', '2018-06-15 14:49:25', '1', '2018-06-15 14:49:25', '', '0');
INSERT INTO `sys_dict` VALUES ('da5b5781a8604398aea411a3949b8486', '0', '隐藏', 'sys_show_hide', '显示-隐藏', 10, '0', '1', '2018-06-25 18:22:06', '1', '2018-06-25 18:22:06', '显示-隐藏', '0');
INSERT INTO `sys_dict` VALUES ('edc2e89282bb4eeba397857a2cfb6b33', 'com.jsite.modules.oa.leave', '请假流程1', 'act_category', '请假流程111', 10, '0', '1', '2018-08-03 10:37:05', '1', '2018-08-03 10:37:05', '', '0');
INSERT INTO `sys_dict` VALUES ('ee843534a2884752bf2ebd2444551771', 'images/userinfo.png', '默认头像', 'default_headphoto_small', '默认头像(缩略图)', 10, '0', '1', '2018-07-30 11:52:22', '1', '2018-07-30 11:56:54', '默认小头像(缩略图)图片路径', '0');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `file_tree_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '文件分类',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '文件名称',
  `save_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '服务器文件保存名称',
  `file_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件大小',
  `path` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件路径',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '文件' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('15e0f0655f0949899e6df9353654e41e', 'b7803810cc734b90a3f44643fad06bd7', 'git命令.txt', NULL, '539', 'common/b7803810cc734b90a3f44643fad06bd7\\20180727\\git命令.txt', '1', '2018-07-27 15:40:29', '1', '2018-07-27 15:40:29', NULL, '0');
INSERT INTO `sys_file` VALUES ('354d0ad6df5f4b81a6df003967b8dde3', '018abc93050045dd8f419c14c1a5bfd5', 'picture.jpg', NULL, '157296', 'common/018abc93050045dd8f419c14c1a5bfd5\\20180625\\picture.jpg', '1', '2018-06-25 15:44:40', '1', '2018-06-25 15:44:40', NULL, '1');
INSERT INTO `sys_file` VALUES ('47348b3a5ee94d8e8d0a6d4b0d728b12', 'f1d7c9459a5a44adb38ed662bd5d682f', '新建文本文档.txt', NULL, '4890', 'common/f1d7c9459a5a44adb38ed662bd5d682f\\20180613\\新建文本文档.txt', '1', '2018-06-13 14:40:09', '1', '2018-06-13 14:40:09', NULL, '1');
INSERT INTO `sys_file` VALUES ('48b4b3ab2e064d4a9113318bcf5ddec8', '018abc93050045dd8f419c14c1a5bfd5', 'picture.jpg', NULL, '157296', 'common/7a0440b426f94db1b5b79772210437d2\\20180709\\picture.jpg', '1', '2018-07-09 10:41:49', '1', '2018-07-09 10:46:44', NULL, '0');
INSERT INTO `sys_file` VALUES ('4e9aea81e3234813bae688162b032e88', '8c5b5246330e42f4adb0593b1db498b4', 'BluetoothGet.zip', NULL, '2774021', 'F:\\git\\itamcs\\src\\main\\webapp\\upload\\common/7a0440b426f94db1b5b79772210437d2\\20180611\\BluetoothGet.zip', '1', '2018-06-11 10:20:13', '1', '2018-06-27 09:27:01', NULL, '1');
INSERT INTO `sys_file` VALUES ('5121fa6273e743a7912a58cc5a15ba2f', '8c5b5246330e42f4adb0593b1db498b4', '安装配置教程.docx', NULL, '429193', 'common/8c5b5246330e42f4adb0593b1db498b4/20181214/安装配置教程.docx', '1', '2018-12-14 09:37:00', '1', '2018-12-14 09:37:00', NULL, '0');
INSERT INTO `sys_file` VALUES ('5e3fff31d0724f5d89ab106519e8634a', '8c5b5246330e42f4adb0593b1db498b4', 'XXX旅游APP项目功能模块20180528.xlsx', NULL, '19530', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180803\\XXX旅游APP项目功能模块20180528.xlsx', '1', '2018-08-03 09:37:09', '1', '2018-08-03 09:37:09', NULL, '0');
INSERT INTO `sys_file` VALUES ('6770be70d39d432d802150b41af00370', '8c5b5246330e42f4adb0593b1db498b4', 'PictureUnlock_gf_11393.pictureunlock.jpg', NULL, '103041', 'common/8c5b5246330e42f4adb0593b1db498b4/20181214/PictureUnlock_gf_11393.pictureunlock.jpg', '1', '2018-12-14 21:25:23', '1', '2018-12-14 21:25:23', NULL, '0');
INSERT INTO `sys_file` VALUES ('6f061e5b673c4a35981aba68b5feb771', '8c5b5246330e42f4adb0593b1db498b4', 'git命令.txt', NULL, '871', 'common/8c5b5246330e42f4adb0593b1db498b4\\20181211\\git命令.txt', '1', '2018-12-11 10:42:40', '1', '2018-12-11 10:42:40', NULL, '0');
INSERT INTO `sys_file` VALUES ('802ae641d0d84c488143885487a2d937', '8c5b5246330e42f4adb0593b1db498b4', 'IT资产管控平台初设说明书-20180408001.docx', NULL, '1438387', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180803\\IT资产管控平台初设说明书-20180408001.docx', '1', '2018-08-03 09:44:42', '1', '2018-08-03 09:44:42', NULL, '0');
INSERT INTO `sys_file` VALUES ('a3ececf035d84d9280b1c4b2ae614074', 'f1d7c9459a5a44adb38ed662bd5d682f', 'BeyondAdmin-master.zip', NULL, '2425874', 'F:\\git\\itamcs\\src\\main\\webapp\\upload\\common/f1d7c9459a5a44adb38ed662bd5d682f\\20180611\\BeyondAdmin-master.zip', '1', '2018-06-11 11:06:27', '1', '2018-06-11 11:06:27', NULL, '1');
INSERT INTO `sys_file` VALUES ('bee545f738e941b18c321189fd962f8b', '8c5b5246330e42f4adb0593b1db498b4', '解决问题罗列.txt', NULL, '22351', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180709\\解决问题罗列.txt', '1', '2018-07-09 16:15:38', '1', '2018-07-09 16:15:38', NULL, '0');
INSERT INTO `sys_file` VALUES ('cde9fce0e36e479682f87121bbedb3be', '11da634ddacb4129bb2c4f14854585f5', 'imageclip.html', NULL, '7707', 'common/11da634ddacb4129bb2c4f14854585f5\\20180709\\imageclip.html', '1', '2018-07-09 11:46:48', '1', '2018-07-09 11:46:48', NULL, '0');
INSERT INTO `sys_file` VALUES ('d67606c039784624955e8155032662de', '8c5b5246330e42f4adb0593b1db498b4', '大屏修改反馈-20180416.docx', NULL, '2297953', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180709\\大屏修改反馈-20180416.docx', '1', '2018-07-09 16:15:39', '1', '2018-07-09 16:15:39', NULL, '0');
INSERT INTO `sys_file` VALUES ('da2ac86c3d934295a4d2bfd15518698b', '7a0440b426f94db1b5b79772210437d2', 'note.html', NULL, '1063', 'common/7a0440b426f94db1b5b79772210437d2/20180612/note.html', '1', '2018-06-12 11:56:54', '1', '2018-06-12 11:56:54', NULL, '1');
INSERT INTO `sys_file` VALUES ('fc7cb4ccf7ae42dfa6f81463006bf8eb', '8c5b5246330e42f4adb0593b1db498b4', 'aac.txt', NULL, '3484', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180823\\aac.txt', '1', '2018-08-23 10:57:50', '1', '2018-08-23 10:57:50', NULL, '0');

-- ----------------------------
-- Table structure for sys_file_tree
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_tree`;
CREATE TABLE `sys_file_tree`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否树形叶子节点（0:不是,1:是）',
  `tree_level` decimal(4, 0) NOT NULL COMMENT '树形层级(0:根级)',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '文件分类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_file_tree
-- ----------------------------
INSERT INTO `sys_file_tree` VALUES ('018abc93050045dd8f419c14c1a5bfd5', '2bacb604df77451d9ef9c60494c4a5b3', '0,c9265b260c1845b6b46462acd36e4304,2bacb604df77451d9ef9c60494c4a5b3', '1', 2, 'ffff', 1, '1', '2018-06-04 14:40:37', '1', '2018-06-04 14:40:37', '', '0');
INSERT INTO `sys_file_tree` VALUES ('11da634ddacb4129bb2c4f14854585f5', '5dbb8533c98b4869901270ae2eb4d0ad', '0,5dbb8533c98b4869901270ae2eb4d0ad', '0', 1, 'aaa', 3, '1', '2018-06-05 09:58:58', '1', '2018-06-06 18:11:33', '', '0');
INSERT INTO `sys_file_tree` VALUES ('12fe7758f865410283b26ee134f8a0bf', '11da634ddacb4129bb2c4f14854585f5', '0,5dbb8533c98b4869901270ae2eb4d0ad,11da634ddacb4129bb2c4f14854585f5', '1', 2, 'bbb', 5, '1', '2018-06-05 09:59:24', '1', '2018-06-06 18:11:33', '', '0');
INSERT INTO `sys_file_tree` VALUES ('2bacb604df77451d9ef9c60494c4a5b3', 'c9265b260c1845b6b46462acd36e4304', '0,c9265b260c1845b6b46462acd36e4304', '0', 1, '2', 2, '1', '2018-03-28 14:41:39', '1', '2018-06-04 17:01:59', '2', '0');
INSERT INTO `sys_file_tree` VALUES ('5dbb8533c98b4869901270ae2eb4d0ad', '0', '0', '0', 0, 'mmm', 4, '1', '2018-06-06 09:58:30', '1', '2018-06-06 18:11:32', '', '0');
INSERT INTO `sys_file_tree` VALUES ('7a0440b426f94db1b5b79772210437d2', 'f1d7c9459a5a44adb38ed662bd5d682f', '0,c9265b260c1845b6b46462acd36e4304,2bacb604df77451d9ef9c60494c4a5b3,f1d7c9459a5a44adb38ed662bd5d682f', '1', 3, 'ccc', 10, '1', '2018-06-05 09:59:11', '1', '2018-06-06 18:11:55', '', '0');
INSERT INTO `sys_file_tree` VALUES ('885944d2b2784fe68a4a33c276eaa229', '9e31a73796a242009c89995c2de86bbb', '0,5dbb8533c98b4869901270ae2eb4d0ad,9e31a73796a242009c89995c2de86bbb', '1', 2, 'ggg', 3, '1', '2018-06-04 13:56:48', '1', '2018-06-06 17:34:56', 'dxxa', '0');
INSERT INTO `sys_file_tree` VALUES ('8c5b5246330e42f4adb0593b1db498b4', 'b7803810cc734b90a3f44643fad06bd7', '0,c9265b260c1845b6b46462acd36e4304,b7803810cc734b90a3f44643fad06bd7', '1', 2, '5', 3, '1', '2018-06-04 13:54:18', '1', '2018-06-04 13:54:18', '', '0');
INSERT INTO `sys_file_tree` VALUES ('9e31a73796a242009c89995c2de86bbb', '5dbb8533c98b4869901270ae2eb4d0ad', '0,5dbb8533c98b4869901270ae2eb4d0ad', '0', 1, 'wowowow', 4, '1', '2018-06-04 16:45:08', '1', '2018-06-06 17:45:28', '', '0');
INSERT INTO `sys_file_tree` VALUES ('b7803810cc734b90a3f44643fad06bd7', 'c9265b260c1845b6b46462acd36e4304', '0,c9265b260c1845b6b46462acd36e4304', '0', 1, '1', 1, '1', '2018-03-28 14:41:23', '1', '2018-03-28 14:41:23', '1', '0');
INSERT INTO `sys_file_tree` VALUES ('c07436d34ed8412ebfd65c7d7139283d', '0', '0', '0', 0, 'testMode', 120, '1', '2018-07-27 15:30:33', '1', '2018-07-27 16:55:25', 'safsf', '0');
INSERT INTO `sys_file_tree` VALUES ('c9265b260c1845b6b46462acd36e4304', '0', '0', '0', 0, '默认', 0, '1', '2018-03-28 14:33:54', '1', '2018-06-05 10:01:53', NULL, '0');
INSERT INTO `sys_file_tree` VALUES ('f1d7c9459a5a44adb38ed662bd5d682f', '2bacb604df77451d9ef9c60494c4a5b3', '0,c9265b260c1845b6b46462acd36e4304,2bacb604df77451d9ef9c60494c4a5b3', '0', 2, 'test', 3, '1', '2018-06-04 14:39:45', '1', '2018-06-06 18:11:55', '1111', '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作方式',
  `params` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '操作提交的数据',
  `exception` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_by`) USING BTREE,
  INDEX `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX `sys_log_type`(`type`) USING BTREE,
  INDEX `sys_log_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_mdict_parent_id`(`parent_id`) USING BTREE,
  INDEX `sys_mdict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多级字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否树形叶子节点（0:不是,1:是）',
  `tree_level` decimal(4, 0) NOT NULL COMMENT '树形层级(0:根级)',
  `href` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '链接',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图标',
  `is_show` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_menu_parent_id`(`parent_id`) USING BTREE,
  INDEX `sys_menu_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('10', '3', '0,2,3,', '字典管理', 60, '0', 2, '/sys/dict/', '', 'fa fa-columns', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-04 17:14:49', '', '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,2,', '机构用户', 970, '0', 1, '', '', 'fa fa-th-large', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-05-11 09:46:02', '', '0');
INSERT INTO `sys_menu` VALUES ('13e52acca1254df283520c9ee3db769b', '4', '0,2,3,4,', '编辑', 60, '1', 3, '', '', 'fa fa-circle-thin', '1', 'sys:menu:edit', '1', '2018-07-04 16:17:40', '1', '2018-07-04 16:17:40', '', '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,2,13,', '区域管理', 50, '0', 2, '/sys/area/', '', 'fa fa-map', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-05 10:36:49', '', '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,2,13,', '机构管理', 40, '0', 2, '/sys/office/', '', 'fa fa-puzzle-piece', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-05 10:35:25', '', '0');
INSERT INTO `sys_menu` VALUES ('185e17bc1e5b4fa8a997b8c86a828f1d', '9c37ebfd00764ec99f7c65107faca3d1', '0,56,9c37ebfd00764ec99f7c65107faca3d1,', '查看', 30, '1', 2, '', '', 'fa fa-circle-thin', '0', 'filetree:sysFileTree:view', '1', '2018-07-05 09:08:10', '1', '2018-07-27 15:21:28', '', '0');
INSERT INTO `sys_menu` VALUES ('1cbff3f7903c4276902db28ed9e5916e', '7', '0,2,3,7,', '查看', 30, '1', 3, '', '', 'fa fa-circle-thin', '1', 'sys:role:view', '1', '2018-07-04 16:45:37', '1', '2018-07-04 16:45:37', '', '0');
INSERT INTO `sys_menu` VALUES ('1cc9a6712a86420d9557bbf52b24680a', '14', '0,2,13,14,', '编辑', 60, '1', 3, '', '', 'fa fa-circle-thin', '0', 'sys:area:edit', '1', '2018-07-05 10:36:25', '1', '2018-07-05 10:36:25', '', '0');
INSERT INTO `sys_menu` VALUES ('1e43e4e03d724542b1a31f8c0593ca33', 'b06b6eae9f714d028480d6b6c114d498', '0,56,b06b6eae9f714d028480d6b6c114d498,', '查看', 30, '1', 2, '', '', '', '0', 'file:sysFile:view', '1', '2018-03-28 17:05:35', '1', '2018-07-27 15:22:00', '', '0');
INSERT INTO `sys_menu` VALUES ('2', '0', '0,', '系统管理', 80, '0', 0, '', '', 'icon-settings', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-05-18 09:12:14', '', '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,2,13,', '用户管理', 30, '0', 2, '/sys/user/index', '', 'fa fa-users', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-05 10:32:22', '', '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,2,', '关于帮助', 990, '1', 1, '', '', '', '0', '', '1', '2013-05-27 08:00:00', '1', '2018-04-18 14:41:45', '', '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,2,23,', '官方首页', 30, '1', 2, 'http://jsite.org.cn', '_blank', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-04-18 10:53:18', '', '0');
INSERT INTO `sys_menu` VALUES ('246838c40d334f2f9f929b5292771bc8', '62', '0,62,', '已办任务', 30, '1', 1, '/act/task/historic', '', 'fa fa-circle-thin', '1', '', '1', '2018-08-07 14:58:35', '1', '2018-08-07 14:58:35', '', '0');
INSERT INTO `sys_menu` VALUES ('28', '0', '0,', '个人中心', 50, '0', 0, '', '', 'icon-user', '0', '', '1', '2013-05-27 08:00:00', '1', '2018-06-26 14:13:44', '', '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,28,', '个人信息', 30, '1', 1, '/sys/user/info', '', 'icon-user-following', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-06-26 18:13:35', '', '0');
INSERT INTO `sys_menu` VALUES ('294700ca86cc45eba00fb7e6c6f2b121', 'b06b6eae9f714d028480d6b6c114d498', '0,56,b06b6eae9f714d028480d6b6c114d498,', '编辑', 60, '1', 2, '', '', '', '0', 'file:sysFile:edit', '1', '2018-03-28 17:06:13', '1', '2018-07-27 15:22:13', '', '0');
INSERT INTO `sys_menu` VALUES ('2f436a3b76924563acf09132adfe666e', '2', '0,2,', '在线人员', 1020, '1', 1, '/sys/online/list', '', 'icon-user-following', '0', 'sys:online:view,sys:online:edit', '1', '2018-08-30 16:34:49', '1', '2018-08-30 16:34:49', '', '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,2,', '系统设置', 980, '0', 1, '', '', 'fa fa-gear', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-05-11 11:59:04', '', '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,28,', '修改密码', 40, '1', 1, '/sys/user/modifyPwd', '', 'icon-lock', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-06-26 15:17:38', '', '0');
INSERT INTO `sys_menu` VALUES ('31', '0', '0,', '内容管理', 5000, '0', 0, '', '', 'icon-note', '0', '', '1', '2013-05-27 08:00:00', '1', '2018-06-28 08:48:56', '', '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,31,', '栏目设置', 990, '1', 1, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,31,32', '栏目管理', 30, '1', 2, '/cms/category/', NULL, 'align-justify', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '0,31,32,33,', '查看', 30, '1', 3, NULL, NULL, NULL, '0', 'cms:category:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,31,32,33,', '修改', 40, '1', 3, NULL, NULL, NULL, '0', 'cms:category:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,31,32', '站点设置', 40, '1', 2, '/cms/site/', NULL, 'certificate', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('37', '36', '0,31,32,36,', '查看', 30, '1', 3, NULL, NULL, NULL, '0', 'cms:site:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,31,32,36,', '修改', 40, '1', 3, NULL, NULL, NULL, '0', 'cms:site:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,31,32', '切换站点', 50, '1', 2, '/cms/site/select', NULL, 'retweet', '1', 'cms:site:select', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,2,3,', '菜单管理', 30, '0', 2, '/sys/menu/', '', 'fa fa-list-alt', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-04 16:17:54', '', '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,31,', '内容管理', 500, '1', 1, NULL, NULL, NULL, '1', 'cms:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,31,40,', '内容发布', 30, '1', 2, '/cms/', NULL, 'briefcase', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,31,40,41,', '文章模型', 40, '1', 3, '/cms/article/', NULL, 'file', '0', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('43', '42', '0,31,40,41,42,', '查看', 30, '1', 4, NULL, NULL, NULL, '0', 'cms:article:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,31,40,41,42,', '修改', 40, '1', 4, NULL, NULL, NULL, '0', 'cms:article:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,31,40,41,42,', '审核', 50, '1', 4, NULL, NULL, NULL, '0', 'cms:article:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,31,40,41,', '链接模型', 60, '1', 3, '/cms/link/', NULL, 'random', '0', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '0,31,40,41,46,', '查看', 30, '1', 4, NULL, NULL, NULL, '0', 'cms:link:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,31,40,41,46,', '修改', 40, '1', 4, NULL, NULL, NULL, '0', 'cms:link:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,31,40,41,46,', '审核', 50, '1', 4, NULL, NULL, NULL, '0', 'cms:link:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('4b2965d0d0f7460e969abc2eb07f1560', '62', '0,62,', '发起流程', 50, '1', 1, '/act/task/process', '', 'fa fa-circle-thin', '1', '', '1', '2018-08-07 15:07:41', '1', '2018-08-20 14:22:31', '', '0');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,31,40,', '评论管理', 40, '1', 2, '/cms/comment/?status=2', NULL, 'comment', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('51', '50', '0,31,40,50,', '查看', 30, '1', 3, NULL, NULL, NULL, '0', 'cms:comment:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,31,40,50,', '审核', 40, '1', 3, NULL, NULL, NULL, '0', 'cms:comment:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,31,40,', '公共留言', 80, '1', 2, '/cms/guestbook/?status=2', NULL, 'glass', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('53365d59807c448b926fb3766b783c1f', '10', '0,2,3,10,', '查看', 30, '1', 3, '', '', 'fa fa-circle-thin', '1', 'sys:dict:view', '1', '2018-07-04 17:14:31', '1', '2018-07-04 17:14:31', '', '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '0,31,40,53,', '查看', 30, '1', 3, NULL, NULL, NULL, '0', 'cms:guestbook:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,31,40,53,', '审核', 40, '1', 3, NULL, NULL, NULL, '0', 'cms:guestbook:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('56', '0', '0,', '文件管理', 120, '0', 0, '', '', 'icon-folder', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-06-28 08:47:09', '', '0');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,31,', '统计分析', 600, '1', 1, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,31,60,', '信息量统计', 30, '1', 2, '/cms/stats/article', NULL, 'tasks', '1', 'cms:stats:article', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('62', '0', '0,', '在线办公', 20, '0', 0, '', '', 'icon-cloud-upload', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-06-28 08:48:13', '', '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,2,', '日志查询', 985, '0', 1, '', '', 'fa fa-calendar', '1', '', '1', '2013-06-03 08:00:00', '1', '2018-05-11 10:12:56', '', '0');
INSERT INTO `sys_menu` VALUES ('67a7d3780a704dff89d5c6467370bea4', 'fbe403d809b0400d9d36df16cb56abf2', '0,fbe403d809b0400d9d36df16cb56abf2,', '单表生成', 30, '1', 1, '/test/danbiao/testData', '', 'fa fa-circle-thin', '1', 'test:danbiao:testData:view,test:danbiao:testData:edit', '1', '2018-12-19 17:00:12', '1', '2018-12-19 17:00:12', '', '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,2,67,', '日志查询', 30, '1', 2, '/sys/log', '', 'fa fa-edit', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2018-05-11 10:16:51', '', '0');
INSERT INTO `sys_menu` VALUES ('69', '0', '0,', '流程管理', 100, '0', 0, '', '', 'icon-equalizer', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-08-02 09:08:56', '', '0');
INSERT INTO `sys_menu` VALUES ('6c7a6cff4a6a45058291bbf09ff3e780', '17', '0,2,13,17,', '查看', 30, '1', 3, '', '', 'fa fa-circle-thin', '0', 'sys:office:view', '1', '2018-07-05 10:33:26', '1', '2018-07-05 10:33:26', '', '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,2,3,', '角色管理', 50, '0', 2, '/sys/role/', '', 'icon-social-dropbox', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-06 14:43:59', '', '0');
INSERT INTO `sys_menu` VALUES ('70', '69', '0,69,', '流程管理', 30, '1', 1, '/act/process', '', 'fa fa-circle-thin', '1', 'act:process:edit', '1', '2013-05-27 08:00:00', '1', '2018-08-02 09:09:21', '', '0');
INSERT INTO `sys_menu` VALUES ('72', '69', '0,69,', '模型管理', 40, '1', 1, '/act/model', '', 'fa fa-circle-thin', '1', 'act:model:edit', '1', '2013-09-20 08:00:00', '1', '2018-08-02 09:10:06', '', '0');
INSERT INTO `sys_menu` VALUES ('7eeda5473bff486895a2df0262bd55f4', '62', '0,62,', '请假流程：发起|办理权限', 70, '1', 2, '', '', '', '0', 'oa:leave:view,oa:leave:edit', '1', '2018-08-15 14:40:25', '1', '2018-08-15 17:22:11', '', '0');
INSERT INTO `sys_menu` VALUES ('81', 'af9b8c36092b40b2864054e75890608e', '0,af9b8c36092b40b2864054e75890608e,', '生成方案配置', 30, '1', 1, '/gen/genScheme', '', 'fa fa-circle-thin', '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2018-05-11 10:03:25', '', '0');
INSERT INTO `sys_menu` VALUES ('82', 'af9b8c36092b40b2864054e75890608e', '0,af9b8c36092b40b2864054e75890608e,', '业务表配置', 20, '1', 1, '/gen/genTable', '', 'fa fa-circle-thin', '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2018-05-11 10:03:11', '', '0');
INSERT INTO `sys_menu` VALUES ('83', 'af9b8c36092b40b2864054e75890608e', '0,af9b8c36092b40b2864054e75890608e,', '代码模板管理', 90, '1', 1, '/gen/genTemplate', '', 'fa fa-circle-thin', '0', 'gen:genTemplate:view,gen:genTemplate:edit', '1', '2013-10-16 08:00:00', '1', '2018-07-05 10:40:27', '', '0');
INSERT INTO `sys_menu` VALUES ('8308c0438092480997f4712ae8308827', '62', '0,62,', '已发任务', 40, '1', 1, '/act/task/hasSent', '', 'fa fa-circle-thin', '1', '', '1', '2018-08-09 20:28:01', '1', '2018-08-13 18:14:55', '', '0');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,2,67,', '连接池监视', 40, '1', 2, '/../druid', '', 'fa fa-link', '1', '', '1', '2013-10-18 08:00:00', '1', '2018-05-11 10:16:02', '', '0');
INSERT INTO `sys_menu` VALUES ('88', '62', '0,62,', '通知通告', 60, '0', 1, '', '', 'icon-volume-2', '1', '', '1', '2013-11-08 08:00:00', '1', '2018-08-02 09:05:01', '', '0');
INSERT INTO `sys_menu` VALUES ('89', '88', '0,62,88,', '我的通告', 30, '1', 2, '/oa/oaNotify/self', '', 'fa fa-circle-thin', '1', '', '1', '2013-11-08 08:00:00', '1', '2018-08-02 09:12:37', '', '0');
INSERT INTO `sys_menu` VALUES ('90', '88', '0,62,88,', '通告管理', 50, '1', 2, '/oa/oaNotify', '', 'fa fa-circle-thin', '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', '2013-11-08 08:00:00', '1', '2018-08-02 09:12:46', '', '0');
INSERT INTO `sys_menu` VALUES ('95db821b31cd4670ab51b115ce73d271', '62', '0,62,', '待办任务', 20, '1', 1, '/act/task/todo', '', 'fa fa-circle-thin', '1', 'act:process:view,act:process:edit', '1', '2018-08-07 14:57:37', '1', '2018-12-22 22:47:45', '', '0');
INSERT INTO `sys_menu` VALUES ('960d503ac572449bae996bfc928f1bf3', '7', '0,2,3,7,', '编辑', 60, '1', 3, '', '', 'fa fa-circle-thin', '1', 'sys:role:edit', '1', '2018-07-04 16:46:18', '1', '2018-07-04 16:47:17', '', '0');
INSERT INTO `sys_menu` VALUES ('9c37ebfd00764ec99f7c65107faca3d1', '56', '0,56,', '文件夹管理', 5060, '0', 1, '/filetree/sysFileTree/index', '', 'fa fa-list', '1', '', '1', '2018-03-28 09:21:04', '1', '2018-07-27 15:20:46', '', '0');
INSERT INTO `sys_menu` VALUES ('a4f7a04b94f1495da822915f92c8e481', '17', '0,2,13,17,', '编辑', 60, '1', 3, '', '', 'fa fa-circle-thin', '0', 'sys:office:edit', '1', '2018-07-05 10:33:43', '1', '2018-07-05 10:33:43', '', '0');
INSERT INTO `sys_menu` VALUES ('af9b8c36092b40b2864054e75890608e', '0', '0,', '代码生成', 1020, '0', 0, '', '', 'fa fa-file-code-o', '1', '', '1', '2018-05-14 16:26:49', '1', '2018-06-14 16:53:20', '', '0');
INSERT INTO `sys_menu` VALUES ('b06b6eae9f714d028480d6b6c114d498', '56', '0,56,', '文件管理', 5090, '0', 1, '/file/sysFile/index', '', 'fa fa-copy', '1', '', '1', '2018-03-28 17:04:29', '1', '2018-07-27 15:21:03', '', '0');
INSERT INTO `sys_menu` VALUES ('b522939e606543b3b4fee4b045c900c7', '4', '0,2,3,4,', '查看', 30, '1', 3, '', '', 'fa fa-circle-thin', '1', 'sys:menu:view', '1', '2018-07-04 16:16:09', '1', '2018-07-04 16:16:37', '', '0');
INSERT INTO `sys_menu` VALUES ('c1a03d4ac6e6461f8a3f8bc083ebb83e', '9c37ebfd00764ec99f7c65107faca3d1', '0,56,9c37ebfd00764ec99f7c65107faca3d1,', '编辑', 60, '1', 2, '', '', 'fa fa-circle-thin', '0', 'filetree:sysFileTree:edit', '1', '2018-07-05 09:08:33', '1', '2018-07-27 15:21:44', '', '0');
INSERT INTO `sys_menu` VALUES ('cf195f0c91ff463da5fe8b49509f5774', '69', '0,69,', '部署流程', 20, '1', 1, '/act/process/deploy', '', 'fa fa-circle-thin', '1', 'act:process:edit', '1', '2018-08-02 08:53:30', '1', '2018-08-02 09:02:26', '', '0');
INSERT INTO `sys_menu` VALUES ('deba887e31ed487a980ec6d1357398ee', '14', '0,2,13,14,', '查看', 30, '1', 3, '', '', 'fa fa-circle-thin', '0', 'sys:area:view', '1', '2018-07-05 10:36:00', '1', '2018-07-05 10:36:00', '', '0');
INSERT INTO `sys_menu` VALUES ('eb457a022d9841b89da35c93ae0d7f0f', '10', '0,2,3,10,', '编辑', 60, '1', 3, '', '', 'fa fa-circle-thin', '1', 'sys:dict:edit', '1', '2018-07-04 17:15:17', '1', '2018-07-04 17:15:17', '', '0');
INSERT INTO `sys_menu` VALUES ('f081fd38850941c98cd80bd6954b712f', '69', '0,69,', '运行中的流程', 10, '1', 1, '/act/process/running', '', 'fa fa-circle-thin', '1', 'act:process:edit', '1', '2018-08-02 08:58:48', '1', '2018-08-02 09:01:36', '', '0');
INSERT INTO `sys_menu` VALUES ('f5e0c5b0d3e24f969588e8ba8cacfc9b', '20', '0,2,13,20,', '编辑', 60, '1', 3, '', '', 'fa fa-circle-thin', '0', 'sys:user:edit', '1', '2018-07-05 10:33:04', '1', '2018-07-05 10:33:04', '', '0');
INSERT INTO `sys_menu` VALUES ('f6bc0ba744ed4b08b491ec00460d21c2', '20', '0,2,13,20,', '查看', 30, '1', 3, '', '', 'fa fa-circle-thin', '0', 'sys:user:view', '1', '2018-07-05 10:32:42', '1', '2018-07-05 10:32:42', '', '0');
INSERT INTO `sys_menu` VALUES ('fbe403d809b0400d9d36df16cb56abf2', '0', '0,', '代码生成测试', 5030, '0', 0, '', '', 'icon-direction', '1', '', '1', '2018-12-19 16:59:07', '1', '2018-12-19 16:59:07', '', '0');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '归属区域',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '区域编码',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构类型',
  `grade` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构等级',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '传真',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '副负责人',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否树形叶子节点（0:不是,1:是）',
  `tree_level` decimal(4, 0) NULL DEFAULT NULL COMMENT '树形层级(0:根级)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_office_parent_id`(`parent_id`) USING BTREE,
  INDEX `sys_office_del_flag`(`del_flag`) USING BTREE,
  INDEX `sys_office_type`(`type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '机构表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', 'JSite 测试公司', 10, 'f762fb569d8445f28a226a9b831cfb90', '100000', '1', '1', '', '', '', '', '', '', '1', '', '', '0', 0, '1', '2013-05-27 08:00:00', '1', '2018-12-06 14:38:45', '', '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '综合部', 20, 'f762fb569d8445f28a226a9b831cfb90', '100002', '2', '1', '', '', '', '', '', '', '1', '', '', '1', 1, '1', '2013-05-27 08:00:00', '1', '2018-02-02 17:40:19', '', '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', 30, 'f762fb569d8445f28a226a9b831cfb90', '100003', '2', '1', '', '', '', '', '', '', '1', '', '', '1', 1, '1', '2013-05-27 08:00:00', '1', '2018-02-02 17:40:28', '', '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', 40, 'f762fb569d8445f28a226a9b831cfb90', '100004', '2', '1', '', '', '', '', '', '', '1', '', '', '1', 1, '1', '2013-05-27 08:00:00', '1', '2018-02-02 17:40:37', '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `office_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `enname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色类型',
  `user_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户类型',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_role_del_flag`(`del_flag`) USING BTREE,
  INDEX `sys_role_enname`(`enname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '5', '系统管理员', 'Manager', 'security-role', '1', '1', '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-12-19 17:01:31', 'AA', '0');
INSERT INTO `sys_role` VALUES ('1042c40b2d2d496c9af546bba7006623', '3', 'hr', 'hr', 'assignment', '3', '1', '1', '1', '1', '2018-08-20 14:33:33', '1', '2018-08-20 14:35:04', '', '0');
INSERT INTO `sys_role` VALUES ('6', '4', '普通用户', 'Comuser', 'assignment', '3', '8', '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-07-05 11:54:44', '', '0');
INSERT INTO `sys_role` VALUES ('a868b9836f664b43909757005390022f', '5', '部门经理', 'dept', 'security-role', '2', '3', '1', '1', '1', '2018-12-22 22:21:56', '1', '2018-12-22 22:25:33', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色-菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '13e52acca1254df283520c9ee3db769b');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '185e17bc1e5b4fa8a997b8c86a828f1d');
INSERT INTO `sys_role_menu` VALUES ('1', '1cbff3f7903c4276902db28ed9e5916e');
INSERT INTO `sys_role_menu` VALUES ('1', '1cc9a6712a86420d9557bbf52b24680a');
INSERT INTO `sys_role_menu` VALUES ('1', '1e43e4e03d724542b1a31f8c0593ca33');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '246838c40d334f2f9f929b5292771bc8');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '294700ca86cc45eba00fb7e6c6f2b121');
INSERT INTO `sys_role_menu` VALUES ('1', '2f436a3b76924563acf09132adfe666e');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '46');
INSERT INTO `sys_role_menu` VALUES ('1', '47');
INSERT INTO `sys_role_menu` VALUES ('1', '48');
INSERT INTO `sys_role_menu` VALUES ('1', '49');
INSERT INTO `sys_role_menu` VALUES ('1', '4b2965d0d0f7460e969abc2eb07f1560');
INSERT INTO `sys_role_menu` VALUES ('1', '50');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '53');
INSERT INTO `sys_role_menu` VALUES ('1', '53365d59807c448b926fb3766b783c1f');
INSERT INTO `sys_role_menu` VALUES ('1', '54');
INSERT INTO `sys_role_menu` VALUES ('1', '55');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '60');
INSERT INTO `sys_role_menu` VALUES ('1', '61');
INSERT INTO `sys_role_menu` VALUES ('1', '62');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '67a7d3780a704dff89d5c6467370bea4');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '69');
INSERT INTO `sys_role_menu` VALUES ('1', '6c7a6cff4a6a45058291bbf09ff3e780');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '70');
INSERT INTO `sys_role_menu` VALUES ('1', '72');
INSERT INTO `sys_role_menu` VALUES ('1', '7eeda5473bff486895a2df0262bd55f4');
INSERT INTO `sys_role_menu` VALUES ('1', '81');
INSERT INTO `sys_role_menu` VALUES ('1', '82');
INSERT INTO `sys_role_menu` VALUES ('1', '8308c0438092480997f4712ae8308827');
INSERT INTO `sys_role_menu` VALUES ('1', '84');
INSERT INTO `sys_role_menu` VALUES ('1', '88');
INSERT INTO `sys_role_menu` VALUES ('1', '89');
INSERT INTO `sys_role_menu` VALUES ('1', '90');
INSERT INTO `sys_role_menu` VALUES ('1', '95db821b31cd4670ab51b115ce73d271');
INSERT INTO `sys_role_menu` VALUES ('1', '960d503ac572449bae996bfc928f1bf3');
INSERT INTO `sys_role_menu` VALUES ('1', '9c37ebfd00764ec99f7c65107faca3d1');
INSERT INTO `sys_role_menu` VALUES ('1', 'a4f7a04b94f1495da822915f92c8e481');
INSERT INTO `sys_role_menu` VALUES ('1', 'af9b8c36092b40b2864054e75890608e');
INSERT INTO `sys_role_menu` VALUES ('1', 'b06b6eae9f714d028480d6b6c114d498');
INSERT INTO `sys_role_menu` VALUES ('1', 'b522939e606543b3b4fee4b045c900c7');
INSERT INTO `sys_role_menu` VALUES ('1', 'c1a03d4ac6e6461f8a3f8bc083ebb83e');
INSERT INTO `sys_role_menu` VALUES ('1', 'cf195f0c91ff463da5fe8b49509f5774');
INSERT INTO `sys_role_menu` VALUES ('1', 'deba887e31ed487a980ec6d1357398ee');
INSERT INTO `sys_role_menu` VALUES ('1', 'eb457a022d9841b89da35c93ae0d7f0f');
INSERT INTO `sys_role_menu` VALUES ('1', 'f081fd38850941c98cd80bd6954b712f');
INSERT INTO `sys_role_menu` VALUES ('1', 'f5e0c5b0d3e24f969588e8ba8cacfc9b');
INSERT INTO `sys_role_menu` VALUES ('1', 'f6bc0ba744ed4b08b491ec00460d21c2');
INSERT INTO `sys_role_menu` VALUES ('1', 'fbe403d809b0400d9d36df16cb56abf2');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '246838c40d334f2f9f929b5292771bc8');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '28');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '29');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '30');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '4b2965d0d0f7460e969abc2eb07f1560');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '62');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '7eeda5473bff486895a2df0262bd55f4');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '8308c0438092480997f4712ae8308827');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '88');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '89');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '90');
INSERT INTO `sys_role_menu` VALUES ('1042c40b2d2d496c9af546bba7006623', '95db821b31cd4670ab51b115ce73d271');
INSERT INTO `sys_role_menu` VALUES ('6', '1e43e4e03d724542b1a31f8c0593ca33');
INSERT INTO `sys_role_menu` VALUES ('6', '28');
INSERT INTO `sys_role_menu` VALUES ('6', '29');
INSERT INTO `sys_role_menu` VALUES ('6', '294700ca86cc45eba00fb7e6c6f2b121');
INSERT INTO `sys_role_menu` VALUES ('6', '2e95be57e16f478ba3347549692feb1f');
INSERT INTO `sys_role_menu` VALUES ('6', '30');
INSERT INTO `sys_role_menu` VALUES ('6', '32e3d2df46c34197a8d0bbec797d78ae');
INSERT INTO `sys_role_menu` VALUES ('6', '512b3905583c42429a28ebc114a0f2d2');
INSERT INTO `sys_role_menu` VALUES ('6', '55117c43bed14757b9d92a55faee2dc7');
INSERT INTO `sys_role_menu` VALUES ('6', '56');
INSERT INTO `sys_role_menu` VALUES ('6', '5e54e9e5c1f548a485069f9601010ffd');
INSERT INTO `sys_role_menu` VALUES ('6', '5fa583311c5e42de9d8f5bf35663111f');
INSERT INTO `sys_role_menu` VALUES ('6', '62');
INSERT INTO `sys_role_menu` VALUES ('6', '63');
INSERT INTO `sys_role_menu` VALUES ('6', '64');
INSERT INTO `sys_role_menu` VALUES ('6', '65');
INSERT INTO `sys_role_menu` VALUES ('6', '66');
INSERT INTO `sys_role_menu` VALUES ('6', '69');
INSERT INTO `sys_role_menu` VALUES ('6', '70');
INSERT INTO `sys_role_menu` VALUES ('6', '72');
INSERT INTO `sys_role_menu` VALUES ('6', '73');
INSERT INTO `sys_role_menu` VALUES ('6', '736b4ec8cbe74bf7937fe92668dcc44a');
INSERT INTO `sys_role_menu` VALUES ('6', '74');
INSERT INTO `sys_role_menu` VALUES ('6', '742be3b803174b9b81357843607fd14e');
INSERT INTO `sys_role_menu` VALUES ('6', '74db9eeede4b4146943737ce74af731d');
INSERT INTO `sys_role_menu` VALUES ('6', '88');
INSERT INTO `sys_role_menu` VALUES ('6', '89');
INSERT INTO `sys_role_menu` VALUES ('6', '89f06a97bd9a42c7a3d80908aa1daef3');
INSERT INTO `sys_role_menu` VALUES ('6', '90');
INSERT INTO `sys_role_menu` VALUES ('6', '912fa92c6d014a618846b353cb053125');
INSERT INTO `sys_role_menu` VALUES ('6', '9387017c31a643f6a5acf70f092cb958');
INSERT INTO `sys_role_menu` VALUES ('6', '9c37ebfd00764ec99f7c65107faca3d1');
INSERT INTO `sys_role_menu` VALUES ('6', 'b01fe17249ef4616823da0146d298650');
INSERT INTO `sys_role_menu` VALUES ('6', 'b06b6eae9f714d028480d6b6c114d498');
INSERT INTO `sys_role_menu` VALUES ('6', 'b95b7e2a63c44a2db7011639a369266a');
INSERT INTO `sys_role_menu` VALUES ('6', 'e0dc8f9573bb4617a38cdf65e7270bb1');
INSERT INTO `sys_role_menu` VALUES ('6', 'e0f05bb6657d4742bc130253eab8c5f1');
INSERT INTO `sys_role_menu` VALUES ('6', 'e1242de3f82e4efbab2abdde73ca3d77');
INSERT INTO `sys_role_menu` VALUES ('6', 'fc3d8379172f4a67ac3b5727636aed56');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '185e17bc1e5b4fa8a997b8c86a828f1d');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '1e43e4e03d724542b1a31f8c0593ca33');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '246838c40d334f2f9f929b5292771bc8');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '28');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '29');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '294700ca86cc45eba00fb7e6c6f2b121');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '30');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '4b2965d0d0f7460e969abc2eb07f1560');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '56');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '62');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '7eeda5473bff486895a2df0262bd55f4');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '8308c0438092480997f4712ae8308827');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '88');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '89');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '90');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '95db821b31cd4670ab51b115ce73d271');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', '9c37ebfd00764ec99f7c65107faca3d1');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', 'b06b6eae9f714d028480d6b6c114d498');
INSERT INTO `sys_role_menu` VALUES ('a868b9836f664b43909757005390022f', 'c1a03d4ac6e6461f8a3f8bc083ebb83e');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`, `office_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色-机构' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '登录名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `no` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '工号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机',
  `user_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_user_office_id`(`office_id`) USING BTREE,
  INDEX `sys_user_login_name`(`login_name`) USING BTREE,
  INDEX `sys_user_company_id`(`company_id`) USING BTREE,
  INDEX `sys_user_update_date`(`update_date`) USING BTREE,
  INDEX `sys_user_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '5', 'jsite', '57b89d1421898c692ebf98b530c3869b56d32e1e80f2bb703aba8a39', '0001', '系统管理员', 'admin@admin.com', '1111', '1111', '1', '/jsite/userfiles/headphoto/1.jpg', '0:0:0:0:0:0:0:1', '2018-12-27 16:06:04', '1', '1', '2013-05-27 08:00:00', '1', '2018-12-23 13:32:52', '11221', '0');
INSERT INTO `sys_user` VALUES ('43f6a4a84e784e5e98b5b1c530bef73b', '1', '5', 'dept', '56c52163316679d8c83c84f03d44a592246d76a70bacb1da76cdc149', '000002', '部门经理', '', '', '', '2', NULL, '221.218.214.209', '2018-12-23 22:51:39', '1', '1', '2018-12-22 22:22:25', '1', '2018-12-22 22:22:25', '', '0');
INSERT INTO `sys_user` VALUES ('56620c5ef567427c8debe68875c0eda2', '1', '3', 'jsitehr', '7e14e4c693492493db3bc12ba2bdd9cec2629613deae9ebd9c42dac1', '000003', '人力资源', '', '', '', '', NULL, '221.218.214.209', '2018-12-23 22:51:22', '1', '1', '2018-12-22 22:23:39', '1', '2018-12-22 22:23:39', '', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户-角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('43f6a4a84e784e5e98b5b1c530bef73b', 'a868b9836f664b43909757005390022f');
INSERT INTO `sys_user_role` VALUES ('56620c5ef567427c8debe68875c0eda2', '1042c40b2d2d496c9af546bba7006623');

-- ----------------------------
-- Table structure for test_data
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `in_date` date NULL DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `test_data_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '业务数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
DROP TABLE IF EXISTS `test_data_child`;
CREATE TABLE `test_data_child`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `test_data_child_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '业务数据子表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for test_data_main
-- ----------------------------
DROP TABLE IF EXISTS `test_data_main`;
CREATE TABLE `test_data_main`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `in_date` date NULL DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `test_data_main_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '业务数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `test_tree_del_flag`(`del_flag`) USING BTREE,
  INDEX `test_data_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '树结构表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
