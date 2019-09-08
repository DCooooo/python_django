/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : day71_page

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 08/09/2019 19:53:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add book', 7, 'add_book');
INSERT INTO `auth_permission` VALUES (26, 'Can change book', 7, 'change_book');
INSERT INTO `auth_permission` VALUES (27, 'Can delete book', 7, 'delete_book');
INSERT INTO `auth_permission` VALUES (28, 'Can view book', 7, 'view_book');
INSERT INTO `auth_permission` VALUES (29, 'Can add dept', 8, 'add_dept');
INSERT INTO `auth_permission` VALUES (30, 'Can change dept', 8, 'change_dept');
INSERT INTO `auth_permission` VALUES (31, 'Can delete dept', 8, 'delete_dept');
INSERT INTO `auth_permission` VALUES (32, 'Can view dept', 8, 'view_dept');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1030, '书籍1');
INSERT INTO `book` VALUES (1031, '书籍2');
INSERT INTO `book` VALUES (1032, '书籍3');
INSERT INTO `book` VALUES (1033, '书籍4');
INSERT INTO `book` VALUES (1034, '书籍5');
INSERT INTO `book` VALUES (1035, '书籍6');
INSERT INTO `book` VALUES (1036, '书籍7');
INSERT INTO `book` VALUES (1037, '书籍8');
INSERT INTO `book` VALUES (1038, '书籍9');
INSERT INTO `book` VALUES (1039, '书籍10');
INSERT INTO `book` VALUES (1040, '书籍11');
INSERT INTO `book` VALUES (1041, '书籍12');
INSERT INTO `book` VALUES (1042, '书籍13');
INSERT INTO `book` VALUES (1043, '书籍14');
INSERT INTO `book` VALUES (1044, '书籍15');
INSERT INTO `book` VALUES (1045, '书籍16');
INSERT INTO `book` VALUES (1046, '书籍17');
INSERT INTO `book` VALUES (1047, '书籍18');
INSERT INTO `book` VALUES (1048, '书籍19');
INSERT INTO `book` VALUES (1049, '书籍20');
INSERT INTO `book` VALUES (1050, '书籍21');
INSERT INTO `book` VALUES (1051, '书籍22');
INSERT INTO `book` VALUES (1052, '书籍23');
INSERT INTO `book` VALUES (1053, '书籍24');
INSERT INTO `book` VALUES (1054, '书籍25');
INSERT INTO `book` VALUES (1055, '书籍26');
INSERT INTO `book` VALUES (1056, '书籍27');
INSERT INTO `book` VALUES (1057, '书籍28');
INSERT INTO `book` VALUES (1058, '书籍29');
INSERT INTO `book` VALUES (1059, '书籍30');
INSERT INTO `book` VALUES (1060, '书籍31');
INSERT INTO `book` VALUES (1061, '书籍32');
INSERT INTO `book` VALUES (1062, '书籍33');
INSERT INTO `book` VALUES (1063, '书籍34');
INSERT INTO `book` VALUES (1064, '书籍35');
INSERT INTO `book` VALUES (1065, '书籍36');
INSERT INTO `book` VALUES (1066, '书籍37');
INSERT INTO `book` VALUES (1067, '书籍38');
INSERT INTO `book` VALUES (1068, '书籍39');
INSERT INTO `book` VALUES (1069, '书籍40');
INSERT INTO `book` VALUES (1070, '书籍41');
INSERT INTO `book` VALUES (1071, '书籍42');
INSERT INTO `book` VALUES (1072, '书籍43');
INSERT INTO `book` VALUES (1073, '书籍44');
INSERT INTO `book` VALUES (1074, '书籍45');
INSERT INTO `book` VALUES (1075, '书籍46');
INSERT INTO `book` VALUES (1076, '书籍47');
INSERT INTO `book` VALUES (1077, '书籍48');
INSERT INTO `book` VALUES (1078, '书籍49');
INSERT INTO `book` VALUES (1079, '书籍50');
INSERT INTO `book` VALUES (1080, '书籍51');
INSERT INTO `book` VALUES (1081, '书籍52');
INSERT INTO `book` VALUES (1082, '书籍53');
INSERT INTO `book` VALUES (1083, '书籍54');
INSERT INTO `book` VALUES (1084, '书籍55');
INSERT INTO `book` VALUES (1085, '书籍56');
INSERT INTO `book` VALUES (1086, '书籍57');
INSERT INTO `book` VALUES (1087, '书籍58');
INSERT INTO `book` VALUES (1088, '书籍59');
INSERT INTO `book` VALUES (1089, '书籍60');
INSERT INTO `book` VALUES (1090, '书籍61');
INSERT INTO `book` VALUES (1091, '书籍62');
INSERT INTO `book` VALUES (1092, '书籍63');
INSERT INTO `book` VALUES (1093, '书籍64');
INSERT INTO `book` VALUES (1094, '书籍65');
INSERT INTO `book` VALUES (1095, '书籍66');
INSERT INTO `book` VALUES (1096, '书籍67');
INSERT INTO `book` VALUES (1097, '书籍68');
INSERT INTO `book` VALUES (1098, '书籍69');
INSERT INTO `book` VALUES (1099, '书籍70');
INSERT INTO `book` VALUES (1100, '书籍71');
INSERT INTO `book` VALUES (1101, '书籍72');
INSERT INTO `book` VALUES (1102, '书籍73');
INSERT INTO `book` VALUES (1103, '书籍74');
INSERT INTO `book` VALUES (1104, '书籍75');
INSERT INTO `book` VALUES (1105, '书籍76');
INSERT INTO `book` VALUES (1106, '书籍77');
INSERT INTO `book` VALUES (1107, '书籍78');
INSERT INTO `book` VALUES (1108, '书籍79');
INSERT INTO `book` VALUES (1109, '书籍80');
INSERT INTO `book` VALUES (1110, '书籍81');
INSERT INTO `book` VALUES (1111, '书籍82');
INSERT INTO `book` VALUES (1112, '书籍83');
INSERT INTO `book` VALUES (1113, '书籍84');
INSERT INTO `book` VALUES (1114, '书籍85');
INSERT INTO `book` VALUES (1115, '书籍86');
INSERT INTO `book` VALUES (1116, '书籍87');
INSERT INTO `book` VALUES (1117, '书籍88');
INSERT INTO `book` VALUES (1118, '书籍89');
INSERT INTO `book` VALUES (1119, '书籍90');
INSERT INTO `book` VALUES (1120, '书籍91');
INSERT INTO `book` VALUES (1121, '书籍92');
INSERT INTO `book` VALUES (1122, '书籍93');
INSERT INTO `book` VALUES (1123, '书籍94');
INSERT INTO `book` VALUES (1124, '书籍95');
INSERT INTO `book` VALUES (1125, '书籍96');
INSERT INTO `book` VALUES (1126, '书籍97');
INSERT INTO `book` VALUES (1127, '书籍98');
INSERT INTO `book` VALUES (1128, '书籍99');
INSERT INTO `book` VALUES (1129, '书籍100');
INSERT INTO `book` VALUES (1130, '书籍101');
INSERT INTO `book` VALUES (1131, '书籍102');
INSERT INTO `book` VALUES (1132, '书籍103');
INSERT INTO `book` VALUES (1133, '书籍104');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (3, 'AI部');
INSERT INTO `dept` VALUES (1, '人事部');
INSERT INTO `dept` VALUES (2, '科技部');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (7, 'app01', 'book');
INSERT INTO `django_content_type` VALUES (8, 'app01', 'dept');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-08-09 14:46:51.607362');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-08-09 14:46:54.670636');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-08-09 14:47:04.489015');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-08-09 14:47:06.907627');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-08-09 14:47:06.996575');
INSERT INTO `django_migrations` VALUES (6, 'app01', '0001_initial', '2019-08-09 14:47:07.469314');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2019-08-09 14:47:09.329254');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2019-08-09 14:47:10.669511');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2019-08-09 14:47:10.872395');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2019-08-09 14:47:11.025287');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2019-08-09 14:47:12.312554');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2019-08-09 14:47:12.365543');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2019-08-09 14:47:12.478456');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2019-08-09 14:47:13.881679');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2019-08-09 14:47:14.982053');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_alter_group_name_max_length', '2019-08-09 14:47:15.175943');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0011_update_proxy_permissions', '2019-08-09 14:47:15.256871');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2019-08-09 14:47:15.651640');
INSERT INTO `django_migrations` VALUES (19, 'app01', '0002_dept', '2019-08-10 01:49:18.547426');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
