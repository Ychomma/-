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

 Date: 25/11/2022 15:48:51
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_key`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (30, 'admin', '15880051262', '1300161364', '2022-11-24 22:13:03', NULL, '123456', 1);
INSERT INTO `admin` VALUES (31, 'chen', '18859063781', NULL, '2022-11-25 01:01:44', '2022-11-25 15:18:23', '0402', 1);

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
INSERT INTO `course` VALUES ('3', '高等数学');
INSERT INTO `course` VALUES ('4', '大学物理');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `sno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grade` int NULL DEFAULT 0,
  PRIMARY KEY (`sno`, `cno`) USING BTREE,
  UNIQUE INDEX `SCno`(`sno`, `cno`) USING BTREE,
  INDEX `cno`(`cno`) USING BTREE,
  CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sc_ibfk_2` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('001', '1', 100);
INSERT INTO `sc` VALUES ('001', '2', 99);
INSERT INTO `sc` VALUES ('002', '3', 80);
INSERT INTO `sc` VALUES ('003', '4', 85);
INSERT INTO `sc` VALUES ('004', '2', 88);
INSERT INTO `sc` VALUES ('005', '2', 88);
INSERT INTO `sc` VALUES ('006', '3', 60);
INSERT INTO `sc` VALUES ('007', '1', 95);
INSERT INTO `sc` VALUES ('032002503', '1', 100);
INSERT INTO `sc` VALUES ('999', '1', 100);

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
INSERT INTO `student` VALUES ('001', '张三', '男', 20, 'CS', NULL, NULL);
INSERT INTO `student` VALUES ('002', '李四', '女', 23, 'MBA', NULL, NULL);
INSERT INTO `student` VALUES ('003', '王五', '男', 19, 'EE', NULL, NULL);
INSERT INTO `student` VALUES ('004', '刘明', '女', 20, 'CS', NULL, NULL);
INSERT INTO `student` VALUES ('005', '许华', '男', 22, 'ME', NULL, NULL);
INSERT INTO `student` VALUES ('006', '秋赤', '男', 19, 'MS', NULL, NULL);
INSERT INTO `student` VALUES ('007', '赵四', '男', 18, 'CS', NULL, NULL);
INSERT INTO `student` VALUES ('032002503', '陈培杰', '男', 20, 'cs', '12345678910', '福州大学');
INSERT INTO `student` VALUES ('999', 'test', '男', 10, 'test', NULL, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tname` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  UNIQUE INDEX `t1`(`phone`) USING BTREE,
  INDEX `Cno`(`cno`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
CREATE TRIGGER `tri` AFTER INSERT ON `student` FOR EACH ROW INSERT INTO sc VALUES(NEW.sno,'1',100)
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
