/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : exampython

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-14 00:57:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_cars
-- ----------------------------
DROP TABLE IF EXISTS `t_cars`;
CREATE TABLE `t_cars` (
  `cn` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `color` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cn`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_cars
-- ----------------------------
INSERT INTO `t_cars` VALUES ('1', 'CAR A', 'RED');
INSERT INTO `t_cars` VALUES ('2', 'CAR B', 'BLACK');
INSERT INTO `t_cars` VALUES ('3', 'CAR C', 'GREEN');
INSERT INTO `t_cars` VALUES ('4', 'CAR D', 'YELLOW');
INSERT INTO `t_cars` VALUES ('5', 'CAR E', 'RED');
INSERT INTO `t_cars` VALUES ('11', 'dafdasf', 'BLUE');
INSERT INTO `t_cars` VALUES ('12', 'dfsdf', 'GREEN');
INSERT INTO `t_cars` VALUES ('13', 'fgsdfgfs', 'RED');
INSERT INTO `t_cars` VALUES ('14', 'zgfgsfdg', 'RED');
INSERT INTO `t_cars` VALUES ('15', 'sgsfdg', 'BLACK');
INSERT INTO `t_cars` VALUES ('16', 'safdfsdf', 'RED');
INSERT INTO `t_cars` VALUES ('17', 'adsfasdf', 'RED');

-- ----------------------------
-- Procedure structure for sp_cars
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_cars`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cars`()
BEGIN
	#Routine body goes here...
SELECT
t_cars.cn,
t_cars.`name`,
t_cars.color
FROM
t_cars
ORDER BY
t_cars.cn ASC;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_getcar
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_getcar`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcar`(IN `ID`  varchar(100))
BEGIN
	#Routine body goes here...
SELECT
t_cars.cn,
t_cars.`name`,
t_cars.color
FROM
t_cars
WHERE
t_cars.color = ID
ORDER BY
t_cars.cn ASC;


END
;;
DELIMITER ;
