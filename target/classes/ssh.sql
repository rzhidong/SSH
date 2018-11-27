/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-11-27 22:43:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `flgdeleted` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('8', 'hello888', 'guangdong8888', '13800138008', 'Mon Nov 26 15:31:00 CST 2018', '2018-11-26 15:31:00', '0');
INSERT INTO `person` VALUES ('9', 'hello', 'guangdong', '13800138007', 'Mon Nov 26 15:31:16 CST 2018', '2018-11-26 15:31:17', '0');
INSERT INTO `person` VALUES ('10', 'hello10', 'guangdong10', '13800138005', 'Mon Nov 26 15:31:16 CST', '2018-11-26 15:31:17', '0');
INSERT INTO `person` VALUES ('11', 'hello11', 'ssssdsds', '13800138006', 'Mon Nov 26 15:31:17 CST 2018', '2018-11-26 15:31:17', '0');
INSERT INTO `person` VALUES ('12', 'hello', 'guangdong', '13800138009', 'Mon Nov 26 15:31:17 CST 2018', '2018-11-26 15:31:17', '0');
INSERT INTO `person` VALUES ('13', 'hello', 'guangdong', '13800138004', 'Mon Nov 26 15:31:17 CST 2018', '2018-11-26 15:31:17', '0');
INSERT INTO `person` VALUES ('14', 'hello14', 'guangdong', '13800138001', 'Mon Nov 26 15:31:17 CST 2018', '2018-11-26 15:31:18', '0');
INSERT INTO `person` VALUES ('15', 'hello', 'guangdong', '13800138005', 'Mon Nov 26 15:31:17 CST 2018', '2018-11-26 15:31:18', '0');
INSERT INTO `person` VALUES ('16', 'hello16', 'guangdong16666', '13800138001', 'Mon Nov 26 15:31:18 CST 2018', '2018-11-26 15:31:18', '0');
INSERT INTO `person` VALUES ('17', 'hello', 'guangdong', '13800138006', 'Mon Nov 26 15:31:18 CST 2018', '2018-11-26 15:31:18', '0');
INSERT INTO `person` VALUES ('18', 'admin', '技术测试', '15603050192', '呜呜哇啊', '2018-11-26 15:44:17', '0');
INSERT INTO `person` VALUES ('19', 'admin', '技术测试', '43343343', '呜呜哇啊', '2018-11-26 15:44:40', '0');
INSERT INTO `person` VALUES ('20', 'admin20', '技术测试', '43343343', '呜呜哇啊', '2018-11-26 15:51:39', '0');
INSERT INTO `person` VALUES ('21', 'multifile', '技术测试0213', '15603050192', 'S山东省山东', '2018-11-26 16:24:00', '0');
INSERT INTO `person` VALUES ('22', 'dfdasdsdsf', '3433', '2323', '2132323', '2018-11-26 18:02:03', '0');
INSERT INTO `person` VALUES ('23', 'dfdasdsdsf', '3433', '2323', '2132323', '2018-11-26 18:02:32', '0');
INSERT INTO `person` VALUES ('24', 'siglefile', '技术测试0213', '323232', 'dsds十多万', '2018-11-26 18:03:29', '0');
INSERT INTO `person` VALUES ('25', '4df发达的', '334好好的好的', '15603050192', '很多人', '2018-11-26 18:08:30', '0');
INSERT INTO `person` VALUES ('26', 'UploadAction', '334好好的好的', '222323', '4', '2018-11-26 19:04:43', '0');
INSERT INTO `person` VALUES ('27', '大风车', 'io就两节课交流交流', '138981', '可能就空间啊电脑看就好啦', '2018-11-26 20:08:00', '0');
INSERT INTO `person` VALUES ('28', '1234', '2222', '3333', '44444', '2018-11-26 20:09:12', '0');
INSERT INTO `person` VALUES ('29', '232', '434', '544', '65656', '2018-11-26 20:10:39', '0');
INSERT INTO `person` VALUES ('30', '23232', '434323t5', '242342', '4打发打发', '2018-11-26 20:15:34', '0');
INSERT INTO `person` VALUES ('31', 'dsfa的沙发 ', '都杀很大', '222', '打哈好的啊啊发', '2018-11-26 20:15:58', '0');
INSERT INTO `person` VALUES ('32', 'UploadAction', '334好好的好的', '15603050192', 'S山东省山东', '2018-11-26 20:20:17', '0');
INSERT INTO `person` VALUES ('33', '4343', '544', '454', '65656', '2018-11-26 21:05:26', '0');
INSERT INTO `person` VALUES ('34', '111', '2222', '3', '4', '2018-11-26 21:26:41', '0');
INSERT INTO `person` VALUES ('35', '吞吞吐吐', '44最后得到的回答', '3', '打个电话电话的', '2018-11-26 21:27:06', '0');
INSERT INTO `person` VALUES ('36', '333', '11', '22', '32321', '2018-11-26 21:31:02', '0');
INSERT INTO `person` VALUES ('37', '中古', '2I路口路哪里了', '43232323', 'dkljd可怜的就算了', '2018-11-26 21:33:03', '0');
INSERT INTO `person` VALUES ('38', '中古', '2I路口路哪里了', '43232323', 'dkljd可怜的就算了', '2018-11-26 21:35:13', '0');
INSERT INTO `person` VALUES ('39', '大半夜', '22ollI人见人夸', '2232', 'io哦机', '2018-11-27 00:38:53', '0');
INSERT INTO `person` VALUES ('40', '获得更好的是', 'GFGS', '2232', 'io哦机', '2018-11-27 00:41:34', '0');
INSERT INTO `person` VALUES ('41', '可可可乐', '看你空间里', '232322', '23232342', '2018-11-27 01:24:18', '0');
INSERT INTO `person` VALUES ('42', '1222222', 'guangdong123', '13800138005', 'Mon Nov 26 15:31:16 CST 2018', '2018-11-27 01:25:30', '0');
INSERT INTO `person` VALUES ('43', '444333', '4545454', '13800138004', 'Mon Nov 26 15:31:00 CST 2018', '2018-11-27 01:27:19', '0');
INSERT INTO `person` VALUES ('44', '世界', '你好', '31121213', '89898u98u9', '2018-11-27 02:19:07', '0');
INSERT INTO `person` VALUES ('45', '卡罗拉', '哦io偶一样', '43343', '85445是多少', '2018-11-27 02:21:08', '0');
INSERT INTO `person` VALUES ('46', '111', 'guangdong88888', '31121213', '的撒哈哈哈', '2018-11-27 11:45:35', '0');
INSERT INTO `person` VALUES ('47', 'multifile', '都杀很大', '15603050192', 'dsds十多万', '2018-11-27 16:35:58', '0');
INSERT INTO `person` VALUES ('48', 'admin', '都杀很大', '15603050192', 'S山东省山东', '2018-11-27 16:39:13', '0');
INSERT INTO `person` VALUES ('49', 'rzhidong@126.com', '技术测试0213', '13800138008', '打哈好的啊啊发', '2018-11-27 18:34:45', '0');
INSERT INTO `person` VALUES ('50', 'multifile', '技术测试', '15603050192', 'S山东省山东', '2018-11-27 18:34:59', '0');
INSERT INTO `person` VALUES ('51', 'UploadAction', '334好好的好的', '15603050192', 'S山东省山东', '2018-11-27 18:37:55', '0');
INSERT INTO `person` VALUES ('52', '浏览空间来看', '334好好的好的', '15603050192', '很多人', '2018-11-27 18:46:10', '0');
