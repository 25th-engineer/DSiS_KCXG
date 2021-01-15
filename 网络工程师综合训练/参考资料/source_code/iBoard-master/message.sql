/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 26/07/2020 10:33:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` char(254) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `author` char(24) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` VALUES (8, '你好啊', 'dwad', NULL);
INSERT INTO `message` VALUES (9, '加油 加油 👍👍👍👍👍', '威威', NULL);
INSERT INTO `message` VALUES (12, '加油 @', '威威', NULL);
INSERT INTO `message` VALUES (13, '你是最棒的 不要放弃哦', '', NULL);
INSERT INTO `message` VALUES (14, '大兄弟 你好啊', '😊', NULL);
INSERT INTO `message` VALUES (15, '曾经有一份真诚的爱情放在我面前，我没有珍惜，等我失去的时候我才后悔莫及，人世间最痛苦的事莫过于此。 \r\n如果上天能够给我一个再来一次的机会，我会对那个女孩子说三个字：我爱你。 \r\n如果非要在这份爱上加上一个期限，我希望是…… \r\n一万年', 'monkey', NULL);
INSERT INTO `message` VALUES (16, '我的意中人是个盖世英雄，有一天他会踩着七色云彩来娶我，我猜中了前头可我猜不着这结局。', '露娜', NULL);
INSERT INTO `message` VALUES (17, '我的意中人是一个盖世英雄。 \r\n上天既然安排他拔出我的紫青宝剑， \r\n他一定是个不平凡的人， \r\n错不了！ \r\n我知道有一天他会在一个万众瞩目的情况下出现， \r\n身披金甲圣衣， \r\n脚踏七彩祥云来娶我！', '露娜', NULL);
INSERT INTO `message` VALUES (18, '你好啊', '海绵宝宝', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
