/*
Navicat MySQL Data Transfer

Source Server         : Book
Source Server Version : 50718
Source Host           : :3306
Source Database       : sugarcane

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-06-25 10:26:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `province` char(255) DEFAULT NULL,
  `city` char(255) DEFAULT NULL,
  `area` char(255) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for `adminlogin`
-- ----------------------------
DROP TABLE IF EXISTS `adminlogin`;
CREATE TABLE `adminlogin` (
  `adminID` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` char(255) DEFAULT NULL,
  `password` char(255) DEFAULT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminlogin
-- ----------------------------

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseID` int(255) NOT NULL AUTO_INCREMENT,
  `courseName` char(255) DEFAULT NULL,
  `courseBrief` char(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `phoneNumber` char(255) DEFAULT NULL,
  `introductionImg1` char(255) DEFAULT NULL,
  `introductionImg2` char(255) DEFAULT NULL,
  `introductionImg3` char(255) DEFAULT NULL,
  `video` char(255) DEFAULT NULL,
  `sellerID` int(11) DEFAULT NULL,
  `sellerCourseTypeId` int(11) DEFAULT NULL,
  `pub_publicTypeId` int(11) DEFAULT NULL,
  `teacher` char(255) DEFAULT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for `coursetype`
-- ----------------------------
DROP TABLE IF EXISTS `coursetype`;
CREATE TABLE `coursetype` (
  `courseTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `courseTypeName` char(255) NOT NULL,
  PRIMARY KEY (`courseTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursetype
-- ----------------------------
INSERT INTO `coursetype` VALUES ('1', '书法');
INSERT INTO `coursetype` VALUES ('2', '舞蹈');
INSERT INTO `coursetype` VALUES ('3', '音乐');
INSERT INTO `coursetype` VALUES ('4', '体育');
INSERT INTO `coursetype` VALUES ('5', '形象管理');

-- ----------------------------
-- Table structure for `evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `evaluateID` int(11) NOT NULL AUTO_INCREMENT,
  `courseID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `evaluateImg` char(255) DEFAULT NULL,
  `render` int(11) DEFAULT NULL,
  PRIMARY KEY (`evaluateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for `gradecondition`
-- ----------------------------
DROP TABLE IF EXISTS `gradecondition`;
CREATE TABLE `gradecondition` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `questionID` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `correctAnswer` varchar(255) DEFAULT NULL,
  `questionGrade` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gradecondition
-- ----------------------------

-- ----------------------------
-- Table structure for `gradelevel`
-- ----------------------------
DROP TABLE IF EXISTS `gradelevel`;
CREATE TABLE `gradelevel` (
  `grade` int(11) DEFAULT NULL,
  `level` char(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `time` char(255) DEFAULT NULL,
  `publicCourseTypeID` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gradelevel
-- ----------------------------

-- ----------------------------
-- Table structure for `publiccoursetype`
-- ----------------------------
DROP TABLE IF EXISTS `publiccoursetype`;
CREATE TABLE `publiccoursetype` (
  `publicTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `publicTypeName` char(255) DEFAULT NULL,
  `hidden` int(11) DEFAULT NULL,
  `courseTypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`publicTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publiccoursetype
-- ----------------------------
INSERT INTO `publiccoursetype` VALUES ('1', '楷书', '0', '1');
INSERT INTO `publiccoursetype` VALUES ('2', '隶书', '0', '1');
INSERT INTO `publiccoursetype` VALUES ('3', '行书', '0', '1');

-- ----------------------------
-- Table structure for `questionbank`
-- ----------------------------
DROP TABLE IF EXISTS `questionbank`;
CREATE TABLE `questionbank` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `questionStem` varchar(255) DEFAULT NULL,
  `options` char(255) DEFAULT NULL,
  `answer` char(11) DEFAULT NULL,
  `courseTypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questionbank
-- ----------------------------

-- ----------------------------
-- Table structure for `relationship`
-- ----------------------------
DROP TABLE IF EXISTS `relationship`;
CREATE TABLE `relationship` (
  `powerID` int(11) NOT NULL DEFAULT '0',
  `partID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`powerID`,`partID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relationship
-- ----------------------------

-- ----------------------------
-- Table structure for `sellercoursetype`
-- ----------------------------
DROP TABLE IF EXISTS `sellercoursetype`;
CREATE TABLE `sellercoursetype` (
  `sellerCourseTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `courseTypeName2` char(255) DEFAULT NULL,
  `sellerID` int(11) DEFAULT NULL,
  `publicCourseTypeID` int(11) DEFAULT NULL,
  `hidden` int(11) DEFAULT NULL,
  PRIMARY KEY (`sellerCourseTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sellercoursetype
-- ----------------------------

-- ----------------------------
-- Table structure for `sellerinfo`
-- ----------------------------
DROP TABLE IF EXISTS `sellerinfo`;
CREATE TABLE `sellerinfo` (
  `sellerID` int(11) NOT NULL AUTO_INCREMENT,
  `sellerName` char(255) DEFAULT NULL,
  `sellerEmail` char(255) DEFAULT NULL,
  `sellerPhoneNumber` char(255) DEFAULT NULL,
  `brief` char(255) DEFAULT NULL,
  `numberOfEmployees` int(11) DEFAULT NULL,
  `educationBureauApproved` char(255) DEFAULT NULL,
  `proofOfHouse` char(255) DEFAULT NULL,
  `fireSafetyCertificate` char(255) DEFAULT NULL,
  `businessLisense` varchar(255) DEFAULT NULL,
  `address_province` char(255) DEFAULT NULL,
  `address_city` char(255) DEFAULT NULL,
  `address_area` char(255) DEFAULT NULL,
  `address_detail` char(255) DEFAULT NULL,
  `qualified` int(11) DEFAULT NULL,
  PRIMARY KEY (`sellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sellerinfo
-- ----------------------------
INSERT INTO `sellerinfo` VALUES ('1', '??????', '47835329@qq.com', '15832189867', 'sahdauohhfsiofsi', null, '??????eba.jpg', '??????poh.jpg', '??????fsc.jpg', '??????bl.jpg', '??', '????', '???', null, '0');
INSERT INTO `sellerinfo` VALUES ('2', '??????', '478235329@qq.com', '15832186754', 'hfoshfsodfh', null, '??????eba.jpg', '??????poh.jpg', '??????fsc.jpg', '??????bl.jpg', '??', '???', '???', null, '0');

-- ----------------------------
-- Table structure for `sellerlogin`
-- ----------------------------
DROP TABLE IF EXISTS `sellerlogin`;
CREATE TABLE `sellerlogin` (
  `sellerID` int(11) NOT NULL AUTO_INCREMENT,
  `sellerLoginName` char(255) DEFAULT NULL,
  `password` char(255) DEFAULT NULL,
  `lastTime` char(255) DEFAULT NULL,
  `lastIP` char(255) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `forbid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sellerlogin
-- ----------------------------
INSERT INTO `sellerlogin` VALUES ('1', '??????', '162c7333e807c2dd68505396a2e453e12215239394912040', '2018-06-25 08:44:29', '127.0.0.1', '1', '0');
INSERT INTO `sellerlogin` VALUES ('2', '??????', '25781266f901e3141fb0509666cc54d9895d10ce2a054305', null, null, '2', '0');

-- ----------------------------
-- Table structure for `sellerloginlog`
-- ----------------------------
DROP TABLE IF EXISTS `sellerloginlog`;
CREATE TABLE `sellerloginlog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `sellerID` int(11) DEFAULT NULL,
  `time` char(255) DEFAULT NULL,
  `IP` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sellerloginlog
-- ----------------------------
INSERT INTO `sellerloginlog` VALUES ('1', '1', '2018-06-25 08:29:49', '127.0.0.1');
INSERT INTO `sellerloginlog` VALUES ('2', '1', '2018-06-25 08:44:29', '127.0.0.1');

-- ----------------------------
-- Table structure for `superadmin`
-- ----------------------------
DROP TABLE IF EXISTS `superadmin`;
CREATE TABLE `superadmin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` char(255) DEFAULT NULL,
  `password` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of superadmin
-- ----------------------------

-- ----------------------------
-- Table structure for `userclickcourse`
-- ----------------------------
DROP TABLE IF EXISTS `userclickcourse`;
CREATE TABLE `userclickcourse` (
  `uid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL,
  `courseTypeId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userclickcourse
-- ----------------------------

-- ----------------------------
-- Table structure for `usercollections`
-- ----------------------------
DROP TABLE IF EXISTS `usercollections`;
CREATE TABLE `usercollections` (
  `courseID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `collectTime` char(255) DEFAULT NULL,
  `collecting` int(11) DEFAULT NULL,
  `collected` int(11) DEFAULT NULL,
  `collectionCount` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usercollections
-- ----------------------------

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` char(255) DEFAULT NULL,
  `userEmail` char(255) DEFAULT NULL,
  `userGender` int(11) DEFAULT NULL,
  `userEducation` char(255) DEFAULT NULL,
  `userPhoneNumber` int(255) DEFAULT NULL,
  `birthday` char(255) DEFAULT NULL,
  `address_province` char(255) DEFAULT NULL,
  `address_city` char(255) DEFAULT NULL,
  `address_area` char(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `userlogin`
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin` (
  `userEmail` char(255) DEFAULT NULL,
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `password` char(255) DEFAULT NULL,
  `lastTime` char(255) DEFAULT NULL,
  `lastIP` char(255) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `forbid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlogin
-- ----------------------------

-- ----------------------------
-- Table structure for `userloginlog`
-- ----------------------------
DROP TABLE IF EXISTS `userloginlog`;
CREATE TABLE `userloginlog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `time` char(255) DEFAULT NULL,
  `IP` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userloginlog
-- ----------------------------
