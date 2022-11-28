/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : db

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 29/11/2022 00:21:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系方式',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` datetime NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `flag` tinyint(1) NULL DEFAULT 0,
  `sno` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_key`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (30, 'admin', '15880051262', '1300161364', '2022-11-24 22:13:03', NULL, '123456', 1, 0, NULL);
INSERT INTO `admin` VALUES (31, 'chen', '18859063781', NULL, '2022-11-25 01:01:44', '2022-11-28 22:33:18', '0402', 1, 0, NULL);
INSERT INTO `admin` VALUES (38, '陈培杰', '15880051262', NULL, '2022-11-28 21:17:43', NULL, '123456', 1, 1, '032002503');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cname` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`cno`) USING BTREE,
  UNIQUE INDEX `coucno`(`cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '数据库');
INSERT INTO `course` VALUES ('2', '操作系统');
INSERT INTO `course` VALUES ('4', '大学语文');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `sno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grade` int NULL DEFAULT NULL,
  `tno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sno`, `cno`, `tno`) USING BTREE,
  UNIQUE INDEX `SCno`(`sno`, `cno`) USING BTREE,
  INDEX `cno`(`cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('032002503', '2', NULL, '11');
INSERT INTO `sc` VALUES ('032002503', '4', NULL, '44');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sname` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ssex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sage` smallint NULL DEFAULT NULL,
  `sdept` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sno`) USING BTREE,
  UNIQUE INDEX `stusno`(`sno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('032002503', '陈培杰', '男', 21, 'cs', '15880051262', '福州大学');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tname` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tno`) USING BTREE,
  UNIQUE INDEX `t1`(`phone`) USING BTREE,
  INDEX `Cno`(`cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('11', '2', '丁老师', '12345678910');
INSERT INTO `teacher` VALUES ('22', '1', '白老师', '11111111111');
INSERT INTO `teacher` VALUES ('33', '3', '谢老师', '33333333333');
INSERT INTO `teacher` VALUES ('44', '4', '江老师', '44444444444');

-- ----------------------------
-- View structure for stu_info
-- ----------------------------
DROP VIEW IF EXISTS `stu_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `stu_info` AS select `student`.`sno` AS `sno`,`student`.`sname` AS `sname`,`student`.`ssex` AS `ssex`,`student`.`sage` AS `Sage`,`student`.`sdept` AS `sdept` from `student`;

-- ----------------------------
-- Procedure structure for GetStudentById
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetStudentById`;
delimiter ;;
CREATE PROCEDURE `GetStudentById`(IN student_no char(9))
SELECT * FROM student WHERE sno=student_no
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `tri`;
delimiter ;;
CREATE TRIGGER `tri` AFTER INSERT ON `student` FOR EACH ROW INSERT INTO admin(username,`password`,phone,flag,sno) VALUES(NEW.sname,"123456",NEW.phone,1,NEW.sno)
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
