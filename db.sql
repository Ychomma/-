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

 Date: 01/12/2022 12:32:58
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
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (30, 'admin', '15880051262', '1300161364', '2022-11-24 22:13:03', NULL, '123456', 1, 0, NULL);
INSERT INTO `admin` VALUES (31, 'chen', '18859063781', NULL, '2022-11-25 01:01:44', '2022-11-30 20:32:19', '0402', 1, 0, NULL);
INSERT INTO `admin` VALUES (38, '陈培杰', '15880051262', NULL, '2022-11-28 21:17:43', NULL, '123456', 1, 1, '032002503');
INSERT INTO `admin` VALUES (39, '陈秋屹', '123', NULL, '2022-11-29 00:26:57', NULL, '123456', 1, 1, '032002504');
INSERT INTO `admin` VALUES (40, 'cccc', '18859063781', '123', '2022-11-29 15:17:36', '2022-11-30 20:32:19', '123', 1, 0, NULL);
INSERT INTO `admin` VALUES (41, '曹翊民', '15880051262', NULL, '2022-11-30 18:48:43', NULL, '123456', 1, 1, '032002501');
INSERT INTO `admin` VALUES (42, '陈朝腾', '123', NULL, '2022-11-30 18:50:10', NULL, '123456', 1, 1, '032002502');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cname` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `starttime` date NULL DEFAULT NULL,
  `endtime` date NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `flag` int NULL DEFAULT 0,
  PRIMARY KEY (`cno`, `tno`) USING BTREE,
  UNIQUE INDEX `coucno`(`cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '11', '数据库', '文楼', '2022-11-01', '2022-11-30', '666', 0);
INSERT INTO `course` VALUES ('2', '44', '操作系统', '东三', '2022-11-02', '2022-11-25', '555', 0);
INSERT INTO `course` VALUES ('4', '33', '大学语文', NULL, NULL, NULL, NULL, 0);
INSERT INTO `course` VALUES ('5', '33', '高等数学', '东三', NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('999', '33', '日语入门', '东三', '2022-11-01', '2022-11-29', '999', 1);

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `sno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grade` int NULL DEFAULT NULL,
  PRIMARY KEY (`sno`, `cno`, `tno`) USING BTREE,
  UNIQUE INDEX `SCno`(`sno`, `cno`) USING BTREE,
  INDEX `cno`(`cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('032002503', '1', '11', 90);
INSERT INTO `sc` VALUES ('032002503', '2', '44', 80);
INSERT INTO `sc` VALUES ('032002503', '4', '33', NULL);
INSERT INTO `sc` VALUES ('032002503', '5', '33', NULL);
INSERT INTO `sc` VALUES ('032002503', '999', '33', NULL);

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
  `schooltime` date NULL DEFAULT NULL,
  PRIMARY KEY (`sno`) USING BTREE,
  UNIQUE INDEX `stusno`(`sno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('032002501', '曹翊民', '男', 25, '计算机科学与技术', '15880051262', '福州大学\n', '2022-11-01');
INSERT INTO `student` VALUES ('032002502', '陈朝腾', '男', 20, '计算机科学与技术', '123', '66', '2022-10-31');
INSERT INTO `student` VALUES ('032002503', '陈培杰', '男', 21, '人工智能', '15880051262', '福州大学', '2022-11-08');
INSERT INTO `student` VALUES ('032002504', '陈秋屹', '女', 18, '计算机科学与技术', '1233', '福州大学', '2022-11-23');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tname` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tno`) USING BTREE,
  UNIQUE INDEX `t1`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('11', '丁老师', '12345678910', '1300161364@qq.co', 'https://baike.baidu.com/item/%E7%99%BD%E6%B8%85%E6%BA%90/20627354?fr=aladdin');
INSERT INTO `teacher` VALUES ('22', '白老师', '11111113', NULL, NULL);
INSERT INTO `teacher` VALUES ('33', '陈老师', '123', NULL, NULL);
INSERT INTO `teacher` VALUES ('44', '江老师', '44444444444', NULL, NULL);

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
