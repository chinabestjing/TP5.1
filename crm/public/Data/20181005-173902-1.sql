
-- -----------------------------
-- Table structure for `clt_ad`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_ad`
-- -----------------------------
INSERT INTO `clt_ad` VALUES ('15', '成都唯意装饰', '1', '/uploads/20180611/c09ce57b7b5264ccbefef44c2591117b.png', 'http://www.cdwyzx.com', '1480909037', '1', '1', '成都唯意装饰');
INSERT INTO `clt_ad` VALUES ('17', '成都唯意装饰', '1', '/uploads/20180611/25e5f5a08933130f026a6119666b44a8.png', 'http://www.cdwyzx.com', '1481788850', '2', '1', '成都唯意装饰');
INSERT INTO `clt_ad` VALUES ('18', '成都唯意装饰', '1', '/uploads/20180611/814e5f76ef5dce49dfd3dce771631ecf.png', 'http://www.cdwyzx.com', '1481788869', '3', '1', '成都唯意装饰');

-- -----------------------------
-- Table structure for `clt_ad_type`
-- -----------------------------
DROP TABLE IF EXISTS `clt_ad_type`;
CREATE TABLE `clt_ad_type` (
  `type_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告位名称',
  `sort` int(11) NOT NULL COMMENT '广告位排序',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='广告分类';

-- -----------------------------
-- Records of `clt_ad_type`
-- -----------------------------
INSERT INTO `clt_ad_type` VALUES ('1', '【首页】顶部轮播', '1');
INSERT INTO `clt_ad_type` VALUES ('5', '【内页】横幅', '2');

-- -----------------------------
-- Table structure for `clt_admin`
-- -----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

-- -----------------------------
-- Records of `clt_admin`
-- -----------------------------
INSERT INTO `clt_admin` VALUES ('1', 'admin', 'c5be58565e021294eb53cee07ab1e84f', '1', '1980428326@qq.com', '', '18782462482', '127.0.0.1', '1482132862', '0', '1', '/uploads/20180929/2e1d2ed6f213d0af68751d804168e068.jpg');
INSERT INTO `clt_admin` VALUES ('11', '123123', '4297f44b13955235245b2497399d7a93', '2', '1980428326@qq.com', '', '13856489956', '127.0.0.1', '1538020466', '0', '1', '/uploads/20180927/57035b2fa368e2ed692bc3c6fd859500.png');
INSERT INTO `clt_admin` VALUES ('12', '456456', 'b51e8dbebd4ba8a8f342190a4b9f08d7', '3', '1980428326@qq.com', '', '15928602033', '127.0.0.1', '1538183719', '0', '1', '');
INSERT INTO `clt_admin` VALUES ('13', 'jsonjson', 'ec4b8ebff18d52c120a82ef46cbd1b95', '2', '993424780@qq.com', '', '18782462482', '127.0.0.1', '1538375842', '0', '1', '/uploads/20181001/b7608e6b137dcd01c3e0490757beed24.jpg');
INSERT INTO `clt_admin` VALUES ('14', '999999', '52c69e3a57331081823331c4e69d3f2e', '1', '1980428326@qq.com', '', '15928602033', '127.0.0.1', '1538543321', '0', '1', '/uploads/20181003/da37b017124960d1414305ad48ccd3e1.jpg');

-- -----------------------------
-- Table structure for `clt_article`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_article`
-- -----------------------------
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
INSERT INTO `clt_article` VALUES ('44', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '1', '1', '0', '', '0', '0', '1659', '1507877194', '1507879172', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', '');
INSERT INTO `clt_article` VALUES ('45', '5', '1', 'admin', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '成都唯意装饰测试', '0', '1', '1', '0', '', '0', '0', '121', '1512032568', '1530234987', '成都唯意装饰测试', 'httpd://www.cdwyzx.com', '', 'color:;font-weight:normal;');

-- -----------------------------
-- Table structure for `clt_auth_rule`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_auth_rule`
-- -----------------------------
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
INSERT INTO `clt_auth_rule` VALUES ('278', 'Feast/index', '节日气氛', '1', '1', '1', '', '', '267', '50', '1532416207', '', '1');

-- -----------------------------
-- Table structure for `clt_category`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_category`
-- -----------------------------
INSERT INTO `clt_category` VALUES ('1', '最新动态', 'news', '', '0', '2', 'article', '0', '1,5,6', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '4', '0', '1', '0', '', '1', '', 'article-list', 'article-show', '0', '1,2,3', '0', '0', '0');
INSERT INTO `clt_category` VALUES ('2', '关于我们', 'about', '', '0', '1', 'page', '0', '2', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '0', '0', '1', '0', '', '0', '', '', '', '0', '', '0', '0', '0');
INSERT INTO `clt_category` VALUES ('4', '系统操作', 'system', '', '0', '3', 'picture', '0', '4', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '2', '0', '1', '0', '', '0', '', '', '', '0', '1,2,3', '0', '0', '0');
INSERT INTO `clt_category` VALUES ('3', '服务内容', 'services', '', '0', '2', 'article', '0', '3', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '1', '0', '1', '0', '', '0', '', '', '', '15', '1,2,3', '0', '0', '1');
INSERT INTO `clt_category` VALUES ('8', '联系我们', 'contact', '', '0', '1', 'page', '0', '8', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '7', '0', '1', '0', '', '0', '', 'page_show_contace', 'page_show_contace', '0', '', '0', '0', '0');
INSERT INTO `clt_category` VALUES ('7', '精英团队', 'team', '', '0', '6', 'team', '0', '7', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '5', '0', '1', '0', '', '0', '', '', '', '0', '', '0', '0', '0');
INSERT INTO `clt_category` VALUES ('5', '动态', 'news2', 'news/', '1', '2', 'article', '0,1', '5', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '0', '0', '1', '0', '', '0', '', '', '', '5', '1,2,3', '0', '0', '1');
INSERT INTO `clt_category` VALUES ('6', '相关知识 ', 'news', 'news/', '1', '2', 'article', '0,1', '6', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '0', '0', '1', '0', '', '0', '', '', '', '0', '', '0', '0', '1');
INSERT INTO `clt_category` VALUES ('14', '文件下载', 'download', '', '0', '5', 'download', '0', '14', '0', '成都唯意装饰', '成都唯意装饰', '成都唯意装饰', '0', '0', '1', '0', '', '0', '', '', '', '10', '1,2', '0', '0', '0');

-- -----------------------------
-- Table structure for `clt_config`
-- -----------------------------
DROP TABLE IF EXISTS `clt_config`;
CREATE TABLE `clt_config` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `clt_config`
-- -----------------------------
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

-- -----------------------------
-- Table structure for `clt_debris`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_debris`
-- -----------------------------
INSERT INTO `clt_debris` VALUES ('15', '1', '装修测试', '<p><span style=\"text-align: center;\">装修测试</span></p>', '1503293255', '1');
INSERT INTO `clt_debris` VALUES ('16', '1', '装修测试', '<p><span style=\"text-align: center;\">装修测试</span></p>', '1503293273', '2');
INSERT INTO `clt_debris` VALUES ('17', '1', '装修测试', '<p><span style=\"text-align: center;\">装修测试</span></p>', '1503293291', '3');

-- -----------------------------
-- Table structure for `clt_debris_type`
-- -----------------------------
DROP TABLE IF EXISTS `clt_debris_type`;
CREATE TABLE `clt_debris_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL,
  `sort` int(1) DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `clt_debris_type`
-- -----------------------------
INSERT INTO `clt_debris_type` VALUES ('1', '【首页】中部碎片', '1');

-- -----------------------------
-- Table structure for `clt_donation`
-- -----------------------------
DROP TABLE IF EXISTS `clt_donation`;
CREATE TABLE `clt_donation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(120) NOT NULL DEFAULT '' COMMENT '用户名',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '捐赠金额',
  `addtime` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `clt_donation`
-- -----------------------------
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

-- -----------------------------
-- Table structure for `clt_download`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_download`
-- -----------------------------
INSERT INTO `clt_download` VALUES ('3', '14', '1', 'admin', '测试下载一', 'color:;font-weight:normal;', '', '测试下载一', '测试下载一', '请输入……', '0', '0', '1', '0', '', '0', '0', '0', '1529637588', '0', '/uploads/20180622/a6f6381d3bf0f0814790ad4b5b121794.zip', 'zip', '', '0');
INSERT INTO `clt_download` VALUES ('4', '14', '1', 'admin', '测试下载二', 'color:;font-weight:normal;', '', '测试下载二', '测试下载二', '请输入……', '0', '0', '1', '0', '', '0', '0', '0', '1529638055', '0', '/uploads/20180622/795f146c7c9e52414fe9f3b041af583e.zip', 'zip', '', '0');

-- -----------------------------
-- Table structure for `clt_field`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_field`
-- -----------------------------
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

-- -----------------------------
-- Table structure for `clt_link`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_link`
-- -----------------------------
INSERT INTO `clt_link` VALUES ('10', '成都唯意装修', 'http://www.cdwyzx.com/', '0', '416148489', '1', '1495183645', '1');

-- -----------------------------
-- Table structure for `clt_message`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_message`
-- -----------------------------
INSERT INTO `clt_message` VALUES ('92', '呵呵', '', '1528851199', '0', '127.0.0.1', '4123', 'chichu', '1109305987@qq.com');
INSERT INTO `clt_message` VALUES ('93', '11', '', '1530629400', '0', '127.0.0.1', '11', '11', '11');
INSERT INTO `clt_message` VALUES ('94', '11', '', '1530777448', '0', '127.0.0.1', '11', '11', '11');

-- -----------------------------
-- Table structure for `clt_module`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_module`
-- -----------------------------
INSERT INTO `clt_module` VALUES ('1', '单页模型', 'page', '单页面', '1', '0', '*', '0', '1');
INSERT INTO `clt_module` VALUES ('2', '文章模型', 'article', '新闻文章', '1', '0', '*', '0', '1');
INSERT INTO `clt_module` VALUES ('3', '图片模型', 'picture', '图片展示', '1', '0', '*', '0', '1');
INSERT INTO `clt_module` VALUES ('4', '产品模型', 'product', '产品展示', '1', '0', '*', '0', '1');
INSERT INTO `clt_module` VALUES ('5', '下载模型', 'download', '文件下载', '1', '0', '*', '0', '1');
INSERT INTO `clt_module` VALUES ('6', '团队模型', 'team', '员工展示', '1', '0', '*', '0', '1');
INSERT INTO `clt_module` VALUES ('19', 'test', 'test', '', '1', '0', '*', '0', '1');

-- -----------------------------
-- Table structure for `clt_page`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_page`
-- -----------------------------
INSERT INTO `clt_page` VALUES ('2', '唯意装饰', 'color:rgb(95, 184, 120);font-weight:bold;', '/uploads/20180611/b78388d0d1b123e06d900c4d1a1d88ba.jpg', '30', '1', '0', '', '0', '1504251653', '0', '0', '<p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \"><a href=\"http://www.cltphp.com/\" target=\"_blank\" title=\"CLTPHP内容管理系统\" style=\"color: rgb(146, 208, 80); text-decoration: none;\"><span style=\"color: rgb(146, 208, 80);\">CLTPHP内容管理系统</span></a>，包含系统设置，权限管理，模型管理，数据库管理，栏目管理，会员管理，网站功能，模版管理，微信管理等相关模块。基于ThinkPHP5开发，后台采用Layui框架完全自适应，数据交互采用更高效简洁的angularjs实现，。</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(151, 151, 151); white-space: normal; background-color: rgb(255, 255, 255);\">　　<a target=\"_blank\" href=\"http://www.cltphp.com/\" style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; outline: 0px; color: rgb(146, 208, 80); text-decoration: none;\"><span style=\"color: rgb(146, 208, 80);\">CLTPHP</span></a>采用ThinkPHP开发，ThinkPHP5采用全新的架构思想，引入了很多的PHP新特性，优化了核心，减少了依赖，实现了真正的惰性加载。正因为ThinkPHP的这些新特性，从而使得CLTPHP的执行速度成倍提高。</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px;\">　　UI方面，<a target=\"_blank\" href=\"http://www.cltphp.com/\" style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; outline: 0px; color: rgb(146, 208, 80); text-decoration: none;\"><span style=\"color: rgb(146, 208, 80);\">CLTPHP</span></a>采用了最受欢迎的Layui，Layui用于开发响应式布局、移动设备优先的 WEB 项目。简洁、直观、强悍的前端开发框架，让CLTPHP的后台界面更加美观，开发更迅速、简单。</p>', '0');
INSERT INTO `clt_page` VALUES ('8', '唯意装饰', 'color:;font-weight:normal;', '', '10', '1', '0', '', '0', '1499765407', '0', '0', '<p>您的支持是我们一往无前的无限动力，非常荣幸在<a target=\"_self\" href=\"http://www.cltphp.com/\">CLTPHP</a>成长的道路上有您的陪伴！！！</p>', '');

-- -----------------------------
-- Table structure for `clt_picture`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_picture`
-- -----------------------------
INSERT INTO `clt_picture` VALUES ('1', '4', '1', 'admin', '模型列表', '模型列表', '展示网站内容模型，模型是CLTPHP的核心之一。', '<p>展示内容</p>', '0', '0', '1', '0', '', '0', '1', '1', '1499761915', '1528699234', '/uploads/20180611/0ce39ef421e7ca7149b2630d93b571ee.png', '1');
INSERT INTO `clt_picture` VALUES ('2', '4', '1', 'admin', '添加模型', '添加模型', '添加模型', '<p>不拘泥于传统。</p>', '0', '0', '1', '0', '', '0', '2', '0', '1499762188', '1528699288', '/uploads/20180611/e41226ad6f977aeb2418a0f55a0678ef.png', '1');
INSERT INTO `clt_picture` VALUES ('3', '4', '1', 'admin', '模型字段', '模型字段', '模型字段', '<p>高效编辑。</p>', '0', '0', '1', '0', '', '0', '3', '0', '1499762270', '1528699324', '/uploads/20180611/57027c6ab845effea600f6f9695e2db4.png', '1');
INSERT INTO `clt_picture` VALUES ('4', '4', '1', 'admin', '添加字段', '添加字段', '添加字段', '<p>扩展类型。</p>', '0', '0', '1', '0', '', '0', '4', '0', '1499762323', '1528699410', '/uploads/20180611/85f128c3c9488a41b04386e31199ab3f.png', '1');
INSERT INTO `clt_picture` VALUES ('5', '4', '1', 'admin', '栏目列表', '栏目列表', '栏目列表', '<p>展示分明。</p>', '0', '0', '1', '0', '', '0', '5', '0', '1499762369', '1528699472', '/uploads/20180611/2b6456d6725ce4ad1a8dd66b595f1eb9.png', '2');
INSERT INTO `clt_picture` VALUES ('6', '4', '1', 'admin', '添加栏目', '添加栏目', '添加栏目', '<p>绑定模型</p>', '0', '0', '1', '0', '', '0', '6', '0', '1499762446', '1528699568', '/uploads/20180611/953235f4e44df6dd63de15bb28ea0bc5.png', '2');
INSERT INTO `clt_picture` VALUES ('7', '4', '1', 'admin', '内容列表', '内容列表', '内容列表', '<p>简洁而高效</p>', '0', '0', '1', '0', '', '0', '7', '0', '1499762523', '1528699605', '/uploads/20180611/fb3193674fb2ea68f2a61d4de0859a0e.png', '3');
INSERT INTO `clt_picture` VALUES ('8', '4', '1', 'admin', '添加内容', '添加内容', '添加内容', '<p>智能</p>', '0', '0', '1', '0', '', '0', '8', '0', '1499762754', '1528699629', '/uploads/20180611/ef322c904a47681d32aa4338316bac18.png', '3');

-- -----------------------------
-- Table structure for `clt_plugin`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_plugin`
-- -----------------------------
INSERT INTO `clt_plugin` VALUES ('qq', 'QQ登陆', '1.0', 'CLTPHP', 'a:5:{i:0;a:4:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:5:\"appid\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:6:\"appkey\";s:5:\"label\";s:6:\"appkey\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:8:\"callback\";s:5:\"label\";s:12:\"回调地址\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:37:\"http://cltdemo.test/index/callback/qq\";}i:3;a:4:{s:4:\"name\";s:5:\"scope\";s:5:\"label\";s:12:\"获取字段\";s:4:\"type\";s:8:\"textarea\";s:5:\"value\";s:225:\"get_user_info,add_share,list_album,add_album,upload_pic,add_topic,add_one_blog,add_weibo,check_page_fans,add_t,add_pic_t,del_t,get_repost_list,get_info,get_other_info,get_fanslist,get_idolist,add_idol,del_idol,get_tenpay_addr\";}i:4;a:4:{s:4:\"name\";s:11:\"errorReport\";s:5:\"label\";s:12:\"错误报告\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:4:\"true\";}}', 'a:5:{s:5:\"appid\";s:0:\"\";s:6:\"appkey\";s:0:\"\";s:8:\"callback\";s:37:\"http://cltdemo.test/index/callback/qq\";s:5:\"scope\";s:225:\"get_user_info,add_share,list_album,add_album,upload_pic,add_topic,add_one_blog,add_weibo,check_page_fans,add_t,add_pic_t,del_t,get_repost_list,get_info,get_other_info,get_fanslist,get_idolist,add_idol,del_idol,get_tenpay_addr\";s:11:\"errorReport\";s:4:\"true\";}', 'QQ登陆插件 ', '1', 'login', 'logo.png', 's:0:\"\";', '0');
INSERT INTO `clt_plugin` VALUES ('changyan', '畅言评论', '1.0', 'CLTPHP', 'a:3:{i:0;a:4:{s:4:\"name\";s:6:\"app_id\";s:5:\"label\";s:6:\"app_id\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:7:\"app_key\";s:5:\"label\";s:7:\"app_key\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:6:\"config\";s:5:\"label\";s:6:\"config\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}', 'a:8:{s:5:\"appid\";s:0:\"\";s:6:\"appkey\";s:0:\"\";s:8:\"callback\";s:37:\"http://cltdemo.test/index/callback/qq\";s:5:\"scope\";s:225:\"get_user_info,add_share,list_album,add_album,upload_pic,add_topic,add_one_blog,add_weibo,check_page_fans,add_t,add_pic_t,del_t,get_repost_list,get_info,get_other_info,get_fanslist,get_idolist,add_idol,del_idol,get_tenpay_addr\";s:11:\"errorReport\";s:4:\"true\";s:6:\"app_id\";s:0:\"\";s:7:\"app_key\";s:0:\"\";s:6:\"config\";s:0:\"\";}', '畅言评论插件 ', '1', 'msg', 'logo.png', 's:0:\"\";', '0');

-- -----------------------------
-- Table structure for `clt_posid`
-- -----------------------------
DROP TABLE IF EXISTS `clt_posid`;
CREATE TABLE `clt_posid` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `sort` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `clt_posid`
-- -----------------------------
INSERT INTO `clt_posid` VALUES ('1', '首页推荐', '0');
INSERT INTO `clt_posid` VALUES ('2', '当前分类推荐', '0');

-- -----------------------------
-- Table structure for `clt_product`
-- -----------------------------
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


-- -----------------------------
-- Table structure for `clt_role`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_role`
-- -----------------------------
INSERT INTO `clt_role` VALUES ('1', '超级管理员', '1', '超级管理', '0', '0');
INSERT INTO `clt_role` VALUES ('2', '普通管理员', '1', '普通管理员', '0', '0');
INSERT INTO `clt_role` VALUES ('3', '注册用户', '1', '注册用户', '0', '0');
INSERT INTO `clt_role` VALUES ('4', '游客', '1', '游客', '0', '0');

-- -----------------------------
-- Table structure for `clt_role_user`
-- -----------------------------
DROP TABLE IF EXISTS `clt_role_user`;
CREATE TABLE `clt_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT '0',
  `user_id` char(32) DEFAULT '0',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `clt_system`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_system`
-- -----------------------------
INSERT INTO `clt_system` VALUES ('1', '成都唯意装饰', 'http://www.cdwyzx.com/', '唯意装饰', '唯意装饰CRM系统,TP5框架', '唯意装饰CRM系统,TP5框架', '蜀ICP备16023053号-1', '2018-2022', '成都市青羊区', '18782462482', '1980428326@qq.com', '/uploads/20180928/9c508b90a8a3f0aba79e5f800559ef43.png', 'open', 'open');

-- -----------------------------
-- Table structure for `clt_team`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_team`
-- -----------------------------
INSERT INTO `clt_team` VALUES ('1', 'json—前端业余工程师', 'color:rgb(57, 61, 73);font-weight:normal;', '/uploads/20180613/27f4cfe5854eb4cfdfd87399a60c7cbd.jpg', '0', '1', '1', 'admin', '0', '1499764958', '1528876606', '0', '7', '<p>1年开发,1月前端</p>', '');
INSERT INTO `clt_team` VALUES ('2', 'json—软件工程师', 'color:rgb(57, 61, 73);font-weight:normal;', '/uploads/20180613/7d4aaaf4c86aac002184dace64cf179e.jpg', '1', '1', '1', 'admin', '0', '1499765015', '1528876594', '0', '7', '<p>1年开发,1月前端</p>', '');

-- -----------------------------
-- Table structure for `clt_test`
-- -----------------------------
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


-- -----------------------------
-- Table structure for `clt_user_level`
-- -----------------------------
DROP TABLE IF EXISTS `clt_user_level`;
CREATE TABLE `clt_user_level` (
  `level_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `sort` int(3) DEFAULT '0' COMMENT '排序',
  `bomlimit` int(5) DEFAULT '0' COMMENT '积分下限',
  `toplimit` int(5) DEFAULT '0' COMMENT '积分上限',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `clt_user_level`
-- -----------------------------
INSERT INTO `clt_user_level` VALUES ('1', '注册会员', '1', '0', '500');
INSERT INTO `clt_user_level` VALUES ('2', '铜牌会员', '2', '501', '1000');
INSERT INTO `clt_user_level` VALUES ('3', '白银会员', '3', '1001', '2000');
INSERT INTO `clt_user_level` VALUES ('4', '黄金会员', '4', '2001', '3500');
INSERT INTO `clt_user_level` VALUES ('5', '钻石会员', '5', '3501', '5500');
INSERT INTO `clt_user_level` VALUES ('6', '超级VIP', '6', '5500', '99999');

-- -----------------------------
-- Table structure for `clt_users`
-- -----------------------------
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


-- -----------------------------
-- Table structure for `clt_wx_user`
-- -----------------------------
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

-- -----------------------------
-- Records of `clt_wx_user`
-- -----------------------------
INSERT INTO `clt_wx_user` VALUES ('1', '0', 'CLTPHP', '', '0', 'wx08c8be078e00b88b', '2e6f2d97d60582f21111be7862d14ddc', 'gh_8aacbef4e497', 'chichu12345', 'sdfdsfdsfdsf', 'cltphp', '0', '0', '', '', '', '', '', '', '1', 'eY9W4LLdISpE3UtTfuodgz1HJdBYCMbzZWkiLEhF0Nzvzv2q2DtGIV5h7CPrc0Nd4_kJgKN_FdM3kNaCxfFC1wmu6JLnNoOrmMuy3FK2AhMDLCbAGAXFW', '', '1504242136', '0', '0', '欢迎来到CLTPHP！CLTPHP采用ThinkPHP5作为基础框架，同时采用Layui作为后台界面，使得CLTPHP适用与大型企业网站、个人博客论坛、企业网站、手机网站的定制开发。更高效、更快捷的进行定制开发一直是CLTPHP追求的价值。', '亲！您可以输入关键词来获取您想要知道的内容。（例：手册）');
