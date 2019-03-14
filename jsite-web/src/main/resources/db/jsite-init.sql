SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
INSERT INTO `gen_scheme` VALUES ('325d42709242476aab909b8d54a5ad73', '树结构表生成', 'treeTable', 'com.jsite.modules', 'test', '', '树结构表生成', '树结构表生成', 'liuruijun', '3195020a929e41c7bc3dfbd539ed5351', '1', '2019-01-05 22:12:10', '1', '2019-01-08 15:22:56', '', '0');
INSERT INTO `gen_scheme` VALUES ('c544bf7da3744ab1aa285fa3bfef6000', '主子表生成', 'curd_many', 'com.jsite.modules', 'test', '', '主子表生成测试', '主子表生成', 'liuruijun', 'd7c3fff144a046698aa3766844582a4c', '1', '2018-12-29 11:50:24', '1', '2019-01-02 10:06:04', '', '0');
INSERT INTO `gen_scheme` VALUES ('f09437aa6b9c440481e40aa63daf81d7', '单表生成', 'curd', 'com.jsite.modules', 'test', '', '单表生成测试', '单表生成', 'liuruijun', '39c9a49ccd87400b9b19606a46b12dd6', '1', '2018-12-29 11:46:43', '1', '2019-01-02 10:01:38', '', '0');


-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('3195020a929e41c7bc3dfbd539ed5351', 'test_tree', '树结构表', 'TestTree', '', '', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table` VALUES ('39c9a49ccd87400b9b19606a46b12dd6', 'test_data', '业务数据表', 'TestData', '', '', '1', '2018-12-29 11:19:36', '1', '2018-12-29 11:19:36', null, '0');
INSERT INTO `gen_table` VALUES ('794ea2d0349e4590ba4366529d499833', 'test_data_child', '业务数据子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', '2018-12-29 11:21:18', '1', '2018-12-29 11:21:18', null, '0');
INSERT INTO `gen_table` VALUES ('d7c3fff144a046698aa3766844582a4c', 'test_data_main', '业务数据表', 'TestDataMain', '', '', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');


-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('036c21c4346a4b9a9bd4729f5b1996ed', 'd7c3fff144a046698aa3766844582a4c', 'id', '编号', 'varchar(64)', 'String', 'id', '0', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');
INSERT INTO `gen_table_column` VALUES ('0739b3a11c40466b8b3d9c488e3a6bf8', '39c9a49ccd87400b9b19606a46b12dd6', 'area_id', '归属区域', 'varchar(64)', 'com.jsite.modules.sys.entity.Area', 'area.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'areaselect', '', null, '40', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('08b216da6fe042fa817db5a95e4399a7', '3195020a929e41c7bc3dfbd539ed5351', 'parent_id', '父级编号', 'varchar(64)', 'This', 'parent.id|name', '0', '0', '0', '1', '1', '0', '0', '=', 'treeselect', '', null, '20', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('0d48145e1a154e31b276963e1503682c', '3195020a929e41c7bc3dfbd539ed5351', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', null, '90', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('18bbfa2e86a14ca4a6be2d8a643c98d7', '794ea2d0349e4590ba4366529d499833', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', null, '50', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');
INSERT INTO `gen_table_column` VALUES ('1f36d1a2217f4b09a6b7dc2683b5a6a9', 'd7c3fff144a046698aa3766844582a4c', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, '110', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('3421eb7ef5a3427f92c48a6033441a0e', '39c9a49ccd87400b9b19606a46b12dd6', 'update_by', '更新者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'updateBy.id', '0', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '100', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('3a745b100cde4fc99eb0f4e35f27a1b7', '39c9a49ccd87400b9b19606a46b12dd6', 'create_by', '创建者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'createBy.id', '0', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '80', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('3b9990bbe9144b52b316402cac1678e8', '3195020a929e41c7bc3dfbd539ed5351', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, '110', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('404a90b909bb416baa030a1838af45d0', '39c9a49ccd87400b9b19606a46b12dd6', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '50', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('40dc876733f4428a84349621d3ae7e79', '3195020a929e41c7bc3dfbd539ed5351', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '130', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('4316cdf1fbff40e591419cbb75de6742', '3195020a929e41c7bc3dfbd539ed5351', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '120', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('471db37a88de4c02a9c2db052faf5dec', '794ea2d0349e4590ba4366529d499833', 'id', '编号', 'varchar(64)', 'String', 'id', '0', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', '1', '2018-12-29 11:21:18', '1', '2018-12-29 11:21:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('4fa8affc845740448035c44686a6b4f1', 'd7c3fff144a046698aa3766844582a4c', 'create_by', '创建者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'createBy.id', '0', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '80', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('518b26e7bd6c4a6aaac289678ef64ace', '39c9a49ccd87400b9b19606a46b12dd6', 'id', '编号', 'varchar(64)', 'String', 'id', '0', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', '1', '2018-12-29 11:19:36', '1', '2018-12-29 11:19:36', null, '0');
INSERT INTO `gen_table_column` VALUES ('5442ba5226c149f5a12187e55f68ca4a', '39c9a49ccd87400b9b19606a46b12dd6', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '60', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('547037387f074c43a5912e32073e4ba7', '794ea2d0349e4590ba4366529d499833', 'test_data_main_id', '业务主表ID', 'varchar(64)', 'String', 'testDataMainId', '0', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '20', '1', '2018-12-29 11:21:18', '1', '2018-12-29 11:21:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('5542c325e3364eb98450c6b7c386885b', '3195020a929e41c7bc3dfbd539ed5351', 'parent_ids', '所有父级编号', 'varchar(2000)', 'String', 'parentIds', '0', '0', '0', '1', '1', '0', '0', 'like', 'input', '', null, '30', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('5806f2b63737423fabe0efde8cd638fc', 'd7c3fff144a046698aa3766844582a4c', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', null, '90', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('58749bef8ac24ad0a651ec63c6f0cf79', '794ea2d0349e4590ba4366529d499833', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '80', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');
INSERT INTO `gen_table_column` VALUES ('63a7634cd1c449d1966355825f9ae0a1', '3195020a929e41c7bc3dfbd539ed5351', 'create_by', '创建者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'createBy.id', '0', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '80', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('660bcce031194ba195c23225e15f4ebc', 'd7c3fff144a046698aa3766844582a4c', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '0', '1', '1', '1', '1', '0', '=', 'input', '', null, '60', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');
INSERT INTO `gen_table_column` VALUES ('7301b4d629db45209e07cdc8849c40f6', '39c9a49ccd87400b9b19606a46b12dd6', 'in_date', '加入日期', 'date', 'java.util.Date', 'inDate', '0', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', null, '70', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('8ee7f0a8f2804042bb200e24f23de333', '39c9a49ccd87400b9b19606a46b12dd6', 'user_id', '归属用户', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'user.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'userselect', '', null, '20', '1', '2018-12-29 11:19:36', '1', '2018-12-29 11:19:36', null, '0');
INSERT INTO `gen_table_column` VALUES ('9a6afed319b744f79071887baecac3a1', '3195020a929e41c7bc3dfbd539ed5351', 'id', '编号', 'varchar(64)', 'String', 'id', '0', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('9a6d8fcf3fdc4eefad2a63b09cda5c7f', '39c9a49ccd87400b9b19606a46b12dd6', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '120', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('a04f28b86fd545a6b3ea4a85861b55f9', 'd7c3fff144a046698aa3766844582a4c', 'area_id', '归属区域', 'varchar(64)', 'com.jsite.modules.sys.entity.Area', 'area.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'areaselect', '', null, '40', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');
INSERT INTO `gen_table_column` VALUES ('a460e3cbfc4f4b87b07b5a8f88e37c63', '3195020a929e41c7bc3dfbd539ed5351', 'sort', '排序', 'decimal(10,0)', 'Integer', 'sort', '0', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '50', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('ac74bc0c9b7746249dbf92499b89f310', '794ea2d0349e4590ba4366529d499833', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '90', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');
INSERT INTO `gen_table_column` VALUES ('acc2ffe13abb49fdb3e76fc871caa46e', '794ea2d0349e4590ba4366529d499833', 'create_by', '创建者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'createBy.id', '0', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '40', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');
INSERT INTO `gen_table_column` VALUES ('afad04f3c0334e35ae2781b3966e33bf', '3195020a929e41c7bc3dfbd539ed5351', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '40', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('bb2f13421fa04287ac31263650f56522', 'd7c3fff144a046698aa3766844582a4c', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '120', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('bb984414563449d5a428b798432ebee4', '39c9a49ccd87400b9b19606a46b12dd6', 'office_id', '归属部门', 'varchar(64)', 'com.jsite.modules.sys.entity.Office', 'office.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'officeselect', '', null, '30', '1', '2018-12-29 11:19:36', '1', '2018-12-29 11:19:36', null, '0');
INSERT INTO `gen_table_column` VALUES ('bdeae7b5f5764a219b773493ce7ce717', 'd7c3fff144a046698aa3766844582a4c', 'user_id', '归属用户', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'user.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'userselect', '', null, '20', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');
INSERT INTO `gen_table_column` VALUES ('cb23c6752a744f7c865fc4461189e9e5', '3195020a929e41c7bc3dfbd539ed5351', 'tree_level', '树形层级(0:根级)', 'decimal(4,0)', 'String', 'treeLevel', '0', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '70', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('ce459de5970642e6ab8791ac72d0dfc6', 'd7c3fff144a046698aa3766844582a4c', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '50', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');
INSERT INTO `gen_table_column` VALUES ('d333b5918d2f4db1996a360d2ac74a99', '39c9a49ccd87400b9b19606a46b12dd6', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, '110', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('d3952c7032284832b26a532543f4fe78', '794ea2d0349e4590ba4366529d499833', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, '70', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');
INSERT INTO `gen_table_column` VALUES ('deca344f6dc146bfae6377e939a0c097', '39c9a49ccd87400b9b19606a46b12dd6', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '130', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('e05d48dae1354898ae9f9b7c469313db', '3195020a929e41c7bc3dfbd539ed5351', 'update_by', '更新者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'updateBy.id', '0', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '100', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('e399ea7f86c44ace9a69c03e489797bb', 'd7c3fff144a046698aa3766844582a4c', 'in_date', '加入日期', 'date', 'java.util.Date', 'inDate', '0', '0', '1', '1', '1', '1', '0', '=', 'dateselect', '', null, '70', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('e8e3f6f2d66c44a08210a0c35e74caa8', '3195020a929e41c7bc3dfbd539ed5351', 'tree_leaf', '是否树形叶子节点（0:不是,1:是）', 'char(1)', 'String', 'treeLeaf', '0', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '60', '1', '2019-01-05 21:22:37', '1', '2019-01-07 16:51:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('e948c667cfe4486eb2119583ff9805b4', 'd7c3fff144a046698aa3766844582a4c', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '130', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('ea80f499adc049e897889b36c1cfa220', '794ea2d0349e4590ba4366529d499833', 'update_by', '更新者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'updateBy.id', '0', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '60', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');
INSERT INTO `gen_table_column` VALUES ('f3cfb155ee3d433fa287759b9e471b72', '39c9a49ccd87400b9b19606a46b12dd6', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', null, '90', '1', '2018-12-29 11:19:37', '1', '2018-12-29 11:19:37', null, '0');
INSERT INTO `gen_table_column` VALUES ('f4e277e2ae97497fa3ebef882f3ac50d', 'd7c3fff144a046698aa3766844582a4c', 'office_id', '归属部门', 'varchar(64)', 'com.jsite.modules.sys.entity.Office', 'office.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'officeselect', '', null, '30', '1', '2018-12-29 11:20:51', '1', '2018-12-29 11:20:51', null, '0');
INSERT INTO `gen_table_column` VALUES ('f610077a6e774855802b92389241fef7', 'd7c3fff144a046698aa3766844582a4c', 'update_by', '更新者', 'varchar(64)', 'com.jsite.modules.sys.entity.User', 'updateBy.id', '0', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '100', '1', '2018-12-29 11:20:52', '1', '2018-12-29 11:20:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('fe3e9323ad1841a99ad7788770ea3101', '794ea2d0349e4590ba4366529d499833', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '30', '1', '2018-12-29 11:21:19', '1', '2018-12-29 11:21:19', null, '0');


-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('015345144e9e40d6bbe832a9f1cba1f7', 'd36735ce07044a49ad205854fb2ca078', '0,d36735ce07044a49ad205854fb2ca078,', 'California', 10, '1', 1, '01', '2', '1', '2018-06-20 17:32:51', '1', '2019-01-02 00:11:18', '', '0');
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', 10, '0', 0, '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-12-28 00:19:15', '', '0');
INSERT INTO `sys_area` VALUES ('16166c3ecb954be0ad47159c087cd8af', 'd36735ce07044a49ad205854fb2ca078', '0,d36735ce07044a49ad205854fb2ca078,', '明尼苏达', 30, '1', 1, '', '2', '1', '2019-01-25 17:40:25', '1', '2019-01-25 17:40:25', '', '0');
INSERT INTO `sys_area` VALUES ('3fbaf3a3f58a47118f13976cb2e2544d', 'd36735ce07044a49ad205854fb2ca078', '0,d36735ce07044a49ad205854fb2ca078,', '佛罗里达州', 20, '1', 1, '02', '2', '1', '2018-06-20 17:38:08', '1', '2018-06-20 17:38:08', '', '0');
INSERT INTO `sys_area` VALUES ('d36735ce07044a49ad205854fb2ca078', '0', '0,', '美国', 30, '0', 0, '2', '1', '1', '2018-06-20 15:36:19', '1', '2018-06-20 15:36:19', '', '0');
INSERT INTO `sys_area` VALUES ('da2da01621b64be5a85b07a8c883228f', '1', '0,1,', '上海', 30, '1', 1, '34243', '2', '1', '2018-12-10 14:01:09', '1', '2019-01-18 21:22:55', '', '0');
INSERT INTO `sys_area` VALUES ('f762fb569d8445f28a226a9b831cfb90', '1', '0,1,', '北京', 30, '1', 1, '150', '2', '1', '2018-02-02 17:37:51', '1', '2018-11-20 10:22:36', '', '0');

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('101', 'com.jsite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.jsite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.jsite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('105', '1', '会议通告\0\0', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('106', '2', '奖惩通告\0\0', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('107', '3', '活动通告\0\0', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份/直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2018-06-15 14:46:37', '', '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市/州', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2018-06-15 14:47:38', '', '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '县/区', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2018-06-15 14:48:01', '', '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('263374341bb04a88a149456094a5bd4f', 'WAITING', '等待执行', 'sys_job_status', '定时任务状态（PAUSED-暂停，ACQUIRED-正在执行，WAITING-等待执行）', '30', '0', '1', '2019-01-10 11:58:07', '1', '2019-01-11 12:02:01', '', '0');
INSERT INTO `sys_dict` VALUES ('26f56c93297146ca869fb1924569d5fc', '0', '停用', 'sys_user_status', '用户状态（0-停用，1-正常）', '10', '0', '1', '2018-06-29 08:40:36', '1', '2018-06-29 08:40:36', '', '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('49fefff665614e80b8c0e91902f2c817', 'images/userinfo.png', '默认头像', 'default_headphoto_big', '默认头像(大图)', '10', '0', '1', '2018-07-30 11:58:29', '1', '2018-07-30 13:41:11', '默认头像(原图)', '0');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('5ff3843961654e639a419410afc89bbc', '4', '人力资源', 'sys_user_type', '用户类型', '10', '0', '1', '2018-12-28 13:51:04', '1', '2018-12-28 13:51:04', '', '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('631f38d9f5e24dc88fdb472f4855d68d', '1', '正常', 'sys_user_status', '用户状态（0-停用，1-正常）', '20', '0', '1', '2018-06-29 08:41:42', '1', '2018-06-29 08:41:42', '', '0');
INSERT INTO `sys_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('6437d5741af64dca861fe5bec7994891', '1', '显示', 'sys_show_hide', '显示-隐藏', '10', '0', '1', '2018-06-25 18:21:38', '1', '2018-06-25 18:21:38', '显示-隐藏', '0');
INSERT INTO `sys_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('71', 'leave', '请假流程', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('72', 'metting', '会议室申请流程', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('a1367ff32ec044b08ead3a56f69748db', 'ACQUIRED', '正在执行', 'sys_job_status', '定时任务状态（PAUSED-暂停，ACQUIRED-正在执行，WAITING-等待执行）', '20', '0', '1', '2019-01-09 16:27:54', '1', '2019-01-11 12:01:52', '', '0');
INSERT INTO `sys_dict` VALUES ('a6aff6268f1f4d77952f3424b5e843d6', '123456', 'default_password', 'default_pass', '系统默认配置密码', '10', '0', '1', '2018-07-03 11:40:03', '1', '2018-07-03 11:40:03', '', '0');
INSERT INTO `sys_dict` VALUES ('a6c017055f7b4ce2bb644ec8bb240d4a', 'PAUSED', '暂停', 'sys_job_status', '定时任务状态（PAUSED-暂停，ACQUIRED-正在执行，WAITING-等待执行）', '10', '0', '1', '2019-01-09 15:37:38', '1', '2019-01-11 20:53:20', '', '0');
INSERT INTO `sys_dict` VALUES ('a8a0aeb824d84d73ad1cca1bdc35c8dc', '5', '乡/镇', 'sys_area_type', '区域类型', '50', '0', '1', '2018-06-15 14:48:45', '1', '2018-06-15 14:48:45', '', '0');
INSERT INTO `sys_dict` VALUES ('c3f4554124e64c4a9cf96ebe94e55ade', '6', '村/社区', 'sys_area_type', '区域类型', '60', '0', '1', '2018-06-15 14:49:25', '1', '2018-06-15 14:49:25', '', '0');
INSERT INTO `sys_dict` VALUES ('da5b5781a8604398aea411a3949b8486', '0', '隐藏', 'sys_show_hide', '显示-隐藏', '10', '0', '1', '2018-06-25 18:22:06', '1', '2018-06-25 18:22:06', '显示-隐藏', '0');
INSERT INTO `sys_dict` VALUES ('edc2e89282bb4eeba397857a2cfb6b33', 'com.jsite.modules.oa.leave', '请假流程1', 'act_category', '请假流程111', '10', '0', '1', '2018-08-03 10:37:05', '1', '2018-08-03 10:37:05', '', '0');
INSERT INTO `sys_dict` VALUES ('ee843534a2884752bf2ebd2444551771', 'images/userinfo.png', '默认头像', 'default_headphoto_small', '默认头像(缩略图)', '10', '0', '1', '2018-07-30 11:52:22', '1', '2018-07-30 11:56:54', '默认小头像(缩略图)图片路径', '0');


-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('15e0f0655f0949899e6df9353654e41e', 'b7803810cc734b90a3f44643fad06bd7', 'git命令.txt', null, '539', 'common/b7803810cc734b90a3f44643fad06bd7\\20180727\\git命令.txt', '1', '2018-07-27 15:40:29', '1', '2018-07-27 15:40:29', null, '0');
INSERT INTO `sys_file` VALUES ('354d0ad6df5f4b81a6df003967b8dde3', '018abc93050045dd8f419c14c1a5bfd5', 'picture.jpg', null, '157296', 'common/018abc93050045dd8f419c14c1a5bfd5\\20180625\\picture.jpg', '1', '2018-06-25 15:44:40', '1', '2018-06-25 15:44:40', null, '1');
INSERT INTO `sys_file` VALUES ('47348b3a5ee94d8e8d0a6d4b0d728b12', 'f1d7c9459a5a44adb38ed662bd5d682f', '新建文本文档.txt', null, '4890', 'common/f1d7c9459a5a44adb38ed662bd5d682f\\20180613\\新建文本文档.txt', '1', '2018-06-13 14:40:09', '1', '2018-06-13 14:40:09', null, '1');
INSERT INTO `sys_file` VALUES ('48b4b3ab2e064d4a9113318bcf5ddec8', '018abc93050045dd8f419c14c1a5bfd5', 'picture.jpg', null, '157296', 'common/7a0440b426f94db1b5b79772210437d2\\20180709\\picture.jpg', '1', '2018-07-09 10:41:49', '1', '2018-07-09 10:46:44', null, '0');
INSERT INTO `sys_file` VALUES ('4e9aea81e3234813bae688162b032e88', '8c5b5246330e42f4adb0593b1db498b4', 'BluetoothGet.zip', null, '2774021', 'F:\\git\\itamcs\\src\\main\\webapp\\upload\\common/7a0440b426f94db1b5b79772210437d2\\20180611\\BluetoothGet.zip', '1', '2018-06-11 10:20:13', '1', '2018-06-27 09:27:01', null, '1');
INSERT INTO `sys_file` VALUES ('5121fa6273e743a7912a58cc5a15ba2f', '8c5b5246330e42f4adb0593b1db498b4', '安装配置教程.docx', null, '429193', 'common/8c5b5246330e42f4adb0593b1db498b4/20181214/安装配置教程.docx', '1', '2018-12-14 09:37:00', '1', '2018-12-14 09:37:00', null, '0');
INSERT INTO `sys_file` VALUES ('5e3fff31d0724f5d89ab106519e8634a', '8c5b5246330e42f4adb0593b1db498b4', 'XXX旅游APP项目功能模块20180528.xlsx', null, '19530', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180803\\XXX旅游APP项目功能模块20180528.xlsx', '1', '2018-08-03 09:37:09', '1', '2018-08-03 09:37:09', null, '0');
INSERT INTO `sys_file` VALUES ('6770be70d39d432d802150b41af00370', '8c5b5246330e42f4adb0593b1db498b4', 'PictureUnlock_gf_11393.pictureunlock.jpg', null, '103041', 'common/8c5b5246330e42f4adb0593b1db498b4/20181214/PictureUnlock_gf_11393.pictureunlock.jpg', '1', '2018-12-14 21:25:23', '1', '2018-12-14 21:25:23', null, '0');
INSERT INTO `sys_file` VALUES ('6f061e5b673c4a35981aba68b5feb771', '8c5b5246330e42f4adb0593b1db498b4', 'git命令.txt', null, '871', 'common/8c5b5246330e42f4adb0593b1db498b4\\20181211\\git命令.txt', '1', '2018-12-11 10:42:40', '1', '2018-12-11 10:42:40', null, '0');
INSERT INTO `sys_file` VALUES ('802ae641d0d84c488143885487a2d937', '8c5b5246330e42f4adb0593b1db498b4', 'IT资产管控平台初设说明书-20180408001.docx', null, '1438387', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180803\\IT资产管控平台初设说明书-20180408001.docx', '1', '2018-08-03 09:44:42', '1', '2018-08-03 09:44:42', null, '0');
INSERT INTO `sys_file` VALUES ('a3ececf035d84d9280b1c4b2ae614074', 'f1d7c9459a5a44adb38ed662bd5d682f', 'BeyondAdmin-master.zip', null, '2425874', 'F:\\git\\itamcs\\src\\main\\webapp\\upload\\common/f1d7c9459a5a44adb38ed662bd5d682f\\20180611\\BeyondAdmin-master.zip', '1', '2018-06-11 11:06:27', '1', '2018-06-11 11:06:27', null, '1');
INSERT INTO `sys_file` VALUES ('bee545f738e941b18c321189fd962f8b', '8c5b5246330e42f4adb0593b1db498b4', '解决问题罗列.txt', null, '22351', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180709\\解决问题罗列.txt', '1', '2018-07-09 16:15:38', '1', '2018-07-09 16:15:38', null, '0');
INSERT INTO `sys_file` VALUES ('cde9fce0e36e479682f87121bbedb3be', '11da634ddacb4129bb2c4f14854585f5', 'imageclip.html', null, '7707', 'common/11da634ddacb4129bb2c4f14854585f5\\20180709\\imageclip.html', '1', '2018-07-09 11:46:48', '1', '2018-07-09 11:46:48', null, '0');
INSERT INTO `sys_file` VALUES ('d67606c039784624955e8155032662de', '8c5b5246330e42f4adb0593b1db498b4', '大屏修改反馈-20180416.docx', null, '2297953', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180709\\大屏修改反馈-20180416.docx', '1', '2018-07-09 16:15:39', '1', '2018-07-09 16:15:39', null, '0');
INSERT INTO `sys_file` VALUES ('da2ac86c3d934295a4d2bfd15518698b', '7a0440b426f94db1b5b79772210437d2', 'note.html', null, '1063', 'common/7a0440b426f94db1b5b79772210437d2/20180612/note.html', '1', '2018-06-12 11:56:54', '1', '2018-06-12 11:56:54', null, '1');
INSERT INTO `sys_file` VALUES ('fc7cb4ccf7ae42dfa6f81463006bf8eb', '8c5b5246330e42f4adb0593b1db498b4', 'aac.txt', null, '3484', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180823\\aac.txt', '1', '2018-08-23 10:57:50', '1', '2018-08-23 10:57:50', null, '0');


-- ----------------------------
-- Records of sys_file_tree
-- ----------------------------
INSERT INTO `sys_file_tree` VALUES ('018abc93050045dd8f419c14c1a5bfd5', '2bacb604df77451d9ef9c60494c4a5b3', '0,c9265b260c1845b6b46462acd36e4304,2bacb604df77451d9ef9c60494c4a5b3', 'ffff', '1', '1', '2', '1', '2018-06-04 14:40:37', '1', '2018-06-04 14:40:37', '', '0');
INSERT INTO `sys_file_tree` VALUES ('11da634ddacb4129bb2c4f14854585f5', '5dbb8533c98b4869901270ae2eb4d0ad', '0,5dbb8533c98b4869901270ae2eb4d0ad', 'aaa', '3', '0', '1', '1', '2018-06-05 09:58:58', '1', '2018-06-06 18:11:33', '', '0');
INSERT INTO `sys_file_tree` VALUES ('12fe7758f865410283b26ee134f8a0bf', '11da634ddacb4129bb2c4f14854585f5', '0,5dbb8533c98b4869901270ae2eb4d0ad,11da634ddacb4129bb2c4f14854585f5', 'bbb', '5', '1', '2', '1', '2018-06-05 09:59:24', '1', '2018-06-06 18:11:33', '', '0');
INSERT INTO `sys_file_tree` VALUES ('2bacb604df77451d9ef9c60494c4a5b3', 'c9265b260c1845b6b46462acd36e4304', '0,c9265b260c1845b6b46462acd36e4304', '2', '2', '0', '1', '1', '2018-03-28 14:41:39', '1', '2018-06-04 17:01:59', '2', '0');
INSERT INTO `sys_file_tree` VALUES ('5dbb8533c98b4869901270ae2eb4d0ad', '0', '0', 'mmm', '4', '0', '0', '1', '2018-06-06 09:58:30', '1', '2018-06-06 18:11:32', '', '0');
INSERT INTO `sys_file_tree` VALUES ('7a0440b426f94db1b5b79772210437d2', 'f1d7c9459a5a44adb38ed662bd5d682f', '0,c9265b260c1845b6b46462acd36e4304,2bacb604df77451d9ef9c60494c4a5b3,f1d7c9459a5a44adb38ed662bd5d682f', 'ccc', '10', '1', '3', '1', '2018-06-05 09:59:11', '1', '2018-06-06 18:11:55', '', '0');
INSERT INTO `sys_file_tree` VALUES ('885944d2b2784fe68a4a33c276eaa229', '9e31a73796a242009c89995c2de86bbb', '0,5dbb8533c98b4869901270ae2eb4d0ad,9e31a73796a242009c89995c2de86bbb', 'ggg', '3', '1', '2', '1', '2018-06-04 13:56:48', '1', '2018-06-06 17:34:56', 'dxxa', '0');
INSERT INTO `sys_file_tree` VALUES ('8c5b5246330e42f4adb0593b1db498b4', 'b7803810cc734b90a3f44643fad06bd7', '0,c9265b260c1845b6b46462acd36e4304,b7803810cc734b90a3f44643fad06bd7', '5', '3', '1', '2', '1', '2018-06-04 13:54:18', '1', '2018-06-04 13:54:18', '', '0');
INSERT INTO `sys_file_tree` VALUES ('9e31a73796a242009c89995c2de86bbb', '5dbb8533c98b4869901270ae2eb4d0ad', '0,5dbb8533c98b4869901270ae2eb4d0ad', 'wowowow', '4', '0', '1', '1', '2018-06-04 16:45:08', '1', '2018-06-06 17:45:28', '', '0');
INSERT INTO `sys_file_tree` VALUES ('b7803810cc734b90a3f44643fad06bd7', 'c9265b260c1845b6b46462acd36e4304', '0,c9265b260c1845b6b46462acd36e4304', '1', '1', '0', '1', '1', '2018-03-28 14:41:23', '1', '2018-03-28 14:41:23', '1', '0');
INSERT INTO `sys_file_tree` VALUES ('c07436d34ed8412ebfd65c7d7139283d', '0', '0', 'testMode', '120', '0', '0', '1', '2018-07-27 15:30:33', '1', '2018-07-27 16:55:25', 'safsf', '0');
INSERT INTO `sys_file_tree` VALUES ('c9265b260c1845b6b46462acd36e4304', '0', '0', '默认', '0', '0', '0', '1', '2018-03-28 14:33:54', '1', '2018-06-05 10:01:53', null, '0');
INSERT INTO `sys_file_tree` VALUES ('f1d7c9459a5a44adb38ed662bd5d682f', '2bacb604df77451d9ef9c60494c4a5b3', '0,c9265b260c1845b6b46462acd36e4304,2bacb604df77451d9ef9c60494c4a5b3', 'test', '3', '0', '2', '1', '2018-06-04 14:39:45', '1', '2018-06-06 18:11:55', '1111', '0');


-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '在线办公', 30, '0', 0, '', '', 'icon-cloud-upload', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-06-28 08:48:13', '', '0');
INSERT INTO `sys_menu` VALUES ('100', '1', '0,1,', '待办任务', 20, '1', 1, '/act/task/todo', '', 'fa fa-circle-thin', '1', 'act:process:view,act:process:edit', '1', '2018-08-07 14:57:37', '1', '2018-12-22 22:47:45', '', '0');
INSERT INTO `sys_menu` VALUES ('101', '1', '0,1,', '已办任务', 30, '1', 1, '/act/task/historic', '', 'fa fa-circle-thin', '1', 'act:process:view,act:process:edit', '1', '2018-08-07 14:58:35', '1', '2019-03-14 11:09:18', '', '0');
INSERT INTO `sys_menu` VALUES ('102', '1', '0,1,', '已发任务', 40, '1', 1, '/act/task/hasSent', '', 'fa fa-circle-thin', '1', 'act:process:view,act:process:edit', '1', '2018-08-09 20:28:01', '1', '2019-03-14 11:09:25', '', '0');
INSERT INTO `sys_menu` VALUES ('103', '1', '0,1,', '发起流程', 50, '1', 1, '/act/task/process', '', 'fa fa-circle-thin', '1', 'act:process:view,act:process:edit', '1', '2018-08-07 15:07:41', '1', '2019-03-14 11:09:37', '', '0');
INSERT INTO `sys_menu` VALUES ('104', '1', '0,1,', '请假流程：发起|办理权限', 60, '1', 1, '', '', '', '0', 'oa:leave:view,oa:leave:edit', '1', '2018-08-15 14:40:25', '1', '2018-08-15 17:22:11', '', '0');
INSERT INTO `sys_menu` VALUES ('2', '0', '0,', '机构用户', 60, '0', 0, '', '', 'icon-social-dropbox', '1', '', '1', '2013-05-27 08:00:00', '1', '2019-03-13 10:17:25', '', '0');
INSERT INTO `sys_menu` VALUES ('200', '2', '0,2,', '用户管理', 20, '0', 1, '/sys/user/index', '', 'fa fa-users', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-05 10:32:22', '', '0');
INSERT INTO `sys_menu` VALUES ('2000', '200', '0,2,200,', '查看', 30, '1', 2, '', '', 'fa fa-circle-thin', '0', 'sys:user:view', '1', '2018-07-05 10:32:42', '1', '2018-07-05 10:32:42', '', '0');
INSERT INTO `sys_menu` VALUES ('2001', '200', '0,2,200,', '编辑', 60, '1', 2, '', '', 'fa fa-circle-thin', '0', 'sys:user:edit', '1', '2018-07-05 10:33:04', '1', '2018-07-05 10:33:04', '', '0');
INSERT INTO `sys_menu` VALUES ('201', '2', '0,2,', '机构管理', 30, '0', 1, '/sys/office/', '', 'fa fa-puzzle-piece', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-05 10:35:25', '', '0');
INSERT INTO `sys_menu` VALUES ('2010', '201', '0,2,201,', '查看', 30, '1', 2, '', '', 'fa fa-circle-thin', '0', 'sys:office:view', '1', '2018-07-05 10:33:26', '1', '2018-07-05 10:33:26', '', '0');
INSERT INTO `sys_menu` VALUES ('2011', '201', '0,2,201,', '编辑', 60, '1', 2, '', '', 'fa fa-circle-thin', '0', 'sys:office:edit', '1', '2018-07-05 10:33:43', '1', '2018-07-05 10:33:43', '', '0');
INSERT INTO `sys_menu` VALUES ('202', '2', '0,2,', '区域管理', 40, '0', 1, '/sys/area/', '', 'fa fa-map', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-05 10:36:49', '', '0');
INSERT INTO `sys_menu` VALUES ('2020', '202', '0,2,202,', '查看', 30, '1', 2, '', '', 'fa fa-circle-thin', '0', 'sys:area:view', '1', '2018-07-05 10:36:00', '1', '2018-07-05 10:36:00', '', '0');
INSERT INTO `sys_menu` VALUES ('2021', '202', '0,2,202,', '编辑', 60, '1', 2, '', '', 'fa fa-circle-thin', '0', 'sys:area:edit', '1', '2018-07-05 10:36:25', '1', '2018-07-05 10:36:25', '', '0');
INSERT INTO `sys_menu` VALUES ('3', '0', '0,', '系统设置', 90, '0', 0, '', '', 'icon-settings', '1', '', '1', '2013-05-27 08:00:00', '1', '2019-03-13 10:17:47', '', '0');
INSERT INTO `sys_menu` VALUES ('300', '3', '0,3,', '菜单管理', 30, '0', 1, '/sys/menu/', '', 'fa fa-list-alt', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-04 16:17:54', '', '0');
INSERT INTO `sys_menu` VALUES ('3000', '300', '0,3,300,', '查看', 30, '1', 2, '', '', 'fa fa-circle-thin', '1', 'sys:menu:view', '1', '2018-07-04 16:16:09', '1', '2018-07-04 16:16:37', '', '0');
INSERT INTO `sys_menu` VALUES ('3001', '300', '0,3,300,', '编辑', 60, '1', 2, '', '', 'fa fa-circle-thin', '1', 'sys:menu:edit', '1', '2018-07-04 16:17:40', '1', '2018-07-04 16:17:40', '', '0');
INSERT INTO `sys_menu` VALUES ('301', '3', '0,3,', '角色管理', 40, '0', 1, '/sys/role/', '', 'fa fa-cubes', '1', '', '1', '2013-05-27 08:00:00', '1', '2019-03-13 10:34:19', '', '0');
INSERT INTO `sys_menu` VALUES ('3010', '301', '0,3,301,', '查看', 30, '1', 2, '', '', 'fa fa-circle-thin', '1', 'sys:role:view', '1', '2018-07-04 16:45:37', '1', '2018-07-04 16:45:37', '', '0');
INSERT INTO `sys_menu` VALUES ('3011', '301', '0,3,301,', '编辑', 60, '1', 2, '', '', 'fa fa-circle-thin', '1', 'sys:role:edit', '1', '2018-07-04 16:46:18', '1', '2018-07-04 16:47:17', '', '0');
INSERT INTO `sys_menu` VALUES ('302', '3', '0,3,', '字典管理', 50, '0', 1, '/sys/dict/', '', 'fa fa-columns', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-07-04 17:14:49', '', '0');
INSERT INTO `sys_menu` VALUES ('3020', '302', '0,3,302,', '查看', 30, '1', 2, '', '', 'fa fa-circle-thin', '1', 'sys:dict:view', '1', '2018-07-04 17:14:31', '1', '2018-07-04 17:14:31', '', '0');
INSERT INTO `sys_menu` VALUES ('3021', '302', '0,3,302,', '编辑', 60, '1', 2, '', '', 'fa fa-circle-thin', '1', 'sys:dict:edit', '1', '2018-07-04 17:15:17', '1', '2018-07-04 17:15:17', '', '0');
INSERT INTO `sys_menu` VALUES ('303', '3', '0,3,', '定时任务', 60, '0', 1, '/sys/job/', '', 'fa fa-tachometer', '1', '', '1', '2019-01-07 16:29:56', '1', '2019-03-13 11:05:43', '', '0');
INSERT INTO `sys_menu` VALUES ('3030', '303', '0,3,303,', '查看', 30, '1', 2, '', '', 'fa fa-circle-thin', '1', 'sys:job:view', '1', '2019-01-07 16:33:42', '1', '2019-01-07 16:33:42', '', '0');
INSERT INTO `sys_menu` VALUES ('3031', '303', '0,3,303,', '编辑', 60, '1', 2, '', '', 'fa fa-circle-thin', '1', 'sys:job:edit', '1', '2019-01-08 14:58:22', '1', '2019-01-08 15:02:23', '', '0');
INSERT INTO `sys_menu` VALUES ('3032', '303', '0,3,303,', '添加', 90, '1', 2, '', '', 'fa fa-circle-thin', '1', 'sys:job:add', '1', '2019-01-09 17:33:37', '1', '2019-01-09 17:33:37', '', '0');
INSERT INTO `sys_menu` VALUES ('3033', '303', '0,3,303,', '暂停', 120, '1', 2, '', '', 'fa fa-circle-thin', '1', 'sys:job:pause', '1', '2019-01-11 09:31:49', '1', '2019-01-11 09:31:49', '', '0');
INSERT INTO `sys_menu` VALUES ('3034', '303', '0,3,303,', '恢复', 150, '1', 2, '', '', 'fa fa-circle-thin', '1', 'sys:job:resume', '1', '2019-01-11 09:46:56', '1', '2019-01-11 09:46:56', '', '0');
INSERT INTO `sys_menu` VALUES ('3035', '303', '0,3,303,', '删除', 180, '1', 2, '', '', 'fa fa-circle-thin', '1', 'sys:job:del', '1', '2019-01-11 11:00:11', '1', '2019-01-11 11:00:11', '', '0');
INSERT INTO `sys_menu` VALUES ('304', '3', '0,3,', '日志查询', 70, '1', 1, '/sys/log', '', 'fa fa-edit', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2018-05-11 10:16:51', '', '0');
INSERT INTO `sys_menu` VALUES ('305', '3', '0,3,', '连接池监视', 80, '1', 1, '/../druid', '', 'fa fa-link', '1', '', '1', '2013-10-18 08:00:00', '1', '2018-05-11 10:16:02', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '0', '0,', '文件管理', 150, '0', 0, '', '', 'icon-folder', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-06-28 08:47:09', '', '0');
INSERT INTO `sys_menu` VALUES ('400', '4', '0,4,', '文件夹管理', 30, '0', 1, '/filetree/sysFileTree/index', '', 'fa fa-list', '1', '', '1', '2018-03-28 09:21:04', '1', '2018-07-27 15:20:46', '', '0');
INSERT INTO `sys_menu` VALUES ('4000', '400', '0,4,400,', '查看', 30, '1', 2, '', '', 'fa fa-circle-thin', '0', 'filetree:sysFileTree:view', '1', '2018-07-05 09:08:10', '1', '2018-07-27 15:21:28', '', '0');
INSERT INTO `sys_menu` VALUES ('4001', '400', '0,4,400,', '编辑', 60, '1', 2, '', '', 'fa fa-circle-thin', '0', 'filetree:sysFileTree:edit', '1', '2018-07-05 09:08:33', '1', '2018-07-27 15:21:44', '', '0');
INSERT INTO `sys_menu` VALUES ('401', '4', '0,4,', '文件管理', 40, '0', 1, '/file/sysFile/index', '', 'fa fa-copy', '1', '', '1', '2018-03-28 17:04:29', '1', '2018-07-27 15:21:03', '', '0');
INSERT INTO `sys_menu` VALUES ('4010', '401', '0,4,401,', '查看', 30, '1', 2, '', '', '', '0', 'file:sysFile:view', '1', '2018-03-28 17:05:35', '1', '2018-07-27 15:22:00', '', '0');
INSERT INTO `sys_menu` VALUES ('4011', '401', '0,4,401,', '编辑', 60, '1', 2, '', '', '', '0', 'file:sysFile:edit', '1', '2018-03-28 17:06:13', '1', '2018-07-27 15:22:13', '', '0');
INSERT INTO `sys_menu` VALUES ('5', '0', '0,', '代码生成', 180, '0', 0, '', '', 'icon-wrench', '1', '', '1', '2018-05-14 16:26:49', '1', '2019-03-13 10:21:31', '', '0');
INSERT INTO `sys_menu` VALUES ('500', '5', '0,5,', '业务表配置', 30, '1', 1, '/gen/genTable', '', 'fa fa-circle-thin', '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2018-05-11 10:03:11', '', '0');
INSERT INTO `sys_menu` VALUES ('501', '5', '0,5,', '生成方案配置', 60, '1', 1, '/gen/genScheme', '', 'fa fa-circle-thin', '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2018-05-11 10:03:25', '', '0');
INSERT INTO `sys_menu` VALUES ('6', '0', '0,', '代码生成测试', 210, '0', 0, '', '', 'icon-direction', '1', '', '1', '2018-12-19 16:59:07', '1', '2018-12-19 16:59:07', '', '0');
INSERT INTO `sys_menu` VALUES ('600', '6', '0,6,', '单表生成', 30, '1', 1, '/test/testData', '', 'fa fa-circle-thin', '1', 'test:testData:view,test:testData:edit', '1', '2018-12-19 17:00:12', '1', '2019-01-02 10:05:25', '', '0');
INSERT INTO `sys_menu` VALUES ('601', '6', '0,6,', '主子表生成', 60, '1', 1, '/test/testDataMain', '', 'fa fa-circle-thin', '1', 'test:testDataMain:view,test:testDataMain:edit', '1', '2018-12-29 13:34:17', '1', '2019-01-02 10:09:10', '', '0');
INSERT INTO `sys_menu` VALUES ('602', '6', '0,6,', '树结构表生成', 90, '1', 1, '/test/testTree', '', 'fa fa-circle-thin', '1', 'test:testTree:view,test:testTree:edit', '1', '2019-01-07 11:49:29', '1', '2019-01-07 11:49:29', '', '0');
INSERT INTO `sys_menu` VALUES ('7', '0', '0,', '流程管理', 120, '0', 0, '', '', 'icon-equalizer', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-08-02 09:08:56', '', '0');
INSERT INTO `sys_menu` VALUES ('700', '7', '0,7,', '运行中的流程', 30, '1', 1, '/act/process/running', '', 'fa fa-circle-thin', '1', 'act:process:edit', '1', '2018-08-02 08:58:48', '1', '2018-08-02 09:01:36', '', '0');
INSERT INTO `sys_menu` VALUES ('701', '7', '0,7,', '部署流程', 60, '1', 1, '/act/process/deploy', '', 'fa fa-circle-thin', '1', 'act:process:edit', '1', '2018-08-02 08:53:30', '1', '2018-08-02 09:02:26', '', '0');
INSERT INTO `sys_menu` VALUES ('702', '7', '0,7,', '流程管理', 90, '1', 1, '/act/process', '', 'fa fa-circle-thin', '1', 'act:process:edit', '1', '2013-05-27 08:00:00', '1', '2018-08-02 09:09:21', '', '0');
INSERT INTO `sys_menu` VALUES ('703', '7', '0,7,', '模型管理', 150, '1', 1, '/act/model', '', 'fa fa-circle-thin', '1', 'act:model:edit', '1', '2013-09-20 08:00:00', '1', '2018-08-02 09:10:06', '', '0');


-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', 'Jsite测试公司', 10, '0', 0, 'f762fb569d8445f28a226a9b831cfb90', '100000', '1', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2019-02-01 10:17:54', '', '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '综合部', 20, '1', 1, 'f762fb569d8445f28a226a9b831cfb90', '100002', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2019-01-29 09:42:45', '', '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', 30, '1', 1, 'f762fb569d8445f28a226a9b831cfb90', '100003', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2018-02-02 17:40:28', '', '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', 40, '1', 1, 'f762fb569d8445f28a226a9b831cfb90', '100004', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2018-02-02 17:40:37', '', '0');


-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '5', '系统管理员', 'Manager', 'security-role', '1', '1', '1', '1', '1', '2013-05-27 08:00:00', '1', '2019-01-11 20:55:30', 'AA', '0');
INSERT INTO `sys_role` VALUES ('2', '5', '部门经理', 'dept', 'security-role', '2', '3', '1', '1', '1', '2018-12-22 22:21:56', '1', '2019-03-13 14:11:45', '', '0');
INSERT INTO `sys_role` VALUES ('3', '3', 'hr', 'hr', 'assignment', '4', '1', '1', '1', '1', '2018-08-20 14:33:33', '1', '2019-03-13 14:11:23', '', '0');
INSERT INTO `sys_role` VALUES ('4', '4', '普通用户', 'Comuser', 'assignment', '3', '8', '1', '1', '1', '2013-05-27 08:00:00', '1', '2019-03-13 14:11:32', '', '0');

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('4', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('3', '100');
INSERT INTO `sys_role_menu` VALUES ('4', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('3', '101');
INSERT INTO `sys_role_menu` VALUES ('4', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('3', '102');
INSERT INTO `sys_role_menu` VALUES ('4', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('3', '103');
INSERT INTO `sys_role_menu` VALUES ('4', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '200');
INSERT INTO `sys_role_menu` VALUES ('1', '2000');
INSERT INTO `sys_role_menu` VALUES ('1', '2001');
INSERT INTO `sys_role_menu` VALUES ('1', '201');
INSERT INTO `sys_role_menu` VALUES ('1', '2010');
INSERT INTO `sys_role_menu` VALUES ('1', '2011');
INSERT INTO `sys_role_menu` VALUES ('1', '202');
INSERT INTO `sys_role_menu` VALUES ('1', '2020');
INSERT INTO `sys_role_menu` VALUES ('1', '2021');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '300');
INSERT INTO `sys_role_menu` VALUES ('1', '3000');
INSERT INTO `sys_role_menu` VALUES ('1', '3001');
INSERT INTO `sys_role_menu` VALUES ('1', '301');
INSERT INTO `sys_role_menu` VALUES ('1', '3010');
INSERT INTO `sys_role_menu` VALUES ('1', '3011');
INSERT INTO `sys_role_menu` VALUES ('1', '302');
INSERT INTO `sys_role_menu` VALUES ('1', '3020');
INSERT INTO `sys_role_menu` VALUES ('1', '3021');
INSERT INTO `sys_role_menu` VALUES ('1', '303');
INSERT INTO `sys_role_menu` VALUES ('1', '3030');
INSERT INTO `sys_role_menu` VALUES ('1', '3031');
INSERT INTO `sys_role_menu` VALUES ('1', '3032');
INSERT INTO `sys_role_menu` VALUES ('1', '3033');
INSERT INTO `sys_role_menu` VALUES ('1', '3034');
INSERT INTO `sys_role_menu` VALUES ('1', '3035');
INSERT INTO `sys_role_menu` VALUES ('1', '304');
INSERT INTO `sys_role_menu` VALUES ('1', '305');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('4', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '400');
INSERT INTO `sys_role_menu` VALUES ('2', '400');
INSERT INTO `sys_role_menu` VALUES ('3', '400');
INSERT INTO `sys_role_menu` VALUES ('4', '400');
INSERT INTO `sys_role_menu` VALUES ('1', '4000');
INSERT INTO `sys_role_menu` VALUES ('2', '4000');
INSERT INTO `sys_role_menu` VALUES ('3', '4000');
INSERT INTO `sys_role_menu` VALUES ('4', '4000');
INSERT INTO `sys_role_menu` VALUES ('1', '4001');
INSERT INTO `sys_role_menu` VALUES ('2', '4001');
INSERT INTO `sys_role_menu` VALUES ('3', '4001');
INSERT INTO `sys_role_menu` VALUES ('4', '4001');
INSERT INTO `sys_role_menu` VALUES ('1', '401');
INSERT INTO `sys_role_menu` VALUES ('2', '401');
INSERT INTO `sys_role_menu` VALUES ('3', '401');
INSERT INTO `sys_role_menu` VALUES ('4', '401');
INSERT INTO `sys_role_menu` VALUES ('1', '4010');
INSERT INTO `sys_role_menu` VALUES ('2', '4010');
INSERT INTO `sys_role_menu` VALUES ('3', '4010');
INSERT INTO `sys_role_menu` VALUES ('4', '4010');
INSERT INTO `sys_role_menu` VALUES ('1', '4011');
INSERT INTO `sys_role_menu` VALUES ('2', '4011');
INSERT INTO `sys_role_menu` VALUES ('3', '4011');
INSERT INTO `sys_role_menu` VALUES ('4', '4011');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '500');
INSERT INTO `sys_role_menu` VALUES ('1', '501');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '600');
INSERT INTO `sys_role_menu` VALUES ('1', '601');
INSERT INTO `sys_role_menu` VALUES ('1', '602');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '700');
INSERT INTO `sys_role_menu` VALUES ('1', '701');
INSERT INTO `sys_role_menu` VALUES ('1', '702');
INSERT INTO `sys_role_menu` VALUES ('1', '703');


-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '5', 'jsite', '57b89d1421898c692ebf98b530c3869b56d32e1e80f2bb703aba8a39', '0001', '系统管理员', 'admin@admin.com', '1111', '1111', '1', '/jsite/userfiles/headphoto/1.jpg', '0:0:0:0:0:0:0:1', '2019-03-13 14:11:07', '1', '1', '2013-05-27 08:00:00', '1', '2019-01-10 10:38:39', '11221', '0');
INSERT INTO `sys_user` VALUES ('2', '1', '5', 'dept', '56c52163316679d8c83c84f03d44a592246d76a70bacb1da76cdc149', '000002', '部门经理', '', '', '', '2', NULL, '36.110.13.18', '2019-01-11 17:41:41', '1', '1', '2018-12-22 22:22:25', '1', '2018-12-22 22:22:25', '', '0');
INSERT INTO `sys_user` VALUES ('3', '1', '3', 'jsitehr', '7e14e4c693492493db3bc12ba2bdd9cec2629613deae9ebd9c42dac1', '000003', '人力资源', '', '', '', '4', NULL, '39.128.26.20', '2019-01-10 22:51:08', '1', '1', '2018-12-22 22:23:39', '1', '2018-12-28 13:52:29', '', '0');
INSERT INTO `sys_user` VALUES ('4', '1', '5', 'jsiteuser', '2f445129a012d18383f4fbdc9fdaca446794a89e80c384dc3a1e1f1a', '000005', '普通用户', '', '', '', '3', NULL, '118.117.68.100', '2019-01-02 10:48:42', '1', '1', '2018-12-28 13:55:56', '1', '2018-12-28 16:44:40', '', '0');

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '3');
INSERT INTO `sys_user_role` VALUES ('4', '4');


-- ----------------------------
-- Records of test_data
-- ----------------------------
INSERT INTO `test_data` VALUES ('1308ea640764443898a5673b3712c447', '', '', '', '', '', null, '1', '2019-01-03 01:55:41', '1', '2019-01-03 01:55:41', '', '0');
INSERT INTO `test_data` VALUES ('4491abf519834a078b307fcfb1aee334', '56620c5ef567427c8debe68875c0eda2', '3', '', '', '', null, '1', '2019-01-02 11:19:24', '1', '2019-01-02 11:19:24', '', '1');
INSERT INTO `test_data` VALUES ('ba7c670abe4a49d1af8ded2256810f36', '56620c5ef567427c8debe68875c0eda2', '5', '1', '', 'a', '2019-01-08', '1', '2019-01-08 16:12:42', '1', '2019-01-10 19:00:11', 'aaaaaaa', '0');
INSERT INTO `test_data` VALUES ('bbd94222359142af97c01e5f9920ea32', '56620c5ef567427c8debe68875c0eda2', '4', '3fbaf3a3f58a47118f13976cb2e2544d', '改革', '', '2019-01-02', '1', '2019-01-02 11:10:22', '1', '2019-01-11 19:12:13', '', '0');
INSERT INTO `test_data` VALUES ('e55163dab0e74737968584bc6c2d7507', '43f6a4a84e784e5e98b5b1c530bef73b', '3', 'da2da01621b64be5a85b07a8c883228f', '', '', '2019-01-02', '1', '2019-01-02 13:07:00', '1', '2019-01-02 13:07:00', '', '1');


-- ----------------------------
-- Records of test_data_child
-- ----------------------------
INSERT INTO `test_data_child` VALUES ('2357df346f1642d99a15a49e1be09cfb', '40a0fd9625e742f19e310a9469341260', 'aaabb', '1', '2019-01-04 15:59:34', '1', '2019-01-04 15:59:34', 'abbb', '1');
INSERT INTO `test_data_child` VALUES ('4fd234bb5ba147cf8103ab5e97ff0a08', null, '333', '1', '2019-01-05 21:49:14', '1', '2019-01-05 21:55:37', '444', '0');
INSERT INTO `test_data_child` VALUES ('5c393aca623f49b9badf54ff44463fb6', '135e474961044a42b1d480c7dfe816f0', 'testtbl1', '1', '2019-01-11 18:15:43', '1', '2019-01-11 18:15:43', '', '0');
INSERT INTO `test_data_child` VALUES ('6c4be2cc266c44baa087d6a71dfee9e2', null, 'wre', '1', '2019-01-07 13:35:47', '1', '2019-01-08 11:53:29', 'ewr', '0');
INSERT INTO `test_data_child` VALUES ('6cbf4b86873840c08954387b3898084d', null, 'rwerw', '1', '2019-01-07 13:35:47', '1', '2019-01-08 11:53:29', 'erwewr', '0');
INSERT INTO `test_data_child` VALUES ('a6b8d00d29664df99bf6dbecb08f719b', 'c557c0a63c854975beed9ec276129b3f', 'sfsadf', '1', '2019-01-02 12:28:28', '1', '2019-01-02 12:28:28', 'sadf', '1');
INSERT INTO `test_data_child` VALUES ('b49de329fb6f4663b026576eab6cb729', null, '111', '1', '2019-01-05 21:49:14', '1', '2019-01-05 21:55:37', '222', '0');
INSERT INTO `test_data_child` VALUES ('c048e370336e41bb92c7f45791aa4872', null, 'erwrw', '1', '2019-01-07 13:35:47', '1', '2019-01-08 11:53:29', 'rewrew', '0');
INSERT INTO `test_data_child` VALUES ('e09ddbd55180465f9a8ab4dc8e6fd990', '838616e721d440c88c56605aee981c99', '', '1', '2019-01-07 09:40:27', '1', '2019-01-07 09:40:27', '', '0');
INSERT INTO `test_data_child` VALUES ('e4f228d237204430a18eeea8101c7a1f', '40a0fd9625e742f19e310a9469341260', 'bbbbcc', '1', '2019-01-04 15:59:34', '1', '2019-01-04 15:59:34', 'ccdd', '1');


-- ----------------------------
-- Records of test_data_main
-- ----------------------------
INSERT INTO `test_data_main` VALUES ('135e474961044a42b1d480c7dfe816f0', '3', '4', 'f762fb569d8445f28a226a9b831cfb90', '站点', '难', '2019-01-05', '1', '2019-01-05 21:49:14', '1', '2019-01-11 18:15:43', '', '0');
INSERT INTO `test_data_main` VALUES ('40a0fd9625e742f19e310a9469341260', '68225048f4b7465293feb9779448d0af', '5', 'da2da01621b64be5a85b07a8c883228f', 'aaaabbb', 'a', '2019-01-04', '1', '2019-01-04 15:59:34', '1', '2019-01-05 21:32:22', 'aaa', '0');
INSERT INTO `test_data_main` VALUES ('838616e721d440c88c56605aee981c99', '', '', '', '', '', null, '1', '2019-01-07 09:40:27', '1', '2019-01-07 09:40:27', '', '0');
INSERT INTO `test_data_main` VALUES ('bf07d5f74023446db5b070e25bbdae26', '4', '3', 'f762fb569d8445f28a226a9b831cfb90', '', 'a', null, '1', '2019-01-02 12:28:49', '1', '2019-01-02 17:27:17', 'asdf', '1');
INSERT INTO `test_data_main` VALUES ('c557c0a63c854975beed9ec276129b3f', '', '', '', '', '', null, '1', '2019-01-02 12:28:28', '1', '2019-01-02 12:28:28', '', '1');


-- ----------------------------
-- Records of test_tree
-- ----------------------------
INSERT INTO `test_tree` VALUES ('0e5f08e37f354783b83d4c12292bb8ce', '0', '0,', '', '30', '1', '0', '1', '2019-01-10 21:44:15', '1', '2019-01-10 21:44:15', '', '0');
INSERT INTO `test_tree` VALUES ('e323c4775e6240fbb924b6442ab8a49d', '0', '0,', '树结构父节点', '30', '0', '0', '1', '2019-01-07 16:55:15', '1', '2019-01-08 15:01:48', 'aa', '0');
INSERT INTO `test_tree` VALUES ('e5a9917fecb94db4b1e6ceede9716715', 'e323c4775e6240fbb924b6442ab8a49d', '0,e323c4775e6240fbb924b6442ab8a49d,', '树结构子节点', '30', '1', '1', '1', '2019-01-07 17:39:06', '1', '2019-01-08 15:02:06', '啊啊', '0');

SET FOREIGN_KEY_CHECKS = 1;