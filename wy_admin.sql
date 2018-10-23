/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : wy_admin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-10-12 18:30:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `clt_ad`
-- ----------------------------
DROP TABLE IF EXISTS `clt_ad`;
CREATE TABLE `clt_ad` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告名称',
  `type_id` tinyint(5) NOT NULL COMMENT '所属位置',
  `pic` varchar(200) NOT NULL DEFAULT '' COMMENT '广告图片URL',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '广告链接',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `open` tinyint(2) NOT NULL COMMENT '1=审核  0=未审核',
  `content` varchar(225) DEFAULT '' COMMENT '广告内容',
  PRIMARY KEY (`ad_id`),
  KEY `plug_ad_adtypeid` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of clt_ad
-- ----------------------------
INSERT INTO `clt_ad` VALUES ('15', '成都唯意装饰', '1', '/uploads/20180611/c09ce57b7b5264ccbefef44c2591117b.png', 'http://www.cdwyzx.com', '1480909037', '1', '1', '成都唯意装饰');
INSERT INTO `clt_ad` VALUES ('17', '成都唯意装饰', '1', '/uploads/20180611/25e5f5a08933130f026a6119666b44a8.png', 'http://www.cdwyzx.com', '1481788850', '2', '1', '成都唯意装饰');
INSERT INTO `clt_ad` VALUES ('18', '成都唯意装饰', '1', '/uploads/20180611/814e5f76ef5dce49dfd3dce771631ecf.png', 'http://www.cdwyzx.com', '1481788869', '3', '1', '成都唯意装饰');

-- ----------------------------
-- Table structure for `clt_admin`
-- ----------------------------
DROP TABLE IF EXISTS `clt_admin`;
CREATE TABLE `clt_admin` (
  `admin_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(20) NOT NULL COMMENT '管理员用户名',
  `pwd` varchar(70) NOT NULL COMMENT '管理员密码',
  `group_id` mediumint(8) DEFAULT NULL COMMENT '分组ID',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `realname` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `tel` varchar(30) DEFAULT NULL COMMENT '电话号码',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `mdemail` varchar(50) DEFAULT '0' COMMENT '传递修改密码参数加密',
  `is_open` tinyint(2) DEFAULT '0' COMMENT '审核状态',
  `avatar` varchar(120) DEFAULT '' COMMENT '头像',
  PRIMARY KEY (`admin_id`),
  KEY `admin_username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

-- ----------------------------
-- Records of clt_admin
-- ----------------------------
INSERT INTO `clt_admin` VALUES ('1', 'admin', 'c5be58565e021294eb53cee07ab1e84f', '1', '1980428326@qq.com', '', '18782462482', '127.0.0.1', '1482132862', '0', '1', '/uploads/20180929/2e1d2ed6f213d0af68751d804168e068.jpg');
INSERT INTO `clt_admin` VALUES ('11', '123123', '4297f44b13955235245b2497399d7a93', '2', '1980428326@qq.com', null, '13856489956', '127.0.0.1', '1538020466', '0', '1', '/uploads/20181012/e21c8180cbb9a7ffcc6df7af5a45b286.jpg');
INSERT INTO `clt_admin` VALUES ('12', '456456', 'b51e8dbebd4ba8a8f342190a4b9f08d7', '3', '1980428326@qq.com', null, '15928602033', '127.0.0.1', '1538183719', '0', '1', '');
INSERT INTO `clt_admin` VALUES ('13', 'jsonjson', 'ec4b8ebff18d52c120a82ef46cbd1b95', '2', '993424780@qq.com', null, '18782462482', '127.0.0.1', '1538375842', '0', '1', '/uploads/20181001/b7608e6b137dcd01c3e0490757beed24.jpg');
INSERT INTO `clt_admin` VALUES ('14', '999999', '52c69e3a57331081823331c4e69d3f2e', '1', '1980428326@qq.com', null, '15928602033', '127.0.0.1', '1538543321', '0', '1', '/uploads/20181003/da37b017124960d1414305ad48ccd3e1.jpg');

-- ----------------------------
-- Table structure for `clt_ad_type`
-- ----------------------------
DROP TABLE IF EXISTS `clt_ad_type`;
CREATE TABLE `clt_ad_type` (
  `type_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告位名称',
  `sort` int(11) NOT NULL COMMENT '广告位排序',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='广告分类';

-- ----------------------------
-- Records of clt_ad_type
-- ----------------------------
INSERT INTO `clt_ad_type` VALUES ('1', '【首页】顶部轮播', '1');
INSERT INTO `clt_ad_type` VALUES ('5', '【内页】横幅', '2');

-- ----------------------------
-- Table structure for `clt_article`
-- ----------------------------
DROP TABLE IF EXISTS `clt_article`;
CREATE TABLE `clt_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(80) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL COMMENT '内容',
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '1',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `copyfrom` varchar(255) NOT NULL DEFAULT 'CLTPHP',
  `fromlink` varchar(255) NOT NULL DEFAULT 'http://www.cltphp.com/',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `title_style` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`id`,`status`,`sort`),
  KEY `catid` (`id`,`catid`,`status`),
  KEY `listorder` (`id`,`catid`,`status`,`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_article
-- ----------------------------
INSERT INTO `clt_article` VALUES ('1', '3', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '804', '1499760262', '1504764870', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('2', '3', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '1299', '1499760655', '1504764762', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('24', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '0', '1', '0', '', '0', '0', '288', '1503307064', '1505264247', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('3', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '1', '1', '0', '', '0', '0', '355', '1498035408', '1499834839', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('4', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '1022', '1497949408', '1504597814', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('5', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '619', '1499159138', '1499916031', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('6', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '800', '1499677661', '1504597769', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('7', '6', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '866', '1499764536', '1500368732', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('8', '6', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '286', '1499764652', '1499916156', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('9', '6', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '311', '1499764826', '1499916131', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('10', '6', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '1,2,3,4', '0', '0', '740', '1499828506', '1501139662', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('11', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '0', '1', '0', '', '0', '0', '807', '1499828638', '1505264287', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('12', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '763', '1500014331', '1501031503', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('13', '6', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '286', '1500432973', '1501031353', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('14', '6', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '428', '1500867996', '1501204238', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('15', '6', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '336', '1501031299', '1502067767', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('16', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '1896', '1501031404', '1502068026', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('17', '6', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '350', '1501204163', '1501204249', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('18', '3', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '1391', '1501552272', '1505373009', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('19', '3', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '0', '1', '0', '', '0', '0', '536', '1501827480', '1504516379', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('20', '6', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '1', '1', '0', '', '0', '0', '409', '1502067689', '1502067893', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('21', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '356', '1502067980', '1502422491', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('22', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '930', '1502421726', '1503365682', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('23', '3', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '0', '1', '0', '', '0', '0', '274', '1502761583', '1504763357', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('25', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '1', '1', '0', '', '0', '0', '1098', '1503365502', '0', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('36', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '0', '1', '0', '', '0', '0', '225', '1504765025', '1505355804', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('37', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '0', '1', '0', '', '0', '0', '143', '1505264091', '1505355785', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('38', '3', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '1', '1', '0', '', '0', '0', '1268', '1505264319', '1515748920', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('40', '6', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '176', '1505355407', '1505355561', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('39', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '702', '1505353199', '1505872972', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('41', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '2', '1', '0', '', '0', '0', '1555', '1505871918', '1529458978', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', 'color:rgb(95, 184, 120);font-weight:bold;');
INSERT INTO `clt_article` VALUES ('42', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '0', '1', '0', '', '0', '0', '250', '1506475263', '1506475718', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('43', '6', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '0', '1', '0', '', '0', '0', '104', '1507425169', '0', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('44', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '1', '1', '0', '', '0', '0', '1660', '1507877194', '1507879172', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('45', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '1', '1', '0', '', '0', '0', '121', '1512032568', '1530234987', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', 'color:;font-weight:normal;');

-- ----------------------------
-- Table structure for `clt_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `clt_auth_group`;
CREATE TABLE `clt_auth_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '全新ID',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '标题',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `rules` longtext COMMENT '规则',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='管理员分组';

-- ----------------------------
-- Records of clt_auth_group
-- ----------------------------
INSERT INTO `clt_auth_group` VALUES ('1', '超级管理员', '1', '0,1,2,270,15,16,119,120,121,145,17,149,116,117,118,151,181,18,108,114,112,109,110,111,3,5,128,127,126,4,230,232,129,189,190,193,192,240,239,241,243,244,245,242,246,7,9,14,234,13,235,236,237,238,27,29,161,163,164,162,38,167,182,169,166,28,48,247,248,31,32,249,250,251,45,170,171,175,174,173,46,176,183,179,178,265,196,197,202,198,252,253,254,255,256,203,205,204,257,272,267,269,278,206,207,212,208,213,258,259,260,261,262,209,215,214,263,273,', '1465114224');
INSERT INTO `clt_auth_group` VALUES ('2', '网站数据管理员', '1', '0,1,2,270,15,16,145,17,181,18,111,3,5,127,128,4,129,189,190,239,241,242,7,9,14,13,27,29,161,163,164,162,38,167,182,169,166,28,48,31,32,45,170,171,175,174,173,46,176,183,179,178,196,197,202,252,203,205,204,257,272,206,207,212,208,260,267,269,', '1465114224');
INSERT INTO `clt_auth_group` VALUES ('3', '客户管理员', '1', '0,3,5,128,127,126,4,230,232,129,27,29,161,163,164,162,38,167,182,169,166,', '1465114224');
INSERT INTO `clt_auth_group` VALUES ('4', 'Json', '0', null, '1538553998');

-- ----------------------------
-- Table structure for `clt_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `clt_auth_rule`;
CREATE TABLE `clt_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `href` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `authopen` tinyint(2) NOT NULL DEFAULT '1',
  `icon` varchar(20) DEFAULT NULL COMMENT '样式',
  `condition` char(100) DEFAULT '',
  `pid` int(5) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `zt` int(1) DEFAULT NULL,
  `menustatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=279 DEFAULT CHARSET=utf8 COMMENT='权限节点';

-- ----------------------------
-- Records of clt_auth_rule
-- ----------------------------
INSERT INTO `clt_auth_rule` VALUES ('1', 'System', '系统设置', '1', '1', '0', 'icon-cogs', '', '0', '0', '1446535750', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('2', 'System/system', '系统设置', '1', '1', '0', '', '', '1', '1', '1446535789', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('3', 'Database/database', '数据库管理', '1', '1', '0', 'icon-database', '', '0', '2', '1446535805', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('4', 'Database/restore', '还原数据库', '1', '1', '0', '', '', '3', '10', '1446535750', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('5', 'Database/database', '数据库备份', '1', '1', '0', '', '', '3', '1', '1446535834', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('7', 'Category', '栏目管理', '1', '1', '0', 'icon-list', '', '0', '4', '1446535875', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('9', 'Category/index', '栏目列表', '1', '1', '0', '', '', '7', '0', '1446535750', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('13', 'Category/edit', '操作-修改', '1', '1', '0', '', '', '9', '3', '1446535750', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('14', 'Category/add', '操作-添加', '1', '1', '0', '', '', '9', '0', '1446535750', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('15', 'Auth/adminList', '权限管理', '1', '1', '0', 'icon-lifebuoy', '', '0', '1', '1446535750', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('16', 'Auth/adminList', '管理员列表', '1', '1', '0', '', '', '15', '0', '1446535750', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('17', 'Auth/adminGroup', '用户组列表', '1', '1', '0', '', '', '15', '1', '1446535750', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('18', 'Auth/adminRule', '权限管理', '1', '1', '0', '', '', '15', '2', '1446535750', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('23', 'Help/soft', '软件下载', '1', '1', '0', '', '', '22', '50', '1446711421', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('27', 'Users', '用户管理', '1', '1', '0', 'icon-user', '', '0', '5', '1447231507', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('28', 'Function', '网站功能', '1', '1', '0', 'icon-cog', '', '0', '6', '1447231590', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('29', 'Users/index', '客户列表', '1', '1', '0', '', '', '27', '10', '1447232085', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('31', 'Link/index', '友情链接', '1', '1', '0', '', '', '28', '2', '1447232183', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('32', 'Link/add', '操作-添加', '1', '1', '0', '', '', '31', '1', '1447639935', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('36', 'We/we_menu', '自定义菜单', '1', '1', '0', '', '', '35', '50', '1447842477', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('38', 'Users/userGroup', '客户组', '1', '1', '0', '', '', '27', '50', '1448413248', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('39', 'We/we_menu', '自定义菜单', '1', '1', '0', '', '', '36', '50', '1448501584', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('45', 'Ad/index', '广告管理', '1', '1', '0', '', '', '28', '3', '1450314297', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('46', 'Ad/type', '广告位管理', '1', '1', '0', '', '', '28', '4', '1450314324', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('48', 'Message/index', '留言管理', '1', '1', '0', '', '', '28', '1', '1451267354', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('105', 'System/runsys', '操作-保存', '1', '1', '0', '', '', '6', '50', '1461036331', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('106', 'System/runwesys', '操作-保存', '1', '1', '0', '', '', '10', '50', '1461037680', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('107', 'System/runemail', '操作-保存', '1', '1', '0', '', '', '19', '50', '1461039346', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('108', 'Auth/ruleAdd', '操作-添加', '1', '1', '0', '', '', '18', '0', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('109', 'Auth/ruleState', '操作-状态', '1', '1', '0', '', '', '18', '5', '1461550949', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('110', 'Auth/ruleTz', '操作-验证', '1', '1', '0', '', '', '18', '6', '1461551129', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('111', 'Auth/ruleorder', '操作-排序', '1', '1', '0', '', '', '18', '7', '1461551263', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('112', 'Auth/ruleDel', '操作-删除', '1', '1', '0', '', '', '18', '4', '1461551536', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('114', 'Auth/ruleEdit', '操作-修改', '1', '1', '0', '', '', '18', '2', '1461551913', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('116', 'Auth/groupEdit', '操作-修改', '1', '1', '0', '', '', '17', '3', '1461552326', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('117', 'Auth/groupDel', '操作-删除', '1', '1', '0', '', '', '17', '30', '1461552349', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('118', 'Auth/groupAccess', '操作-权限', '1', '1', '0', '', '', '17', '40', '1461552404', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('119', 'Auth/adminAdd', '操作-添加', '1', '1', '0', '', '', '16', '0', '1461553162', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('120', 'Auth/adminEdit', '操作-修改', '1', '1', '0', '', '', '16', '2', '1461554130', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('121', 'Auth/adminDel', '操作-删除', '1', '1', '0', '', '', '16', '4', '1461554152', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('122', 'System/source_runadd', '操作-添加', '1', '1', '0', '', '', '43', '10', '1461036331', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('123', 'System/source_order', '操作-排序', '1', '1', '0', '', '', '43', '50', '1461037680', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('124', 'System/source_runedit', '操作-改存', '1', '1', '0', '', '', '43', '30', '1461039346', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('125', 'System/source_del', '操作-删除', '1', '1', '0', '', '', '43', '40', '146103934', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('126', 'Database/export', '操作-备份', '1', '1', '0', '', '', '5', '1', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('127', 'Database/optimize', '操作-优化', '1', '1', '0', '', '', '5', '1', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('128', 'Database/repair', '操作-修复', '1', '1', '0', '', '', '5', '1', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('129', 'Database/delSqlFiles', '操作-删除', '1', '1', '0', '', '', '4', '3', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('130', 'System/bxgs_state', '操作-状态', '1', '1', '0', '', '', '67', '5', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('131', 'System/bxgs_edit', '操作-修改', '1', '1', '0', '', '', '67', '1', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('132', 'System/bxgs_runedit', '操作-改存', '1', '1', '0', '', '', '67', '2', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('134', 'System/myinfo_runedit', '个人资料修改', '1', '1', '0', '', '', '68', '1', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('236', 'Category/del', '操作-删除', '1', '1', '0', '', '', '9', '5', '1497424900', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('230', 'Database/import', '操作-还原', '1', '1', '0', '', '', '4', '1', '1497423595', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('145', 'Auth/adminState', '操作-状态', '1', '1', '0', '', '', '16', '5', '1461550835', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('149', 'Auth/groupAdd', '操作-添加', '1', '1', '0', '', '', '17', '1', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('151', 'Auth/groupRunaccess', '操作-权存', '1', '1', '0', '', '', '17', '50', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('153', 'System/bxgs_runadd', '操作-添存', '1', '1', '0', '', '', '66', '1', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('234', 'Category/insert', '操作-添存', '1', '1', '0', '', '', '9', '2', '1497424143', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('240', 'Module/del', '操作-删除', '1', '1', '0', '', '', '190', '4', '1497425850', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('239', 'Module/moduleState', '操作-状态', '1', '1', '0', '', '', '190', '5', '1497425764', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('238', 'page/edit', '单页编辑', '1', '1', '0', '', '', '7', '2', '1497425142', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('237', 'Category/cOrder', '操作-排序', '1', '1', '0', '', '', '9', '6', '1497424979', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('161', 'Users/usersState', '操作-状态', '1', '1', '0', '', '', '29', '1', '1461550835', '1', '1');
INSERT INTO `clt_auth_rule` VALUES ('162', 'Users/delall', '操作-全部删除', '1', '1', '0', '', '', '29', '4', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('163', 'Users/edit', '操作-编辑', '1', '1', '0', '', '', '29', '2', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('164', 'Users/usersDel', '操作-删除', '1', '1', '0', '', '', '29', '3', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('247', 'Message/del', '操作-删除', '1', '1', '0', '', '', '48', '1', '1497427449', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('166', 'Users/groupOrder', '操作-排序', '1', '1', '0', '', '', '38', '50', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('167', 'Users/groupAdd', '操作-添加', '1', '1', '0', '', '', '38', '10', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('169', 'Users/groupDel', '操作-删除', '1', '1', '0', '', '', '38', '30', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('170', 'Ad/add', '操作-添加', '1', '1', '0', '', '', '45', '1', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('171', 'Ad/edit', '操作-修改', '1', '1', '0', '', '', '45', '2', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('173', 'Ad/del', '操作-删除', '1', '1', '0', '', '', '45', '5', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('174', 'Ad/adOrder', '操作-排序', '1', '1', '0', '', '', '45', '4', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('175', 'Ad/editState', '操作-状态', '1', '1', '0', '', '', '45', '3', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('176', 'Ad/addType', '操作-添加', '1', '1', '0', '', '', '46', '1', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('252', 'Template/edit', '操作-编辑', '1', '1', '0', '', '', '197', '3', '1497428906', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('178', 'Ad/delType', '操作-删除', '1', '1', '0', '', '', '46', '4', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('179', 'Ad/typeOrder', '操作-排序', '1', '1', '0', '', '', '46', '3', '1461550835', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('180', 'System/source_edit', '操作-修改', '1', '1', '0', '', '', '43', '20', '1461832933', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('181', 'Auth/groupState', '操作-状态', '1', '1', '0', '', '', '17', '50', '1461834340', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('182', 'Users/groupEdit', '操作-修改', '1', '1', '0', '', '', '38', '15', '1461834780', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('183', 'Ad/editType', '操作-修改', '1', '1', '0', '', '', '46', '2', '1461834988', '1', '0');
INSERT INTO `clt_auth_rule` VALUES ('188', 'Plug/donation', '捐赠列表', '1', '1', '0', '', '', '187', '50', '1466563673', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('189', 'Module', '模型管理', '1', '1', '0', 'icon-ungroup', '', '0', '3', '1466825363', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('190', 'Module/index', '模型列表', '1', '1', '0', '', '', '189', '1', '1466826681', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('192', 'Module/edit', '操作-修改', '1', '1', '0', '', '', '190', '2', '1467007920', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('193', 'Module/add', '操作-添加', '1', '1', '0', '', '', '190', '1', '1467007955', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('196', 'Template', '模版管理', '1', '1', '0', 'icon-embed2', '', '0', '7', '1481857304', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('197', 'Template/index', '模版管理', '1', '1', '0', '', '', '196', '1', '1481857540', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('198', 'Template/insert', '操作-添存', '1', '1', '0', '', '', '197', '2', '1481857587', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('202', 'Template/add', '操作-添加', '1', '1', '0', '', '', '197', '1', '1481859447', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('203', 'Debris/index', '碎片管理', '1', '1', '0', '', '', '196', '2', '1484797759', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('204', 'Debris/edit', '操作-编辑', '1', '1', '0', '', '', '203', '2', '1484797849', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('205', 'Debris/add', '操作-添加', '1', '1', '0', '', '', '203', '1', '1484797878', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('206', 'Wechat', '微信管理', '1', '1', '0', 'icon-bubbles2', '', '0', '8', '1487063570', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('207', 'Wechat/config', '公众号管理', '1', '1', '0', '', '', '206', '1', '1487063705', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('208', 'Wechat/menu', '菜单管理', '1', '1', '0', '', '', '206', '2', '1487063765', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('209', 'Wechat/materialmessage', '消息素材', '1', '1', '0', '', '', '206', '3', '1487063834', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('212', 'Wechat/weixin', '操作-设置', '1', '1', '0', '', '', '207', '1', '1487064541', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('213', 'Wechat/addMenu', '操作-添加', '1', '1', '0', '', '', '208', '1', '1487149151', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('214', 'Wechat/editText', '操作-编辑', '1', '1', '0', '', '', '209', '2', '1487233984', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('215', 'Wechat/addText', '操作-添加', '1', '1', '0', '', '', '209', '1', '1487234062', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('232', 'Database/downFile', '操作-下载', '1', '1', '0', '', '', '4', '2', '1497423744', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('235', 'Category/catUpdate', '操作-该存', '1', '1', '0', '', '', '9', '4', '1497424301', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('241', 'Module/field', '模型字段', '1', '1', '0', '', '', '190', '6', '1497425972', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('242', 'Module/fieldStatus', '操作-状态', '1', '1', '0', '', '', '241', '4', '1497426044', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('243', 'Module/fieldAdd', '操作-添加', '1', '1', '0', '', '', '241', '1', '1497426089', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('244', 'Module/fieldEdit', '操作-修改', '1', '1', '0', '', '', '241', '2', '1497426134', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('245', 'Module/listOrder', '操作-排序', '1', '1', '0', '', '', '241', '3', '1497426179', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('246', 'Module/fieldDel', '操作-删除', '1', '1', '0', '', '', '241', '5', '1497426241', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('248', 'Message/delall', '操作-删除全部', '1', '1', '0', '', '', '48', '2', '1497427534', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('249', 'Link/edit', '操作-编辑', '1', '1', '0', '', '', '31', '2', '1497427694', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('250', 'Link/linkState', '操作-状态', '1', '1', '0', '', '', '31', '3', '1497427734', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('251', 'Link/del', '操作-删除', '1', '1', '0', '', '', '31', '4', '1497427780', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('253', 'Template/update', '操作-改存', '1', '1', '0', '', '', '197', '4', '1497428951', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('254', 'Template/delete', '操作-删除', '1', '1', '0', '', '', '197', '5', '1497429018', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('255', 'Template/images', '媒体文件管理', '1', '1', '0', '', '', '197', '6', '1497429157', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('256', 'Template/imgDel', '操作-文件删除', '1', '1', '0', '', '', '255', '1', '1497429217', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('257', 'Debris/del', '操作-删除', '1', '1', '0', '', '', '203', '3', '1497429416', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('258', 'Wechat/editMenu', '操作-编辑', '1', '1', '0', '', '', '208', '2', '1497429671', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('259', 'Wechat/menuOrder', '操作-排序', '1', '1', '0', '', '', '208', '3', '1497429707', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('260', 'Wechat/menuState', '操作-状态', '1', '1', '0', '', '', '208', '4', '1497429764', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('261', 'Wechat/delMenu', '操作-删除', '1', '1', '0', '', '', '208', '5', '1497429822', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('262', 'Wechat/createMenu', '操作-生成菜单', '1', '1', '0', '', '', '208', '6', '1497429886', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('263', 'Wechat/delText', '操作-删除', '1', '1', '0', '', '', '209', '3', '1497430020', '0', '0');
INSERT INTO `clt_auth_rule` VALUES ('265', 'Donation/index', '捐赠管理', '1', '1', '0', '', '', '28', '5', '1498101716', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('273', 'Wechat/replay', '回复设置', '1', '1', '0', '', '', '206', '4', '1508215988', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('267', 'Plugin/index', '插件管理', '1', '1', '1', 'icon-power-cord', '', '0', '8', '1501466560', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('269', 'Plugin/index', '第三方', '1', '1', '1', '', '', '267', '1', '1501466732', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('270', 'System/email', '邮箱配置', '1', '1', '0', '', '', '1', '2', '1502331829', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('272', 'Debris/type', '碎片分类', '1', '1', '1', '', '', '196', '3', '1504082720', '0', '1');
INSERT INTO `clt_auth_rule` VALUES ('278', 'Feast/index', '节日气氛', '1', '1', '1', '', '', '267', '50', '1532416207', null, '1');

-- ----------------------------
-- Table structure for `clt_category`
-- ----------------------------
DROP TABLE IF EXISTS `clt_category`;
CREATE TABLE `clt_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `catname` varchar(255) NOT NULL DEFAULT '',
  `catdir` varchar(30) NOT NULL DEFAULT '',
  `parentdir` varchar(50) NOT NULL DEFAULT '',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `moduleid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `module` char(24) NOT NULL DEFAULT '',
  `arrparentid` varchar(255) NOT NULL DEFAULT '',
  `arrchildid` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `keywords` varchar(200) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(100) NOT NULL DEFAULT '',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '',
  `template_list` varchar(20) NOT NULL DEFAULT '',
  `template_show` varchar(20) NOT NULL DEFAULT '',
  `pagesize` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `listtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否预览',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_category
-- ----------------------------
INSERT INTO `clt_category` VALUES ('1', '最新动态', 'news', '', '0', '2', 'article', '0', '1,5,6', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '4', '0', '1', '0', '', '1', '', 'article-list', 'article-show', '0', '1,2,3', '0', '0', '0');
INSERT INTO `clt_category` VALUES ('2', '关于我们', 'about', '', '0', '1', 'page', '0', '2', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '0', '0', '1', '0', '', '0', '', '', '', '0', '', '0', '0', '0');
INSERT INTO `clt_category` VALUES ('4', '系统操作', 'system', '', '0', '3', 'picture', '0', '4', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '2', '0', '1', '0', '', '0', '', '', '', '0', '1,2,3', '0', '0', '0');
INSERT INTO `clt_category` VALUES ('3', '服务内容', 'services', '', '0', '2', 'article', '0', '3', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '1', '0', '1', '0', '', '0', '', '', '', '15', '1,2,3', '0', '0', '1');
INSERT INTO `clt_category` VALUES ('8', '联系我们', 'contact', '', '0', '1', 'page', '0', '8', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '7', '0', '1', '0', '', '0', '', 'page_show_contace', 'page_show_contace', '0', '', '0', '0', '0');
INSERT INTO `clt_category` VALUES ('7', '精英团队', 'team', '', '0', '6', 'team', '0', '7', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '5', '0', '1', '0', '', '0', '', '', '', '0', '', '0', '0', '0');
INSERT INTO `clt_category` VALUES ('5', '动态', 'news2', 'news/', '1', '2', 'article', '0,1', '5', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '0', '0', '1', '0', '', '0', '', '', '', '5', '1,2,3', '0', '0', '1');
INSERT INTO `clt_category` VALUES ('6', '相关知识 ', 'news', 'news/', '1', '2', 'article', '0,1', '6', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '0', '0', '1', '0', '', '0', '', '', '', '0', '', '0', '0', '1');
INSERT INTO `clt_category` VALUES ('14', '文件下载', 'download', '', '0', '5', 'download', '0', '14', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '0', '0', '1', '0', '', '0', '', '', '', '10', '1,2', '0', '0', '0');

-- ----------------------------
-- Table structure for `clt_config`
-- ----------------------------
DROP TABLE IF EXISTS `clt_config`;
CREATE TABLE `clt_config` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_config
-- ----------------------------
INSERT INTO `clt_config` VALUES ('16', 'is_mark', '0', 'water', '0');
INSERT INTO `clt_config` VALUES ('17', 'mark_txt', '', 'water', '0');
INSERT INTO `clt_config` VALUES ('18', 'mark_img', '/public/upload/public/2017/01-20/10cd966bd5f3549833c09a5c9700a9b8.jpg', 'water', '0');
INSERT INTO `clt_config` VALUES ('19', 'mark_width', '', 'water', '0');
INSERT INTO `clt_config` VALUES ('20', 'mark_height', '', 'water', '0');
INSERT INTO `clt_config` VALUES ('21', 'mark_degree', '54', 'water', '0');
INSERT INTO `clt_config` VALUES ('22', 'mark_quality', '56', 'water', '0');
INSERT INTO `clt_config` VALUES ('23', 'sel', '9', 'water', '0');
INSERT INTO `clt_config` VALUES ('24', 'sms_url', 'https://yunpan.cn/OcRgiKWxZFmjSJ', 'sms', '0');
INSERT INTO `clt_config` VALUES ('25', 'sms_user', '', 'sms', '0');
INSERT INTO `clt_config` VALUES ('26', 'sms_pwd', '访问密码 080e', 'sms', '0');
INSERT INTO `clt_config` VALUES ('27', 'regis_sms_enable', '1', 'sms', '0');
INSERT INTO `clt_config` VALUES ('28', 'sms_time_out', '1200', 'sms', '0');
INSERT INTO `clt_config` VALUES ('38', '__hash__', '8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453', 'sms', '0');
INSERT INTO `clt_config` VALUES ('39', '__hash__', '8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453', 'sms', '0');
INSERT INTO `clt_config` VALUES ('56', 'sms_appkey', '123456789', 'sms', '0');
INSERT INTO `clt_config` VALUES ('57', 'sms_secretKey', '123456789', 'sms', '0');
INSERT INTO `clt_config` VALUES ('58', 'sms_product', '唯意装饰', 'sms', '0');
INSERT INTO `clt_config` VALUES ('59', 'sms_templateCode', 'SMS_101234567890', 'sms', '0');
INSERT INTO `clt_config` VALUES ('60', 'smtp_server', 'smtp.qq.com', 'smtp', '0');
INSERT INTO `clt_config` VALUES ('61', 'smtp_port', '465', 'smtp', '0');
INSERT INTO `clt_config` VALUES ('62', 'smtp_user', '1980428326@qq.com', 'smtp', '0');
INSERT INTO `clt_config` VALUES ('63', 'smtp_pwd', '20180927', 'smtp', '0');
INSERT INTO `clt_config` VALUES ('64', 'regis_smtp_enable', '1', 'smtp', '0');
INSERT INTO `clt_config` VALUES ('65', 'test_eamil', '3437013981@qq.com', 'smtp', '0');
INSERT INTO `clt_config` VALUES ('70', 'forget_pwd_sms_enable', '1', 'sms', '0');
INSERT INTO `clt_config` VALUES ('71', 'bind_mobile_sms_enable', '1', 'sms', '0');
INSERT INTO `clt_config` VALUES ('72', 'order_add_sms_enable', '1', 'sms', '0');
INSERT INTO `clt_config` VALUES ('73', 'order_pay_sms_enable', '1', 'sms', '0');
INSERT INTO `clt_config` VALUES ('74', 'order_shipping_sms_enable', '1', 'sms', '0');
INSERT INTO `clt_config` VALUES ('88', 'email_id', 'JsonZhang', 'smtp', '0');
INSERT INTO `clt_config` VALUES ('89', 'test_eamil_info', ' 您好！这是一封来自唯意装饰的邮件', 'smtp', '0');

-- ----------------------------
-- Table structure for `clt_debris`
-- ----------------------------
DROP TABLE IF EXISTS `clt_debris`;
CREATE TABLE `clt_debris` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `type_id` int(6) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `content` text,
  `addtime` int(13) DEFAULT NULL,
  `sort` int(11) DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_debris
-- ----------------------------
INSERT INTO `clt_debris` VALUES ('15', '1', '装修测试', '<p><span style=\"text-align: center;\">装修测试</span></p>', '1503293255', '1');
INSERT INTO `clt_debris` VALUES ('16', '1', '装修测试', '<p><span style=\"text-align: center;\">装修测试</span></p>', '1503293273', '2');
INSERT INTO `clt_debris` VALUES ('17', '1', '装修测试', '<p><span style=\"text-align: center;\">装修测试</span></p>', '1503293291', '3');

-- ----------------------------
-- Table structure for `clt_debris_type`
-- ----------------------------
DROP TABLE IF EXISTS `clt_debris_type`;
CREATE TABLE `clt_debris_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL,
  `sort` int(1) DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_debris_type
-- ----------------------------
INSERT INTO `clt_debris_type` VALUES ('1', '【首页】中部碎片', '1');

-- ----------------------------
-- Table structure for `clt_donation`
-- ----------------------------
DROP TABLE IF EXISTS `clt_donation`;
CREATE TABLE `clt_donation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(120) NOT NULL DEFAULT '' COMMENT '用户名',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '捐赠金额',
  `addtime` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_donation
-- ----------------------------
INSERT INTO `clt_donation` VALUES ('3', '测试', '1.00', '1466566714');
INSERT INTO `clt_donation` VALUES ('4', '测试', '1.00', '1466566733');
INSERT INTO `clt_donation` VALUES ('5', '测试', '1.00', '1466566780');
INSERT INTO `clt_donation` VALUES ('6', '测试', '1.00', '1467517788');
INSERT INTO `clt_donation` VALUES ('7', '测试', '1.00', '1469582594');
INSERT INTO `clt_donation` VALUES ('8', '测试', '1.00', '1473155340');
INSERT INTO `clt_donation` VALUES ('9', '测试', '1.00', '1473647377');
INSERT INTO `clt_donation` VALUES ('11', '测试', '1.00', '1483080600');
INSERT INTO `clt_donation` VALUES ('12', '测试', '1.00', '1484874321');
INSERT INTO `clt_donation` VALUES ('13', '测试', '1.00', '1485224098');
INSERT INTO `clt_donation` VALUES ('14', '测试', '1.00', '1486343033');
INSERT INTO `clt_donation` VALUES ('15', '测试', '1.00', '1487570095');
INSERT INTO `clt_donation` VALUES ('16', '测试', '1.00', '1488507544');
INSERT INTO `clt_donation` VALUES ('17', '测试', '1.00', '1489368971');
INSERT INTO `clt_donation` VALUES ('18', '测试', '1.00', '1490608429');
INSERT INTO `clt_donation` VALUES ('19', '测试', '1.00', '1499765536');
INSERT INTO `clt_donation` VALUES ('20', '测试', '1.00', '1500014307');
INSERT INTO `clt_donation` VALUES ('21', '测试', '1.00', '1500368368');
INSERT INTO `clt_donation` VALUES ('22', '测试', '1.00', '1500867256');
INSERT INTO `clt_donation` VALUES ('23', '测试', '1.00', '1501203253');
INSERT INTO `clt_donation` VALUES ('24', '测试', '1.00', '1501567608');
INSERT INTO `clt_donation` VALUES ('25', '测试', '1.00', '1501807989');
INSERT INTO `clt_donation` VALUES ('31', '测试', '1.00', '1506742161');
INSERT INTO `clt_donation` VALUES ('32', '测试', '1.00', '1507266070');
INSERT INTO `clt_donation` VALUES ('33', '测试', '1.00', '1508807674');
INSERT INTO `clt_donation` VALUES ('34', '测试', '1.00', '1508851175');
INSERT INTO `clt_donation` VALUES ('35', '测试', '1.00', '1509091826');
INSERT INTO `clt_donation` VALUES ('36', '测试', '1.00', '1510121131');

-- ----------------------------
-- Table structure for `clt_download`
-- ----------------------------
DROP TABLE IF EXISTS `clt_download`;
CREATE TABLE `clt_download` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `files` varchar(80) NOT NULL DEFAULT '',
  `ext` varchar(255) NOT NULL DEFAULT 'zip',
  `size` varchar(255) NOT NULL DEFAULT '',
  `downs` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`id`,`status`,`sort`),
  KEY `catid` (`id`,`catid`,`status`),
  KEY `listorder` (`id`,`catid`,`status`,`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_download
-- ----------------------------
INSERT INTO `clt_download` VALUES ('3', '14', '1', 'admin', '测试下载一', 'color:;font-weight:normal;', '', '测试下载一', '测试下载一', '请输入……', '0', '0', '1', '0', '', '0', '0', '0', '1529637588', '0', '/uploads/20180622/a6f6381d3bf0f0814790ad4b5b121794.zip', 'zip', '', '0');
INSERT INTO `clt_download` VALUES ('4', '14', '1', 'admin', '测试下载二', 'color:;font-weight:normal;', '', '测试下载二', '测试下载二', '请输入……', '0', '0', '1', '0', '', '0', '0', '0', '1529638055', '0', '/uploads/20180622/795f146c7c9e52414fe9f3b041af583e.zip', 'zip', '', '0');

-- ----------------------------
-- Table structure for `clt_feast`
-- ----------------------------
DROP TABLE IF EXISTS `clt_feast`;
CREATE TABLE `clt_feast` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(120) DEFAULT '' COMMENT '标题',
  `open` int(1) DEFAULT '1' COMMENT '是否开启',
  `sort` int(4) DEFAULT '50' COMMENT '排序',
  `addtime` varchar(15) DEFAULT NULL COMMENT '添加时间',
  `feast_date` varchar(20) DEFAULT '' COMMENT '节日日期',
  `type` int(1) DEFAULT '1' COMMENT '1阳历 2农历',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='节日列表';

-- ----------------------------
-- Records of clt_feast
-- ----------------------------
INSERT INTO `clt_feast` VALUES ('2', '圣诞节', '1', '50', '1513304012', '12-25', '1');
INSERT INTO `clt_feast` VALUES ('3', '中秋节', '1', '2', '1513317857', '07-12', '1');
INSERT INTO `clt_feast` VALUES ('4', '七夕', '1', '50', '1532420762', '07-24', '1');

-- ----------------------------
-- Table structure for `clt_feast_element`
-- ----------------------------
DROP TABLE IF EXISTS `clt_feast_element`;
CREATE TABLE `clt_feast_element` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pid` int(4) DEFAULT NULL COMMENT '父级ID',
  `title` varchar(120) DEFAULT NULL COMMENT '标题',
  `css` text COMMENT 'CSS',
  `js` text COMMENT 'JS',
  `sort` int(5) DEFAULT '50' COMMENT '排序',
  `open` int(1) DEFAULT '1' COMMENT '是否开启',
  `addtime` varchar(15) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='节日元素表';

-- ----------------------------
-- Records of clt_feast_element
-- ----------------------------
INSERT INTO `clt_feast_element` VALUES ('1', '2', '内容雪人', '#content-wrapper{position: relative;}\n#top-left img{width: 150px;}\n#top-left{position: absolute;top: 30px;left: -145px;}', '$(\"#content-wrapper\").append(\"<div id=top-left><img src=/static/feast/christmas/top-left.png></div>\");', '1', '1', '1513309235');
INSERT INTO `clt_feast_element` VALUES ('2', '2', '主页右下角驯鹿', '#body-right-bottom{position: fixed;bottom: 0;right: 20px;z-index:51}\n#body-right-bottom img{width: 400px;}', '$(\"body\").append(\"<div id=body-right-bottom><img src=/static/feast/christmas/body-right-bottom.png></div>\");', '2', '1', '1513309340');
INSERT INTO `clt_feast_element` VALUES ('3', '2', '主页左下角圣诞树', '#body-left-bottom{position: fixed;bottom: 0;left:0;z-index:51}\n#body-left-bottom img{width: 200px;}', ' $(\"body\").append(\"<div id=body-left-bottom><img src=/static/feast/christmas/body-left-bottom.png></div>\");', '3', '1', '1513309488');
INSERT INTO `clt_feast_element` VALUES ('4', '2', '主页右上角铃铛', '#body-top-right{position: fixed;top: 0;right:0;z-index: 100;}\n#body-top-right img{width: 120px;}', ' $(\"body\").append(\"<div id=body-top-right><img src=/static/feast/christmas/body-top-right.png></div>\");', '4', '1', '1513309568');
INSERT INTO `clt_feast_element` VALUES ('5', '2', '主页左中部圣诞老人', '#body-left-center{position: fixed;top: 300px;left: 0;z-index: 100;}\n#body-left-center img{width: 220px;}', '$(\"body\").append(\"<div id=body-left-center><img src=/static/feast/christmas/body-left-center.png></div>\");', '5', '1', '1513309625');
INSERT INTO `clt_feast_element` VALUES ('6', '2', '下载栏树叶', '.rfeatured-box{position: relative;}\n#right-one-top-right img{width: 60px;}\n#right-one-top-right{position: absolute;top: 0;right: -10px;}', ' $(\".featured-box\").append(\"<div id=right-one-top-right><img src=/static/feast/christmas/right-one-top-right.png></div>\");', '6', '1', '1513309980');
INSERT INTO `clt_feast_element` VALUES ('7', '2', '导航栏雪景', 'header{position: relative;}\n#nav-bg img{}\n#nav-bg{position: absolute;bottom: -15px;height:30px;left: 0;width: 100%;background: url(\"/static/feast/christmas/nav-bg.png\")repeat-x; z-index:50}', '$(\"header\").append(\"<div id=nav-bg><img src=/static/feast/christmas/nav-bg.png></div>\");', '7', '1', '1513310236');
INSERT INTO `clt_feast_element` VALUES ('8', '2', '主页背景', 'body{background: url(\"/static/feast/christmas/zbg.png\") no-repeat 100% 100%;background-size: 100%;}', '', '50', '1', '1513310497');
INSERT INTO `clt_feast_element` VALUES ('10', '3', '主页左下角房子', '#body-left-bottom{position: fixed;bottom: 0;left:0;}\n#body-left-bottom img{width: 200px;}', ' $(\"body\").append(\"<div id=body-left-bottom><img src=/static/feast/zhongqiu/body-left-bottom.png></div>\");', '50', '1', '1513320275');
INSERT INTO `clt_feast_element` VALUES ('11', '3', '左上角文字', '#body-top-left{position: fixed;top:0;left0;z-index: 100;}\n#body-top-left img{width: 350px;}', ' $(\"body\").append(\"<div id=body-top-left><img src=/static/feast/zhongqiu/body-top-left.png?111></div>\");', '50', '1', '1513320569');
INSERT INTO `clt_feast_element` VALUES ('12', '3', '右上角嫦娥', '#body-top-right{position: fixed;top: 0;right:0;z-index: 100;}\n#body-top-right img{width: 300px;}', ' $(\"body\").append(\"<div id=body-top-right><img src=/static/feast/zhongqiu/body-top-right.png></div>\");', '50', '1', '1513321010');
INSERT INTO `clt_feast_element` VALUES ('13', '4', '右上角喜鹊', '#body-top-right{position: fixed;top: 0;right:0;z-index: 100;}\n#body-top-right img{width: 300px;}', ' $(\"body\").append(\"<div id=body-top-right><img src=/static/feast/qixi/bird.png></div>\");', '1', '1', '1528689869');

-- ----------------------------
-- Table structure for `clt_field`
-- ----------------------------
DROP TABLE IF EXISTS `clt_field`;
CREATE TABLE `clt_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `tips` varchar(150) NOT NULL DEFAULT '',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL DEFAULT '',
  `errormsg` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `setup` text,
  `ispost` tinyint(1) NOT NULL DEFAULT '0',
  `unpostgroup` varchar(60) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_field
-- ----------------------------
INSERT INTO `clt_field` VALUES ('1', '1', 'title', '标题', '', '1', '1', '80', 'defaul', '标题必须为1-80个字符', 'title', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n)', '1', '', '1', '1', '1');
INSERT INTO `clt_field` VALUES ('2', '1', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '8', '0', '0');
INSERT INTO `clt_field` VALUES ('3', '1', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', '', 'datetime', '', '1', '', '97', '1', '1');
INSERT INTO `clt_field` VALUES ('4', '1', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '', '1', '', '99', '1', '1');
INSERT INTO `clt_field` VALUES ('5', '1', 'status', '状态', '', '0', '0', '0', 'defaul', '', 'status', 'radio', 'array (\n  \'options\' => \'发布|1\n定时发布|0\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'default\' => \'1\',\n)', '0', '', '98', '1', '1');
INSERT INTO `clt_field` VALUES ('6', '1', 'content', '内容', '', '1', '0', '0', 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'UEditor\',\n)', '0', '', '3', '1', '0');
INSERT INTO `clt_field` VALUES ('7', '2', 'catid', '栏目', '', '1', '1', '6', '', '必须选择一个栏目', '', 'catid', '', '1', '', '1', '1', '1');
INSERT INTO `clt_field` VALUES ('8', '2', 'title', '标题', '', '1', '1', '80', 'defaul', '标题必须为1-80个字符', 'title', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n)', '1', '', '2', '1', '1');
INSERT INTO `clt_field` VALUES ('9', '2', 'keywords', '关键词', '', '0', '0', '80', '', '', '', 'text', 'array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '1', '', '3', '1', '1');
INSERT INTO `clt_field` VALUES ('10', '2', 'description', 'SEO简介', '', '0', '0', '0', '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)', '1', '', '4', '1', '1');
INSERT INTO `clt_field` VALUES ('11', '2', 'content', '内容', '', '0', '0', '0', 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'layedit\',\n)', '1', '', '5', '1', '1');
INSERT INTO `clt_field` VALUES ('12', '2', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', 'createtime', 'datetime', '', '1', '', '6', '1', '1');
INSERT INTO `clt_field` VALUES ('13', '2', 'recommend', '允许评论', '', '0', '0', '1', '', '', '', 'radio', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)', '1', '', '10', '0', '0');
INSERT INTO `clt_field` VALUES ('14', '2', 'readpoint', '阅读收费', '', '0', '0', '5', '', '', '', 'number', 'array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '11', '0', '0');
INSERT INTO `clt_field` VALUES ('15', '2', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '12', '1', '0');
INSERT INTO `clt_field` VALUES ('16', '2', 'readgroup', '访问权限', '', '0', '0', '0', '', '', '', 'groupid', 'array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)', '1', '', '13', '1', '1');
INSERT INTO `clt_field` VALUES ('17', '2', 'posid', '推荐位', '', '0', '0', '0', '', '', '', 'posid', '', '1', '', '14', '1', '1');
INSERT INTO `clt_field` VALUES ('18', '2', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '', '1', '', '15', '1', '1');
INSERT INTO `clt_field` VALUES ('19', '2', 'status', '状态', '', '0', '0', '0', 'defaul', '', 'status', 'radio', 'array (\n  \'options\' => \'发布|1\n定时发布|2\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'default\' => \'1\',\n)', '1', '', '7', '1', '1');
INSERT INTO `clt_field` VALUES ('20', '3', 'catid', '栏目', '', '1', '1', '6', '', '必须选择一个栏目', '', 'catid', '', '1', '', '1', '1', '1');
INSERT INTO `clt_field` VALUES ('21', '3', 'title', '标题', '', '1', '1', '80', 'defaul', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'0\',\n  \'style\' => \'0\',\n)', '1', '', '2', '1', '1');
INSERT INTO `clt_field` VALUES ('22', '3', 'keywords', '关键词', '', '0', '0', '80', '', '', '', 'text', 'array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '1', '', '3', '1', '1');
INSERT INTO `clt_field` VALUES ('23', '3', 'description', 'SEO简介', '', '0', '0', '0', '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)', '1', '', '4', '1', '1');
INSERT INTO `clt_field` VALUES ('24', '3', 'content', '内容', '', '0', '0', '0', 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'layedit\',\n)', '1', '', '7', '1', '1');
INSERT INTO `clt_field` VALUES ('25', '3', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', '', 'datetime', '', '1', '', '8', '1', '1');
INSERT INTO `clt_field` VALUES ('26', '3', 'recommend', '允许评论', '', '0', '0', '1', '', '', '', 'radio', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)', '1', '', '10', '0', '0');
INSERT INTO `clt_field` VALUES ('27', '3', 'readpoint', '阅读收费', '', '0', '0', '5', '', '', '', 'number', 'array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '11', '0', '0');
INSERT INTO `clt_field` VALUES ('28', '3', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '12', '0', '0');
INSERT INTO `clt_field` VALUES ('29', '3', 'readgroup', '访问权限', '', '0', '0', '0', '', '', '', 'groupid', 'array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)', '1', '', '13', '0', '1');
INSERT INTO `clt_field` VALUES ('30', '3', 'posid', '推荐位', '', '0', '0', '0', '', '', '', 'posid', '', '1', '', '14', '1', '1');
INSERT INTO `clt_field` VALUES ('31', '3', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '', '1', '', '15', '1', '1');
INSERT INTO `clt_field` VALUES ('32', '3', 'status', '状态', '', '0', '0', '0', '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', '1', '', '9', '1', '1');
INSERT INTO `clt_field` VALUES ('33', '3', 'pic', '图片', '', '1', '0', '0', 'defaul', '', 'pic', 'image', '', '0', '', '5', '1', '0');
INSERT INTO `clt_field` VALUES ('34', '3', 'group', '类型', '', '1', '0', '0', 'defaul', '', 'group', 'select', 'array (\n  \'options\' => \'模型管理|1\n分类管理|2\n内容管理|3\',\n  \'multiple\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'size\' => \'\',\n  \'default\' => \'\',\n)', '0', '', '6', '1', '0');
INSERT INTO `clt_field` VALUES ('35', '4', 'catid', '栏目', '', '1', '1', '6', '', '必须选择一个栏目', '', 'catid', '', '1', '', '1', '1', '1');
INSERT INTO `clt_field` VALUES ('36', '4', 'title', '标题', '', '1', '1', '80', '', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)', '1', '', '2', '1', '1');
INSERT INTO `clt_field` VALUES ('37', '4', 'keywords', '关键词', '', '0', '0', '80', '', '', '', 'text', 'array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '1', '', '3', '1', '1');
INSERT INTO `clt_field` VALUES ('38', '4', 'description', 'SEO简介', '', '0', '0', '0', '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)', '1', '', '4', '1', '1');
INSERT INTO `clt_field` VALUES ('39', '4', 'content', '内容', '', '0', '0', '0', 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'layedit\',\n)', '1', '', '8', '1', '1');
INSERT INTO `clt_field` VALUES ('40', '4', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', '', 'datetime', '', '1', '', '9', '1', '1');
INSERT INTO `clt_field` VALUES ('41', '4', 'status', '状态', '', '0', '0', '0', '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', '1', '', '10', '1', '1');
INSERT INTO `clt_field` VALUES ('42', '4', 'recommend', '允许评论', '', '0', '0', '1', '', '', '', 'radio', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)', '1', '', '11', '0', '0');
INSERT INTO `clt_field` VALUES ('43', '4', 'readpoint', '阅读收费', '', '0', '0', '5', '', '', '', 'number', 'array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '12', '0', '0');
INSERT INTO `clt_field` VALUES ('44', '4', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '13', '0', '0');
INSERT INTO `clt_field` VALUES ('45', '4', 'readgroup', '访问权限', '', '0', '0', '0', '', '', '', 'groupid', 'array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)', '1', '', '14', '0', '1');
INSERT INTO `clt_field` VALUES ('46', '4', 'posid', '推荐位', '', '0', '0', '0', '', '', '', 'posid', '', '1', '', '15', '1', '1');
INSERT INTO `clt_field` VALUES ('47', '4', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '', '1', '', '16', '1', '1');
INSERT INTO `clt_field` VALUES ('48', '4', 'price', '价格', '', '1', '0', '0', 'defaul', '', 'price', 'number', 'array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'2\',\n  \'default\' => \'0.00\',\n)', '0', '', '5', '1', '0');
INSERT INTO `clt_field` VALUES ('49', '4', 'xinghao', '型号', '', '0', '0', '0', 'defaul', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '0', '', '6', '1', '0');
INSERT INTO `clt_field` VALUES ('50', '4', 'pics', '图组', '', '0', '0', '0', 'defaul', '', 'pics', 'images', '', '0', '', '7', '1', '0');
INSERT INTO `clt_field` VALUES ('51', '5', 'catid', '栏目', '', '1', '1', '6', '', '必须选择一个栏目', '', 'catid', '', '1', '', '1', '1', '1');
INSERT INTO `clt_field` VALUES ('52', '5', 'title', '标题', '', '1', '1', '80', '', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)', '1', '', '2', '1', '1');
INSERT INTO `clt_field` VALUES ('53', '5', 'keywords', '关键词', '', '0', '0', '80', '', '', '', 'text', 'array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '1', '', '3', '1', '1');
INSERT INTO `clt_field` VALUES ('54', '5', 'description', 'SEO简介', '', '0', '0', '0', '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)', '1', '', '4', '1', '1');
INSERT INTO `clt_field` VALUES ('55', '5', 'content', '内容', '', '0', '0', '0', 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'layedit\',\n)', '1', '', '9', '1', '1');
INSERT INTO `clt_field` VALUES ('56', '5', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', 'createtime', 'datetime', '', '1', '', '10', '1', '1');
INSERT INTO `clt_field` VALUES ('57', '5', 'status', '状态', '', '0', '0', '0', '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', '1', '', '11', '1', '1');
INSERT INTO `clt_field` VALUES ('58', '5', 'recommend', '允许评论', '', '0', '0', '1', '', '', '', 'radio', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)', '1', '', '12', '0', '0');
INSERT INTO `clt_field` VALUES ('59', '5', 'readpoint', '阅读收费', '', '0', '0', '5', '', '', '', 'number', 'array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '13', '0', '0');
INSERT INTO `clt_field` VALUES ('60', '5', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '14', '0', '0');
INSERT INTO `clt_field` VALUES ('61', '5', 'readgroup', '访问权限', '', '0', '0', '0', '', '', '', 'groupid', 'array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)', '1', '', '15', '0', '1');
INSERT INTO `clt_field` VALUES ('62', '5', 'posid', '推荐位', '', '0', '0', '0', '', '', '', 'posid', '', '1', '', '16', '1', '1');
INSERT INTO `clt_field` VALUES ('63', '5', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '', '1', '', '17', '1', '1');
INSERT INTO `clt_field` VALUES ('64', '5', 'files', '上传文件', '', '0', '0', '0', 'defaul', '', 'files', 'file', 'array (\n  \'upload_allowext\' => \'zip,rar,doc,ppt\',\n)', '0', '', '5', '1', '0');
INSERT INTO `clt_field` VALUES ('65', '5', 'ext', '文档类型', '', '0', '0', '0', 'defaul', '', 'ext', 'text', 'array (\n  \'default\' => \'zip\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '0', '', '6', '1', '0');
INSERT INTO `clt_field` VALUES ('66', '5', 'size', '文档大小', '', '0', '0', '0', 'defaul', '', 'size', 'text', 'array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '0', '', '7', '1', '0');
INSERT INTO `clt_field` VALUES ('67', '5', 'downs', '下载次数', '', '0', '0', '0', 'defaul', '', '', 'number', 'array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', '0', '', '8', '1', '0');
INSERT INTO `clt_field` VALUES ('68', '6', 'title', '标题', '', '1', '1', '80', '', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)', '1', '', '2', '1', '1');
INSERT INTO `clt_field` VALUES ('69', '6', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '6', '0', '0');
INSERT INTO `clt_field` VALUES ('70', '6', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', '', 'datetime', '', '1', '', '4', '1', '1');
INSERT INTO `clt_field` VALUES ('71', '6', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '', '1', '', '7', '1', '1');
INSERT INTO `clt_field` VALUES ('72', '6', 'status', '状态', '', '0', '0', '0', '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', '1', '', '5', '1', '1');
INSERT INTO `clt_field` VALUES ('73', '6', 'catid', '分类', '', '1', '0', '0', 'defaul', '', 'catid', 'catid', '', '0', '', '1', '1', '0');
INSERT INTO `clt_field` VALUES ('74', '6', 'info', '简介', '', '1', '0', '0', 'defaul', '', 'info', 'editor', 'array (\n  \'edittype\' => \'layedit\',\n)', '0', '', '3', '1', '0');
INSERT INTO `clt_field` VALUES ('75', '2', 'copyfrom', '来源', '', '0', '0', '0', 'defaul', '', 'copyfrom', 'text', 'array (\n  \'default\' => \'CLTPHP\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '0', '', '8', '1', '0');
INSERT INTO `clt_field` VALUES ('76', '2', 'fromlink', '来源网址', '', '0', '0', '0', 'defaul', '', 'fromlink', 'text', 'array (\n  \'default\' => \'http://www.cltphp.com/\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '0', '', '9', '1', '0');
INSERT INTO `clt_field` VALUES ('116', '19', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '8', '0', '0');
INSERT INTO `clt_field` VALUES ('115', '19', 'title', '标题', '', '1', '1', '80', '', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)', '1', '', '2', '1', '1');
INSERT INTO `clt_field` VALUES ('118', '19', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '', '1', '', '99', '1', '1');
INSERT INTO `clt_field` VALUES ('119', '19', 'status', '状态', '', '0', '0', '0', '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', '1', '', '98', '1', '1');
INSERT INTO `clt_field` VALUES ('117', '19', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', 'createtime', 'datetime', '', '1', '', '97', '1', '1');

-- ----------------------------
-- Table structure for `clt_link`
-- ----------------------------
DROP TABLE IF EXISTS `clt_link`;
CREATE TABLE `clt_link` (
  `link_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '链接名称',
  `url` varchar(200) NOT NULL COMMENT '链接URL',
  `type_id` tinyint(4) DEFAULT NULL COMMENT '所属栏目ID',
  `qq` varchar(20) NOT NULL COMMENT '联系QQ',
  `sort` int(5) NOT NULL DEFAULT '50' COMMENT '排序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0禁用1启用',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_link
-- ----------------------------
INSERT INTO `clt_link` VALUES ('10', '成都唯意装修', 'http://www.cdwyzx.com/', '0', '416148489', '1', '1495183645', '1');

-- ----------------------------
-- Table structure for `clt_message`
-- ----------------------------
DROP TABLE IF EXISTS `clt_message`;
CREATE TABLE `clt_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT '' COMMENT '留言标题',
  `tel` varchar(15) NOT NULL DEFAULT '' COMMENT '留言电话',
  `addtime` varchar(15) NOT NULL COMMENT '留言时间',
  `open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1=审核 0=不审核',
  `ip` varchar(50) DEFAULT '' COMMENT '留言者IP',
  `content` longtext NOT NULL COMMENT '留言内容',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(50) NOT NULL COMMENT '留言邮箱',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_message
-- ----------------------------
INSERT INTO `clt_message` VALUES ('92', '呵呵', '', '1528851199', '0', '127.0.0.1', '4123', 'chichu', '1109305987@qq.com');
INSERT INTO `clt_message` VALUES ('93', '11', '', '1530629400', '0', '127.0.0.1', '11', '11', '11');
INSERT INTO `clt_message` VALUES ('94', '11', '', '1530777448', '0', '127.0.0.1', '11', '11', '11');

-- ----------------------------
-- Table structure for `clt_module`
-- ----------------------------
DROP TABLE IF EXISTS `clt_module`;
CREATE TABLE `clt_module` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listfields` varchar(255) NOT NULL DEFAULT '',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_module
-- ----------------------------
INSERT INTO `clt_module` VALUES ('1', '单页模型', 'page', '单页面', '1', '0', '*', '0', '1');
INSERT INTO `clt_module` VALUES ('2', '文章模型', 'article', '新闻文章', '1', '0', '*', '0', '1');
INSERT INTO `clt_module` VALUES ('3', '图片模型', 'picture', '图片展示', '1', '0', '*', '0', '1');
INSERT INTO `clt_module` VALUES ('4', '产品模型', 'product', '产品展示', '1', '0', '*', '0', '1');
INSERT INTO `clt_module` VALUES ('5', '下载模型', 'download', '文件下载', '1', '0', '*', '0', '1');
INSERT INTO `clt_module` VALUES ('6', '团队模型', 'team', '员工展示', '1', '0', '*', '0', '1');
INSERT INTO `clt_module` VALUES ('19', 'test', 'test', '', '1', '0', '*', '0', '1');

-- ----------------------------
-- Table structure for `clt_oauth`
-- ----------------------------
DROP TABLE IF EXISTS `clt_oauth`;
CREATE TABLE `clt_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `type` varchar(50) DEFAULT NULL COMMENT '账号类型',
  `openid` varchar(120) DEFAULT NULL COMMENT '第三方唯一标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for `clt_page`
-- ----------------------------
DROP TABLE IF EXISTS `clt_page`;
CREATE TABLE `clt_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '1',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `template` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_page
-- ----------------------------
INSERT INTO `clt_page` VALUES ('2', '唯意装饰', 'color:rgb(95, 184, 120);font-weight:bold;', '/uploads/20180611/b78388d0d1b123e06d900c4d1a1d88ba.jpg', '30', '1', '0', '', '0', '1504251653', '0', '0', '<p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \"><a href=\"http://www.cltphp.com/\" target=\"_blank\" title=\"CLTPHP内容管理系统\" style=\"color: rgb(146, 208, 80); text-decoration: none;\"><span style=\"color: rgb(146, 208, 80);\">CLTPHP内容管理系统</span></a>，包含系统设置，权限管理，模型管理，数据库管理，栏目管理，会员管理，网站功能，模版管理，微信管理等相关模块。基于ThinkPHP5开发，后台采用Layui框架完全自适应，数据交互采用更高效简洁的angularjs实现，。</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(151, 151, 151); white-space: normal; background-color: rgb(255, 255, 255);\">　　<a target=\"_blank\" href=\"http://www.cltphp.com/\" style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; outline: 0px; color: rgb(146, 208, 80); text-decoration: none;\"><span style=\"color: rgb(146, 208, 80);\">CLTPHP</span></a>采用ThinkPHP开发，ThinkPHP5采用全新的架构思想，引入了很多的PHP新特性，优化了核心，减少了依赖，实现了真正的惰性加载。正因为ThinkPHP的这些新特性，从而使得CLTPHP的执行速度成倍提高。</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px;\">　　UI方面，<a target=\"_blank\" href=\"http://www.cltphp.com/\" style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; outline: 0px; color: rgb(146, 208, 80); text-decoration: none;\"><span style=\"color: rgb(146, 208, 80);\">CLTPHP</span></a>采用了最受欢迎的Layui，Layui用于开发响应式布局、移动设备优先的 WEB 项目。简洁、直观、强悍的前端开发框架，让CLTPHP的后台界面更加美观，开发更迅速、简单。</p>', '0');
INSERT INTO `clt_page` VALUES ('8', '唯意装饰', 'color:;font-weight:normal;', '', '10', '1', '0', '', '0', '1499765407', '0', '0', '<p>您的支持是我们一往无前的无限动力，非常荣幸在<a target=\"_self\" href=\"http://www.cltphp.com/\">CLTPHP</a>成长的道路上有您的陪伴！！！</p>', '');

-- ----------------------------
-- Table structure for `clt_picture`
-- ----------------------------
DROP TABLE IF EXISTS `clt_picture`;
CREATE TABLE `clt_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(80) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `pic` varchar(80) NOT NULL DEFAULT '',
  `group` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`id`,`status`,`sort`),
  KEY `catid` (`id`,`catid`,`status`),
  KEY `listorder` (`id`,`catid`,`status`,`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_picture
-- ----------------------------
INSERT INTO `clt_picture` VALUES ('1', '4', '1', 'admin', '模型列表', '模型列表', '展示网站内容模型，模型是CLTPHP的核心之一。', '<p>展示内容</p>', '0', '0', '1', '0', '', '0', '1', '1', '1499761915', '1528699234', '/uploads/20180611/0ce39ef421e7ca7149b2630d93b571ee.png', '1');
INSERT INTO `clt_picture` VALUES ('2', '4', '1', 'admin', '添加模型', '添加模型', '添加模型', '<p>不拘泥于传统。</p>', '0', '0', '1', '0', '', '0', '2', '0', '1499762188', '1528699288', '/uploads/20180611/e41226ad6f977aeb2418a0f55a0678ef.png', '1');
INSERT INTO `clt_picture` VALUES ('3', '4', '1', 'admin', '模型字段', '模型字段', '模型字段', '<p>高效编辑。</p>', '0', '0', '1', '0', '', '0', '3', '0', '1499762270', '1528699324', '/uploads/20180611/57027c6ab845effea600f6f9695e2db4.png', '1');
INSERT INTO `clt_picture` VALUES ('4', '4', '1', 'admin', '添加字段', '添加字段', '添加字段', '<p>扩展类型。</p>', '0', '0', '1', '0', '', '0', '4', '0', '1499762323', '1528699410', '/uploads/20180611/85f128c3c9488a41b04386e31199ab3f.png', '1');
INSERT INTO `clt_picture` VALUES ('5', '4', '1', 'admin', '栏目列表', '栏目列表', '栏目列表', '<p>展示分明。</p>', '0', '0', '1', '0', '', '0', '5', '0', '1499762369', '1528699472', '/uploads/20180611/2b6456d6725ce4ad1a8dd66b595f1eb9.png', '2');
INSERT INTO `clt_picture` VALUES ('6', '4', '1', 'admin', '添加栏目', '添加栏目', '添加栏目', '<p>绑定模型</p>', '0', '0', '1', '0', '', '0', '6', '0', '1499762446', '1528699568', '/uploads/20180611/953235f4e44df6dd63de15bb28ea0bc5.png', '2');
INSERT INTO `clt_picture` VALUES ('7', '4', '1', 'admin', '内容列表', '内容列表', '内容列表', '<p>简洁而高效</p>', '0', '0', '1', '0', '', '0', '7', '0', '1499762523', '1528699605', '/uploads/20180611/fb3193674fb2ea68f2a61d4de0859a0e.png', '3');
INSERT INTO `clt_picture` VALUES ('8', '4', '1', 'admin', '添加内容', '添加内容', '添加内容', '<p>智能</p>', '0', '0', '1', '0', '', '0', '8', '0', '1499762754', '1528699629', '/uploads/20180611/ef322c904a47681d32aa4338316bac18.png', '3');

-- ----------------------------
-- Table structure for `clt_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `clt_plugin`;
CREATE TABLE `clt_plugin` (
  `code` varchar(13) DEFAULT NULL COMMENT '插件编码',
  `name` varchar(55) DEFAULT NULL COMMENT '中文名字',
  `version` varchar(255) DEFAULT NULL COMMENT '插件的版本',
  `author` varchar(30) DEFAULT NULL COMMENT '插件作者',
  `config` text COMMENT '配置信息',
  `config_value` text COMMENT '配置值信息',
  `desc` varchar(255) DEFAULT NULL COMMENT '插件描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  `type` varchar(50) DEFAULT NULL COMMENT '插件类型 payment支付 login 登陆 shipping物流',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `bank_code` text COMMENT '网银配置信息',
  `scene` tinyint(1) DEFAULT '0' COMMENT '使用场景 0 PC+手机 1 手机 2 PC'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_plugin
-- ----------------------------
INSERT INTO `clt_plugin` VALUES ('qq', 'QQ登陆', '1.0', 'CLTPHP', 'a:5:{i:0;a:4:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:5:\"appid\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:6:\"appkey\";s:5:\"label\";s:6:\"appkey\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:8:\"callback\";s:5:\"label\";s:12:\"回调地址\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:37:\"http://cltdemo.test/index/callback/qq\";}i:3;a:4:{s:4:\"name\";s:5:\"scope\";s:5:\"label\";s:12:\"获取字段\";s:4:\"type\";s:8:\"textarea\";s:5:\"value\";s:225:\"get_user_info,add_share,list_album,add_album,upload_pic,add_topic,add_one_blog,add_weibo,check_page_fans,add_t,add_pic_t,del_t,get_repost_list,get_info,get_other_info,get_fanslist,get_idolist,add_idol,del_idol,get_tenpay_addr\";}i:4;a:4:{s:4:\"name\";s:11:\"errorReport\";s:5:\"label\";s:12:\"错误报告\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:4:\"true\";}}', 'a:5:{s:5:\"appid\";s:0:\"\";s:6:\"appkey\";s:0:\"\";s:8:\"callback\";s:37:\"http://cltdemo.test/index/callback/qq\";s:5:\"scope\";s:225:\"get_user_info,add_share,list_album,add_album,upload_pic,add_topic,add_one_blog,add_weibo,check_page_fans,add_t,add_pic_t,del_t,get_repost_list,get_info,get_other_info,get_fanslist,get_idolist,add_idol,del_idol,get_tenpay_addr\";s:11:\"errorReport\";s:4:\"true\";}', 'QQ登陆插件 ', '1', 'login', 'logo.png', 's:0:\"\";', '0');
INSERT INTO `clt_plugin` VALUES ('changyan', '畅言评论', '1.0', 'CLTPHP', 'a:3:{i:0;a:4:{s:4:\"name\";s:6:\"app_id\";s:5:\"label\";s:6:\"app_id\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:7:\"app_key\";s:5:\"label\";s:7:\"app_key\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:6:\"config\";s:5:\"label\";s:6:\"config\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}', 'a:8:{s:5:\"appid\";s:0:\"\";s:6:\"appkey\";s:0:\"\";s:8:\"callback\";s:37:\"http://cltdemo.test/index/callback/qq\";s:5:\"scope\";s:225:\"get_user_info,add_share,list_album,add_album,upload_pic,add_topic,add_one_blog,add_weibo,check_page_fans,add_t,add_pic_t,del_t,get_repost_list,get_info,get_other_info,get_fanslist,get_idolist,add_idol,del_idol,get_tenpay_addr\";s:11:\"errorReport\";s:4:\"true\";s:6:\"app_id\";s:0:\"\";s:7:\"app_key\";s:0:\"\";s:6:\"config\";s:0:\"\";}', '畅言评论插件 ', '1', 'msg', 'logo.png', 's:0:\"\";', '0');

-- ----------------------------
-- Table structure for `clt_posid`
-- ----------------------------
DROP TABLE IF EXISTS `clt_posid`;
CREATE TABLE `clt_posid` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `sort` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_posid
-- ----------------------------
INSERT INTO `clt_posid` VALUES ('1', '首页推荐', '0');
INSERT INTO `clt_posid` VALUES ('2', '当前分类推荐', '0');

-- ----------------------------
-- Table structure for `clt_product`
-- ----------------------------
DROP TABLE IF EXISTS `clt_product`;
CREATE TABLE `clt_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `xinghao` varchar(255) NOT NULL DEFAULT '',
  `pics` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`id`,`status`,`sort`),
  KEY `catid` (`id`,`catid`,`status`),
  KEY `listorder` (`id`,`catid`,`status`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_product
-- ----------------------------

-- ----------------------------
-- Table structure for `clt_region`
-- ----------------------------
DROP TABLE IF EXISTS `clt_region`;
CREATE TABLE `clt_region` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3410 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_region
-- ----------------------------
INSERT INTO `clt_region` VALUES ('1', '0', '中国', '0');
INSERT INTO `clt_region` VALUES ('2', '1', '北京', '1');
INSERT INTO `clt_region` VALUES ('3', '1', '安徽', '1');
INSERT INTO `clt_region` VALUES ('4', '1', '福建', '1');
INSERT INTO `clt_region` VALUES ('5', '1', '甘肃', '1');
INSERT INTO `clt_region` VALUES ('6', '1', '广东', '1');
INSERT INTO `clt_region` VALUES ('7', '1', '广西', '1');
INSERT INTO `clt_region` VALUES ('8', '1', '贵州', '1');
INSERT INTO `clt_region` VALUES ('9', '1', '海南', '1');
INSERT INTO `clt_region` VALUES ('10', '1', '河北', '1');
INSERT INTO `clt_region` VALUES ('11', '1', '河南', '1');
INSERT INTO `clt_region` VALUES ('12', '1', '黑龙江', '1');
INSERT INTO `clt_region` VALUES ('13', '1', '湖北', '1');
INSERT INTO `clt_region` VALUES ('14', '1', '湖南', '1');
INSERT INTO `clt_region` VALUES ('15', '1', '吉林', '1');
INSERT INTO `clt_region` VALUES ('16', '1', '江苏', '1');
INSERT INTO `clt_region` VALUES ('17', '1', '江西', '1');
INSERT INTO `clt_region` VALUES ('18', '1', '辽宁', '1');
INSERT INTO `clt_region` VALUES ('19', '1', '内蒙古', '1');
INSERT INTO `clt_region` VALUES ('20', '1', '宁夏', '1');
INSERT INTO `clt_region` VALUES ('21', '1', '青海', '1');
INSERT INTO `clt_region` VALUES ('22', '1', '山东', '1');
INSERT INTO `clt_region` VALUES ('23', '1', '山西', '1');
INSERT INTO `clt_region` VALUES ('24', '1', '陕西', '1');
INSERT INTO `clt_region` VALUES ('25', '1', '上海', '1');
INSERT INTO `clt_region` VALUES ('26', '1', '四川', '1');
INSERT INTO `clt_region` VALUES ('27', '1', '天津', '1');
INSERT INTO `clt_region` VALUES ('28', '1', '西藏', '1');
INSERT INTO `clt_region` VALUES ('29', '1', '新疆', '1');
INSERT INTO `clt_region` VALUES ('30', '1', '云南', '1');
INSERT INTO `clt_region` VALUES ('31', '1', '浙江', '1');
INSERT INTO `clt_region` VALUES ('32', '1', '重庆', '1');
INSERT INTO `clt_region` VALUES ('33', '1', '香港', '1');
INSERT INTO `clt_region` VALUES ('34', '1', '澳门', '1');
INSERT INTO `clt_region` VALUES ('35', '1', '台湾', '1');
INSERT INTO `clt_region` VALUES ('36', '3', '安庆', '2');
INSERT INTO `clt_region` VALUES ('37', '3', '蚌埠', '2');
INSERT INTO `clt_region` VALUES ('38', '3', '巢湖', '2');
INSERT INTO `clt_region` VALUES ('39', '3', '池州', '2');
INSERT INTO `clt_region` VALUES ('40', '3', '滁州', '2');
INSERT INTO `clt_region` VALUES ('41', '3', '阜阳', '2');
INSERT INTO `clt_region` VALUES ('42', '3', '淮北', '2');
INSERT INTO `clt_region` VALUES ('43', '3', '淮南', '2');
INSERT INTO `clt_region` VALUES ('44', '3', '黄山', '2');
INSERT INTO `clt_region` VALUES ('45', '3', '六安', '2');
INSERT INTO `clt_region` VALUES ('46', '3', '马鞍山', '2');
INSERT INTO `clt_region` VALUES ('47', '3', '宿州', '2');
INSERT INTO `clt_region` VALUES ('48', '3', '铜陵', '2');
INSERT INTO `clt_region` VALUES ('49', '3', '芜湖', '2');
INSERT INTO `clt_region` VALUES ('50', '3', '宣城', '2');
INSERT INTO `clt_region` VALUES ('51', '3', '亳州', '2');
INSERT INTO `clt_region` VALUES ('52', '2', '北京', '2');
INSERT INTO `clt_region` VALUES ('53', '4', '福州', '2');
INSERT INTO `clt_region` VALUES ('54', '4', '龙岩', '2');
INSERT INTO `clt_region` VALUES ('55', '4', '南平', '2');
INSERT INTO `clt_region` VALUES ('56', '4', '宁德', '2');
INSERT INTO `clt_region` VALUES ('57', '4', '莆田', '2');
INSERT INTO `clt_region` VALUES ('58', '4', '泉州', '2');
INSERT INTO `clt_region` VALUES ('59', '4', '三明', '2');
INSERT INTO `clt_region` VALUES ('60', '4', '厦门', '2');
INSERT INTO `clt_region` VALUES ('61', '4', '漳州', '2');
INSERT INTO `clt_region` VALUES ('62', '5', '兰州', '2');
INSERT INTO `clt_region` VALUES ('63', '5', '白银', '2');
INSERT INTO `clt_region` VALUES ('64', '5', '定西', '2');
INSERT INTO `clt_region` VALUES ('65', '5', '甘南', '2');
INSERT INTO `clt_region` VALUES ('66', '5', '嘉峪关', '2');
INSERT INTO `clt_region` VALUES ('67', '5', '金昌', '2');
INSERT INTO `clt_region` VALUES ('68', '5', '酒泉', '2');
INSERT INTO `clt_region` VALUES ('69', '5', '临夏', '2');
INSERT INTO `clt_region` VALUES ('70', '5', '陇南', '2');
INSERT INTO `clt_region` VALUES ('71', '5', '平凉', '2');
INSERT INTO `clt_region` VALUES ('72', '5', '庆阳', '2');
INSERT INTO `clt_region` VALUES ('73', '5', '天水', '2');
INSERT INTO `clt_region` VALUES ('74', '5', '武威', '2');
INSERT INTO `clt_region` VALUES ('75', '5', '张掖', '2');
INSERT INTO `clt_region` VALUES ('76', '6', '广州', '2');
INSERT INTO `clt_region` VALUES ('77', '6', '深圳', '2');
INSERT INTO `clt_region` VALUES ('78', '6', '潮州', '2');
INSERT INTO `clt_region` VALUES ('79', '6', '东莞', '2');
INSERT INTO `clt_region` VALUES ('80', '6', '佛山', '2');
INSERT INTO `clt_region` VALUES ('81', '6', '河源', '2');
INSERT INTO `clt_region` VALUES ('82', '6', '惠州', '2');
INSERT INTO `clt_region` VALUES ('83', '6', '江门', '2');
INSERT INTO `clt_region` VALUES ('84', '6', '揭阳', '2');
INSERT INTO `clt_region` VALUES ('85', '6', '茂名', '2');
INSERT INTO `clt_region` VALUES ('86', '6', '梅州', '2');
INSERT INTO `clt_region` VALUES ('87', '6', '清远', '2');
INSERT INTO `clt_region` VALUES ('88', '6', '汕头', '2');
INSERT INTO `clt_region` VALUES ('89', '6', '汕尾', '2');
INSERT INTO `clt_region` VALUES ('90', '6', '韶关', '2');
INSERT INTO `clt_region` VALUES ('91', '6', '阳江', '2');
INSERT INTO `clt_region` VALUES ('92', '6', '云浮', '2');
INSERT INTO `clt_region` VALUES ('93', '6', '湛江', '2');
INSERT INTO `clt_region` VALUES ('94', '6', '肇庆', '2');
INSERT INTO `clt_region` VALUES ('95', '6', '中山', '2');
INSERT INTO `clt_region` VALUES ('96', '6', '珠海', '2');
INSERT INTO `clt_region` VALUES ('97', '7', '南宁', '2');
INSERT INTO `clt_region` VALUES ('98', '7', '桂林', '2');
INSERT INTO `clt_region` VALUES ('99', '7', '百色', '2');
INSERT INTO `clt_region` VALUES ('100', '7', '北海', '2');
INSERT INTO `clt_region` VALUES ('101', '7', '崇左', '2');
INSERT INTO `clt_region` VALUES ('102', '7', '防城港', '2');
INSERT INTO `clt_region` VALUES ('103', '7', '贵港', '2');
INSERT INTO `clt_region` VALUES ('104', '7', '河池', '2');
INSERT INTO `clt_region` VALUES ('105', '7', '贺州', '2');
INSERT INTO `clt_region` VALUES ('106', '7', '来宾', '2');
INSERT INTO `clt_region` VALUES ('107', '7', '柳州', '2');
INSERT INTO `clt_region` VALUES ('108', '7', '钦州', '2');
INSERT INTO `clt_region` VALUES ('109', '7', '梧州', '2');
INSERT INTO `clt_region` VALUES ('110', '7', '玉林', '2');
INSERT INTO `clt_region` VALUES ('111', '8', '贵阳', '2');
INSERT INTO `clt_region` VALUES ('112', '8', '安顺', '2');
INSERT INTO `clt_region` VALUES ('113', '8', '毕节', '2');
INSERT INTO `clt_region` VALUES ('114', '8', '六盘水', '2');
INSERT INTO `clt_region` VALUES ('115', '8', '黔东南', '2');
INSERT INTO `clt_region` VALUES ('116', '8', '黔南', '2');
INSERT INTO `clt_region` VALUES ('117', '8', '黔西南', '2');
INSERT INTO `clt_region` VALUES ('118', '8', '铜仁', '2');
INSERT INTO `clt_region` VALUES ('119', '8', '遵义', '2');
INSERT INTO `clt_region` VALUES ('120', '9', '海口', '2');
INSERT INTO `clt_region` VALUES ('121', '9', '三亚', '2');
INSERT INTO `clt_region` VALUES ('122', '9', '白沙', '2');
INSERT INTO `clt_region` VALUES ('123', '9', '保亭', '2');
INSERT INTO `clt_region` VALUES ('124', '9', '昌江', '2');
INSERT INTO `clt_region` VALUES ('125', '9', '澄迈县', '2');
INSERT INTO `clt_region` VALUES ('126', '9', '定安县', '2');
INSERT INTO `clt_region` VALUES ('127', '9', '东方', '2');
INSERT INTO `clt_region` VALUES ('128', '9', '乐东', '2');
INSERT INTO `clt_region` VALUES ('129', '9', '临高县', '2');
INSERT INTO `clt_region` VALUES ('130', '9', '陵水', '2');
INSERT INTO `clt_region` VALUES ('131', '9', '琼海', '2');
INSERT INTO `clt_region` VALUES ('132', '9', '琼中', '2');
INSERT INTO `clt_region` VALUES ('133', '9', '屯昌县', '2');
INSERT INTO `clt_region` VALUES ('134', '9', '万宁', '2');
INSERT INTO `clt_region` VALUES ('135', '9', '文昌', '2');
INSERT INTO `clt_region` VALUES ('136', '9', '五指山', '2');
INSERT INTO `clt_region` VALUES ('137', '9', '儋州', '2');
INSERT INTO `clt_region` VALUES ('138', '10', '石家庄', '2');
INSERT INTO `clt_region` VALUES ('139', '10', '保定', '2');
INSERT INTO `clt_region` VALUES ('140', '10', '沧州', '2');
INSERT INTO `clt_region` VALUES ('141', '10', '承德', '2');
INSERT INTO `clt_region` VALUES ('142', '10', '邯郸', '2');
INSERT INTO `clt_region` VALUES ('143', '10', '衡水', '2');
INSERT INTO `clt_region` VALUES ('144', '10', '廊坊', '2');
INSERT INTO `clt_region` VALUES ('145', '10', '秦皇岛', '2');
INSERT INTO `clt_region` VALUES ('146', '10', '唐山', '2');
INSERT INTO `clt_region` VALUES ('147', '10', '邢台', '2');
INSERT INTO `clt_region` VALUES ('148', '10', '张家口', '2');
INSERT INTO `clt_region` VALUES ('149', '11', '郑州', '2');
INSERT INTO `clt_region` VALUES ('150', '11', '洛阳', '2');
INSERT INTO `clt_region` VALUES ('151', '11', '开封', '2');
INSERT INTO `clt_region` VALUES ('152', '11', '安阳', '2');
INSERT INTO `clt_region` VALUES ('153', '11', '鹤壁', '2');
INSERT INTO `clt_region` VALUES ('154', '11', '济源', '2');
INSERT INTO `clt_region` VALUES ('155', '11', '焦作', '2');
INSERT INTO `clt_region` VALUES ('156', '11', '南阳', '2');
INSERT INTO `clt_region` VALUES ('157', '11', '平顶山', '2');
INSERT INTO `clt_region` VALUES ('158', '11', '三门峡', '2');
INSERT INTO `clt_region` VALUES ('159', '11', '商丘', '2');
INSERT INTO `clt_region` VALUES ('160', '11', '新乡', '2');
INSERT INTO `clt_region` VALUES ('161', '11', '信阳', '2');
INSERT INTO `clt_region` VALUES ('162', '11', '许昌', '2');
INSERT INTO `clt_region` VALUES ('163', '11', '周口', '2');
INSERT INTO `clt_region` VALUES ('164', '11', '驻马店', '2');
INSERT INTO `clt_region` VALUES ('165', '11', '漯河', '2');
INSERT INTO `clt_region` VALUES ('166', '11', '濮阳', '2');
INSERT INTO `clt_region` VALUES ('167', '12', '哈尔滨', '2');
INSERT INTO `clt_region` VALUES ('168', '12', '大庆', '2');
INSERT INTO `clt_region` VALUES ('169', '12', '大兴安岭', '2');
INSERT INTO `clt_region` VALUES ('170', '12', '鹤岗', '2');
INSERT INTO `clt_region` VALUES ('171', '12', '黑河', '2');
INSERT INTO `clt_region` VALUES ('172', '12', '鸡西', '2');
INSERT INTO `clt_region` VALUES ('173', '12', '佳木斯', '2');
INSERT INTO `clt_region` VALUES ('174', '12', '牡丹江', '2');
INSERT INTO `clt_region` VALUES ('175', '12', '七台河', '2');
INSERT INTO `clt_region` VALUES ('176', '12', '齐齐哈尔', '2');
INSERT INTO `clt_region` VALUES ('177', '12', '双鸭山', '2');
INSERT INTO `clt_region` VALUES ('178', '12', '绥化', '2');
INSERT INTO `clt_region` VALUES ('179', '12', '伊春', '2');
INSERT INTO `clt_region` VALUES ('180', '13', '武汉', '2');
INSERT INTO `clt_region` VALUES ('181', '13', '仙桃', '2');
INSERT INTO `clt_region` VALUES ('182', '13', '鄂州', '2');
INSERT INTO `clt_region` VALUES ('183', '13', '黄冈', '2');
INSERT INTO `clt_region` VALUES ('184', '13', '黄石', '2');
INSERT INTO `clt_region` VALUES ('185', '13', '荆门', '2');
INSERT INTO `clt_region` VALUES ('186', '13', '荆州', '2');
INSERT INTO `clt_region` VALUES ('187', '13', '潜江', '2');
INSERT INTO `clt_region` VALUES ('188', '13', '神农架林区', '2');
INSERT INTO `clt_region` VALUES ('189', '13', '十堰', '2');
INSERT INTO `clt_region` VALUES ('190', '13', '随州', '2');
INSERT INTO `clt_region` VALUES ('191', '13', '天门', '2');
INSERT INTO `clt_region` VALUES ('192', '13', '咸宁', '2');
INSERT INTO `clt_region` VALUES ('193', '13', '襄樊', '2');
INSERT INTO `clt_region` VALUES ('194', '13', '孝感', '2');
INSERT INTO `clt_region` VALUES ('195', '13', '宜昌', '2');
INSERT INTO `clt_region` VALUES ('196', '13', '恩施', '2');
INSERT INTO `clt_region` VALUES ('197', '14', '长沙', '2');
INSERT INTO `clt_region` VALUES ('198', '14', '张家界', '2');
INSERT INTO `clt_region` VALUES ('199', '14', '常德', '2');
INSERT INTO `clt_region` VALUES ('200', '14', '郴州', '2');
INSERT INTO `clt_region` VALUES ('201', '14', '衡阳', '2');
INSERT INTO `clt_region` VALUES ('202', '14', '怀化', '2');
INSERT INTO `clt_region` VALUES ('203', '14', '娄底', '2');
INSERT INTO `clt_region` VALUES ('204', '14', '邵阳', '2');
INSERT INTO `clt_region` VALUES ('205', '14', '湘潭', '2');
INSERT INTO `clt_region` VALUES ('206', '14', '湘西', '2');
INSERT INTO `clt_region` VALUES ('207', '14', '益阳', '2');
INSERT INTO `clt_region` VALUES ('208', '14', '永州', '2');
INSERT INTO `clt_region` VALUES ('209', '14', '岳阳', '2');
INSERT INTO `clt_region` VALUES ('210', '14', '株洲', '2');
INSERT INTO `clt_region` VALUES ('211', '15', '长春', '2');
INSERT INTO `clt_region` VALUES ('212', '15', '吉林', '2');
INSERT INTO `clt_region` VALUES ('213', '15', '白城', '2');
INSERT INTO `clt_region` VALUES ('214', '15', '白山', '2');
INSERT INTO `clt_region` VALUES ('215', '15', '辽源', '2');
INSERT INTO `clt_region` VALUES ('216', '15', '四平', '2');
INSERT INTO `clt_region` VALUES ('217', '15', '松原', '2');
INSERT INTO `clt_region` VALUES ('218', '15', '通化', '2');
INSERT INTO `clt_region` VALUES ('219', '15', '延边', '2');
INSERT INTO `clt_region` VALUES ('220', '16', '南京', '2');
INSERT INTO `clt_region` VALUES ('221', '16', '苏州', '2');
INSERT INTO `clt_region` VALUES ('222', '16', '无锡', '2');
INSERT INTO `clt_region` VALUES ('223', '16', '常州', '2');
INSERT INTO `clt_region` VALUES ('224', '16', '淮安', '2');
INSERT INTO `clt_region` VALUES ('225', '16', '连云港', '2');
INSERT INTO `clt_region` VALUES ('226', '16', '南通', '2');
INSERT INTO `clt_region` VALUES ('227', '16', '宿迁', '2');
INSERT INTO `clt_region` VALUES ('228', '16', '泰州', '2');
INSERT INTO `clt_region` VALUES ('229', '16', '徐州', '2');
INSERT INTO `clt_region` VALUES ('230', '16', '盐城', '2');
INSERT INTO `clt_region` VALUES ('231', '16', '扬州', '2');
INSERT INTO `clt_region` VALUES ('232', '16', '镇江', '2');
INSERT INTO `clt_region` VALUES ('233', '17', '南昌', '2');
INSERT INTO `clt_region` VALUES ('234', '17', '抚州', '2');
INSERT INTO `clt_region` VALUES ('235', '17', '赣州', '2');
INSERT INTO `clt_region` VALUES ('236', '17', '吉安', '2');
INSERT INTO `clt_region` VALUES ('237', '17', '景德镇', '2');
INSERT INTO `clt_region` VALUES ('238', '17', '九江', '2');
INSERT INTO `clt_region` VALUES ('239', '17', '萍乡', '2');
INSERT INTO `clt_region` VALUES ('240', '17', '上饶', '2');
INSERT INTO `clt_region` VALUES ('241', '17', '新余', '2');
INSERT INTO `clt_region` VALUES ('242', '17', '宜春', '2');
INSERT INTO `clt_region` VALUES ('243', '17', '鹰潭', '2');
INSERT INTO `clt_region` VALUES ('244', '18', '沈阳', '2');
INSERT INTO `clt_region` VALUES ('245', '18', '大连', '2');
INSERT INTO `clt_region` VALUES ('246', '18', '鞍山', '2');
INSERT INTO `clt_region` VALUES ('247', '18', '本溪', '2');
INSERT INTO `clt_region` VALUES ('248', '18', '朝阳', '2');
INSERT INTO `clt_region` VALUES ('249', '18', '丹东', '2');
INSERT INTO `clt_region` VALUES ('250', '18', '抚顺', '2');
INSERT INTO `clt_region` VALUES ('251', '18', '阜新', '2');
INSERT INTO `clt_region` VALUES ('252', '18', '葫芦岛', '2');
INSERT INTO `clt_region` VALUES ('253', '18', '锦州', '2');
INSERT INTO `clt_region` VALUES ('254', '18', '辽阳', '2');
INSERT INTO `clt_region` VALUES ('255', '18', '盘锦', '2');
INSERT INTO `clt_region` VALUES ('256', '18', '铁岭', '2');
INSERT INTO `clt_region` VALUES ('257', '18', '营口', '2');
INSERT INTO `clt_region` VALUES ('258', '19', '呼和浩特', '2');
INSERT INTO `clt_region` VALUES ('259', '19', '阿拉善盟', '2');
INSERT INTO `clt_region` VALUES ('260', '19', '巴彦淖尔盟', '2');
INSERT INTO `clt_region` VALUES ('261', '19', '包头', '2');
INSERT INTO `clt_region` VALUES ('262', '19', '赤峰', '2');
INSERT INTO `clt_region` VALUES ('263', '19', '鄂尔多斯', '2');
INSERT INTO `clt_region` VALUES ('264', '19', '呼伦贝尔', '2');
INSERT INTO `clt_region` VALUES ('265', '19', '通辽', '2');
INSERT INTO `clt_region` VALUES ('266', '19', '乌海', '2');
INSERT INTO `clt_region` VALUES ('267', '19', '乌兰察布市', '2');
INSERT INTO `clt_region` VALUES ('268', '19', '锡林郭勒盟', '2');
INSERT INTO `clt_region` VALUES ('269', '19', '兴安盟', '2');
INSERT INTO `clt_region` VALUES ('270', '20', '银川', '2');
INSERT INTO `clt_region` VALUES ('271', '20', '固原', '2');
INSERT INTO `clt_region` VALUES ('272', '20', '石嘴山', '2');
INSERT INTO `clt_region` VALUES ('273', '20', '吴忠', '2');
INSERT INTO `clt_region` VALUES ('274', '20', '中卫', '2');
INSERT INTO `clt_region` VALUES ('275', '21', '西宁', '2');
INSERT INTO `clt_region` VALUES ('276', '21', '果洛', '2');
INSERT INTO `clt_region` VALUES ('277', '21', '海北', '2');
INSERT INTO `clt_region` VALUES ('278', '21', '海东', '2');
INSERT INTO `clt_region` VALUES ('279', '21', '海南', '2');
INSERT INTO `clt_region` VALUES ('280', '21', '海西', '2');
INSERT INTO `clt_region` VALUES ('281', '21', '黄南', '2');
INSERT INTO `clt_region` VALUES ('282', '21', '玉树', '2');
INSERT INTO `clt_region` VALUES ('283', '22', '济南', '2');
INSERT INTO `clt_region` VALUES ('284', '22', '青岛', '2');
INSERT INTO `clt_region` VALUES ('285', '22', '滨州', '2');
INSERT INTO `clt_region` VALUES ('286', '22', '德州', '2');
INSERT INTO `clt_region` VALUES ('287', '22', '东营', '2');
INSERT INTO `clt_region` VALUES ('288', '22', '菏泽', '2');
INSERT INTO `clt_region` VALUES ('289', '22', '济宁', '2');
INSERT INTO `clt_region` VALUES ('290', '22', '莱芜', '2');
INSERT INTO `clt_region` VALUES ('291', '22', '聊城', '2');
INSERT INTO `clt_region` VALUES ('292', '22', '临沂', '2');
INSERT INTO `clt_region` VALUES ('293', '22', '日照', '2');
INSERT INTO `clt_region` VALUES ('294', '22', '泰安', '2');
INSERT INTO `clt_region` VALUES ('295', '22', '威海', '2');
INSERT INTO `clt_region` VALUES ('296', '22', '潍坊', '2');
INSERT INTO `clt_region` VALUES ('297', '22', '烟台', '2');
INSERT INTO `clt_region` VALUES ('298', '22', '枣庄', '2');
INSERT INTO `clt_region` VALUES ('299', '22', '淄博', '2');
INSERT INTO `clt_region` VALUES ('300', '23', '太原', '2');
INSERT INTO `clt_region` VALUES ('301', '23', '长治', '2');
INSERT INTO `clt_region` VALUES ('302', '23', '大同', '2');
INSERT INTO `clt_region` VALUES ('303', '23', '晋城', '2');
INSERT INTO `clt_region` VALUES ('304', '23', '晋中', '2');
INSERT INTO `clt_region` VALUES ('305', '23', '临汾', '2');
INSERT INTO `clt_region` VALUES ('306', '23', '吕梁', '2');
INSERT INTO `clt_region` VALUES ('307', '23', '朔州', '2');
INSERT INTO `clt_region` VALUES ('308', '23', '忻州', '2');
INSERT INTO `clt_region` VALUES ('309', '23', '阳泉', '2');
INSERT INTO `clt_region` VALUES ('310', '23', '运城', '2');
INSERT INTO `clt_region` VALUES ('311', '24', '西安', '2');
INSERT INTO `clt_region` VALUES ('312', '24', '安康', '2');
INSERT INTO `clt_region` VALUES ('313', '24', '宝鸡', '2');
INSERT INTO `clt_region` VALUES ('314', '24', '汉中', '2');
INSERT INTO `clt_region` VALUES ('315', '24', '商洛', '2');
INSERT INTO `clt_region` VALUES ('316', '24', '铜川', '2');
INSERT INTO `clt_region` VALUES ('317', '24', '渭南', '2');
INSERT INTO `clt_region` VALUES ('318', '24', '咸阳', '2');
INSERT INTO `clt_region` VALUES ('319', '24', '延安', '2');
INSERT INTO `clt_region` VALUES ('320', '24', '榆林', '2');
INSERT INTO `clt_region` VALUES ('321', '25', '上海', '2');
INSERT INTO `clt_region` VALUES ('322', '26', '成都', '2');
INSERT INTO `clt_region` VALUES ('323', '26', '绵阳', '2');
INSERT INTO `clt_region` VALUES ('324', '26', '阿坝', '2');
INSERT INTO `clt_region` VALUES ('325', '26', '巴中', '2');
INSERT INTO `clt_region` VALUES ('326', '26', '达州', '2');
INSERT INTO `clt_region` VALUES ('327', '26', '德阳', '2');
INSERT INTO `clt_region` VALUES ('328', '26', '甘孜', '2');
INSERT INTO `clt_region` VALUES ('329', '26', '广安', '2');
INSERT INTO `clt_region` VALUES ('330', '26', '广元', '2');
INSERT INTO `clt_region` VALUES ('331', '26', '乐山', '2');
INSERT INTO `clt_region` VALUES ('332', '26', '凉山', '2');
INSERT INTO `clt_region` VALUES ('333', '26', '眉山', '2');
INSERT INTO `clt_region` VALUES ('334', '26', '南充', '2');
INSERT INTO `clt_region` VALUES ('335', '26', '内江', '2');
INSERT INTO `clt_region` VALUES ('336', '26', '攀枝花', '2');
INSERT INTO `clt_region` VALUES ('337', '26', '遂宁', '2');
INSERT INTO `clt_region` VALUES ('338', '26', '雅安', '2');
INSERT INTO `clt_region` VALUES ('339', '26', '宜宾', '2');
INSERT INTO `clt_region` VALUES ('340', '26', '资阳', '2');
INSERT INTO `clt_region` VALUES ('341', '26', '自贡', '2');
INSERT INTO `clt_region` VALUES ('342', '26', '泸州', '2');
INSERT INTO `clt_region` VALUES ('343', '27', '天津', '2');
INSERT INTO `clt_region` VALUES ('344', '28', '拉萨', '2');
INSERT INTO `clt_region` VALUES ('345', '28', '阿里', '2');
INSERT INTO `clt_region` VALUES ('346', '28', '昌都', '2');
INSERT INTO `clt_region` VALUES ('347', '28', '林芝', '2');
INSERT INTO `clt_region` VALUES ('348', '28', '那曲', '2');
INSERT INTO `clt_region` VALUES ('349', '28', '日喀则', '2');
INSERT INTO `clt_region` VALUES ('350', '28', '山南', '2');
INSERT INTO `clt_region` VALUES ('351', '29', '乌鲁木齐', '2');
INSERT INTO `clt_region` VALUES ('352', '29', '阿克苏', '2');
INSERT INTO `clt_region` VALUES ('353', '29', '阿拉尔', '2');
INSERT INTO `clt_region` VALUES ('354', '29', '巴音郭楞', '2');
INSERT INTO `clt_region` VALUES ('355', '29', '博尔塔拉', '2');
INSERT INTO `clt_region` VALUES ('356', '29', '昌吉', '2');
INSERT INTO `clt_region` VALUES ('357', '29', '哈密', '2');
INSERT INTO `clt_region` VALUES ('358', '29', '和田', '2');
INSERT INTO `clt_region` VALUES ('359', '29', '喀什', '2');
INSERT INTO `clt_region` VALUES ('360', '29', '克拉玛依', '2');
INSERT INTO `clt_region` VALUES ('361', '29', '克孜勒苏', '2');
INSERT INTO `clt_region` VALUES ('362', '29', '石河子', '2');
INSERT INTO `clt_region` VALUES ('363', '29', '图木舒克', '2');
INSERT INTO `clt_region` VALUES ('364', '29', '吐鲁番', '2');
INSERT INTO `clt_region` VALUES ('365', '29', '五家渠', '2');
INSERT INTO `clt_region` VALUES ('366', '29', '伊犁', '2');
INSERT INTO `clt_region` VALUES ('367', '30', '昆明', '2');
INSERT INTO `clt_region` VALUES ('368', '30', '怒江', '2');
INSERT INTO `clt_region` VALUES ('369', '30', '普洱', '2');
INSERT INTO `clt_region` VALUES ('370', '30', '丽江', '2');
INSERT INTO `clt_region` VALUES ('371', '30', '保山', '2');
INSERT INTO `clt_region` VALUES ('372', '30', '楚雄', '2');
INSERT INTO `clt_region` VALUES ('373', '30', '大理', '2');
INSERT INTO `clt_region` VALUES ('374', '30', '德宏', '2');
INSERT INTO `clt_region` VALUES ('375', '30', '迪庆', '2');
INSERT INTO `clt_region` VALUES ('376', '30', '红河', '2');
INSERT INTO `clt_region` VALUES ('377', '30', '临沧', '2');
INSERT INTO `clt_region` VALUES ('378', '30', '曲靖', '2');
INSERT INTO `clt_region` VALUES ('379', '30', '文山', '2');
INSERT INTO `clt_region` VALUES ('380', '30', '西双版纳', '2');
INSERT INTO `clt_region` VALUES ('381', '30', '玉溪', '2');
INSERT INTO `clt_region` VALUES ('382', '30', '昭通', '2');
INSERT INTO `clt_region` VALUES ('383', '31', '杭州', '2');
INSERT INTO `clt_region` VALUES ('384', '31', '湖州', '2');
INSERT INTO `clt_region` VALUES ('385', '31', '嘉兴', '2');
INSERT INTO `clt_region` VALUES ('386', '31', '金华', '2');
INSERT INTO `clt_region` VALUES ('387', '31', '丽水', '2');
INSERT INTO `clt_region` VALUES ('388', '31', '宁波', '2');
INSERT INTO `clt_region` VALUES ('389', '31', '绍兴', '2');
INSERT INTO `clt_region` VALUES ('390', '31', '台州', '2');
INSERT INTO `clt_region` VALUES ('391', '31', '温州', '2');
INSERT INTO `clt_region` VALUES ('392', '31', '舟山', '2');
INSERT INTO `clt_region` VALUES ('393', '31', '衢州', '2');
INSERT INTO `clt_region` VALUES ('394', '32', '重庆', '2');
INSERT INTO `clt_region` VALUES ('395', '33', '香港', '2');
INSERT INTO `clt_region` VALUES ('396', '34', '澳门', '2');
INSERT INTO `clt_region` VALUES ('397', '35', '台湾', '2');
INSERT INTO `clt_region` VALUES ('398', '36', '迎江区', '3');
INSERT INTO `clt_region` VALUES ('399', '36', '大观区', '3');
INSERT INTO `clt_region` VALUES ('400', '36', '宜秀区', '3');
INSERT INTO `clt_region` VALUES ('401', '36', '桐城市', '3');
INSERT INTO `clt_region` VALUES ('402', '36', '怀宁县', '3');
INSERT INTO `clt_region` VALUES ('403', '36', '枞阳县', '3');
INSERT INTO `clt_region` VALUES ('404', '36', '潜山县', '3');
INSERT INTO `clt_region` VALUES ('405', '36', '太湖县', '3');
INSERT INTO `clt_region` VALUES ('406', '36', '宿松县', '3');
INSERT INTO `clt_region` VALUES ('407', '36', '望江县', '3');
INSERT INTO `clt_region` VALUES ('408', '36', '岳西县', '3');
INSERT INTO `clt_region` VALUES ('409', '37', '中市区', '3');
INSERT INTO `clt_region` VALUES ('410', '37', '东市区', '3');
INSERT INTO `clt_region` VALUES ('411', '37', '西市区', '3');
INSERT INTO `clt_region` VALUES ('412', '37', '郊区', '3');
INSERT INTO `clt_region` VALUES ('413', '37', '怀远县', '3');
INSERT INTO `clt_region` VALUES ('414', '37', '五河县', '3');
INSERT INTO `clt_region` VALUES ('415', '37', '固镇县', '3');
INSERT INTO `clt_region` VALUES ('416', '38', '居巢区', '3');
INSERT INTO `clt_region` VALUES ('417', '38', '庐江县', '3');
INSERT INTO `clt_region` VALUES ('418', '38', '无为县', '3');
INSERT INTO `clt_region` VALUES ('419', '38', '含山县', '3');
INSERT INTO `clt_region` VALUES ('420', '38', '和县', '3');
INSERT INTO `clt_region` VALUES ('421', '39', '贵池区', '3');
INSERT INTO `clt_region` VALUES ('422', '39', '东至县', '3');
INSERT INTO `clt_region` VALUES ('423', '39', '石台县', '3');
INSERT INTO `clt_region` VALUES ('424', '39', '青阳县', '3');
INSERT INTO `clt_region` VALUES ('425', '40', '琅琊区', '3');
INSERT INTO `clt_region` VALUES ('426', '40', '南谯区', '3');
INSERT INTO `clt_region` VALUES ('427', '40', '天长市', '3');
INSERT INTO `clt_region` VALUES ('428', '40', '明光市', '3');
INSERT INTO `clt_region` VALUES ('429', '40', '来安县', '3');
INSERT INTO `clt_region` VALUES ('430', '40', '全椒县', '3');
INSERT INTO `clt_region` VALUES ('431', '40', '定远县', '3');
INSERT INTO `clt_region` VALUES ('432', '40', '凤阳县', '3');
INSERT INTO `clt_region` VALUES ('433', '41', '蚌山区', '3');
INSERT INTO `clt_region` VALUES ('434', '41', '龙子湖区', '3');
INSERT INTO `clt_region` VALUES ('435', '41', '禹会区', '3');
INSERT INTO `clt_region` VALUES ('436', '41', '淮上区', '3');
INSERT INTO `clt_region` VALUES ('437', '41', '颍州区', '3');
INSERT INTO `clt_region` VALUES ('438', '41', '颍东区', '3');
INSERT INTO `clt_region` VALUES ('439', '41', '颍泉区', '3');
INSERT INTO `clt_region` VALUES ('440', '41', '界首市', '3');
INSERT INTO `clt_region` VALUES ('441', '41', '临泉县', '3');
INSERT INTO `clt_region` VALUES ('442', '41', '太和县', '3');
INSERT INTO `clt_region` VALUES ('443', '41', '阜南县', '3');
INSERT INTO `clt_region` VALUES ('444', '41', '颖上县', '3');
INSERT INTO `clt_region` VALUES ('445', '42', '相山区', '3');
INSERT INTO `clt_region` VALUES ('446', '42', '杜集区', '3');
INSERT INTO `clt_region` VALUES ('447', '42', '烈山区', '3');
INSERT INTO `clt_region` VALUES ('448', '42', '濉溪县', '3');
INSERT INTO `clt_region` VALUES ('449', '43', '田家庵区', '3');
INSERT INTO `clt_region` VALUES ('450', '43', '大通区', '3');
INSERT INTO `clt_region` VALUES ('451', '43', '谢家集区', '3');
INSERT INTO `clt_region` VALUES ('452', '43', '八公山区', '3');
INSERT INTO `clt_region` VALUES ('453', '43', '潘集区', '3');
INSERT INTO `clt_region` VALUES ('454', '43', '凤台县', '3');
INSERT INTO `clt_region` VALUES ('455', '44', '屯溪区', '3');
INSERT INTO `clt_region` VALUES ('456', '44', '黄山区', '3');
INSERT INTO `clt_region` VALUES ('457', '44', '徽州区', '3');
INSERT INTO `clt_region` VALUES ('458', '44', '歙县', '3');
INSERT INTO `clt_region` VALUES ('459', '44', '休宁县', '3');
INSERT INTO `clt_region` VALUES ('460', '44', '黟县', '3');
INSERT INTO `clt_region` VALUES ('461', '44', '祁门县', '3');
INSERT INTO `clt_region` VALUES ('462', '45', '金安区', '3');
INSERT INTO `clt_region` VALUES ('463', '45', '裕安区', '3');
INSERT INTO `clt_region` VALUES ('464', '45', '寿县', '3');
INSERT INTO `clt_region` VALUES ('465', '45', '霍邱县', '3');
INSERT INTO `clt_region` VALUES ('466', '45', '舒城县', '3');
INSERT INTO `clt_region` VALUES ('467', '45', '金寨县', '3');
INSERT INTO `clt_region` VALUES ('468', '45', '霍山县', '3');
INSERT INTO `clt_region` VALUES ('469', '46', '雨山区', '3');
INSERT INTO `clt_region` VALUES ('470', '46', '花山区', '3');
INSERT INTO `clt_region` VALUES ('471', '46', '金家庄区', '3');
INSERT INTO `clt_region` VALUES ('472', '46', '当涂县', '3');
INSERT INTO `clt_region` VALUES ('473', '47', '埇桥区', '3');
INSERT INTO `clt_region` VALUES ('474', '47', '砀山县', '3');
INSERT INTO `clt_region` VALUES ('475', '47', '萧县', '3');
INSERT INTO `clt_region` VALUES ('476', '47', '灵璧县', '3');
INSERT INTO `clt_region` VALUES ('477', '47', '泗县', '3');
INSERT INTO `clt_region` VALUES ('478', '48', '铜官山区', '3');
INSERT INTO `clt_region` VALUES ('479', '48', '狮子山区', '3');
INSERT INTO `clt_region` VALUES ('480', '48', '郊区', '3');
INSERT INTO `clt_region` VALUES ('481', '48', '铜陵县', '3');
INSERT INTO `clt_region` VALUES ('482', '49', '镜湖区', '3');
INSERT INTO `clt_region` VALUES ('483', '49', '弋江区', '3');
INSERT INTO `clt_region` VALUES ('484', '49', '鸠江区', '3');
INSERT INTO `clt_region` VALUES ('485', '49', '三山区', '3');
INSERT INTO `clt_region` VALUES ('486', '49', '芜湖县', '3');
INSERT INTO `clt_region` VALUES ('487', '49', '繁昌县', '3');
INSERT INTO `clt_region` VALUES ('488', '49', '南陵县', '3');
INSERT INTO `clt_region` VALUES ('489', '50', '宣州区', '3');
INSERT INTO `clt_region` VALUES ('490', '50', '宁国市', '3');
INSERT INTO `clt_region` VALUES ('491', '50', '郎溪县', '3');
INSERT INTO `clt_region` VALUES ('492', '50', '广德县', '3');
INSERT INTO `clt_region` VALUES ('493', '50', '泾县', '3');
INSERT INTO `clt_region` VALUES ('494', '50', '绩溪县', '3');
INSERT INTO `clt_region` VALUES ('495', '50', '旌德县', '3');
INSERT INTO `clt_region` VALUES ('496', '51', '涡阳县', '3');
INSERT INTO `clt_region` VALUES ('497', '51', '蒙城县', '3');
INSERT INTO `clt_region` VALUES ('498', '51', '利辛县', '3');
INSERT INTO `clt_region` VALUES ('499', '51', '谯城区', '3');
INSERT INTO `clt_region` VALUES ('500', '52', '东城区', '3');
INSERT INTO `clt_region` VALUES ('501', '52', '西城区', '3');
INSERT INTO `clt_region` VALUES ('502', '52', '海淀区', '3');
INSERT INTO `clt_region` VALUES ('503', '52', '朝阳区', '3');
INSERT INTO `clt_region` VALUES ('504', '52', '崇文区', '3');
INSERT INTO `clt_region` VALUES ('505', '52', '宣武区', '3');
INSERT INTO `clt_region` VALUES ('506', '52', '丰台区', '3');
INSERT INTO `clt_region` VALUES ('507', '52', '石景山区', '3');
INSERT INTO `clt_region` VALUES ('508', '52', '房山区', '3');
INSERT INTO `clt_region` VALUES ('509', '52', '门头沟区', '3');
INSERT INTO `clt_region` VALUES ('510', '52', '通州区', '3');
INSERT INTO `clt_region` VALUES ('511', '52', '顺义区', '3');
INSERT INTO `clt_region` VALUES ('512', '52', '昌平区', '3');
INSERT INTO `clt_region` VALUES ('513', '52', '怀柔区', '3');
INSERT INTO `clt_region` VALUES ('514', '52', '平谷区', '3');
INSERT INTO `clt_region` VALUES ('515', '52', '大兴区', '3');
INSERT INTO `clt_region` VALUES ('516', '52', '密云县', '3');
INSERT INTO `clt_region` VALUES ('517', '52', '延庆县', '3');
INSERT INTO `clt_region` VALUES ('518', '53', '鼓楼区', '3');
INSERT INTO `clt_region` VALUES ('519', '53', '台江区', '3');
INSERT INTO `clt_region` VALUES ('520', '53', '仓山区', '3');
INSERT INTO `clt_region` VALUES ('521', '53', '马尾区', '3');
INSERT INTO `clt_region` VALUES ('522', '53', '晋安区', '3');
INSERT INTO `clt_region` VALUES ('523', '53', '福清市', '3');
INSERT INTO `clt_region` VALUES ('524', '53', '长乐市', '3');
INSERT INTO `clt_region` VALUES ('525', '53', '闽侯县', '3');
INSERT INTO `clt_region` VALUES ('526', '53', '连江县', '3');
INSERT INTO `clt_region` VALUES ('527', '53', '罗源县', '3');
INSERT INTO `clt_region` VALUES ('528', '53', '闽清县', '3');
INSERT INTO `clt_region` VALUES ('529', '53', '永泰县', '3');
INSERT INTO `clt_region` VALUES ('530', '53', '平潭县', '3');
INSERT INTO `clt_region` VALUES ('531', '54', '新罗区', '3');
INSERT INTO `clt_region` VALUES ('532', '54', '漳平市', '3');
INSERT INTO `clt_region` VALUES ('533', '54', '长汀县', '3');
INSERT INTO `clt_region` VALUES ('534', '54', '永定县', '3');
INSERT INTO `clt_region` VALUES ('535', '54', '上杭县', '3');
INSERT INTO `clt_region` VALUES ('536', '54', '武平县', '3');
INSERT INTO `clt_region` VALUES ('537', '54', '连城县', '3');
INSERT INTO `clt_region` VALUES ('538', '55', '延平区', '3');
INSERT INTO `clt_region` VALUES ('539', '55', '邵武市', '3');
INSERT INTO `clt_region` VALUES ('540', '55', '武夷山市', '3');
INSERT INTO `clt_region` VALUES ('541', '55', '建瓯市', '3');
INSERT INTO `clt_region` VALUES ('542', '55', '建阳市', '3');
INSERT INTO `clt_region` VALUES ('543', '55', '顺昌县', '3');
INSERT INTO `clt_region` VALUES ('544', '55', '浦城县', '3');
INSERT INTO `clt_region` VALUES ('545', '55', '光泽县', '3');
INSERT INTO `clt_region` VALUES ('546', '55', '松溪县', '3');
INSERT INTO `clt_region` VALUES ('547', '55', '政和县', '3');
INSERT INTO `clt_region` VALUES ('548', '56', '蕉城区', '3');
INSERT INTO `clt_region` VALUES ('549', '56', '福安市', '3');
INSERT INTO `clt_region` VALUES ('550', '56', '福鼎市', '3');
INSERT INTO `clt_region` VALUES ('551', '56', '霞浦县', '3');
INSERT INTO `clt_region` VALUES ('552', '56', '古田县', '3');
INSERT INTO `clt_region` VALUES ('553', '56', '屏南县', '3');
INSERT INTO `clt_region` VALUES ('554', '56', '寿宁县', '3');
INSERT INTO `clt_region` VALUES ('555', '56', '周宁县', '3');
INSERT INTO `clt_region` VALUES ('556', '56', '柘荣县', '3');
INSERT INTO `clt_region` VALUES ('557', '57', '城厢区', '3');
INSERT INTO `clt_region` VALUES ('558', '57', '涵江区', '3');
INSERT INTO `clt_region` VALUES ('559', '57', '荔城区', '3');
INSERT INTO `clt_region` VALUES ('560', '57', '秀屿区', '3');
INSERT INTO `clt_region` VALUES ('561', '57', '仙游县', '3');
INSERT INTO `clt_region` VALUES ('562', '58', '鲤城区', '3');
INSERT INTO `clt_region` VALUES ('563', '58', '丰泽区', '3');
INSERT INTO `clt_region` VALUES ('564', '58', '洛江区', '3');
INSERT INTO `clt_region` VALUES ('565', '58', '清濛开发区', '3');
INSERT INTO `clt_region` VALUES ('566', '58', '泉港区', '3');
INSERT INTO `clt_region` VALUES ('567', '58', '石狮市', '3');
INSERT INTO `clt_region` VALUES ('568', '58', '晋江市', '3');
INSERT INTO `clt_region` VALUES ('569', '58', '南安市', '3');
INSERT INTO `clt_region` VALUES ('570', '58', '惠安县', '3');
INSERT INTO `clt_region` VALUES ('571', '58', '安溪县', '3');
INSERT INTO `clt_region` VALUES ('572', '58', '永春县', '3');
INSERT INTO `clt_region` VALUES ('573', '58', '德化县', '3');
INSERT INTO `clt_region` VALUES ('574', '58', '金门县', '3');
INSERT INTO `clt_region` VALUES ('575', '59', '梅列区', '3');
INSERT INTO `clt_region` VALUES ('576', '59', '三元区', '3');
INSERT INTO `clt_region` VALUES ('577', '59', '永安市', '3');
INSERT INTO `clt_region` VALUES ('578', '59', '明溪县', '3');
INSERT INTO `clt_region` VALUES ('579', '59', '清流县', '3');
INSERT INTO `clt_region` VALUES ('580', '59', '宁化县', '3');
INSERT INTO `clt_region` VALUES ('581', '59', '大田县', '3');
INSERT INTO `clt_region` VALUES ('582', '59', '尤溪县', '3');
INSERT INTO `clt_region` VALUES ('583', '59', '沙县', '3');
INSERT INTO `clt_region` VALUES ('584', '59', '将乐县', '3');
INSERT INTO `clt_region` VALUES ('585', '59', '泰宁县', '3');
INSERT INTO `clt_region` VALUES ('586', '59', '建宁县', '3');
INSERT INTO `clt_region` VALUES ('587', '60', '思明区', '3');
INSERT INTO `clt_region` VALUES ('588', '60', '海沧区', '3');
INSERT INTO `clt_region` VALUES ('589', '60', '湖里区', '3');
INSERT INTO `clt_region` VALUES ('590', '60', '集美区', '3');
INSERT INTO `clt_region` VALUES ('591', '60', '同安区', '3');
INSERT INTO `clt_region` VALUES ('592', '60', '翔安区', '3');
INSERT INTO `clt_region` VALUES ('593', '61', '芗城区', '3');
INSERT INTO `clt_region` VALUES ('594', '61', '龙文区', '3');
INSERT INTO `clt_region` VALUES ('595', '61', '龙海市', '3');
INSERT INTO `clt_region` VALUES ('596', '61', '云霄县', '3');
INSERT INTO `clt_region` VALUES ('597', '61', '漳浦县', '3');
INSERT INTO `clt_region` VALUES ('598', '61', '诏安县', '3');
INSERT INTO `clt_region` VALUES ('599', '61', '长泰县', '3');
INSERT INTO `clt_region` VALUES ('600', '61', '东山县', '3');
INSERT INTO `clt_region` VALUES ('601', '61', '南靖县', '3');
INSERT INTO `clt_region` VALUES ('602', '61', '平和县', '3');
INSERT INTO `clt_region` VALUES ('603', '61', '华安县', '3');
INSERT INTO `clt_region` VALUES ('604', '62', '皋兰县', '3');
INSERT INTO `clt_region` VALUES ('605', '62', '城关区', '3');
INSERT INTO `clt_region` VALUES ('606', '62', '七里河区', '3');
INSERT INTO `clt_region` VALUES ('607', '62', '西固区', '3');
INSERT INTO `clt_region` VALUES ('608', '62', '安宁区', '3');
INSERT INTO `clt_region` VALUES ('609', '62', '红古区', '3');
INSERT INTO `clt_region` VALUES ('610', '62', '永登县', '3');
INSERT INTO `clt_region` VALUES ('611', '62', '榆中县', '3');
INSERT INTO `clt_region` VALUES ('612', '63', '白银区', '3');
INSERT INTO `clt_region` VALUES ('613', '63', '平川区', '3');
INSERT INTO `clt_region` VALUES ('614', '63', '会宁县', '3');
INSERT INTO `clt_region` VALUES ('615', '63', '景泰县', '3');
INSERT INTO `clt_region` VALUES ('616', '63', '靖远县', '3');
INSERT INTO `clt_region` VALUES ('617', '64', '临洮县', '3');
INSERT INTO `clt_region` VALUES ('618', '64', '陇西县', '3');
INSERT INTO `clt_region` VALUES ('619', '64', '通渭县', '3');
INSERT INTO `clt_region` VALUES ('620', '64', '渭源县', '3');
INSERT INTO `clt_region` VALUES ('621', '64', '漳县', '3');
INSERT INTO `clt_region` VALUES ('622', '64', '岷县', '3');
INSERT INTO `clt_region` VALUES ('623', '64', '安定区', '3');
INSERT INTO `clt_region` VALUES ('624', '64', '安定区', '3');
INSERT INTO `clt_region` VALUES ('625', '65', '合作市', '3');
INSERT INTO `clt_region` VALUES ('626', '65', '临潭县', '3');
INSERT INTO `clt_region` VALUES ('627', '65', '卓尼县', '3');
INSERT INTO `clt_region` VALUES ('628', '65', '舟曲县', '3');
INSERT INTO `clt_region` VALUES ('629', '65', '迭部县', '3');
INSERT INTO `clt_region` VALUES ('630', '65', '玛曲县', '3');
INSERT INTO `clt_region` VALUES ('631', '65', '碌曲县', '3');
INSERT INTO `clt_region` VALUES ('632', '65', '夏河县', '3');
INSERT INTO `clt_region` VALUES ('633', '66', '嘉峪关市', '3');
INSERT INTO `clt_region` VALUES ('634', '67', '金川区', '3');
INSERT INTO `clt_region` VALUES ('635', '67', '永昌县', '3');
INSERT INTO `clt_region` VALUES ('636', '68', '肃州区', '3');
INSERT INTO `clt_region` VALUES ('637', '68', '玉门市', '3');
INSERT INTO `clt_region` VALUES ('638', '68', '敦煌市', '3');
INSERT INTO `clt_region` VALUES ('639', '68', '金塔县', '3');
INSERT INTO `clt_region` VALUES ('640', '68', '瓜州县', '3');
INSERT INTO `clt_region` VALUES ('641', '68', '肃北', '3');
INSERT INTO `clt_region` VALUES ('642', '68', '阿克塞', '3');
INSERT INTO `clt_region` VALUES ('643', '69', '临夏市', '3');
INSERT INTO `clt_region` VALUES ('644', '69', '临夏县', '3');
INSERT INTO `clt_region` VALUES ('645', '69', '康乐县', '3');
INSERT INTO `clt_region` VALUES ('646', '69', '永靖县', '3');
INSERT INTO `clt_region` VALUES ('647', '69', '广河县', '3');
INSERT INTO `clt_region` VALUES ('648', '69', '和政县', '3');
INSERT INTO `clt_region` VALUES ('649', '69', '东乡族自治县', '3');
INSERT INTO `clt_region` VALUES ('650', '69', '积石山', '3');
INSERT INTO `clt_region` VALUES ('651', '70', '成县', '3');
INSERT INTO `clt_region` VALUES ('652', '70', '徽县', '3');
INSERT INTO `clt_region` VALUES ('653', '70', '康县', '3');
INSERT INTO `clt_region` VALUES ('654', '70', '礼县', '3');
INSERT INTO `clt_region` VALUES ('655', '70', '两当县', '3');
INSERT INTO `clt_region` VALUES ('656', '70', '文县', '3');
INSERT INTO `clt_region` VALUES ('657', '70', '西和县', '3');
INSERT INTO `clt_region` VALUES ('658', '70', '宕昌县', '3');
INSERT INTO `clt_region` VALUES ('659', '70', '武都区', '3');
INSERT INTO `clt_region` VALUES ('660', '71', '崇信县', '3');
INSERT INTO `clt_region` VALUES ('661', '71', '华亭县', '3');
INSERT INTO `clt_region` VALUES ('662', '71', '静宁县', '3');
INSERT INTO `clt_region` VALUES ('663', '71', '灵台县', '3');
INSERT INTO `clt_region` VALUES ('664', '71', '崆峒区', '3');
INSERT INTO `clt_region` VALUES ('665', '71', '庄浪县', '3');
INSERT INTO `clt_region` VALUES ('666', '71', '泾川县', '3');
INSERT INTO `clt_region` VALUES ('667', '72', '合水县', '3');
INSERT INTO `clt_region` VALUES ('668', '72', '华池县', '3');
INSERT INTO `clt_region` VALUES ('669', '72', '环县', '3');
INSERT INTO `clt_region` VALUES ('670', '72', '宁县', '3');
INSERT INTO `clt_region` VALUES ('671', '72', '庆城县', '3');
INSERT INTO `clt_region` VALUES ('672', '72', '西峰区', '3');
INSERT INTO `clt_region` VALUES ('673', '72', '镇原县', '3');
INSERT INTO `clt_region` VALUES ('674', '72', '正宁县', '3');
INSERT INTO `clt_region` VALUES ('675', '73', '甘谷县', '3');
INSERT INTO `clt_region` VALUES ('676', '73', '秦安县', '3');
INSERT INTO `clt_region` VALUES ('677', '73', '清水县', '3');
INSERT INTO `clt_region` VALUES ('678', '73', '秦州区', '3');
INSERT INTO `clt_region` VALUES ('679', '73', '麦积区', '3');
INSERT INTO `clt_region` VALUES ('680', '73', '武山县', '3');
INSERT INTO `clt_region` VALUES ('681', '73', '张家川', '3');
INSERT INTO `clt_region` VALUES ('682', '74', '古浪县', '3');
INSERT INTO `clt_region` VALUES ('683', '74', '民勤县', '3');
INSERT INTO `clt_region` VALUES ('684', '74', '天祝', '3');
INSERT INTO `clt_region` VALUES ('685', '74', '凉州区', '3');
INSERT INTO `clt_region` VALUES ('686', '75', '高台县', '3');
INSERT INTO `clt_region` VALUES ('687', '75', '临泽县', '3');
INSERT INTO `clt_region` VALUES ('688', '75', '民乐县', '3');
INSERT INTO `clt_region` VALUES ('689', '75', '山丹县', '3');
INSERT INTO `clt_region` VALUES ('690', '75', '肃南', '3');
INSERT INTO `clt_region` VALUES ('691', '75', '甘州区', '3');
INSERT INTO `clt_region` VALUES ('692', '76', '从化市', '3');
INSERT INTO `clt_region` VALUES ('693', '76', '天河区', '3');
INSERT INTO `clt_region` VALUES ('694', '76', '东山区', '3');
INSERT INTO `clt_region` VALUES ('695', '76', '白云区', '3');
INSERT INTO `clt_region` VALUES ('696', '76', '海珠区', '3');
INSERT INTO `clt_region` VALUES ('697', '76', '荔湾区', '3');
INSERT INTO `clt_region` VALUES ('698', '76', '越秀区', '3');
INSERT INTO `clt_region` VALUES ('699', '76', '黄埔区', '3');
INSERT INTO `clt_region` VALUES ('700', '76', '番禺区', '3');
INSERT INTO `clt_region` VALUES ('701', '76', '花都区', '3');
INSERT INTO `clt_region` VALUES ('702', '76', '增城区', '3');
INSERT INTO `clt_region` VALUES ('703', '76', '从化区', '3');
INSERT INTO `clt_region` VALUES ('704', '76', '市郊', '3');
INSERT INTO `clt_region` VALUES ('705', '77', '福田区', '3');
INSERT INTO `clt_region` VALUES ('706', '77', '罗湖区', '3');
INSERT INTO `clt_region` VALUES ('707', '77', '南山区', '3');
INSERT INTO `clt_region` VALUES ('708', '77', '宝安区', '3');
INSERT INTO `clt_region` VALUES ('709', '77', '龙岗区', '3');
INSERT INTO `clt_region` VALUES ('710', '77', '盐田区', '3');
INSERT INTO `clt_region` VALUES ('711', '78', '湘桥区', '3');
INSERT INTO `clt_region` VALUES ('712', '78', '潮安县', '3');
INSERT INTO `clt_region` VALUES ('713', '78', '饶平县', '3');
INSERT INTO `clt_region` VALUES ('714', '79', '南城区', '3');
INSERT INTO `clt_region` VALUES ('715', '79', '东城区', '3');
INSERT INTO `clt_region` VALUES ('716', '79', '万江区', '3');
INSERT INTO `clt_region` VALUES ('717', '79', '莞城区', '3');
INSERT INTO `clt_region` VALUES ('718', '79', '石龙镇', '3');
INSERT INTO `clt_region` VALUES ('719', '79', '虎门镇', '3');
INSERT INTO `clt_region` VALUES ('720', '79', '麻涌镇', '3');
INSERT INTO `clt_region` VALUES ('721', '79', '道滘镇', '3');
INSERT INTO `clt_region` VALUES ('722', '79', '石碣镇', '3');
INSERT INTO `clt_region` VALUES ('723', '79', '沙田镇', '3');
INSERT INTO `clt_region` VALUES ('724', '79', '望牛墩镇', '3');
INSERT INTO `clt_region` VALUES ('725', '79', '洪梅镇', '3');
INSERT INTO `clt_region` VALUES ('726', '79', '茶山镇', '3');
INSERT INTO `clt_region` VALUES ('727', '79', '寮步镇', '3');
INSERT INTO `clt_region` VALUES ('728', '79', '大岭山镇', '3');
INSERT INTO `clt_region` VALUES ('729', '79', '大朗镇', '3');
INSERT INTO `clt_region` VALUES ('730', '79', '黄江镇', '3');
INSERT INTO `clt_region` VALUES ('731', '79', '樟木头', '3');
INSERT INTO `clt_region` VALUES ('732', '79', '凤岗镇', '3');
INSERT INTO `clt_region` VALUES ('733', '79', '塘厦镇', '3');
INSERT INTO `clt_region` VALUES ('734', '79', '谢岗镇', '3');
INSERT INTO `clt_region` VALUES ('735', '79', '厚街镇', '3');
INSERT INTO `clt_region` VALUES ('736', '79', '清溪镇', '3');
INSERT INTO `clt_region` VALUES ('737', '79', '常平镇', '3');
INSERT INTO `clt_region` VALUES ('738', '79', '桥头镇', '3');
INSERT INTO `clt_region` VALUES ('739', '79', '横沥镇', '3');
INSERT INTO `clt_region` VALUES ('740', '79', '东坑镇', '3');
INSERT INTO `clt_region` VALUES ('741', '79', '企石镇', '3');
INSERT INTO `clt_region` VALUES ('742', '79', '石排镇', '3');
INSERT INTO `clt_region` VALUES ('743', '79', '长安镇', '3');
INSERT INTO `clt_region` VALUES ('744', '79', '中堂镇', '3');
INSERT INTO `clt_region` VALUES ('745', '79', '高埗镇', '3');
INSERT INTO `clt_region` VALUES ('746', '80', '禅城区', '3');
INSERT INTO `clt_region` VALUES ('747', '80', '南海区', '3');
INSERT INTO `clt_region` VALUES ('748', '80', '顺德区', '3');
INSERT INTO `clt_region` VALUES ('749', '80', '三水区', '3');
INSERT INTO `clt_region` VALUES ('750', '80', '高明区', '3');
INSERT INTO `clt_region` VALUES ('751', '81', '东源县', '3');
INSERT INTO `clt_region` VALUES ('752', '81', '和平县', '3');
INSERT INTO `clt_region` VALUES ('753', '81', '源城区', '3');
INSERT INTO `clt_region` VALUES ('754', '81', '连平县', '3');
INSERT INTO `clt_region` VALUES ('755', '81', '龙川县', '3');
INSERT INTO `clt_region` VALUES ('756', '81', '紫金县', '3');
INSERT INTO `clt_region` VALUES ('757', '82', '惠阳区', '3');
INSERT INTO `clt_region` VALUES ('758', '82', '惠城区', '3');
INSERT INTO `clt_region` VALUES ('759', '82', '大亚湾', '3');
INSERT INTO `clt_region` VALUES ('760', '82', '博罗县', '3');
INSERT INTO `clt_region` VALUES ('761', '82', '惠东县', '3');
INSERT INTO `clt_region` VALUES ('762', '82', '龙门县', '3');
INSERT INTO `clt_region` VALUES ('763', '83', '江海区', '3');
INSERT INTO `clt_region` VALUES ('764', '83', '蓬江区', '3');
INSERT INTO `clt_region` VALUES ('765', '83', '新会区', '3');
INSERT INTO `clt_region` VALUES ('766', '83', '台山市', '3');
INSERT INTO `clt_region` VALUES ('767', '83', '开平市', '3');
INSERT INTO `clt_region` VALUES ('768', '83', '鹤山市', '3');
INSERT INTO `clt_region` VALUES ('769', '83', '恩平市', '3');
INSERT INTO `clt_region` VALUES ('770', '84', '榕城区', '3');
INSERT INTO `clt_region` VALUES ('771', '84', '普宁市', '3');
INSERT INTO `clt_region` VALUES ('772', '84', '揭东县', '3');
INSERT INTO `clt_region` VALUES ('773', '84', '揭西县', '3');
INSERT INTO `clt_region` VALUES ('774', '84', '惠来县', '3');
INSERT INTO `clt_region` VALUES ('775', '85', '茂南区', '3');
INSERT INTO `clt_region` VALUES ('776', '85', '茂港区', '3');
INSERT INTO `clt_region` VALUES ('777', '85', '高州市', '3');
INSERT INTO `clt_region` VALUES ('778', '85', '化州市', '3');
INSERT INTO `clt_region` VALUES ('779', '85', '信宜市', '3');
INSERT INTO `clt_region` VALUES ('780', '85', '电白县', '3');
INSERT INTO `clt_region` VALUES ('781', '86', '梅县', '3');
INSERT INTO `clt_region` VALUES ('782', '86', '梅江区', '3');
INSERT INTO `clt_region` VALUES ('783', '86', '兴宁市', '3');
INSERT INTO `clt_region` VALUES ('784', '86', '大埔县', '3');
INSERT INTO `clt_region` VALUES ('785', '86', '丰顺县', '3');
INSERT INTO `clt_region` VALUES ('786', '86', '五华县', '3');
INSERT INTO `clt_region` VALUES ('787', '86', '平远县', '3');
INSERT INTO `clt_region` VALUES ('788', '86', '蕉岭县', '3');
INSERT INTO `clt_region` VALUES ('789', '87', '清城区', '3');
INSERT INTO `clt_region` VALUES ('790', '87', '英德市', '3');
INSERT INTO `clt_region` VALUES ('791', '87', '连州市', '3');
INSERT INTO `clt_region` VALUES ('792', '87', '佛冈县', '3');
INSERT INTO `clt_region` VALUES ('793', '87', '阳山县', '3');
INSERT INTO `clt_region` VALUES ('794', '87', '清新县', '3');
INSERT INTO `clt_region` VALUES ('795', '87', '连山', '3');
INSERT INTO `clt_region` VALUES ('796', '87', '连南', '3');
INSERT INTO `clt_region` VALUES ('797', '88', '南澳县', '3');
INSERT INTO `clt_region` VALUES ('798', '88', '潮阳区', '3');
INSERT INTO `clt_region` VALUES ('799', '88', '澄海区', '3');
INSERT INTO `clt_region` VALUES ('800', '88', '龙湖区', '3');
INSERT INTO `clt_region` VALUES ('801', '88', '金平区', '3');
INSERT INTO `clt_region` VALUES ('802', '88', '濠江区', '3');
INSERT INTO `clt_region` VALUES ('803', '88', '潮南区', '3');
INSERT INTO `clt_region` VALUES ('804', '89', '城区', '3');
INSERT INTO `clt_region` VALUES ('805', '89', '陆丰市', '3');
INSERT INTO `clt_region` VALUES ('806', '89', '海丰县', '3');
INSERT INTO `clt_region` VALUES ('807', '89', '陆河县', '3');
INSERT INTO `clt_region` VALUES ('808', '90', '曲江县', '3');
INSERT INTO `clt_region` VALUES ('809', '90', '浈江区', '3');
INSERT INTO `clt_region` VALUES ('810', '90', '武江区', '3');
INSERT INTO `clt_region` VALUES ('811', '90', '曲江区', '3');
INSERT INTO `clt_region` VALUES ('812', '90', '乐昌市', '3');
INSERT INTO `clt_region` VALUES ('813', '90', '南雄市', '3');
INSERT INTO `clt_region` VALUES ('814', '90', '始兴县', '3');
INSERT INTO `clt_region` VALUES ('815', '90', '仁化县', '3');
INSERT INTO `clt_region` VALUES ('816', '90', '翁源县', '3');
INSERT INTO `clt_region` VALUES ('817', '90', '新丰县', '3');
INSERT INTO `clt_region` VALUES ('818', '90', '乳源', '3');
INSERT INTO `clt_region` VALUES ('819', '91', '江城区', '3');
INSERT INTO `clt_region` VALUES ('820', '91', '阳春市', '3');
INSERT INTO `clt_region` VALUES ('821', '91', '阳西县', '3');
INSERT INTO `clt_region` VALUES ('822', '91', '阳东县', '3');
INSERT INTO `clt_region` VALUES ('823', '92', '云城区', '3');
INSERT INTO `clt_region` VALUES ('824', '92', '罗定市', '3');
INSERT INTO `clt_region` VALUES ('825', '92', '新兴县', '3');
INSERT INTO `clt_region` VALUES ('826', '92', '郁南县', '3');
INSERT INTO `clt_region` VALUES ('827', '92', '云安县', '3');
INSERT INTO `clt_region` VALUES ('828', '93', '赤坎区', '3');
INSERT INTO `clt_region` VALUES ('829', '93', '霞山区', '3');
INSERT INTO `clt_region` VALUES ('830', '93', '坡头区', '3');
INSERT INTO `clt_region` VALUES ('831', '93', '麻章区', '3');
INSERT INTO `clt_region` VALUES ('832', '93', '廉江市', '3');
INSERT INTO `clt_region` VALUES ('833', '93', '雷州市', '3');
INSERT INTO `clt_region` VALUES ('834', '93', '吴川市', '3');
INSERT INTO `clt_region` VALUES ('835', '93', '遂溪县', '3');
INSERT INTO `clt_region` VALUES ('836', '93', '徐闻县', '3');
INSERT INTO `clt_region` VALUES ('837', '94', '肇庆市', '3');
INSERT INTO `clt_region` VALUES ('838', '94', '高要市', '3');
INSERT INTO `clt_region` VALUES ('839', '94', '四会市', '3');
INSERT INTO `clt_region` VALUES ('840', '94', '广宁县', '3');
INSERT INTO `clt_region` VALUES ('841', '94', '怀集县', '3');
INSERT INTO `clt_region` VALUES ('842', '94', '封开县', '3');
INSERT INTO `clt_region` VALUES ('843', '94', '德庆县', '3');
INSERT INTO `clt_region` VALUES ('844', '95', '石岐街道', '3');
INSERT INTO `clt_region` VALUES ('845', '95', '东区街道', '3');
INSERT INTO `clt_region` VALUES ('846', '95', '西区街道', '3');
INSERT INTO `clt_region` VALUES ('847', '95', '环城街道', '3');
INSERT INTO `clt_region` VALUES ('848', '95', '中山港街道', '3');
INSERT INTO `clt_region` VALUES ('849', '95', '五桂山街道', '3');
INSERT INTO `clt_region` VALUES ('850', '96', '香洲区', '3');
INSERT INTO `clt_region` VALUES ('851', '96', '斗门区', '3');
INSERT INTO `clt_region` VALUES ('852', '96', '金湾区', '3');
INSERT INTO `clt_region` VALUES ('853', '97', '邕宁区', '3');
INSERT INTO `clt_region` VALUES ('854', '97', '青秀区', '3');
INSERT INTO `clt_region` VALUES ('855', '97', '兴宁区', '3');
INSERT INTO `clt_region` VALUES ('856', '97', '良庆区', '3');
INSERT INTO `clt_region` VALUES ('857', '97', '西乡塘区', '3');
INSERT INTO `clt_region` VALUES ('858', '97', '江南区', '3');
INSERT INTO `clt_region` VALUES ('859', '97', '武鸣县', '3');
INSERT INTO `clt_region` VALUES ('860', '97', '隆安县', '3');
INSERT INTO `clt_region` VALUES ('861', '97', '马山县', '3');
INSERT INTO `clt_region` VALUES ('862', '97', '上林县', '3');
INSERT INTO `clt_region` VALUES ('863', '97', '宾阳县', '3');
INSERT INTO `clt_region` VALUES ('864', '97', '横县', '3');
INSERT INTO `clt_region` VALUES ('865', '98', '秀峰区', '3');
INSERT INTO `clt_region` VALUES ('866', '98', '叠彩区', '3');
INSERT INTO `clt_region` VALUES ('867', '98', '象山区', '3');
INSERT INTO `clt_region` VALUES ('868', '98', '七星区', '3');
INSERT INTO `clt_region` VALUES ('869', '98', '雁山区', '3');
INSERT INTO `clt_region` VALUES ('870', '98', '阳朔县', '3');
INSERT INTO `clt_region` VALUES ('871', '98', '临桂县', '3');
INSERT INTO `clt_region` VALUES ('872', '98', '灵川县', '3');
INSERT INTO `clt_region` VALUES ('873', '98', '全州县', '3');
INSERT INTO `clt_region` VALUES ('874', '98', '平乐县', '3');
INSERT INTO `clt_region` VALUES ('875', '98', '兴安县', '3');
INSERT INTO `clt_region` VALUES ('876', '98', '灌阳县', '3');
INSERT INTO `clt_region` VALUES ('877', '98', '荔浦县', '3');
INSERT INTO `clt_region` VALUES ('878', '98', '资源县', '3');
INSERT INTO `clt_region` VALUES ('879', '98', '永福县', '3');
INSERT INTO `clt_region` VALUES ('880', '98', '龙胜', '3');
INSERT INTO `clt_region` VALUES ('881', '98', '恭城', '3');
INSERT INTO `clt_region` VALUES ('882', '99', '右江区', '3');
INSERT INTO `clt_region` VALUES ('883', '99', '凌云县', '3');
INSERT INTO `clt_region` VALUES ('884', '99', '平果县', '3');
INSERT INTO `clt_region` VALUES ('885', '99', '西林县', '3');
INSERT INTO `clt_region` VALUES ('886', '99', '乐业县', '3');
INSERT INTO `clt_region` VALUES ('887', '99', '德保县', '3');
INSERT INTO `clt_region` VALUES ('888', '99', '田林县', '3');
INSERT INTO `clt_region` VALUES ('889', '99', '田阳县', '3');
INSERT INTO `clt_region` VALUES ('890', '99', '靖西县', '3');
INSERT INTO `clt_region` VALUES ('891', '99', '田东县', '3');
INSERT INTO `clt_region` VALUES ('892', '99', '那坡县', '3');
INSERT INTO `clt_region` VALUES ('893', '99', '隆林', '3');
INSERT INTO `clt_region` VALUES ('894', '100', '海城区', '3');
INSERT INTO `clt_region` VALUES ('895', '100', '银海区', '3');
INSERT INTO `clt_region` VALUES ('896', '100', '铁山港区', '3');
INSERT INTO `clt_region` VALUES ('897', '100', '合浦县', '3');
INSERT INTO `clt_region` VALUES ('898', '101', '江州区', '3');
INSERT INTO `clt_region` VALUES ('899', '101', '凭祥市', '3');
INSERT INTO `clt_region` VALUES ('900', '101', '宁明县', '3');
INSERT INTO `clt_region` VALUES ('901', '101', '扶绥县', '3');
INSERT INTO `clt_region` VALUES ('902', '101', '龙州县', '3');
INSERT INTO `clt_region` VALUES ('903', '101', '大新县', '3');
INSERT INTO `clt_region` VALUES ('904', '101', '天等县', '3');
INSERT INTO `clt_region` VALUES ('905', '102', '港口区', '3');
INSERT INTO `clt_region` VALUES ('906', '102', '防城区', '3');
INSERT INTO `clt_region` VALUES ('907', '102', '东兴市', '3');
INSERT INTO `clt_region` VALUES ('908', '102', '上思县', '3');
INSERT INTO `clt_region` VALUES ('909', '103', '港北区', '3');
INSERT INTO `clt_region` VALUES ('910', '103', '港南区', '3');
INSERT INTO `clt_region` VALUES ('911', '103', '覃塘区', '3');
INSERT INTO `clt_region` VALUES ('912', '103', '桂平市', '3');
INSERT INTO `clt_region` VALUES ('913', '103', '平南县', '3');
INSERT INTO `clt_region` VALUES ('914', '104', '金城江区', '3');
INSERT INTO `clt_region` VALUES ('915', '104', '宜州市', '3');
INSERT INTO `clt_region` VALUES ('916', '104', '天峨县', '3');
INSERT INTO `clt_region` VALUES ('917', '104', '凤山县', '3');
INSERT INTO `clt_region` VALUES ('918', '104', '南丹县', '3');
INSERT INTO `clt_region` VALUES ('919', '104', '东兰县', '3');
INSERT INTO `clt_region` VALUES ('920', '104', '都安', '3');
INSERT INTO `clt_region` VALUES ('921', '104', '罗城', '3');
INSERT INTO `clt_region` VALUES ('922', '104', '巴马', '3');
INSERT INTO `clt_region` VALUES ('923', '104', '环江', '3');
INSERT INTO `clt_region` VALUES ('924', '104', '大化', '3');
INSERT INTO `clt_region` VALUES ('925', '105', '八步区', '3');
INSERT INTO `clt_region` VALUES ('926', '105', '钟山县', '3');
INSERT INTO `clt_region` VALUES ('927', '105', '昭平县', '3');
INSERT INTO `clt_region` VALUES ('928', '105', '富川', '3');
INSERT INTO `clt_region` VALUES ('929', '106', '兴宾区', '3');
INSERT INTO `clt_region` VALUES ('930', '106', '合山市', '3');
INSERT INTO `clt_region` VALUES ('931', '106', '象州县', '3');
INSERT INTO `clt_region` VALUES ('932', '106', '武宣县', '3');
INSERT INTO `clt_region` VALUES ('933', '106', '忻城县', '3');
INSERT INTO `clt_region` VALUES ('934', '106', '金秀', '3');
INSERT INTO `clt_region` VALUES ('935', '107', '城中区', '3');
INSERT INTO `clt_region` VALUES ('936', '107', '鱼峰区', '3');
INSERT INTO `clt_region` VALUES ('937', '107', '柳北区', '3');
INSERT INTO `clt_region` VALUES ('938', '107', '柳南区', '3');
INSERT INTO `clt_region` VALUES ('939', '107', '柳江县', '3');
INSERT INTO `clt_region` VALUES ('940', '107', '柳城县', '3');
INSERT INTO `clt_region` VALUES ('941', '107', '鹿寨县', '3');
INSERT INTO `clt_region` VALUES ('942', '107', '融安县', '3');
INSERT INTO `clt_region` VALUES ('943', '107', '融水', '3');
INSERT INTO `clt_region` VALUES ('944', '107', '三江', '3');
INSERT INTO `clt_region` VALUES ('945', '108', '钦南区', '3');
INSERT INTO `clt_region` VALUES ('946', '108', '钦北区', '3');
INSERT INTO `clt_region` VALUES ('947', '108', '灵山县', '3');
INSERT INTO `clt_region` VALUES ('948', '108', '浦北县', '3');
INSERT INTO `clt_region` VALUES ('949', '109', '万秀区', '3');
INSERT INTO `clt_region` VALUES ('950', '109', '蝶山区', '3');
INSERT INTO `clt_region` VALUES ('951', '109', '长洲区', '3');
INSERT INTO `clt_region` VALUES ('952', '109', '岑溪市', '3');
INSERT INTO `clt_region` VALUES ('953', '109', '苍梧县', '3');
INSERT INTO `clt_region` VALUES ('954', '109', '藤县', '3');
INSERT INTO `clt_region` VALUES ('955', '109', '蒙山县', '3');
INSERT INTO `clt_region` VALUES ('956', '110', '玉州区', '3');
INSERT INTO `clt_region` VALUES ('957', '110', '北流市', '3');
INSERT INTO `clt_region` VALUES ('958', '110', '容县', '3');
INSERT INTO `clt_region` VALUES ('959', '110', '陆川县', '3');
INSERT INTO `clt_region` VALUES ('960', '110', '博白县', '3');
INSERT INTO `clt_region` VALUES ('961', '110', '兴业县', '3');
INSERT INTO `clt_region` VALUES ('962', '111', '南明区', '3');
INSERT INTO `clt_region` VALUES ('963', '111', '云岩区', '3');
INSERT INTO `clt_region` VALUES ('964', '111', '花溪区', '3');
INSERT INTO `clt_region` VALUES ('965', '111', '乌当区', '3');
INSERT INTO `clt_region` VALUES ('966', '111', '白云区', '3');
INSERT INTO `clt_region` VALUES ('967', '111', '小河区', '3');
INSERT INTO `clt_region` VALUES ('968', '111', '金阳新区', '3');
INSERT INTO `clt_region` VALUES ('969', '111', '新天园区', '3');
INSERT INTO `clt_region` VALUES ('970', '111', '清镇市', '3');
INSERT INTO `clt_region` VALUES ('971', '111', '开阳县', '3');
INSERT INTO `clt_region` VALUES ('972', '111', '修文县', '3');
INSERT INTO `clt_region` VALUES ('973', '111', '息烽县', '3');
INSERT INTO `clt_region` VALUES ('974', '112', '西秀区', '3');
INSERT INTO `clt_region` VALUES ('975', '112', '关岭', '3');
INSERT INTO `clt_region` VALUES ('976', '112', '镇宁', '3');
INSERT INTO `clt_region` VALUES ('977', '112', '紫云', '3');
INSERT INTO `clt_region` VALUES ('978', '112', '平坝县', '3');
INSERT INTO `clt_region` VALUES ('979', '112', '普定县', '3');
INSERT INTO `clt_region` VALUES ('980', '113', '毕节市', '3');
INSERT INTO `clt_region` VALUES ('981', '113', '大方县', '3');
INSERT INTO `clt_region` VALUES ('982', '113', '黔西县', '3');
INSERT INTO `clt_region` VALUES ('983', '113', '金沙县', '3');
INSERT INTO `clt_region` VALUES ('984', '113', '织金县', '3');
INSERT INTO `clt_region` VALUES ('985', '113', '纳雍县', '3');
INSERT INTO `clt_region` VALUES ('986', '113', '赫章县', '3');
INSERT INTO `clt_region` VALUES ('987', '113', '威宁', '3');
INSERT INTO `clt_region` VALUES ('988', '114', '钟山区', '3');
INSERT INTO `clt_region` VALUES ('989', '114', '六枝特区', '3');
INSERT INTO `clt_region` VALUES ('990', '114', '水城县', '3');
INSERT INTO `clt_region` VALUES ('991', '114', '盘县', '3');
INSERT INTO `clt_region` VALUES ('992', '115', '凯里市', '3');
INSERT INTO `clt_region` VALUES ('993', '115', '黄平县', '3');
INSERT INTO `clt_region` VALUES ('994', '115', '施秉县', '3');
INSERT INTO `clt_region` VALUES ('995', '115', '三穗县', '3');
INSERT INTO `clt_region` VALUES ('996', '115', '镇远县', '3');
INSERT INTO `clt_region` VALUES ('997', '115', '岑巩县', '3');
INSERT INTO `clt_region` VALUES ('998', '115', '天柱县', '3');
INSERT INTO `clt_region` VALUES ('999', '115', '锦屏县', '3');
INSERT INTO `clt_region` VALUES ('1000', '115', '剑河县', '3');
INSERT INTO `clt_region` VALUES ('1001', '115', '台江县', '3');
INSERT INTO `clt_region` VALUES ('1002', '115', '黎平县', '3');
INSERT INTO `clt_region` VALUES ('1003', '115', '榕江县', '3');
INSERT INTO `clt_region` VALUES ('1004', '115', '从江县', '3');
INSERT INTO `clt_region` VALUES ('1005', '115', '雷山县', '3');
INSERT INTO `clt_region` VALUES ('1006', '115', '麻江县', '3');
INSERT INTO `clt_region` VALUES ('1007', '115', '丹寨县', '3');
INSERT INTO `clt_region` VALUES ('1008', '116', '都匀市', '3');
INSERT INTO `clt_region` VALUES ('1009', '116', '福泉市', '3');
INSERT INTO `clt_region` VALUES ('1010', '116', '荔波县', '3');
INSERT INTO `clt_region` VALUES ('1011', '116', '贵定县', '3');
INSERT INTO `clt_region` VALUES ('1012', '116', '瓮安县', '3');
INSERT INTO `clt_region` VALUES ('1013', '116', '独山县', '3');
INSERT INTO `clt_region` VALUES ('1014', '116', '平塘县', '3');
INSERT INTO `clt_region` VALUES ('1015', '116', '罗甸县', '3');
INSERT INTO `clt_region` VALUES ('1016', '116', '长顺县', '3');
INSERT INTO `clt_region` VALUES ('1017', '116', '龙里县', '3');
INSERT INTO `clt_region` VALUES ('1018', '116', '惠水县', '3');
INSERT INTO `clt_region` VALUES ('1019', '116', '三都', '3');
INSERT INTO `clt_region` VALUES ('1020', '117', '兴义市', '3');
INSERT INTO `clt_region` VALUES ('1021', '117', '兴仁县', '3');
INSERT INTO `clt_region` VALUES ('1022', '117', '普安县', '3');
INSERT INTO `clt_region` VALUES ('1023', '117', '晴隆县', '3');
INSERT INTO `clt_region` VALUES ('1024', '117', '贞丰县', '3');
INSERT INTO `clt_region` VALUES ('1025', '117', '望谟县', '3');
INSERT INTO `clt_region` VALUES ('1026', '117', '册亨县', '3');
INSERT INTO `clt_region` VALUES ('1027', '117', '安龙县', '3');
INSERT INTO `clt_region` VALUES ('1028', '118', '铜仁市', '3');
INSERT INTO `clt_region` VALUES ('1029', '118', '江口县', '3');
INSERT INTO `clt_region` VALUES ('1030', '118', '石阡县', '3');
INSERT INTO `clt_region` VALUES ('1031', '118', '思南县', '3');
INSERT INTO `clt_region` VALUES ('1032', '118', '德江县', '3');
INSERT INTO `clt_region` VALUES ('1033', '118', '玉屏', '3');
INSERT INTO `clt_region` VALUES ('1034', '118', '印江', '3');
INSERT INTO `clt_region` VALUES ('1035', '118', '沿河', '3');
INSERT INTO `clt_region` VALUES ('1036', '118', '松桃', '3');
INSERT INTO `clt_region` VALUES ('1037', '118', '万山特区', '3');
INSERT INTO `clt_region` VALUES ('1038', '119', '红花岗区', '3');
INSERT INTO `clt_region` VALUES ('1039', '119', '务川县', '3');
INSERT INTO `clt_region` VALUES ('1040', '119', '道真县', '3');
INSERT INTO `clt_region` VALUES ('1041', '119', '汇川区', '3');
INSERT INTO `clt_region` VALUES ('1042', '119', '赤水市', '3');
INSERT INTO `clt_region` VALUES ('1043', '119', '仁怀市', '3');
INSERT INTO `clt_region` VALUES ('1044', '119', '遵义县', '3');
INSERT INTO `clt_region` VALUES ('1045', '119', '桐梓县', '3');
INSERT INTO `clt_region` VALUES ('1046', '119', '绥阳县', '3');
INSERT INTO `clt_region` VALUES ('1047', '119', '正安县', '3');
INSERT INTO `clt_region` VALUES ('1048', '119', '凤冈县', '3');
INSERT INTO `clt_region` VALUES ('1049', '119', '湄潭县', '3');
INSERT INTO `clt_region` VALUES ('1050', '119', '余庆县', '3');
INSERT INTO `clt_region` VALUES ('1051', '119', '习水县', '3');
INSERT INTO `clt_region` VALUES ('1052', '119', '道真', '3');
INSERT INTO `clt_region` VALUES ('1053', '119', '务川', '3');
INSERT INTO `clt_region` VALUES ('1054', '120', '秀英区', '3');
INSERT INTO `clt_region` VALUES ('1055', '120', '龙华区', '3');
INSERT INTO `clt_region` VALUES ('1056', '120', '琼山区', '3');
INSERT INTO `clt_region` VALUES ('1057', '120', '美兰区', '3');
INSERT INTO `clt_region` VALUES ('1058', '137', '市区', '3');
INSERT INTO `clt_region` VALUES ('1059', '137', '洋浦开发区', '3');
INSERT INTO `clt_region` VALUES ('1060', '137', '那大镇', '3');
INSERT INTO `clt_region` VALUES ('1061', '137', '王五镇', '3');
INSERT INTO `clt_region` VALUES ('1062', '137', '雅星镇', '3');
INSERT INTO `clt_region` VALUES ('1063', '137', '大成镇', '3');
INSERT INTO `clt_region` VALUES ('1064', '137', '中和镇', '3');
INSERT INTO `clt_region` VALUES ('1065', '137', '峨蔓镇', '3');
INSERT INTO `clt_region` VALUES ('1066', '137', '南丰镇', '3');
INSERT INTO `clt_region` VALUES ('1067', '137', '白马井镇', '3');
INSERT INTO `clt_region` VALUES ('1068', '137', '兰洋镇', '3');
INSERT INTO `clt_region` VALUES ('1069', '137', '和庆镇', '3');
INSERT INTO `clt_region` VALUES ('1070', '137', '海头镇', '3');
INSERT INTO `clt_region` VALUES ('1071', '137', '排浦镇', '3');
INSERT INTO `clt_region` VALUES ('1072', '137', '东成镇', '3');
INSERT INTO `clt_region` VALUES ('1073', '137', '光村镇', '3');
INSERT INTO `clt_region` VALUES ('1074', '137', '木棠镇', '3');
INSERT INTO `clt_region` VALUES ('1075', '137', '新州镇', '3');
INSERT INTO `clt_region` VALUES ('1076', '137', '三都镇', '3');
INSERT INTO `clt_region` VALUES ('1077', '137', '其他', '3');
INSERT INTO `clt_region` VALUES ('1078', '138', '长安区', '3');
INSERT INTO `clt_region` VALUES ('1079', '138', '桥东区', '3');
INSERT INTO `clt_region` VALUES ('1080', '138', '桥西区', '3');
INSERT INTO `clt_region` VALUES ('1081', '138', '新华区', '3');
INSERT INTO `clt_region` VALUES ('1082', '138', '裕华区', '3');
INSERT INTO `clt_region` VALUES ('1083', '138', '井陉矿区', '3');
INSERT INTO `clt_region` VALUES ('1084', '138', '高新区', '3');
INSERT INTO `clt_region` VALUES ('1085', '138', '辛集市', '3');
INSERT INTO `clt_region` VALUES ('1086', '138', '藁城市', '3');
INSERT INTO `clt_region` VALUES ('1087', '138', '晋州市', '3');
INSERT INTO `clt_region` VALUES ('1088', '138', '新乐市', '3');
INSERT INTO `clt_region` VALUES ('1089', '138', '鹿泉市', '3');
INSERT INTO `clt_region` VALUES ('1090', '138', '井陉县', '3');
INSERT INTO `clt_region` VALUES ('1091', '138', '正定县', '3');
INSERT INTO `clt_region` VALUES ('1092', '138', '栾城县', '3');
INSERT INTO `clt_region` VALUES ('1093', '138', '行唐县', '3');
INSERT INTO `clt_region` VALUES ('1094', '138', '灵寿县', '3');
INSERT INTO `clt_region` VALUES ('1095', '138', '高邑县', '3');
INSERT INTO `clt_region` VALUES ('1096', '138', '深泽县', '3');
INSERT INTO `clt_region` VALUES ('1097', '138', '赞皇县', '3');
INSERT INTO `clt_region` VALUES ('1098', '138', '无极县', '3');
INSERT INTO `clt_region` VALUES ('1099', '138', '平山县', '3');
INSERT INTO `clt_region` VALUES ('1100', '138', '元氏县', '3');
INSERT INTO `clt_region` VALUES ('1101', '138', '赵县', '3');
INSERT INTO `clt_region` VALUES ('1102', '139', '新市区', '3');
INSERT INTO `clt_region` VALUES ('1103', '139', '南市区', '3');
INSERT INTO `clt_region` VALUES ('1104', '139', '北市区', '3');
INSERT INTO `clt_region` VALUES ('1105', '139', '涿州市', '3');
INSERT INTO `clt_region` VALUES ('1106', '139', '定州市', '3');
INSERT INTO `clt_region` VALUES ('1107', '139', '安国市', '3');
INSERT INTO `clt_region` VALUES ('1108', '139', '高碑店市', '3');
INSERT INTO `clt_region` VALUES ('1109', '139', '满城县', '3');
INSERT INTO `clt_region` VALUES ('1110', '139', '清苑县', '3');
INSERT INTO `clt_region` VALUES ('1111', '139', '涞水县', '3');
INSERT INTO `clt_region` VALUES ('1112', '139', '阜平县', '3');
INSERT INTO `clt_region` VALUES ('1113', '139', '徐水县', '3');
INSERT INTO `clt_region` VALUES ('1114', '139', '定兴县', '3');
INSERT INTO `clt_region` VALUES ('1115', '139', '唐县', '3');
INSERT INTO `clt_region` VALUES ('1116', '139', '高阳县', '3');
INSERT INTO `clt_region` VALUES ('1117', '139', '容城县', '3');
INSERT INTO `clt_region` VALUES ('1118', '139', '涞源县', '3');
INSERT INTO `clt_region` VALUES ('1119', '139', '望都县', '3');
INSERT INTO `clt_region` VALUES ('1120', '139', '安新县', '3');
INSERT INTO `clt_region` VALUES ('1121', '139', '易县', '3');
INSERT INTO `clt_region` VALUES ('1122', '139', '曲阳县', '3');
INSERT INTO `clt_region` VALUES ('1123', '139', '蠡县', '3');
INSERT INTO `clt_region` VALUES ('1124', '139', '顺平县', '3');
INSERT INTO `clt_region` VALUES ('1125', '139', '博野县', '3');
INSERT INTO `clt_region` VALUES ('1126', '139', '雄县', '3');
INSERT INTO `clt_region` VALUES ('1127', '140', '运河区', '3');
INSERT INTO `clt_region` VALUES ('1128', '140', '新华区', '3');
INSERT INTO `clt_region` VALUES ('1129', '140', '泊头市', '3');
INSERT INTO `clt_region` VALUES ('1130', '140', '任丘市', '3');
INSERT INTO `clt_region` VALUES ('1131', '140', '黄骅市', '3');
INSERT INTO `clt_region` VALUES ('1132', '140', '河间市', '3');
INSERT INTO `clt_region` VALUES ('1133', '140', '沧县', '3');
INSERT INTO `clt_region` VALUES ('1134', '140', '青县', '3');
INSERT INTO `clt_region` VALUES ('1135', '140', '东光县', '3');
INSERT INTO `clt_region` VALUES ('1136', '140', '海兴县', '3');
INSERT INTO `clt_region` VALUES ('1137', '140', '盐山县', '3');
INSERT INTO `clt_region` VALUES ('1138', '140', '肃宁县', '3');
INSERT INTO `clt_region` VALUES ('1139', '140', '南皮县', '3');
INSERT INTO `clt_region` VALUES ('1140', '140', '吴桥县', '3');
INSERT INTO `clt_region` VALUES ('1141', '140', '献县', '3');
INSERT INTO `clt_region` VALUES ('1142', '140', '孟村', '3');
INSERT INTO `clt_region` VALUES ('1143', '141', '双桥区', '3');
INSERT INTO `clt_region` VALUES ('1144', '141', '双滦区', '3');
INSERT INTO `clt_region` VALUES ('1145', '141', '鹰手营子矿区', '3');
INSERT INTO `clt_region` VALUES ('1146', '141', '承德县', '3');
INSERT INTO `clt_region` VALUES ('1147', '141', '兴隆县', '3');
INSERT INTO `clt_region` VALUES ('1148', '141', '平泉县', '3');
INSERT INTO `clt_region` VALUES ('1149', '141', '滦平县', '3');
INSERT INTO `clt_region` VALUES ('1150', '141', '隆化县', '3');
INSERT INTO `clt_region` VALUES ('1151', '141', '丰宁', '3');
INSERT INTO `clt_region` VALUES ('1152', '141', '宽城', '3');
INSERT INTO `clt_region` VALUES ('1153', '141', '围场', '3');
INSERT INTO `clt_region` VALUES ('1154', '142', '从台区', '3');
INSERT INTO `clt_region` VALUES ('1155', '142', '复兴区', '3');
INSERT INTO `clt_region` VALUES ('1156', '142', '邯山区', '3');
INSERT INTO `clt_region` VALUES ('1157', '142', '峰峰矿区', '3');
INSERT INTO `clt_region` VALUES ('1158', '142', '武安市', '3');
INSERT INTO `clt_region` VALUES ('1159', '142', '邯郸县', '3');
INSERT INTO `clt_region` VALUES ('1160', '142', '临漳县', '3');
INSERT INTO `clt_region` VALUES ('1161', '142', '成安县', '3');
INSERT INTO `clt_region` VALUES ('1162', '142', '大名县', '3');
INSERT INTO `clt_region` VALUES ('1163', '142', '涉县', '3');
INSERT INTO `clt_region` VALUES ('1164', '142', '磁县', '3');
INSERT INTO `clt_region` VALUES ('1165', '142', '肥乡县', '3');
INSERT INTO `clt_region` VALUES ('1166', '142', '永年县', '3');
INSERT INTO `clt_region` VALUES ('1167', '142', '邱县', '3');
INSERT INTO `clt_region` VALUES ('1168', '142', '鸡泽县', '3');
INSERT INTO `clt_region` VALUES ('1169', '142', '广平县', '3');
INSERT INTO `clt_region` VALUES ('1170', '142', '馆陶县', '3');
INSERT INTO `clt_region` VALUES ('1171', '142', '魏县', '3');
INSERT INTO `clt_region` VALUES ('1172', '142', '曲周县', '3');
INSERT INTO `clt_region` VALUES ('1173', '143', '桃城区', '3');
INSERT INTO `clt_region` VALUES ('1174', '143', '冀州市', '3');
INSERT INTO `clt_region` VALUES ('1175', '143', '深州市', '3');
INSERT INTO `clt_region` VALUES ('1176', '143', '枣强县', '3');
INSERT INTO `clt_region` VALUES ('1177', '143', '武邑县', '3');
INSERT INTO `clt_region` VALUES ('1178', '143', '武强县', '3');
INSERT INTO `clt_region` VALUES ('1179', '143', '饶阳县', '3');
INSERT INTO `clt_region` VALUES ('1180', '143', '安平县', '3');
INSERT INTO `clt_region` VALUES ('1181', '143', '故城县', '3');
INSERT INTO `clt_region` VALUES ('1182', '143', '景县', '3');
INSERT INTO `clt_region` VALUES ('1183', '143', '阜城县', '3');
INSERT INTO `clt_region` VALUES ('1184', '144', '安次区', '3');
INSERT INTO `clt_region` VALUES ('1185', '144', '广阳区', '3');
INSERT INTO `clt_region` VALUES ('1186', '144', '霸州市', '3');
INSERT INTO `clt_region` VALUES ('1187', '144', '三河市', '3');
INSERT INTO `clt_region` VALUES ('1188', '144', '固安县', '3');
INSERT INTO `clt_region` VALUES ('1189', '144', '永清县', '3');
INSERT INTO `clt_region` VALUES ('1190', '144', '香河县', '3');
INSERT INTO `clt_region` VALUES ('1191', '144', '大城县', '3');
INSERT INTO `clt_region` VALUES ('1192', '144', '文安县', '3');
INSERT INTO `clt_region` VALUES ('1193', '144', '大厂', '3');
INSERT INTO `clt_region` VALUES ('1194', '145', '海港区', '3');
INSERT INTO `clt_region` VALUES ('1195', '145', '山海关区', '3');
INSERT INTO `clt_region` VALUES ('1196', '145', '北戴河区', '3');
INSERT INTO `clt_region` VALUES ('1197', '145', '昌黎县', '3');
INSERT INTO `clt_region` VALUES ('1198', '145', '抚宁县', '3');
INSERT INTO `clt_region` VALUES ('1199', '145', '卢龙县', '3');
INSERT INTO `clt_region` VALUES ('1200', '145', '青龙', '3');
INSERT INTO `clt_region` VALUES ('1201', '146', '路北区', '3');
INSERT INTO `clt_region` VALUES ('1202', '146', '路南区', '3');
INSERT INTO `clt_region` VALUES ('1203', '146', '古冶区', '3');
INSERT INTO `clt_region` VALUES ('1204', '146', '开平区', '3');
INSERT INTO `clt_region` VALUES ('1205', '146', '丰南区', '3');
INSERT INTO `clt_region` VALUES ('1206', '146', '丰润区', '3');
INSERT INTO `clt_region` VALUES ('1207', '146', '遵化市', '3');
INSERT INTO `clt_region` VALUES ('1208', '146', '迁安市', '3');
INSERT INTO `clt_region` VALUES ('1209', '146', '滦县', '3');
INSERT INTO `clt_region` VALUES ('1210', '146', '滦南县', '3');
INSERT INTO `clt_region` VALUES ('1211', '146', '乐亭县', '3');
INSERT INTO `clt_region` VALUES ('1212', '146', '迁西县', '3');
INSERT INTO `clt_region` VALUES ('1213', '146', '玉田县', '3');
INSERT INTO `clt_region` VALUES ('1214', '146', '唐海县', '3');
INSERT INTO `clt_region` VALUES ('1215', '147', '桥东区', '3');
INSERT INTO `clt_region` VALUES ('1216', '147', '桥西区', '3');
INSERT INTO `clt_region` VALUES ('1217', '147', '南宫市', '3');
INSERT INTO `clt_region` VALUES ('1218', '147', '沙河市', '3');
INSERT INTO `clt_region` VALUES ('1219', '147', '邢台县', '3');
INSERT INTO `clt_region` VALUES ('1220', '147', '临城县', '3');
INSERT INTO `clt_region` VALUES ('1221', '147', '内丘县', '3');
INSERT INTO `clt_region` VALUES ('1222', '147', '柏乡县', '3');
INSERT INTO `clt_region` VALUES ('1223', '147', '隆尧县', '3');
INSERT INTO `clt_region` VALUES ('1224', '147', '任县', '3');
INSERT INTO `clt_region` VALUES ('1225', '147', '南和县', '3');
INSERT INTO `clt_region` VALUES ('1226', '147', '宁晋县', '3');
INSERT INTO `clt_region` VALUES ('1227', '147', '巨鹿县', '3');
INSERT INTO `clt_region` VALUES ('1228', '147', '新河县', '3');
INSERT INTO `clt_region` VALUES ('1229', '147', '广宗县', '3');
INSERT INTO `clt_region` VALUES ('1230', '147', '平乡县', '3');
INSERT INTO `clt_region` VALUES ('1231', '147', '威县', '3');
INSERT INTO `clt_region` VALUES ('1232', '147', '清河县', '3');
INSERT INTO `clt_region` VALUES ('1233', '147', '临西县', '3');
INSERT INTO `clt_region` VALUES ('1234', '148', '桥西区', '3');
INSERT INTO `clt_region` VALUES ('1235', '148', '桥东区', '3');
INSERT INTO `clt_region` VALUES ('1236', '148', '宣化区', '3');
INSERT INTO `clt_region` VALUES ('1237', '148', '下花园区', '3');
INSERT INTO `clt_region` VALUES ('1238', '148', '宣化县', '3');
INSERT INTO `clt_region` VALUES ('1239', '148', '张北县', '3');
INSERT INTO `clt_region` VALUES ('1240', '148', '康保县', '3');
INSERT INTO `clt_region` VALUES ('1241', '148', '沽源县', '3');
INSERT INTO `clt_region` VALUES ('1242', '148', '尚义县', '3');
INSERT INTO `clt_region` VALUES ('1243', '148', '蔚县', '3');
INSERT INTO `clt_region` VALUES ('1244', '148', '阳原县', '3');
INSERT INTO `clt_region` VALUES ('1245', '148', '怀安县', '3');
INSERT INTO `clt_region` VALUES ('1246', '148', '万全县', '3');
INSERT INTO `clt_region` VALUES ('1247', '148', '怀来县', '3');
INSERT INTO `clt_region` VALUES ('1248', '148', '涿鹿县', '3');
INSERT INTO `clt_region` VALUES ('1249', '148', '赤城县', '3');
INSERT INTO `clt_region` VALUES ('1250', '148', '崇礼县', '3');
INSERT INTO `clt_region` VALUES ('1251', '149', '金水区', '3');
INSERT INTO `clt_region` VALUES ('1252', '149', '邙山区', '3');
INSERT INTO `clt_region` VALUES ('1253', '149', '二七区', '3');
INSERT INTO `clt_region` VALUES ('1254', '149', '管城区', '3');
INSERT INTO `clt_region` VALUES ('1255', '149', '中原区', '3');
INSERT INTO `clt_region` VALUES ('1256', '149', '上街区', '3');
INSERT INTO `clt_region` VALUES ('1257', '149', '惠济区', '3');
INSERT INTO `clt_region` VALUES ('1258', '149', '郑东新区', '3');
INSERT INTO `clt_region` VALUES ('1259', '149', '经济技术开发区', '3');
INSERT INTO `clt_region` VALUES ('1260', '149', '高新开发区', '3');
INSERT INTO `clt_region` VALUES ('1261', '149', '出口加工区', '3');
INSERT INTO `clt_region` VALUES ('1262', '149', '巩义市', '3');
INSERT INTO `clt_region` VALUES ('1263', '149', '荥阳市', '3');
INSERT INTO `clt_region` VALUES ('1264', '149', '新密市', '3');
INSERT INTO `clt_region` VALUES ('1265', '149', '新郑市', '3');
INSERT INTO `clt_region` VALUES ('1266', '149', '登封市', '3');
INSERT INTO `clt_region` VALUES ('1267', '149', '中牟县', '3');
INSERT INTO `clt_region` VALUES ('1268', '150', '西工区', '3');
INSERT INTO `clt_region` VALUES ('1269', '150', '老城区', '3');
INSERT INTO `clt_region` VALUES ('1270', '150', '涧西区', '3');
INSERT INTO `clt_region` VALUES ('1271', '150', '瀍河回族区', '3');
INSERT INTO `clt_region` VALUES ('1272', '150', '洛龙区', '3');
INSERT INTO `clt_region` VALUES ('1273', '150', '吉利区', '3');
INSERT INTO `clt_region` VALUES ('1274', '150', '偃师市', '3');
INSERT INTO `clt_region` VALUES ('1275', '150', '孟津县', '3');
INSERT INTO `clt_region` VALUES ('1276', '150', '新安县', '3');
INSERT INTO `clt_region` VALUES ('1277', '150', '栾川县', '3');
INSERT INTO `clt_region` VALUES ('1278', '150', '嵩县', '3');
INSERT INTO `clt_region` VALUES ('1279', '150', '汝阳县', '3');
INSERT INTO `clt_region` VALUES ('1280', '150', '宜阳县', '3');
INSERT INTO `clt_region` VALUES ('1281', '150', '洛宁县', '3');
INSERT INTO `clt_region` VALUES ('1282', '150', '伊川县', '3');
INSERT INTO `clt_region` VALUES ('1283', '151', '鼓楼区', '3');
INSERT INTO `clt_region` VALUES ('1284', '151', '龙亭区', '3');
INSERT INTO `clt_region` VALUES ('1285', '151', '顺河回族区', '3');
INSERT INTO `clt_region` VALUES ('1286', '151', '金明区', '3');
INSERT INTO `clt_region` VALUES ('1287', '151', '禹王台区', '3');
INSERT INTO `clt_region` VALUES ('1288', '151', '杞县', '3');
INSERT INTO `clt_region` VALUES ('1289', '151', '通许县', '3');
INSERT INTO `clt_region` VALUES ('1290', '151', '尉氏县', '3');
INSERT INTO `clt_region` VALUES ('1291', '151', '开封县', '3');
INSERT INTO `clt_region` VALUES ('1292', '151', '兰考县', '3');
INSERT INTO `clt_region` VALUES ('1293', '152', '北关区', '3');
INSERT INTO `clt_region` VALUES ('1294', '152', '文峰区', '3');
INSERT INTO `clt_region` VALUES ('1295', '152', '殷都区', '3');
INSERT INTO `clt_region` VALUES ('1296', '152', '龙安区', '3');
INSERT INTO `clt_region` VALUES ('1297', '152', '林州市', '3');
INSERT INTO `clt_region` VALUES ('1298', '152', '安阳县', '3');
INSERT INTO `clt_region` VALUES ('1299', '152', '汤阴县', '3');
INSERT INTO `clt_region` VALUES ('1300', '152', '滑县', '3');
INSERT INTO `clt_region` VALUES ('1301', '152', '内黄县', '3');
INSERT INTO `clt_region` VALUES ('1302', '153', '淇滨区', '3');
INSERT INTO `clt_region` VALUES ('1303', '153', '山城区', '3');
INSERT INTO `clt_region` VALUES ('1304', '153', '鹤山区', '3');
INSERT INTO `clt_region` VALUES ('1305', '153', '浚县', '3');
INSERT INTO `clt_region` VALUES ('1306', '153', '淇县', '3');
INSERT INTO `clt_region` VALUES ('1307', '154', '济源市', '3');
INSERT INTO `clt_region` VALUES ('1308', '155', '解放区', '3');
INSERT INTO `clt_region` VALUES ('1309', '155', '中站区', '3');
INSERT INTO `clt_region` VALUES ('1310', '155', '马村区', '3');
INSERT INTO `clt_region` VALUES ('1311', '155', '山阳区', '3');
INSERT INTO `clt_region` VALUES ('1312', '155', '沁阳市', '3');
INSERT INTO `clt_region` VALUES ('1313', '155', '孟州市', '3');
INSERT INTO `clt_region` VALUES ('1314', '155', '修武县', '3');
INSERT INTO `clt_region` VALUES ('1315', '155', '博爱县', '3');
INSERT INTO `clt_region` VALUES ('1316', '155', '武陟县', '3');
INSERT INTO `clt_region` VALUES ('1317', '155', '温县', '3');
INSERT INTO `clt_region` VALUES ('1318', '156', '卧龙区', '3');
INSERT INTO `clt_region` VALUES ('1319', '156', '宛城区', '3');
INSERT INTO `clt_region` VALUES ('1320', '156', '邓州市', '3');
INSERT INTO `clt_region` VALUES ('1321', '156', '南召县', '3');
INSERT INTO `clt_region` VALUES ('1322', '156', '方城县', '3');
INSERT INTO `clt_region` VALUES ('1323', '156', '西峡县', '3');
INSERT INTO `clt_region` VALUES ('1324', '156', '镇平县', '3');
INSERT INTO `clt_region` VALUES ('1325', '156', '内乡县', '3');
INSERT INTO `clt_region` VALUES ('1326', '156', '淅川县', '3');
INSERT INTO `clt_region` VALUES ('1327', '156', '社旗县', '3');
INSERT INTO `clt_region` VALUES ('1328', '156', '唐河县', '3');
INSERT INTO `clt_region` VALUES ('1329', '156', '新野县', '3');
INSERT INTO `clt_region` VALUES ('1330', '156', '桐柏县', '3');
INSERT INTO `clt_region` VALUES ('1331', '157', '新华区', '3');
INSERT INTO `clt_region` VALUES ('1332', '157', '卫东区', '3');
INSERT INTO `clt_region` VALUES ('1333', '157', '湛河区', '3');
INSERT INTO `clt_region` VALUES ('1334', '157', '石龙区', '3');
INSERT INTO `clt_region` VALUES ('1335', '157', '舞钢市', '3');
INSERT INTO `clt_region` VALUES ('1336', '157', '汝州市', '3');
INSERT INTO `clt_region` VALUES ('1337', '157', '宝丰县', '3');
INSERT INTO `clt_region` VALUES ('1338', '157', '叶县', '3');
INSERT INTO `clt_region` VALUES ('1339', '157', '鲁山县', '3');
INSERT INTO `clt_region` VALUES ('1340', '157', '郏县', '3');
INSERT INTO `clt_region` VALUES ('1341', '158', '湖滨区', '3');
INSERT INTO `clt_region` VALUES ('1342', '158', '义马市', '3');
INSERT INTO `clt_region` VALUES ('1343', '158', '灵宝市', '3');
INSERT INTO `clt_region` VALUES ('1344', '158', '渑池县', '3');
INSERT INTO `clt_region` VALUES ('1345', '158', '陕县', '3');
INSERT INTO `clt_region` VALUES ('1346', '158', '卢氏县', '3');
INSERT INTO `clt_region` VALUES ('1347', '159', '梁园区', '3');
INSERT INTO `clt_region` VALUES ('1348', '159', '睢阳区', '3');
INSERT INTO `clt_region` VALUES ('1349', '159', '永城市', '3');
INSERT INTO `clt_region` VALUES ('1350', '159', '民权县', '3');
INSERT INTO `clt_region` VALUES ('1351', '159', '睢县', '3');
INSERT INTO `clt_region` VALUES ('1352', '159', '宁陵县', '3');
INSERT INTO `clt_region` VALUES ('1353', '159', '虞城县', '3');
INSERT INTO `clt_region` VALUES ('1354', '159', '柘城县', '3');
INSERT INTO `clt_region` VALUES ('1355', '159', '夏邑县', '3');
INSERT INTO `clt_region` VALUES ('1356', '160', '卫滨区', '3');
INSERT INTO `clt_region` VALUES ('1357', '160', '红旗区', '3');
INSERT INTO `clt_region` VALUES ('1358', '160', '凤泉区', '3');
INSERT INTO `clt_region` VALUES ('1359', '160', '牧野区', '3');
INSERT INTO `clt_region` VALUES ('1360', '160', '卫辉市', '3');
INSERT INTO `clt_region` VALUES ('1361', '160', '辉县市', '3');
INSERT INTO `clt_region` VALUES ('1362', '160', '新乡县', '3');
INSERT INTO `clt_region` VALUES ('1363', '160', '获嘉县', '3');
INSERT INTO `clt_region` VALUES ('1364', '160', '原阳县', '3');
INSERT INTO `clt_region` VALUES ('1365', '160', '延津县', '3');
INSERT INTO `clt_region` VALUES ('1366', '160', '封丘县', '3');
INSERT INTO `clt_region` VALUES ('1367', '160', '长垣县', '3');
INSERT INTO `clt_region` VALUES ('1368', '161', '浉河区', '3');
INSERT INTO `clt_region` VALUES ('1369', '161', '平桥区', '3');
INSERT INTO `clt_region` VALUES ('1370', '161', '罗山县', '3');
INSERT INTO `clt_region` VALUES ('1371', '161', '光山县', '3');
INSERT INTO `clt_region` VALUES ('1372', '161', '新县', '3');
INSERT INTO `clt_region` VALUES ('1373', '161', '商城县', '3');
INSERT INTO `clt_region` VALUES ('1374', '161', '固始县', '3');
INSERT INTO `clt_region` VALUES ('1375', '161', '潢川县', '3');
INSERT INTO `clt_region` VALUES ('1376', '161', '淮滨县', '3');
INSERT INTO `clt_region` VALUES ('1377', '161', '息县', '3');
INSERT INTO `clt_region` VALUES ('1378', '162', '魏都区', '3');
INSERT INTO `clt_region` VALUES ('1379', '162', '禹州市', '3');
INSERT INTO `clt_region` VALUES ('1380', '162', '长葛市', '3');
INSERT INTO `clt_region` VALUES ('1381', '162', '许昌县', '3');
INSERT INTO `clt_region` VALUES ('1382', '162', '鄢陵县', '3');
INSERT INTO `clt_region` VALUES ('1383', '162', '襄城县', '3');
INSERT INTO `clt_region` VALUES ('1384', '163', '川汇区', '3');
INSERT INTO `clt_region` VALUES ('1385', '163', '项城市', '3');
INSERT INTO `clt_region` VALUES ('1386', '163', '扶沟县', '3');
INSERT INTO `clt_region` VALUES ('1387', '163', '西华县', '3');
INSERT INTO `clt_region` VALUES ('1388', '163', '商水县', '3');
INSERT INTO `clt_region` VALUES ('1389', '163', '沈丘县', '3');
INSERT INTO `clt_region` VALUES ('1390', '163', '郸城县', '3');
INSERT INTO `clt_region` VALUES ('1391', '163', '淮阳县', '3');
INSERT INTO `clt_region` VALUES ('1392', '163', '太康县', '3');
INSERT INTO `clt_region` VALUES ('1393', '163', '鹿邑县', '3');
INSERT INTO `clt_region` VALUES ('1394', '164', '驿城区', '3');
INSERT INTO `clt_region` VALUES ('1395', '164', '西平县', '3');
INSERT INTO `clt_region` VALUES ('1396', '164', '上蔡县', '3');
INSERT INTO `clt_region` VALUES ('1397', '164', '平舆县', '3');
INSERT INTO `clt_region` VALUES ('1398', '164', '正阳县', '3');
INSERT INTO `clt_region` VALUES ('1399', '164', '确山县', '3');
INSERT INTO `clt_region` VALUES ('1400', '164', '泌阳县', '3');
INSERT INTO `clt_region` VALUES ('1401', '164', '汝南县', '3');
INSERT INTO `clt_region` VALUES ('1402', '164', '遂平县', '3');
INSERT INTO `clt_region` VALUES ('1403', '164', '新蔡县', '3');
INSERT INTO `clt_region` VALUES ('1404', '165', '郾城区', '3');
INSERT INTO `clt_region` VALUES ('1405', '165', '源汇区', '3');
INSERT INTO `clt_region` VALUES ('1406', '165', '召陵区', '3');
INSERT INTO `clt_region` VALUES ('1407', '165', '舞阳县', '3');
INSERT INTO `clt_region` VALUES ('1408', '165', '临颍县', '3');
INSERT INTO `clt_region` VALUES ('1409', '166', '华龙区', '3');
INSERT INTO `clt_region` VALUES ('1410', '166', '清丰县', '3');
INSERT INTO `clt_region` VALUES ('1411', '166', '南乐县', '3');
INSERT INTO `clt_region` VALUES ('1412', '166', '范县', '3');
INSERT INTO `clt_region` VALUES ('1413', '166', '台前县', '3');
INSERT INTO `clt_region` VALUES ('1414', '166', '濮阳县', '3');
INSERT INTO `clt_region` VALUES ('1415', '167', '道里区', '3');
INSERT INTO `clt_region` VALUES ('1416', '167', '南岗区', '3');
INSERT INTO `clt_region` VALUES ('1417', '167', '动力区', '3');
INSERT INTO `clt_region` VALUES ('1418', '167', '平房区', '3');
INSERT INTO `clt_region` VALUES ('1419', '167', '香坊区', '3');
INSERT INTO `clt_region` VALUES ('1420', '167', '太平区', '3');
INSERT INTO `clt_region` VALUES ('1421', '167', '道外区', '3');
INSERT INTO `clt_region` VALUES ('1422', '167', '阿城区', '3');
INSERT INTO `clt_region` VALUES ('1423', '167', '呼兰区', '3');
INSERT INTO `clt_region` VALUES ('1424', '167', '松北区', '3');
INSERT INTO `clt_region` VALUES ('1425', '167', '尚志市', '3');
INSERT INTO `clt_region` VALUES ('1426', '167', '双城市', '3');
INSERT INTO `clt_region` VALUES ('1427', '167', '五常市', '3');
INSERT INTO `clt_region` VALUES ('1428', '167', '方正县', '3');
INSERT INTO `clt_region` VALUES ('1429', '167', '宾县', '3');
INSERT INTO `clt_region` VALUES ('1430', '167', '依兰县', '3');
INSERT INTO `clt_region` VALUES ('1431', '167', '巴彦县', '3');
INSERT INTO `clt_region` VALUES ('1432', '167', '通河县', '3');
INSERT INTO `clt_region` VALUES ('1433', '167', '木兰县', '3');
INSERT INTO `clt_region` VALUES ('1434', '167', '延寿县', '3');
INSERT INTO `clt_region` VALUES ('1435', '168', '萨尔图区', '3');
INSERT INTO `clt_region` VALUES ('1436', '168', '红岗区', '3');
INSERT INTO `clt_region` VALUES ('1437', '168', '龙凤区', '3');
INSERT INTO `clt_region` VALUES ('1438', '168', '让胡路区', '3');
INSERT INTO `clt_region` VALUES ('1439', '168', '大同区', '3');
INSERT INTO `clt_region` VALUES ('1440', '168', '肇州县', '3');
INSERT INTO `clt_region` VALUES ('1441', '168', '肇源县', '3');
INSERT INTO `clt_region` VALUES ('1442', '168', '林甸县', '3');
INSERT INTO `clt_region` VALUES ('1443', '168', '杜尔伯特', '3');
INSERT INTO `clt_region` VALUES ('1444', '169', '呼玛县', '3');
INSERT INTO `clt_region` VALUES ('1445', '169', '漠河县', '3');
INSERT INTO `clt_region` VALUES ('1446', '169', '塔河县', '3');
INSERT INTO `clt_region` VALUES ('1447', '170', '兴山区', '3');
INSERT INTO `clt_region` VALUES ('1448', '170', '工农区', '3');
INSERT INTO `clt_region` VALUES ('1449', '170', '南山区', '3');
INSERT INTO `clt_region` VALUES ('1450', '170', '兴安区', '3');
INSERT INTO `clt_region` VALUES ('1451', '170', '向阳区', '3');
INSERT INTO `clt_region` VALUES ('1452', '170', '东山区', '3');
INSERT INTO `clt_region` VALUES ('1453', '170', '萝北县', '3');
INSERT INTO `clt_region` VALUES ('1454', '170', '绥滨县', '3');
INSERT INTO `clt_region` VALUES ('1455', '171', '爱辉区', '3');
INSERT INTO `clt_region` VALUES ('1456', '171', '五大连池市', '3');
INSERT INTO `clt_region` VALUES ('1457', '171', '北安市', '3');
INSERT INTO `clt_region` VALUES ('1458', '171', '嫩江县', '3');
INSERT INTO `clt_region` VALUES ('1459', '171', '逊克县', '3');
INSERT INTO `clt_region` VALUES ('1460', '171', '孙吴县', '3');
INSERT INTO `clt_region` VALUES ('1461', '172', '鸡冠区', '3');
INSERT INTO `clt_region` VALUES ('1462', '172', '恒山区', '3');
INSERT INTO `clt_region` VALUES ('1463', '172', '城子河区', '3');
INSERT INTO `clt_region` VALUES ('1464', '172', '滴道区', '3');
INSERT INTO `clt_region` VALUES ('1465', '172', '梨树区', '3');
INSERT INTO `clt_region` VALUES ('1466', '172', '虎林市', '3');
INSERT INTO `clt_region` VALUES ('1467', '172', '密山市', '3');
INSERT INTO `clt_region` VALUES ('1468', '172', '鸡东县', '3');
INSERT INTO `clt_region` VALUES ('1469', '173', '前进区', '3');
INSERT INTO `clt_region` VALUES ('1470', '173', '郊区', '3');
INSERT INTO `clt_region` VALUES ('1471', '173', '向阳区', '3');
INSERT INTO `clt_region` VALUES ('1472', '173', '东风区', '3');
INSERT INTO `clt_region` VALUES ('1473', '173', '同江市', '3');
INSERT INTO `clt_region` VALUES ('1474', '173', '富锦市', '3');
INSERT INTO `clt_region` VALUES ('1475', '173', '桦南县', '3');
INSERT INTO `clt_region` VALUES ('1476', '173', '桦川县', '3');
INSERT INTO `clt_region` VALUES ('1477', '173', '汤原县', '3');
INSERT INTO `clt_region` VALUES ('1478', '173', '抚远县', '3');
INSERT INTO `clt_region` VALUES ('1479', '174', '爱民区', '3');
INSERT INTO `clt_region` VALUES ('1480', '174', '东安区', '3');
INSERT INTO `clt_region` VALUES ('1481', '174', '阳明区', '3');
INSERT INTO `clt_region` VALUES ('1482', '174', '西安区', '3');
INSERT INTO `clt_region` VALUES ('1483', '174', '绥芬河市', '3');
INSERT INTO `clt_region` VALUES ('1484', '174', '海林市', '3');
INSERT INTO `clt_region` VALUES ('1485', '174', '宁安市', '3');
INSERT INTO `clt_region` VALUES ('1486', '174', '穆棱市', '3');
INSERT INTO `clt_region` VALUES ('1487', '174', '东宁县', '3');
INSERT INTO `clt_region` VALUES ('1488', '174', '林口县', '3');
INSERT INTO `clt_region` VALUES ('1489', '175', '桃山区', '3');
INSERT INTO `clt_region` VALUES ('1490', '175', '新兴区', '3');
INSERT INTO `clt_region` VALUES ('1491', '175', '茄子河区', '3');
INSERT INTO `clt_region` VALUES ('1492', '175', '勃利县', '3');
INSERT INTO `clt_region` VALUES ('1493', '176', '龙沙区', '3');
INSERT INTO `clt_region` VALUES ('1494', '176', '昂昂溪区', '3');
INSERT INTO `clt_region` VALUES ('1495', '176', '铁峰区', '3');
INSERT INTO `clt_region` VALUES ('1496', '176', '建华区', '3');
INSERT INTO `clt_region` VALUES ('1497', '176', '富拉尔基区', '3');
INSERT INTO `clt_region` VALUES ('1498', '176', '碾子山区', '3');
INSERT INTO `clt_region` VALUES ('1499', '176', '梅里斯达斡尔区', '3');
INSERT INTO `clt_region` VALUES ('1500', '176', '讷河市', '3');
INSERT INTO `clt_region` VALUES ('1501', '176', '龙江县', '3');
INSERT INTO `clt_region` VALUES ('1502', '176', '依安县', '3');
INSERT INTO `clt_region` VALUES ('1503', '176', '泰来县', '3');
INSERT INTO `clt_region` VALUES ('1504', '176', '甘南县', '3');
INSERT INTO `clt_region` VALUES ('1505', '176', '富裕县', '3');
INSERT INTO `clt_region` VALUES ('1506', '176', '克山县', '3');
INSERT INTO `clt_region` VALUES ('1507', '176', '克东县', '3');
INSERT INTO `clt_region` VALUES ('1508', '176', '拜泉县', '3');
INSERT INTO `clt_region` VALUES ('1509', '177', '尖山区', '3');
INSERT INTO `clt_region` VALUES ('1510', '177', '岭东区', '3');
INSERT INTO `clt_region` VALUES ('1511', '177', '四方台区', '3');
INSERT INTO `clt_region` VALUES ('1512', '177', '宝山区', '3');
INSERT INTO `clt_region` VALUES ('1513', '177', '集贤县', '3');
INSERT INTO `clt_region` VALUES ('1514', '177', '友谊县', '3');
INSERT INTO `clt_region` VALUES ('1515', '177', '宝清县', '3');
INSERT INTO `clt_region` VALUES ('1516', '177', '饶河县', '3');
INSERT INTO `clt_region` VALUES ('1517', '178', '北林区', '3');
INSERT INTO `clt_region` VALUES ('1518', '178', '安达市', '3');
INSERT INTO `clt_region` VALUES ('1519', '178', '肇东市', '3');
INSERT INTO `clt_region` VALUES ('1520', '178', '海伦市', '3');
INSERT INTO `clt_region` VALUES ('1521', '178', '望奎县', '3');
INSERT INTO `clt_region` VALUES ('1522', '178', '兰西县', '3');
INSERT INTO `clt_region` VALUES ('1523', '178', '青冈县', '3');
INSERT INTO `clt_region` VALUES ('1524', '178', '庆安县', '3');
INSERT INTO `clt_region` VALUES ('1525', '178', '明水县', '3');
INSERT INTO `clt_region` VALUES ('1526', '178', '绥棱县', '3');
INSERT INTO `clt_region` VALUES ('1527', '179', '伊春区', '3');
INSERT INTO `clt_region` VALUES ('1528', '179', '带岭区', '3');
INSERT INTO `clt_region` VALUES ('1529', '179', '南岔区', '3');
INSERT INTO `clt_region` VALUES ('1530', '179', '金山屯区', '3');
INSERT INTO `clt_region` VALUES ('1531', '179', '西林区', '3');
INSERT INTO `clt_region` VALUES ('1532', '179', '美溪区', '3');
INSERT INTO `clt_region` VALUES ('1533', '179', '乌马河区', '3');
INSERT INTO `clt_region` VALUES ('1534', '179', '翠峦区', '3');
INSERT INTO `clt_region` VALUES ('1535', '179', '友好区', '3');
INSERT INTO `clt_region` VALUES ('1536', '179', '上甘岭区', '3');
INSERT INTO `clt_region` VALUES ('1537', '179', '五营区', '3');
INSERT INTO `clt_region` VALUES ('1538', '179', '红星区', '3');
INSERT INTO `clt_region` VALUES ('1539', '179', '新青区', '3');
INSERT INTO `clt_region` VALUES ('1540', '179', '汤旺河区', '3');
INSERT INTO `clt_region` VALUES ('1541', '179', '乌伊岭区', '3');
INSERT INTO `clt_region` VALUES ('1542', '179', '铁力市', '3');
INSERT INTO `clt_region` VALUES ('1543', '179', '嘉荫县', '3');
INSERT INTO `clt_region` VALUES ('1544', '180', '江岸区', '3');
INSERT INTO `clt_region` VALUES ('1545', '180', '武昌区', '3');
INSERT INTO `clt_region` VALUES ('1546', '180', '江汉区', '3');
INSERT INTO `clt_region` VALUES ('1547', '180', '硚口区', '3');
INSERT INTO `clt_region` VALUES ('1548', '180', '汉阳区', '3');
INSERT INTO `clt_region` VALUES ('1549', '180', '青山区', '3');
INSERT INTO `clt_region` VALUES ('1550', '180', '洪山区', '3');
INSERT INTO `clt_region` VALUES ('1551', '180', '东西湖区', '3');
INSERT INTO `clt_region` VALUES ('1552', '180', '汉南区', '3');
INSERT INTO `clt_region` VALUES ('1553', '180', '蔡甸区', '3');
INSERT INTO `clt_region` VALUES ('1554', '180', '江夏区', '3');
INSERT INTO `clt_region` VALUES ('1555', '180', '黄陂区', '3');
INSERT INTO `clt_region` VALUES ('1556', '180', '新洲区', '3');
INSERT INTO `clt_region` VALUES ('1557', '180', '经济开发区', '3');
INSERT INTO `clt_region` VALUES ('1558', '181', '仙桃市', '3');
INSERT INTO `clt_region` VALUES ('1559', '182', '鄂城区', '3');
INSERT INTO `clt_region` VALUES ('1560', '182', '华容区', '3');
INSERT INTO `clt_region` VALUES ('1561', '182', '梁子湖区', '3');
INSERT INTO `clt_region` VALUES ('1562', '183', '黄州区', '3');
INSERT INTO `clt_region` VALUES ('1563', '183', '麻城市', '3');
INSERT INTO `clt_region` VALUES ('1564', '183', '武穴市', '3');
INSERT INTO `clt_region` VALUES ('1565', '183', '团风县', '3');
INSERT INTO `clt_region` VALUES ('1566', '183', '红安县', '3');
INSERT INTO `clt_region` VALUES ('1567', '183', '罗田县', '3');
INSERT INTO `clt_region` VALUES ('1568', '183', '英山县', '3');
INSERT INTO `clt_region` VALUES ('1569', '183', '浠水县', '3');
INSERT INTO `clt_region` VALUES ('1570', '183', '蕲春县', '3');
INSERT INTO `clt_region` VALUES ('1571', '183', '黄梅县', '3');
INSERT INTO `clt_region` VALUES ('1572', '184', '黄石港区', '3');
INSERT INTO `clt_region` VALUES ('1573', '184', '西塞山区', '3');
INSERT INTO `clt_region` VALUES ('1574', '184', '下陆区', '3');
INSERT INTO `clt_region` VALUES ('1575', '184', '铁山区', '3');
INSERT INTO `clt_region` VALUES ('1576', '184', '大冶市', '3');
INSERT INTO `clt_region` VALUES ('1577', '184', '阳新县', '3');
INSERT INTO `clt_region` VALUES ('1578', '185', '东宝区', '3');
INSERT INTO `clt_region` VALUES ('1579', '185', '掇刀区', '3');
INSERT INTO `clt_region` VALUES ('1580', '185', '钟祥市', '3');
INSERT INTO `clt_region` VALUES ('1581', '185', '京山县', '3');
INSERT INTO `clt_region` VALUES ('1582', '185', '沙洋县', '3');
INSERT INTO `clt_region` VALUES ('1583', '186', '沙市区', '3');
INSERT INTO `clt_region` VALUES ('1584', '186', '荆州区', '3');
INSERT INTO `clt_region` VALUES ('1585', '186', '石首市', '3');
INSERT INTO `clt_region` VALUES ('1586', '186', '洪湖市', '3');
INSERT INTO `clt_region` VALUES ('1587', '186', '松滋市', '3');
INSERT INTO `clt_region` VALUES ('1588', '186', '公安县', '3');
INSERT INTO `clt_region` VALUES ('1589', '186', '监利县', '3');
INSERT INTO `clt_region` VALUES ('1590', '186', '江陵县', '3');
INSERT INTO `clt_region` VALUES ('1591', '187', '潜江市', '3');
INSERT INTO `clt_region` VALUES ('1592', '188', '神农架林区', '3');
INSERT INTO `clt_region` VALUES ('1593', '189', '张湾区', '3');
INSERT INTO `clt_region` VALUES ('1594', '189', '茅箭区', '3');
INSERT INTO `clt_region` VALUES ('1595', '189', '丹江口市', '3');
INSERT INTO `clt_region` VALUES ('1596', '189', '郧县', '3');
INSERT INTO `clt_region` VALUES ('1597', '189', '郧西县', '3');
INSERT INTO `clt_region` VALUES ('1598', '189', '竹山县', '3');
INSERT INTO `clt_region` VALUES ('1599', '189', '竹溪县', '3');
INSERT INTO `clt_region` VALUES ('1600', '189', '房县', '3');
INSERT INTO `clt_region` VALUES ('1601', '190', '曾都区', '3');
INSERT INTO `clt_region` VALUES ('1602', '190', '广水市', '3');
INSERT INTO `clt_region` VALUES ('1603', '191', '天门市', '3');
INSERT INTO `clt_region` VALUES ('1604', '192', '咸安区', '3');
INSERT INTO `clt_region` VALUES ('1605', '192', '赤壁市', '3');
INSERT INTO `clt_region` VALUES ('1606', '192', '嘉鱼县', '3');
INSERT INTO `clt_region` VALUES ('1607', '192', '通城县', '3');
INSERT INTO `clt_region` VALUES ('1608', '192', '崇阳县', '3');
INSERT INTO `clt_region` VALUES ('1609', '192', '通山县', '3');
INSERT INTO `clt_region` VALUES ('1610', '193', '襄城区', '3');
INSERT INTO `clt_region` VALUES ('1611', '193', '樊城区', '3');
INSERT INTO `clt_region` VALUES ('1612', '193', '襄阳区', '3');
INSERT INTO `clt_region` VALUES ('1613', '193', '老河口市', '3');
INSERT INTO `clt_region` VALUES ('1614', '193', '枣阳市', '3');
INSERT INTO `clt_region` VALUES ('1615', '193', '宜城市', '3');
INSERT INTO `clt_region` VALUES ('1616', '193', '南漳县', '3');
INSERT INTO `clt_region` VALUES ('1617', '193', '谷城县', '3');
INSERT INTO `clt_region` VALUES ('1618', '193', '保康县', '3');
INSERT INTO `clt_region` VALUES ('1619', '194', '孝南区', '3');
INSERT INTO `clt_region` VALUES ('1620', '194', '应城市', '3');
INSERT INTO `clt_region` VALUES ('1621', '194', '安陆市', '3');
INSERT INTO `clt_region` VALUES ('1622', '194', '汉川市', '3');
INSERT INTO `clt_region` VALUES ('1623', '194', '孝昌县', '3');
INSERT INTO `clt_region` VALUES ('1624', '194', '大悟县', '3');
INSERT INTO `clt_region` VALUES ('1625', '194', '云梦县', '3');
INSERT INTO `clt_region` VALUES ('1626', '195', '长阳', '3');
INSERT INTO `clt_region` VALUES ('1627', '195', '五峰', '3');
INSERT INTO `clt_region` VALUES ('1628', '195', '西陵区', '3');
INSERT INTO `clt_region` VALUES ('1629', '195', '伍家岗区', '3');
INSERT INTO `clt_region` VALUES ('1630', '195', '点军区', '3');
INSERT INTO `clt_region` VALUES ('1631', '195', '猇亭区', '3');
INSERT INTO `clt_region` VALUES ('1632', '195', '夷陵区', '3');
INSERT INTO `clt_region` VALUES ('1633', '195', '宜都市', '3');
INSERT INTO `clt_region` VALUES ('1634', '195', '当阳市', '3');
INSERT INTO `clt_region` VALUES ('1635', '195', '枝江市', '3');
INSERT INTO `clt_region` VALUES ('1636', '195', '远安县', '3');
INSERT INTO `clt_region` VALUES ('1637', '195', '兴山县', '3');
INSERT INTO `clt_region` VALUES ('1638', '195', '秭归县', '3');
INSERT INTO `clt_region` VALUES ('1639', '196', '恩施市', '3');
INSERT INTO `clt_region` VALUES ('1640', '196', '利川市', '3');
INSERT INTO `clt_region` VALUES ('1641', '196', '建始县', '3');
INSERT INTO `clt_region` VALUES ('1642', '196', '巴东县', '3');
INSERT INTO `clt_region` VALUES ('1643', '196', '宣恩县', '3');
INSERT INTO `clt_region` VALUES ('1644', '196', '咸丰县', '3');
INSERT INTO `clt_region` VALUES ('1645', '196', '来凤县', '3');
INSERT INTO `clt_region` VALUES ('1646', '196', '鹤峰县', '3');
INSERT INTO `clt_region` VALUES ('1647', '197', '岳麓区', '3');
INSERT INTO `clt_region` VALUES ('1648', '197', '芙蓉区', '3');
INSERT INTO `clt_region` VALUES ('1649', '197', '天心区', '3');
INSERT INTO `clt_region` VALUES ('1650', '197', '开福区', '3');
INSERT INTO `clt_region` VALUES ('1651', '197', '雨花区', '3');
INSERT INTO `clt_region` VALUES ('1652', '197', '开发区', '3');
INSERT INTO `clt_region` VALUES ('1653', '197', '浏阳市', '3');
INSERT INTO `clt_region` VALUES ('1654', '197', '长沙县', '3');
INSERT INTO `clt_region` VALUES ('1655', '197', '望城县', '3');
INSERT INTO `clt_region` VALUES ('1656', '197', '宁乡县', '3');
INSERT INTO `clt_region` VALUES ('1657', '198', '永定区', '3');
INSERT INTO `clt_region` VALUES ('1658', '198', '武陵源区', '3');
INSERT INTO `clt_region` VALUES ('1659', '198', '慈利县', '3');
INSERT INTO `clt_region` VALUES ('1660', '198', '桑植县', '3');
INSERT INTO `clt_region` VALUES ('1661', '199', '武陵区', '3');
INSERT INTO `clt_region` VALUES ('1662', '199', '鼎城区', '3');
INSERT INTO `clt_region` VALUES ('1663', '199', '津市市', '3');
INSERT INTO `clt_region` VALUES ('1664', '199', '安乡县', '3');
INSERT INTO `clt_region` VALUES ('1665', '199', '汉寿县', '3');
INSERT INTO `clt_region` VALUES ('1666', '199', '澧县', '3');
INSERT INTO `clt_region` VALUES ('1667', '199', '临澧县', '3');
INSERT INTO `clt_region` VALUES ('1668', '199', '桃源县', '3');
INSERT INTO `clt_region` VALUES ('1669', '199', '石门县', '3');
INSERT INTO `clt_region` VALUES ('1670', '200', '北湖区', '3');
INSERT INTO `clt_region` VALUES ('1671', '200', '苏仙区', '3');
INSERT INTO `clt_region` VALUES ('1672', '200', '资兴市', '3');
INSERT INTO `clt_region` VALUES ('1673', '200', '桂阳县', '3');
INSERT INTO `clt_region` VALUES ('1674', '200', '宜章县', '3');
INSERT INTO `clt_region` VALUES ('1675', '200', '永兴县', '3');
INSERT INTO `clt_region` VALUES ('1676', '200', '嘉禾县', '3');
INSERT INTO `clt_region` VALUES ('1677', '200', '临武县', '3');
INSERT INTO `clt_region` VALUES ('1678', '200', '汝城县', '3');
INSERT INTO `clt_region` VALUES ('1679', '200', '桂东县', '3');
INSERT INTO `clt_region` VALUES ('1680', '200', '安仁县', '3');
INSERT INTO `clt_region` VALUES ('1681', '201', '雁峰区', '3');
INSERT INTO `clt_region` VALUES ('1682', '201', '珠晖区', '3');
INSERT INTO `clt_region` VALUES ('1683', '201', '石鼓区', '3');
INSERT INTO `clt_region` VALUES ('1684', '201', '蒸湘区', '3');
INSERT INTO `clt_region` VALUES ('1685', '201', '南岳区', '3');
INSERT INTO `clt_region` VALUES ('1686', '201', '耒阳市', '3');
INSERT INTO `clt_region` VALUES ('1687', '201', '常宁市', '3');
INSERT INTO `clt_region` VALUES ('1688', '201', '衡阳县', '3');
INSERT INTO `clt_region` VALUES ('1689', '201', '衡南县', '3');
INSERT INTO `clt_region` VALUES ('1690', '201', '衡山县', '3');
INSERT INTO `clt_region` VALUES ('1691', '201', '衡东县', '3');
INSERT INTO `clt_region` VALUES ('1692', '201', '祁东县', '3');
INSERT INTO `clt_region` VALUES ('1693', '202', '鹤城区', '3');
INSERT INTO `clt_region` VALUES ('1694', '202', '靖州', '3');
INSERT INTO `clt_region` VALUES ('1695', '202', '麻阳', '3');
INSERT INTO `clt_region` VALUES ('1696', '202', '通道', '3');
INSERT INTO `clt_region` VALUES ('1697', '202', '新晃', '3');
INSERT INTO `clt_region` VALUES ('1698', '202', '芷江', '3');
INSERT INTO `clt_region` VALUES ('1699', '202', '沅陵县', '3');
INSERT INTO `clt_region` VALUES ('1700', '202', '辰溪县', '3');
INSERT INTO `clt_region` VALUES ('1701', '202', '溆浦县', '3');
INSERT INTO `clt_region` VALUES ('1702', '202', '中方县', '3');
INSERT INTO `clt_region` VALUES ('1703', '202', '会同县', '3');
INSERT INTO `clt_region` VALUES ('1704', '202', '洪江市', '3');
INSERT INTO `clt_region` VALUES ('1705', '203', '娄星区', '3');
INSERT INTO `clt_region` VALUES ('1706', '203', '冷水江市', '3');
INSERT INTO `clt_region` VALUES ('1707', '203', '涟源市', '3');
INSERT INTO `clt_region` VALUES ('1708', '203', '双峰县', '3');
INSERT INTO `clt_region` VALUES ('1709', '203', '新化县', '3');
INSERT INTO `clt_region` VALUES ('1710', '204', '城步', '3');
INSERT INTO `clt_region` VALUES ('1711', '204', '双清区', '3');
INSERT INTO `clt_region` VALUES ('1712', '204', '大祥区', '3');
INSERT INTO `clt_region` VALUES ('1713', '204', '北塔区', '3');
INSERT INTO `clt_region` VALUES ('1714', '204', '武冈市', '3');
INSERT INTO `clt_region` VALUES ('1715', '204', '邵东县', '3');
INSERT INTO `clt_region` VALUES ('1716', '204', '新邵县', '3');
INSERT INTO `clt_region` VALUES ('1717', '204', '邵阳县', '3');
INSERT INTO `clt_region` VALUES ('1718', '204', '隆回县', '3');
INSERT INTO `clt_region` VALUES ('1719', '204', '洞口县', '3');
INSERT INTO `clt_region` VALUES ('1720', '204', '绥宁县', '3');
INSERT INTO `clt_region` VALUES ('1721', '204', '新宁县', '3');
INSERT INTO `clt_region` VALUES ('1722', '205', '岳塘区', '3');
INSERT INTO `clt_region` VALUES ('1723', '205', '雨湖区', '3');
INSERT INTO `clt_region` VALUES ('1724', '205', '湘乡市', '3');
INSERT INTO `clt_region` VALUES ('1725', '205', '韶山市', '3');
INSERT INTO `clt_region` VALUES ('1726', '205', '湘潭县', '3');
INSERT INTO `clt_region` VALUES ('1727', '206', '吉首市', '3');
INSERT INTO `clt_region` VALUES ('1728', '206', '泸溪县', '3');
INSERT INTO `clt_region` VALUES ('1729', '206', '凤凰县', '3');
INSERT INTO `clt_region` VALUES ('1730', '206', '花垣县', '3');
INSERT INTO `clt_region` VALUES ('1731', '206', '保靖县', '3');
INSERT INTO `clt_region` VALUES ('1732', '206', '古丈县', '3');
INSERT INTO `clt_region` VALUES ('1733', '206', '永顺县', '3');
INSERT INTO `clt_region` VALUES ('1734', '206', '龙山县', '3');
INSERT INTO `clt_region` VALUES ('1735', '207', '赫山区', '3');
INSERT INTO `clt_region` VALUES ('1736', '207', '资阳区', '3');
INSERT INTO `clt_region` VALUES ('1737', '207', '沅江市', '3');
INSERT INTO `clt_region` VALUES ('1738', '207', '南县', '3');
INSERT INTO `clt_region` VALUES ('1739', '207', '桃江县', '3');
INSERT INTO `clt_region` VALUES ('1740', '207', '安化县', '3');
INSERT INTO `clt_region` VALUES ('1741', '208', '江华', '3');
INSERT INTO `clt_region` VALUES ('1742', '208', '冷水滩区', '3');
INSERT INTO `clt_region` VALUES ('1743', '208', '零陵区', '3');
INSERT INTO `clt_region` VALUES ('1744', '208', '祁阳县', '3');
INSERT INTO `clt_region` VALUES ('1745', '208', '东安县', '3');
INSERT INTO `clt_region` VALUES ('1746', '208', '双牌县', '3');
INSERT INTO `clt_region` VALUES ('1747', '208', '道县', '3');
INSERT INTO `clt_region` VALUES ('1748', '208', '江永县', '3');
INSERT INTO `clt_region` VALUES ('1749', '208', '宁远县', '3');
INSERT INTO `clt_region` VALUES ('1750', '208', '蓝山县', '3');
INSERT INTO `clt_region` VALUES ('1751', '208', '新田县', '3');
INSERT INTO `clt_region` VALUES ('1752', '209', '岳阳楼区', '3');
INSERT INTO `clt_region` VALUES ('1753', '209', '君山区', '3');
INSERT INTO `clt_region` VALUES ('1754', '209', '云溪区', '3');
INSERT INTO `clt_region` VALUES ('1755', '209', '汨罗市', '3');
INSERT INTO `clt_region` VALUES ('1756', '209', '临湘市', '3');
INSERT INTO `clt_region` VALUES ('1757', '209', '岳阳县', '3');
INSERT INTO `clt_region` VALUES ('1758', '209', '华容县', '3');
INSERT INTO `clt_region` VALUES ('1759', '209', '湘阴县', '3');
INSERT INTO `clt_region` VALUES ('1760', '209', '平江县', '3');
INSERT INTO `clt_region` VALUES ('1761', '210', '天元区', '3');
INSERT INTO `clt_region` VALUES ('1762', '210', '荷塘区', '3');
INSERT INTO `clt_region` VALUES ('1763', '210', '芦淞区', '3');
INSERT INTO `clt_region` VALUES ('1764', '210', '石峰区', '3');
INSERT INTO `clt_region` VALUES ('1765', '210', '醴陵市', '3');
INSERT INTO `clt_region` VALUES ('1766', '210', '株洲县', '3');
INSERT INTO `clt_region` VALUES ('1767', '210', '攸县', '3');
INSERT INTO `clt_region` VALUES ('1768', '210', '茶陵县', '3');
INSERT INTO `clt_region` VALUES ('1769', '210', '炎陵县', '3');
INSERT INTO `clt_region` VALUES ('1770', '211', '朝阳区', '3');
INSERT INTO `clt_region` VALUES ('1771', '211', '宽城区', '3');
INSERT INTO `clt_region` VALUES ('1772', '211', '二道区', '3');
INSERT INTO `clt_region` VALUES ('1773', '211', '南关区', '3');
INSERT INTO `clt_region` VALUES ('1774', '211', '绿园区', '3');
INSERT INTO `clt_region` VALUES ('1775', '211', '双阳区', '3');
INSERT INTO `clt_region` VALUES ('1776', '211', '净月潭开发区', '3');
INSERT INTO `clt_region` VALUES ('1777', '211', '高新技术开发区', '3');
INSERT INTO `clt_region` VALUES ('1778', '211', '经济技术开发区', '3');
INSERT INTO `clt_region` VALUES ('1779', '211', '汽车产业开发区', '3');
INSERT INTO `clt_region` VALUES ('1780', '211', '德惠市', '3');
INSERT INTO `clt_region` VALUES ('1781', '211', '九台市', '3');
INSERT INTO `clt_region` VALUES ('1782', '211', '榆树市', '3');
INSERT INTO `clt_region` VALUES ('1783', '211', '农安县', '3');
INSERT INTO `clt_region` VALUES ('1784', '212', '船营区', '3');
INSERT INTO `clt_region` VALUES ('1785', '212', '昌邑区', '3');
INSERT INTO `clt_region` VALUES ('1786', '212', '龙潭区', '3');
INSERT INTO `clt_region` VALUES ('1787', '212', '丰满区', '3');
INSERT INTO `clt_region` VALUES ('1788', '212', '蛟河市', '3');
INSERT INTO `clt_region` VALUES ('1789', '212', '桦甸市', '3');
INSERT INTO `clt_region` VALUES ('1790', '212', '舒兰市', '3');
INSERT INTO `clt_region` VALUES ('1791', '212', '磐石市', '3');
INSERT INTO `clt_region` VALUES ('1792', '212', '永吉县', '3');
INSERT INTO `clt_region` VALUES ('1793', '213', '洮北区', '3');
INSERT INTO `clt_region` VALUES ('1794', '213', '洮南市', '3');
INSERT INTO `clt_region` VALUES ('1795', '213', '大安市', '3');
INSERT INTO `clt_region` VALUES ('1796', '213', '镇赉县', '3');
INSERT INTO `clt_region` VALUES ('1797', '213', '通榆县', '3');
INSERT INTO `clt_region` VALUES ('1798', '214', '江源区', '3');
INSERT INTO `clt_region` VALUES ('1799', '214', '八道江区', '3');
INSERT INTO `clt_region` VALUES ('1800', '214', '长白', '3');
INSERT INTO `clt_region` VALUES ('1801', '214', '临江市', '3');
INSERT INTO `clt_region` VALUES ('1802', '214', '抚松县', '3');
INSERT INTO `clt_region` VALUES ('1803', '214', '靖宇县', '3');
INSERT INTO `clt_region` VALUES ('1804', '215', '龙山区', '3');
INSERT INTO `clt_region` VALUES ('1805', '215', '西安区', '3');
INSERT INTO `clt_region` VALUES ('1806', '215', '东丰县', '3');
INSERT INTO `clt_region` VALUES ('1807', '215', '东辽县', '3');
INSERT INTO `clt_region` VALUES ('1808', '216', '铁西区', '3');
INSERT INTO `clt_region` VALUES ('1809', '216', '铁东区', '3');
INSERT INTO `clt_region` VALUES ('1810', '216', '伊通', '3');
INSERT INTO `clt_region` VALUES ('1811', '216', '公主岭市', '3');
INSERT INTO `clt_region` VALUES ('1812', '216', '双辽市', '3');
INSERT INTO `clt_region` VALUES ('1813', '216', '梨树县', '3');
INSERT INTO `clt_region` VALUES ('1814', '217', '前郭尔罗斯', '3');
INSERT INTO `clt_region` VALUES ('1815', '217', '宁江区', '3');
INSERT INTO `clt_region` VALUES ('1816', '217', '长岭县', '3');
INSERT INTO `clt_region` VALUES ('1817', '217', '乾安县', '3');
INSERT INTO `clt_region` VALUES ('1818', '217', '扶余县', '3');
INSERT INTO `clt_region` VALUES ('1819', '218', '东昌区', '3');
INSERT INTO `clt_region` VALUES ('1820', '218', '二道江区', '3');
INSERT INTO `clt_region` VALUES ('1821', '218', '梅河口市', '3');
INSERT INTO `clt_region` VALUES ('1822', '218', '集安市', '3');
INSERT INTO `clt_region` VALUES ('1823', '218', '通化县', '3');
INSERT INTO `clt_region` VALUES ('1824', '218', '辉南县', '3');
INSERT INTO `clt_region` VALUES ('1825', '218', '柳河县', '3');
INSERT INTO `clt_region` VALUES ('1826', '219', '延吉市', '3');
INSERT INTO `clt_region` VALUES ('1827', '219', '图们市', '3');
INSERT INTO `clt_region` VALUES ('1828', '219', '敦化市', '3');
INSERT INTO `clt_region` VALUES ('1829', '219', '珲春市', '3');
INSERT INTO `clt_region` VALUES ('1830', '219', '龙井市', '3');
INSERT INTO `clt_region` VALUES ('1831', '219', '和龙市', '3');
INSERT INTO `clt_region` VALUES ('1832', '219', '安图县', '3');
INSERT INTO `clt_region` VALUES ('1833', '219', '汪清县', '3');
INSERT INTO `clt_region` VALUES ('1834', '220', '玄武区', '3');
INSERT INTO `clt_region` VALUES ('1835', '220', '鼓楼区', '3');
INSERT INTO `clt_region` VALUES ('1836', '220', '白下区', '3');
INSERT INTO `clt_region` VALUES ('1837', '220', '建邺区', '3');
INSERT INTO `clt_region` VALUES ('1838', '220', '秦淮区', '3');
INSERT INTO `clt_region` VALUES ('1839', '220', '雨花台区', '3');
INSERT INTO `clt_region` VALUES ('1840', '220', '下关区', '3');
INSERT INTO `clt_region` VALUES ('1841', '220', '栖霞区', '3');
INSERT INTO `clt_region` VALUES ('1842', '220', '浦口区', '3');
INSERT INTO `clt_region` VALUES ('1843', '220', '江宁区', '3');
INSERT INTO `clt_region` VALUES ('1844', '220', '六合区', '3');
INSERT INTO `clt_region` VALUES ('1845', '220', '溧水县', '3');
INSERT INTO `clt_region` VALUES ('1846', '220', '高淳县', '3');
INSERT INTO `clt_region` VALUES ('1847', '221', '沧浪区', '3');
INSERT INTO `clt_region` VALUES ('1848', '221', '金阊区', '3');
INSERT INTO `clt_region` VALUES ('1849', '221', '平江区', '3');
INSERT INTO `clt_region` VALUES ('1850', '221', '虎丘区', '3');
INSERT INTO `clt_region` VALUES ('1851', '221', '吴中区', '3');
INSERT INTO `clt_region` VALUES ('1852', '221', '相城区', '3');
INSERT INTO `clt_region` VALUES ('1853', '221', '园区', '3');
INSERT INTO `clt_region` VALUES ('1854', '221', '新区', '3');
INSERT INTO `clt_region` VALUES ('1855', '221', '常熟市', '3');
INSERT INTO `clt_region` VALUES ('1856', '221', '张家港市', '3');
INSERT INTO `clt_region` VALUES ('1857', '221', '玉山镇', '3');
INSERT INTO `clt_region` VALUES ('1858', '221', '巴城镇', '3');
INSERT INTO `clt_region` VALUES ('1859', '221', '周市镇', '3');
INSERT INTO `clt_region` VALUES ('1860', '221', '陆家镇', '3');
INSERT INTO `clt_region` VALUES ('1861', '221', '花桥镇', '3');
INSERT INTO `clt_region` VALUES ('1862', '221', '淀山湖镇', '3');
INSERT INTO `clt_region` VALUES ('1863', '221', '张浦镇', '3');
INSERT INTO `clt_region` VALUES ('1864', '221', '周庄镇', '3');
INSERT INTO `clt_region` VALUES ('1865', '221', '千灯镇', '3');
INSERT INTO `clt_region` VALUES ('1866', '221', '锦溪镇', '3');
INSERT INTO `clt_region` VALUES ('1867', '221', '开发区', '3');
INSERT INTO `clt_region` VALUES ('1868', '221', '吴江市', '3');
INSERT INTO `clt_region` VALUES ('1869', '221', '太仓市', '3');
INSERT INTO `clt_region` VALUES ('1870', '222', '崇安区', '3');
INSERT INTO `clt_region` VALUES ('1871', '222', '北塘区', '3');
INSERT INTO `clt_region` VALUES ('1872', '222', '南长区', '3');
INSERT INTO `clt_region` VALUES ('1873', '222', '锡山区', '3');
INSERT INTO `clt_region` VALUES ('1874', '222', '惠山区', '3');
INSERT INTO `clt_region` VALUES ('1875', '222', '滨湖区', '3');
INSERT INTO `clt_region` VALUES ('1876', '222', '新区', '3');
INSERT INTO `clt_region` VALUES ('1877', '222', '江阴市', '3');
INSERT INTO `clt_region` VALUES ('1878', '222', '宜兴市', '3');
INSERT INTO `clt_region` VALUES ('1879', '223', '天宁区', '3');
INSERT INTO `clt_region` VALUES ('1880', '223', '钟楼区', '3');
INSERT INTO `clt_region` VALUES ('1881', '223', '戚墅堰区', '3');
INSERT INTO `clt_region` VALUES ('1882', '223', '郊区', '3');
INSERT INTO `clt_region` VALUES ('1883', '223', '新北区', '3');
INSERT INTO `clt_region` VALUES ('1884', '223', '武进区', '3');
INSERT INTO `clt_region` VALUES ('1885', '223', '溧阳市', '3');
INSERT INTO `clt_region` VALUES ('1886', '223', '金坛市', '3');
INSERT INTO `clt_region` VALUES ('1887', '224', '清河区', '3');
INSERT INTO `clt_region` VALUES ('1888', '224', '清浦区', '3');
INSERT INTO `clt_region` VALUES ('1889', '224', '楚州区', '3');
INSERT INTO `clt_region` VALUES ('1890', '224', '淮阴区', '3');
INSERT INTO `clt_region` VALUES ('1891', '224', '涟水县', '3');
INSERT INTO `clt_region` VALUES ('1892', '224', '洪泽县', '3');
INSERT INTO `clt_region` VALUES ('1893', '224', '盱眙县', '3');
INSERT INTO `clt_region` VALUES ('1894', '224', '金湖县', '3');
INSERT INTO `clt_region` VALUES ('1895', '225', '新浦区', '3');
INSERT INTO `clt_region` VALUES ('1896', '225', '连云区', '3');
INSERT INTO `clt_region` VALUES ('1897', '225', '海州区', '3');
INSERT INTO `clt_region` VALUES ('1898', '225', '赣榆县', '3');
INSERT INTO `clt_region` VALUES ('1899', '225', '东海县', '3');
INSERT INTO `clt_region` VALUES ('1900', '225', '灌云县', '3');
INSERT INTO `clt_region` VALUES ('1901', '225', '灌南县', '3');
INSERT INTO `clt_region` VALUES ('1902', '226', '崇川区', '3');
INSERT INTO `clt_region` VALUES ('1903', '226', '港闸区', '3');
INSERT INTO `clt_region` VALUES ('1904', '226', '经济开发区', '3');
INSERT INTO `clt_region` VALUES ('1905', '226', '启东市', '3');
INSERT INTO `clt_region` VALUES ('1906', '226', '如皋市', '3');
INSERT INTO `clt_region` VALUES ('1907', '226', '通州市', '3');
INSERT INTO `clt_region` VALUES ('1908', '226', '海门市', '3');
INSERT INTO `clt_region` VALUES ('1909', '226', '海安县', '3');
INSERT INTO `clt_region` VALUES ('1910', '226', '如东县', '3');
INSERT INTO `clt_region` VALUES ('1911', '227', '宿城区', '3');
INSERT INTO `clt_region` VALUES ('1912', '227', '宿豫区', '3');
INSERT INTO `clt_region` VALUES ('1913', '227', '宿豫县', '3');
INSERT INTO `clt_region` VALUES ('1914', '227', '沭阳县', '3');
INSERT INTO `clt_region` VALUES ('1915', '227', '泗阳县', '3');
INSERT INTO `clt_region` VALUES ('1916', '227', '泗洪县', '3');
INSERT INTO `clt_region` VALUES ('1917', '228', '海陵区', '3');
INSERT INTO `clt_region` VALUES ('1918', '228', '高港区', '3');
INSERT INTO `clt_region` VALUES ('1919', '228', '兴化市', '3');
INSERT INTO `clt_region` VALUES ('1920', '228', '靖江市', '3');
INSERT INTO `clt_region` VALUES ('1921', '228', '泰兴市', '3');
INSERT INTO `clt_region` VALUES ('1922', '228', '姜堰市', '3');
INSERT INTO `clt_region` VALUES ('1923', '229', '云龙区', '3');
INSERT INTO `clt_region` VALUES ('1924', '229', '鼓楼区', '3');
INSERT INTO `clt_region` VALUES ('1925', '229', '九里区', '3');
INSERT INTO `clt_region` VALUES ('1926', '229', '贾汪区', '3');
INSERT INTO `clt_region` VALUES ('1927', '229', '泉山区', '3');
INSERT INTO `clt_region` VALUES ('1928', '229', '新沂市', '3');
INSERT INTO `clt_region` VALUES ('1929', '229', '邳州市', '3');
INSERT INTO `clt_region` VALUES ('1930', '229', '丰县', '3');
INSERT INTO `clt_region` VALUES ('1931', '229', '沛县', '3');
INSERT INTO `clt_region` VALUES ('1932', '229', '铜山县', '3');
INSERT INTO `clt_region` VALUES ('1933', '229', '睢宁县', '3');
INSERT INTO `clt_region` VALUES ('1934', '230', '城区', '3');
INSERT INTO `clt_region` VALUES ('1935', '230', '亭湖区', '3');
INSERT INTO `clt_region` VALUES ('1936', '230', '盐都区', '3');
INSERT INTO `clt_region` VALUES ('1937', '230', '盐都县', '3');
INSERT INTO `clt_region` VALUES ('1938', '230', '东台市', '3');
INSERT INTO `clt_region` VALUES ('1939', '230', '大丰市', '3');
INSERT INTO `clt_region` VALUES ('1940', '230', '响水县', '3');
INSERT INTO `clt_region` VALUES ('1941', '230', '滨海县', '3');
INSERT INTO `clt_region` VALUES ('1942', '230', '阜宁县', '3');
INSERT INTO `clt_region` VALUES ('1943', '230', '射阳县', '3');
INSERT INTO `clt_region` VALUES ('1944', '230', '建湖县', '3');
INSERT INTO `clt_region` VALUES ('1945', '231', '广陵区', '3');
INSERT INTO `clt_region` VALUES ('1946', '231', '维扬区', '3');
INSERT INTO `clt_region` VALUES ('1947', '231', '邗江区', '3');
INSERT INTO `clt_region` VALUES ('1948', '231', '仪征市', '3');
INSERT INTO `clt_region` VALUES ('1949', '231', '高邮市', '3');
INSERT INTO `clt_region` VALUES ('1950', '231', '江都市', '3');
INSERT INTO `clt_region` VALUES ('1951', '231', '宝应县', '3');
INSERT INTO `clt_region` VALUES ('1952', '232', '京口区', '3');
INSERT INTO `clt_region` VALUES ('1953', '232', '润州区', '3');
INSERT INTO `clt_region` VALUES ('1954', '232', '丹徒区', '3');
INSERT INTO `clt_region` VALUES ('1955', '232', '丹阳市', '3');
INSERT INTO `clt_region` VALUES ('1956', '232', '扬中市', '3');
INSERT INTO `clt_region` VALUES ('1957', '232', '句容市', '3');
INSERT INTO `clt_region` VALUES ('1958', '233', '东湖区', '3');
INSERT INTO `clt_region` VALUES ('1959', '233', '西湖区', '3');
INSERT INTO `clt_region` VALUES ('1960', '233', '青云谱区', '3');
INSERT INTO `clt_region` VALUES ('1961', '233', '湾里区', '3');
INSERT INTO `clt_region` VALUES ('1962', '233', '青山湖区', '3');
INSERT INTO `clt_region` VALUES ('1963', '233', '红谷滩新区', '3');
INSERT INTO `clt_region` VALUES ('1964', '233', '昌北区', '3');
INSERT INTO `clt_region` VALUES ('1965', '233', '高新区', '3');
INSERT INTO `clt_region` VALUES ('1966', '233', '南昌县', '3');
INSERT INTO `clt_region` VALUES ('1967', '233', '新建县', '3');
INSERT INTO `clt_region` VALUES ('1968', '233', '安义县', '3');
INSERT INTO `clt_region` VALUES ('1969', '233', '进贤县', '3');
INSERT INTO `clt_region` VALUES ('1970', '234', '临川区', '3');
INSERT INTO `clt_region` VALUES ('1971', '234', '南城县', '3');
INSERT INTO `clt_region` VALUES ('1972', '234', '黎川县', '3');
INSERT INTO `clt_region` VALUES ('1973', '234', '南丰县', '3');
INSERT INTO `clt_region` VALUES ('1974', '234', '崇仁县', '3');
INSERT INTO `clt_region` VALUES ('1975', '234', '乐安县', '3');
INSERT INTO `clt_region` VALUES ('1976', '234', '宜黄县', '3');
INSERT INTO `clt_region` VALUES ('1977', '234', '金溪县', '3');
INSERT INTO `clt_region` VALUES ('1978', '234', '资溪县', '3');
INSERT INTO `clt_region` VALUES ('1979', '234', '东乡县', '3');
INSERT INTO `clt_region` VALUES ('1980', '234', '广昌县', '3');
INSERT INTO `clt_region` VALUES ('1981', '235', '章贡区', '3');
INSERT INTO `clt_region` VALUES ('1982', '235', '于都县', '3');
INSERT INTO `clt_region` VALUES ('1983', '235', '瑞金市', '3');
INSERT INTO `clt_region` VALUES ('1984', '235', '南康市', '3');
INSERT INTO `clt_region` VALUES ('1985', '235', '赣县', '3');
INSERT INTO `clt_region` VALUES ('1986', '235', '信丰县', '3');
INSERT INTO `clt_region` VALUES ('1987', '235', '大余县', '3');
INSERT INTO `clt_region` VALUES ('1988', '235', '上犹县', '3');
INSERT INTO `clt_region` VALUES ('1989', '235', '崇义县', '3');
INSERT INTO `clt_region` VALUES ('1990', '235', '安远县', '3');
INSERT INTO `clt_region` VALUES ('1991', '235', '龙南县', '3');
INSERT INTO `clt_region` VALUES ('1992', '235', '定南县', '3');
INSERT INTO `clt_region` VALUES ('1993', '235', '全南县', '3');
INSERT INTO `clt_region` VALUES ('1994', '235', '宁都县', '3');
INSERT INTO `clt_region` VALUES ('1995', '235', '兴国县', '3');
INSERT INTO `clt_region` VALUES ('1996', '235', '会昌县', '3');
INSERT INTO `clt_region` VALUES ('1997', '235', '寻乌县', '3');
INSERT INTO `clt_region` VALUES ('1998', '235', '石城县', '3');
INSERT INTO `clt_region` VALUES ('1999', '236', '安福县', '3');
INSERT INTO `clt_region` VALUES ('2000', '236', '吉州区', '3');
INSERT INTO `clt_region` VALUES ('2001', '236', '青原区', '3');
INSERT INTO `clt_region` VALUES ('2002', '236', '井冈山市', '3');
INSERT INTO `clt_region` VALUES ('2003', '236', '吉安县', '3');
INSERT INTO `clt_region` VALUES ('2004', '236', '吉水县', '3');
INSERT INTO `clt_region` VALUES ('2005', '236', '峡江县', '3');
INSERT INTO `clt_region` VALUES ('2006', '236', '新干县', '3');
INSERT INTO `clt_region` VALUES ('2007', '236', '永丰县', '3');
INSERT INTO `clt_region` VALUES ('2008', '236', '泰和县', '3');
INSERT INTO `clt_region` VALUES ('2009', '236', '遂川县', '3');
INSERT INTO `clt_region` VALUES ('2010', '236', '万安县', '3');
INSERT INTO `clt_region` VALUES ('2011', '236', '永新县', '3');
INSERT INTO `clt_region` VALUES ('2012', '237', '珠山区', '3');
INSERT INTO `clt_region` VALUES ('2013', '237', '昌江区', '3');
INSERT INTO `clt_region` VALUES ('2014', '237', '乐平市', '3');
INSERT INTO `clt_region` VALUES ('2015', '237', '浮梁县', '3');
INSERT INTO `clt_region` VALUES ('2016', '238', '浔阳区', '3');
INSERT INTO `clt_region` VALUES ('2017', '238', '庐山区', '3');
INSERT INTO `clt_region` VALUES ('2018', '238', '瑞昌市', '3');
INSERT INTO `clt_region` VALUES ('2019', '238', '九江县', '3');
INSERT INTO `clt_region` VALUES ('2020', '238', '武宁县', '3');
INSERT INTO `clt_region` VALUES ('2021', '238', '修水县', '3');
INSERT INTO `clt_region` VALUES ('2022', '238', '永修县', '3');
INSERT INTO `clt_region` VALUES ('2023', '238', '德安县', '3');
INSERT INTO `clt_region` VALUES ('2024', '238', '星子县', '3');
INSERT INTO `clt_region` VALUES ('2025', '238', '都昌县', '3');
INSERT INTO `clt_region` VALUES ('2026', '238', '湖口县', '3');
INSERT INTO `clt_region` VALUES ('2027', '238', '彭泽县', '3');
INSERT INTO `clt_region` VALUES ('2028', '239', '安源区', '3');
INSERT INTO `clt_region` VALUES ('2029', '239', '湘东区', '3');
INSERT INTO `clt_region` VALUES ('2030', '239', '莲花县', '3');
INSERT INTO `clt_region` VALUES ('2031', '239', '芦溪县', '3');
INSERT INTO `clt_region` VALUES ('2032', '239', '上栗县', '3');
INSERT INTO `clt_region` VALUES ('2033', '240', '信州区', '3');
INSERT INTO `clt_region` VALUES ('2034', '240', '德兴市', '3');
INSERT INTO `clt_region` VALUES ('2035', '240', '上饶县', '3');
INSERT INTO `clt_region` VALUES ('2036', '240', '广丰县', '3');
INSERT INTO `clt_region` VALUES ('2037', '240', '玉山县', '3');
INSERT INTO `clt_region` VALUES ('2038', '240', '铅山县', '3');
INSERT INTO `clt_region` VALUES ('2039', '240', '横峰县', '3');
INSERT INTO `clt_region` VALUES ('2040', '240', '弋阳县', '3');
INSERT INTO `clt_region` VALUES ('2041', '240', '余干县', '3');
INSERT INTO `clt_region` VALUES ('2042', '240', '波阳县', '3');
INSERT INTO `clt_region` VALUES ('2043', '240', '万年县', '3');
INSERT INTO `clt_region` VALUES ('2044', '240', '婺源县', '3');
INSERT INTO `clt_region` VALUES ('2045', '241', '渝水区', '3');
INSERT INTO `clt_region` VALUES ('2046', '241', '分宜县', '3');
INSERT INTO `clt_region` VALUES ('2047', '242', '袁州区', '3');
INSERT INTO `clt_region` VALUES ('2048', '242', '丰城市', '3');
INSERT INTO `clt_region` VALUES ('2049', '242', '樟树市', '3');
INSERT INTO `clt_region` VALUES ('2050', '242', '高安市', '3');
INSERT INTO `clt_region` VALUES ('2051', '242', '奉新县', '3');
INSERT INTO `clt_region` VALUES ('2052', '242', '万载县', '3');
INSERT INTO `clt_region` VALUES ('2053', '242', '上高县', '3');
INSERT INTO `clt_region` VALUES ('2054', '242', '宜丰县', '3');
INSERT INTO `clt_region` VALUES ('2055', '242', '靖安县', '3');
INSERT INTO `clt_region` VALUES ('2056', '242', '铜鼓县', '3');
INSERT INTO `clt_region` VALUES ('2057', '243', '月湖区', '3');
INSERT INTO `clt_region` VALUES ('2058', '243', '贵溪市', '3');
INSERT INTO `clt_region` VALUES ('2059', '243', '余江县', '3');
INSERT INTO `clt_region` VALUES ('2060', '244', '沈河区', '3');
INSERT INTO `clt_region` VALUES ('2061', '244', '皇姑区', '3');
INSERT INTO `clt_region` VALUES ('2062', '244', '和平区', '3');
INSERT INTO `clt_region` VALUES ('2063', '244', '大东区', '3');
INSERT INTO `clt_region` VALUES ('2064', '244', '铁西区', '3');
INSERT INTO `clt_region` VALUES ('2065', '244', '苏家屯区', '3');
INSERT INTO `clt_region` VALUES ('2066', '244', '东陵区', '3');
INSERT INTO `clt_region` VALUES ('2067', '244', '沈北新区', '3');
INSERT INTO `clt_region` VALUES ('2068', '244', '于洪区', '3');
INSERT INTO `clt_region` VALUES ('2069', '244', '浑南新区', '3');
INSERT INTO `clt_region` VALUES ('2070', '244', '新民市', '3');
INSERT INTO `clt_region` VALUES ('2071', '244', '辽中县', '3');
INSERT INTO `clt_region` VALUES ('2072', '244', '康平县', '3');
INSERT INTO `clt_region` VALUES ('2073', '244', '法库县', '3');
INSERT INTO `clt_region` VALUES ('2074', '245', '西岗区', '3');
INSERT INTO `clt_region` VALUES ('2075', '245', '中山区', '3');
INSERT INTO `clt_region` VALUES ('2076', '245', '沙河口区', '3');
INSERT INTO `clt_region` VALUES ('2077', '245', '甘井子区', '3');
INSERT INTO `clt_region` VALUES ('2078', '245', '旅顺口区', '3');
INSERT INTO `clt_region` VALUES ('2079', '245', '金州区', '3');
INSERT INTO `clt_region` VALUES ('2080', '245', '开发区', '3');
INSERT INTO `clt_region` VALUES ('2081', '245', '瓦房店市', '3');
INSERT INTO `clt_region` VALUES ('2082', '245', '普兰店市', '3');
INSERT INTO `clt_region` VALUES ('2083', '245', '庄河市', '3');
INSERT INTO `clt_region` VALUES ('2084', '245', '长海县', '3');
INSERT INTO `clt_region` VALUES ('2085', '246', '铁东区', '3');
INSERT INTO `clt_region` VALUES ('2086', '246', '铁西区', '3');
INSERT INTO `clt_region` VALUES ('2087', '246', '立山区', '3');
INSERT INTO `clt_region` VALUES ('2088', '246', '千山区', '3');
INSERT INTO `clt_region` VALUES ('2089', '246', '岫岩', '3');
INSERT INTO `clt_region` VALUES ('2090', '246', '海城市', '3');
INSERT INTO `clt_region` VALUES ('2091', '246', '台安县', '3');
INSERT INTO `clt_region` VALUES ('2092', '247', '本溪', '3');
INSERT INTO `clt_region` VALUES ('2093', '247', '平山区', '3');
INSERT INTO `clt_region` VALUES ('2094', '247', '明山区', '3');
INSERT INTO `clt_region` VALUES ('2095', '247', '溪湖区', '3');
INSERT INTO `clt_region` VALUES ('2096', '247', '南芬区', '3');
INSERT INTO `clt_region` VALUES ('2097', '247', '桓仁', '3');
INSERT INTO `clt_region` VALUES ('2098', '248', '双塔区', '3');
INSERT INTO `clt_region` VALUES ('2099', '248', '龙城区', '3');
INSERT INTO `clt_region` VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县', '3');
INSERT INTO `clt_region` VALUES ('2101', '248', '北票市', '3');
INSERT INTO `clt_region` VALUES ('2102', '248', '凌源市', '3');
INSERT INTO `clt_region` VALUES ('2103', '248', '朝阳县', '3');
INSERT INTO `clt_region` VALUES ('2104', '248', '建平县', '3');
INSERT INTO `clt_region` VALUES ('2105', '249', '振兴区', '3');
INSERT INTO `clt_region` VALUES ('2106', '249', '元宝区', '3');
INSERT INTO `clt_region` VALUES ('2107', '249', '振安区', '3');
INSERT INTO `clt_region` VALUES ('2108', '249', '宽甸', '3');
INSERT INTO `clt_region` VALUES ('2109', '249', '东港市', '3');
INSERT INTO `clt_region` VALUES ('2110', '249', '凤城市', '3');
INSERT INTO `clt_region` VALUES ('2111', '250', '顺城区', '3');
INSERT INTO `clt_region` VALUES ('2112', '250', '新抚区', '3');
INSERT INTO `clt_region` VALUES ('2113', '250', '东洲区', '3');
INSERT INTO `clt_region` VALUES ('2114', '250', '望花区', '3');
INSERT INTO `clt_region` VALUES ('2115', '250', '清原', '3');
INSERT INTO `clt_region` VALUES ('2116', '250', '新宾', '3');
INSERT INTO `clt_region` VALUES ('2117', '250', '抚顺县', '3');
INSERT INTO `clt_region` VALUES ('2118', '251', '阜新', '3');
INSERT INTO `clt_region` VALUES ('2119', '251', '海州区', '3');
INSERT INTO `clt_region` VALUES ('2120', '251', '新邱区', '3');
INSERT INTO `clt_region` VALUES ('2121', '251', '太平区', '3');
INSERT INTO `clt_region` VALUES ('2122', '251', '清河门区', '3');
INSERT INTO `clt_region` VALUES ('2123', '251', '细河区', '3');
INSERT INTO `clt_region` VALUES ('2124', '251', '彰武县', '3');
INSERT INTO `clt_region` VALUES ('2125', '252', '龙港区', '3');
INSERT INTO `clt_region` VALUES ('2126', '252', '南票区', '3');
INSERT INTO `clt_region` VALUES ('2127', '252', '连山区', '3');
INSERT INTO `clt_region` VALUES ('2128', '252', '兴城市', '3');
INSERT INTO `clt_region` VALUES ('2129', '252', '绥中县', '3');
INSERT INTO `clt_region` VALUES ('2130', '252', '建昌县', '3');
INSERT INTO `clt_region` VALUES ('2131', '253', '太和区', '3');
INSERT INTO `clt_region` VALUES ('2132', '253', '古塔区', '3');
INSERT INTO `clt_region` VALUES ('2133', '253', '凌河区', '3');
INSERT INTO `clt_region` VALUES ('2134', '253', '凌海市', '3');
INSERT INTO `clt_region` VALUES ('2135', '253', '北镇市', '3');
INSERT INTO `clt_region` VALUES ('2136', '253', '黑山县', '3');
INSERT INTO `clt_region` VALUES ('2137', '253', '义县', '3');
INSERT INTO `clt_region` VALUES ('2138', '254', '白塔区', '3');
INSERT INTO `clt_region` VALUES ('2139', '254', '文圣区', '3');
INSERT INTO `clt_region` VALUES ('2140', '254', '宏伟区', '3');
INSERT INTO `clt_region` VALUES ('2141', '254', '太子河区', '3');
INSERT INTO `clt_region` VALUES ('2142', '254', '弓长岭区', '3');
INSERT INTO `clt_region` VALUES ('2143', '254', '灯塔市', '3');
INSERT INTO `clt_region` VALUES ('2144', '254', '辽阳县', '3');
INSERT INTO `clt_region` VALUES ('2145', '255', '双台子区', '3');
INSERT INTO `clt_region` VALUES ('2146', '255', '兴隆台区', '3');
INSERT INTO `clt_region` VALUES ('2147', '255', '大洼县', '3');
INSERT INTO `clt_region` VALUES ('2148', '255', '盘山县', '3');
INSERT INTO `clt_region` VALUES ('2149', '256', '银州区', '3');
INSERT INTO `clt_region` VALUES ('2150', '256', '清河区', '3');
INSERT INTO `clt_region` VALUES ('2151', '256', '调兵山市', '3');
INSERT INTO `clt_region` VALUES ('2152', '256', '开原市', '3');
INSERT INTO `clt_region` VALUES ('2153', '256', '铁岭县', '3');
INSERT INTO `clt_region` VALUES ('2154', '256', '西丰县', '3');
INSERT INTO `clt_region` VALUES ('2155', '256', '昌图县', '3');
INSERT INTO `clt_region` VALUES ('2156', '257', '站前区', '3');
INSERT INTO `clt_region` VALUES ('2157', '257', '西市区', '3');
INSERT INTO `clt_region` VALUES ('2158', '257', '鲅鱼圈区', '3');
INSERT INTO `clt_region` VALUES ('2159', '257', '老边区', '3');
INSERT INTO `clt_region` VALUES ('2160', '257', '盖州市', '3');
INSERT INTO `clt_region` VALUES ('2161', '257', '大石桥市', '3');
INSERT INTO `clt_region` VALUES ('2162', '258', '回民区', '3');
INSERT INTO `clt_region` VALUES ('2163', '258', '玉泉区', '3');
INSERT INTO `clt_region` VALUES ('2164', '258', '新城区', '3');
INSERT INTO `clt_region` VALUES ('2165', '258', '赛罕区', '3');
INSERT INTO `clt_region` VALUES ('2166', '258', '清水河县', '3');
INSERT INTO `clt_region` VALUES ('2167', '258', '土默特左旗', '3');
INSERT INTO `clt_region` VALUES ('2168', '258', '托克托县', '3');
INSERT INTO `clt_region` VALUES ('2169', '258', '和林格尔县', '3');
INSERT INTO `clt_region` VALUES ('2170', '258', '武川县', '3');
INSERT INTO `clt_region` VALUES ('2171', '259', '阿拉善左旗', '3');
INSERT INTO `clt_region` VALUES ('2172', '259', '阿拉善右旗', '3');
INSERT INTO `clt_region` VALUES ('2173', '259', '额济纳旗', '3');
INSERT INTO `clt_region` VALUES ('2174', '260', '临河区', '3');
INSERT INTO `clt_region` VALUES ('2175', '260', '五原县', '3');
INSERT INTO `clt_region` VALUES ('2176', '260', '磴口县', '3');
INSERT INTO `clt_region` VALUES ('2177', '260', '乌拉特前旗', '3');
INSERT INTO `clt_region` VALUES ('2178', '260', '乌拉特中旗', '3');
INSERT INTO `clt_region` VALUES ('2179', '260', '乌拉特后旗', '3');
INSERT INTO `clt_region` VALUES ('2180', '260', '杭锦后旗', '3');
INSERT INTO `clt_region` VALUES ('2181', '261', '昆都仑区', '3');
INSERT INTO `clt_region` VALUES ('2182', '261', '青山区', '3');
INSERT INTO `clt_region` VALUES ('2183', '261', '东河区', '3');
INSERT INTO `clt_region` VALUES ('2184', '261', '九原区', '3');
INSERT INTO `clt_region` VALUES ('2185', '261', '石拐区', '3');
INSERT INTO `clt_region` VALUES ('2186', '261', '白云矿区', '3');
INSERT INTO `clt_region` VALUES ('2187', '261', '土默特右旗', '3');
INSERT INTO `clt_region` VALUES ('2188', '261', '固阳县', '3');
INSERT INTO `clt_region` VALUES ('2189', '261', '达尔罕茂明安联合旗', '3');
INSERT INTO `clt_region` VALUES ('2190', '262', '红山区', '3');
INSERT INTO `clt_region` VALUES ('2191', '262', '元宝山区', '3');
INSERT INTO `clt_region` VALUES ('2192', '262', '松山区', '3');
INSERT INTO `clt_region` VALUES ('2193', '262', '阿鲁科尔沁旗', '3');
INSERT INTO `clt_region` VALUES ('2194', '262', '巴林左旗', '3');
INSERT INTO `clt_region` VALUES ('2195', '262', '巴林右旗', '3');
INSERT INTO `clt_region` VALUES ('2196', '262', '林西县', '3');
INSERT INTO `clt_region` VALUES ('2197', '262', '克什克腾旗', '3');
INSERT INTO `clt_region` VALUES ('2198', '262', '翁牛特旗', '3');
INSERT INTO `clt_region` VALUES ('2199', '262', '喀喇沁旗', '3');
INSERT INTO `clt_region` VALUES ('2200', '262', '宁城县', '3');
INSERT INTO `clt_region` VALUES ('2201', '262', '敖汉旗', '3');
INSERT INTO `clt_region` VALUES ('2202', '263', '东胜区', '3');
INSERT INTO `clt_region` VALUES ('2203', '263', '达拉特旗', '3');
INSERT INTO `clt_region` VALUES ('2204', '263', '准格尔旗', '3');
INSERT INTO `clt_region` VALUES ('2205', '263', '鄂托克前旗', '3');
INSERT INTO `clt_region` VALUES ('2206', '263', '鄂托克旗', '3');
INSERT INTO `clt_region` VALUES ('2207', '263', '杭锦旗', '3');
INSERT INTO `clt_region` VALUES ('2208', '263', '乌审旗', '3');
INSERT INTO `clt_region` VALUES ('2209', '263', '伊金霍洛旗', '3');
INSERT INTO `clt_region` VALUES ('2210', '264', '海拉尔区', '3');
INSERT INTO `clt_region` VALUES ('2211', '264', '莫力达瓦', '3');
INSERT INTO `clt_region` VALUES ('2212', '264', '满洲里市', '3');
INSERT INTO `clt_region` VALUES ('2213', '264', '牙克石市', '3');
INSERT INTO `clt_region` VALUES ('2214', '264', '扎兰屯市', '3');
INSERT INTO `clt_region` VALUES ('2215', '264', '额尔古纳市', '3');
INSERT INTO `clt_region` VALUES ('2216', '264', '根河市', '3');
INSERT INTO `clt_region` VALUES ('2217', '264', '阿荣旗', '3');
INSERT INTO `clt_region` VALUES ('2218', '264', '鄂伦春自治旗', '3');
INSERT INTO `clt_region` VALUES ('2219', '264', '鄂温克族自治旗', '3');
INSERT INTO `clt_region` VALUES ('2220', '264', '陈巴尔虎旗', '3');
INSERT INTO `clt_region` VALUES ('2221', '264', '新巴尔虎左旗', '3');
INSERT INTO `clt_region` VALUES ('2222', '264', '新巴尔虎右旗', '3');
INSERT INTO `clt_region` VALUES ('2223', '265', '科尔沁区', '3');
INSERT INTO `clt_region` VALUES ('2224', '265', '霍林郭勒市', '3');
INSERT INTO `clt_region` VALUES ('2225', '265', '科尔沁左翼中旗', '3');
INSERT INTO `clt_region` VALUES ('2226', '265', '科尔沁左翼后旗', '3');
INSERT INTO `clt_region` VALUES ('2227', '265', '开鲁县', '3');
INSERT INTO `clt_region` VALUES ('2228', '265', '库伦旗', '3');
INSERT INTO `clt_region` VALUES ('2229', '265', '奈曼旗', '3');
INSERT INTO `clt_region` VALUES ('2230', '265', '扎鲁特旗', '3');
INSERT INTO `clt_region` VALUES ('2231', '266', '海勃湾区', '3');
INSERT INTO `clt_region` VALUES ('2232', '266', '乌达区', '3');
INSERT INTO `clt_region` VALUES ('2233', '266', '海南区', '3');
INSERT INTO `clt_region` VALUES ('2234', '267', '化德县', '3');
INSERT INTO `clt_region` VALUES ('2235', '267', '集宁区', '3');
INSERT INTO `clt_region` VALUES ('2236', '267', '丰镇市', '3');
INSERT INTO `clt_region` VALUES ('2237', '267', '卓资县', '3');
INSERT INTO `clt_region` VALUES ('2238', '267', '商都县', '3');
INSERT INTO `clt_region` VALUES ('2239', '267', '兴和县', '3');
INSERT INTO `clt_region` VALUES ('2240', '267', '凉城县', '3');
INSERT INTO `clt_region` VALUES ('2241', '267', '察哈尔右翼前旗', '3');
INSERT INTO `clt_region` VALUES ('2242', '267', '察哈尔右翼中旗', '3');
INSERT INTO `clt_region` VALUES ('2243', '267', '察哈尔右翼后旗', '3');
INSERT INTO `clt_region` VALUES ('2244', '267', '四子王旗', '3');
INSERT INTO `clt_region` VALUES ('2245', '268', '二连浩特市', '3');
INSERT INTO `clt_region` VALUES ('2246', '268', '锡林浩特市', '3');
INSERT INTO `clt_region` VALUES ('2247', '268', '阿巴嘎旗', '3');
INSERT INTO `clt_region` VALUES ('2248', '268', '苏尼特左旗', '3');
INSERT INTO `clt_region` VALUES ('2249', '268', '苏尼特右旗', '3');
INSERT INTO `clt_region` VALUES ('2250', '268', '东乌珠穆沁旗', '3');
INSERT INTO `clt_region` VALUES ('2251', '268', '西乌珠穆沁旗', '3');
INSERT INTO `clt_region` VALUES ('2252', '268', '太仆寺旗', '3');
INSERT INTO `clt_region` VALUES ('2253', '268', '镶黄旗', '3');
INSERT INTO `clt_region` VALUES ('2254', '268', '正镶白旗', '3');
INSERT INTO `clt_region` VALUES ('2255', '268', '正蓝旗', '3');
INSERT INTO `clt_region` VALUES ('2256', '268', '多伦县', '3');
INSERT INTO `clt_region` VALUES ('2257', '269', '乌兰浩特市', '3');
INSERT INTO `clt_region` VALUES ('2258', '269', '阿尔山市', '3');
INSERT INTO `clt_region` VALUES ('2259', '269', '科尔沁右翼前旗', '3');
INSERT INTO `clt_region` VALUES ('2260', '269', '科尔沁右翼中旗', '3');
INSERT INTO `clt_region` VALUES ('2261', '269', '扎赉特旗', '3');
INSERT INTO `clt_region` VALUES ('2262', '269', '突泉县', '3');
INSERT INTO `clt_region` VALUES ('2263', '270', '西夏区', '3');
INSERT INTO `clt_region` VALUES ('2264', '270', '金凤区', '3');
INSERT INTO `clt_region` VALUES ('2265', '270', '兴庆区', '3');
INSERT INTO `clt_region` VALUES ('2266', '270', '灵武市', '3');
INSERT INTO `clt_region` VALUES ('2267', '270', '永宁县', '3');
INSERT INTO `clt_region` VALUES ('2268', '270', '贺兰县', '3');
INSERT INTO `clt_region` VALUES ('2269', '271', '原州区', '3');
INSERT INTO `clt_region` VALUES ('2270', '271', '海原县', '3');
INSERT INTO `clt_region` VALUES ('2271', '271', '西吉县', '3');
INSERT INTO `clt_region` VALUES ('2272', '271', '隆德县', '3');
INSERT INTO `clt_region` VALUES ('2273', '271', '泾源县', '3');
INSERT INTO `clt_region` VALUES ('2274', '271', '彭阳县', '3');
INSERT INTO `clt_region` VALUES ('2275', '272', '惠农县', '3');
INSERT INTO `clt_region` VALUES ('2276', '272', '大武口区', '3');
INSERT INTO `clt_region` VALUES ('2277', '272', '惠农区', '3');
INSERT INTO `clt_region` VALUES ('2278', '272', '陶乐县', '3');
INSERT INTO `clt_region` VALUES ('2279', '272', '平罗县', '3');
INSERT INTO `clt_region` VALUES ('2280', '273', '利通区', '3');
INSERT INTO `clt_region` VALUES ('2281', '273', '中卫县', '3');
INSERT INTO `clt_region` VALUES ('2282', '273', '青铜峡市', '3');
INSERT INTO `clt_region` VALUES ('2283', '273', '中宁县', '3');
INSERT INTO `clt_region` VALUES ('2284', '273', '盐池县', '3');
INSERT INTO `clt_region` VALUES ('2285', '273', '同心县', '3');
INSERT INTO `clt_region` VALUES ('2286', '274', '沙坡头区', '3');
INSERT INTO `clt_region` VALUES ('2287', '274', '海原县', '3');
INSERT INTO `clt_region` VALUES ('2288', '274', '中宁县', '3');
INSERT INTO `clt_region` VALUES ('2289', '275', '城中区', '3');
INSERT INTO `clt_region` VALUES ('2290', '275', '城东区', '3');
INSERT INTO `clt_region` VALUES ('2291', '275', '城西区', '3');
INSERT INTO `clt_region` VALUES ('2292', '275', '城北区', '3');
INSERT INTO `clt_region` VALUES ('2293', '275', '湟中县', '3');
INSERT INTO `clt_region` VALUES ('2294', '275', '湟源县', '3');
INSERT INTO `clt_region` VALUES ('2295', '275', '大通', '3');
INSERT INTO `clt_region` VALUES ('2296', '276', '玛沁县', '3');
INSERT INTO `clt_region` VALUES ('2297', '276', '班玛县', '3');
INSERT INTO `clt_region` VALUES ('2298', '276', '甘德县', '3');
INSERT INTO `clt_region` VALUES ('2299', '276', '达日县', '3');
INSERT INTO `clt_region` VALUES ('2300', '276', '久治县', '3');
INSERT INTO `clt_region` VALUES ('2301', '276', '玛多县', '3');
INSERT INTO `clt_region` VALUES ('2302', '277', '海晏县', '3');
INSERT INTO `clt_region` VALUES ('2303', '277', '祁连县', '3');
INSERT INTO `clt_region` VALUES ('2304', '277', '刚察县', '3');
INSERT INTO `clt_region` VALUES ('2305', '277', '门源', '3');
INSERT INTO `clt_region` VALUES ('2306', '278', '平安县', '3');
INSERT INTO `clt_region` VALUES ('2307', '278', '乐都县', '3');
INSERT INTO `clt_region` VALUES ('2308', '278', '民和', '3');
INSERT INTO `clt_region` VALUES ('2309', '278', '互助', '3');
INSERT INTO `clt_region` VALUES ('2310', '278', '化隆', '3');
INSERT INTO `clt_region` VALUES ('2311', '278', '循化', '3');
INSERT INTO `clt_region` VALUES ('2312', '279', '共和县', '3');
INSERT INTO `clt_region` VALUES ('2313', '279', '同德县', '3');
INSERT INTO `clt_region` VALUES ('2314', '279', '贵德县', '3');
INSERT INTO `clt_region` VALUES ('2315', '279', '兴海县', '3');
INSERT INTO `clt_region` VALUES ('2316', '279', '贵南县', '3');
INSERT INTO `clt_region` VALUES ('2317', '280', '德令哈市', '3');
INSERT INTO `clt_region` VALUES ('2318', '280', '格尔木市', '3');
INSERT INTO `clt_region` VALUES ('2319', '280', '乌兰县', '3');
INSERT INTO `clt_region` VALUES ('2320', '280', '都兰县', '3');
INSERT INTO `clt_region` VALUES ('2321', '280', '天峻县', '3');
INSERT INTO `clt_region` VALUES ('2322', '281', '同仁县', '3');
INSERT INTO `clt_region` VALUES ('2323', '281', '尖扎县', '3');
INSERT INTO `clt_region` VALUES ('2324', '281', '泽库县', '3');
INSERT INTO `clt_region` VALUES ('2325', '281', '河南蒙古族自治县', '3');
INSERT INTO `clt_region` VALUES ('2326', '282', '玉树县', '3');
INSERT INTO `clt_region` VALUES ('2327', '282', '杂多县', '3');
INSERT INTO `clt_region` VALUES ('2328', '282', '称多县', '3');
INSERT INTO `clt_region` VALUES ('2329', '282', '治多县', '3');
INSERT INTO `clt_region` VALUES ('2330', '282', '囊谦县', '3');
INSERT INTO `clt_region` VALUES ('2331', '282', '曲麻莱县', '3');
INSERT INTO `clt_region` VALUES ('2332', '283', '市中区', '3');
INSERT INTO `clt_region` VALUES ('2333', '283', '历下区', '3');
INSERT INTO `clt_region` VALUES ('2334', '283', '天桥区', '3');
INSERT INTO `clt_region` VALUES ('2335', '283', '槐荫区', '3');
INSERT INTO `clt_region` VALUES ('2336', '283', '历城区', '3');
INSERT INTO `clt_region` VALUES ('2337', '283', '长清区', '3');
INSERT INTO `clt_region` VALUES ('2338', '283', '章丘市', '3');
INSERT INTO `clt_region` VALUES ('2339', '283', '平阴县', '3');
INSERT INTO `clt_region` VALUES ('2340', '283', '济阳县', '3');
INSERT INTO `clt_region` VALUES ('2341', '283', '商河县', '3');
INSERT INTO `clt_region` VALUES ('2342', '284', '市南区', '3');
INSERT INTO `clt_region` VALUES ('2343', '284', '市北区', '3');
INSERT INTO `clt_region` VALUES ('2344', '284', '城阳区', '3');
INSERT INTO `clt_region` VALUES ('2345', '284', '四方区', '3');
INSERT INTO `clt_region` VALUES ('2346', '284', '李沧区', '3');
INSERT INTO `clt_region` VALUES ('2347', '284', '黄岛区', '3');
INSERT INTO `clt_region` VALUES ('2348', '284', '崂山区', '3');
INSERT INTO `clt_region` VALUES ('2349', '284', '胶州市', '3');
INSERT INTO `clt_region` VALUES ('2350', '284', '即墨市', '3');
INSERT INTO `clt_region` VALUES ('2351', '284', '平度市', '3');
INSERT INTO `clt_region` VALUES ('2352', '284', '胶南市', '3');
INSERT INTO `clt_region` VALUES ('2353', '284', '莱西市', '3');
INSERT INTO `clt_region` VALUES ('2354', '285', '滨城区', '3');
INSERT INTO `clt_region` VALUES ('2355', '285', '惠民县', '3');
INSERT INTO `clt_region` VALUES ('2356', '285', '阳信县', '3');
INSERT INTO `clt_region` VALUES ('2357', '285', '无棣县', '3');
INSERT INTO `clt_region` VALUES ('2358', '285', '沾化县', '3');
INSERT INTO `clt_region` VALUES ('2359', '285', '博兴县', '3');
INSERT INTO `clt_region` VALUES ('2360', '285', '邹平县', '3');
INSERT INTO `clt_region` VALUES ('2361', '286', '德城区', '3');
INSERT INTO `clt_region` VALUES ('2362', '286', '陵县', '3');
INSERT INTO `clt_region` VALUES ('2363', '286', '乐陵市', '3');
INSERT INTO `clt_region` VALUES ('2364', '286', '禹城市', '3');
INSERT INTO `clt_region` VALUES ('2365', '286', '宁津县', '3');
INSERT INTO `clt_region` VALUES ('2366', '286', '庆云县', '3');
INSERT INTO `clt_region` VALUES ('2367', '286', '临邑县', '3');
INSERT INTO `clt_region` VALUES ('2368', '286', '齐河县', '3');
INSERT INTO `clt_region` VALUES ('2369', '286', '平原县', '3');
INSERT INTO `clt_region` VALUES ('2370', '286', '夏津县', '3');
INSERT INTO `clt_region` VALUES ('2371', '286', '武城县', '3');
INSERT INTO `clt_region` VALUES ('2372', '287', '东营区', '3');
INSERT INTO `clt_region` VALUES ('2373', '287', '河口区', '3');
INSERT INTO `clt_region` VALUES ('2374', '287', '垦利县', '3');
INSERT INTO `clt_region` VALUES ('2375', '287', '利津县', '3');
INSERT INTO `clt_region` VALUES ('2376', '287', '广饶县', '3');
INSERT INTO `clt_region` VALUES ('2377', '288', '牡丹区', '3');
INSERT INTO `clt_region` VALUES ('2378', '288', '曹县', '3');
INSERT INTO `clt_region` VALUES ('2379', '288', '单县', '3');
INSERT INTO `clt_region` VALUES ('2380', '288', '成武县', '3');
INSERT INTO `clt_region` VALUES ('2381', '288', '巨野县', '3');
INSERT INTO `clt_region` VALUES ('2382', '288', '郓城县', '3');
INSERT INTO `clt_region` VALUES ('2383', '288', '鄄城县', '3');
INSERT INTO `clt_region` VALUES ('2384', '288', '定陶县', '3');
INSERT INTO `clt_region` VALUES ('2385', '288', '东明县', '3');
INSERT INTO `clt_region` VALUES ('2386', '289', '市中区', '3');
INSERT INTO `clt_region` VALUES ('2387', '289', '任城区', '3');
INSERT INTO `clt_region` VALUES ('2388', '289', '曲阜市', '3');
INSERT INTO `clt_region` VALUES ('2389', '289', '兖州市', '3');
INSERT INTO `clt_region` VALUES ('2390', '289', '邹城市', '3');
INSERT INTO `clt_region` VALUES ('2391', '289', '微山县', '3');
INSERT INTO `clt_region` VALUES ('2392', '289', '鱼台县', '3');
INSERT INTO `clt_region` VALUES ('2393', '289', '金乡县', '3');
INSERT INTO `clt_region` VALUES ('2394', '289', '嘉祥县', '3');
INSERT INTO `clt_region` VALUES ('2395', '289', '汶上县', '3');
INSERT INTO `clt_region` VALUES ('2396', '289', '泗水县', '3');
INSERT INTO `clt_region` VALUES ('2397', '289', '梁山县', '3');
INSERT INTO `clt_region` VALUES ('2398', '290', '莱城区', '3');
INSERT INTO `clt_region` VALUES ('2399', '290', '钢城区', '3');
INSERT INTO `clt_region` VALUES ('2400', '291', '东昌府区', '3');
INSERT INTO `clt_region` VALUES ('2401', '291', '临清市', '3');
INSERT INTO `clt_region` VALUES ('2402', '291', '阳谷县', '3');
INSERT INTO `clt_region` VALUES ('2403', '291', '莘县', '3');
INSERT INTO `clt_region` VALUES ('2404', '291', '茌平县', '3');
INSERT INTO `clt_region` VALUES ('2405', '291', '东阿县', '3');
INSERT INTO `clt_region` VALUES ('2406', '291', '冠县', '3');
INSERT INTO `clt_region` VALUES ('2407', '291', '高唐县', '3');
INSERT INTO `clt_region` VALUES ('2408', '292', '兰山区', '3');
INSERT INTO `clt_region` VALUES ('2409', '292', '罗庄区', '3');
INSERT INTO `clt_region` VALUES ('2410', '292', '河东区', '3');
INSERT INTO `clt_region` VALUES ('2411', '292', '沂南县', '3');
INSERT INTO `clt_region` VALUES ('2412', '292', '郯城县', '3');
INSERT INTO `clt_region` VALUES ('2413', '292', '沂水县', '3');
INSERT INTO `clt_region` VALUES ('2414', '292', '苍山县', '3');
INSERT INTO `clt_region` VALUES ('2415', '292', '费县', '3');
INSERT INTO `clt_region` VALUES ('2416', '292', '平邑县', '3');
INSERT INTO `clt_region` VALUES ('2417', '292', '莒南县', '3');
INSERT INTO `clt_region` VALUES ('2418', '292', '蒙阴县', '3');
INSERT INTO `clt_region` VALUES ('2419', '292', '临沭县', '3');
INSERT INTO `clt_region` VALUES ('2420', '293', '东港区', '3');
INSERT INTO `clt_region` VALUES ('2421', '293', '岚山区', '3');
INSERT INTO `clt_region` VALUES ('2422', '293', '五莲县', '3');
INSERT INTO `clt_region` VALUES ('2423', '293', '莒县', '3');
INSERT INTO `clt_region` VALUES ('2424', '294', '泰山区', '3');
INSERT INTO `clt_region` VALUES ('2425', '294', '岱岳区', '3');
INSERT INTO `clt_region` VALUES ('2426', '294', '新泰市', '3');
INSERT INTO `clt_region` VALUES ('2427', '294', '肥城市', '3');
INSERT INTO `clt_region` VALUES ('2428', '294', '宁阳县', '3');
INSERT INTO `clt_region` VALUES ('2429', '294', '东平县', '3');
INSERT INTO `clt_region` VALUES ('2430', '295', '荣成市', '3');
INSERT INTO `clt_region` VALUES ('2431', '295', '乳山市', '3');
INSERT INTO `clt_region` VALUES ('2432', '295', '环翠区', '3');
INSERT INTO `clt_region` VALUES ('2433', '295', '文登市', '3');
INSERT INTO `clt_region` VALUES ('2434', '296', '潍城区', '3');
INSERT INTO `clt_region` VALUES ('2435', '296', '寒亭区', '3');
INSERT INTO `clt_region` VALUES ('2436', '296', '坊子区', '3');
INSERT INTO `clt_region` VALUES ('2437', '296', '奎文区', '3');
INSERT INTO `clt_region` VALUES ('2438', '296', '青州市', '3');
INSERT INTO `clt_region` VALUES ('2439', '296', '诸城市', '3');
INSERT INTO `clt_region` VALUES ('2440', '296', '寿光市', '3');
INSERT INTO `clt_region` VALUES ('2441', '296', '安丘市', '3');
INSERT INTO `clt_region` VALUES ('2442', '296', '高密市', '3');
INSERT INTO `clt_region` VALUES ('2443', '296', '昌邑市', '3');
INSERT INTO `clt_region` VALUES ('2444', '296', '临朐县', '3');
INSERT INTO `clt_region` VALUES ('2445', '296', '昌乐县', '3');
INSERT INTO `clt_region` VALUES ('2446', '297', '芝罘区', '3');
INSERT INTO `clt_region` VALUES ('2447', '297', '福山区', '3');
INSERT INTO `clt_region` VALUES ('2448', '297', '牟平区', '3');
INSERT INTO `clt_region` VALUES ('2449', '297', '莱山区', '3');
INSERT INTO `clt_region` VALUES ('2450', '297', '开发区', '3');
INSERT INTO `clt_region` VALUES ('2451', '297', '龙口市', '3');
INSERT INTO `clt_region` VALUES ('2452', '297', '莱阳市', '3');
INSERT INTO `clt_region` VALUES ('2453', '297', '莱州市', '3');
INSERT INTO `clt_region` VALUES ('2454', '297', '蓬莱市', '3');
INSERT INTO `clt_region` VALUES ('2455', '297', '招远市', '3');
INSERT INTO `clt_region` VALUES ('2456', '297', '栖霞市', '3');
INSERT INTO `clt_region` VALUES ('2457', '297', '海阳市', '3');
INSERT INTO `clt_region` VALUES ('2458', '297', '长岛县', '3');
INSERT INTO `clt_region` VALUES ('2459', '298', '市中区', '3');
INSERT INTO `clt_region` VALUES ('2460', '298', '山亭区', '3');
INSERT INTO `clt_region` VALUES ('2461', '298', '峄城区', '3');
INSERT INTO `clt_region` VALUES ('2462', '298', '台儿庄区', '3');
INSERT INTO `clt_region` VALUES ('2463', '298', '薛城区', '3');
INSERT INTO `clt_region` VALUES ('2464', '298', '滕州市', '3');
INSERT INTO `clt_region` VALUES ('2465', '299', '张店区', '3');
INSERT INTO `clt_region` VALUES ('2466', '299', '临淄区', '3');
INSERT INTO `clt_region` VALUES ('2467', '299', '淄川区', '3');
INSERT INTO `clt_region` VALUES ('2468', '299', '博山区', '3');
INSERT INTO `clt_region` VALUES ('2469', '299', '周村区', '3');
INSERT INTO `clt_region` VALUES ('2470', '299', '桓台县', '3');
INSERT INTO `clt_region` VALUES ('2471', '299', '高青县', '3');
INSERT INTO `clt_region` VALUES ('2472', '299', '沂源县', '3');
INSERT INTO `clt_region` VALUES ('2473', '300', '杏花岭区', '3');
INSERT INTO `clt_region` VALUES ('2474', '300', '小店区', '3');
INSERT INTO `clt_region` VALUES ('2475', '300', '迎泽区', '3');
INSERT INTO `clt_region` VALUES ('2476', '300', '尖草坪区', '3');
INSERT INTO `clt_region` VALUES ('2477', '300', '万柏林区', '3');
INSERT INTO `clt_region` VALUES ('2478', '300', '晋源区', '3');
INSERT INTO `clt_region` VALUES ('2479', '300', '高新开发区', '3');
INSERT INTO `clt_region` VALUES ('2480', '300', '民营经济开发区', '3');
INSERT INTO `clt_region` VALUES ('2481', '300', '经济技术开发区', '3');
INSERT INTO `clt_region` VALUES ('2482', '300', '清徐县', '3');
INSERT INTO `clt_region` VALUES ('2483', '300', '阳曲县', '3');
INSERT INTO `clt_region` VALUES ('2484', '300', '娄烦县', '3');
INSERT INTO `clt_region` VALUES ('2485', '300', '古交市', '3');
INSERT INTO `clt_region` VALUES ('2486', '301', '城区', '3');
INSERT INTO `clt_region` VALUES ('2487', '301', '郊区', '3');
INSERT INTO `clt_region` VALUES ('2488', '301', '沁县', '3');
INSERT INTO `clt_region` VALUES ('2489', '301', '潞城市', '3');
INSERT INTO `clt_region` VALUES ('2490', '301', '长治县', '3');
INSERT INTO `clt_region` VALUES ('2491', '301', '襄垣县', '3');
INSERT INTO `clt_region` VALUES ('2492', '301', '屯留县', '3');
INSERT INTO `clt_region` VALUES ('2493', '301', '平顺县', '3');
INSERT INTO `clt_region` VALUES ('2494', '301', '黎城县', '3');
INSERT INTO `clt_region` VALUES ('2495', '301', '壶关县', '3');
INSERT INTO `clt_region` VALUES ('2496', '301', '长子县', '3');
INSERT INTO `clt_region` VALUES ('2497', '301', '武乡县', '3');
INSERT INTO `clt_region` VALUES ('2498', '301', '沁源县', '3');
INSERT INTO `clt_region` VALUES ('2499', '302', '城区', '3');
INSERT INTO `clt_region` VALUES ('2500', '302', '矿区', '3');
INSERT INTO `clt_region` VALUES ('2501', '302', '南郊区', '3');
INSERT INTO `clt_region` VALUES ('2502', '302', '新荣区', '3');
INSERT INTO `clt_region` VALUES ('2503', '302', '阳高县', '3');
INSERT INTO `clt_region` VALUES ('2504', '302', '天镇县', '3');
INSERT INTO `clt_region` VALUES ('2505', '302', '广灵县', '3');
INSERT INTO `clt_region` VALUES ('2506', '302', '灵丘县', '3');
INSERT INTO `clt_region` VALUES ('2507', '302', '浑源县', '3');
INSERT INTO `clt_region` VALUES ('2508', '302', '左云县', '3');
INSERT INTO `clt_region` VALUES ('2509', '302', '大同县', '3');
INSERT INTO `clt_region` VALUES ('2510', '303', '城区', '3');
INSERT INTO `clt_region` VALUES ('2511', '303', '高平市', '3');
INSERT INTO `clt_region` VALUES ('2512', '303', '沁水县', '3');
INSERT INTO `clt_region` VALUES ('2513', '303', '阳城县', '3');
INSERT INTO `clt_region` VALUES ('2514', '303', '陵川县', '3');
INSERT INTO `clt_region` VALUES ('2515', '303', '泽州县', '3');
INSERT INTO `clt_region` VALUES ('2516', '304', '榆次区', '3');
INSERT INTO `clt_region` VALUES ('2517', '304', '介休市', '3');
INSERT INTO `clt_region` VALUES ('2518', '304', '榆社县', '3');
INSERT INTO `clt_region` VALUES ('2519', '304', '左权县', '3');
INSERT INTO `clt_region` VALUES ('2520', '304', '和顺县', '3');
INSERT INTO `clt_region` VALUES ('2521', '304', '昔阳县', '3');
INSERT INTO `clt_region` VALUES ('2522', '304', '寿阳县', '3');
INSERT INTO `clt_region` VALUES ('2523', '304', '太谷县', '3');
INSERT INTO `clt_region` VALUES ('2524', '304', '祁县', '3');
INSERT INTO `clt_region` VALUES ('2525', '304', '平遥县', '3');
INSERT INTO `clt_region` VALUES ('2526', '304', '灵石县', '3');
INSERT INTO `clt_region` VALUES ('2527', '305', '尧都区', '3');
INSERT INTO `clt_region` VALUES ('2528', '305', '侯马市', '3');
INSERT INTO `clt_region` VALUES ('2529', '305', '霍州市', '3');
INSERT INTO `clt_region` VALUES ('2530', '305', '曲沃县', '3');
INSERT INTO `clt_region` VALUES ('2531', '305', '翼城县', '3');
INSERT INTO `clt_region` VALUES ('2532', '305', '襄汾县', '3');
INSERT INTO `clt_region` VALUES ('2533', '305', '洪洞县', '3');
INSERT INTO `clt_region` VALUES ('2534', '305', '吉县', '3');
INSERT INTO `clt_region` VALUES ('2535', '305', '安泽县', '3');
INSERT INTO `clt_region` VALUES ('2536', '305', '浮山县', '3');
INSERT INTO `clt_region` VALUES ('2537', '305', '古县', '3');
INSERT INTO `clt_region` VALUES ('2538', '305', '乡宁县', '3');
INSERT INTO `clt_region` VALUES ('2539', '305', '大宁县', '3');
INSERT INTO `clt_region` VALUES ('2540', '305', '隰县', '3');
INSERT INTO `clt_region` VALUES ('2541', '305', '永和县', '3');
INSERT INTO `clt_region` VALUES ('2542', '305', '蒲县', '3');
INSERT INTO `clt_region` VALUES ('2543', '305', '汾西县', '3');
INSERT INTO `clt_region` VALUES ('2544', '306', '离石市', '3');
INSERT INTO `clt_region` VALUES ('2545', '306', '离石区', '3');
INSERT INTO `clt_region` VALUES ('2546', '306', '孝义市', '3');
INSERT INTO `clt_region` VALUES ('2547', '306', '汾阳市', '3');
INSERT INTO `clt_region` VALUES ('2548', '306', '文水县', '3');
INSERT INTO `clt_region` VALUES ('2549', '306', '交城县', '3');
INSERT INTO `clt_region` VALUES ('2550', '306', '兴县', '3');
INSERT INTO `clt_region` VALUES ('2551', '306', '临县', '3');
INSERT INTO `clt_region` VALUES ('2552', '306', '柳林县', '3');
INSERT INTO `clt_region` VALUES ('2553', '306', '石楼县', '3');
INSERT INTO `clt_region` VALUES ('2554', '306', '岚县', '3');
INSERT INTO `clt_region` VALUES ('2555', '306', '方山县', '3');
INSERT INTO `clt_region` VALUES ('2556', '306', '中阳县', '3');
INSERT INTO `clt_region` VALUES ('2557', '306', '交口县', '3');
INSERT INTO `clt_region` VALUES ('2558', '307', '朔城区', '3');
INSERT INTO `clt_region` VALUES ('2559', '307', '平鲁区', '3');
INSERT INTO `clt_region` VALUES ('2560', '307', '山阴县', '3');
INSERT INTO `clt_region` VALUES ('2561', '307', '应县', '3');
INSERT INTO `clt_region` VALUES ('2562', '307', '右玉县', '3');
INSERT INTO `clt_region` VALUES ('2563', '307', '怀仁县', '3');
INSERT INTO `clt_region` VALUES ('2564', '308', '忻府区', '3');
INSERT INTO `clt_region` VALUES ('2565', '308', '原平市', '3');
INSERT INTO `clt_region` VALUES ('2566', '308', '定襄县', '3');
INSERT INTO `clt_region` VALUES ('2567', '308', '五台县', '3');
INSERT INTO `clt_region` VALUES ('2568', '308', '代县', '3');
INSERT INTO `clt_region` VALUES ('2569', '308', '繁峙县', '3');
INSERT INTO `clt_region` VALUES ('2570', '308', '宁武县', '3');
INSERT INTO `clt_region` VALUES ('2571', '308', '静乐县', '3');
INSERT INTO `clt_region` VALUES ('2572', '308', '神池县', '3');
INSERT INTO `clt_region` VALUES ('2573', '308', '五寨县', '3');
INSERT INTO `clt_region` VALUES ('2574', '308', '岢岚县', '3');
INSERT INTO `clt_region` VALUES ('2575', '308', '河曲县', '3');
INSERT INTO `clt_region` VALUES ('2576', '308', '保德县', '3');
INSERT INTO `clt_region` VALUES ('2577', '308', '偏关县', '3');
INSERT INTO `clt_region` VALUES ('2578', '309', '城区', '3');
INSERT INTO `clt_region` VALUES ('2579', '309', '矿区', '3');
INSERT INTO `clt_region` VALUES ('2580', '309', '郊区', '3');
INSERT INTO `clt_region` VALUES ('2581', '309', '平定县', '3');
INSERT INTO `clt_region` VALUES ('2582', '309', '盂县', '3');
INSERT INTO `clt_region` VALUES ('2583', '310', '盐湖区', '3');
INSERT INTO `clt_region` VALUES ('2584', '310', '永济市', '3');
INSERT INTO `clt_region` VALUES ('2585', '310', '河津市', '3');
INSERT INTO `clt_region` VALUES ('2586', '310', '临猗县', '3');
INSERT INTO `clt_region` VALUES ('2587', '310', '万荣县', '3');
INSERT INTO `clt_region` VALUES ('2588', '310', '闻喜县', '3');
INSERT INTO `clt_region` VALUES ('2589', '310', '稷山县', '3');
INSERT INTO `clt_region` VALUES ('2590', '310', '新绛县', '3');
INSERT INTO `clt_region` VALUES ('2591', '310', '绛县', '3');
INSERT INTO `clt_region` VALUES ('2592', '310', '垣曲县', '3');
INSERT INTO `clt_region` VALUES ('2593', '310', '夏县', '3');
INSERT INTO `clt_region` VALUES ('2594', '310', '平陆县', '3');
INSERT INTO `clt_region` VALUES ('2595', '310', '芮城县', '3');
INSERT INTO `clt_region` VALUES ('2596', '311', '莲湖区', '3');
INSERT INTO `clt_region` VALUES ('2597', '311', '新城区', '3');
INSERT INTO `clt_region` VALUES ('2598', '311', '碑林区', '3');
INSERT INTO `clt_region` VALUES ('2599', '311', '雁塔区', '3');
INSERT INTO `clt_region` VALUES ('2600', '311', '灞桥区', '3');
INSERT INTO `clt_region` VALUES ('2601', '311', '未央区', '3');
INSERT INTO `clt_region` VALUES ('2602', '311', '阎良区', '3');
INSERT INTO `clt_region` VALUES ('2603', '311', '临潼区', '3');
INSERT INTO `clt_region` VALUES ('2604', '311', '长安区', '3');
INSERT INTO `clt_region` VALUES ('2605', '311', '蓝田县', '3');
INSERT INTO `clt_region` VALUES ('2606', '311', '周至县', '3');
INSERT INTO `clt_region` VALUES ('2607', '311', '户县', '3');
INSERT INTO `clt_region` VALUES ('2608', '311', '高陵县', '3');
INSERT INTO `clt_region` VALUES ('2609', '312', '汉滨区', '3');
INSERT INTO `clt_region` VALUES ('2610', '312', '汉阴县', '3');
INSERT INTO `clt_region` VALUES ('2611', '312', '石泉县', '3');
INSERT INTO `clt_region` VALUES ('2612', '312', '宁陕县', '3');
INSERT INTO `clt_region` VALUES ('2613', '312', '紫阳县', '3');
INSERT INTO `clt_region` VALUES ('2614', '312', '岚皋县', '3');
INSERT INTO `clt_region` VALUES ('2615', '312', '平利县', '3');
INSERT INTO `clt_region` VALUES ('2616', '312', '镇坪县', '3');
INSERT INTO `clt_region` VALUES ('2617', '312', '旬阳县', '3');
INSERT INTO `clt_region` VALUES ('2618', '312', '白河县', '3');
INSERT INTO `clt_region` VALUES ('2619', '313', '陈仓区', '3');
INSERT INTO `clt_region` VALUES ('2620', '313', '渭滨区', '3');
INSERT INTO `clt_region` VALUES ('2621', '313', '金台区', '3');
INSERT INTO `clt_region` VALUES ('2622', '313', '凤翔县', '3');
INSERT INTO `clt_region` VALUES ('2623', '313', '岐山县', '3');
INSERT INTO `clt_region` VALUES ('2624', '313', '扶风县', '3');
INSERT INTO `clt_region` VALUES ('2625', '313', '眉县', '3');
INSERT INTO `clt_region` VALUES ('2626', '313', '陇县', '3');
INSERT INTO `clt_region` VALUES ('2627', '313', '千阳县', '3');
INSERT INTO `clt_region` VALUES ('2628', '313', '麟游县', '3');
INSERT INTO `clt_region` VALUES ('2629', '313', '凤县', '3');
INSERT INTO `clt_region` VALUES ('2630', '313', '太白县', '3');
INSERT INTO `clt_region` VALUES ('2631', '314', '汉台区', '3');
INSERT INTO `clt_region` VALUES ('2632', '314', '南郑县', '3');
INSERT INTO `clt_region` VALUES ('2633', '314', '城固县', '3');
INSERT INTO `clt_region` VALUES ('2634', '314', '洋县', '3');
INSERT INTO `clt_region` VALUES ('2635', '314', '西乡县', '3');
INSERT INTO `clt_region` VALUES ('2636', '314', '勉县', '3');
INSERT INTO `clt_region` VALUES ('2637', '314', '宁强县', '3');
INSERT INTO `clt_region` VALUES ('2638', '314', '略阳县', '3');
INSERT INTO `clt_region` VALUES ('2639', '314', '镇巴县', '3');
INSERT INTO `clt_region` VALUES ('2640', '314', '留坝县', '3');
INSERT INTO `clt_region` VALUES ('2641', '314', '佛坪县', '3');
INSERT INTO `clt_region` VALUES ('2642', '315', '商州区', '3');
INSERT INTO `clt_region` VALUES ('2643', '315', '洛南县', '3');
INSERT INTO `clt_region` VALUES ('2644', '315', '丹凤县', '3');
INSERT INTO `clt_region` VALUES ('2645', '315', '商南县', '3');
INSERT INTO `clt_region` VALUES ('2646', '315', '山阳县', '3');
INSERT INTO `clt_region` VALUES ('2647', '315', '镇安县', '3');
INSERT INTO `clt_region` VALUES ('2648', '315', '柞水县', '3');
INSERT INTO `clt_region` VALUES ('2649', '316', '耀州区', '3');
INSERT INTO `clt_region` VALUES ('2650', '316', '王益区', '3');
INSERT INTO `clt_region` VALUES ('2651', '316', '印台区', '3');
INSERT INTO `clt_region` VALUES ('2652', '316', '宜君县', '3');
INSERT INTO `clt_region` VALUES ('2653', '317', '临渭区', '3');
INSERT INTO `clt_region` VALUES ('2654', '317', '韩城市', '3');
INSERT INTO `clt_region` VALUES ('2655', '317', '华阴市', '3');
INSERT INTO `clt_region` VALUES ('2656', '317', '华县', '3');
INSERT INTO `clt_region` VALUES ('2657', '317', '潼关县', '3');
INSERT INTO `clt_region` VALUES ('2658', '317', '大荔县', '3');
INSERT INTO `clt_region` VALUES ('2659', '317', '合阳县', '3');
INSERT INTO `clt_region` VALUES ('2660', '317', '澄城县', '3');
INSERT INTO `clt_region` VALUES ('2661', '317', '蒲城县', '3');
INSERT INTO `clt_region` VALUES ('2662', '317', '白水县', '3');
INSERT INTO `clt_region` VALUES ('2663', '317', '富平县', '3');
INSERT INTO `clt_region` VALUES ('2664', '318', '秦都区', '3');
INSERT INTO `clt_region` VALUES ('2665', '318', '渭城区', '3');
INSERT INTO `clt_region` VALUES ('2666', '318', '杨陵区', '3');
INSERT INTO `clt_region` VALUES ('2667', '318', '兴平市', '3');
INSERT INTO `clt_region` VALUES ('2668', '318', '三原县', '3');
INSERT INTO `clt_region` VALUES ('2669', '318', '泾阳县', '3');
INSERT INTO `clt_region` VALUES ('2670', '318', '乾县', '3');
INSERT INTO `clt_region` VALUES ('2671', '318', '礼泉县', '3');
INSERT INTO `clt_region` VALUES ('2672', '318', '永寿县', '3');
INSERT INTO `clt_region` VALUES ('2673', '318', '彬县', '3');
INSERT INTO `clt_region` VALUES ('2674', '318', '长武县', '3');
INSERT INTO `clt_region` VALUES ('2675', '318', '旬邑县', '3');
INSERT INTO `clt_region` VALUES ('2676', '318', '淳化县', '3');
INSERT INTO `clt_region` VALUES ('2677', '318', '武功县', '3');
INSERT INTO `clt_region` VALUES ('2678', '319', '吴起县', '3');
INSERT INTO `clt_region` VALUES ('2679', '319', '宝塔区', '3');
INSERT INTO `clt_region` VALUES ('2680', '319', '延长县', '3');
INSERT INTO `clt_region` VALUES ('2681', '319', '延川县', '3');
INSERT INTO `clt_region` VALUES ('2682', '319', '子长县', '3');
INSERT INTO `clt_region` VALUES ('2683', '319', '安塞县', '3');
INSERT INTO `clt_region` VALUES ('2684', '319', '志丹县', '3');
INSERT INTO `clt_region` VALUES ('2685', '319', '甘泉县', '3');
INSERT INTO `clt_region` VALUES ('2686', '319', '富县', '3');
INSERT INTO `clt_region` VALUES ('2687', '319', '洛川县', '3');
INSERT INTO `clt_region` VALUES ('2688', '319', '宜川县', '3');
INSERT INTO `clt_region` VALUES ('2689', '319', '黄龙县', '3');
INSERT INTO `clt_region` VALUES ('2690', '319', '黄陵县', '3');
INSERT INTO `clt_region` VALUES ('2691', '320', '榆阳区', '3');
INSERT INTO `clt_region` VALUES ('2692', '320', '神木县', '3');
INSERT INTO `clt_region` VALUES ('2693', '320', '府谷县', '3');
INSERT INTO `clt_region` VALUES ('2694', '320', '横山县', '3');
INSERT INTO `clt_region` VALUES ('2695', '320', '靖边县', '3');
INSERT INTO `clt_region` VALUES ('2696', '320', '定边县', '3');
INSERT INTO `clt_region` VALUES ('2697', '320', '绥德县', '3');
INSERT INTO `clt_region` VALUES ('2698', '320', '米脂县', '3');
INSERT INTO `clt_region` VALUES ('2699', '320', '佳县', '3');
INSERT INTO `clt_region` VALUES ('2700', '320', '吴堡县', '3');
INSERT INTO `clt_region` VALUES ('2701', '320', '清涧县', '3');
INSERT INTO `clt_region` VALUES ('2702', '320', '子洲县', '3');
INSERT INTO `clt_region` VALUES ('2703', '321', '长宁区', '3');
INSERT INTO `clt_region` VALUES ('2704', '321', '闸北区', '3');
INSERT INTO `clt_region` VALUES ('2705', '321', '闵行区', '3');
INSERT INTO `clt_region` VALUES ('2706', '321', '徐汇区', '3');
INSERT INTO `clt_region` VALUES ('2707', '321', '浦东新区', '3');
INSERT INTO `clt_region` VALUES ('2708', '321', '杨浦区', '3');
INSERT INTO `clt_region` VALUES ('2709', '321', '普陀区', '3');
INSERT INTO `clt_region` VALUES ('2710', '321', '静安区', '3');
INSERT INTO `clt_region` VALUES ('2711', '321', '卢湾区', '3');
INSERT INTO `clt_region` VALUES ('2712', '321', '虹口区', '3');
INSERT INTO `clt_region` VALUES ('2713', '321', '黄浦区', '3');
INSERT INTO `clt_region` VALUES ('2714', '321', '南汇区', '3');
INSERT INTO `clt_region` VALUES ('2715', '321', '松江区', '3');
INSERT INTO `clt_region` VALUES ('2716', '321', '嘉定区', '3');
INSERT INTO `clt_region` VALUES ('2717', '321', '宝山区', '3');
INSERT INTO `clt_region` VALUES ('2718', '321', '青浦区', '3');
INSERT INTO `clt_region` VALUES ('2719', '321', '金山区', '3');
INSERT INTO `clt_region` VALUES ('2720', '321', '奉贤区', '3');
INSERT INTO `clt_region` VALUES ('2721', '321', '崇明县', '3');
INSERT INTO `clt_region` VALUES ('2722', '322', '青羊区', '3');
INSERT INTO `clt_region` VALUES ('2723', '322', '锦江区', '3');
INSERT INTO `clt_region` VALUES ('2724', '322', '金牛区', '3');
INSERT INTO `clt_region` VALUES ('2725', '322', '武侯区', '3');
INSERT INTO `clt_region` VALUES ('2726', '322', '成华区', '3');
INSERT INTO `clt_region` VALUES ('2727', '322', '龙泉驿区', '3');
INSERT INTO `clt_region` VALUES ('2728', '322', '青白江区', '3');
INSERT INTO `clt_region` VALUES ('2729', '322', '新都区', '3');
INSERT INTO `clt_region` VALUES ('2730', '322', '温江区', '3');
INSERT INTO `clt_region` VALUES ('2731', '322', '高新区', '3');
INSERT INTO `clt_region` VALUES ('2732', '322', '高新西区', '3');
INSERT INTO `clt_region` VALUES ('2733', '322', '都江堰市', '3');
INSERT INTO `clt_region` VALUES ('2734', '322', '彭州市', '3');
INSERT INTO `clt_region` VALUES ('2735', '322', '邛崃市', '3');
INSERT INTO `clt_region` VALUES ('2736', '322', '崇州市', '3');
INSERT INTO `clt_region` VALUES ('2737', '322', '金堂县', '3');
INSERT INTO `clt_region` VALUES ('2738', '322', '双流县', '3');
INSERT INTO `clt_region` VALUES ('2739', '322', '郫县', '3');
INSERT INTO `clt_region` VALUES ('2740', '322', '大邑县', '3');
INSERT INTO `clt_region` VALUES ('2741', '322', '蒲江县', '3');
INSERT INTO `clt_region` VALUES ('2742', '322', '新津县', '3');
INSERT INTO `clt_region` VALUES ('2743', '322', '都江堰市', '3');
INSERT INTO `clt_region` VALUES ('2744', '322', '彭州市', '3');
INSERT INTO `clt_region` VALUES ('2745', '322', '邛崃市', '3');
INSERT INTO `clt_region` VALUES ('2746', '322', '崇州市', '3');
INSERT INTO `clt_region` VALUES ('2747', '322', '金堂县', '3');
INSERT INTO `clt_region` VALUES ('2748', '322', '双流县', '3');
INSERT INTO `clt_region` VALUES ('2749', '322', '郫县', '3');
INSERT INTO `clt_region` VALUES ('2750', '322', '大邑县', '3');
INSERT INTO `clt_region` VALUES ('2751', '322', '蒲江县', '3');
INSERT INTO `clt_region` VALUES ('2752', '322', '新津县', '3');
INSERT INTO `clt_region` VALUES ('2753', '323', '涪城区', '3');
INSERT INTO `clt_region` VALUES ('2754', '323', '游仙区', '3');
INSERT INTO `clt_region` VALUES ('2755', '323', '江油市', '3');
INSERT INTO `clt_region` VALUES ('2756', '323', '盐亭县', '3');
INSERT INTO `clt_region` VALUES ('2757', '323', '三台县', '3');
INSERT INTO `clt_region` VALUES ('2758', '323', '平武县', '3');
INSERT INTO `clt_region` VALUES ('2759', '323', '安县', '3');
INSERT INTO `clt_region` VALUES ('2760', '323', '梓潼县', '3');
INSERT INTO `clt_region` VALUES ('2761', '323', '北川县', '3');
INSERT INTO `clt_region` VALUES ('2762', '324', '马尔康县', '3');
INSERT INTO `clt_region` VALUES ('2763', '324', '汶川县', '3');
INSERT INTO `clt_region` VALUES ('2764', '324', '理县', '3');
INSERT INTO `clt_region` VALUES ('2765', '324', '茂县', '3');
INSERT INTO `clt_region` VALUES ('2766', '324', '松潘县', '3');
INSERT INTO `clt_region` VALUES ('2767', '324', '九寨沟县', '3');
INSERT INTO `clt_region` VALUES ('2768', '324', '金川县', '3');
INSERT INTO `clt_region` VALUES ('2769', '324', '小金县', '3');
INSERT INTO `clt_region` VALUES ('2770', '324', '黑水县', '3');
INSERT INTO `clt_region` VALUES ('2771', '324', '壤塘县', '3');
INSERT INTO `clt_region` VALUES ('2772', '324', '阿坝县', '3');
INSERT INTO `clt_region` VALUES ('2773', '324', '若尔盖县', '3');
INSERT INTO `clt_region` VALUES ('2774', '324', '红原县', '3');
INSERT INTO `clt_region` VALUES ('2775', '325', '巴州区', '3');
INSERT INTO `clt_region` VALUES ('2776', '325', '通江县', '3');
INSERT INTO `clt_region` VALUES ('2777', '325', '南江县', '3');
INSERT INTO `clt_region` VALUES ('2778', '325', '平昌县', '3');
INSERT INTO `clt_region` VALUES ('2779', '326', '通川区', '3');
INSERT INTO `clt_region` VALUES ('2780', '326', '万源市', '3');
INSERT INTO `clt_region` VALUES ('2781', '326', '达县', '3');
INSERT INTO `clt_region` VALUES ('2782', '326', '宣汉县', '3');
INSERT INTO `clt_region` VALUES ('2783', '326', '开江县', '3');
INSERT INTO `clt_region` VALUES ('2784', '326', '大竹县', '3');
INSERT INTO `clt_region` VALUES ('2785', '326', '渠县', '3');
INSERT INTO `clt_region` VALUES ('2786', '327', '旌阳区', '3');
INSERT INTO `clt_region` VALUES ('2787', '327', '广汉市', '3');
INSERT INTO `clt_region` VALUES ('2788', '327', '什邡市', '3');
INSERT INTO `clt_region` VALUES ('2789', '327', '绵竹市', '3');
INSERT INTO `clt_region` VALUES ('2790', '327', '罗江县', '3');
INSERT INTO `clt_region` VALUES ('2791', '327', '中江县', '3');
INSERT INTO `clt_region` VALUES ('2792', '328', '康定县', '3');
INSERT INTO `clt_region` VALUES ('2793', '328', '丹巴县', '3');
INSERT INTO `clt_region` VALUES ('2794', '328', '泸定县', '3');
INSERT INTO `clt_region` VALUES ('2795', '328', '炉霍县', '3');
INSERT INTO `clt_region` VALUES ('2796', '328', '九龙县', '3');
INSERT INTO `clt_region` VALUES ('2797', '328', '甘孜县', '3');
INSERT INTO `clt_region` VALUES ('2798', '328', '雅江县', '3');
INSERT INTO `clt_region` VALUES ('2799', '328', '新龙县', '3');
INSERT INTO `clt_region` VALUES ('2800', '328', '道孚县', '3');
INSERT INTO `clt_region` VALUES ('2801', '328', '白玉县', '3');
INSERT INTO `clt_region` VALUES ('2802', '328', '理塘县', '3');
INSERT INTO `clt_region` VALUES ('2803', '328', '德格县', '3');
INSERT INTO `clt_region` VALUES ('2804', '328', '乡城县', '3');
INSERT INTO `clt_region` VALUES ('2805', '328', '石渠县', '3');
INSERT INTO `clt_region` VALUES ('2806', '328', '稻城县', '3');
INSERT INTO `clt_region` VALUES ('2807', '328', '色达县', '3');
INSERT INTO `clt_region` VALUES ('2808', '328', '巴塘县', '3');
INSERT INTO `clt_region` VALUES ('2809', '328', '得荣县', '3');
INSERT INTO `clt_region` VALUES ('2810', '329', '广安区', '3');
INSERT INTO `clt_region` VALUES ('2811', '329', '华蓥市', '3');
INSERT INTO `clt_region` VALUES ('2812', '329', '岳池县', '3');
INSERT INTO `clt_region` VALUES ('2813', '329', '武胜县', '3');
INSERT INTO `clt_region` VALUES ('2814', '329', '邻水县', '3');
INSERT INTO `clt_region` VALUES ('2815', '330', '利州区', '3');
INSERT INTO `clt_region` VALUES ('2816', '330', '元坝区', '3');
INSERT INTO `clt_region` VALUES ('2817', '330', '朝天区', '3');
INSERT INTO `clt_region` VALUES ('2818', '330', '旺苍县', '3');
INSERT INTO `clt_region` VALUES ('2819', '330', '青川县', '3');
INSERT INTO `clt_region` VALUES ('2820', '330', '剑阁县', '3');
INSERT INTO `clt_region` VALUES ('2821', '330', '苍溪县', '3');
INSERT INTO `clt_region` VALUES ('2822', '331', '峨眉山市', '3');
INSERT INTO `clt_region` VALUES ('2823', '331', '乐山市', '3');
INSERT INTO `clt_region` VALUES ('2824', '331', '犍为县', '3');
INSERT INTO `clt_region` VALUES ('2825', '331', '井研县', '3');
INSERT INTO `clt_region` VALUES ('2826', '331', '夹江县', '3');
INSERT INTO `clt_region` VALUES ('2827', '331', '沐川县', '3');
INSERT INTO `clt_region` VALUES ('2828', '331', '峨边', '3');
INSERT INTO `clt_region` VALUES ('2829', '331', '马边', '3');
INSERT INTO `clt_region` VALUES ('2830', '332', '西昌市', '3');
INSERT INTO `clt_region` VALUES ('2831', '332', '盐源县', '3');
INSERT INTO `clt_region` VALUES ('2832', '332', '德昌县', '3');
INSERT INTO `clt_region` VALUES ('2833', '332', '会理县', '3');
INSERT INTO `clt_region` VALUES ('2834', '332', '会东县', '3');
INSERT INTO `clt_region` VALUES ('2835', '332', '宁南县', '3');
INSERT INTO `clt_region` VALUES ('2836', '332', '普格县', '3');
INSERT INTO `clt_region` VALUES ('2837', '332', '布拖县', '3');
INSERT INTO `clt_region` VALUES ('2838', '332', '金阳县', '3');
INSERT INTO `clt_region` VALUES ('2839', '332', '昭觉县', '3');
INSERT INTO `clt_region` VALUES ('2840', '332', '喜德县', '3');
INSERT INTO `clt_region` VALUES ('2841', '332', '冕宁县', '3');
INSERT INTO `clt_region` VALUES ('2842', '332', '越西县', '3');
INSERT INTO `clt_region` VALUES ('2843', '332', '甘洛县', '3');
INSERT INTO `clt_region` VALUES ('2844', '332', '美姑县', '3');
INSERT INTO `clt_region` VALUES ('2845', '332', '雷波县', '3');
INSERT INTO `clt_region` VALUES ('2846', '332', '木里', '3');
INSERT INTO `clt_region` VALUES ('2847', '333', '东坡区', '3');
INSERT INTO `clt_region` VALUES ('2848', '333', '仁寿县', '3');
INSERT INTO `clt_region` VALUES ('2849', '333', '彭山县', '3');
INSERT INTO `clt_region` VALUES ('2850', '333', '洪雅县', '3');
INSERT INTO `clt_region` VALUES ('2851', '333', '丹棱县', '3');
INSERT INTO `clt_region` VALUES ('2852', '333', '青神县', '3');
INSERT INTO `clt_region` VALUES ('2853', '334', '阆中市', '3');
INSERT INTO `clt_region` VALUES ('2854', '334', '南部县', '3');
INSERT INTO `clt_region` VALUES ('2855', '334', '营山县', '3');
INSERT INTO `clt_region` VALUES ('2856', '334', '蓬安县', '3');
INSERT INTO `clt_region` VALUES ('2857', '334', '仪陇县', '3');
INSERT INTO `clt_region` VALUES ('2858', '334', '顺庆区', '3');
INSERT INTO `clt_region` VALUES ('2859', '334', '高坪区', '3');
INSERT INTO `clt_region` VALUES ('2860', '334', '嘉陵区', '3');
INSERT INTO `clt_region` VALUES ('2861', '334', '西充县', '3');
INSERT INTO `clt_region` VALUES ('2862', '335', '市中区', '3');
INSERT INTO `clt_region` VALUES ('2863', '335', '东兴区', '3');
INSERT INTO `clt_region` VALUES ('2864', '335', '威远县', '3');
INSERT INTO `clt_region` VALUES ('2865', '335', '资中县', '3');
INSERT INTO `clt_region` VALUES ('2866', '335', '隆昌县', '3');
INSERT INTO `clt_region` VALUES ('2867', '336', '东  区', '3');
INSERT INTO `clt_region` VALUES ('2868', '336', '西  区', '3');
INSERT INTO `clt_region` VALUES ('2869', '336', '仁和区', '3');
INSERT INTO `clt_region` VALUES ('2870', '336', '米易县', '3');
INSERT INTO `clt_region` VALUES ('2871', '336', '盐边县', '3');
INSERT INTO `clt_region` VALUES ('2872', '337', '船山区', '3');
INSERT INTO `clt_region` VALUES ('2873', '337', '安居区', '3');
INSERT INTO `clt_region` VALUES ('2874', '337', '蓬溪县', '3');
INSERT INTO `clt_region` VALUES ('2875', '337', '射洪县', '3');
INSERT INTO `clt_region` VALUES ('2876', '337', '大英县', '3');
INSERT INTO `clt_region` VALUES ('2877', '338', '雨城区', '3');
INSERT INTO `clt_region` VALUES ('2878', '338', '名山县', '3');
INSERT INTO `clt_region` VALUES ('2879', '338', '荥经县', '3');
INSERT INTO `clt_region` VALUES ('2880', '338', '汉源县', '3');
INSERT INTO `clt_region` VALUES ('2881', '338', '石棉县', '3');
INSERT INTO `clt_region` VALUES ('2882', '338', '天全县', '3');
INSERT INTO `clt_region` VALUES ('2883', '338', '芦山县', '3');
INSERT INTO `clt_region` VALUES ('2884', '338', '宝兴县', '3');
INSERT INTO `clt_region` VALUES ('2885', '339', '翠屏区', '3');
INSERT INTO `clt_region` VALUES ('2886', '339', '宜宾县', '3');
INSERT INTO `clt_region` VALUES ('2887', '339', '南溪县', '3');
INSERT INTO `clt_region` VALUES ('2888', '339', '江安县', '3');
INSERT INTO `clt_region` VALUES ('2889', '339', '长宁县', '3');
INSERT INTO `clt_region` VALUES ('2890', '339', '高县', '3');
INSERT INTO `clt_region` VALUES ('2891', '339', '珙县', '3');
INSERT INTO `clt_region` VALUES ('2892', '339', '筠连县', '3');
INSERT INTO `clt_region` VALUES ('2893', '339', '兴文县', '3');
INSERT INTO `clt_region` VALUES ('2894', '339', '屏山县', '3');
INSERT INTO `clt_region` VALUES ('2895', '340', '雁江区', '3');
INSERT INTO `clt_region` VALUES ('2896', '340', '简阳市', '3');
INSERT INTO `clt_region` VALUES ('2897', '340', '安岳县', '3');
INSERT INTO `clt_region` VALUES ('2898', '340', '乐至县', '3');
INSERT INTO `clt_region` VALUES ('2899', '341', '大安区', '3');
INSERT INTO `clt_region` VALUES ('2900', '341', '自流井区', '3');
INSERT INTO `clt_region` VALUES ('2901', '341', '贡井区', '3');
INSERT INTO `clt_region` VALUES ('2902', '341', '沿滩区', '3');
INSERT INTO `clt_region` VALUES ('2903', '341', '荣县', '3');
INSERT INTO `clt_region` VALUES ('2904', '341', '富顺县', '3');
INSERT INTO `clt_region` VALUES ('2905', '342', '江阳区', '3');
INSERT INTO `clt_region` VALUES ('2906', '342', '纳溪区', '3');
INSERT INTO `clt_region` VALUES ('2907', '342', '龙马潭区', '3');
INSERT INTO `clt_region` VALUES ('2908', '342', '泸县', '3');
INSERT INTO `clt_region` VALUES ('2909', '342', '合江县', '3');
INSERT INTO `clt_region` VALUES ('2910', '342', '叙永县', '3');
INSERT INTO `clt_region` VALUES ('2911', '342', '古蔺县', '3');
INSERT INTO `clt_region` VALUES ('2912', '343', '和平区', '3');
INSERT INTO `clt_region` VALUES ('2913', '343', '河西区', '3');
INSERT INTO `clt_region` VALUES ('2914', '343', '南开区', '3');
INSERT INTO `clt_region` VALUES ('2915', '343', '河北区', '3');
INSERT INTO `clt_region` VALUES ('2916', '343', '河东区', '3');
INSERT INTO `clt_region` VALUES ('2917', '343', '红桥区', '3');
INSERT INTO `clt_region` VALUES ('2918', '343', '东丽区', '3');
INSERT INTO `clt_region` VALUES ('2919', '343', '津南区', '3');
INSERT INTO `clt_region` VALUES ('2920', '343', '西青区', '3');
INSERT INTO `clt_region` VALUES ('2921', '343', '北辰区', '3');
INSERT INTO `clt_region` VALUES ('2922', '343', '塘沽区', '3');
INSERT INTO `clt_region` VALUES ('2923', '343', '汉沽区', '3');
INSERT INTO `clt_region` VALUES ('2924', '343', '大港区', '3');
INSERT INTO `clt_region` VALUES ('2925', '343', '武清区', '3');
INSERT INTO `clt_region` VALUES ('2926', '343', '宝坻区', '3');
INSERT INTO `clt_region` VALUES ('2927', '343', '经济开发区', '3');
INSERT INTO `clt_region` VALUES ('2928', '343', '宁河县', '3');
INSERT INTO `clt_region` VALUES ('2929', '343', '静海县', '3');
INSERT INTO `clt_region` VALUES ('2930', '343', '蓟县', '3');
INSERT INTO `clt_region` VALUES ('2931', '344', '城关区', '3');
INSERT INTO `clt_region` VALUES ('2932', '344', '林周县', '3');
INSERT INTO `clt_region` VALUES ('2933', '344', '当雄县', '3');
INSERT INTO `clt_region` VALUES ('2934', '344', '尼木县', '3');
INSERT INTO `clt_region` VALUES ('2935', '344', '曲水县', '3');
INSERT INTO `clt_region` VALUES ('2936', '344', '堆龙德庆县', '3');
INSERT INTO `clt_region` VALUES ('2937', '344', '达孜县', '3');
INSERT INTO `clt_region` VALUES ('2938', '344', '墨竹工卡县', '3');
INSERT INTO `clt_region` VALUES ('2939', '345', '噶尔县', '3');
INSERT INTO `clt_region` VALUES ('2940', '345', '普兰县', '3');
INSERT INTO `clt_region` VALUES ('2941', '345', '札达县', '3');
INSERT INTO `clt_region` VALUES ('2942', '345', '日土县', '3');
INSERT INTO `clt_region` VALUES ('2943', '345', '革吉县', '3');
INSERT INTO `clt_region` VALUES ('2944', '345', '改则县', '3');
INSERT INTO `clt_region` VALUES ('2945', '345', '措勤县', '3');
INSERT INTO `clt_region` VALUES ('2946', '346', '昌都县', '3');
INSERT INTO `clt_region` VALUES ('2947', '346', '江达县', '3');
INSERT INTO `clt_region` VALUES ('2948', '346', '贡觉县', '3');
INSERT INTO `clt_region` VALUES ('2949', '346', '类乌齐县', '3');
INSERT INTO `clt_region` VALUES ('2950', '346', '丁青县', '3');
INSERT INTO `clt_region` VALUES ('2951', '346', '察雅县', '3');
INSERT INTO `clt_region` VALUES ('2952', '346', '八宿县', '3');
INSERT INTO `clt_region` VALUES ('2953', '346', '左贡县', '3');
INSERT INTO `clt_region` VALUES ('2954', '346', '芒康县', '3');
INSERT INTO `clt_region` VALUES ('2955', '346', '洛隆县', '3');
INSERT INTO `clt_region` VALUES ('2956', '346', '边坝县', '3');
INSERT INTO `clt_region` VALUES ('2957', '347', '林芝县', '3');
INSERT INTO `clt_region` VALUES ('2958', '347', '工布江达县', '3');
INSERT INTO `clt_region` VALUES ('2959', '347', '米林县', '3');
INSERT INTO `clt_region` VALUES ('2960', '347', '墨脱县', '3');
INSERT INTO `clt_region` VALUES ('2961', '347', '波密县', '3');
INSERT INTO `clt_region` VALUES ('2962', '347', '察隅县', '3');
INSERT INTO `clt_region` VALUES ('2963', '347', '朗县', '3');
INSERT INTO `clt_region` VALUES ('2964', '348', '那曲县', '3');
INSERT INTO `clt_region` VALUES ('2965', '348', '嘉黎县', '3');
INSERT INTO `clt_region` VALUES ('2966', '348', '比如县', '3');
INSERT INTO `clt_region` VALUES ('2967', '348', '聂荣县', '3');
INSERT INTO `clt_region` VALUES ('2968', '348', '安多县', '3');
INSERT INTO `clt_region` VALUES ('2969', '348', '申扎县', '3');
INSERT INTO `clt_region` VALUES ('2970', '348', '索县', '3');
INSERT INTO `clt_region` VALUES ('2971', '348', '班戈县', '3');
INSERT INTO `clt_region` VALUES ('2972', '348', '巴青县', '3');
INSERT INTO `clt_region` VALUES ('2973', '348', '尼玛县', '3');
INSERT INTO `clt_region` VALUES ('2974', '349', '日喀则市', '3');
INSERT INTO `clt_region` VALUES ('2975', '349', '南木林县', '3');
INSERT INTO `clt_region` VALUES ('2976', '349', '江孜县', '3');
INSERT INTO `clt_region` VALUES ('2977', '349', '定日县', '3');
INSERT INTO `clt_region` VALUES ('2978', '349', '萨迦县', '3');
INSERT INTO `clt_region` VALUES ('2979', '349', '拉孜县', '3');
INSERT INTO `clt_region` VALUES ('2980', '349', '昂仁县', '3');
INSERT INTO `clt_region` VALUES ('2981', '349', '谢通门县', '3');
INSERT INTO `clt_region` VALUES ('2982', '349', '白朗县', '3');
INSERT INTO `clt_region` VALUES ('2983', '349', '仁布县', '3');
INSERT INTO `clt_region` VALUES ('2984', '349', '康马县', '3');
INSERT INTO `clt_region` VALUES ('2985', '349', '定结县', '3');
INSERT INTO `clt_region` VALUES ('2986', '349', '仲巴县', '3');
INSERT INTO `clt_region` VALUES ('2987', '349', '亚东县', '3');
INSERT INTO `clt_region` VALUES ('2988', '349', '吉隆县', '3');
INSERT INTO `clt_region` VALUES ('2989', '349', '聂拉木县', '3');
INSERT INTO `clt_region` VALUES ('2990', '349', '萨嘎县', '3');
INSERT INTO `clt_region` VALUES ('2991', '349', '岗巴县', '3');
INSERT INTO `clt_region` VALUES ('2992', '350', '乃东县', '3');
INSERT INTO `clt_region` VALUES ('2993', '350', '扎囊县', '3');
INSERT INTO `clt_region` VALUES ('2994', '350', '贡嘎县', '3');
INSERT INTO `clt_region` VALUES ('2995', '350', '桑日县', '3');
INSERT INTO `clt_region` VALUES ('2996', '350', '琼结县', '3');
INSERT INTO `clt_region` VALUES ('2997', '350', '曲松县', '3');
INSERT INTO `clt_region` VALUES ('2998', '350', '措美县', '3');
INSERT INTO `clt_region` VALUES ('2999', '350', '洛扎县', '3');
INSERT INTO `clt_region` VALUES ('3000', '350', '加查县', '3');
INSERT INTO `clt_region` VALUES ('3001', '350', '隆子县', '3');
INSERT INTO `clt_region` VALUES ('3002', '350', '错那县', '3');
INSERT INTO `clt_region` VALUES ('3003', '350', '浪卡子县', '3');
INSERT INTO `clt_region` VALUES ('3004', '351', '天山区', '3');
INSERT INTO `clt_region` VALUES ('3005', '351', '沙依巴克区', '3');
INSERT INTO `clt_region` VALUES ('3006', '351', '新市区', '3');
INSERT INTO `clt_region` VALUES ('3007', '351', '水磨沟区', '3');
INSERT INTO `clt_region` VALUES ('3008', '351', '头屯河区', '3');
INSERT INTO `clt_region` VALUES ('3009', '351', '达坂城区', '3');
INSERT INTO `clt_region` VALUES ('3010', '351', '米东区', '3');
INSERT INTO `clt_region` VALUES ('3011', '351', '乌鲁木齐县', '3');
INSERT INTO `clt_region` VALUES ('3012', '352', '阿克苏市', '3');
INSERT INTO `clt_region` VALUES ('3013', '352', '温宿县', '3');
INSERT INTO `clt_region` VALUES ('3014', '352', '库车县', '3');
INSERT INTO `clt_region` VALUES ('3015', '352', '沙雅县', '3');
INSERT INTO `clt_region` VALUES ('3016', '352', '新和县', '3');
INSERT INTO `clt_region` VALUES ('3017', '352', '拜城县', '3');
INSERT INTO `clt_region` VALUES ('3018', '352', '乌什县', '3');
INSERT INTO `clt_region` VALUES ('3019', '352', '阿瓦提县', '3');
INSERT INTO `clt_region` VALUES ('3020', '352', '柯坪县', '3');
INSERT INTO `clt_region` VALUES ('3021', '353', '阿拉尔市', '3');
INSERT INTO `clt_region` VALUES ('3022', '354', '库尔勒市', '3');
INSERT INTO `clt_region` VALUES ('3023', '354', '轮台县', '3');
INSERT INTO `clt_region` VALUES ('3024', '354', '尉犁县', '3');
INSERT INTO `clt_region` VALUES ('3025', '354', '若羌县', '3');
INSERT INTO `clt_region` VALUES ('3026', '354', '且末县', '3');
INSERT INTO `clt_region` VALUES ('3027', '354', '焉耆', '3');
INSERT INTO `clt_region` VALUES ('3028', '354', '和静县', '3');
INSERT INTO `clt_region` VALUES ('3029', '354', '和硕县', '3');
INSERT INTO `clt_region` VALUES ('3030', '354', '博湖县', '3');
INSERT INTO `clt_region` VALUES ('3031', '355', '博乐市', '3');
INSERT INTO `clt_region` VALUES ('3032', '355', '精河县', '3');
INSERT INTO `clt_region` VALUES ('3033', '355', '温泉县', '3');
INSERT INTO `clt_region` VALUES ('3034', '356', '呼图壁县', '3');
INSERT INTO `clt_region` VALUES ('3035', '356', '米泉市', '3');
INSERT INTO `clt_region` VALUES ('3036', '356', '昌吉市', '3');
INSERT INTO `clt_region` VALUES ('3037', '356', '阜康市', '3');
INSERT INTO `clt_region` VALUES ('3038', '356', '玛纳斯县', '3');
INSERT INTO `clt_region` VALUES ('3039', '356', '奇台县', '3');
INSERT INTO `clt_region` VALUES ('3040', '356', '吉木萨尔县', '3');
INSERT INTO `clt_region` VALUES ('3041', '356', '木垒', '3');
INSERT INTO `clt_region` VALUES ('3042', '357', '哈密市', '3');
INSERT INTO `clt_region` VALUES ('3043', '357', '伊吾县', '3');
INSERT INTO `clt_region` VALUES ('3044', '357', '巴里坤', '3');
INSERT INTO `clt_region` VALUES ('3045', '358', '和田市', '3');
INSERT INTO `clt_region` VALUES ('3046', '358', '和田县', '3');
INSERT INTO `clt_region` VALUES ('3047', '358', '墨玉县', '3');
INSERT INTO `clt_region` VALUES ('3048', '358', '皮山县', '3');
INSERT INTO `clt_region` VALUES ('3049', '358', '洛浦县', '3');
INSERT INTO `clt_region` VALUES ('3050', '358', '策勒县', '3');
INSERT INTO `clt_region` VALUES ('3051', '358', '于田县', '3');
INSERT INTO `clt_region` VALUES ('3052', '358', '民丰县', '3');
INSERT INTO `clt_region` VALUES ('3053', '359', '喀什市', '3');
INSERT INTO `clt_region` VALUES ('3054', '359', '疏附县', '3');
INSERT INTO `clt_region` VALUES ('3055', '359', '疏勒县', '3');
INSERT INTO `clt_region` VALUES ('3056', '359', '英吉沙县', '3');
INSERT INTO `clt_region` VALUES ('3057', '359', '泽普县', '3');
INSERT INTO `clt_region` VALUES ('3058', '359', '莎车县', '3');
INSERT INTO `clt_region` VALUES ('3059', '359', '叶城县', '3');
INSERT INTO `clt_region` VALUES ('3060', '359', '麦盖提县', '3');
INSERT INTO `clt_region` VALUES ('3061', '359', '岳普湖县', '3');
INSERT INTO `clt_region` VALUES ('3062', '359', '伽师县', '3');
INSERT INTO `clt_region` VALUES ('3063', '359', '巴楚县', '3');
INSERT INTO `clt_region` VALUES ('3064', '359', '塔什库尔干', '3');
INSERT INTO `clt_region` VALUES ('3065', '360', '克拉玛依市', '3');
INSERT INTO `clt_region` VALUES ('3066', '361', '阿图什市', '3');
INSERT INTO `clt_region` VALUES ('3067', '361', '阿克陶县', '3');
INSERT INTO `clt_region` VALUES ('3068', '361', '阿合奇县', '3');
INSERT INTO `clt_region` VALUES ('3069', '361', '乌恰县', '3');
INSERT INTO `clt_region` VALUES ('3070', '362', '石河子市', '3');
INSERT INTO `clt_region` VALUES ('3071', '363', '图木舒克市', '3');
INSERT INTO `clt_region` VALUES ('3072', '364', '吐鲁番市', '3');
INSERT INTO `clt_region` VALUES ('3073', '364', '鄯善县', '3');
INSERT INTO `clt_region` VALUES ('3074', '364', '托克逊县', '3');
INSERT INTO `clt_region` VALUES ('3075', '365', '五家渠市', '3');
INSERT INTO `clt_region` VALUES ('3076', '366', '阿勒泰市', '3');
INSERT INTO `clt_region` VALUES ('3077', '366', '布克赛尔', '3');
INSERT INTO `clt_region` VALUES ('3078', '366', '伊宁市', '3');
INSERT INTO `clt_region` VALUES ('3079', '366', '布尔津县', '3');
INSERT INTO `clt_region` VALUES ('3080', '366', '奎屯市', '3');
INSERT INTO `clt_region` VALUES ('3081', '366', '乌苏市', '3');
INSERT INTO `clt_region` VALUES ('3082', '366', '额敏县', '3');
INSERT INTO `clt_region` VALUES ('3083', '366', '富蕴县', '3');
INSERT INTO `clt_region` VALUES ('3084', '366', '伊宁县', '3');
INSERT INTO `clt_region` VALUES ('3085', '366', '福海县', '3');
INSERT INTO `clt_region` VALUES ('3086', '366', '霍城县', '3');
INSERT INTO `clt_region` VALUES ('3087', '366', '沙湾县', '3');
INSERT INTO `clt_region` VALUES ('3088', '366', '巩留县', '3');
INSERT INTO `clt_region` VALUES ('3089', '366', '哈巴河县', '3');
INSERT INTO `clt_region` VALUES ('3090', '366', '托里县', '3');
INSERT INTO `clt_region` VALUES ('3091', '366', '青河县', '3');
INSERT INTO `clt_region` VALUES ('3092', '366', '新源县', '3');
INSERT INTO `clt_region` VALUES ('3093', '366', '裕民县', '3');
INSERT INTO `clt_region` VALUES ('3094', '366', '和布克赛尔', '3');
INSERT INTO `clt_region` VALUES ('3095', '366', '吉木乃县', '3');
INSERT INTO `clt_region` VALUES ('3096', '366', '昭苏县', '3');
INSERT INTO `clt_region` VALUES ('3097', '366', '特克斯县', '3');
INSERT INTO `clt_region` VALUES ('3098', '366', '尼勒克县', '3');
INSERT INTO `clt_region` VALUES ('3099', '366', '察布查尔', '3');
INSERT INTO `clt_region` VALUES ('3100', '367', '盘龙区', '3');
INSERT INTO `clt_region` VALUES ('3101', '367', '五华区', '3');
INSERT INTO `clt_region` VALUES ('3102', '367', '官渡区', '3');
INSERT INTO `clt_region` VALUES ('3103', '367', '西山区', '3');
INSERT INTO `clt_region` VALUES ('3104', '367', '东川区', '3');
INSERT INTO `clt_region` VALUES ('3105', '367', '安宁市', '3');
INSERT INTO `clt_region` VALUES ('3106', '367', '呈贡县', '3');
INSERT INTO `clt_region` VALUES ('3107', '367', '晋宁县', '3');
INSERT INTO `clt_region` VALUES ('3108', '367', '富民县', '3');
INSERT INTO `clt_region` VALUES ('3109', '367', '宜良县', '3');
INSERT INTO `clt_region` VALUES ('3110', '367', '嵩明县', '3');
INSERT INTO `clt_region` VALUES ('3111', '367', '石林县', '3');
INSERT INTO `clt_region` VALUES ('3112', '367', '禄劝', '3');
INSERT INTO `clt_region` VALUES ('3113', '367', '寻甸', '3');
INSERT INTO `clt_region` VALUES ('3114', '368', '兰坪', '3');
INSERT INTO `clt_region` VALUES ('3115', '368', '泸水县', '3');
INSERT INTO `clt_region` VALUES ('3116', '368', '福贡县', '3');
INSERT INTO `clt_region` VALUES ('3117', '368', '贡山', '3');
INSERT INTO `clt_region` VALUES ('3118', '369', '宁洱', '3');
INSERT INTO `clt_region` VALUES ('3119', '369', '思茅区', '3');
INSERT INTO `clt_region` VALUES ('3120', '369', '墨江', '3');
INSERT INTO `clt_region` VALUES ('3121', '369', '景东', '3');
INSERT INTO `clt_region` VALUES ('3122', '369', '景谷', '3');
INSERT INTO `clt_region` VALUES ('3123', '369', '镇沅', '3');
INSERT INTO `clt_region` VALUES ('3124', '369', '江城', '3');
INSERT INTO `clt_region` VALUES ('3125', '369', '孟连', '3');
INSERT INTO `clt_region` VALUES ('3126', '369', '澜沧', '3');
INSERT INTO `clt_region` VALUES ('3127', '369', '西盟', '3');
INSERT INTO `clt_region` VALUES ('3128', '370', '古城区', '3');
INSERT INTO `clt_region` VALUES ('3129', '370', '宁蒗', '3');
INSERT INTO `clt_region` VALUES ('3130', '370', '玉龙', '3');
INSERT INTO `clt_region` VALUES ('3131', '370', '永胜县', '3');
INSERT INTO `clt_region` VALUES ('3132', '370', '华坪县', '3');
INSERT INTO `clt_region` VALUES ('3133', '371', '隆阳区', '3');
INSERT INTO `clt_region` VALUES ('3134', '371', '施甸县', '3');
INSERT INTO `clt_region` VALUES ('3135', '371', '腾冲县', '3');
INSERT INTO `clt_region` VALUES ('3136', '371', '龙陵县', '3');
INSERT INTO `clt_region` VALUES ('3137', '371', '昌宁县', '3');
INSERT INTO `clt_region` VALUES ('3138', '372', '楚雄市', '3');
INSERT INTO `clt_region` VALUES ('3139', '372', '双柏县', '3');
INSERT INTO `clt_region` VALUES ('3140', '372', '牟定县', '3');
INSERT INTO `clt_region` VALUES ('3141', '372', '南华县', '3');
INSERT INTO `clt_region` VALUES ('3142', '372', '姚安县', '3');
INSERT INTO `clt_region` VALUES ('3143', '372', '大姚县', '3');
INSERT INTO `clt_region` VALUES ('3144', '372', '永仁县', '3');
INSERT INTO `clt_region` VALUES ('3145', '372', '元谋县', '3');
INSERT INTO `clt_region` VALUES ('3146', '372', '武定县', '3');
INSERT INTO `clt_region` VALUES ('3147', '372', '禄丰县', '3');
INSERT INTO `clt_region` VALUES ('3148', '373', '大理市', '3');
INSERT INTO `clt_region` VALUES ('3149', '373', '祥云县', '3');
INSERT INTO `clt_region` VALUES ('3150', '373', '宾川县', '3');
INSERT INTO `clt_region` VALUES ('3151', '373', '弥渡县', '3');
INSERT INTO `clt_region` VALUES ('3152', '373', '永平县', '3');
INSERT INTO `clt_region` VALUES ('3153', '373', '云龙县', '3');
INSERT INTO `clt_region` VALUES ('3154', '373', '洱源县', '3');
INSERT INTO `clt_region` VALUES ('3155', '373', '剑川县', '3');
INSERT INTO `clt_region` VALUES ('3156', '373', '鹤庆县', '3');
INSERT INTO `clt_region` VALUES ('3157', '373', '漾濞', '3');
INSERT INTO `clt_region` VALUES ('3158', '373', '南涧', '3');
INSERT INTO `clt_region` VALUES ('3159', '373', '巍山', '3');
INSERT INTO `clt_region` VALUES ('3160', '374', '潞西市', '3');
INSERT INTO `clt_region` VALUES ('3161', '374', '瑞丽市', '3');
INSERT INTO `clt_region` VALUES ('3162', '374', '梁河县', '3');
INSERT INTO `clt_region` VALUES ('3163', '374', '盈江县', '3');
INSERT INTO `clt_region` VALUES ('3164', '374', '陇川县', '3');
INSERT INTO `clt_region` VALUES ('3165', '375', '香格里拉县', '3');
INSERT INTO `clt_region` VALUES ('3166', '375', '德钦县', '3');
INSERT INTO `clt_region` VALUES ('3167', '375', '维西', '3');
INSERT INTO `clt_region` VALUES ('3168', '376', '泸西县', '3');
INSERT INTO `clt_region` VALUES ('3169', '376', '蒙自县', '3');
INSERT INTO `clt_region` VALUES ('3170', '376', '个旧市', '3');
INSERT INTO `clt_region` VALUES ('3171', '376', '开远市', '3');
INSERT INTO `clt_region` VALUES ('3172', '376', '绿春县', '3');
INSERT INTO `clt_region` VALUES ('3173', '376', '建水县', '3');
INSERT INTO `clt_region` VALUES ('3174', '376', '石屏县', '3');
INSERT INTO `clt_region` VALUES ('3175', '376', '弥勒县', '3');
INSERT INTO `clt_region` VALUES ('3176', '376', '元阳县', '3');
INSERT INTO `clt_region` VALUES ('3177', '376', '红河县', '3');
INSERT INTO `clt_region` VALUES ('3178', '376', '金平', '3');
INSERT INTO `clt_region` VALUES ('3179', '376', '河口', '3');
INSERT INTO `clt_region` VALUES ('3180', '376', '屏边', '3');
INSERT INTO `clt_region` VALUES ('3181', '377', '临翔区', '3');
INSERT INTO `clt_region` VALUES ('3182', '377', '凤庆县', '3');
INSERT INTO `clt_region` VALUES ('3183', '377', '云县', '3');
INSERT INTO `clt_region` VALUES ('3184', '377', '永德县', '3');
INSERT INTO `clt_region` VALUES ('3185', '377', '镇康县', '3');
INSERT INTO `clt_region` VALUES ('3186', '377', '双江', '3');
INSERT INTO `clt_region` VALUES ('3187', '377', '耿马', '3');
INSERT INTO `clt_region` VALUES ('3188', '377', '沧源', '3');
INSERT INTO `clt_region` VALUES ('3189', '378', '麒麟区', '3');
INSERT INTO `clt_region` VALUES ('3190', '378', '宣威市', '3');
INSERT INTO `clt_region` VALUES ('3191', '378', '马龙县', '3');
INSERT INTO `clt_region` VALUES ('3192', '378', '陆良县', '3');
INSERT INTO `clt_region` VALUES ('3193', '378', '师宗县', '3');
INSERT INTO `clt_region` VALUES ('3194', '378', '罗平县', '3');
INSERT INTO `clt_region` VALUES ('3195', '378', '富源县', '3');
INSERT INTO `clt_region` VALUES ('3196', '378', '会泽县', '3');
INSERT INTO `clt_region` VALUES ('3197', '378', '沾益县', '3');
INSERT INTO `clt_region` VALUES ('3198', '379', '文山县', '3');
INSERT INTO `clt_region` VALUES ('3199', '379', '砚山县', '3');
INSERT INTO `clt_region` VALUES ('3200', '379', '西畴县', '3');
INSERT INTO `clt_region` VALUES ('3201', '379', '麻栗坡县', '3');
INSERT INTO `clt_region` VALUES ('3202', '379', '马关县', '3');
INSERT INTO `clt_region` VALUES ('3203', '379', '丘北县', '3');
INSERT INTO `clt_region` VALUES ('3204', '379', '广南县', '3');
INSERT INTO `clt_region` VALUES ('3205', '379', '富宁县', '3');
INSERT INTO `clt_region` VALUES ('3206', '380', '景洪市', '3');
INSERT INTO `clt_region` VALUES ('3207', '380', '勐海县', '3');
INSERT INTO `clt_region` VALUES ('3208', '380', '勐腊县', '3');
INSERT INTO `clt_region` VALUES ('3209', '381', '红塔区', '3');
INSERT INTO `clt_region` VALUES ('3210', '381', '江川县', '3');
INSERT INTO `clt_region` VALUES ('3211', '381', '澄江县', '3');
INSERT INTO `clt_region` VALUES ('3212', '381', '通海县', '3');
INSERT INTO `clt_region` VALUES ('3213', '381', '华宁县', '3');
INSERT INTO `clt_region` VALUES ('3214', '381', '易门县', '3');
INSERT INTO `clt_region` VALUES ('3215', '381', '峨山', '3');
INSERT INTO `clt_region` VALUES ('3216', '381', '新平', '3');
INSERT INTO `clt_region` VALUES ('3217', '381', '元江', '3');
INSERT INTO `clt_region` VALUES ('3218', '382', '昭阳区', '3');
INSERT INTO `clt_region` VALUES ('3219', '382', '鲁甸县', '3');
INSERT INTO `clt_region` VALUES ('3220', '382', '巧家县', '3');
INSERT INTO `clt_region` VALUES ('3221', '382', '盐津县', '3');
INSERT INTO `clt_region` VALUES ('3222', '382', '大关县', '3');
INSERT INTO `clt_region` VALUES ('3223', '382', '永善县', '3');
INSERT INTO `clt_region` VALUES ('3224', '382', '绥江县', '3');
INSERT INTO `clt_region` VALUES ('3225', '382', '镇雄县', '3');
INSERT INTO `clt_region` VALUES ('3226', '382', '彝良县', '3');
INSERT INTO `clt_region` VALUES ('3227', '382', '威信县', '3');
INSERT INTO `clt_region` VALUES ('3228', '382', '水富县', '3');
INSERT INTO `clt_region` VALUES ('3229', '383', '西湖区', '3');
INSERT INTO `clt_region` VALUES ('3230', '383', '上城区', '3');
INSERT INTO `clt_region` VALUES ('3231', '383', '下城区', '3');
INSERT INTO `clt_region` VALUES ('3232', '383', '拱墅区', '3');
INSERT INTO `clt_region` VALUES ('3233', '383', '滨江区', '3');
INSERT INTO `clt_region` VALUES ('3234', '383', '江干区', '3');
INSERT INTO `clt_region` VALUES ('3235', '383', '萧山区', '3');
INSERT INTO `clt_region` VALUES ('3236', '383', '余杭区', '3');
INSERT INTO `clt_region` VALUES ('3237', '383', '市郊', '3');
INSERT INTO `clt_region` VALUES ('3238', '383', '建德市', '3');
INSERT INTO `clt_region` VALUES ('3239', '383', '富阳市', '3');
INSERT INTO `clt_region` VALUES ('3240', '383', '临安市', '3');
INSERT INTO `clt_region` VALUES ('3241', '383', '桐庐县', '3');
INSERT INTO `clt_region` VALUES ('3242', '383', '淳安县', '3');
INSERT INTO `clt_region` VALUES ('3243', '384', '吴兴区', '3');
INSERT INTO `clt_region` VALUES ('3244', '384', '南浔区', '3');
INSERT INTO `clt_region` VALUES ('3245', '384', '德清县', '3');
INSERT INTO `clt_region` VALUES ('3246', '384', '长兴县', '3');
INSERT INTO `clt_region` VALUES ('3247', '384', '安吉县', '3');
INSERT INTO `clt_region` VALUES ('3248', '385', '南湖区', '3');
INSERT INTO `clt_region` VALUES ('3249', '385', '秀洲区', '3');
INSERT INTO `clt_region` VALUES ('3250', '385', '海宁市', '3');
INSERT INTO `clt_region` VALUES ('3251', '385', '嘉善县', '3');
INSERT INTO `clt_region` VALUES ('3252', '385', '平湖市', '3');
INSERT INTO `clt_region` VALUES ('3253', '385', '桐乡市', '3');
INSERT INTO `clt_region` VALUES ('3254', '385', '海盐县', '3');
INSERT INTO `clt_region` VALUES ('3255', '386', '婺城区', '3');
INSERT INTO `clt_region` VALUES ('3256', '386', '金东区', '3');
INSERT INTO `clt_region` VALUES ('3257', '386', '兰溪市', '3');
INSERT INTO `clt_region` VALUES ('3258', '386', '市区', '3');
INSERT INTO `clt_region` VALUES ('3259', '386', '佛堂镇', '3');
INSERT INTO `clt_region` VALUES ('3260', '386', '上溪镇', '3');
INSERT INTO `clt_region` VALUES ('3261', '386', '义亭镇', '3');
INSERT INTO `clt_region` VALUES ('3262', '386', '大陈镇', '3');
INSERT INTO `clt_region` VALUES ('3263', '386', '苏溪镇', '3');
INSERT INTO `clt_region` VALUES ('3264', '386', '赤岸镇', '3');
INSERT INTO `clt_region` VALUES ('3265', '386', '东阳市', '3');
INSERT INTO `clt_region` VALUES ('3266', '386', '永康市', '3');
INSERT INTO `clt_region` VALUES ('3267', '386', '武义县', '3');
INSERT INTO `clt_region` VALUES ('3268', '386', '浦江县', '3');
INSERT INTO `clt_region` VALUES ('3269', '386', '磐安县', '3');
INSERT INTO `clt_region` VALUES ('3270', '387', '莲都区', '3');
INSERT INTO `clt_region` VALUES ('3271', '387', '龙泉市', '3');
INSERT INTO `clt_region` VALUES ('3272', '387', '青田县', '3');
INSERT INTO `clt_region` VALUES ('3273', '387', '缙云县', '3');
INSERT INTO `clt_region` VALUES ('3274', '387', '遂昌县', '3');
INSERT INTO `clt_region` VALUES ('3275', '387', '松阳县', '3');
INSERT INTO `clt_region` VALUES ('3276', '387', '云和县', '3');
INSERT INTO `clt_region` VALUES ('3277', '387', '庆元县', '3');
INSERT INTO `clt_region` VALUES ('3278', '387', '景宁', '3');
INSERT INTO `clt_region` VALUES ('3279', '388', '海曙区', '3');
INSERT INTO `clt_region` VALUES ('3280', '388', '江东区', '3');
INSERT INTO `clt_region` VALUES ('3281', '388', '江北区', '3');
INSERT INTO `clt_region` VALUES ('3282', '388', '镇海区', '3');
INSERT INTO `clt_region` VALUES ('3283', '388', '北仑区', '3');
INSERT INTO `clt_region` VALUES ('3284', '388', '鄞州区', '3');
INSERT INTO `clt_region` VALUES ('3285', '388', '余姚市', '3');
INSERT INTO `clt_region` VALUES ('3286', '388', '慈溪市', '3');
INSERT INTO `clt_region` VALUES ('3287', '388', '奉化市', '3');
INSERT INTO `clt_region` VALUES ('3288', '388', '象山县', '3');
INSERT INTO `clt_region` VALUES ('3289', '388', '宁海县', '3');
INSERT INTO `clt_region` VALUES ('3290', '389', '越城区', '3');
INSERT INTO `clt_region` VALUES ('3291', '389', '上虞市', '3');
INSERT INTO `clt_region` VALUES ('3292', '389', '嵊州市', '3');
INSERT INTO `clt_region` VALUES ('3293', '389', '绍兴县', '3');
INSERT INTO `clt_region` VALUES ('3294', '389', '新昌县', '3');
INSERT INTO `clt_region` VALUES ('3295', '389', '诸暨市', '3');
INSERT INTO `clt_region` VALUES ('3296', '390', '椒江区', '3');
INSERT INTO `clt_region` VALUES ('3297', '390', '黄岩区', '3');
INSERT INTO `clt_region` VALUES ('3298', '390', '路桥区', '3');
INSERT INTO `clt_region` VALUES ('3299', '390', '温岭市', '3');
INSERT INTO `clt_region` VALUES ('3300', '390', '临海市', '3');
INSERT INTO `clt_region` VALUES ('3301', '390', '玉环县', '3');
INSERT INTO `clt_region` VALUES ('3302', '390', '三门县', '3');
INSERT INTO `clt_region` VALUES ('3303', '390', '天台县', '3');
INSERT INTO `clt_region` VALUES ('3304', '390', '仙居县', '3');
INSERT INTO `clt_region` VALUES ('3305', '391', '鹿城区', '3');
INSERT INTO `clt_region` VALUES ('3306', '391', '龙湾区', '3');
INSERT INTO `clt_region` VALUES ('3307', '391', '瓯海区', '3');
INSERT INTO `clt_region` VALUES ('3308', '391', '瑞安市', '3');
INSERT INTO `clt_region` VALUES ('3309', '391', '乐清市', '3');
INSERT INTO `clt_region` VALUES ('3310', '391', '洞头县', '3');
INSERT INTO `clt_region` VALUES ('3311', '391', '永嘉县', '3');
INSERT INTO `clt_region` VALUES ('3312', '391', '平阳县', '3');
INSERT INTO `clt_region` VALUES ('3313', '391', '苍南县', '3');
INSERT INTO `clt_region` VALUES ('3314', '391', '文成县', '3');
INSERT INTO `clt_region` VALUES ('3315', '391', '泰顺县', '3');
INSERT INTO `clt_region` VALUES ('3316', '392', '定海区', '3');
INSERT INTO `clt_region` VALUES ('3317', '392', '普陀区', '3');
INSERT INTO `clt_region` VALUES ('3318', '392', '岱山县', '3');
INSERT INTO `clt_region` VALUES ('3319', '392', '嵊泗县', '3');
INSERT INTO `clt_region` VALUES ('3320', '393', '衢州市', '3');
INSERT INTO `clt_region` VALUES ('3321', '393', '江山市', '3');
INSERT INTO `clt_region` VALUES ('3322', '393', '常山县', '3');
INSERT INTO `clt_region` VALUES ('3323', '393', '开化县', '3');
INSERT INTO `clt_region` VALUES ('3324', '393', '龙游县', '3');
INSERT INTO `clt_region` VALUES ('3325', '394', '合川区', '3');
INSERT INTO `clt_region` VALUES ('3326', '394', '江津区', '3');
INSERT INTO `clt_region` VALUES ('3327', '394', '南川区', '3');
INSERT INTO `clt_region` VALUES ('3328', '394', '永川区', '3');
INSERT INTO `clt_region` VALUES ('3329', '394', '南岸区', '3');
INSERT INTO `clt_region` VALUES ('3330', '394', '渝北区', '3');
INSERT INTO `clt_region` VALUES ('3331', '394', '万盛区', '3');
INSERT INTO `clt_region` VALUES ('3332', '394', '大渡口区', '3');
INSERT INTO `clt_region` VALUES ('3333', '394', '万州区', '3');
INSERT INTO `clt_region` VALUES ('3334', '394', '北碚区', '3');
INSERT INTO `clt_region` VALUES ('3335', '394', '沙坪坝区', '3');
INSERT INTO `clt_region` VALUES ('3336', '394', '巴南区', '3');
INSERT INTO `clt_region` VALUES ('3337', '394', '涪陵区', '3');
INSERT INTO `clt_region` VALUES ('3338', '394', '江北区', '3');
INSERT INTO `clt_region` VALUES ('3339', '394', '九龙坡区', '3');
INSERT INTO `clt_region` VALUES ('3340', '394', '渝中区', '3');
INSERT INTO `clt_region` VALUES ('3341', '394', '黔江开发区', '3');
INSERT INTO `clt_region` VALUES ('3342', '394', '长寿区', '3');
INSERT INTO `clt_region` VALUES ('3343', '394', '双桥区', '3');
INSERT INTO `clt_region` VALUES ('3344', '394', '綦江县', '3');
INSERT INTO `clt_region` VALUES ('3345', '394', '潼南县', '3');
INSERT INTO `clt_region` VALUES ('3346', '394', '铜梁县', '3');
INSERT INTO `clt_region` VALUES ('3347', '394', '大足县', '3');
INSERT INTO `clt_region` VALUES ('3348', '394', '荣昌县', '3');
INSERT INTO `clt_region` VALUES ('3349', '394', '璧山县', '3');
INSERT INTO `clt_region` VALUES ('3350', '394', '垫江县', '3');
INSERT INTO `clt_region` VALUES ('3351', '394', '武隆县', '3');
INSERT INTO `clt_region` VALUES ('3352', '394', '丰都县', '3');
INSERT INTO `clt_region` VALUES ('3353', '394', '城口县', '3');
INSERT INTO `clt_region` VALUES ('3354', '394', '梁平县', '3');
INSERT INTO `clt_region` VALUES ('3355', '394', '开县', '3');
INSERT INTO `clt_region` VALUES ('3356', '394', '巫溪县', '3');
INSERT INTO `clt_region` VALUES ('3357', '394', '巫山县', '3');
INSERT INTO `clt_region` VALUES ('3358', '394', '奉节县', '3');
INSERT INTO `clt_region` VALUES ('3359', '394', '云阳县', '3');
INSERT INTO `clt_region` VALUES ('3360', '394', '忠县', '3');
INSERT INTO `clt_region` VALUES ('3361', '394', '石柱', '3');
INSERT INTO `clt_region` VALUES ('3362', '394', '彭水', '3');
INSERT INTO `clt_region` VALUES ('3363', '394', '酉阳', '3');
INSERT INTO `clt_region` VALUES ('3364', '394', '秀山', '3');
INSERT INTO `clt_region` VALUES ('3365', '395', '沙田区', '3');
INSERT INTO `clt_region` VALUES ('3366', '395', '东区', '3');
INSERT INTO `clt_region` VALUES ('3367', '395', '观塘区', '3');
INSERT INTO `clt_region` VALUES ('3368', '395', '黄大仙区', '3');
INSERT INTO `clt_region` VALUES ('3369', '395', '九龙城区', '3');
INSERT INTO `clt_region` VALUES ('3370', '395', '屯门区', '3');
INSERT INTO `clt_region` VALUES ('3371', '395', '葵青区', '3');
INSERT INTO `clt_region` VALUES ('3372', '395', '元朗区', '3');
INSERT INTO `clt_region` VALUES ('3373', '395', '深水埗区', '3');
INSERT INTO `clt_region` VALUES ('3374', '395', '西贡区', '3');
INSERT INTO `clt_region` VALUES ('3375', '395', '大埔区', '3');
INSERT INTO `clt_region` VALUES ('3376', '395', '湾仔区', '3');
INSERT INTO `clt_region` VALUES ('3377', '395', '油尖旺区', '3');
INSERT INTO `clt_region` VALUES ('3378', '395', '北区', '3');
INSERT INTO `clt_region` VALUES ('3379', '395', '南区', '3');
INSERT INTO `clt_region` VALUES ('3380', '395', '荃湾区', '3');
INSERT INTO `clt_region` VALUES ('3381', '395', '中西区', '3');
INSERT INTO `clt_region` VALUES ('3382', '395', '离岛区', '3');
INSERT INTO `clt_region` VALUES ('3383', '396', '澳门', '3');
INSERT INTO `clt_region` VALUES ('3384', '397', '台北', '3');
INSERT INTO `clt_region` VALUES ('3385', '397', '高雄', '3');
INSERT INTO `clt_region` VALUES ('3386', '397', '基隆', '3');
INSERT INTO `clt_region` VALUES ('3387', '397', '台中', '3');
INSERT INTO `clt_region` VALUES ('3388', '397', '台南', '3');
INSERT INTO `clt_region` VALUES ('3389', '397', '新竹', '3');
INSERT INTO `clt_region` VALUES ('3390', '397', '嘉义', '3');
INSERT INTO `clt_region` VALUES ('3391', '397', '宜兰县', '3');
INSERT INTO `clt_region` VALUES ('3392', '397', '桃园县', '3');
INSERT INTO `clt_region` VALUES ('3393', '397', '苗栗县', '3');
INSERT INTO `clt_region` VALUES ('3394', '397', '彰化县', '3');
INSERT INTO `clt_region` VALUES ('3395', '397', '南投县', '3');
INSERT INTO `clt_region` VALUES ('3396', '397', '云林县', '3');
INSERT INTO `clt_region` VALUES ('3397', '397', '屏东县', '3');
INSERT INTO `clt_region` VALUES ('3398', '397', '台东县', '3');
INSERT INTO `clt_region` VALUES ('3399', '397', '花莲县', '3');
INSERT INTO `clt_region` VALUES ('3400', '397', '澎湖县', '3');
INSERT INTO `clt_region` VALUES ('3401', '3', '合肥', '2');
INSERT INTO `clt_region` VALUES ('3402', '3401', '庐阳区', '3');
INSERT INTO `clt_region` VALUES ('3403', '3401', '瑶海区', '3');
INSERT INTO `clt_region` VALUES ('3404', '3401', '蜀山区', '3');
INSERT INTO `clt_region` VALUES ('3405', '3401', '包河区', '3');
INSERT INTO `clt_region` VALUES ('3406', '3401', '长丰县', '3');
INSERT INTO `clt_region` VALUES ('3407', '3401', '肥东县', '3');
INSERT INTO `clt_region` VALUES ('3408', '3401', '肥西县', '3');
INSERT INTO `clt_region` VALUES ('3409', '0', '国外', '0');

-- ----------------------------
-- Table structure for `clt_rental_myuser`
-- ----------------------------
DROP TABLE IF EXISTS `clt_rental_myuser`;
CREATE TABLE `clt_rental_myuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(13) DEFAULT NULL COMMENT '手机',
  `sex` tinyint(3) DEFAULT NULL COMMENT '性别',
  `password` char(32) NOT NULL COMMENT '密码',
  `turename` char(20) DEFAULT NULL COMMENT '姓名',
  `district_id` varchar(255) NOT NULL COMMENT '区id',
  `openid` varchar(64) NOT NULL COMMENT '微信唯一编号',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '微信中头像',
  `city_id` varchar(255) NOT NULL COMMENT '市id',
  `province_id` varchar(64) NOT NULL COMMENT '省id',
  `shopimg` varchar(255) DEFAULT NULL COMMENT '营业执照照片',
  `shopname` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `reg_time` int(11) DEFAULT NULL COMMENT '申请时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0 未审核，1审核中，3审核通过，-1，未通过',
  `is_look` tinyint(1) DEFAULT '1' COMMENT '0 申请中 1审核通过 2已锁',
  `pic` varchar(255) DEFAULT NULL COMMENT '头像',
  `shopbrand` int(15) NOT NULL COMMENT '品牌',
  `is_ts` tinyint(1) DEFAULT '1',
  `jspush` varchar(255) DEFAULT NULL,
  `logintime` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `mpic` varchar(255) DEFAULT NULL COMMENT '手持名片',
  `nick_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=909 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of clt_rental_myuser
-- ----------------------------
INSERT INTO `clt_rental_myuser` VALUES ('133', '13732056106', '1', '35c61e10a5f5b361175cabf175444f00', '张志超', '龙湾区', 'ohrbKwDGuklrJejeS3rMnbGxCQOk', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJvegxJTEkBZHzOmpo1Zy34nUn9onpMmXROwre1vlBaDqmBHAJedjsVUEAUyIBH0BYrUjavB2rxLQ/132', '温州市', '浙江省', './Uploads/Picture/2018-02-07/UcT37ou9n1ZU4G7iTfLXMotolTq8ZQy98PEteqOQGgRc1Kr_u0f2JLQ5dIfijoox.jpg', '温州世之贸', '1517882480', '2', '1', './Uploads/Picture/2018-09-18/io-9V3_mUH8cpBwTlfkpS1s3_t5TkqhhscigCdp523mDU3xKPH7YFW_Gm2207-RI.jpg', '22', '1', null, null, '机场大道5005号', './Uploads/Picture/2018-02-07/2rbw4HnbAUjZkw2SsiOPw0653WUs9KOJgZAoKui6Qlx57CDBwDT7P3Qa8jjvZnFZ.jpg', '测试');
INSERT INTO `clt_rental_myuser` VALUES ('150', '13695885899', '2', '8f71c88fb8dd0986b98c17933ee2d8fc', '桃子', '', 'ohrbKwKVGhmWLZIa1ZQpPPbPB5YU', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLNMoXfvZA04bCpmwqzcGlBDV6OuD7uWYtvSVpU9edjgkIxPGpU2oeUE2z2MYATxca6o5AbzE7ykA/132', '温州市', '浙江省', './Uploads/Picture/2018-09-27/SMHjO9bMNunvmnmKT2HQ9qUFPctKdE8-LUGyM49QXJb-fdf7uEy3_EpEm72aG003.jpg', '123456', '1527053916', '1', '1', null, '22', '1', null, null, '机场大道', './Uploads/Picture/2018-09-27/_lSFvBh4Uyw0VLSNuEB0JgR3DvCXc3zcc0Yaifb5wv6YHod0rpxUyZBBCS6piDBx.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('151', '18668029965', '1', 'fe98b0dae36c54b2940068d5c6ea5377', '尹晓晨', '萧山区', 'ohrbKwF-iYZLzEOwlxGctGkAUu5A', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTItReu22r57FT5m5nUTiawicT0GFSKAfrbhtiaibnCHjbDOtyfvEc6nHRicnIedGj67Jd7bM8PvN1mkjpA/132', '杭州市', '浙江省', './Uploads/Picture/2018-07-03/30_rI1A3yFr5D1_6bMVkmK1RYhaaJz6jPfw_S7sXH01o_QZGGpZiCWiQbSLs0jzC.jpg', '东风裕隆汽车销售有限公司', '1527054177', '2', '1', null, '22', '1', null, null, '新世纪大道2688号', './Uploads/Picture/2018-07-03/YOjANSjvfgl8yOlkMsrzljxMMKOR4q1eOSoFkXupu5MRS2pZfimk2ymiSsDgKMOu.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('196', '13706679166', '1', 'b22e9f5b2b5089f111367ab7ac24ec63', '黄晓浩', '', 'ohrbKwIaONRio0WEAJ2yLdARZBvc', 'http://thirdwx.qlogo.cn/mmopen/vi_32/1dicCrgUzOCaU2rZ4ZYv5iagAz0YmxJbLEy3IozG8YlqMmHglusa40icEgD8LMibib7AlhMvHHicm55LsaNjvnwohLYw/132', '香港', '香港特别', './Uploads/Picture/2018-09-27/GZpD1j848WQhmkGuKlg9ZhxKdlKGRS45nRKUB7H2EUxR0IGc8_FdutIxFpSi1D6R.jpg', '广告', '1538038963', '2', '1', null, '46', '1', null, null, '广告', './Uploads/Picture/2018-09-27/5ZlBFFBJXZmCGj7fdfbR5nt0uqNPNAy627xi7wFrgenWYENJf2jVl-RSMniOt7Ag.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('149', '18968864472', '1', '887fe36a90e7d518fb50747e28720274', '李世鹏', '精河县', 'ohrbKwNwMkPgdVVa9K7NxEH5HieI', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIedfqI3BtnGwAiaFpB3iaUd3xxGW0CQertxeh83buvXtupU7KTQttNLISGTmuzeBS6AeYLsnAWrvoA/132', '博尔塔拉蒙古', '维吾尔', './Uploads/Picture/2018-09-06/L5g_3J0nPy8os4FCWpWCQ7I-Zd1Z2fMW0l90snCnPYPdSrJEX6chvsQGEF7WZu0r.jpg', '国技互联', '1526972528', '2', '1', null, '44', '1', null, null, '高一路', './Uploads/Picture/2018-09-06/z8hB3R4cOyytZvL1v9v0yWn2amaC3Xi9U8RIb9_z-UkyTEb5QXK821ZeODrOesyy.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('147', '18867754655', '1', '9fcd19c07222ab9d10bed3fc073754c4', '黄天祥', '瑞安市', 'ohrbKwNC-4tVOXvPmvJfOMQFnKB4', 'http://thirdwx.qlogo.cn/mmopen/vi_32/ric9hiaF0SREXEgpZWvibseRMt3pEI03nnnEWf6ocMGxLzyzCX4uNyOReFNdRrLohjIqnnKRfG92giaV8EQHlMLNAQ/132', '温州市', '浙江省', './Uploads/Picture/2018-05-18/ePUarXaFrxmz_8M6vD0UxFI2_r60SKEWf5HXN2mtvRRfYJ71L112Ltttna6dg5z8.jpg', '瑞安市宝润汽车有限公司', '1526607404', '2', '1', null, '22', '1', null, null, '塘下镇104国道中心西路路口', './Uploads/Picture/2018-05-18/8ijEIdEsn26w7sLZTpTMB-po9glkOWlSdwGqvVV3QYvwhlhHbWo6egOvIv0h_tv3.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('134', '15757186460', null, 'cde7b5517af6d3421bf0f5434039f819', null, '', '', null, '', '', null, null, null, '2', '1', './Uploads/Picture/2018-02-07/l3SYtDtaqm7tTOPB6z0H5B9vPKEEcHL82rYN5Mhkr-vt4dBsO-eUuyXFlhBMSHHq.jpg', '0', '1', null, '1517965474', null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('135', '13396968288', '0', '1d073788467cca690a2073bae4e8e2fb', null, '', 'ohrbKwBiiuTYJItGIxbwSsOplTLU', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erY0lKHyTdibNHGjke2poPyUpiaxpWF9dVkQaKiaD1V27KSF1X3fiaOZLxr1LCSBSwGMtV57s5jOhksIw/132', '', '', null, null, '1517965187', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('136', '13738700600', '1', 'b08b9850e229cbe841b6eb73904e7fd9', '林大帅', '市区', 'ohrbKwHYlQIaRaziT9_6lYB7Inck', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ergSDdPsNAzwdLpwEGfeOcAMu3azn8UBOwtz1Os1bOv17MbyzrzL0sxauOrektRX8b5icp379uv49Q/132', '澳门', '澳门', './Uploads/Picture/2018-02-07/ZGGRhDaoL0TR_u8DHNWA4cJHqMIWzes2OVFzJNnJn2nkDsQdZlCM272n0epGCTGe.jpg', '大保健', '1517965206', '2', '1', null, '46', '1', null, null, '皇家赌场', './Uploads/Picture/2018-02-07/msBXCnWr1sIKLeUuedyYMv6NLyfi2EtbCSNWCPKBUShYCDk30CgHXj5jzPFQ7kTl.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('137', '13566254179', '2', '2a03e25d59282b48dbca8c8e80f36ad2', '包包', '浦东新区', 'ohrbKwCGr_lld6RncsW0hT3JfnME', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKEcicZP30abwzNJoDPfda2TH9kyAFvRr6fU87jYq5JF7bcf747mT267SMoV9EaoSicAo8iaJlpRTXLQ/132', '上海市', '上海', './Uploads/Picture/2018-02-07/5ApQNUJVcEULwS32l-ZaqSW_fl_mYN9LmWLKnf1nOhk4eYXuRq0WBCTO0e0y2G7r.jpg', '钱多多', '1517965223', '1', '1', null, '35', '1', null, null, '钱多多', './Uploads/Picture/2018-02-07/zhnMqo2Un-tBtMN81D4l9-E4f6jImI0TgC2bBksq4rfCSlhxUJChigz23TUswPWv.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('152', null, '1', '', null, '', 'ohrbKwKdQ5HHvhbg4qJfoTVTlBKg', 'http://thirdwx.qlogo.cn/mmopen/vi_32/4Psecz7icqpfHg3oz3zhsuiaLxdFnm7IDkLyPicmWW59EFCdkbRJ6YAJ3EbPZ5ju7kwZMM3Cl10C4xRmmxE4XH22A/132', '', '', null, null, '1529542432', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('144', '13025028962', '1', '647e2bd3643ca3cebb13ade545c1dcc7', null, '', 'ohrbKwKxij88kJg4RrjNRTR90bPs', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9XJPGHiceZuXBGc9fBCZ81CicFAq76VjLsJT0CPLCQ0aGDm7GGdkVdCYgGcWuXuZNnBNOia5z91TSw/132', '', '', null, null, '1520232346', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('203', null, '1', '', null, '', 'ohrbKwLZj0wJbVjNihTKS5Fa15ho', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJNxMqDoNODfNs55kI3IntZMQFpobIhK1btWTpiaDMSHVfIjnQ0OEImnDhiaMk0vfFk963Qia4xr7qIg/132', '', '', null, null, '1538157512', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('204', '18758657799', '1', '53e71af9e00201c04aa83a87db416569', null, '', 'ohrbKwFNZLgCc2v2P_pf3gG-yBPo', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Cd54e5sfcukhsNk38rf7tKjECia9Gb9OYPl1gzeecRh7JEXSQb4he5uKAxEQkPC28uZvYNe9aKUfYyuwHpj1HtA/132', '', '', null, null, '1538921599', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('195', '18257736964', '0', 'a2ba9899b066741d7c83b88a34406520', '叶', '', 'ohrbKwMUyvjRsC-oZObB4StahHXI', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJkEoeeOUOyuVRf2AJtibT9DPMaiayvdfAVZ5gTBCEPMcnlUZ9rFzKyAJ6RicQvfvP3P5JXDVNHyw97A/132', '温州市', '浙江省', './Uploads/Picture/2018-09-27/f0j7Q8fgmbKBVUwUceTqA5cuU8RQrQESAa7x4b7SGGWR7_F1p8B5fNc-0-a7931O.jpg', '腾达', '1538038800', '2', '1', null, '18', '1', null, null, '机场大道', './Uploads/Picture/2018-09-27/f0j7Q8fgmbKBVUwUceTqAyxXgj1zdA9PoXt-btjMMOcxItrATBWLtBraXn0lIzK6.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('153', null, '1', '', null, '', 'ohrbKwAH_3mALJKIf1h5nEbO7M54', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep6iavjrZU2cICXG71R5XeTHByRfJibSZ2FCHibwA2DgGKicWyU4QfPxrC6LaHKsKSwibPFsc9G95sfTCw/132', '', '', null, null, '1531876383', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('146', '13757896766', '1', '18289dc8b9cbe1f500d2f139e6a28cdd', '李德利', '乐清市', 'ohrbKwPZupmhVuSv83NKqEm-h3FA', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKBS8Xf2qLLpFh01zFibHibqJlwjvgWuHehSRvibfnuL0lanMgtCUVubrpf6LibmQy6WQe4oYdlgh8AAQ/132', '温州市', '浙江省', './Uploads/Picture/2018-04-09/j8ZzQcD2s9PYR19SciqMtYnUG-PYpe5Gv0FlzkBctUkNvCIjrFcYInHc0hXeiNU4.jpg', '温州世铭汽车销售服务有限公司', '1523260327', '2', '1', null, '22', '1', null, null, '宁康西路366号', './Uploads/Picture/2018-04-09/FfWca5Cu1lfavm2HArDWUHfE9Y2L3RbgmAju21uY4n5R0kJ7dvT2fvqup091ri7y.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('154', null, '1', '', null, '', 'ohrbKwF-oO4BTcP6hyVHZfTwyuKY', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Osd7wAvib0fr3ulLT4qdYxgmWnC2LLDdXDRviaJ2dTMC9ficib8zCtrdyicaia7PLThQSD9JcibxicFXlicNY5t6KibobS2w/132', '', '', null, null, '1531907308', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('155', '15811961330', '1', '6e2d1763d5b55fc567ce24f3960a9000', null, '', 'ohrbKwCwZA5sgjstOSH5hftfDUu8', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI4ibglNtjoIy6sPOrSPPtJ2WweS2lKnzuBbKVAScqAOKjqaoMtDMibnecA7y06vCVM2snPfG2J2ibHw/132', '', '', null, null, '1533102271', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('156', null, '2', '', null, '', 'ohrbKwMVv6qQ3Zx_Py2X-9t3Tt3c', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJh3MteM52Vq9fuHfXEkSf4IZhNIcWSrmBticQzT9T3dgZaVvCQjcMNM9nMjHTbyWlV5JgXX5oAczA/132', '', '', null, null, '1533178002', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('157', null, '1', '', null, '', 'ohrbKwBo5C8Cva7yva3VO-9AM8n4', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJPW6VrlXsaWoNAslMeHOpvFEw6MbaY2tN8FaKl45joTfHjw9ozD3H1jNewdmib3tOticc5bPSjoOOQ/132', '', '', null, null, '1534401339', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('158', null, '1', '', null, '', 'ohrbKwFRfW7kkEBedIFQya0ByLYo', 'http://thirdwx.qlogo.cn/mmopen/vi_32/d0P3ibibDgrSa6YRQdwviabpmfqNsVyLhGNOI3O7g7fuYnnFQZV2sOuxb1mhPu7fr79ZHen577Rzo4ABicTKT1GOyw/132', '', '', null, null, '1534403065', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('159', null, '1', '', null, '', 'ohrbKwCxd2uYw7lD_iynV1RGlPgo', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erYVaXXLpbwk5sBAXQU1jYEYCQzwPgBuQYgzlTiahZ8ia08GOFAn3fYNq6Cia7aiapk7LLRkncsXnPpmA/132', '', '', null, null, '1534440671', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('160', null, '2', '', null, '', 'ohrbKwHzFI-fo63eH6APVR2-vvek', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLNDzujsDfahSMbicn4xr4shJmMiatWuibaUk1N4jiayqNhrEPlYPt3xp8ONy4FVY0uY0YTckpK27AVsA/132', '', '', null, null, '1534494673', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('161', null, '1', '', null, '', 'ohrbKwFUjumTnk0URsaMEvIlwYhc', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eokejsUmneNHnzZmhmDYsJ00oG9aLh426gic7qsxaADwDzh9A6iabsTl4cOUfQm5uYlSWpTI5oo83Mw/132', '', '', null, null, '1535470483', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('162', null, '2', '', null, '', 'ohrbKwKWw9EJ15-uIzOzd5h3U3ZU', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKxSXZKH2egicDHkpboQiaRlGQgDt8mB7Y7yMoQA4joLxpyVUAicBnIgju0hyY8ggQzAwxFwBoclb6LA/132', '', '', null, null, '1535936768', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('163', '18892681944', '1', '5ce0ccc78b53fa3ff740650aaa478cf9', '哈哈哈', '鹿城区', 'ohrbKwCoAP-YPnFfAxOXHjt9YVeA', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqWicbfC66qKR3mPUl8s1FibB9PhCTc6aJI0RO1leBo7lWQZw9qC9JA2S0084uT1v8BJD6yCuOLIqGw/132', '温州市', '浙江省', './Uploads/Picture/2018-09-06/d4pg4FbxmxGW2UG-CEa1KkhaJUjItPFiXnoKjzORbLP7HniBUHHb5omu4G8PHNqk.jpg', '哈哈哈', '1536199660', '1', '1', null, '44', '1', null, '1539075177', '哈哈哈', './Uploads/Picture/2018-09-06/d4pg4FbxmxGW2UG-CEa1KiCNVVi8Od1Mzx0vMzILhUfSi7jYxaEyBePyy9zavw1H.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('164', '15088905326', '1', '3f3bd7b3d5bf9ffef7ae13562b191abd', null, '', 'ohrbKwFS5BCcytzdrVzT2HLKwKcA', 'http://thirdwx.qlogo.cn/mmopen/vi_32/4hkjdeSic1Bzo2HmaBaxZhib5iaMnPcxs6zMntic39NTnJUvGTtM2M7FziaTrTLD9FUTiawPn5mUFUvicXMvq23KfcHbQ/132', '', '', null, null, '1536218358', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('165', '13757893193', '1', '66b3c1c5c811b775e8ad4a6be63bf409', '陈文繁', '市区', 'ohrbKwDnpPmxFS0sq7XQbYw9k_LM', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIfvt3eSY0LQUtzn4uhAEMKpbhG1Cxno7pw2ibGr0Ot1eL3ib5GWB86nSDFp4nt42MRwGdUBVwJjQpQ/132', '澳门', '澳门', './Uploads/Picture/2018-09-25/TnCmw-xb1HHrk4adqB-RNSU-Pe6xLJbthAkLzyRCfNPZA8i22prG5uMXD7vKBW0Z.jpg', '国技互联', '1537854085', '2', '1', null, '44', '1', null, null, '果园206', './Uploads/Picture/2018-09-25/zjudxpbSnyZ-hDq3UQM2UkBfIfMz2G8eFC3l5-2jZz1pDP4DR61EztV61JZmHy2Y.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('167', '15158762561', '1', 'a92dc38db0f648806873cab342474cb1', '乐乐', '鹿城区', 'ohrbKwP6du3bZVHeqBuN48cN-rRo', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epvVz17tsIhrka0R2OQicDtK3UXbWjErOjEibYfcQia0Tyr8vWmv31sktz475iadibJQSlBVYhgBx1kgEg/132', '温州市', '浙江省', './Uploads/Picture/2018-09-25/O6UbKtCLwUTDN_x2SWL_kjxbcdqjgiX7OaP287qqYo0n7wodDA3i6LouGYrvYw0v.jpg', '乐乐乐', '1537860884', '2', '1', null, '44', '1', null, '1537866691', '乐乐乐', './Uploads/Picture/2018-09-25/S5g-BA-DswVGx3yNHjUx5AWQd2xyC4c0sHx5eQLL5fJV5gbz8VuKTFV4El5koy7v.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('168', '15958712113', '2', '3082f51d24e24ee5de77a39c012c16ba', null, '', 'ohrbKwN0IEI8kUwKIpAt6y8X-X48', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eogNj15YPt3hfMiaNC9flnv6tbQobtWEibgUicrfibM6ibEkiaNrCT9BMC813lOwlrgcoof2rKFouiaEbUIQ/132', '', '', null, null, '1537867632', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('169', null, '1', '', null, '', 'ohrbKwIj1eCXuzYM-ka__9KsTYtI', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJSt6SSXWGEXeycItJsE0lQRhG2D6aurFRWOHT6Ufk8pbyOVcfX0WLduBjnvaakmZQGpkRZia1EFXw/132', '', '', null, null, '1537872295', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('170', null, '1', '', null, '', 'ohrbKwG8FeB9KW4iQnGqJRCsPzbw', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIicQkhjPTzo0qStmUos3KJxNyPiamaX6h3D4Gksj9y2Yefq14paXCyTJ4pZU7ZrTLMjvZGCia1Mzujg/132', '', '', null, null, '1538027762', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('171', '18676204245', '1', 'bfb7596f58191d413dde0c785cb3f52b', null, '', 'ohrbKwD8VFbcryPV4u_09qwQYtng', 'http://thirdwx.qlogo.cn/mmopen/vi_32/BBca90dxj0SryxtXL8kibXqvpYgTfbAc1RqRukYSEaibZqLEaFXApwYFKMm2V16UDwEYEfFGCicmXG0peFZ3sYDdw/132', '', '', null, null, '1538028058', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('172', null, '1', '', null, '', 'ohrbKwNP5dN1d2IC3ENIV7cSFKn8', 'http://thirdwx.qlogo.cn/mmopen/vi_32/PNmB3mOQ4jRdPLCBk2nJ62BSYqq2Nm6jFlHT4Xnk69cV642ZybF3gXn9K9kia2gzgnXrqv8FYnVtcpDWr6fz4Bw/132', '', '', null, null, '1538028088', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('173', '13367927448', '1', 'c677a33f1e07465cece5c6524e715ca5', null, '', 'ohrbKwEhM1Q7JNFEJEYNVhDPRHD0', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJYSsDiaxAtiaB08DWuEuEGUQzo7jFpFcYKs6yeuHWORvqZ3NCicvrmpJsTibI3XF7FssotTQPs4F2AnA/132', '', '', null, null, '1538028097', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('174', '15390704077', '1', 'e378fc261cdc90d868860418101244c1', null, '', 'ohrbKwO-RG6-YaKMo9HVCnfYLg-c', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqmibYgzhSR2SwzIAZDC5RrBTtl09dsRP9rEiaLicxTzJL2aySnMdosJF4Z7yQrwrwqgRK3BT2HEDvng/132', '', '', null, null, '1538028122', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('175', null, '1', '', null, '', 'ohrbKwByHs8RIndskWvKA3UhoZMI', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmpwXx0cZVJlr02H0894p2LicmtKrhPelT5A1dvtuvkLwpRRaKawaf8HezlDOe2ohFsDU37LDxRvA/132', '', '', null, null, '1538028168', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('176', null, '2', '', null, '', 'ohrbKwJWi0kY-6oiMKRsQqQOfMvE', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLJ44vkdIclFB8Ut5OleUJom3Xa8TLMIOhV5YUibZ1sKgNXzicOP8wkGzqa7YM2hccTAhgLY2JScX5A/132', '', '', null, null, '1538028253', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('177', null, '1', '', null, '', 'ohrbKwPpYgGsqXtQFYKUwOSj8fes', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK4QEMnT5dggfibuCFRLKH1fpnFNibylpCv55l2ica4RRyIFlMXMo48t8gchh2oqGvckhonvyXD1uWUg/132', '', '', null, null, '1538028386', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('178', null, '1', '', null, '', 'ohrbKwNq9hAFg7H-sJtMLzwsEnFo', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eor1L9ibzfkbcxby9V0ApHYR7WBiaaIch4abTicWLk7Zjdse9fBFb9kfnUSsmvASE8DeX4E16q79qs4Q/132', '', '', null, null, '1538028416', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('179', '13918405105', '1', '4aff6df7308527ef9f9c6129b59e8caa', null, '', 'ohrbKwMEzhGA3vhjZYHEspVQfPng', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK65G9jqbSDusibqBRibvevOic8dxmGRlChwjlbD3ozkSr6dHDiaquvzHXibibuxfzSB6gPXWeicQSXrFl2Q/132', '', '', null, null, '1538028433', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('180', '18321542037', '1', '07ad9b76b0415f03ceec474def7f9fd1', '胡金宝', '', 'ohrbKwPcEn2skYNgGGTT6wyRXlKU', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKt2nqV7FtMRw9K4oBzohNDErYCicpOib66nVZLVVBjgCPn8G6hqmBBVJBtGxTjeK405ALicCaAaq8HA/132', '长沙市', '湖南省', './Uploads/Picture/2018-09-27/CE-6OQwOYpSxoBGrHZxrufxoB51VcWPL0Y31OhtiNRqaE0y8MjW6Qeuhn0ucxC2V.jpg', '湖南货万万新能源科技有限公司', '1538028480', '2', '1', null, '49', '1', null, null, '螺丝塘路', './Uploads/Picture/2018-09-27/C1A-2UuG2O-0yfnx40aagYtB2kze9FNwmKMA5kpVnSegM67szwtnuFDN6inbH2Rv.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('181', null, '1', '', null, '', 'ohrbKwMngP1MIXMm6Cpt2KQj39Sw', 'http://thirdwx.qlogo.cn/mmopen/vi_32/shCw3VpCGfwBjhWVr7K0gy0ZcW28picv3TC6QBScFAdTAd4vcW9WOFc8pJNFdpJ8uh0MmWp7yiaps1icHOE5ZLFNQ/132', '', '', null, null, '1538028522', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('182', null, '1', '', null, '', 'ohrbKwH4UGMEtjfV8ppRJ_5wXEoE', 'http://thirdwx.qlogo.cn/mmopen/vi_32/jJBrxOgT3SjhFvrgmYFKwKsjWickmUDoiaSnGjic2LUI9dyUyFuzWh0CdsKicRnEGTXBBYPibTFbJxyrRJtGGnlIIgw/132', '', '', null, null, '1538028866', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('183', null, '1', '', null, '', 'ohrbKwASrRJTuuEeQqTrhouBgRNs', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKnUic1VTbnFgaVk0icwBFFdC1D3IvVYtbXO3SiaJzgSbKQvsexsXx8REiapscuicm3u2rHnXAY8Yfbj8w/132', '', '', null, null, '1538028951', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('184', '18042025787', '1', '6bff987df8ad217616bd7fe46af819b9', null, '', 'ohrbKwCyPh4hAGXPVQMX1flmkgPI', 'http://thirdwx.qlogo.cn/mmopen/vi_32/WKXAGtiamLfcGOzlZRZ8LEYKEVSuH4FZKFRZPLoNs7WaSuPyaR5YG63jrDHicNdavFo1VicX04MTKD2FAI1yRZ6fQ/132', '', '', null, null, '1538029668', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('185', null, '1', '', null, '', 'ohrbKwIU3N9L_4-Kb9N7YT569mUY', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKicibLYk3Fr0MUCNRDbagVTiaSkzS4XrNwu9WYUEt929EAFCSwGjTSXB4Jx3fU1tnjhVTskotyHbx8A/132', '', '', null, null, '1538029732', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('186', null, '1', '', null, '', 'ohrbKwDGvb2W_9pNoGl_LlkSmeAo', 'http://thirdwx.qlogo.cn/mmopen/vi_32/QFSClzB6yqKZ61dDIBkHK0FdBGTN6dzGcsvoIdB7rGpibqovfUbK4Ij1ydgiaznpkRYdIgP7kyBTuzmUPMGWpSpg/132', '', '', null, null, '1538029861', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('187', null, '1', '', null, '', 'ohrbKwK3D31EYnMsJ2CKcUvVUJpU', 'http://thirdwx.qlogo.cn/mmopen/vi_32/joiaA475nx3djXfEqHpbXiaqjz07gyFmUEmAdbulKBFBA2yEXka1qD1UAjeoGUloJ4trYI67sphTiaKRfoa8Whsnw/132', '', '', null, null, '1538030209', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('188', null, '1', '', null, '', 'ohrbKwPTab0lO7-49QEbhzEhBD9M', 'http://thirdwx.qlogo.cn/mmopen/vi_32/hwSFPib2dmuHAxoGvJCRZ8sXVctPxXaBuOPeyISiauGnwMHq66jK91G8jBtmA2Zu3BicVzuCL96w1K6SfDiaSibz0KA/132', '', '', null, null, '1538030802', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('189', null, '1', '', null, '', 'ohrbKwDiXPTN4Gu9yHymx6PWaV6c', 'http://thirdwx.qlogo.cn/mmopen/vi_32/qeXvwCPod8pIRNmYAuKvwbnbzsnLZ7lSQKs1mtH2iaIu5nibwpR1XaqhSexmgWbGRjwI8bHIMHRXl7jKuiaxBGvnA/132', '', '', null, null, '1538031602', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('190', null, '1', '', null, '', 'ohrbKwIng2eDJpfxqZ6Md7cnR1Uw', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJP9Z9pZ5AUqVBWZVmstOmehoYFNM9r6MLicmMy1HWnulNia9SicfdwKBaymXwZ8tDhPXHyMuwzHKryA/132', '', '', null, null, '1538031777', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('191', '15057736588', '1', '949adbd551536c40909faf74b8de3014', '梅松青', '', 'ohrbKwLSjZSbh6hi2LCr3DvV99s8', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIqtPHYrZKKTNN8YfKW0dkqjSMEfetZict9bYSicS8ysV9FCr7KRz7LWfBzbK4AeT1nBlbhKRmCicaHQ/132', '温州市', '浙江省', './Uploads/Picture/2018-09-27/tMswz7Lcx9DrEv659KpGEDoCNgMRdShok7avu_mzNGW8IGbkdzbiAt9u_GeRLv1J.jpg', '温州鹏刚汽车销售有限公司', '1538032031', '2', '1', null, '20', '1', null, null, '沙城街道烟台村沙城街342号', './Uploads/Picture/2018-09-27/MmZB-PUg3uIiaUMe7pz5avGFayVp9zfeSwzRyb5HehezzcVv2k4S19omNnCPA_Fq.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('202', null, '1', '', null, '', 'ohrbKwMBGxX6lt2rMPYdyZyvuLGs', 'http://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKVu8mKqHucCetvuY9EjUsYlauHZJvHSaBe3Lt2rXSiaxcUFEUibDkmYy4cMKNCHptHvTic82TCnxic7g/132', '', '', null, null, '1538105738', '0', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO `clt_rental_myuser` VALUES ('193', '15356527178', '0', '35c61e10a5f5b361175cabf175444f00', '辰', '', 'ohrbKwMBbp2yEAujgxS6ehYTsJsE', 'http://thirdwx.qlogo.cn/mmopen/vi_32/dVwTkWfmvCHqWug0k8M3XaWsuyq5f6ibC1kz63hShKThAxBXaFYjUb3I3cSG9pia6IGDdeCibPjCkA9pBnB1sUg4w/132', '温州市', '浙江省', './Uploads/Picture/2018-09-28/_W9-bmWQfffcb6m5_caWUbm8de7kATQqzHLhoy6webARsaWF8qoCmqL1kbtxNLOr.jpg', '大海', '1538036502', '2', '1', null, '44', '1', null, null, '国际花园', './Uploads/Picture/2018-09-28/4tvRzaOgV7eYqsCHJhy3FuIvPH68Ul7dryPGNkTV3PaadGN4EY6eY0bzy-BTO8iA.jpg', null);
INSERT INTO `clt_rental_myuser` VALUES ('205', '13738331612', '1', '41fffa57b91f4031246e8025a6a62b06', '叶治忠', '', 'ohrbKwF-cGqxJJSUaNvCZBAP5qQ8', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLKNcl2YibtArk6g16ku4X90ev2HicUd882icM9b2iavYeUZcsRm9GBiaUPA9Cpiba6DXPH2o6XlVFoqFyQ/132', '温州市', '浙江省', './Uploads/Picture/2018-10-09/1vVGKUOMXvE7hzN5dAskFwoNHtrSFdTC2tSRrBlcrGTg9rfNM0TExcVp5oZv57fF.jpg', '瑞安市宝润汽车有限公司', '1539054404', '2', '1', null, '22', '1', null, null, '瑞安木', './Uploads/Picture/2018-10-09/TJMLOxJLY_V5haf-aQk4st8deehdv5IE_3TWrUYYrV2SAkhyqCLsNtcLK_p-mWRV.jpg', null);

-- ----------------------------
-- Table structure for `clt_role`
-- ----------------------------
DROP TABLE IF EXISTS `clt_role`;
CREATE TABLE `clt_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_role
-- ----------------------------
INSERT INTO `clt_role` VALUES ('1', '超级管理员', '1', '超级管理', '0', '0');
INSERT INTO `clt_role` VALUES ('2', '普通管理员', '1', '普通管理员', '0', '0');
INSERT INTO `clt_role` VALUES ('3', '注册用户', '1', '注册用户', '0', '0');
INSERT INTO `clt_role` VALUES ('4', '游客', '1', '游客', '0', '0');

-- ----------------------------
-- Table structure for `clt_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `clt_role_user`;
CREATE TABLE `clt_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT '0',
  `user_id` char(32) DEFAULT '0',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `clt_system`
-- ----------------------------
DROP TABLE IF EXISTS `clt_system`;
CREATE TABLE `clt_system` (
  `id` int(36) unsigned NOT NULL,
  `name` char(36) NOT NULL DEFAULT '' COMMENT '网站名称',
  `url` varchar(36) NOT NULL DEFAULT '' COMMENT '网址',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `key` varchar(200) NOT NULL COMMENT '关键字',
  `des` varchar(200) NOT NULL COMMENT '描述',
  `bah` varchar(50) DEFAULT NULL COMMENT '备案号',
  `copyright` varchar(30) DEFAULT NULL COMMENT 'copyright',
  `ads` varchar(120) DEFAULT NULL COMMENT '公司地址',
  `tel` varchar(15) DEFAULT NULL COMMENT '公司电话',
  `email` varchar(50) DEFAULT NULL COMMENT '公司邮箱',
  `logo` varchar(120) DEFAULT NULL COMMENT 'logo',
  `mobile` varchar(10) DEFAULT 'open' COMMENT '是否开启手机端 open 开启 close 关闭',
  `code` varchar(10) DEFAULT 'close' COMMENT '是否开启验证码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_system
-- ----------------------------
INSERT INTO `clt_system` VALUES ('1', '成都唯意装饰', 'http://www.cdwyzx.com/', '唯意装饰', '唯意装饰CRM系统,TP5框架', '唯意装饰CRM系统,TP5框架', '蜀ICP备16023053号-1', '2018-2022', '成都市青羊区', '18782462482', '1980428326@qq.com', '/uploads/20180928/9c508b90a8a3f0aba79e5f800559ef43.png', 'open', 'open');

-- ----------------------------
-- Table structure for `clt_team`
-- ----------------------------
DROP TABLE IF EXISTS `clt_team`;
CREATE TABLE `clt_team` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `template` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_team
-- ----------------------------
INSERT INTO `clt_team` VALUES ('1', 'json—前端业余工程师', 'color:rgb(57, 61, 73);font-weight:normal;', '/uploads/20180613/27f4cfe5854eb4cfdfd87399a60c7cbd.jpg', '0', '1', '1', 'admin', '0', '1499764958', '1528876606', '0', '7', '<p>1年开发,1月前端</p>', null);
INSERT INTO `clt_team` VALUES ('2', 'json—软件工程师', 'color:rgb(57, 61, 73);font-weight:normal;', '/uploads/20180613/7d4aaaf4c86aac002184dace64cf179e.jpg', '1', '1', '1', 'admin', '0', '1499765015', '1528876594', '0', '7', '<p>1年开发,1月前端</p>', null);

-- ----------------------------
-- Table structure for `clt_test`
-- ----------------------------
DROP TABLE IF EXISTS `clt_test`;
CREATE TABLE `clt_test` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '标题',
  `title_style` varchar(225) NOT NULL DEFAULT '' COMMENT '标题样式',
  `thumb` varchar(225) NOT NULL DEFAULT '' COMMENT '缩略图',
  `hits` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `userid` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(40) NOT NULL DEFAULT '' COMMENT '用户名',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '语言',
  `template` varchar(40) NOT NULL DEFAULT '' COMMENT '模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_test
-- ----------------------------

-- ----------------------------
-- Table structure for `clt_users`
-- ----------------------------
DROP TABLE IF EXISTS `clt_users`;
CREATE TABLE `clt_users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `paypwd` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 男 0 女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_validated` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证手机',
  `oauth` varchar(10) DEFAULT '' COMMENT '第三方来源 wx weibo alipay',
  `openid` varchar(100) DEFAULT NULL COMMENT '第三方唯一标示',
  `unionid` varchar(100) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `province` int(6) DEFAULT '0' COMMENT '省份',
  `city` int(6) DEFAULT '0' COMMENT '市区',
  `district` int(6) DEFAULT '0' COMMENT '县',
  `email_validated` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证电子邮箱',
  `username` varchar(50) DEFAULT NULL COMMENT '第三方返回昵称',
  `level` tinyint(1) DEFAULT '1' COMMENT '会员等级',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否被锁定冻结',
  `token` varchar(64) DEFAULT '' COMMENT '用于app 授权类似于session_id',
  `sign` varchar(255) DEFAULT '' COMMENT '签名',
  `status` varchar(20) DEFAULT 'hide' COMMENT '登录状态',
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_users
-- ----------------------------

-- ----------------------------
-- Table structure for `clt_user_level`
-- ----------------------------
DROP TABLE IF EXISTS `clt_user_level`;
CREATE TABLE `clt_user_level` (
  `level_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `sort` int(3) DEFAULT '0' COMMENT '排序',
  `bomlimit` int(5) DEFAULT '0' COMMENT '积分下限',
  `toplimit` int(5) DEFAULT '0' COMMENT '积分上限',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clt_user_level
-- ----------------------------
INSERT INTO `clt_user_level` VALUES ('1', '注册会员', '1', '0', '500');
INSERT INTO `clt_user_level` VALUES ('2', '铜牌会员', '2', '501', '1000');
INSERT INTO `clt_user_level` VALUES ('3', '白银会员', '3', '1001', '2000');
INSERT INTO `clt_user_level` VALUES ('4', '黄金会员', '4', '2001', '3500');
INSERT INTO `clt_user_level` VALUES ('5', '钻石会员', '5', '3501', '5500');
INSERT INTO `clt_user_level` VALUES ('6', '超级VIP', '6', '5500', '99999');

-- ----------------------------
-- Table structure for `clt_wx_auth`
-- ----------------------------
DROP TABLE IF EXISTS `clt_wx_auth`;
CREATE TABLE `clt_wx_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `authorizer_appid` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的appid  授权之后不用刷新',
  `authorizer_refresh_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺授权之后的刷新token，每月刷新',
  `authorizer_access_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的公众号token，只有2小时',
  `func_info` varchar(1000) NOT NULL DEFAULT '' COMMENT '授权项目',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号头像url',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号原始账号',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号原始名称',
  `qrcode_url` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号二维码url',
  `auth_time` int(11) DEFAULT '0' COMMENT '授权时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺(实例)微信公众账号授权';

-- ----------------------------
-- Records of clt_wx_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `clt_wx_config`
-- ----------------------------
DROP TABLE IF EXISTS `clt_wx_config`;
CREATE TABLE `clt_wx_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '1' COMMENT '实例ID',
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '配置项WCHAT,QQ,WPAY,ALIPAY...',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '配置值json',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '描述',
  `is_use` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用 1启用 0不启用',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='第三方配置表';

-- ----------------------------
-- Records of clt_wx_config
-- ----------------------------
INSERT INTO `clt_wx_config` VALUES ('1', '0', 'WCHAT', '{\"APP_KEY\":\"\",\"APP_SECRET\":\"\",\"AUTHORIZE\":\"http:\\/\\/b2c1.01.niushop.com.cn\",\"CALLBACK\":\"http:\\/\\/b2c1.01.niushop.com.cn\\/wap\\/Login\\/callback\"}', '微信', '0', '1488350947', '1497105440');
INSERT INTO `clt_wx_config` VALUES ('2', '0', 'SHOPWCHAT', '{\"appid\":\"dfdsfdsf90bc7b7a\",\"appsecret\":\"e5147ce07128asdfds222f628b5c3fe1af2ea5797\",\"token\":\"dffdf\"}', '', '1', '1497088090', '1528690160');

-- ----------------------------
-- Table structure for `clt_wx_default_replay`
-- ----------------------------
DROP TABLE IF EXISTS `clt_wx_default_replay`;
CREATE TABLE `clt_wx_default_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关注时回复';

-- ----------------------------
-- Records of clt_wx_default_replay
-- ----------------------------
INSERT INTO `clt_wx_default_replay` VALUES ('3', '0', '4', '0', '1528695059', '0');

-- ----------------------------
-- Table structure for `clt_wx_fans`
-- ----------------------------
DROP TABLE IF EXISTS `clt_wx_fans`;
CREATE TABLE `clt_wx_fans` (
  `fans_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '粉丝ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员编号ID',
  `source_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推广人uid',
  `instance_id` int(11) NOT NULL COMMENT '店铺ID',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `nickname_decode` varchar(255) DEFAULT '',
  `headimgurl` varchar(500) NOT NULL DEFAULT '' COMMENT '头像',
  `sex` smallint(6) NOT NULL DEFAULT '1' COMMENT '性别',
  `language` varchar(20) NOT NULL DEFAULT '' COMMENT '用户语言',
  `country` varchar(60) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `district` varchar(255) NOT NULL DEFAULT '' COMMENT '行政区/县',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一     用户的唯一身份ID',
  `unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '粉丝unionid',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝所在组id',
  `is_subscribe` bigint(1) NOT NULL DEFAULT '1' COMMENT '是否订阅',
  `memo` varchar(255) NOT NULL COMMENT '备注',
  `subscribe_date` int(11) DEFAULT '0' COMMENT '订阅时间',
  `unsubscribe_date` int(11) DEFAULT '0' COMMENT '解订阅时间',
  `update_date` int(11) DEFAULT '0' COMMENT '粉丝信息最后更新时间',
  PRIMARY KEY (`fans_id`),
  KEY `IDX_sys_weixin_fans_openid` (`openid`),
  KEY `IDX_sys_weixin_fans_unionid` (`unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微信公众号获取粉丝列表';

-- ----------------------------
-- Records of clt_wx_fans
-- ----------------------------

-- ----------------------------
-- Table structure for `clt_wx_follow_replay`
-- ----------------------------
DROP TABLE IF EXISTS `clt_wx_follow_replay`;
CREATE TABLE `clt_wx_follow_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关注时回复';

-- ----------------------------
-- Records of clt_wx_follow_replay
-- ----------------------------
INSERT INTO `clt_wx_follow_replay` VALUES ('2', '0', '1', '0', '1528695047', '0');

-- ----------------------------
-- Table structure for `clt_wx_key_replay`
-- ----------------------------
DROP TABLE IF EXISTS `clt_wx_key_replay`;
CREATE TABLE `clt_wx_key_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `key` varchar(255) NOT NULL COMMENT '关键词',
  `match_type` tinyint(4) NOT NULL COMMENT '匹配类型1模糊匹配2全部匹配',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关键词回复';

-- ----------------------------
-- Records of clt_wx_key_replay
-- ----------------------------
INSERT INTO `clt_wx_key_replay` VALUES ('2', '0', '你好', '1', '3', '0', '1528696514', '0');

-- ----------------------------
-- Table structure for `clt_wx_media`
-- ----------------------------
DROP TABLE IF EXISTS `clt_wx_media`;
CREATE TABLE `clt_wx_media` (
  `media_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图文消息id',
  `title` varchar(100) DEFAULT NULL,
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例id店铺id',
  `type` varchar(255) NOT NULL DEFAULT '1' COMMENT '类型1文本(项表无内容) 2单图文 3多图文',
  `sort` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`media_id`),
  UNIQUE KEY `id` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170;

-- ----------------------------
-- Records of clt_wx_media
-- ----------------------------
INSERT INTO `clt_wx_media` VALUES ('1', '欢迎来到三笠的公众号世界', '0', '1', '0', '1512551413', '0');
INSERT INTO `clt_wx_media` VALUES ('2', '欢迎来到三笠的公众号世界', '0', '1', '0', '1512550726', '0');
INSERT INTO `clt_wx_media` VALUES ('3', '欢迎来到三笠的公众号世界', '0', '2', '0', '1512550547', '0');
INSERT INTO `clt_wx_media` VALUES ('4', '欢迎来到三笠的公众号世界', '0', '3', '0', '1528694363', '0');
INSERT INTO `clt_wx_media` VALUES ('5', '欢迎来到三笠的公众号世界', '0', '2', '0', '1528694392', '0');
INSERT INTO `clt_wx_media` VALUES ('6', '欢迎来到三笠的公众号世界', '0', '1', '0', '1528694379', '0');

-- ----------------------------
-- Table structure for `clt_wx_media_item`
-- ----------------------------
DROP TABLE IF EXISTS `clt_wx_media_item`;
CREATE TABLE `clt_wx_media_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `media_id` int(11) NOT NULL COMMENT '图文消息id',
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(50) NOT NULL COMMENT '作者',
  `cover` varchar(200) NOT NULL COMMENT '图文消息封面',
  `show_cover_pic` tinyint(4) NOT NULL DEFAULT '1' COMMENT '封面图片显示在正文中',
  `summary` text,
  `content` text NOT NULL COMMENT '正文',
  `content_source_url` varchar(200) NOT NULL DEFAULT '' COMMENT '图文消息的原文地址，即点击“阅读原文”后的URL',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  PRIMARY KEY (`id`),
  KEY `id` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=712;

-- ----------------------------
-- Records of clt_wx_media_item
-- ----------------------------
INSERT INTO `clt_wx_media_item` VALUES ('28', '3', '欢迎来到三笠的公众号世界', 'cltphp', '/uploads/20171206/6dfec00133ee42c5c33cea8ab0cfad8f.png', '1', '成都唯意装饰', '<p style=\"text-indent: 2em;\"><span style=\"text-indent: 2em;\">成都唯意装饰</p><p><br/></p>', 'http://www.cdwyzx.com/', '0', '6');
INSERT INTO `clt_wx_media_item` VALUES ('29', '2', '欢迎来到三笠的公众号世界', '', '', '0', '成都唯意装饰', '', '', '0', '0');
INSERT INTO `clt_wx_media_item` VALUES ('42', '1', '欢迎来到三笠的公众号世界', '', '', '0', '成都唯意装饰', '', '', '0', '0');
INSERT INTO `clt_wx_media_item` VALUES ('47', '4', '欢迎来到三笠的公众号世界', 'chichu', '/uploads/20180611/5df2c8dabd33e0a0672dcb94b51d5ada.jpg', '1', '成都唯意装饰', '<h4 style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-weight: normal; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \">CLTPHP5.2.2发布</h4><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \"><span style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; margin: 0px; padding: 0px;\">修改bug若干</span></p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \"><span style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 24px; vertical-align: baseline; margin: 0px; padding: 0px;\">成都唯意装饰</a></span></span></span></p>', 'http://www.cdwyzx.com/', '0', '0');
INSERT INTO `clt_wx_media_item` VALUES ('48', '4', '欢迎来到三笠的公众号世界', 'chichu', '/uploads/20171206/18fd882e982e07e7b35dac5b962ab393.jpg', '0', '成都唯意装饰', '<p><span style=\"color: rgb(102, 102, 102); font-family: \">成都唯意装饰</span></p>', 'http://www.cdwyzx.com/', '0', '0');
INSERT INTO `clt_wx_media_item` VALUES ('49', '4', '欢迎来到三笠的公众号世界', 'chichu', '/uploads/20171206/db19ac0c46a3ffd4ebf94028024d3036.jpg', '1', '成都唯意装饰', '<p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \">CLTPHP操作开发手册已完全更新，CLTPHP核心价值，尽在其中。</p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \">喜欢的朋友可以购买参考</p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \">同时希望CLTPHP的爱好者，可以给我提出更多CLTPHP的不足之处，让CLTPHP更健康的成长。</p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \">手册地址：<a href=\"https://www.kancloud.cn/chichu/cltphp/\" target=\"_self\">https://www.cdwyzx.com</a></p><p><br/></p>', 'http://www.cdwyzx.com/', '0', '0');
INSERT INTO `clt_wx_media_item` VALUES ('50', '6', '欢迎来到三笠的公众号世界', '', '', '0', '成都唯意装饰', '', '', '0', '0');
INSERT INTO `clt_wx_media_item` VALUES ('51', '5', '欢迎来到三笠的公众号世界', 'chichu', '/uploads/20180611/12e57c01f2bd9172c8c26de45cb796a6.jpg', '0', '成都唯意装饰', '<p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; text-indent: 2em;\">CLTPHP操作开发手册已完全更新，CLTPHP核心价值，尽在其中。</p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \">喜欢的朋友可以购买参考</p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; text-indent: 2em;\">同时希望CLTPHP的爱好者，可以给我提出更多CLTPHP的不足之处，让CLTPHP更健康的成长。</p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; text-indent: 2em;\">cdwyzx.com</p><p><br/></p>', 'http://www.cdwyzx.com/', '0', '0');

-- ----------------------------
-- Table structure for `clt_wx_menu`
-- ----------------------------
DROP TABLE IF EXISTS `clt_wx_menu`;
CREATE TABLE `clt_wx_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `menu_name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `ico` varchar(32) NOT NULL DEFAULT '' COMMENT '菜图标单',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父菜单',
  `menu_event_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1普通url 2 图文素材 3 功能',
  `media_id` int(11) NOT NULL DEFAULT '0' COMMENT '图文消息ID',
  `menu_event_url` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单url',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '触发数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_date` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`menu_id`),
  KEY `IDX_biz_shop_menu_orders` (`sort`),
  KEY `IDX_biz_shop_menu_shopId` (`instance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微设置->微店菜单';

-- ----------------------------
-- Records of clt_wx_menu
-- ----------------------------
INSERT INTO `clt_wx_menu` VALUES ('1', '0', '唯意装修', '', '0', '2', '3', 'http://www.cdwyzx.com/', '0', '1', '1512442512', '0');
INSERT INTO `clt_wx_menu` VALUES ('2', '0', '唯意装饰', '', '0', '2', '5', 'http://www.cdwyzs.cn/', '0', '2', '1512442543', '0');
INSERT INTO `clt_wx_menu` VALUES ('3', '0', '齐天装修', '', '0', '1', '4', 'http://www.qitianzx.com/', '0', '3', '1512547727', '0');

-- ----------------------------
-- Table structure for `clt_wx_user`
-- ----------------------------
DROP TABLE IF EXISTS `clt_wx_user`;
CREATE TABLE `clt_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `wxname` varchar(60) NOT NULL COMMENT '公众号名称',
  `aeskey` varchar(256) NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'encode',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `wxid` varchar(64) NOT NULL COMMENT '公众号原始ID',
  `weixin` char(64) NOT NULL COMMENT '微信号',
  `token` char(255) NOT NULL COMMENT 'token',
  `w_token` varchar(150) NOT NULL DEFAULT '' COMMENT '微信对接token',
  `create_time` int(11) NOT NULL COMMENT 'create_time',
  `updatetime` int(11) NOT NULL COMMENT 'updatetime',
  `tplcontentid` varchar(2) NOT NULL COMMENT '内容模版ID',
  `share_ticket` varchar(150) NOT NULL COMMENT '分享ticket',
  `share_dated` char(15) NOT NULL COMMENT 'share_dated',
  `authorizer_access_token` varchar(200) NOT NULL COMMENT 'authorizer_access_token',
  `authorizer_refresh_token` varchar(200) NOT NULL COMMENT 'authorizer_refresh_token',
  `authorizer_expires` char(10) NOT NULL COMMENT 'authorizer_expires',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `web_access_token` varchar(200) NOT NULL COMMENT '网页授权token',
  `web_refresh_token` varchar(200) NOT NULL COMMENT 'web_refresh_token',
  `web_expires` int(11) NOT NULL COMMENT '过期时间',
  `menu_config` text COMMENT '菜单',
  `wait_access` tinyint(1) DEFAULT '0' COMMENT '微信接入状态,0待接入1已接入',
  `concern` varchar(225) DEFAULT '' COMMENT '关注回复',
  `default` varchar(225) DEFAULT '' COMMENT '默认回复',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uid_2` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='微信公共帐号';

-- ----------------------------
-- Records of clt_wx_user
-- ----------------------------
INSERT INTO `clt_wx_user` VALUES ('1', '0', 'CLTPHP', '', '0', 'wx08c8be078e00b88b', '2e6f2d97d60582f21111be7862d14ddc', 'gh_8aacbef4e497', 'chichu12345', 'sdfdsfdsfdsf', 'cltphp', '0', '0', '', '', '', '', '', '', '1', 'eY9W4LLdISpE3UtTfuodgz1HJdBYCMbzZWkiLEhF0Nzvzv2q2DtGIV5h7CPrc0Nd4_kJgKN_FdM3kNaCxfFC1wmu6JLnNoOrmMuy3FK2AhMDLCbAGAXFW', '', '1504242136', '0', '0', '欢迎来到CLTPHP！CLTPHP采用ThinkPHP5作为基础框架，同时采用Layui作为后台界面，使得CLTPHP适用与大型企业网站、个人博客论坛、企业网站、手机网站的定制开发。更高效、更快捷的进行定制开发一直是CLTPHP追求的价值。', '亲！您可以输入关键词来获取您想要知道的内容。（例：手册）');

-- ----------------------------
-- Table structure for `clt_wx_user_msg`
-- ----------------------------
DROP TABLE IF EXISTS `clt_wx_user_msg`;
CREATE TABLE `clt_wx_user_msg` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `msg_type` varchar(255) NOT NULL,
  `content` text,
  `is_replay` int(11) NOT NULL DEFAULT '0' COMMENT '是否回复',
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息表';

-- ----------------------------
-- Records of clt_wx_user_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `clt_wx_user_msg_replay`
-- ----------------------------
DROP TABLE IF EXISTS `clt_wx_user_msg_replay`;
CREATE TABLE `clt_wx_user_msg_replay` (
  `replay_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) NOT NULL,
  `replay_uid` int(11) NOT NULL COMMENT '当前客服uid',
  `replay_type` varchar(255) NOT NULL,
  `content` text,
  `replay_time` int(11) DEFAULT '0',
  PRIMARY KEY (`replay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息回复表';

-- ----------------------------
-- Records of clt_wx_user_msg_replay
-- ----------------------------
