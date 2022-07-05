/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : file_manager

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 05/07/2022 14:36:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file_tags
-- ----------------------------
DROP TABLE IF EXISTS `file_tags`;
CREATE TABLE `file_tags`  (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `file_id` int NULL DEFAULT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_tags
-- ----------------------------
INSERT INTO `file_tags` VALUES (1, 1, 'deep learning', 0);
INSERT INTO `file_tags` VALUES (2, 2, 'useful tool', 0);

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files`  (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `saved_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `depth` int NULL DEFAULT NULL,
  `father_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES (1, 'bbb.md', 'bbb.md(for test)', 2, '../root/folder_aaa', '2022-07-04 17:15:39', 0);
INSERT INTO `files` VALUES (2, 'aaa.md', 'aaa.md(same)', 1, '../root', '2022-07-04 17:16:34', 0);
INSERT INTO `files` VALUES (3, '存储层设计.txt', '存储层设计/存储层设计/1.txt', 3, '../root/folder_aaa/folder_bbb', '2022-07-05 14:29:17', 0);

SET FOREIGN_KEY_CHECKS = 1;
