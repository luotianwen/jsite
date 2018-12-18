/*
 Navicat Premium Data Transfer

 Source Server         : jsite
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : 39.105.173.191:3306
 Source Schema         : jsite

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 29/11/2018 15:54:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ACT_DE_DATABASECHANGELOG
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DE_DATABASECHANGELOG`;
CREATE TABLE `ACT_DE_DATABASECHANGELOG`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ACT_DE_DATABASECHANGELOG
-- ----------------------------
INSERT INTO `ACT_DE_DATABASECHANGELOG` VALUES ('1', 'flowable', 'META-INF/liquibase/flowable-modeler-app-db-changelog.xml', '2018-11-20 10:15:46', 1, 'EXECUTED', '8:e70d1d9d3899a734296b2514ccc71501', 'createTable tableName=ACT_DE_MODEL; createIndex indexName=idx_proc_mod_created, tableName=ACT_DE_MODEL; createTable tableName=ACT_DE_MODEL_HISTORY; createIndex indexName=idx_proc_mod_history_proc, tableName=ACT_DE_MODEL_HISTORY; createTable tableN...', '', NULL, '3.6.2', NULL, NULL, '2680145984');
INSERT INTO `ACT_DE_DATABASECHANGELOG` VALUES ('3', 'flowable', 'META-INF/liquibase/flowable-modeler-app-db-changelog.xml', '2018-11-20 10:15:46', 2, 'EXECUTED', '8:3a9143bef2e45f2316231cc1369138b6', 'addColumn tableName=ACT_DE_MODEL; addColumn tableName=ACT_DE_MODEL_HISTORY', '', NULL, '3.6.2', NULL, NULL, '2680145984');

-- ----------------------------
-- Table structure for ACT_DE_DATABASECHANGELOGLOCK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DE_DATABASECHANGELOGLOCK`;
CREATE TABLE `ACT_DE_DATABASECHANGELOGLOCK`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ACT_DE_DATABASECHANGELOGLOCK
-- ----------------------------
INSERT INTO `ACT_DE_DATABASECHANGELOGLOCK` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for ACT_DE_MODEL
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DE_MODEL`;
CREATE TABLE `ACT_DE_MODEL`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `model_key` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `model_comment` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created` datetime(6) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `last_updated` datetime(6) NULL DEFAULT NULL,
  `last_updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `model_editor_json` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `thumbnail` longblob NULL,
  `model_type` int(11) NULL DEFAULT NULL,
  `tenant_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_proc_mod_created`(`created_by`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ACT_DE_MODEL
-- ----------------------------
INSERT INTO `ACT_DE_MODEL` VALUES ('86fcba22-ec6d-11e8-bf0c-c85b7643dd9e', '请假流程', 'leave', '请假流程演示', NULL, '2018-11-20 10:39:39.316000', 'admin', '2018-11-20 10:42:14.663000', 'admin', 1, '{\"modelId\":\"86fcba22-ec6d-11e8-bf0c-c85b7643dd9e\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"leave\",\"name\":\"请假流程\",\"documentation\":\"请假流程演示\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"com.thinkgem.jeesite.modules.oa.leave\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"{\\\"executionListeners\\\":[]}\",\"eventlisteners\":\"{\\\"eventListeners\\\":[]}\",\"signaldefinitions\":\"[]\",\"messagedefinitions\":\"[]\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\",\"messages\":[]},\"childShapes\":[{\"resourceId\":\"startevent1\",\"properties\":{\"overrideid\":\"startevent1\",\"name\":\"发起流程\",\"documentation\":\"\",\"executionlisteners\":{\"executionListeners\":[]},\"initiator\":\"applyUserId\",\"formkeydefinition\":\"/oa/leave/form\",\"formreference\":\"\",\"formproperties\":\"\",\"interrupting\":true},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow2\"}],\"bounds\":{\"lowerRight\":{\"x\":200,\"y\":122},\"upperLeft\":{\"x\":170,\"y\":92}},\"dockers\":[]},{\"resourceId\":\"deptLeaderAudit\",\"properties\":{\"overrideid\":\"deptLeaderAudit\",\"name\":\"部门领导审批\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"candidateGroups\":[{\"value\":\"dept\"}]}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow3\"}],\"bounds\":{\"lowerRight\":{\"x\":356.1111107840623,\"y\":135},\"upperLeft\":{\"x\":251.1111107840623,\"y\":80}},\"dockers\":[]},{\"resourceId\":\"exclusivegateway5\",\"properties\":{\"overrideid\":\"exclusivegateway5\",\"name\":\"Exclusive Gateway\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow5\"},{\"resourceId\":\"flow4\"}],\"bounds\":{\"lowerRight\":{\"x\":457.7777769601558,\"y\":127},\"upperLeft\":{\"x\":417.7777769601558,\"y\":87}},\"dockers\":[]},{\"resourceId\":\"modifyApply\",\"properties\":{\"overrideid\":\"modifyApply\",\"name\":\"调整申请\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"${applyUserId}\"}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[{\"event\":\"complete\",\"delegateExpression\":\"${leaveModifyProcessor}\"}]},\"skipexpression\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow11\"}],\"bounds\":{\"lowerRight\":{\"x\":490.27777696015585,\"y\":245},\"upperLeft\":{\"x\":385.2777769601558,\"y\":190}},\"dockers\":[]},{\"resourceId\":\"hrAudit\",\"properties\":{\"overrideid\":\"hrAudit\",\"name\":\"人事审批\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"candidateGroups\":[{\"value\":\"hr\"}]}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow6\"}],\"bounds\":{\"lowerRight\":{\"x\":652.4074062082284,\"y\":135},\"upperLeft\":{\"x\":547.4074062082284,\"y\":80}},\"dockers\":[]},{\"resourceId\":\"exclusivegateway6\",\"properties\":{\"overrideid\":\"exclusivegateway6\",\"name\":\"Exclusive Gateway\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow7\"},{\"resourceId\":\"flow9\"}],\"bounds\":{\"lowerRight\":{\"x\":754.0740723843219,\"y\":127.5},\"upperLeft\":{\"x\":714.0740723843219,\"y\":87.5}},\"dockers\":[]},{\"resourceId\":\"endevent1\",\"properties\":{\"overrideid\":\"endevent1\",\"name\":\"End\",\"documentation\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":928.722220096405,\"y\":311},\"upperLeft\":{\"x\":900.722220096405,\"y\":283}},\"dockers\":[]},{\"resourceId\":\"exclusivegateway7\",\"properties\":{\"overrideid\":\"exclusivegateway7\",\"name\":\"Exclusive Gateway\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow12\"},{\"resourceId\":\"flow10\"}],\"bounds\":{\"lowerRight\":{\"x\":457.7777769601558,\"y\":317},\"upperLeft\":{\"x\":417.7777769601558,\"y\":277}},\"dockers\":[]},{\"resourceId\":\"flow6\",\"properties\":{\"overrideid\":\"flow6\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"exclusivegateway6\"}],\"bounds\":{\"lowerRight\":{\"x\":714.2068849533086,\"y\":107.5},\"upperLeft\":{\"x\":653.3162601832651,\"y\":107.5}},\"dockers\":[{\"x\":52.5,\"y\":27.5},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"exclusivegateway6\"}},{\"resourceId\":\"flow3\",\"properties\":{\"overrideid\":\"flow3\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"exclusivegateway5\"}],\"bounds\":{\"lowerRight\":{\"x\":417.9105964732469,\"y\":107.30096081779048},\"upperLeft\":{\"x\":357.0199578149946,\"y\":107.07403918220952}},\"dockers\":[{\"x\":52.5,\"y\":27.5},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"exclusivegateway5\"}},{\"resourceId\":\"flow2\",\"properties\":{\"overrideid\":\"flow2\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"deptLeaderAudit\"}],\"bounds\":{\"lowerRight\":{\"x\":250.71875870095414,\"y\":107.27703458076789},\"upperLeft\":{\"x\":200.82637996308867,\"y\":107.06671541923211}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":52.5,\"y\":27.5}],\"target\":{\"resourceId\":\"deptLeaderAudit\"}},{\"resourceId\":\"flow4\",\"properties\":{\"overrideid\":\"flow4\",\"name\":\"不同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"${!auditPass}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"modifyApply\"}],\"bounds\":{\"lowerRight\":{\"x\":437.77777696015585,\"y\":189.73828125},\"upperLeft\":{\"x\":437.77777696015585,\"y\":126.9921875}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":52.50000000000003,\"y\":27.5}],\"target\":{\"resourceId\":\"modifyApply\"}},{\"resourceId\":\"flow11\",\"properties\":{\"overrideid\":\"flow11\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"exclusivegateway7\"}],\"bounds\":{\"lowerRight\":{\"x\":437.77777696015585,\"y\":277.3671875},\"upperLeft\":{\"x\":437.77777696015585,\"y\":245.828125}},\"dockers\":[{\"x\":52.50000000000003,\"y\":27.5},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"exclusivegateway7\"}},{\"resourceId\":\"flow12\",\"properties\":{\"overrideid\":\"flow12\",\"name\":\"结束流程\",\"documentation\":\"\",\"conditionsequenceflow\":\"${!auditPass}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"endevent1\"}],\"bounds\":{\"lowerRight\":{\"x\":900.6807704793981,\"y\":297},\"upperLeft\":{\"x\":457.4084192701655,\"y\":297}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"endevent1\"}},{\"resourceId\":\"flow10\",\"properties\":{\"overrideid\":\"flow10\",\"name\":\"重新申请\",\"documentation\":\"\",\"conditionsequenceflow\":\"${auditPass}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"deptLeaderAudit\"}],\"bounds\":{\"lowerRight\":{\"x\":417.8246520751339,\"y\":297},\"upperLeft\":{\"x\":303,\"y\":135.14843230018272}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":303,\"y\":297},{\"x\":52.5,\"y\":27.5}],\"target\":{\"resourceId\":\"deptLeaderAudit\"}},{\"resourceId\":\"flow9\",\"properties\":{\"overrideid\":\"flow9\",\"name\":\"不同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"${!auditPass}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"modifyApply\"}],\"bounds\":{\"lowerRight\":{\"x\":734.0606647332905,\"y\":217.41042145542866},\"upperLeft\":{\"x\":490.8480881793412,\"y\":127.32031227120092}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":734,\"y\":217},{\"x\":52.50000000000003,\"y\":27.5}],\"target\":{\"resourceId\":\"modifyApply\"}},{\"resourceId\":\"flow7\",\"properties\":{\"overrideid\":\"flow7\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"${auditPass}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"endevent1\"}],\"bounds\":{\"lowerRight\":{\"x\":914.667657765859,\"y\":282.5703196488758},\"upperLeft\":{\"x\":754.0506003135322,\"y\":106}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":914,\"y\":106},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"endevent1\"}},{\"resourceId\":\"flow5\",\"properties\":{\"overrideid\":\"flow5\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"${auditPass}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"hrAudit\"}],\"bounds\":{\"lowerRight\":{\"x\":546.9752640950512,\"y\":107.33675981263059},\"upperLeft\":{\"x\":457.77733813231816,\"y\":107.06167768736941}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":52.5,\"y\":27.5}],\"target\":{\"resourceId\":\"hrAudit\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}', 0x89504E470D0A1A0A0000000D49484452000001050000005C08060000006760A01A000009B84944415478DAED9D6D6854571AC7456CA085B642FD605B5BBA6DA07EE86E69A1ED878A441A16769BE82E34336632C42AA92FB4F643CB820B2D0DB298D5B848AD2FD008B568714C58FDB06DC1664C934985A8F42DB6A4C4668CD269881162EA5689319EFDFF873992B5E6C564E6CCBD73FF3F78B8F7C66B6ECE739EE77FCF39F7DE7366CD12420821841042082184104208BF638C99934C269B3A3A3A468F1E3D6A9A9B9B9D583C1E378944E2022C2ADFCBF7C2433028DBDBDBCDF9F3E7CDF0F0B0531B1818306D6D6D4308D297E47BF95E7804DEA51894970653E6DB4FFE96DE3A0ECE61DCBDBA1C1577AE177D4F3FE4C3FF8E7DEF39FF8B7160B39501F25D736D3A28B9757DD742608E38286A295BECB032AFF93E9FFE77E47B4FFADF975455552D0887C3DB2291C8D9E5CB979B68347A01DBDD151515C5D9BA06FB980C8ED3C776A48392DB3C888271109083B06D99AD2702D3FA3E9FFE77E07BCFFADF778442A1528841FFF6EDDBBF3F73E6CCB0017D7D7D66DFBE7D832B56ACB808B128CB6660761F7B2F1D94DC16982894DE1488A55E09CCB1A2902FFF3B1464CFF9DF772D040A02FA9C3F9B5BD0D9D96956AE5C79291B2D06060583F1662B90C01C2F003D11985614F2E97FC7823C4BC2304DD86500DF980988C562A3353535FFC9E6DD2A5F96A3C09C2CF0F21E9805EC7B5FF8DF57545656F62693C95F2612057625D85A5060CE28E0F21A9801166409C3EDC241C5A9C0F3A6F9FBBB60B568913C514881C972959797FF3333CABD7B8AFFAD2E73FE5C87F59BF67FA1894236FCBF7AF5EA3BF03BEE42D7F85EDC1CE745A3D1FBB1FF3062F5311C2F44D7FAF7D87F1AD77A0EC78B42A1D0121CFF11C72FE2F82FD8AFC07E04FB2B6035385E87E3D7B1FF26F63760FF6DD8461CD7E1782BF6DF85EDC27E03B67B611FE1DF1A717C18FB1FC33E837D0EFB02761CF615EC14CEF901DB1ED839581F8C0F018660976123D3CDCD71E1D3063BB838494BE1BFBCF84CCC2B8139D3728CB5254B9698A2A22273BB77AA6CFE0D7EF27DB6CB3E03FF5F875D85FD0ABB081B80FD0CE3D3B71F293A48D64E6CBF8475C0DA919C2DD81E6102339199D04C6C267826D17731F1290014020A0285810241A1A0605038282014120A0A85850243A1A1E0507860CF232F9FC5CF9EE2CD1442F5388E1FC5F143D89F5F5D5D7D1F04EB1EECDF5952523227EBA2C031859D3B779E9E48140E1E3C68D6AD5B77444D588D29684CC19BADFD5C3C7D387FE2C489A1F19E3EAC5AB5EAD76C3D7D0860607AEAE94381FA3ED04F1FB22E0A84EF29F065A5868686BEDEDEDE1B5D8603070E0CB3DB80E6CA3205E6B402D393EF2914A8EF3DED7FDF89826D31E0977F0071F8891781100CC2FE9DCD371AC7BE6A9B27BBE2E0555B4FBE511710DF7BD6FFBE140517241289BE7C7CA5672D954AC51C7D94E3B977EF03E47B4FFA5FA2300E2D2D2DCB5A5B5B2FF6F7F75F767D976250C6E3F1B30E3FDF9DEBA5CA0A98EF3DE77F89C2042030CA70C738C9A6A4AB893E32D7EA72FD3DBFD72A2B48BE2F88645139555942FE57396F13BE65160E87AFABB284FCAF38B3857F0736AACA12F2BFE2CCB614BE972808F95F7176037EB8C2F7D4555942FE579CD996C23C7EB8A2CA12F2BFE22C0D3F6DE5976CAA2C21FF2BCE6CF7E1617EDAAACA12F2BFE22C0D27BFE0B7EEAA2C21FF2BCEEC98C2424E7EA1CA12F2BFE22C4D667AAC4E559690FF1567B6FBC0F9F2BE546509F95F71660BFF1CE7CB536509F95F7166C7141671024D559690FF15676938D32D67D4556509F95F7166C71438E7FE119F54D42989829245E5CC7DE15FE49CFB3EF95BDF9228285954CEDC8F2970559EC33EF95B174A14942C2A67EEBB0F5C4DA7D1C5B58C317392C964534747C728674276357D593C1E378944E2022CAAB456B2A89C93173EC265BA5C5C8B82D0DEDE6E3803F2A5C1547AC9766E5D4C763A303060DADADA86F231AFA19245E5F45BF781EBEFED75712DB610EC94E8DF35D7A645815B57B3204318861D4E89AE6451397D2B0A5CD9B7C1C5B5C62E9E72FAD88EB42870EB7845A511A5B69245E59C784C814B7DEF7271ADB1CBAC751F7B2F2D0ADC16D8326B4A1695D3F7857F9D4B7DBB14058AC1CD265150B2A89CDEE93EBC89D6C256D72D85025E9055C9A272FABEFBB001C2502751104A1689822DFCDBB08D411285CC02381B605F2BCD952C1285DF167E23852148A2C00A974DDF240A853FA650C7BBA6BA0F424814EC98C2560E364A14849028D8C2BFCBC792120521240AB6F0BBF802934441088982ED3E34F0556717D71AFB9A739EEC8A5E73161285C90BBF971F45B9B8562291E8B31F44E5C352A9544C1F440989C2E485FF889F4FBBB8564B4BCBB2D6D6D68BFDFDFD975DB7102808F178FCAC3E9D16128549E0042B9C68C5D5F5909465B85B9F6433DED5242B996B7549108444616A630A8739259B2A4B08C5992DFCC79CBC55952584E2CC16FE334EF3AECA124271660BFF391784516509A138B385FF02A2F0BC2A4B08C5992DFCF14824F2AC2A4B08C5992DFC57B0A754594228CE6CE14F85C3E12754594228CED2545656FE505151F1B85F044CA220240AB92F7C4F241279D40F7F6B7979F93F240A42379FDC3BE01CEC211FFCA9A530B378F1628982C8754EBC157451E843F761BE0F046110B6ADA8A8889555A6D015B900B9508C2EF5DF33F351AEE5785B4949C99CA089C285EAEAEAFB7C200865E31C0B316320048B900B276F35512D67FD0E8542A5411285A1AAAAAA7B7C2208B3240C220739F0126C8402B066CD9AEB7BF6EC314D4D4D86DBB56BD7DE1007084734280EB98C26D39D3E12040983C86677613E5A02834CFAC6C6C6D1AB57AF9AB15CBB76CD1C3A748882700DE75CC20D7441104461C4837DA6A926BC8441CCB4DB504341D8B469D3393301F5F5F5293BCE100451604187E19C5F38BE0063E193B02ED8B7B013B076581CF629E75FC03686F33FE4FC8ED8DF81FD7F71FD08ECD77290063F7F03F61A8E5FC1B61ADB30ECAF9148E4CFD8BEC0FE1B5FADC6BF3DC9D59AA0D6BF833D88FD79C5C5C50B66CF9ECDC1C4DD532C0297BCE3F97315E2E236639F31DECA1CD8BF7FFF95894421168B8D6472A536284DA8A2A54B97DECDA444A11F60923259617F40E23E9319847901FB7FE2842C4C72267B46655FA50864466CDF816DA248502C60EF533C2822B04338EF938CB850648EC3BEC9540C45E827D800C509E78DC0A6F294E1FF5A0A5ABD4936139B88CD9B378F06A6A5E06134A620720EC708EC20634F4FCF2D05A1B7B7D744A3D1D1CC798FC86BDE14060982C86637A29EA2C0270DDDDDDDBF1184F5EBD7DBD644BDBCE54D619020885C084393ED46D4D5D5718CC16CD9B2C5A0256105A129702F31F94418B64910448E5B0C23378D35F0B85E82E05D61D02BCEC2C518C3CB7CCAC041458D21781F3D761442082184104208218410420821841042082184104208216EC5FF00AFDEE7FF036BBB930000000049454E44AE426082, 0, NULL);

-- ----------------------------
-- Table structure for ACT_DE_MODEL_HISTORY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DE_MODEL_HISTORY`;
CREATE TABLE `ACT_DE_MODEL_HISTORY`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `model_key` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `model_comment` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created` datetime(6) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `last_updated` datetime(6) NULL DEFAULT NULL,
  `last_updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `removal_date` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `model_editor_json` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `model_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `model_type` int(11) NULL DEFAULT NULL,
  `tenant_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_proc_mod_history_proc`(`model_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ACT_DE_MODEL_HISTORY
-- ----------------------------
INSERT INTO `ACT_DE_MODEL_HISTORY` VALUES ('622e6cc1-ec6d-11e8-bf0c-c85b7643dd9e', '请假流程', 'leave', '请假流程演示', NULL, '2018-11-20 10:34:48.744000', 'admin', '2018-11-20 10:34:48.744000', 'admin', '2018-11-20 10:38:37.760000', 1, '{\"bounds\":{\"lowerRight\":{\"x\":1485.0,\"y\":700.0},\"upperLeft\":{\"x\":0.0,\"y\":0.0}},\"resourceId\":\"canvas\",\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"},\"properties\":{\"process_id\":\"leave\",\"name\":\"请假流程\",\"documentation\":\"请假流程演示\",\"process_namespace\":\"com.thinkgem.jeesite.modules.oa.leave\",\"iseagerexecutionfetch\":false,\"messages\":[],\"executionlisteners\":{\"executionListeners\":[]},\"eventlisteners\":{\"eventListeners\":[]},\"signaldefinitions\":[],\"messagedefinitions\":[]},\"childShapes\":[{\"bounds\":{\"lowerRight\":{\"x\":45.0,\"y\":125.0},\"upperLeft\":{\"x\":10.0,\"y\":90.0}},\"resourceId\":\"startevent1\",\"childShapes\":[],\"stencil\":{\"id\":\"StartNoneEvent\"},\"properties\":{\"overrideid\":\"startevent1\",\"name\":\"Start\",\"initiator\":\"applyUserId\",\"interrupting\":true,\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow2\"}]},{\"bounds\":{\"lowerRight\":{\"x\":195.0,\"y\":135.0},\"upperLeft\":{\"x\":90.0,\"y\":80.0}},\"resourceId\":\"deptLeaderAudit\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"deptLeaderAudit\",\"name\":\"部门领导审批\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"candidateGroups\":[{\"value\":\"dept\"}]}},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow3\"}]},{\"bounds\":{\"lowerRight\":{\"x\":290.0,\"y\":127.0},\"upperLeft\":{\"x\":250.0,\"y\":87.0}},\"resourceId\":\"exclusivegateway5\",\"childShapes\":[],\"stencil\":{\"id\":\"ExclusiveGateway\"},\"properties\":{\"overrideid\":\"exclusivegateway5\",\"name\":\"Exclusive Gateway\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow4\"},{\"resourceId\":\"flow5\"}]},{\"bounds\":{\"lowerRight\":{\"x\":323.0,\"y\":245.0},\"upperLeft\":{\"x\":218.0,\"y\":190.0}},\"resourceId\":\"modifyApply\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"modifyApply\",\"name\":\"调整申请\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"${applyUserId}\"}},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"tasklisteners\":{\"taskListeners\":[{\"event\":\"complete\",\"delegateExpression\":\"${leaveModifyProcessor}\"}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow11\"}]},{\"bounds\":{\"lowerRight\":{\"x\":463.0,\"y\":135.0},\"upperLeft\":{\"x\":358.0,\"y\":80.0}},\"resourceId\":\"hrAudit\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"hrAudit\",\"name\":\"人事审批\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"candidateGroups\":[{\"value\":\"hr\"}]}},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow6\"}]},{\"bounds\":{\"lowerRight\":{\"x\":535.0,\"y\":127.0},\"upperLeft\":{\"x\":495.0,\"y\":87.0}},\"resourceId\":\"exclusivegateway6\",\"childShapes\":[],\"stencil\":{\"id\":\"ExclusiveGateway\"},\"properties\":{\"overrideid\":\"exclusivegateway6\",\"name\":\"Exclusive Gateway\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow7\"},{\"resourceId\":\"flow9\"}]},{\"bounds\":{\"lowerRight\":{\"x\":695.0,\"y\":135.0},\"upperLeft\":{\"x\":590.0,\"y\":80.0}},\"resourceId\":\"reportBack\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"reportBack\",\"name\":\"销假\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"${applyUserId}\"}},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"tasklisteners\":{\"taskListeners\":[{\"event\":\"complete\",\"delegateExpression\":\"${leaveReportProcessor}\"}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow8\"}]},{\"bounds\":{\"lowerRight\":{\"x\":660.0,\"y\":318.0},\"upperLeft\":{\"x\":625.0,\"y\":283.0}},\"resourceId\":\"endevent1\",\"childShapes\":[],\"stencil\":{\"id\":\"EndNoneEvent\"},\"properties\":{\"overrideid\":\"endevent1\",\"name\":\"End\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[]},{\"bounds\":{\"lowerRight\":{\"x\":290.0,\"y\":320.0},\"upperLeft\":{\"x\":250.0,\"y\":280.0}},\"resourceId\":\"exclusivegateway7\",\"childShapes\":[],\"stencil\":{\"id\":\"ExclusiveGateway\"},\"properties\":{\"overrideid\":\"exclusivegateway7\",\"name\":\"Exclusive Gateway\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"flow10\"},{\"resourceId\":\"flow12\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow2\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":17.5,\"y\":17.5},{\"x\":52.5,\"y\":27.5}],\"outgoing\":[{\"resourceId\":\"deptLeaderAudit\"}],\"target\":{\"resourceId\":\"deptLeaderAudit\"},\"properties\":{\"overrideid\":\"flow2\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow3\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":52.5,\"y\":27.5},{\"x\":20.0,\"y\":20.0}],\"outgoing\":[{\"resourceId\":\"exclusivegateway5\"}],\"target\":{\"resourceId\":\"exclusivegateway5\"},\"properties\":{\"overrideid\":\"flow3\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow4\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":52.5,\"y\":27.5}],\"outgoing\":[{\"resourceId\":\"modifyApply\"}],\"target\":{\"resourceId\":\"modifyApply\"},\"properties\":{\"overrideid\":\"flow4\",\"name\":\"不同意\",\"conditionsequenceflow\":\"${!deptLeaderPass}\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow5\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":52.5,\"y\":27.5}],\"outgoing\":[{\"resourceId\":\"hrAudit\"}],\"target\":{\"resourceId\":\"hrAudit\"},\"properties\":{\"overrideid\":\"flow5\",\"name\":\"同意\",\"conditionsequenceflow\":\"${deptLeaderPass}\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow6\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":52.5,\"y\":27.5},{\"x\":20.0,\"y\":20.0}],\"outgoing\":[{\"resourceId\":\"exclusivegateway6\"}],\"target\":{\"resourceId\":\"exclusivegateway6\"},\"properties\":{\"overrideid\":\"flow6\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow7\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":52.5,\"y\":27.5}],\"outgoing\":[{\"resourceId\":\"reportBack\"}],\"target\":{\"resourceId\":\"reportBack\"},\"properties\":{\"overrideid\":\"flow7\",\"name\":\"同意\",\"conditionsequenceflow\":\"${hrPass}\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow8\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":52.5,\"y\":27.5},{\"x\":17.5,\"y\":17.5}],\"outgoing\":[{\"resourceId\":\"endevent1\"}],\"target\":{\"resourceId\":\"endevent1\"},\"properties\":{\"overrideid\":\"flow8\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow9\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":514.0,\"y\":217.0},{\"x\":52.5,\"y\":27.5}],\"outgoing\":[{\"resourceId\":\"modifyApply\"}],\"target\":{\"resourceId\":\"modifyApply\"},\"properties\":{\"overrideid\":\"flow9\",\"name\":\"不同意\",\"conditionsequenceflow\":\"${!hrPass}\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow10\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":142.0,\"y\":299.0},{\"x\":52.5,\"y\":27.5}],\"outgoing\":[{\"resourceId\":\"deptLeaderAudit\"}],\"target\":{\"resourceId\":\"deptLeaderAudit\"},\"properties\":{\"overrideid\":\"flow10\",\"name\":\"重新申请\",\"conditionsequenceflow\":\"${reApply}\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow11\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":52.5,\"y\":27.5},{\"x\":20.0,\"y\":20.0}],\"outgoing\":[{\"resourceId\":\"exclusivegateway7\"}],\"target\":{\"resourceId\":\"exclusivegateway7\"},\"properties\":{\"overrideid\":\"flow11\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"flow12\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":20.0,\"y\":20.0},{\"x\":17.5,\"y\":17.5}],\"outgoing\":[{\"resourceId\":\"endevent1\"}],\"target\":{\"resourceId\":\"endevent1\"},\"properties\":{\"overrideid\":\"flow12\",\"name\":\"结束流程\",\"conditionsequenceflow\":\"${!reApply}\"}}]}', 'd9d0c1c0-ec6c-11e8-bf0c-c85b7643dd9e', 0, NULL);

-- ----------------------------
-- Table structure for ACT_DE_MODEL_RELATION
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DE_MODEL_RELATION`;
CREATE TABLE `ACT_DE_MODEL_RELATION`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `parent_model_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `model_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `relation_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_relation_parent`(`parent_model_id`) USING BTREE,
  INDEX `fk_relation_child`(`model_id`) USING BTREE,
  CONSTRAINT `fk_relation_child` FOREIGN KEY (`model_id`) REFERENCES `ACT_DE_MODEL` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_relation_parent` FOREIGN KEY (`parent_model_id`) REFERENCES `ACT_DE_MODEL` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_EVT_LOG
-- ----------------------------
DROP TABLE IF EXISTS `ACT_EVT_LOG`;
CREATE TABLE `ACT_EVT_LOG`  (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` longblob NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_GE_BYTEARRAY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;
CREATE TABLE `ACT_GE_BYTEARRAY`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  `GENERATED_` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_BYTEARR_DEPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ACT_GE_BYTEARRAY
-- ----------------------------
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('f6fa5034-ec6d-11e8-bf0c-c85b7643dd9e', 1, '请假流程.bpmn20.xml', 'f6fa5033-ec6d-11e8-bf0c-c85b7643dd9e', 0x3C3F786D6C2076657273696F6E3D27312E302720656E636F64696E673D275554462D38273F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22636F6D2E7468696E6B67656D2E6A6565736974652E6D6F64756C65732E6F612E6C65617665223E0A20203C70726F636573732069643D226C6561766522206E616D653D22E8AFB7E58187E6B581E7A88B2220697345786563757461626C653D2274727565223E0A202020203C646F63756D656E746174696F6E3EE8AFB7E58187E6B581E7A88BE6BC94E7A4BA3C2F646F63756D656E746174696F6E3E0A202020203C73746172744576656E742069643D2273746172746576656E743122206E616D653D22E58F91E8B5B7E6B581E7A88B2220666C6F7761626C653A696E69746961746F723D226170706C795573657249642220666C6F7761626C653A666F726D4B65793D222F6F612F6C656176652F666F726D222F3E0A202020203C757365725461736B2069643D22646570744C6561646572417564697422206E616D653D22E983A8E997A8E9A286E5AFBCE5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D2264657074222F3E0A202020203C6578636C7573697665476174657761792069643D226578636C7573697665676174657761793522206E616D653D224578636C75736976652047617465776179222F3E0A202020203C757365725461736B2069643D226D6F646966794170706C7922206E616D653D22E8B083E695B4E794B3E8AFB72220666C6F7761626C653A61737369676E65653D22247B6170706C795573657249647D223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D22636F6D706C657465222064656C656761746545787072657373696F6E3D22247B6C656176654D6F6469667950726F636573736F727D222F3E0A20202020202020203C6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C65746520786D6C6E733A6D6F64656C65723D22687474703A2F2F666C6F7761626C652E6F72672F6D6F64656C6572223E3C215B43444154415B66616C73655D5D3E3C2F6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C6574653E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C757365725461736B2069643D226872417564697422206E616D653D22E4BABAE4BA8BE5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D226872222F3E0A202020203C6578636C7573697665476174657761792069643D226578636C7573697665676174657761793622206E616D653D224578636C75736976652047617465776179222F3E0A202020203C656E644576656E742069643D22656E646576656E743122206E616D653D22456E64222F3E0A202020203C6578636C7573697665476174657761792069643D226578636C7573697665676174657761793722206E616D653D224578636C75736976652047617465776179222F3E0A202020203C73657175656E6365466C6F772069643D22666C6F77362220736F757263655265663D226872417564697422207461726765745265663D226578636C75736976656761746577617936222F3E0A202020203C73657175656E6365466C6F772069643D22666C6F77332220736F757263655265663D22646570744C6561646572417564697422207461726765745265663D226578636C75736976656761746577617935222F3E0A202020203C73657175656E6365466C6F772069643D22666C6F77322220736F757263655265663D2273746172746576656E743122207461726765745265663D22646570744C65616465724175646974222F3E0A202020203C73657175656E6365466C6F772069643D22666C6F773422206E616D653D22E4B88DE5908CE6848F2220736F757263655265663D226578636C7573697665676174657761793522207461726765745265663D226D6F646966794170706C79223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B216175646974506173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F7731312220736F757263655265663D226D6F646966794170706C7922207461726765745265663D226578636C75736976656761746577617937222F3E0A202020203C73657175656E6365466C6F772069643D22666C6F77313222206E616D653D22E7BB93E69D9FE6B581E7A88B2220736F757263655265663D226578636C7573697665676174657761793722207461726765745265663D22656E646576656E7431223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B216175646974506173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F77313022206E616D653D22E9878DE696B0E794B3E8AFB72220736F757263655265663D226578636C7573697665676174657761793722207461726765745265663D22646570744C65616465724175646974223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6175646974506173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F773922206E616D653D22E4B88DE5908CE6848F2220736F757263655265663D226578636C7573697665676174657761793622207461726765745265663D226D6F646966794170706C79223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B216175646974506173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F773722206E616D653D22E5908CE6848F2220736F757263655265663D226578636C7573697665676174657761793622207461726765745265663D22656E646576656E7431223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6175646974506173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F773522206E616D653D22E5908CE6848F2220736F757263655265663D226578636C7573697665676174657761793522207461726765745265663D2268724175646974223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6175646974506173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F6C65617665223E0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D226C65617665222069643D2242504D4E506C616E655F6C65617665223E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2273746172746576656E7431222069643D2242504D4E53686170655F73746172746576656E7431223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D223137302E302220793D2239322E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22646570744C65616465724175646974222069643D2242504D4E53686170655F646570744C65616465724175646974223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235352E30222077696474683D223130352E302220783D223235312E313131313130373834303632332220793D2238302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226578636C75736976656761746577617935222069643D2242504D4E53686170655F6578636C75736976656761746577617935223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223431372E373737373736393630313535382220793D2238372E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226D6F646966794170706C79222069643D2242504D4E53686170655F6D6F646966794170706C79223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235352E30222077696474683D223130352E30303030303030303030303030362220783D223338352E323737373736393630313535382220793D223139302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2268724175646974222069643D2242504D4E53686170655F68724175646974223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235352E30222077696474683D223130352E302220783D223534372E343037343036323038323238342220793D2238302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226578636C75736976656761746577617936222069643D2242504D4E53686170655F6578636C75736976656761746577617936223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223731342E303734303732333834333231392220793D2238372E35222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E646576656E7431222069643D2242504D4E53686170655F656E646576656E7431223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223930302E3732323232303039363430352220793D223238332E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226578636C75736976656761746577617937222069643D2242504D4E53686170655F6578636C75736976656761746577617937223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223431372E373737373736393630313535382220793D223237372E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7732222069643D2242504D4E456467655F666C6F7732223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223139392E3934393834323830323234382220793D223130372E3036333032303534313539363032222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223235312E313131313130373834303632332220793D223130372E3237383638383532333937393934222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7733222069643D2242504D4E456467655F666C6F7733223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223335362E303631313130373834303536372220793D223130372E3330343334373832353337313535222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223431372E38353230333433383631363731332220793D223130372E3037343037313738323434383034222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7734222069643D2242504D4E456467655F666C6F7734223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223433372E373737373736393630313535382220793D223132362E39343039383130313236353832222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223433372E37373737373639363031353538352220793D223139302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7735222069643D2242504D4E456467655F666C6F7735223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435372E36363033343931363536353337372220793D223130372E3036313333353638363737353634222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223534372E3430373430363230383232352220793D223130372E3333383039323531383137393738222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7736222069643D2242504D4E456467655F666C6F7736223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223635322E333537343036323038323238332220793D223130372E35222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223731342E303734303732333834333231392220793D223130372E35222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F773130222069643D2242504D4E456467655F666C6F773130223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223431372E373737373736393630313535382220793D223239372E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223330332E302220793D223239372E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223330332E35323234323731363130343533362220793D223133342E3935222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7737222069643D2242504D4E456467655F666C6F7737223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223735332E383539313239303335383532392220793D223130372E3333343634333235393638303332222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223931342E302220793D223130362E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223931342E363638393136333439363730372220793D223238332E30303030303330333739303231222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F773131222069643D2242504D4E456467655F666C6F773131223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223433372E37373737373639363031353538352220793D223234342E3935303030303030303030303032222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223433372E373737373736393630313535382220793D223237372E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F773132222069643D2242504D4E456467655F666C6F773132223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435372E37323536383539363030313032352220793D223239372E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223930302E3732323232303039363430352220793D223239372E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7739222069643D2242504D4E456467655F666C6F7739223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223733342E303630353532333237343835342220793D223132372E3433363531333734333330353634222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223733342E302220793D223231372E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223439302E323237373736393630313439322220793D223231372E34313133383430393632363836222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E, 0);
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('f735ab85-ec6d-11e8-bf0c-c85b7643dd9e', 1, '请假流程.leave.png', 'f6fa5033-ec6d-11e8-bf0c-c85b7643dd9e', 0x89504E470D0A1A0A0000000D49484452000003AA000001470806000000A839B16B00002F814944415478DAEDDD0B985D757528F0B4B5D7EBF57A91166BA952A0B5485BAA96C2456A9114A104792A9CD9B3CF24218D34510A0808558B345444036AA962EBA388405322528A18539424901063B8BC0A91772A88101E8931628480A0FBAEFFE99CE93E27339999CCCC9933737EBFEF5BDF1ECE6326ACECACBDD6FCF7DE67CA14000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A0AD1545F192871E7AE8AA9B6FBEF967CB962D2B962C5922DA20962E5D5ADC74D34D3F88986E2F457D529FD42700A0A3A42670E5CA95C5FAF5EB8BE79F7F5EB4516CD8B0A158B162C5D3D1141E674F457D5213D42700A063A4950A4D605B3783CF2F59B2E43E7B2AEA93509F00808E914EA7D370B5774423F8823D15F549A84F0040C748D71B69B6DABE112CECA9A84F427D020034824DF1931F3D513C74EB978A7B967EB816E9EBF498464D2308EA93FA0400D0F24670F3A675C5DDDF3CBBB86BF1990D911E4BCF69D6348213C02BA5407D12EA931A050093A8117CF49EAF6DD504D6E3B17B1669D63482ED6E5A44D1BB457D12EA931A050093A111BCEFC6F3076C04D3739A358D601B3B386253C485BDDB23A4447D12EA931A050093A011BC7BC939033682E939CD9A46B0CD1BC07AE397562B366804D527A13EA95100A011141AC1766800077B1CF549A84F6A14004CA44630DD4573A046303DA759D308B6996983347AF5E75D0FA63E09F5498D02607C1445F13FD7AC5933F7B2CB2E5B317FFEFCA74F39E5941766CD9A5574777717D3A74FFFF97BDEF39EE7CF3AEBAC87CE3FFFFC0511AFD7086E1D6B577D66C046303DA759D308B6610338588367D5427D12EA931A05C0F80CA8575F7DF5E5E79E7BEE0BA79E7A6AF1F9CF7FBEB8F9E69B8B75EBD6155BB66C2992B45DBF7E7D71FBEDB71731C816EF7DEF7B7F7EDA69A77D6FCE9C39276804FF3B36AE5B53DC7DFDBCAD4FAB8BC7D2739A358D609B3878CAF0562186FB7AD427A13EA951006CBF1848677FE4231F79EECC33CFAC0DA12FBEF862315477DE7967F1810F7CE0C5B973E7DE57A9545EA711FCAF78F8B6CBB76A04D3631A358D609B3580476CC7FB366B04D527A13EA951008C9998335F72EDB5D7DEF0EE77BFBB58B468D1B006D466DFF8C6378AD9B3673F3BD9575787D4083EF75CB1F6DB9FDDFAB4BA782C3DA759D3084ED00670B4DE8FFAA43EA1460130F090BA7CF9F25B4E3EF9E4E2C1071F2C46C3F7BEF7BD2286DE674F38E184BFECD44670F3A675C583AB2E1AF01AB0F45C7A8D864D23384E06BB2949ABBF0FEA93FA841A05C07F4B2BA969484DD79C8EA6F4FDE6CC99B339CFF3E91DD5083EF75CF1C4DA1B8AEF7CE3AF076C02EB915E935E6BF54223384E0DE0689D1267D5427D12EA931A05C0E849D7A4A6D37D476B25B5BF95D59933676E8A6175CF4E6804075BA5B07AA1116C03CD3719F98588E37BB7C3D1FC3E372F519F84FAA446013072E9EEBE1FFEF0879F4FD7A48EA5C58B173FDBD3D3B3BA131AC1A1AC526C6BF542F3A6116C51037844A991FB622A07BDDBA1368203BD4F23A83E09F5498D026064AEB9E69A7F4977F7FDE94F7F5A8CB5134F3CF1C9C9760A707F8DE0F63681F5D0BC69045BD80026C7F73672C5301AC17203588F99A5E75D0FA63E09F5498D0260FBA4D5D4F439A9E923685AE1AEBBEE7A7EB2ADAA0EF5E31F8446B00D0CD498F5D7D06DAB11ECEFF517F7F37AD783A94F427D52A30018BE356BD6CC4D37501AC9C7D00CD7ECD9B39FECEEEEDEADDD7393E7F992883FD1086A0427EABE394003386D188D5D7F8DE0501BC0E646D02976EA9330A8AA51000CCD65975DB6E2E28B2F2E5AE9C20B2FBC3306D533DA3D37F1672C52A48630CBB2376B043582136DDFDC8E466CB04670B80D60F9E76F9862D5427D127E91A646013014F3E7CF7FFAE69B6F6EE9A0FAED6F7FFB7BD1602D9A288D6029AEEBEFE0AB11D408B6EBBED9D4000EB5011BA811FCC5ED6C00EB5C0FA63E09BF4853A300189A534E39E585279E78A2A583EA934F3EB93E0E628F4EC046B0EFE05B6E0835821AC176DD37A76CFFF557FD35820F8CA0011CE99F07F5497DF28B34350AA093CC9A35ABD8B2654B4B07D5F4F3E2C0B565A23682E5836FFA6DB1465023D88EFBE66EBBED76EA081BAEFE1AC1913480CD8DA0EBC1D427D1D9BF489B36016AD42F542A955F9A3367CE2FC7F67F44CFF43F63FBB2193366BCFCA8A38E7A454F4FCFFF89C75E59AD56779C3973E6AFC673AF8AE77E2DB6BF3E7DFAF49D63FB9AF87FDF25B6BF99EECD11DBDDE3DFE56FC7EB7F27B67BA4CF968FEDEFC6F6F7E37BFD416CDF10CFBD295EFB87B1FDA3786EDFD8FEDFF46F399EDBBFABABEB2DF1DC01B17D6B6CA7C6F64F63FBB678EE9078CD9FC5765A6C0F8BC70E8FAF8F8CED51B13D26B6EF88EDB1F15C25B65DB1ED8E6D1EDB9E786E466C67C676566CFF3CB6EF8AF88B883911EF8EC7DE13DBBF8C979F1CDB53627B6A6C4F8BEDFBE2B93363FB57B1FD406C3F18DBB3E2B9B363FB37B13D271EFBDBD89E1B715EC44723E6C773E7C7F6E3F1DC2763FB77B1FDFBD87E2AE2A278EE1F62FB8FB1FD5C6C3F1FDB7F8AED17E33597C4F6D2D85E16DB7F8EF897882B22BE1C7165C455115747FC5BC45723AE4D67EEC5FB17C7F6DF63FB8DD87E33ED83B15D16DB1B62BB3CB62B62BB326255C4B7236E8EF87F11B746DC1E714744BA5CEDAE88EFC4EBEF89EDBDB1BD3FB60F44AC8DF86EC44311E96CC147D2424CC4BA88C723D23D599E8AD810B131E287113F8A783A6273C43311CF463C17F17CC40B113F8BF879FA37E348876627FE218C8721345913263482ED1F93697F1B4ABCF39DEFAC356BAF7FFDEB477AA0FBC57E56291EE87D7C242E4CDFABD3FE5ED427E11769FFF54B9483436F3DB9B05D6B54EF9F350D0C2F46FCB47790D8D23B58FC2486951FA7812386A04DBD03C80F22D6F70E264FF40E2A8F457CBF778079B877A0F9CF88077B079DFBD2E01371777C9F3569208AED7FF40E48B745DCD23B38ADEE1DA4BE157153EF807563EFC0B534E2FA3488A5DCA6C12CE2EBF17DBE9606B6D85E9306B8D8FE6BBCFE2B69B08BEDC234E8C576416C2FEF1D00BFD43B105E1CF1853428467C360D8E119F89F77F3A0D94B14DB9F9BBD87E225E7F411A3C63FBB13488C6F623B1FD70EF803AAF7760FD50C45FA74136B6EF4F836DBA4F493C777A1A7863FBDE3400C7F6A478EEC43418C7766E1A94637B426C67A7013ABE3E3E0DD4E9230EE3B16A1AB4639BA5C13BB6C7C573EF4C03796C8F4E037A6C8F8821FFED69708FEDA169908FC1FEE078FD4169C08FED8169E04FBF3C89D7FF71FA45406CF74BBF1888ED3EF1FABDD32F0C62FBC6F40B84D8EE55A9547E2FFD6221B6AF4FBF6888EDEBE2F5BF957E0111DB5DD32F247A7A7A5E1BEFFB8DF48B8A78DFABD32F2E62BB533CF72BE9171AB1DD21FD8223B6FFFBC8238FFC5FE9171F871D76D84BD32F42A64E9DFA9273CE3927EDBBBF90F6BD11FCB2052687E38F3FFEE7AD5E517DF6D9679F9CE02BAAB7A602980A4A7ADD683782E9407BC1051734343151DC8A6BAFBDB678C52B5E51DC7DF7DD7DCF3DFEF8E3B5D7A7C7D6AE5D5B1C7EF8E1B548AFDD65975D8A2F7CE10B0DDFFBFEFBEFAFBD3EBD6FF5EAD54514E95ACC9C39B3F69EF45CF93DB7DC724BF18E77BCA3EF3503BD6EA0FF8F4F7CE21383BEE68C33CEA87D7DE59557D656DBEB8F2F58B0402338B27D73B03B688E64B562289F6168457512D6A791D4B554C786FAFA5467F6D8638F617DFF76A9377E9136B438F0C0030B350A06ACF13FEB1D5AA1739D7CF2C9CFB7FA1AD518921E98A0D7A836348075A3D508AE58B1A2D69C9D7BEEB9B5036D6AA4E267D5220D96CD0D551A3A6FBCF1C662BFFDF62B8E3DF6D8E299679EE96BBC52BCFCE52F2F0E3DF4D0869FF1CBBFFCCBC50E3BEC90AE13EE7BEDE2C58B6BDF37BDBFF9CFF4AA57BDAA38E8A083FA6DF89A1BBBFA9FBF3ECCEEBCF3CEC501071C50FB3AC5D5575F5DECBEFBEE5B7D9F74D7E9FAD7975F7E79DFD7E9FFDFA03AB27DB3B7E1DA3C656CAEFFDA9E46D0F55F13B43E8DC6A0DA5F2D49916A51AA6329CAF52345BD7E5C72C925B5EFF1D8638FB57DBD519F86F64B14350AB6F9EFE8857E8EE9D059CE3EFBECB5ADBEEBEF37BFF9CD7F9F6077FD5D9DAEF118A8608C5623B879F3E662D5AA557DFF7DDD75D7F5355169B5343D577FACBC9A7AFDF5D7F7FBFD9A07D5F4FDD3EBEFBDF7DEDA363572A9694B83EB89279ED8B7525A1E585323B7E38E3B16A79F7EFA562BAAE9FBD49BC6FE9ABDF4DF69E82E0FC91FFCE0076B5F3FFCF0C37DDFE7AD6F7D6BEDE7A4AFD3F05D7FEF9A356B6ADB4F7DEA531AC1EDDC379B1AAFA1AE0E0CF4F10EFDDD5173388DA03B6A4EE0FA341A836AFAC5D740CFA7BA93EA5CAA59CD83EA55575D55ECB9E79E5B7DBF76AD37EAD3907F91A646C1C0FF8E7E9AAE8D96093ADAC73FFEF18B5BFD39AAF3E6CD5B3C413E4775B083EBA83782E9C09A86C1D458A5AF1F79E491BE41356D1F7DF4D1BED7A655D1F4D8403FBF79504DAF3DE594536ADF2B7DDFB973E7D61E7BFAE9A76B4D5CFD35D75C734DDF7B76DD75D75A63D7FCBDD3D0BC69D3A686158E34082F5BB6AC6F45233D377BF6ECDAD7E9F4E1F4FFD5DFFF6F7985E3D5AF7E756DF04E5FA7D590B46AA211DCFE7DB39F4670B0066CB0CF201CEC330C07B2CF149F5138E1EBD3F6465A314DFBCA4B5FFAD26DBE2E0DA4E9F286E64175A79D76AAD590E65FECB56BBD519F86F58B34350AFAFF77F47CBA6E5526E8681FFAD0877EFBA4934EFAD98B2FBED8B29BFE56ABD57487B4DD264B0E47A3114CABA3A9C1DA6BAFBD8A8B2EBAA83664A615CF3428A69584F47C6ACAD280597FCFC68D1B87BCA29A560ED2F5A6F5062D9D46D7BC9270E79D776E35A8A69F991EDB7FFFFD8B430E39A4F8DCE73E57ECBDF7DEB5EDCB5EF6B2DAD7CD8D606A36EB5FD707E0B4129C566EFB6B1CD3207CDB6DB7D5BE4ED7CDD61F4F79D0088EAAC1560B066B00A76C6723583FB5EF187F0513B33E8D34D2BFEBB49FA4B333CA97273447BAAE3E45F3A0FA8637BC61AB41B59DEB8D4175D8BF4853A360EB7F475BD25DA665828E77FAE9A7FFE7EDB7DFDEAAD37ED31DE6566A04B78E3478A6A1B47EEA5B3A75ADF9F4DEF475FDF4DFE10CAA29D24A6AFABE6F7AD39B6A43677D30ADAFDAD607D634A8A6D3F0D2709AA2BE62513EED379D1E971ABB294DABBCE9BFDFF296B76CB5C2911ACEA38F3EBAEF75E967A59B9A4C29DD94A9B9E9748DEA981868D562A80DE0701BC1FACFD30076F0A03AA5F7FAD4744D7DFA7A5BA7FFD6BF4EC3698AFA8D95D2FB9A87DC76AD37EA931A05A330A83E9BEE082C1374BC77BDEB5D95F7BDEF7D2FB460557553B55ABD23DD5A5C23B875A453709B87D2FAF058BF7151F9EBE10EAAE59B2DA5F7D55715D21D83A7345DBB5A6E1ACB0D5DFDBF07BA8E6BA88D633A6DF9BBDFFD6EC32A4873E358FF7F2F5F07AB111C1569D5A2F914B7E3A70CFF3308FB6B046736FD1CD77B75F8A05A3FEDB77C16C7FCF9F31B5E932E7538ECB0C36AD1DFCD94CE3EFBECE2D4534FEDAB57ED5E6FD427350A466150FD49FABC5E99803077EEDC358B162D1AD329355D0F9B565327DB5DCC46F3664ACD8D57FD5AD53454BEFFFDEFEF1B28B76750DDB0614391FE8ED38A6CFABEF553EDD2AA45BD61EBEF7BD5575EEB377ADAD6A05ABED953B9294CA71ED7FFDCDBBA662C358BF5013AFD19D39F6B5BA70A6A0447D408966F5E526EE886D2004E19E47D3EDEC1A0DA70DD7D733DA9DF71B73ECCA6487720EF6F50EDEF1AD576AE37EA931A05A330A86E4E9FB52A13F05FFF20769B3D7BF6B30F3EF8E0980CA9D1105C9B3E003BCFF33D3582FD47FDE644E9BAD0F2DD7EA7F4AEA2A6C1B4F9BAD6F2EBEB914EE5ED6D7C6A77F32D3F97AE534D8F5F71C515B5FFAEAFA2A6D377D375A7F586ADF9CF96AE474DD773D56F3C525F751DAC41AD378EFD0DE5F5C1FCD24B2FED7BFD94DED3FBD276DEBC79B56DFDCE9D1AC151D77C8A5D6AE0664E19FEC73934BF6FA49FDFCA241954D3BFDFFE06CC54CFD273E9A3B7CAA7FBD607D6FAE79CD67F81965651FB1B3CDBB5DEA84F6A148C425FFE744F4FCFFF9109E8357DFAF49EB973E73EB37EFDFA511D521F7BECB16F55ABD54726DB29BFAD6A0453F394561A9A1F4FAB06E9B9744A5BF373F55582FAE976CD9FA59A565AD31D2E9B87DCB4E2BAEFBEFB0E780A5FBABE2B7DDF3BEEB86344836A8A34EC4E69BAA149FD6B8DE0B8358223D5DF297B74D8A09A7EF195EEA85BBE315B7FABA153FAB96B79BA04A2FEF131175C70C1B0EA64BBD41BF5498D825118547F54A95476900928E9E9E9993D67CE9CCDA3B5B29A5652D3909A65D9073482422338A91BC1D16E28519FD427D4283A7550FD61F4CF3BCA043489A1B27BFAF4E94F7FF5AB5FFDC9086EB0B4E9939FFCE497D2E9BE11B334824223D8D6467A2A9C53E9D427A13EA951307A83EAC64AA5F22B3201FDFF03D9AD5AAD2E9B3B77EE9377DC71C7B3C3F99CD4EBAFBF7E610CBAB7A61B274DC66B5235821AC149DE080E77B5C14D49D427A13EA95130BA7DF80F66CE9CF9AB3201DBFE87725C1A5867CD9AB57EFEFCF9F77CEB5BDF7A64DDBA754FA4EB1593679F7DF6C9C71F7FFC81A54B977EFD9C73CEB9AEA7A7E7A134A0A655D4C976775F8DA046B0030CF7D438A7D2A94F427D52A360F4FBEFF5954AE5553201431003E86BF33C3F35FEE15C15F170C49688A277FB68C4A28833D24AAC465068043BA211DC276273C43152A63E09F5498D82511D549F9A3163C6AFC904A011D408D2685A6F83376D1BCF6FD000AA4F427D52A3604C06D5272A95CAAFCB04A011D408B2B581562D9C4AA73E09F5498D82B11D541F9F3E7DFACE3201680435820CAD11D400AA4F427D52A360EC07D5C72A95CA6B6402D0086A0419BC11BC5003A83E09F5498D82960CAA8FA6FBC3C804A011D408B26DE97AAF74F33479549F84FAD49635AAB73EF9081A26CBA0FA48A552F94D990034821A4106F74A83AAFA24D4A7366EECE591C9B43F7FAF5AADEE2A13804650238846507D12EA93FA04EDB23F3F54A9547697094023A8114423A83E09F5497D8276D99FBF5BAD567F4B26008DA046108DA0FA24D427F509DA657FFECF2CCB7E5B26801159B66C9966ABBD634B34822FD8533582EA93509FD4279820FBF383D56AF577640218919B6EBAE989F5EBD76BB8DA34D6AD5BF7E56804EFB3A76A04D527A13EA94F3041F6E707B22CDB43268011B9E1861B8E5EBE7CF98F9E7AEAA967355EEDB552919AC0A54B973E12719C3D5523A83EA90BEA93FA0413647FBE2FCFF33D650218B168348E58B264C9ADE914AE74BDD1448E850B17D63E2F73A2FF7FF4FE5DDCA709D408AA4F93A73E4DA2509FD427D8D6FE7C6F9665BF2B13008DC571513AE04F9D3AF525B2814610509FA0E5FBF3DD799EFFBE4C00F4CAB2ECCD511C5F4807FC2890D364048D20A03E41CBF7E7EF444FB6974C00FCF7A07A4D3AD8F7C6AD32824610509FA0E5FBF35D799EBF412600FEAB28EE535F4DAD470CAE47C80C1A41407D8296EECF77460FF646990098F2DFD7A636C5ADAE55452308A84FD03A31A4FE47B55A7D934C000EF0FDACA6D623CFF36364088D20A03E41CBF6E7DB6358DD5B260005B1BBFBBAFE86D4DE582D43680401F5095AB63FDF56AD56FF4826804E2F8603AEA6BA56158D20A03E41CBF7E75BA2F7DA5726804E2F868BB635A4BA03301A41407D8296EECFFFAF5AADFE5F99002899356BD62BB32CDB2413680401F509C6657F5E9D3EDB5E26004AAAD5EA8E51207F2813680401F509C6657FFE769EE7FBCB0440C9CC99337F350AE40F64028D20A03EC1B8ECCFDFEAEAEA7A8B4C0094E479BE5314C80D32814610509F605CF6E795D18FFD894C0094CC9831E3D7A2403E2513680401F509C6657FBE29E200990028C9F3FCD5511C9F9409348280FA04E3B23F2F8F7EEC40990028993E7DFACE51201F9709348280FA04E3B23FDF18315526004A2A95CA6BA2383E2613680401F509C6657F5E96E7F941320150D2D3D3F3DA28908FCA041A41407D8271D99F9746BC4D26004A2A95CA6F46717C4426D00802EA138CCBFE7C7D9EE787C8044049B55ADD350AE4F764028D20A03EC1B8ECCFDFCCB2ECCF6402A0A452A9EC1E05F22199402308A84F302EFBF375799E4F930980922CCB7E3B0AE47FCA041A41407D8271D99FFF3DFAB1C36402A0A452A9BC2E0AE45A99402308A84FD07A31A42EAE56AB6F970980C6E2B8471CF01F9009348280FA04E3B23F2F8A7EEC08990028A9542AAFCFF3FC7E99402308A84FD07A31A47E2D7AB1236502A0B138FE6E1CF0EF9509348280FA04E3B23F7F35FAB1A36502A0A452A9FC5E9EE7F7C8041A41407D82D68B21F59AE8C58E910980C6E2B8571CF0BF2313680401F509C6657FBE3AFAB177CA0440499EE76F880279974CA01104D42768BD1852FF35FAB1636502A0B138BE310EF877CA041A41407D82D68B21F52BD18F556402A0F160FF871177C8041A41407D8271D99FAF8C61B54B26004AB22CDB3B0AE4ED32814610509F605CF6E72F47643201D0581CF789B85526D00802EA138CCBFE7C451E6402A024CBB27DA340DE2213680401F509C6657FFE9788AA4C003416C7FD226E9609348280FA04E3B23FFF739EE7D36502A0240AE3FE5120BF2D13680401F509C6657FBE3C62864C003416C73F8E582513680401F509C6657FBE34CFF3E36502A0240AE39F44815C2913680401F509C6657FFE52C42C9900682C8E0744DC2413680401F509C6657FFE62C46C990028C9F3FCC0288ECB65028D20A03EC1B8ECCF1747BC4B26004ABABABAFE3486D51B64028D20A03E41EB6559F64FD18B9D2013002551180F8A03FE3299402308A84F302EFBF3E723E6C80440495757D7C131AC2E9109348280FA04AD9765D9E7A2179B2B13002551180F8903FEF532814610509F605CF6E77F8C61F53D32015052AD560F8DE2F80D99E8F883E4A2D4F80D12B7CA14605085D1157DD83FE4797EA24C009444619C1607FCEB64A2E39BBE7D225ED8D6A01A07D223640A30A8C2A8EFCF17C531F624990028A956AB6F8FE2B8582648BFB0D8C6A0BA7AEAD4A92F9125C0A00AA32BFAB04FE7797EB24C003416C723D2699F3241EFAA6ABF836A1C408F9121C0A00AA32F8EB17F1FFDD87B6502A0B1381E19C5F16B32416FF3D7DFB5AAB75A4D050CAA3036A20FBB30FAB1536502A0B1381E1D07FCAFCA04BDCDDF56D7AABA361530A8C2D88921F59371AC3D5D26001A8BE331511CAF9109EAD2FE60351530A842CB8EBB9F887EEC7D3201D0581CDF1907FCAB6582D23EF1E6D2B5A9D3640430A8C298EECF1F8F384326001A8BE3711157C9044DFB45ED5A55ABA9804115C6569665E7E779FE573201D0581C2B511CBF2213343581FB680401832AB4647F9E1FF17E9900682C8E59C4976562648AA278C9430F3D74D5CD37DFFCB365CB96154B962C116D104B972E2D6EBAE9A61F444CB797824115DA747FFE689EE71F940980922CCBBAA3382E9489914943EACA952B8BF5EBD717CF3FFFBC68A3D8B06143B162C58AA763683DCE9E0A065568C3FDF9BC88BF960980C6E2588DF817991899B4926A486DEB61F5F9254B96DC674F05832AB4E1FE7C6EC4876402A024CBB29E3CCF17C8C4C8A4D37D0D84ED1D31A8BE604F05832AB4E1FEFCE188B36502A0B138CE88B85C2646265D0F69186CFB4155630B065568C7FDF99C887932015092E7F9F1511C2F9589D60CAA3FF9D113C543B77EA9B867E9876B91BE4E8F19240DAA8041958EDD9FE7A5615526001A8BE3AC882FC9C4D80FAA9B37AD2BEEFEE6D9C55D8BCF6C88F4587ACE306950050CAA749E2CCBFE26CFF3BF950980C683FDEC882FCAC4D80FAA8FDEF3B5AD86D47A3C76CF22C3A4411530A8D299FBF387D20D956402A0B138BE2BE2629918FB41F5BE1BCF1F70504DCF19260DAA804195CE9365D959799E7F4426001A0FF67F11F1059918FB41F5EE25E70C38A8A6E70C930655C0A04AE78921F583B14F7F5426001A0FF673223E2F130655832A605085D6CBB2EC0331AC7E4C26001A0FF6EF8EF8AC4C8CFDA09AEEF23BD0A09A9E334C1A5401832A9D2786D4BF8A61F57C9900682C8E274671FC079918FB4175EDAACF0C38A8A6E70C930655C0A04AE7893EECCCE8C72E900980C683FD5F467C4626C67E50DDB86E4D71F7F5F3B63EED371E4BCF19260DAA804195CE1343EAFB6258FD844C003416C793A3387E5A26C67E504DF1F06D976F35A8A6C70C920655C0A04A678A3EECF4E8C73E2913008D07FB53223E25132D18549F7BAE58FBEDCF6E7DDA6F3C969E334C1A5401832A1DB93F9F16F17732015092E7F9A959965D2813633BA86EDEB4AE7870D545035EA39A9E4BAF31501A5401832A9D25FAB0F7463FF6F73201D0581C9D6E329683EA73CF154FACBDA1F8CE37FE7AC021B51EE935E9B556570DAA8041958EDA9F9DDD06D0CC05FC6337A80EB68A6A75D5A00A185421FAB093629FBE4826001A8BA35BA28FD1A03A9455D46DADAE1A2E0DAA8041958ED89F7D020340331F323D7683EAF60EA9F5305C1A5401832A935FF461EF897DFA1F6502A0B1387E2086D58FC9C4E80FAAC2A00A18546108FBF3BB233E2B13002531A47E308AE34765C2A0DAE9836AFC3BD827CBB26BECCD60508516EFCF73223E2F130025D1989F15C3EA4764C2A0DAA9836A1A50231645BCA0F905832A8CC3FEFC17115F900980C6E27876C48765C2A0DA69836AF3805A0F7B331854A195F23C3F21CBB27F92098092288C7F1305F26F65C2A0DA29836AECF36F4EA7F8360FA8065530A8C238EDCFB323BE2813008DC5F19C88793261509DECB170E1C2A2BF1554832A1854613C6559F6E7799E5F22130025693535ADAACA844175B2C7B6865321C4C40B471E26512F767CECD397CA04404914C673233E2413137350DDB061436AD68AABAEBAAA78E699678A5D77DDB538E8A0838A993367D6E2DA6BAFAD3DDFFCBEF4D8FCF9F307FCEF81E29A6BAE2976D96597019FBFF7DE7B8BFBEFBFBFDF9F77E9A597B6C5A9BF5D5D5D07C73EBF5AF30B403BC8B26C660CAB97C90440E3A07A5EBAF3AF4C4CCC4135C52DB7DC52ECBCF3CEC5962D5B6A03611A16D3F6A28B2EEA1B12EBAFDD77DF7DFB86D74B2EB9A4D869A79D8ADB6EBBADF6DF871F7E78DF73E97BD4DFF3F297BFBC38F4D0436BCF9D7DF6D9C58E3BEE589C75D6597DAF5DBD7AF5564369FA332D5BB6ACA856AB0D3FEFEAABAFAE7DFDD8638F8DFBCD94A2299816FBFF4A832A00E3298E47D3E3F8F3CF3201D038A87E347D96AA4C4CDC41B57948BCFCF2CB6BDBA953A7162B57AE6C1854D7AE5D5B5B15AD0F8EFBEFBF7FB168D1A262C182057DEFBFF2CA2BB7FA9E575C7145EDEB3474A655DBF273CDAF5FB56A55DF6A6FFA339407D5B44D036C3B7D3C4DEF0AEB4A832A00E321CBB29EE8C516C80440E3A03A3FE2FD3231F106D5B42A9986C097BDEC65B581B43E387EEE739FEB1B0CD3AA6A7950ADAF8AD607DA5FFAA55F2ACE3DF7DCDA109706CCF4781A669B07D5BDF7DE7BC015D51B6FBCB1EFB4DFFA638F3EFA68EDEB638F3DB6EFB1F2D7F5F7B4C3A05AD7BBC2BADADE0C402BC5F1278FE3CF153201509265D9F9511FFF4A2626DEA09AA27EBA6F3AA5B63E54A615D3E641B3FEF5C30F3F5C5B3D4D8FEDB5D75EB5C1313DBE71E3C6DA635D5D5DFDAED2D6574DB7B5A29AAE91AD3FB666CD9ADA7FBFE635AF290E39E490DAFBEA43751A62DB69451500C6B917EB8E5E6CA14C00947477777F3CE20C999898836AF3703AA5F734DD3414A6EB569F7CF2C9864175BFFDF62B162F5EDC779DE81E7BEC513BF537DDE8A87E63A614E97DC31D54CB8FA59B3BD5BF4E3FB37C63A7FAEAAF4115006ABD5816F165990028C9B2EC13799EBF4F2626F6A07AF7DD77174F3FFD74DF69BFF515D2F4787D504D2B996995330D8CE95ACCB4DD7DF7DD8B134F3CB1F675FD4647CDD7904E19E2A9BFE5D7A715D5B47A9BBE5EB16245BF43AC4115006ABD58257AB1AFC80440490C2C7F17719A4C4CEC41350DA87BEEB967DFCD93D22A67DAD687C5E6D385D39D7AD3B63E6CA66DBA5EB57E53A5E6EF5F1F5E9B57542FBEF8E27E5FBFC30E3BF4ADE6A61B2A59510580017BB1E322AE920980923CCFFF3ECBB2F7CAC4C41E54D3A9BB699B564CD3F691471E29AEBFFEFAADAE512DBFE7CE3BEFDC6AF01C2C86F2FAF4BDD38A6DFDEBFAF5B3565401606BD187BD338E9B57CB04404914C64F459C2213137750DDBC797371FFFDF7D74EF32D3F5EFF7CD4F4D9A9FD7D8E6A1A6EE7CD9B57FB2CD5FAA9BCF581375DAFDADFCF4AA7001F70C001DBFCF394DF9BBE57FAB3A5EB61EB1F9B53BEFED5A00A805EACFB1D11FF2613008DC5F1A22CCB4E9289893BA80EF72EC113E1CF695005A053441F7674F4635F950980C641F533117F29139D31A8767218540168D35EECA8886B6502A0B138FE639665EF910983AA4115005A2FFAB023A21F5B2413008D83EA6723DE2D130655832A008C4B2F7678C4D76502A0B1387E3E628E4C18540DAA00D07AD56AF5ED59962D96098092288CFF94E7F90932615035A80240EB451F36ADBBBBFB3A99002889C27871C4BB64C2A06A500580D6AB56AB876659F60D990028C9F3FC92288E7F2E130655832A008C4B2F76487777F7F53201501285F14B11B364C2A06A500580D6EBEAEA3A3886D5253201501285F1B22CCB66CA8441D5A00A00E3D28B1DD4DDDDBD4C26004AA230FE7314C8E932615035A80240EB757575FD69F46237C804404914C6055996F5C88441D5A00A00E3D28B1DD8DDDDBD5C26004AA2305E110532970983AA4115005AAFABABEBADD18AAD90098092288C0BB32CEB960983AA4115005AAFBBBBFB8088953201D0581CAF8C61B54B264666D9B26586C1F68E2D31A8BE604F05A0DD747575BD25FAB16FC90440490CA95FC9B2AC22132373D34D373DB17EFD7A03619BC6BA75EBBE1C83EA7DF65400DA4D0CA97F1CB14A26004A6248FDD718568F958991B9E1861B8E5EBE7CF98F9E7AEAA9670D86EDB5929A86D4A54B973E12719C3D158036ECC5DE1C83EA6A99002889C2F86F11EF9089918B41E888254B96DC9A4E314DD7434EF488FDA29804FF1FE9EFE23E432A006DDC8BED1771B34C00946459764D9EE7C7C804FD1C38DD7C0800C6BE17DB378EB9B7C80440E330726DC4513281411500C6E578BB4FC4AD3201509265D9D7F23C3F522630A802C0B8F4627BC731F7769900681C46BE1E71B84C605005807139DEFE61C41D3201509265D9E26AB5FA7699C0A00A00E3D28BBD318EB977CA0440E330725D9EE7D36402832A00B45EF4616F8863EE5D3201D0388C7C33CBB23F93090CAA00D07A3D3D3D7F10BDD81A9900681C46AECFF3FC1099C0A00A00AD177DD8EFC731F76E9900681C469646BC4D2630A80240EB552A95DF8B61F51E9900681C469645713C482630A80240EB451FB6671C73EF930980C661E4C688A932814115005AAF52A9BC3E86D5FB6502A0240AE38AAEAEAEB7CA0406550068BD6AB5FA3B71CC7D5026001A87919B220E90090CAA00D07A954AE57571CC5D2B13008DC3C8B7BABABADE2213185401A0F5AAD5EA6FC531F7BB3201D0388CAC8AF86399C0A00A00AD57A954768F63EE433201D0388CACCEB2ECCD3281411500C6E578BB5BC4C33201D0581C6F8ED84F2630A80240EB552A95DF8C63EE233201D0388CDC9265D9BE3281411500C6E578BB4BC4F76502A0B138DE56AD56FF482630A80240EB552A95D7C431F7319900681C466ECFB26C6F99C0A00A00E372BCFD8D88753201501243EA7F54ABD537C90406550068BD4AA5F2EB71CC7D4226001A87913B63587DA34C74FC7EB0280DA683C4AD320500A32BCFF357C731F6499900288921754D4F4FCF1FC844C70FAAFB44BCB0AD4135F69523640A004657A55279551C67D7CB0440E38072779EE7BF2F13C4BE70DD3606D5D553A74E7D892C01C0E88A3E6CA738CE6E900980C6E2784FA552F93D99A07755B5DF4135F6936364080046DFCC99337F358EB53F900980C6E1E4BE1842F694097AF787FEAE55BDD56A2A008C8D6AB5BA631C6B7F2813002531A4DE5FA9545E2F13F40EAA5B5DABEADA5400183BB366CD7A651C6B37C90440E360F260B55AFD1D99A02E0E96D7584D058031EBBDDC691F6008C5726DA552799D4C501A54DF5CBA36759A8C00C0A8F65EEEB40F308462F9DD6AB5FA5B3241D37E51FB6DAFD554001893E3AC3BED030C52281F8ED84D26287BDBDBDEF6A7E9602913003026FD973BED030C5228BF57AD567795094AD2E9BEC581071E68500580B1EBC1DC691F601B45F2FB11BBC804BD0E8E48771EBCB077EB1A1900189B1ECC9DF601B651241FEDE9E979AD4C501A52EB07C9B4B2BAC1B00A0063C39DF601061E54D745FC864C1852A7F4BF823AD0E300C0C8075577DA071860507D7CFAF4E93BCB44479B36C8305A7FDE01140046BF17FB7AC4CFADA6023416C727F33C7FB54C74FC903AD8106A65150046285D6E9565D949D17F5D953ECB3E6273E9D4DF877B4F053EC365598041B5BB7B7DA55279954C74A483A70C6FA574B8AF070042FAC8998825D1776DD9C6E7A736C78DF19EE9B20774EAA0BA218AE04E32D1B143EA11DBF1BECD86550018529FB55BC475C3184EFB8B95954AE575B209745A01DD18C5EF5764C290DAC2F703C0A4976559775A10280F9D3D3D3DC5C73EF6B1E2861B6E28BEFFFDEF173FFEF18F8BE499679E29D6AD5B57AC5AB5AAB8F0C20B8B193366340CAB799EFFC4EA2AD06983EA0FABD5EA8E32D13106BB7152ABBF0F004CC621F588F267A4A60175C18205C5FAF5EB8BA1D8B46953EDF5E97D4D03EB09B20B74CAA0FAA34AA5B2834C74D4903A5AA7ED5A590580AD87D4EEF2907AFAE9A7D7564FB7477ADF99679ED93CAC5A590526BF28763F3EEAA8A35E2113935EF38D907E21E2F8DEED7034BFCF0D9600A057EF35A97DA7FBCE9B37AFEFF4DEED954E0B3EEFBCF39A4F03DE53B681C95E5037572A95FF2D131D31A41E511A36BF1851F46E873AAC0EF43EC32A004CA92D002C29AFA48E74482D0FAB4D2BAB2B651B98EC83EA33471E79E4FF92898E195293E37B87CD6218C36A7948ADC7CCD2F3AE5905A0D387D463CAD7A46EEFE9BEDB3A0DB87CCDAA538081C93EA83E5BA9545E261393D240C3637F43E7B686D5FE5E7F713FAF77CD2A009D3CA8F6ADA6A61B218D85850B175A55053A66507DEEB0C30E7BA94C4CDA2175DA3086CFFE86D5A10EA9CDC3AAD3800198544368C49F0CF47C4F4FCF6BEB37504AAB9E1B376E1C934135DD0DB8E9A36B76F3B7034CD641F5F94AA5F23F64625219EAB038D8B03ADC21B5FCF3374CB1B20AC0E4E997EAA7DB2EC9B2ECCDCDCFC76327D55F73C105171463297DCE6A69503DC3DF0E30590BEF0B53A74E7D894C4CBA2175A843E240C3EA2F6EE7905AE79A550026DDA05A8AEBCA2BACF1DF57D59F5BBE7CF9980EAAAB56AD2AFF3916F9DB01266BE1FDD939E79CF38B32D19143EAB686D5074630A48EF4CF0300ED3EA8F6ADB0A68135BE5E5B7F6CB46FA2D46CDDBA75E53FC3A3FE7680C95A787FBE1D0308ED67A42B98FD0DAB2319529B8755D7AC0230E906D552BC58FF7AB43E92665B1F5553FAB95BFCED009D5A78C5048A11EE0E6965BD7925F581DEC747E2C2F4BDFCFD082184E8846885513CF603C0981AEC2EBF83D9D68AEA503E67752056540198CCBFD8BF35CBB22322365B5105808187C2CD53C6E61AD5ED19565DA30AC0641D546B036AFD8694AE510580A10D87435DC11CE82368FABBEBEF70865577FD0560320EAAABF33C3FA6F91313DCF51700863EAC0E36240EF639A9837DCEEA40F699E2735401985C836AC30A6A339FA30A004333D88AE66043EA94ED1C56EBA71F1FE3AF00804ED1D3D3F3DAF4D9F469788CAF8B8D1B378EC990BA69D3A662C68C19E5417537D90760A219686575A843EA7087D5FACF33A402D071D267AAD607C8050B168CC9A0BA70E1C2F290BA52D60198A8D2CA6AF369B8C74F19FEE7A4F637ACCE6CFA39AE4905A09307D563EA43645A551DED9B2AA5EF97BE6FFD67C4CF9B2EEB004CF461B57C83A5F2D039942175CA20EFF311340030A5762DEB8DF541F2B4D34EFBF9687D544DFA489A33CF3CB3613575A0EB65016022693E0D380D9933A70CFF23679ADF37D2CF6F0580C934A8EE16B1A13E50CE9B376FC49FAB9A86D4F3CE3BAF3CA46ECEF37C4FD90660B20EAB23D5DF69C500D0D1B22CEBAEDF58A9BEB2BABDA701A7F735ADA43AE51700C36A0B875E00983462A09C551E56D3B5A5E9064BE9AEBD43BDBB6FBA7152F99AD41431047F40760198AC467ABAAED37D016010696535625379D04C8367FA9CD5E5CB97D7564BEBA705A7D37BD7AD5B57AC5AB5AAF8F4A73F5DCC9A35AB61404DA7FBA6E1575601E8946175B82BA26E9C04004394AE592D7F6CCD76C64AD7A402D049867BFAAED37D0160FB06D6E37A07D6178633A0A6555477F705C0B03AB07D2236471C236500B07D7A7A7A5E1B03EBA931805E15F170C496DEA1346D1F8D581471465A89952D003ADDB4DE2174DA369EDF6048050000A095065A5975BA2F0000006D33AC1A52010000689B61F542432A000000ED225D935A4CF11134000000B491574A010000000000000000000000000000000000000000000000000000000000003098FF0FCB550BC848183BDA0000000049454E44AE426082, 1);

-- ----------------------------
-- Table structure for ACT_GE_PROPERTY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
CREATE TABLE `ACT_GE_PROPERTY`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ACT_GE_PROPERTY
-- ----------------------------
INSERT INTO `ACT_GE_PROPERTY` VALUES ('cfg.execution-related-entities-count', 'true', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('cfg.task-related-entities-count', 'true', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('common.schema.version', '6.4.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('identitylink.schema.version', '6.4.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('job.schema.version', '6.4.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('next.dbid', '1', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('schema.history', 'create(6.3.2.0)', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('schema.version', '6.4.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('task.schema.version', '6.4.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('variable.schema.version', '6.4.0.0', 1);

-- ----------------------------
-- Table structure for ACT_HI_ACTINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_ACTINST`;
CREATE TABLE `ACT_HI_ACTINST`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_PROCINST`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_EXEC`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_ATTACHMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;
CREATE TABLE `ACT_HI_ATTACHMENT`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_COMMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_COMMENT`;
CREATE TABLE `ACT_HI_COMMENT`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `FULL_MSG_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_DETAIL
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
CREATE TABLE `ACT_HI_DETAIL`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_ACT_INST`(`ACT_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TIME`(`TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_NAME`(`NAME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TASK_ID`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_IDENTITYLINK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;
CREATE TABLE `ACT_HI_IDENTITYLINK`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_PROCINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_PROCINST`;
CREATE TABLE `ACT_HI_PROCINST`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `PROC_INST_ID_`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_I_BUSKEY`(`BUSINESS_KEY_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_TASKINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_TASKINST`;
CREATE TABLE `ACT_HI_TASKINST`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_INST_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_HI_VARINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_VARINST`;
CREATE TABLE `ACT_HI_VARINST`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE`(`NAME_`, `VAR_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_EXE`(`EXECUTION_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_ID_BYTEARRAY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_BYTEARRAY`;
CREATE TABLE `ACT_ID_BYTEARRAY`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_ID_GROUP
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_GROUP`;
CREATE TABLE `ACT_ID_GROUP`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_ID_INFO
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_INFO`;
CREATE TABLE `ACT_ID_INFO`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PASSWORD_` longblob NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_ID_MEMBERSHIP
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_MEMBERSHIP`;
CREATE TABLE `ACT_ID_MEMBERSHIP`  (
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
  INDEX `ACT_FK_MEMB_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_ID_PRIV
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_PRIV`;
CREATE TABLE `ACT_ID_PRIV`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PRIV_NAME`(`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_ID_PRIV_MAPPING
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_PRIV_MAPPING`;
CREATE TABLE `ACT_ID_PRIV_MAPPING`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_PRIV_MAPPING`(`PRIV_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `ACT_ID_PRIV` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_ID_PROPERTY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_PROPERTY`;
CREATE TABLE `ACT_ID_PROPERTY`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ACT_ID_PROPERTY
-- ----------------------------
INSERT INTO `ACT_ID_PROPERTY` VALUES ('schema.version', '6.4.0.0', 1);

-- ----------------------------
-- Table structure for ACT_ID_TOKEN
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_TOKEN`;
CREATE TABLE `ACT_ID_TOKEN`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NULL DEFAULT NULL,
  `IP_ADDRESS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_AGENT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_ID_USER
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_USER`;
CREATE TABLE `ACT_ID_USER`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_PROCDEF_INFO
-- ----------------------------
DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;
CREATE TABLE `ACT_PROCDEF_INFO`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_INFO_JSON_BA`(`INFO_JSON_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RE_DEPLOYMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;
CREATE TABLE `ACT_RE_DEPLOYMENT`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ACT_RE_DEPLOYMENT
-- ----------------------------
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('f6fa5033-ec6d-11e8-bf0c-c85b7643dd9e', '请假流程', NULL, 'leave', '', '2018-11-20 10:42:47.399', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ACT_RE_MODEL
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_MODEL`;
CREATE TABLE `ACT_RE_MODEL`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE`(`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE_EXTRA`(`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_DEPLOYMENT`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RE_PROCDEF
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
CREATE TABLE `ACT_RE_PROCDEF`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PROCDEF`(`KEY_`, `VERSION_`, `DERIVED_VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ACT_RE_PROCDEF
-- ----------------------------
INSERT INTO `ACT_RE_PROCDEF` VALUES ('leave:1:f73bc606-ec6d-11e8-bf0c-c85b7643dd9e', 2, 'leave', '请假流程', 'leave', 1, 'f6fa5033-ec6d-11e8-bf0c-c85b7643dd9e', '请假流程.bpmn20.xml', '请假流程.leave.png', '请假流程演示', 1, 1, 1, '', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for ACT_RU_DEADLETTER_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_DEADLETTER_JOB`;
CREATE TABLE `ACT_RU_DEADLETTER_JOB`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_EVENT_SUBSCR
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;
CREATE TABLE `ACT_RU_EVENT_SUBSCR`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_`(`CONFIGURATION_`) USING BTREE,
  INDEX `ACT_FK_EVENT_EXEC`(`EXECUTION_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_EXECUTION
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;
CREATE TABLE `ACT_RU_EXECUTION`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) NULL DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) NULL DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) NULL DEFAULT NULL,
  `TASK_COUNT_` int(11) NULL DEFAULT NULL,
  `JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_BUSKEY`(`BUSINESS_KEY_`) USING BTREE,
  INDEX `ACT_IDC_EXEC_ROOT`(`ROOT_PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PARENT`(`PARENT_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_SUPER`(`SUPER_EXEC_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_HISTORY_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_HISTORY_JOB`;
CREATE TABLE `ACT_RU_HISTORY_JOB`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_IDENTITYLINK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
CREATE TABLE `ACT_RU_IDENTITYLINK`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_GROUP`(`GROUP_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ATHRZ_PROCEDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_TSKASS_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_IDL_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_JOB`;
CREATE TABLE `ACT_RU_JOB`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_SUSPENDED_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_SUSPENDED_JOB`;
CREATE TABLE `ACT_RU_SUSPENDED_JOB`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_TASK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_TASK`;
CREATE TABLE `ACT_RU_TASK`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TASK_CREATE`(`CREATE_TIME_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TASK_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_TIMER_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_TIMER_JOB`;
CREATE TABLE `ACT_RU_TIMER_JOB`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ACT_RU_VARIABLE
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;
CREATE TABLE `ACT_RU_VARIABLE`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_VAR_BYTEARRAY`(`BYTEARRAY_ID_`) USING BTREE,
  INDEX `ACT_IDX_VARIABLE_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标题',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) NULL DEFAULT 0 COMMENT '权重，越大越靠前',
  `weight_date` datetime(0) NULL DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) NULL DEFAULT 0 COMMENT '点击数',
  `posid` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '视图配置',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_article_create_by`(`create_by`) USING BTREE,
  INDEX `cms_article_title`(`title`) USING BTREE,
  INDEX `cms_article_keywords`(`keywords`) USING BTREE,
  INDEX `cms_article_del_flag`(`del_flag`) USING BTREE,
  INDEX `cms_article_weight`(`weight`) USING BTREE,
  INDEX `cms_article_update_date`(`update_date`) USING BTREE,
  INDEX `cms_article_category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('1', '3', '文章标题标题标题标题', NULL, 'green', NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('10', '4', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('11', '5', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('12', '5', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('13', '5', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('14', '7', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('15', '7', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('16', '7', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('17', '7', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('18', '8', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('19', '8', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('2', '3', '文章标题标题标题标题', NULL, 'red', NULL, '关键字1,关键字2', NULL, 0, NULL, 2, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('20', '8', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('21', '8', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('22', '9', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('23', '9', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('24', '9', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('25', '9', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('26', '9', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('27', '11', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('28', '11', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('29', '11', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('3', '3', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('30', '11', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('31', '11', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('32', '12', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('33', '12', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('34', '12', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('35', '12', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('36', '12', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('37', '13', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('38', '13', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('39', '13', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('4', '3', '文章标题标题标题标题', NULL, 'green', NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('40', '13', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('41', '14', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('42', '14', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('43', '14', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('44', '14', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('45', '14', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('46', '15', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('47', '15', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('48', '15', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('49', '16', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('5', '3', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('50', '17', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('51', '17', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('52', '26', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('53', '26', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('6', '3', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('7', '4', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('8', '4', '文章标题标题标题标题', NULL, 'blue', NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_article` VALUES ('9', '4', '文章标题标题标题标题', NULL, NULL, NULL, '关键字1,关键字2', NULL, 0, NULL, 0, NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');

-- ----------------------------
-- Table structure for cms_article_data
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_data`;
CREATE TABLE `cms_article_data`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '文章内容',
  `copyfrom` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '文章详表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cms_article_data
-- ----------------------------
INSERT INTO `cms_article_data` VALUES ('1', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('10', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('11', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('12', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('13', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('14', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('15', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('16', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('17', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('18', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('19', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('2', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('20', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('21', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('22', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('23', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('24', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('25', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('26', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('27', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('28', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('29', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('3', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('30', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('31', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('32', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('33', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('34', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('35', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('36', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('37', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('38', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('39', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('4', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('40', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('41', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('42', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('43', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('44', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('45', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('46', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('47', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('48', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('49', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('5', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('50', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('51', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('52', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('53', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('6', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('7', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('8', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('9', '文章内容内容内容内容', '来源', '1,2,3', '1');

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '站点编号',
  `office_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属机构',
  `module` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '栏目模块',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '栏目名称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '栏目图片',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '链接',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '目标',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关键字',
  `sort` int(11) NULL DEFAULT 30 COMMENT '排序（升序）',
  `in_menu` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '是否在导航中显示',
  `in_list` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '展现方式',
  `allow_comment` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '视图配置',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_category_parent_id`(`parent_id`) USING BTREE,
  INDEX `cms_category_module`(`module`) USING BTREE,
  INDEX `cms_category_name`(`name`) USING BTREE,
  INDEX `cms_category_sort`(`sort`) USING BTREE,
  INDEX `cms_category_del_flag`(`del_flag`) USING BTREE,
  INDEX `cms_category_office_id`(`office_id`) USING BTREE,
  INDEX `cms_category_site_id`(`site_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '栏目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('1', '0', '0,', '0', '1', NULL, '顶级栏目', NULL, NULL, NULL, NULL, NULL, 0, '1', '1', '0', '0', '1', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('10', '1', '0,1,', '1', '4', 'article', '软件介绍', NULL, NULL, NULL, NULL, NULL, 20, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('11', '10', '0,1,10,', '1', '4', 'article', '网络工具', NULL, NULL, NULL, NULL, NULL, 30, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('12', '10', '0,1,10,', '1', '4', 'article', '浏览工具', NULL, NULL, NULL, NULL, NULL, 40, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('13', '10', '0,1,10,', '1', '4', 'article', '浏览辅助', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('14', '10', '0,1,10,', '1', '4', 'article', '网络优化', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('15', '10', '0,1,10,', '1', '4', 'article', '邮件处理', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('16', '10', '0,1,10,', '1', '4', 'article', '下载工具', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('17', '10', '0,1,10,', '1', '4', 'article', '搜索工具', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '2', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('18', '1', '0,1,', '1', '5', 'link', '友情链接', NULL, NULL, NULL, NULL, NULL, 90, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('19', '18', '0,1,18,', '1', '5', 'link', '常用网站', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('2', '1', '0,1,', '1', '3', 'article', '组织机构', NULL, NULL, NULL, NULL, NULL, 10, '1', '1', '0', '0', '1', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('20', '18', '0,1,18,', '1', '5', 'link', '门户网站', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('21', '18', '0,1,18,', '1', '5', 'link', '购物网站', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('22', '18', '0,1,18,', '1', '5', 'link', '交友社区', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('23', '18', '0,1,18,', '1', '5', 'link', '音乐视频', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('24', '1', '0,1,', '1', '6', NULL, '百度一下', NULL, 'http://www.baidu.com', '_blank', NULL, NULL, 90, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('25', '1', '0,1,', '1', '6', NULL, '全文检索', NULL, '/search', NULL, NULL, NULL, 90, '0', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('26', '1', '0,1,', '2', '6', 'article', '测试栏目', NULL, NULL, NULL, NULL, NULL, 90, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('27', '1', '0,1,', '1', '6', NULL, '公共留言', NULL, '/guestbook', NULL, NULL, NULL, 90, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('3', '2', '0,1,2,', '1', '3', 'article', '网站简介', NULL, NULL, NULL, NULL, NULL, 30, '1', '1', '0', '0', '1', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('4', '2', '0,1,2,', '1', '3', 'article', '内部机构', NULL, NULL, NULL, NULL, NULL, 40, '1', '1', '0', '0', '1', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('5', '2', '0,1,2,', '1', '3', 'article', '地方机构', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '0', '1', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('6', '1', '0,1,', '1', '3', 'article', '质量检验', NULL, NULL, NULL, NULL, NULL, 20, '1', '1', '1', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('7', '6', '0,1,6,', '1', '3', 'article', '产品质量', NULL, NULL, NULL, NULL, NULL, 30, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('8', '6', '0,1,6,', '1', '3', 'article', '技术质量', NULL, NULL, NULL, NULL, NULL, 40, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_category` VALUES ('9', '6', '0,1,6,', '1', '3', 'article', '工程质量', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '栏目内容的标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '评论内容',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '评论姓名',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '评论IP',
  `create_date` datetime(0) NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_comment_category_id`(`category_id`) USING BTREE,
  INDEX `cms_comment_content_id`(`content_id`) USING BTREE,
  INDEX `cms_comment_status`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `cms_guestbook`;
CREATE TABLE `cms_guestbook`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '留言分类',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '留言内容',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '邮箱',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '电话',
  `workunit` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '单位',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'IP',
  `create_date` datetime(0) NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '回复人',
  `re_date` datetime(0) NULL DEFAULT NULL COMMENT '回复时间',
  `re_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '回复内容',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_guestbook_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '留言板' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
DROP TABLE IF EXISTS `cms_link`;
CREATE TABLE `cms_link`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '链接名称',
  `color` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '链接图片',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) NULL DEFAULT 0 COMMENT '权重，越大越靠前',
  `weight_date` datetime(0) NULL DEFAULT NULL COMMENT '权重期限',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_link_category_id`(`category_id`) USING BTREE,
  INDEX `cms_link_title`(`title`) USING BTREE,
  INDEX `cms_link_del_flag`(`del_flag`) USING BTREE,
  INDEX `cms_link_weight`(`weight`) USING BTREE,
  INDEX `cms_link_create_by`(`create_by`) USING BTREE,
  INDEX `cms_link_update_date`(`update_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '友情链接' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cms_link
-- ----------------------------
INSERT INTO `cms_link` VALUES ('1', '19', 'JeeSite', NULL, NULL, 'http://thinkgem.github.com/jeesite', 0, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_link` VALUES ('10', '22', '58同城', NULL, NULL, 'http://www.58.com/', 0, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_link` VALUES ('11', '23', '视频大全', NULL, NULL, 'http://v.360.cn/', 0, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_link` VALUES ('12', '23', '凤凰网', NULL, NULL, 'http://www.ifeng.com/', 0, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_link` VALUES ('2', '19', 'ThinkGem', NULL, NULL, 'http://thinkgem.iteye.com/', 0, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_link` VALUES ('3', '19', '百度一下', NULL, NULL, 'http://www.baidu.com', 0, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_link` VALUES ('4', '19', '谷歌搜索', NULL, NULL, 'http://www.google.com', 0, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_link` VALUES ('5', '20', '新浪网', NULL, NULL, 'http://www.sina.com.cn', 0, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_link` VALUES ('6', '20', '腾讯网', NULL, NULL, 'http://www.qq.com/', 0, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_link` VALUES ('7', '21', '淘宝网', NULL, NULL, 'http://www.taobao.com/', 0, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_link` VALUES ('8', '21', '新华网', NULL, NULL, 'http://www.xinhuanet.com/', 0, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_link` VALUES ('9', '22', '赶集网', NULL, NULL, 'http://www.ganji.com/', 0, NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
DROP TABLE IF EXISTS `cms_site`;
CREATE TABLE `cms_site`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '站点标题',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '站点Logo',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '站点域名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关键字',
  `theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'default' COMMENT '主题',
  `copyright` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '版权信息',
  `custom_index_view` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_site_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '站点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cms_site
-- ----------------------------
INSERT INTO `cms_site` VALUES ('1', '默认站点', 'JeeSite Web', NULL, NULL, 'JeeSite', 'JeeSite', 'basic', 'Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `cms_site` VALUES ('2', '子站点测试', 'JeeSite Subsite', NULL, NULL, 'JeeSite subsite', 'JeeSite subsite', 'basic', 'Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');

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
INSERT INTO `gen_scheme` VALUES ('35a13dc260284a728a270db3f382664b', '树结构', 'treeTable', 'com.thinkgem.jeesite.modules', 'test', '', '树结构生成', '树结构', 'liuruijun', 'f6e4dafaa72f4c509636484715f33a96', '1', '2013-08-12 13:10:05', '1', '2018-11-20 11:18:53', '', '0');
INSERT INTO `gen_scheme` VALUES ('9c9c0fa251e2465bac25aaa659119b16', '请假流程', 'flow', 'com.thinkgem.jeesite.modules', 'aa', '', '请假流程', '请假流程', 'liuruijun', '67aa839ada674dbe96bc74b317f10f75', '1', '2018-08-29 12:48:36', '1', '2018-08-30 16:43:55', '', '0');
INSERT INTO `gen_scheme` VALUES ('9c9de9db6da743bb899036c6546061ac', '单表', 'curd', 'com.thinkgem.jeesite.modules', 'test', '', '单表生成', '单表', 'liuruijun', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', '2013-08-12 13:10:05', '1', '2018-11-20 11:18:47', '', '0');
INSERT INTO `gen_scheme` VALUES ('e6d905fd236b46d1af581dd32bdfb3b0', '主子表', 'curd_many', 'com.thinkgem.jeesite.modules', 'test', '', '主子表生成', '主子表', 'liuruijun', '43d6d5acffa14c258340ce6765e46c6f', '1', '2013-08-12 13:10:05', '1', '2018-11-20 11:18:35', '', '0');

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
INSERT INTO `gen_table` VALUES ('67aa839ada674dbe96bc74b317f10f75', 'oa_leave', '请假流程表', 'OaLeave', '', '', '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', '', '0');
INSERT INTO `gen_table` VALUES ('6e05c389f3c6415ea34e55e9dfb28934', 'test_data_child', '业务数据子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', NULL, '0');
INSERT INTO `gen_table` VALUES ('aef6f1fc948f4c9ab1c1b780bc471cc2', 'test_data', '业务数据表', 'TestData', '', '', '1', '2013-08-12 13:10:05', '1', '2018-08-29 10:42:40', '', '0');
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
INSERT INTO `gen_table_column` VALUES ('137318031851419492867f49cc50d754', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_by', '更新者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'updateBy.id', '0', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 100, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('13fc1a1671af468684dc325443e01442', '67aa839ada674dbe96bc74b317f10f75', 'reason', '请假理由', 'varchar(255)', 'String', 'reason', '1', '0', '1', '1', '1', '0', '0', '=', 'textarea', '', NULL, 60, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('185fe2c1ce3e4ca3b2c5278ad4180876', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '0', '1', '1', '1', '0', '0', '=', 'input', '', NULL, 60, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('1aebdd243c1f4a4faba4e1b0fe927332', '67aa839ada674dbe96bc74b317f10f75', 'apply_time', '申请时间', 'datetime', 'java.util.Date', 'applyTime', '0', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 90, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('1fd4616c314240f490570cf8846b1df2', '67aa839ada674dbe96bc74b317f10f75', 'id', '编号', 'varchar(64)', 'String', 'id', '0', '1', '0', '1', '0', '0', '0', '=', 'input', '', NULL, 10, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('216f7b2d0fbb4fd09b81605bde8012e0', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_by', '创建者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'createBy.id', '0', '0', '0', '1', '0', '0', '0', '=', 'input', '', NULL, 80, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('2658b3918d6d468f9ad7abb650b90c4c', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', NULL, 130, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('36de759b257248429a07556074263a0e', '67aa839ada674dbe96bc74b317f10f75', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', '1', '1', '0', '0', '0', '=', 'textarea', '', NULL, 140, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('40175428396a42f989015e99b3d7db65', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'area_id', '归属区域', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'area.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'areaselect', '', NULL, 40, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('55771d60b73148018612ed169c4ff85d', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'like', 'input', '', NULL, 50, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('5d28f1ad944541d2b0507e0ef5090dcb', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', NULL, 90, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('682fb7315b3e43dea8ec4a3419924357', '67aa839ada674dbe96bc74b317f10f75', 'proc_ins_id', '流程实例编号', 'varchar(64)', 'String', 'procInsId', '0', '0', '1', '1', '0', '0', '0', '=', 'input', '', NULL, 20, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('695b6a1e4ccf41d89c7eab239a8eb4c0', '67aa839ada674dbe96bc74b317f10f75', 'leave_type', '请假类型', 'varchar(20)', 'String', 'leaveType', '0', '0', '1', '1', '1', '0', '0', '=', 'select', 'oa_leave_type', NULL, 50, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('8156527a6d334d99b281e4fa3593b4ff', '67aa839ada674dbe96bc74b317f10f75', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', NULL, 130, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('91cc056f39a1439eb1cf8244239cbab5', '67aa839ada674dbe96bc74b317f10f75', 'dept_lead_text', '部门经理意见', 'varchar(255)', 'String', 'deptLeadText', '1', '0', '1', '1', '0', '0', '0', '=', 'input', '', NULL, 70, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('a139ab434e664fcc82cccdb5db1bf5d4', '67aa839ada674dbe96bc74b317f10f75', 'start_time', '开始时间', 'datetime', 'java.util.Date', 'startTime', '0', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 30, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('ac36e2526e01408396cc0fa11827f568', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'office_id', '归属部门', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'office.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'officeselect', '', NULL, 30, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('aff5abcf7b4d456585bca410729f46aa', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'user_id', '归属用户', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'user.id|name', '0', '0', '1', '1', '1', '0', '0', '=', 'userselect', '', NULL, 20, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('c09c6661bb414c709175f699bf151bdb', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'in_date', '加入日期', 'date', 'java.util.Date', 'inDate', '0', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 70, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('c30f6f46c5af4bd5887758a7bb3bd4cb', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'id', '编号', 'varchar(64)', 'String', 'id', '0', '1', '0', '1', '0', '0', '0', '=', 'input', '', NULL, 10, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('c92aa0e5b2ad40d79c186712cd2a6219', '67aa839ada674dbe96bc74b317f10f75', 'hr_text', '人资意见', 'varchar(255)', 'String', 'hrText', '1', '0', '1', '1', '0', '0', '0', '=', 'input', '', NULL, 80, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('d1389a04cf3949e58bb3adae9b144f32', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', NULL, 120, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('d37615fd13db472daa75df6e6bd89b81', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', NULL, 110, '1', '2018-08-29 10:42:40', '1', '2018-08-29 10:42:40', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('da139d71edc14dfa82f1dbd9ea0fe48a', '67aa839ada674dbe96bc74b317f10f75', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', NULL, 150, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('e53223608a7641fb845504d74a225eaa', '67aa839ada674dbe96bc74b317f10f75', 'update_by', '更新者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'updateBy.id', '0', '0', '0', '1', '0', '0', '0', '=', 'input', '', NULL, 120, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('e893aae5259e4980be325330d1b68ed4', '67aa839ada674dbe96bc74b317f10f75', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', NULL, 110, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('f8b9fe2ab4d44cdbb72b4f5c8ef8da93', '67aa839ada674dbe96bc74b317f10f75', 'create_by', '创建者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'createBy.id', '0', '0', '0', '1', '0', '0', '0', '=', 'input', '', NULL, 100, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');
INSERT INTO `gen_table_column` VALUES ('faf0bc828b8441be963ea3d25d2f01fd', '67aa839ada674dbe96bc74b317f10f75', 'end_time', '结束时间', 'datetime', 'java.util.Date', 'endTime', '0', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 40, '1', '2018-08-29 12:45:46', '1', '2018-08-29 14:18:57', NULL, '0');

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
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', 10, '1', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0', '0', 0);
INSERT INTO `sys_area` VALUES ('3fbaf3a3f58a47118f13976cb2e2544d', 'd36735ce07044a49ad205854fb2ca078', '0,d36735ce07044a49ad205854fb2ca078,', '佛罗里达州', 20, '02', '2', '1', '2018-06-20 17:38:08', '1', '2018-06-20 17:38:08', '', '0', '1', 1);
INSERT INTO `sys_area` VALUES ('d36735ce07044a49ad205854fb2ca078', '0', '0,', '美国', 30, '2', '1', '1', '2018-06-20 15:36:19', '1', '2018-06-20 15:36:19', '', '0', '0', 0);
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
INSERT INTO `sys_dict` VALUES ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型', 60, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型', 70, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型', 80, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '1');
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
INSERT INTO `sys_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('44', 'red', '红色主题', 'cms_theme', '站点主题', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('45', 'article', '文章模型', 'cms_module', '栏目模型', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('46', 'picture', '图片模型', 'cms_module', '栏目模型', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('47', 'download', '下载模型', 'cms_module', '栏目模型', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('48', 'link', '链接模型', 'cms_module', '栏目模型', 40, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('49', 'special', '专题模型', 'cms_module', '栏目模型', 50, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '1');
INSERT INTO `sys_dict` VALUES ('49fefff665614e80b8c0e91902f2c817', 'images/userinfobig.jpg', '默认头像', 'default_headphoto_big', '默认头像(大图)', 10, '0', '1', '2018-07-30 11:58:29', '1', '2018-07-30 13:41:11', '默认头像(原图)', '0');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('53', '0', '发布', 'cms_del_flag', '内容状态', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('54', '1', '删除', 'cms_del_flag', '内容状态', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('55', '2', '审核', 'cms_del_flag', '内容状态', 15, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('56', '1', '首页焦点图', 'cms_posid', '推荐位', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('58', '1', '咨询', 'cms_guestbook', '留言板分类', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('59', '2', '建议', 'cms_guestbook', '留言板分类', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('60', '3', '投诉', 'cms_guestbook', '留言板分类', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('61', '4', '其它', 'cms_guestbook', '留言板分类', 40, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
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
INSERT INTO `sys_dict` VALUES ('edc2e89282bb4eeba397857a2cfb6b33', 'com.thinkgem.jeesite.modules.oa.leave', '请假流程1', 'act_category', '请假流程111', 10, '0', '1', '2018-08-03 10:37:05', '1', '2018-08-03 10:37:05', '', '0');
INSERT INTO `sys_dict` VALUES ('ee843534a2884752bf2ebd2444551771', 'images/userinfo.jpg', '默认头像', 'default_headphoto_small', '默认头像(缩略图)', 10, '0', '1', '2018-07-30 11:52:22', '1', '2018-07-30 11:56:54', '默认小头像(缩略图)图片路径', '0');

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
INSERT INTO `sys_file` VALUES ('5e3fff31d0724f5d89ab106519e8634a', '8c5b5246330e42f4adb0593b1db498b4', 'XXX旅游APP项目功能模块20180528.xlsx', NULL, '19530', 'common/8c5b5246330e42f4adb0593b1db498b4\\20180803\\XXX旅游APP项目功能模块20180528.xlsx', '1', '2018-08-03 09:37:09', '1', '2018-08-03 09:37:09', NULL, '0');
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
INSERT INTO `sys_menu` VALUES ('24', '23', '0,2,23,', '官方首页', 30, '1', 2, 'http://jeesite.com', '_blank', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-04-18 10:53:18', '', '0');
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
INSERT INTO `sys_menu` VALUES ('95db821b31cd4670ab51b115ce73d271', '62', '0,62,', '待办任务', 20, '1', 1, '/act/task/todo', '', 'fa fa-circle-thin', '1', '', '1', '2018-08-07 14:57:37', '1', '2018-08-07 14:57:37', '', '0');
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
INSERT INTO `sys_office` VALUES ('1', '0', '0,', 'JSite 测试公司', 10, 'f762fb569d8445f28a226a9b831cfb90', '100000', '1', '1', '', '', '', '', '', '', '1', '', '', '0', 0, '1', '2013-05-27 08:00:00', '1', '2018-11-20 10:32:50', '', '0');
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
INSERT INTO `sys_role` VALUES ('1', '5', '系统管理员', 'Manager', 'security-role', '1', '1', '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-08-30 16:35:56', '', '0');
INSERT INTO `sys_role` VALUES ('1042c40b2d2d496c9af546bba7006623', '3', 'hr', 'hr', 'assignment', '3', '1', '1', '1', '1', '2018-08-20 14:33:33', '1', '2018-08-20 14:35:04', '', '0');
INSERT INTO `sys_role` VALUES ('6', '4', '普通用户', 'Comuser', 'assignment', '3', '8', '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-07-05 11:54:44', '', '0');

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
INSERT INTO `sys_user` VALUES ('1', '1', '5', 'jsite', '57b89d1421898c692ebf98b530c3869b56d32e1e80f2bb703aba8a39', '0001', '系统管理员', 'admin@admin.com', '1111', '1111', '1', '/baseWeb\\userfiles\\headphoto\\userinfo.jpg', '222.74.205.218', '2018-11-26 10:51:48', '1', '1', '2013-05-27 08:00:00', '1', '2018-11-20 10:33:15', '112212', '0');

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
