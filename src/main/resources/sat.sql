/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : sta

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2016-01-25 19:46:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for competition
-- ----------------------------
DROP TABLE IF EXISTS `competition`;
CREATE TABLE `competition` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `time` varchar(255) default NULL,
  `link` varchar(255) default NULL,
  `introduce` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition
-- ----------------------------
INSERT INTO `competition` VALUES ('1', '软件创新大赛', 'Wed Jan 13 19:08:03 CST 2016', '#', '没有介绍');
INSERT INTO `competition` VALUES ('4', '服务外包大赛', 'Wed Jan 13 19:08:03 CST 2016', '#', '还是没有介绍');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `introduce` varchar(255) default NULL,
  `destination` varchar(255) default NULL,
  `minister` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('2', '研发中心', '是一个技术研究部门，专注于软件开发技术', '目前的目标是开发科协网站', '3');
INSERT INTO `department` VALUES ('3', '综合事务部', '是一个管理科协综合事务的部门', '对科协内部的综合事务进行管理', '4');

-- ----------------------------
-- Table structure for department_person
-- ----------------------------
DROP TABLE IF EXISTS `department_person`;
CREATE TABLE `department_person` (
  `id` int(11) NOT NULL auto_increment,
  `department_id` int(11) default NULL,
  `person_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `dp_department_id` (`department_id`),
  KEY `dp_person_id` (`person_id`),
  CONSTRAINT `dp_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `dp_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_person
-- ----------------------------
INSERT INTO `department_person` VALUES ('1', '2', '5');
INSERT INTO `department_person` VALUES ('2', '2', '3');
INSERT INTO `department_person` VALUES ('3', '2', '4');

-- ----------------------------
-- Table structure for lecture
-- ----------------------------
DROP TABLE IF EXISTS `lecture`;
CREATE TABLE `lecture` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `introduce` varchar(255) default NULL,
  `link` varchar(255) default NULL,
  `time` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lecture
-- ----------------------------
INSERT INTO `lecture` VALUES ('1', '大数据讲座', '简单介绍一下大数据的概念以及应用前景', '#', 'Sun Jan 17 17:41:13 CST 2016');

-- ----------------------------
-- Table structure for lecture_person
-- ----------------------------
DROP TABLE IF EXISTS `lecture_person`;
CREATE TABLE `lecture_person` (
  `id` int(11) NOT NULL auto_increment,
  `lecture_id` int(11) default NULL,
  `person_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `lp_lecture_id` (`lecture_id`),
  KEY `lp_person_id` (`person_id`),
  CONSTRAINT `lp_lecture_id` FOREIGN KEY (`lecture_id`) REFERENCES `lecture` (`id`),
  CONSTRAINT `lp_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lecture_person
-- ----------------------------
INSERT INTO `lecture_person` VALUES ('1', '1', '3');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `classes` varchar(255) default NULL,
  `mail` varchar(255) default NULL,
  `account` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `isMenber` varchar(255) default NULL,
  `qq` varchar(255) default NULL,
  `wechat` varchar(255) default NULL,
  `introduce` varchar(255) default NULL,
  `job` varchar(255) default NULL,
  `protrait` varchar(255) default NULL,
  `hobby` varchar(255) default NULL,
  `speciality` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('3', '张三', '1301', 'zhangsan@qq.com', 'zhangsan', '123456', '1234567891111', '1', '1456943876', '1234567891111', '无介绍', '干事', '#', '没有爱好', 'ps、图像处理');
INSERT INTO `person` VALUES ('4', '李四', '1302', 'zhangsan@qq.com', 'lisi', '123456', '1234567891111', '1', '1456943876', '1234567891111', '无介绍', '干事', '#', '没有爱好', 'ps、图像处理');
INSERT INTO `person` VALUES ('5', '王五', '1303', 'zhangsan@qq.com', 'wangwu', '123456', '1234567891111', '1', '1456943876', '1234567891111', '无介绍', '干事', '#', '没有爱好', 'ps、图像处理');
INSERT INTO `person` VALUES ('6', '赵六', '1304', 'zhaoliu@qq.com', 'xxxx', '123456', '1234567891234', '0', '324324243', '1234567891234', '没有介绍', '干事', '#', '喜欢打篮球，游戏什么的', '前端设计');
INSERT INTO `person` VALUES ('7', '严七', '1305', 'yanqi@qq.com', 'yanqi', '123456', '1234567891234', '0', '324324243', '1234567891234', '没有介绍', '干事', '#', '喜欢打篮球，游戏什么的', '前端设计');
INSERT INTO `person` VALUES ('8', 'sadas', '2132', 'sdadw@qq.com', 'sadawdwa', '111111', null, '0', '1456943876', 'dawdqqe', 'jihkhku', null, null, 'sdfgdgfd', 'ewrwrwr');
INSERT INTO `person` VALUES ('9', 'sadas', '2132', 'sdadw@qq.com', 'sadawdwawqeqe', 'qqqqqqqq', null, '0', '1456943876', 'dawdqqe', 'jihkhku', null, null, 'sdfgdgfd', 'ewrwrwr');
INSERT INTO `person` VALUES ('10', 'dsfwerwe', '21234', 'sadawda@qq.com', 'gfhdggf', '2222222', null, '0', '1456943876', 'gffhfghf', 'vcxdvxvdxd', null, null, 'fggdgfdgd', 'retetretter');
INSERT INTO `person` VALUES ('11', 'dsfwerwe', '21234', 'sadawda@qq.com', 'gfhdggf', '2222222', null, '0', '1456943876', 'gffhfghf', 'vcxdvxvdxd', null, null, 'fggdgfdgd', 'retetretter');
INSERT INTO `person` VALUES ('12', 'asdasda', 'gfhg', 'gfhf@qq.com', 'sadadassadasdda', '123456', null, '0', '14569438765', 'sadafa', 'yt5yujrt', null, null, 'gfddg', '21ewqrq');
INSERT INTO `person` VALUES ('13', 'sadwqeqe', 'gfhdhgf', 'ssadw@qq.com', 'sadadassadasddaq', '11111111', null, '0', '135165', '5dsa3d5', '1da8wd4a6', null, null, 'a35ds1a', '15da3d1a3');
INSERT INTO `person` VALUES ('14', 'helloman', '1302', 'helloman@qq.com', 'helloman', '123456', null, '0', '1456943876', '13924569321', '大学生', null, 'C:\\Users\\martsforever\\IdeaProjects\\WSJ-SAT\\out\\artifacts\\WSJ_SAT_war_exploded\\person_portraits\\海滩2.jpg', '游山玩水', 'ps，视频剪辑，图像处理');
INSERT INTO `person` VALUES ('15', '撒打我的娃', '发的鬼地方个', 'dwqqew@qq.com', '撒旦王企鹅', '123444', null, '0', '561351', '撒粉色', '额粉色粉色', null, 'C:\\sat\\person_portraits\\海滩1.jpg', '大大王', '关于教育机构');
INSERT INTO `person` VALUES ('16', 'sadasd', 'sadadsdsa', 'sadasds@qq.com', 'sadasdasddasdasd', '222222', null, '0', '21313141', 'asdsad', '', null, 'C:\\Users\\martsforever\\IdeaProjects\\WSJ-SAT\\out\\artifacts\\WSJ_SAT_war_exploded\\person_portraits\\sadasdasddasdasd', '', '');
INSERT INTO `person` VALUES ('17', 'wqeqe', '2214', 'sadwadwa@wq.sad', 'sadsad2113', 'ssssss', null, '0', '54646431', '', '', null, 'C:\\Users\\martsforever\\IdeaProjects\\WSJ-SAT\\out\\artifacts\\WSJ_SAT_war_exploded\\person_portraits\\sadsad2113jpg', '', '');
INSERT INTO `person` VALUES ('18', 'dgssfsd', '2114', 'd3a5w@qq.com', 'saafasfda', '44444444', null, '0', '435461', 'klsahdlk', 'lsdkjfalifowjalksjdd', null, 'person_portraits\\saafasfdajpg', 'kfhklajflakj', 'flksjlajals');
INSERT INTO `person` VALUES ('19', 'saddsa', 'dassdsa', 'dawd@qq.com', 'sadfaasfa', '212121', null, '0', '54313', 'sadsadsaads', 'tgfdhdfgd', null, 'person_portraits/sadfaasfa.jpg', 'sdadasdsa', 'sadasdaadsfas');
INSERT INTO `person` VALUES ('20', 'saddsa', 'dassdsa', 'dawd@qq.com', 'sadfaasfa', '212121', null, '0', '54313', 'sadsadsaads', 'tgfdhdfgd', null, 'person_portraits/sadfaasfa.jpg', 'sdadasdsa', 'sadasdaadsfas');
INSERT INTO `person` VALUES ('21', 'rose', '1302', 'rose@qq.com', 'rose', '111111', null, '0', '1456943878', 'rose', 'rose', null, 'person_portraits/rose.jpg', 'rose', 'rose');
INSERT INTO `person` VALUES ('22', 'qqqqq', 'qqqqq', 'qqqq@qq.com', 'qqqq', 'qqqqqq', null, '0', '64584685', '', '', null, 'person_portraits/qqqq.jpg', '', '');
INSERT INTO `person` VALUES ('23', 'kldajdliajwdal', 'sadads', 'sadasds@qq.com', 'dwauhdjkah', '444444', null, '0', '21313141', '', '', null, 'person_portraits/dwauhdjkah.jpg', '', '');
INSERT INTO `person` VALUES ('24', 'wwwwww', 'www', 'wwwwww@qq.com', 'wwww', 'wwwwww', null, '0', '21313141', '', '', null, 'person_portraits/wwww.jpg', '', '');
INSERT INTO `person` VALUES ('25', 'eeeeee', 'eeee', 'eeeeee@qq.com', 'eeeeee', 'eeeeee', null, '0', '865465', '', '', null, 'person_portraits/eeeeee.jpg', '', '');
INSERT INTO `person` VALUES ('26', 'eeeeee', 'eeee', 'eeeeee@qq.com', 'eeeeee', 'eeeeee', null, '0', '865465', '', '', null, 'person_portraits/eeeeee.jpg', '', '');
INSERT INTO `person` VALUES ('27', 'wqeeq', 'weqwew', 'yyyy@qqq.dsf', 'yyyyyy', 'yyyyyy', null, '0', '324423523', '', '', null, 'person_portraits/yyyyyy.jpg', '', '');
INSERT INTO `person` VALUES ('28', 'oooooo', 'ooo', 'ooo@qq.oo', 'oooooo', 'oooooo', null, '0', '93822979', '', '', null, 'person_portraits/oooooo.jpg', '', '');
INSERT INTO `person` VALUES ('29', 'wsj', '12314', 'wsj@qq.com', 'wsj', 'qq1111', null, '0', '2151244221', '', '', null, 'person_portraits/wsj.jpg', '', '');
INSERT INTO `person` VALUES ('30', 'sadsad', 'aasda', 'asdadsd@wqe.hjg', 'aaaaa', 'aaaaaa', null, '0', '3254354656', '', '', null, 'person_portraits/aaaaa.jpg', '', '');
INSERT INTO `person` VALUES ('31', '韦胜健', '1302', 'martsforever@aliyum.com', 'martsforever', 'qq450881199', null, '0', '1456943876', '13924569321', '吃藕丑', null, 'person_portraits/martsforever.jpg', 'lol，Javaweb，Android，IOS，图像处理', '没特长');
INSERT INTO `person` VALUES ('32', 'ananan', 'ananan', 'ananan@qq.gg', 'ananan', 'ananan', null, '0', '213435', '', '', null, 'person_portraits/ananan.jpg', '', '');
INSERT INTO `person` VALUES ('33', 'ananan', 'ananan', 'ananan@qq.gg', 'ananan', 'ananan', null, '0', '213435', '', '', null, 'person_portraits/ananan.jpg', '', '');
INSERT INTO `person` VALUES ('34', 'zhangran', 'aaaa', 'sadaw@sada.com', 'zhangran', 'qqqqqq', null, '0', '135412', '', '', null, 'person_portraits/zhangran.jpg', '', '');
INSERT INTO `person` VALUES ('35', '撒大大', '444', '4444@sakjld.sakldj', 'sadsafaf', '444444', null, '0', '465431', '', '', null, 'person_portraits/sadsafaf.jpg', '', '');
INSERT INTO `person` VALUES ('36', 'SADADSAD', '21214', 'nihhaoya@qq.com', 'nihaoya', '123456', null, '0', '327116', 'saafsad', 'zvzdvxvd', null, 'person_portraits/nihaoya.jpg', 'hgjfhgfh', 'dstewtwet');
INSERT INTO `person` VALUES ('37', 'akjsdla', '21412', 'skjah@jskha.com', 'kaka', '111111', null, '0', '21413241', 'safafaf', '', null, 'person_portraits/kaka.jpg', 'fdgdgfd', 'dhghfh');
INSERT INTO `person` VALUES ('38', 'sadas', '21341', 'dadwa@qq.com', 'buzhidao', '111111', '12354678955', '0', '65431253', '324544fdsf', 'hgmgvf', null, 'person_portraits/buzhidao.jpg', 'sdfsdfsd', 'xvdvxdv');
INSERT INTO `person` VALUES ('39', '啥快递很快', '1342', 'adw@akdh.com', 'budong', '111111', '13242342343', '0', '2142353634', '微信', '个人简介', null, 'person_portraits/budong.jpg', '兴趣爱好', '特长');
INSERT INTO `person` VALUES ('40', 'dsfdfsd', '13213', 'sada@qq.gf', 'nihao', '111111', '13244566575', '0', '3425246', 'sadsad', 'fdgdf', null, 'person_portraits/nihao.jpg', 'saasd', 'dfsg');
INSERT INTO `person` VALUES ('41', 'commit', '132', 'adawd@adad.jdh', 'commit', 'commit', '13244556789', '0', '2133214', '435355', '324234', null, 'person_portraits/commit.jpg', '657567', '645646');
INSERT INTO `person` VALUES ('42', 'sdfaf', '2131', 'dawda@qq.com', 'yaya', '111111', '13453466785', '0', '32423525', 'fdgdfg', '243253fsfd', null, 'person_portraits/yaya.jpg', 'dfgdg', 'ewfesa');
INSERT INTO `person` VALUES ('43', 'wsj', '1302', 'marts_forever@163.com', 'marts_forever', 'qq450881199', '13924569321', '0', '1456943876', '1392569321', '文能挂机喷队友，武能越塔送人头。进可孤身一挑五，退可坐等二十投。前能飞脚救残敌，后能放墙堵队友。静则百年不见人，动则千里送超神。英勇闪现送一血，卖起队友不回头。顺风浪，逆风投。问君能有几多愁，恰似五人四坑20投', null, 'person_portraits/marts_forever.jpg', '啦啦啦啦，我喜欢打撸', '没什么特长');
INSERT INTO `person` VALUES ('44', 'sadasad', 'sadasad', 'sadasd@af.fsg', 'sadasad', '111111', '13425255755', '0', '2114153', '', '', null, 'person_portraits/sadasad.jpg', '', '');
INSERT INTO `person` VALUES ('45', 'haha', null, 'zhaoliu@qq.com', 'zhaoliu', '123456', '1234567891234', '0', '324324243', '1234567891234', '没有介绍', '干事', '#', '喜欢打篮球，游戏什么的', '前端设计');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `introduce` varchar(255) default NULL,
  `downloadUrl` varchar(255) default NULL,
  `time` varchar(255) default NULL,
  `size` varchar(255) default NULL,
  `downloadTimes` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '高数学习资料', '没有介绍', '#', 'Wed Jan 13 20:01:44 CST 2016', '300.0', '0');

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `teamSize` int(11) default NULL,
  `currentSize` int(11) default NULL,
  `introduce` varchar(255) default NULL,
  `logo` varchar(255) default NULL,
  `ministerId` int(11) default NULL,
  `expiryDate` varchar(255) default NULL,
  `publishTime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('1', '第一个团队', '10', '3', '没有介绍', '#', '3', '2015-11-11', '2015-11-11');
INSERT INTO `team` VALUES ('2', '第二个团队', '5', '4', '没有介绍2', '#2', '4', '2015-11-11', '2015-12-12');
INSERT INTO `team` VALUES ('3', '芒果团队', '5', '5', '一个专注于帮助聋哑人的大学生团队', '#', '5', '2015-11-11', '2015-7-9');
INSERT INTO `team` VALUES ('102', '芒果团队1', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('103', '芒果团队2', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('104', '芒果团队3', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('105', '芒果团队4', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('106', '芒果团队5', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('107', '芒果团队6', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('108', '芒果团队7', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('109', '芒果团队8', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('110', '芒果团队9', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('111', '芒果团队10', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('112', '芒果团队1', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:59 CST 2016');
INSERT INTO `team` VALUES ('113', '芒果团队2', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('114', '芒果团队3', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('115', '芒果团队4', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('116', '芒果团队5', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('117', '芒果团队6', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('118', '芒果团队7', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('119', '芒果团队8', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('120', '芒果团队9', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('121', '芒果团队10', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('122', '芒果团队1', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('123', '芒果团队2', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('124', '芒果团队3', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('125', '芒果团队4', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('126', '芒果团队5', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('127', '芒果团队6', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('128', '芒果团队7', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('129', '芒果团队8', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('130', '芒果团队9', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('131', '芒果团队10', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');

-- ----------------------------
-- Table structure for team_person
-- ----------------------------
DROP TABLE IF EXISTS `team_person`;
CREATE TABLE `team_person` (
  `id` int(11) NOT NULL auto_increment,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `team_id` (`team_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team_person
-- ----------------------------
INSERT INTO `team_person` VALUES ('1', '1', '3');
INSERT INTO `team_person` VALUES ('2', '1', '4');
INSERT INTO `team_person` VALUES ('3', '2', '4');
INSERT INTO `team_person` VALUES ('4', '2', '5');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `ID` int(11) NOT NULL auto_increment,
  `password` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL auto_increment,
  `password` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
