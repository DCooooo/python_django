/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : bbs

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 08/09/2019 14:33:01
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add user', 6, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (22, 'Can change user', 6, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (23, 'Can delete user', 6, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (24, 'Can view user', 6, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (25, 'Can add article', 7, 'add_article');
INSERT INTO `auth_permission` VALUES (26, 'Can change article', 7, 'change_article');
INSERT INTO `auth_permission` VALUES (27, 'Can delete article', 7, 'delete_article');
INSERT INTO `auth_permission` VALUES (28, 'Can view article', 7, 'view_article');
INSERT INTO `auth_permission` VALUES (29, 'Can add blog', 8, 'add_blog');
INSERT INTO `auth_permission` VALUES (30, 'Can change blog', 8, 'change_blog');
INSERT INTO `auth_permission` VALUES (31, 'Can delete blog', 8, 'delete_blog');
INSERT INTO `auth_permission` VALUES (32, 'Can view blog', 8, 'view_blog');
INSERT INTO `auth_permission` VALUES (33, 'Can add tag', 9, 'add_tag');
INSERT INTO `auth_permission` VALUES (34, 'Can change tag', 9, 'change_tag');
INSERT INTO `auth_permission` VALUES (35, 'Can delete tag', 9, 'delete_tag');
INSERT INTO `auth_permission` VALUES (36, 'Can view tag', 9, 'view_tag');
INSERT INTO `auth_permission` VALUES (37, 'Can add comment', 10, 'add_comment');
INSERT INTO `auth_permission` VALUES (38, 'Can change comment', 10, 'change_comment');
INSERT INTO `auth_permission` VALUES (39, 'Can delete comment', 10, 'delete_comment');
INSERT INTO `auth_permission` VALUES (40, 'Can view comment', 10, 'view_comment');
INSERT INTO `auth_permission` VALUES (41, 'Can add category', 11, 'add_category');
INSERT INTO `auth_permission` VALUES (42, 'Can change category', 11, 'change_category');
INSERT INTO `auth_permission` VALUES (43, 'Can delete category', 11, 'delete_category');
INSERT INTO `auth_permission` VALUES (44, 'Can view category', 11, 'view_category');
INSERT INTO `auth_permission` VALUES (45, 'Can add article detail', 12, 'add_articledetail');
INSERT INTO `auth_permission` VALUES (46, 'Can change article detail', 12, 'change_articledetail');
INSERT INTO `auth_permission` VALUES (47, 'Can delete article detail', 12, 'delete_articledetail');
INSERT INTO `auth_permission` VALUES (48, 'Can view article detail', 12, 'view_articledetail');
INSERT INTO `auth_permission` VALUES (49, 'Can add article2 tag', 13, 'add_article2tag');
INSERT INTO `auth_permission` VALUES (50, 'Can change article2 tag', 13, 'change_article2tag');
INSERT INTO `auth_permission` VALUES (51, 'Can delete article2 tag', 13, 'delete_article2tag');
INSERT INTO `auth_permission` VALUES (52, 'Can view article2 tag', 13, 'view_article2tag');
INSERT INTO `auth_permission` VALUES (53, 'Can add article up down', 14, 'add_articleupdown');
INSERT INTO `auth_permission` VALUES (54, 'Can change article up down', 14, 'change_articleupdown');
INSERT INTO `auth_permission` VALUES (55, 'Can delete article up down', 14, 'delete_articleupdown');
INSERT INTO `auth_permission` VALUES (56, 'Can view article up down', 14, 'view_articleupdown');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL,
  `down_count` int(11) NOT NULL,
  `up_count` int(11) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `blog_article_category_id_7e38f15e_fk_blog_category_nid`(`category_id`) USING BTREE,
  INDEX `blog_article_user_id_5beb0cc1_fk_blog_userinfo_nid`(`user_id`) USING BTREE,
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_nid` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_article_user_id_5beb0cc1_fk_blog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (3, '用python写一个简单的文件上传', '摘要：用Pycharm创建一个django项目。目录如下： 1 <!DOCTYPE html> 2 <html lang=\"en\"> 3 <head> 4 <meta charset=\"UTF-8\"> 5 <title>upload</title> 6 </head> 7 <body> 8 {# 上传文件', '2019-07-24 07:25:00.000000', 3, 5, 6, 1, 1);
INSERT INTO `blog_article` VALUES (4, '逆向破解之160个CrackMe —— 017', 'CrackMe —— 017 160 CrackMe 是比较适合新手学习逆向破解的CrackMe的一个集合一共160个待逆向破解的程序 CrackMe:它们都是一些公开给别人尝试破解的小程序，制作 crackme 的人可能是程序员，想测试一下自己的软件保护技术，也可能是一位 cracker，想挑战一 ...', '2019-05-08 07:26:00.000000', 4, 6, 1, 0, 1);
INSERT INTO `blog_article` VALUES (5, '.net必问的面试题系列之面向对象', '这几天整理了一些常见的面试题，整理成一个系列给大家分享一下，机会是给有准备的人，面试造火箭，工作拧螺丝，不慌，共勉。 ...', '2019-08-12 07:26:00.000000', 4, 5, 0, 1, 2);
INSERT INTO `blog_article` VALUES (6, 'python', '\r\n	1.form组件的介绍\r\n\n\r\n	  在之前的开发过程中，我们都会用一种最传统的方式写form表单。我们以注册为例子，分别讲解传统方式和用form组件的区别。\r\n\n\r\n	  传统方式：\n\n\r\n	    首先创建一个注册页面，页面里面有form表单。\r\n\n\r\n	    然后form表单能够将数据...', '2019-09-05 15:28:41.486874', NULL, 5, 0, 0, 1);
INSERT INTO `blog_article` VALUES (46, '写文章了', '文章内容很麻烦哪哪哪哪...', '2019-09-08 13:52:10.278967', 46, 7, 0, 0, 0);

-- ----------------------------
-- Table structure for blog_article2tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article2tag`;
CREATE TABLE `blog_article2tag`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `blog_article2tag_article_id_tag_id_b0745f42_uniq`(`article_id`, `tag_id`) USING BTREE,
  INDEX `blog_article2tag_tag_id_389b9a96_fk_blog_tag_nid`(`tag_id`) USING BTREE,
  CONSTRAINT `blog_article2tag_article_id_753a2b60_fk_blog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_article2tag_tag_id_389b9a96_fk_blog_tag_nid` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article2tag
-- ----------------------------
INSERT INTO `blog_article2tag` VALUES (1, 3, 1);
INSERT INTO `blog_article2tag` VALUES (4, 4, 4);
INSERT INTO `blog_article2tag` VALUES (8, 46, 19);

-- ----------------------------
-- Table structure for blog_articledetail
-- ----------------------------
DROP TABLE IF EXISTS `blog_articledetail`;
CREATE TABLE `blog_articledetail`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `article_id`(`article_id`) USING BTREE,
  CONSTRAINT `blog_articledetail_article_id_56993a97_fk_blog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_articledetail
-- ----------------------------
INSERT INTO `blog_articledetail` VALUES (1, '<h1>母版的继承和使用　　</h1>\r\n<p>　　如果我们在开发一个网站的过程中，可能发现网站中除了部分内容不一样外，绝大部分内容都是一致的。如果每个页面我们都去一个一个写的话，那样的工作量就太大了。所以我们要学会使用母版和继承。</p>\r\n<p>　　首先，写一个母版，命名base.html，他代表网站中公共的部分。关键部分在13-15行。</p>\r\n<div class=\"cnblogs_code\">\r\n<pre><span style=\"color: #008080;\"> 1</span> &lt;!DOCTYPE html&gt;\r\n<span style=\"color: #008080;\"> 2</span> &lt;html lang=<span style=\"color: #800000;\">\"</span><span style=\"color: #800000;\">en</span><span style=\"color: #800000;\">\"</span>&gt;\r\n<span style=\"color: #008080;\"> 3</span> &lt;head&gt;\r\n<span style=\"color: #008080;\"> 4</span>     &lt;meta charset=<span style=\"color: #800000;\">\"</span><span style=\"color: #800000;\">UTF-8</span><span style=\"color: #800000;\">\"</span>&gt;\r\n<span style=\"color: #008080;\"> 5</span>     &lt;title&gt;母版&lt;/title&gt;\r\n<span style=\"color: #008080;\"> 6</span> &lt;/head&gt;\r\n<span style=\"color: #008080;\"> 7</span> &lt;body&gt;\r\n<span style=\"color: #008080;\"> 8</span> &lt;p&gt;\r\n<span style=\"color: #008080;\"> 9</span>     &lt;h1&gt;这是最上方&lt;/h1&gt;\r\n<span style=\"color: #008080;\">10</span>     &lt;hr&gt;\r\n<span style=\"color: #008080;\">11</span> &lt;/p&gt;\r\n<span style=\"color: #008080;\">12</span> &lt;P&gt;\r\n<span style=\"color: #008080;\">13</span>     {% block page-main %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">14</span>         {<span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 母版中被替换的地方 #}</span>\r\n<span style=\"color: #008080;\">15</span>     {% endblock %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">16</span>     &lt;hr&gt;\r\n<span style=\"color: #008080;\">17</span> &lt;/P&gt;\r\n<span style=\"color: #008080;\">18</span> &lt;P&gt;\r\n<span style=\"color: #008080;\">19</span>     &lt;h1&gt;这是最下方&lt;/h1&gt;\r\n<span style=\"color: #008080;\">20</span> &lt;/P&gt;\r\n<span style=\"color: #008080;\">21</span> &lt;/body&gt;\r\n<span style=\"color: #008080;\">22</span> &lt;/html&gt;</pre>\r\n</div>\r\n<p>　　接着，新建一个替换内容base_list.html。关键部分在第2行，以及5-7行。</p>\r\n<div class=\"cnblogs_code\">\r\n<pre><span style=\"color: #008080;\">1</span> {<span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 继承母版 #}</span>\r\n<span style=\"color: #008080;\">2</span> {% extends <span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">base.html</span><span style=\"color: #800000;\">\'</span> %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">3</span> \r\n<span style=\"color: #008080;\">4</span> {<span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 把自己页面的内容塞到母版相应的位置 #}</span>\r\n<span style=\"color: #008080;\">5</span> {% block page-main %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">6</span>     &lt;h1&gt;替换掉内容&lt;/h1&gt;\r\n<span style=\"color: #008080;\">7</span> {% endblock %}</pre>\r\n</div>\r\n<p>　　效果展示图：</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://img2018.cnblogs.com/blog/1583235/201907/1583235-20190722164525908-1599956089.png\" alt=\"\" /></p>\r\n<p>　　母版和继承不仅仅可以对html页面内容进行替换，<em><strong>还可以对js和css进行替换。</strong></em></p>\r\n<h1><em><strong>组件的使用</strong></em></h1>\r\n<p>　　一般来说，每个网站都有一个公共的导航栏，这些导航栏都是母版里面的，但是有的页面没有继承母版，却也需要导航栏怎么办呢？这就需要使用组件了。也就是说我们把导航栏单独写成一个html页面，然后使用include包含它就OK了。</p>\r\n<p>　　创建一个html页面，命名daohangtiao.html：</p>\r\n<div class=\"cnblogs_code\">\r\n<pre><span style=\"color: #008080;\"> 1</span> &lt;!DOCTYPE html&gt;\r\n<span style=\"color: #008080;\"> 2</span> &lt;html lang=<span style=\"color: #800000;\">\"</span><span style=\"color: #800000;\">en</span><span style=\"color: #800000;\">\"</span>&gt;\r\n<span style=\"color: #008080;\"> 3</span> &lt;head&gt;\r\n<span style=\"color: #008080;\"> 4</span>     &lt;meta charset=<span style=\"color: #800000;\">\"</span><span style=\"color: #800000;\">UTF-8</span><span style=\"color: #800000;\">\"</span>&gt;\r\n<span style=\"color: #008080;\"> 5</span>     &lt;title&gt;导航条&lt;/title&gt;\r\n<span style=\"color: #008080;\"> 6</span> &lt;/head&gt;\r\n<span style=\"color: #008080;\"> 7</span> &lt;body&gt;\r\n<span style=\"color: #008080;\"> 8</span> &lt;h1 style=<span style=\"color: #800000;\">\"</span><span style=\"color: #800000;\">color: red</span><span style=\"color: #800000;\">\"</span>&gt;我是导航条&lt;/h1&gt;\r\n<span style=\"color: #008080;\"> 9</span> &lt;hr&gt;\r\n<span style=\"color: #008080;\">10</span> &lt;/body&gt;\r\n<span style=\"color: #008080;\">11</span> &lt;/html&gt;</pre>\r\n</div>\r\n<p>　　然后在需要添加导航条的页面，找一个相应的位置添加代码：</p>\r\n<div class=\"cnblogs_code\">\r\n<pre>{% include <span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">daohangtiao.html</span><span style=\"color: #800000;\">\'</span> %}</pre>\r\n</div>\r\n<p>　　效果图：</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://img2018.cnblogs.com/blog/1583235/201907/1583235-20190722171531504-1094241407.png\" alt=\"\" /></p>\r\n<p>&nbsp;</p>', 3);
INSERT INTO `blog_articledetail` VALUES (2, '<p>　　在models.py中，我创建了两张表，他们分别是作者表和书籍表，且之间的关系是多对多。</p>\r\n<div class=\"cnblogs_code\">\r\n<pre><span style=\"color: #008080;\"> 1</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 书</span>\r\n<span style=\"color: #008080;\"> 2</span> <span style=\"color: #0000ff;\">class</span><span style=\"color: #000000;\"> Book(models.Model):\r\n</span><span style=\"color: #008080;\"> 3</span>     id = models.AutoField(primary_key=True)<span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 自增的主键</span>\r\n<span style=\"color: #008080;\"> 4</span>     title = models.CharField(max_length=64, null=False, unique=True)  <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 创建一个varchar(64)不为空的唯一的书名字段</span>\r\n<span style=\"color: #008080;\"> 5</span>     publisher = models.ForeignKey(to=<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">Publisher</span><span style=\"color: #800000;\">\'</span>,on_delete=models.CASCADE) <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 和Publisher关联的外键字段</span>\r\n<span style=\"color: #008080;\"> 6</span> \r\n<span style=\"color: #008080;\"> 7</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 作者&mdash;&mdash;注意作者和书应该是多对多的关系</span>\r\n<span style=\"color: #008080;\"> 8</span> <span style=\"color: #0000ff;\">class</span><span style=\"color: #000000;\"> Author(models.Model):\r\n</span><span style=\"color: #008080;\"> 9</span>     id = models.AutoField(primary_key=<span style=\"color: #000000;\">True)\r\n</span><span style=\"color: #008080;\">10</span>     name = models.CharField(max_length=16,null=False,unique=<span style=\"color: #000000;\">True)\r\n</span><span style=\"color: #008080;\">11</span>     <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 通过下面这条语句，不仅可以生成Author表，还可以自动生成第三张表</span>\r\n<span style=\"color: #008080;\">12</span>     book = models.ManyToManyField(to=<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">Book</span><span style=\"color: #800000;\">\'</span>)<span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 建立作者和书的多对多的关系</span></pre>\r\n</div>\r\n<p>　　执行相关代码之后，生成三张表：</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://img2018.cnblogs.com/blog/1583235/201907/1583235-20190717113203998-1431466083.png\" alt=\"\" /></p>\r\n<p>　　其中，app_author_book表如下图所示：</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://img2018.cnblogs.com/blog/1583235/201907/1583235-20190717113326887-1057282477.png\" alt=\"\" /></p>\r\n<p>　　author表和book表通过生成第三张表，联系各自的id值相关联。</p>\r\n<p>　　现在我想在一个页面展示我的所有作者：</p>\r\n<div class=\"cnblogs_code\">\r\n<pre><span style=\"color: #008080;\">1</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 展示作者</span>\r\n<span style=\"color: #008080;\">2</span> <span style=\"color: #0000ff;\">def</span><span style=\"color: #000000;\"> author_list(request):\r\n</span><span style=\"color: #008080;\">3</span> \r\n<span style=\"color: #008080;\">4</span>     author_obj =<span style=\"color: #000000;\"> models.Author.objects.all()\r\n</span><span style=\"color: #008080;\">5</span>     <span style=\"color: #0000ff;\">return</span> render(request,<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">author_list.html</span><span style=\"color: #800000;\">\'</span>,{<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">author_list</span><span style=\"color: #800000;\">\'</span>:author_obj})</pre>\r\n</div>\r\n<p>　　再创建一个author_list.html页面把author_obj的值传过去：</p>\r\n<div class=\"cnblogs_code\">\r\n<pre><span style=\"color: #008080;\"> 1</span> &lt;table border=<span style=\"color: #800000;\">\"</span><span style=\"color: #800000;\">1</span><span style=\"color: #800000;\">\"</span>&gt;\r\n<span style=\"color: #008080;\"> 2</span>     &lt;thead&gt;\r\n<span style=\"color: #008080;\"> 3</span>     &lt;tr&gt;\r\n<span style=\"color: #008080;\"> 4</span>         &lt;th&gt;编号&lt;/th&gt;\r\n<span style=\"color: #008080;\"> 5</span>         &lt;th&gt;ID&lt;/th&gt;\r\n<span style=\"color: #008080;\"> 6</span>         &lt;th&gt;作者姓名&lt;/th&gt;\r\n<span style=\"color: #008080;\"> 7</span>         &lt;th&gt;作品&lt;/th&gt;\r\n<span style=\"color: #008080;\"> 8</span>     &lt;/tr&gt;\r\n<span style=\"color: #008080;\"> 9</span>     &lt;/thead&gt;\r\n<span style=\"color: #008080;\">10</span>     &lt;tbody&gt;\r\n<span style=\"color: #008080;\">11</span>     {% <span style=\"color: #0000ff;\">for</span> author <span style=\"color: #0000ff;\">in</span> author_list %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">12</span>         &lt;tr&gt;\r\n<span style=\"color: #008080;\">13</span>         &lt;td&gt;{{ forloop.counter }}&lt;/td&gt;\r\n<span style=\"color: #008080;\">14</span>         &lt;td&gt;{{ author.id }}&lt;/td&gt;\r\n<span style=\"color: #008080;\">15</span>         &lt;td&gt;{{ author.name }}&lt;/td&gt;\r\n<span style=\"color: #008080;\">16</span>         &lt;td&gt;\r\n<span style=\"color: #008080;\">17</span>             {% <span style=\"color: #0000ff;\">for</span> book <span style=\"color: #0000ff;\">in</span> author.book.all %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">18</span>                 {% <span style=\"color: #0000ff;\">if</span> forloop.last %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">19</span> <span style=\"color: #000000;\">                    {{ book.title }}\r\n</span><span style=\"color: #008080;\">20</span>                  {% <span style=\"color: #0000ff;\">else</span> %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">21</span>                     {{ book.title }}|\r\n<span style=\"color: #008080;\">22</span>                 {% endif %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">23</span>             {% endfor %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">24</span>         &lt;/td&gt;\r\n<span style=\"color: #008080;\">25</span>         &lt;/tr&gt;\r\n<span style=\"color: #008080;\">26</span>     {% endfor %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">27</span>     &lt;/tbody&gt;\r\n<span style=\"color: #008080;\">28</span> &lt;/table&gt;</pre>\r\n</div>\r\n<p>　　问题来了，因为作者和书籍是多对多的关系，那么一个作者可能对应多本书，一本书也可能有多个作者。我想在每个作者后面展示他的作品，在models.py中我在Author表中加入了book字段，通过book字段我可以调用Book表中的数据，如上述代码的17行所示，我写的是author.book.all，为什么要写.all，而不是直接写author.book呢，正是因为一个作者可能有多本书，通过all可以显示所有的书的数据，而如果只写author.book的话，结果显示为None。所以记住，如果是多对多关系，记住别忘记加all哦。</p>\r\n<p>　　简陋的结果如下图：</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://img2018.cnblogs.com/blog/1583235/201907/1583235-20190717114621753-1555410262.png\" alt=\"\" /></p>\r\n<p>&nbsp;</p>', 4);
INSERT INTO `blog_articledetail` VALUES (3, '<p>　　在models.py中，我创建了两张表，他们分别是作者表和书籍表，且之间的关系是多对多。</p>\r\n<div class=\"cnblogs_code\">\r\n<pre><span style=\"color: #008080;\"> 1</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 书</span>\r\n<span style=\"color: #008080;\"> 2</span> <span style=\"color: #0000ff;\">class</span><span style=\"color: #000000;\"> Book(models.Model):\r\n</span><span style=\"color: #008080;\"> 3</span>     id = models.AutoField(primary_key=True)<span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 自增的主键</span>\r\n<span style=\"color: #008080;\"> 4</span>     title = models.CharField(max_length=64, null=False, unique=True)  <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 创建一个varchar(64)不为空的唯一的书名字段</span>\r\n<span style=\"color: #008080;\"> 5</span>     publisher = models.ForeignKey(to=<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">Publisher</span><span style=\"color: #800000;\">\'</span>,on_delete=models.CASCADE) <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 和Publisher关联的外键字段</span>\r\n<span style=\"color: #008080;\"> 6</span> \r\n<span style=\"color: #008080;\"> 7</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 作者&mdash;&mdash;注意作者和书应该是多对多的关系</span>\r\n<span style=\"color: #008080;\"> 8</span> <span style=\"color: #0000ff;\">class</span><span style=\"color: #000000;\"> Author(models.Model):\r\n</span><span style=\"color: #008080;\"> 9</span>     id = models.AutoField(primary_key=<span style=\"color: #000000;\">True)\r\n</span><span style=\"color: #008080;\">10</span>     name = models.CharField(max_length=16,null=False,unique=<span style=\"color: #000000;\">True)\r\n</span><span style=\"color: #008080;\">11</span>     <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 通过下面这条语句，不仅可以生成Author表，还可以自动生成第三张表</span>\r\n<span style=\"color: #008080;\">12</span>     book = models.ManyToManyField(to=<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">Book</span><span style=\"color: #800000;\">\'</span>)<span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 建立作者和书的多对多的关系</span></pre>\r\n</div>\r\n<p>　　执行相关代码之后，生成三张表：</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://img2018.cnblogs.com/blog/1583235/201907/1583235-20190717113203998-1431466083.png\" alt=\"\" /></p>\r\n<p>　　其中，app_author_book表如下图所示：</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://img2018.cnblogs.com/blog/1583235/201907/1583235-20190717113326887-1057282477.png\" alt=\"\" /></p>\r\n<p>　　author表和book表通过生成第三张表，联系各自的id值相关联。</p>\r\n<p>　　现在我想在一个页面展示我的所有作者：</p>\r\n<div class=\"cnblogs_code\">\r\n<pre><span style=\"color: #008080;\">1</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\"> 展示作者</span>\r\n<span style=\"color: #008080;\">2</span> <span style=\"color: #0000ff;\">def</span><span style=\"color: #000000;\"> author_list(request):\r\n</span><span style=\"color: #008080;\">3</span> \r\n<span style=\"color: #008080;\">4</span>     author_obj =<span style=\"color: #000000;\"> models.Author.objects.all()\r\n</span><span style=\"color: #008080;\">5</span>     <span style=\"color: #0000ff;\">return</span> render(request,<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">author_list.html</span><span style=\"color: #800000;\">\'</span>,{<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">author_list</span><span style=\"color: #800000;\">\'</span>:author_obj})</pre>\r\n</div>\r\n<p>　　再创建一个author_list.html页面把author_obj的值传过去：</p>\r\n<div class=\"cnblogs_code\">\r\n<pre><span style=\"color: #008080;\"> 1</span> &lt;table border=<span style=\"color: #800000;\">\"</span><span style=\"color: #800000;\">1</span><span style=\"color: #800000;\">\"</span>&gt;\r\n<span style=\"color: #008080;\"> 2</span>     &lt;thead&gt;\r\n<span style=\"color: #008080;\"> 3</span>     &lt;tr&gt;\r\n<span style=\"color: #008080;\"> 4</span>         &lt;th&gt;编号&lt;/th&gt;\r\n<span style=\"color: #008080;\"> 5</span>         &lt;th&gt;ID&lt;/th&gt;\r\n<span style=\"color: #008080;\"> 6</span>         &lt;th&gt;作者姓名&lt;/th&gt;\r\n<span style=\"color: #008080;\"> 7</span>         &lt;th&gt;作品&lt;/th&gt;\r\n<span style=\"color: #008080;\"> 8</span>     &lt;/tr&gt;\r\n<span style=\"color: #008080;\"> 9</span>     &lt;/thead&gt;\r\n<span style=\"color: #008080;\">10</span>     &lt;tbody&gt;\r\n<span style=\"color: #008080;\">11</span>     {% <span style=\"color: #0000ff;\">for</span> author <span style=\"color: #0000ff;\">in</span> author_list %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">12</span>         &lt;tr&gt;\r\n<span style=\"color: #008080;\">13</span>         &lt;td&gt;{{ forloop.counter }}&lt;/td&gt;\r\n<span style=\"color: #008080;\">14</span>         &lt;td&gt;{{ author.id }}&lt;/td&gt;\r\n<span style=\"color: #008080;\">15</span>         &lt;td&gt;{{ author.name }}&lt;/td&gt;\r\n<span style=\"color: #008080;\">16</span>         &lt;td&gt;\r\n<span style=\"color: #008080;\">17</span>             {% <span style=\"color: #0000ff;\">for</span> book <span style=\"color: #0000ff;\">in</span> author.book.all %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">18</span>                 {% <span style=\"color: #0000ff;\">if</span> forloop.last %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">19</span> <span style=\"color: #000000;\">                    {{ book.title }}\r\n</span><span style=\"color: #008080;\">20</span>                  {% <span style=\"color: #0000ff;\">else</span> %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">21</span>                     {{ book.title }}|\r\n<span style=\"color: #008080;\">22</span>                 {% endif %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">23</span>             {% endfor %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">24</span>         &lt;/td&gt;\r\n<span style=\"color: #008080;\">25</span>         &lt;/tr&gt;\r\n<span style=\"color: #008080;\">26</span>     {% endfor %<span style=\"color: #000000;\">}\r\n</span><span style=\"color: #008080;\">27</span>     &lt;/tbody&gt;\r\n<span style=\"color: #008080;\">28</span> &lt;/table&gt;</pre>\r\n</div>\r\n<p>　　问题来了，因为作者和书籍是多对多的关系，那么一个作者可能对应多本书，一本书也可能有多个作者。我想在每个作者后面展示他的作品，在models.py中我在Author表中加入了book字段，通过book字段我可以调用Book表中的数据，如上述代码的17行所示，我写的是author.book.all，为什么要写.all，而不是直接写author.book呢，正是因为一个作者可能有多本书，通过all可以显示所有的书的数据，而如果只写author.book的话，结果显示为None。所以记住，如果是多对多关系，记住别忘记加all哦。</p>\r\n<p>　　简陋的结果如下图：</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://img2018.cnblogs.com/blog/1583235/201907/1583235-20190717114621753-1555410262.png\" alt=\"\" /></p>\r\n<p>&nbsp;</p>', 5);
INSERT INTO `blog_articledetail` VALUES (4, '<h2 style=\'font-family:\"\'>\r\n	1.form组件的介绍\r\n</h2>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	  在之前的开发过程中，我们都会用一种最传统的方式写form表单。我们以注册为例子，分别讲解传统方式和用form组件的区别。\r\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	  <strong>传统方式：</strong>\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	    首先创建一个注册页面，页面里面有form表单。\r\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	    然后form表单能够将数据提交到后端，并且后端对数据进行有效性校验。\r\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	    最后把校验的提示展示到页面上，方便使用者查看。\r\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	  <strong>form组件的方式：</strong>\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	    1.可以自动生成html代码\r\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	    2.能够进行数据有效性校验\r\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	    3.校验信息并展示出来，同时会将原来的数据保存\r\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	  <strong>注：</strong>前端和后端都可以对数据进行校验。前端通过JS进行校验，开发时，最好前端设置校验，后端必须写一个校验，因为前端的校验可以被跳过。\r\n</p>\n<h2 style=\'font-family:\"\'>\r\n	2.form组件的使用\r\n</h2>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	  在这里我直接给出例子，以展示如何使用form组件。\r\n</p>\n<div class=\"cnblogs_code\" style=\'background-color:#F5F5F5;font-family:\"border:1px solid #CCCCCC;padding:5px;margin:5px 0px;\'>\n<img alt=\"\" class=\"code_img_closed\" id=\"code_img_closed_be452439-05ad-49fe-88e9-0fbaa435cd4d\" src=\"http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif\"/><span class=\"cnblogs_code_collapse\" style=\"background-color:#FFFFFF;\">views.py</span>\n</div>\n<div class=\"cnblogs_code\" style=\'background-color:#F5F5F5;font-family:\"border:1px solid #CCCCCC;padding:5px;margin:5px 0px;\'>\n<img alt=\"\" class=\"code_img_closed\" id=\"code_img_closed_b3a85da4-17a1-4db1-9456-15dd774517cb\" src=\"http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif\"/><span class=\"cnblogs_code_collapse\" style=\"background-color:#FFFFFF;\">forms.html</span>\n</div>\n<div class=\"cnblogs_code\" style=\'background-color:#F5F5F5;font-family:\"border:1px solid #CCCCCC;padding:5px;margin:5px 0px;\'>\n<img alt=\"\" class=\"code_img_closed\" id=\"code_img_closed_1ceb17f6-7265-4268-9bec-d9852294a3a2\" src=\"http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif\"/><span class=\"cnblogs_code_collapse\" style=\"background-color:#FFFFFF;\">settings.py</span>\n</div>\n<div class=\"cnblogs_code\" style=\'background-color:#F5F5F5;font-family:\"border:1px solid #CCCCCC;padding:5px;margin:5px 0px;\'>\n<img alt=\"\" class=\"code_img_closed\" id=\"code_img_closed_d9a560d3-a936-4572-9ca0-5fce3e4e4623\" src=\"http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif\"/><span class=\"cnblogs_code_collapse\" style=\"background-color:#FFFFFF;\">urls.py</span>\n</div>\n<p style=\'font-family:\"font-size:14px;\'>\n<strong>  注：</strong>\n</p>\n<div class=\"cnblogs_code\" style=\'background-color:#F5F5F5;font-family:\"border:1px solid #CCCCCC;padding:5px;margin:5px 0px;\'>\n<pre>forms_obj =<span> RegForm(request.POST) </span><span style=\"color:#0000FF;\">print</span><span>(forms_obj.cleaned_data) </span><span style=\"color:#008000;\">#</span><span style=\"color:#008000;\">所有通过校验的数据都以字典的形式保存在cleaned_data中</span></pre>\n</div>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	 \r\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\n<strong>  效果图：</strong>\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\n<strong><img alt=\"\" src=\"https://img2018.cnblogs.com/blog/1583235/201908/1583235-20190821201839754-544994338.png\"/></strong>\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	 \r\n</p>\n<h2 style=\'font-family:\"\'>\r\n	3.自定义校验 \r\n</h2>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	  往往别人为设置好的校验规则都不能满足我们所有的需求，这个时候我们需要自己写一个校验。比如若用户注册时，填写的注册名有骂人的词语时，那我们就要提示他“该注册名不能”，该怎么做呢？我们只需要在RegForm类里面加一个函数即可，RegForm类见上面的vies.py。\r\n</p>\n<div class=\"cnblogs_code\" style=\'background-color:#F5F5F5;font-family:\"border:1px solid #CCCCCC;padding:5px;margin:5px 0px;\'>\n<img alt=\"\" class=\"code_img_closed\" id=\"code_img_closed_7cf3de6b-b8f1-4158-a292-fb73a669e03e\" src=\"http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif\"/><span class=\"cnblogs_code_collapse\" style=\"background-color:#FFFFFF;\">自定义校验</span>\n</div>\n<p style=\'font-family:\"font-size:14px;\'>\n<strong>  效果图：</strong>\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\n<strong><img alt=\"\" src=\"https://img2018.cnblogs.com/blog/1583235/201908/1583235-20190822111831303-1683437647.png\"/></strong>\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	  在上面的代码中，我只给出来用户名和密码，没有给出确认密码，现在我加上确认密码，并且加上验证两次密码是否一致，该怎么写呢？\r\n</p>\n<div class=\"cnblogs_code\" style=\'background-color:#F5F5F5;font-family:\"border:1px solid #CCCCCC;padding:5px;margin:5px 0px;\'>\n<img alt=\"\" class=\"code_img_closed\" id=\"code_img_closed_80f9336d-39d0-4d73-9d2a-c8c829ceb2dd\" src=\"http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif\"/><span class=\"cnblogs_code_collapse\" style=\"background-color:#FFFFFF;\">views.py</span>\n</div>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	  只需要加上这一步即可，其他的代码自己完善一下。\r\n</p>\n<h2 style=\'font-family:\"\'>\r\n	3.推荐博文\r\n</h2>\n<p style=\'font-family:\"font-size:14px;\'>\n<a href=\"https://www.cnblogs.com/liwenzhou/p/8747872.html\">https://www.cnblogs.com/liwenzhou/p/8747872.html</a>\n</p>\n<p style=\'font-family:\"font-size:14px;\'>\r\n	 \r\n</p>', 6);
INSERT INTO `blog_articledetail` VALUES (36, '文章内容很麻烦哪哪哪哪', 46);

-- ----------------------------
-- Table structure for blog_articleupdown
-- ----------------------------
DROP TABLE IF EXISTS `blog_articleupdown`;
CREATE TABLE `blog_articleupdown`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `is_up` tinyint(1) NOT NULL,
  `article_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `blog_articleupdown_article_id_user_id_fa3d0c08_uniq`(`article_id`, `user_id`) USING BTREE,
  INDEX `blog_articleupdown_user_id_2c0ebe49_fk_blog_userinfo_nid`(`user_id`) USING BTREE,
  CONSTRAINT `blog_articleupdown_article_id_9be1a8a2_fk_blog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_articleupdown_user_id_2c0ebe49_fk_blog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_articleupdown
-- ----------------------------
INSERT INTO `blog_articleupdown` VALUES (144, 1, 5, 3);
INSERT INTO `blog_articleupdown` VALUES (149, 0, 3, 3);
INSERT INTO `blog_articleupdown` VALUES (156, 1, 4, 3);
INSERT INTO `blog_articleupdown` VALUES (159, 1, 3, 5);
INSERT INTO `blog_articleupdown` VALUES (164, 0, 5, 5);
INSERT INTO `blog_articleupdown` VALUES (173, 1, 5, 6);
INSERT INTO `blog_articleupdown` VALUES (176, 1, 6, 5);

-- ----------------------------
-- Table structure for blog_blog
-- ----------------------------
DROP TABLE IF EXISTS `blog_blog`;
CREATE TABLE `blog_blog`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `site` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `theme` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `site`(`site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_blog
-- ----------------------------
INSERT INTO `blog_blog` VALUES (3, '张三的博客', 'zhangsan', '张三.css');
INSERT INTO `blog_blog` VALUES (4, '李四的博客', 'lisi', '李四.css');
INSERT INTO `blog_blog` VALUES (5, '王五的博客', 'wangwu', '王五.css');

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `blog_category_blog_id_80f0723a_fk_blog_blog_nid`(`blog_id`) USING BTREE,
  CONSTRAINT `blog_category_blog_id_80f0723a_fk_blog_blog_nid` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (3, 'python', 3);
INSERT INTO `blog_category` VALUES (4, 'django', 4);
INSERT INTO `blog_category` VALUES (46, '类别是啥呢', 5);

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  `parent_comment_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `blog_comment_article_id_3d58bca6_fk_blog_article_nid`(`article_id`) USING BTREE,
  INDEX `blog_comment_user_id_59a54155_fk_blog_userinfo_nid`(`user_id`) USING BTREE,
  INDEX `blog_comment_parent_comment_id_26791b9a_fk_blog_comment_nid`(`parent_comment_id`) USING BTREE,
  CONSTRAINT `blog_comment_article_id_3d58bca6_fk_blog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_comment_parent_comment_id_26791b9a_fk_blog_comment_nid` FOREIGN KEY (`parent_comment_id`) REFERENCES `blog_comment` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_comment_user_id_59a54155_fk_blog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES (39, 'halou', '2019-09-06 15:35:49.310383', 3, NULL, 5);
INSERT INTO `blog_comment` VALUES (40, 'dfd', '2019-09-06 15:35:53.515657', 3, NULL, 5);
INSERT INTO `blog_comment` VALUES (41, 'gdfd', '2019-09-06 15:35:56.668261', 3, NULL, 5);
INSERT INTO `blog_comment` VALUES (42, 'dffgdf', '2019-09-06 15:36:05.206095', 3, 39, 5);
INSERT INTO `blog_comment` VALUES (43, 'dfds', '2019-09-06 15:36:33.084949', 4, NULL, 5);
INSERT INTO `blog_comment` VALUES (44, 'dfd', '2019-09-06 18:53:23.072783', 3, 42, 5);
INSERT INTO `blog_comment` VALUES (45, '111', '2019-09-08 13:46:35.362385', 3, 42, 5);

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `blog_tag_blog_id_a8c60c42_fk_blog_blog_nid`(`blog_id`) USING BTREE,
  CONSTRAINT `blog_tag_blog_id_a8c60c42_fk_blog_blog_nid` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (1, '标签1', 3);
INSERT INTO `blog_tag` VALUES (4, '标签4', 4);
INSERT INTO `blog_tag` VALUES (19, '标签随便写啦', 5);

-- ----------------------------
-- Table structure for blog_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `blog_userinfo`;
CREATE TABLE `blog_userinfo`  (
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
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `blog_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `blog_id`(`blog_id`) USING BTREE,
  CONSTRAINT `blog_userinfo_blog_id_aa34488f_fk_blog_blog_nid` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_userinfo
-- ----------------------------
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$150000$bz7ACZkpw1cz$FpMHkbXUtqrnv5F/CmTDlU/pEPuMfzxOAKe77WjF2Mw=', '2019-09-08 14:02:28.761755', 1, 'guanliyuan', '', '', '', 1, 1, '2019-08-24 10:25:07.246679', 3, NULL, 'avatars/default.png', '2019-08-24 10:25:07.521521', NULL);
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$150000$LvoSThVlpUZw$qhUNq23X8vHF3Wk9s8s7NbttLHxd4Dzhs+vjixyD3WE=', '2019-09-08 14:06:52.990535', 0, '张三', '', '', 'zhangsan@qq.com', 0, 1, '2019-08-25 07:20:00.000000', 5, '00000000000', 'avatars/20171129155903_797453279_YE0kR1m.jpg', '2019-08-25 07:20:13.511792', 3);
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$150000$3pes5iJWybU8$jWtZQUu3XxyLFz8A42qiiSXZkSUc4hdX4j0fqZhenHc=', '2019-09-07 11:45:40.692729', 0, '李四', '', '', 'lisi@qq.com', 0, 1, '2019-08-25 07:20:00.000000', 6, '11111111111', 'avatars/2012061503283078100.jpg', '2019-08-25 07:20:35.082442', 4);
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$150000$XwKaqEPPvuCE$vhTuLlyU2XtcFq/nJ7U88xjYYvkBwCc0DsHgqXYMQU8=', '2019-09-08 13:51:00.014383', 0, '王五', '', '', '123@qq.com', 0, 1, '2019-09-06 19:33:00.000000', 7, '22222222222', 'avatars/head_phkJy31.jpeg', '2019-09-06 19:33:38.050550', 5);

-- ----------------------------
-- Table structure for blog_userinfo_groups
-- ----------------------------
DROP TABLE IF EXISTS `blog_userinfo_groups`;
CREATE TABLE `blog_userinfo_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `blog_userinfo_groups_userinfo_id_group_id_5f60ecec_uniq`(`userinfo_id`, `group_id`) USING BTREE,
  INDEX `blog_userinfo_groups_group_id_1fb5e93a_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `blog_userinfo_groups_group_id_1fb5e93a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_userinfo_groups_userinfo_id_f6f0498b_fk_blog_userinfo_nid` FOREIGN KEY (`userinfo_id`) REFERENCES `blog_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_userinfo_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `blog_userinfo_user_permissions`;
CREATE TABLE `blog_userinfo_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `blog_userinfo_user_permi_userinfo_id_permission_i_7d343093_uniq`(`userinfo_id`, `permission_id`) USING BTREE,
  INDEX `blog_userinfo_user_p_permission_id_ace80f7e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `blog_userinfo_user_p_permission_id_ace80f7e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_userinfo_user_p_userinfo_id_57e76697_fk_blog_user` FOREIGN KEY (`userinfo_id`) REFERENCES `blog_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  INDEX `django_admin_log_user_id_c564eba6_fk_blog_userinfo_nid`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_blog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2019-08-24 11:09:58.415950', '1', '我的博客', 1, '[{\"added\": {}}]', 8, 3);
INSERT INTO `django_admin_log` VALUES (2, '2019-08-24 11:10:02.856941', '1', '组件', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (3, '2019-08-24 11:10:24.150736', '1', 'form组件', 1, '[{\"added\": {}}]', 7, 3);
INSERT INTO `django_admin_log` VALUES (4, '2019-08-24 23:18:04.135887', '1', 'dddd', 1, '[{\"added\": {}}]', 10, 3);
INSERT INTO `django_admin_log` VALUES (5, '2019-08-25 07:05:35.834180', '2', 'ducong', 2, '[{\"changed\": {\"fields\": [\"last_login\", \"phone\", \"blog\"]}}]', 6, 3);
INSERT INTO `django_admin_log` VALUES (6, '2019-08-25 07:07:26.150574', '1', 'ducong的博客', 2, '[{\"changed\": {\"fields\": [\"title\", \"theme\"]}}]', 8, 3);
INSERT INTO `django_admin_log` VALUES (7, '2019-08-25 07:08:49.088794', '2', 'duxue的博客', 1, '[{\"added\": {}}]', 8, 3);
INSERT INTO `django_admin_log` VALUES (8, '2019-08-25 07:08:52.605780', '2', 'python', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (9, '2019-08-25 07:09:03.803369', '2', '用Python写一个滑动验证码', 1, '[{\"added\": {}}]', 7, 3);
INSERT INTO `django_admin_log` VALUES (10, '2019-08-25 07:09:32.966672', '4', 'duxue', 2, '[{\"changed\": {\"fields\": [\"phone\", \"blog\"]}}]', 6, 3);
INSERT INTO `django_admin_log` VALUES (11, '2019-08-25 07:19:21.774412', '4', 'duxue', 3, '', 6, 3);
INSERT INTO `django_admin_log` VALUES (12, '2019-08-25 07:19:29.344080', '2', 'ducong', 3, '', 6, 3);
INSERT INTO `django_admin_log` VALUES (13, '2019-08-25 07:22:05.426739', '2', 'python', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (14, '2019-08-25 07:22:10.711694', '1', '组件', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (15, '2019-08-25 07:24:16.460339', '3', '张三的博客', 1, '[{\"added\": {}}]', 8, 3);
INSERT INTO `django_admin_log` VALUES (16, '2019-08-25 07:24:22.182059', '3', 'python', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (17, '2019-08-25 07:24:50.980558', '4', '李四的博客', 1, '[{\"added\": {}}]', 8, 3);
INSERT INTO `django_admin_log` VALUES (18, '2019-08-25 07:24:52.756539', '4', 'django', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (19, '2019-08-25 07:25:32.000971', '3', '用python写一个简单的文件上传', 1, '[{\"added\": {}}]', 7, 3);
INSERT INTO `django_admin_log` VALUES (20, '2019-08-25 07:26:07.379713', '4', '逆向破解之160个CrackMe —— 017', 1, '[{\"added\": {}}]', 7, 3);
INSERT INTO `django_admin_log` VALUES (21, '2019-08-25 07:26:31.158081', '5', '.net必问的面试题系列之面向对象', 1, '[{\"added\": {}}]', 7, 3);
INSERT INTO `django_admin_log` VALUES (22, '2019-08-25 07:28:15.205510', '2', 'duxue的博客', 3, '', 8, 3);
INSERT INTO `django_admin_log` VALUES (23, '2019-08-25 07:28:15.284470', '1', 'ducong的博客', 3, '', 8, 3);
INSERT INTO `django_admin_log` VALUES (24, '2019-08-25 07:33:53.825908', '5', '张三', 2, '[{\"changed\": {\"fields\": [\"phone\", \"blog\"]}}]', 6, 3);
INSERT INTO `django_admin_log` VALUES (25, '2019-08-25 07:34:05.916985', '6', '李四', 2, '[{\"changed\": {\"fields\": [\"phone\", \"blog\"]}}]', 6, 3);
INSERT INTO `django_admin_log` VALUES (26, '2019-08-25 10:12:18.126101', '5', '生活', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (27, '2019-08-25 11:01:30.619219', '1', '标签1', 1, '[{\"added\": {}}]', 9, 3);
INSERT INTO `django_admin_log` VALUES (28, '2019-08-25 11:01:43.154061', '2', '标签2', 1, '[{\"added\": {}}]', 9, 3);
INSERT INTO `django_admin_log` VALUES (29, '2019-08-25 11:01:59.373776', '3', '标签3', 1, '[{\"added\": {}}]', 9, 3);
INSERT INTO `django_admin_log` VALUES (30, '2019-08-25 11:02:09.369037', '4', '标签4', 1, '[{\"added\": {}}]', 9, 3);
INSERT INTO `django_admin_log` VALUES (31, '2019-08-25 11:14:12.800160', '1', 'Article2Tag object (1)', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (32, '2019-08-25 11:14:16.870826', '2', 'Article2Tag object (2)', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (33, '2019-08-25 11:14:21.089411', '3', 'Article2Tag object (3)', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (34, '2019-08-25 11:14:26.637234', '4', 'Article2Tag object (4)', 1, '[{\"added\": {}}]', 13, 3);
INSERT INTO `django_admin_log` VALUES (35, '2019-08-26 04:29:33.458364', '5', '.net必问的面试题系列之面向对象', 2, '[{\"changed\": {\"fields\": [\"create_time\"]}}]', 7, 3);
INSERT INTO `django_admin_log` VALUES (36, '2019-08-26 04:30:05.584974', '4', '逆向破解之160个CrackMe —— 017', 2, '[{\"changed\": {\"fields\": [\"create_time\"]}}]', 7, 3);
INSERT INTO `django_admin_log` VALUES (37, '2019-08-26 04:30:14.746729', '3', '用python写一个简单的文件上传', 2, '[{\"changed\": {\"fields\": [\"create_time\"]}}]', 7, 3);
INSERT INTO `django_admin_log` VALUES (38, '2019-08-26 12:05:37.143591', '1', 'ArticleDetail object (1)', 1, '[{\"added\": {}}]', 12, 3);
INSERT INTO `django_admin_log` VALUES (39, '2019-08-26 12:05:51.633308', '2', 'ArticleDetail object (2)', 1, '[{\"added\": {}}]', 12, 3);
INSERT INTO `django_admin_log` VALUES (40, '2019-08-26 12:06:12.006629', '3', 'ArticleDetail object (3)', 1, '[{\"added\": {}}]', 12, 3);
INSERT INTO `django_admin_log` VALUES (41, '2019-08-26 14:34:58.705337', '2', '逆向破解之160个CrackMe —— 017-标签2', 3, '', 13, 3);
INSERT INTO `django_admin_log` VALUES (42, '2019-08-26 14:35:15.688540', '2', '标签2', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (43, '2019-09-06 16:34:23.506994', '10', 'df', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (44, '2019-09-06 16:34:23.559963', '9', 'python', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (45, '2019-09-06 16:34:23.625924', '8', 'python', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (46, '2019-09-06 16:34:23.670881', '7', '测试', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (47, '2019-09-06 20:28:16.202278', '5', '王五的博客', 1, '[{\"added\": {}}]', 8, 3);
INSERT INTO `django_admin_log` VALUES (48, '2019-09-06 20:28:22.068158', '5', '王五的博客', 2, '[{\"changed\": {\"fields\": [\"theme\"]}}]', 8, 3);
INSERT INTO `django_admin_log` VALUES (49, '2019-09-06 20:28:37.002314', '7', '王五', 2, '[{\"changed\": {\"fields\": [\"last_login\", \"phone\", \"blog\"]}}]', 6, 3);
INSERT INTO `django_admin_log` VALUES (50, '2019-09-07 10:38:07.273699', '10', 'ArticleDetail object (10)', 3, '', 12, 3);
INSERT INTO `django_admin_log` VALUES (51, '2019-09-07 10:40:36.307098', '12', '', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (52, '2019-09-07 11:12:29.051232', '19', '444', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (53, '2019-09-07 11:12:29.115197', '18', '333', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (54, '2019-09-07 11:12:29.192153', '17', '222', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (55, '2019-09-07 11:12:29.362070', '16', '222', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (56, '2019-09-07 11:12:29.583926', '15', '222', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (57, '2019-09-07 11:12:29.711870', '14', '111', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (58, '2019-09-07 11:17:12.711518', '22', 'c', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (59, '2019-09-07 11:17:12.792500', '21', 'b', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (60, '2019-09-07 11:17:12.869427', '20', 'a', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (61, '2019-09-07 11:17:12.984359', '11', '王五的博客', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (62, '2019-09-07 11:44:57.941342', '30', '', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (63, '2019-09-07 11:44:58.055281', '29', '', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (64, '2019-09-07 11:44:58.154220', '28', '', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (65, '2019-09-07 11:44:58.276151', '27', '', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (66, '2019-09-07 11:44:58.419070', '26', '', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (67, '2019-09-07 11:44:58.603962', '25', '', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (68, '2019-09-07 11:44:58.702936', '24', 'a', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (69, '2019-09-07 11:44:58.793854', '23', '1', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (70, '2019-09-07 14:43:15.573903', '28', '他', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (71, '2019-09-07 14:51:44.497967', '36', 'dfsd', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (72, '2019-09-07 14:51:44.586899', '35', 'dsfewf', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (73, '2019-09-07 14:51:44.675847', '34', 'dfsd', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (74, '2019-09-07 14:51:44.764813', '32', '', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (75, '2019-09-07 14:51:44.852747', '31', '', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (76, '2019-09-07 14:52:24.306296', '31', 'wangwu', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (77, '2019-09-07 14:52:24.394240', '30', 'wew', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (78, '2019-09-07 14:52:24.483197', '29', 'wangwu', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (79, '2019-09-07 14:56:11.645578', '4', '标签4', 2, '[]', 9, 3);
INSERT INTO `django_admin_log` VALUES (80, '2019-09-07 14:56:24.361692', '5', '标签4', 1, '[{\"added\": {}}]', 9, 3);
INSERT INTO `django_admin_log` VALUES (81, '2019-09-07 14:59:28.816812', '5', '标签4', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (82, '2019-09-07 15:00:05.775196', '32', 'django', 1, '[{\"added\": {}}]', 11, 3);
INSERT INTO `django_admin_log` VALUES (83, '2019-09-07 15:43:23.181549', '45', 'xxx', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (84, '2019-09-07 15:43:23.264502', '44', 'zzz', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (85, '2019-09-07 15:43:23.353456', '43', '点点滴滴', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (86, '2019-09-07 15:43:23.420414', '42', '疯了', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (87, '2019-09-07 15:43:23.508390', '41', '顶顶顶', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (88, '2019-09-07 15:43:23.630291', '40', '奋斗', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (89, '2019-09-07 15:43:23.697266', '39', '最后', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (90, '2019-09-07 15:43:23.786232', '38', 'dddddddddddddddd', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (91, '2019-09-07 15:43:23.874184', '37', '', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (92, '2019-09-07 15:43:23.963102', '36', 'c', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (93, '2019-09-07 15:43:24.052063', '35', '对方的', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (94, '2019-09-07 15:43:24.139999', '34', '日日日', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (95, '2019-09-07 15:43:24.228978', '32', 'django', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (96, '2019-09-07 15:43:30.992752', '33', 'www', 3, '', 11, 3);
INSERT INTO `django_admin_log` VALUES (97, '2019-09-07 15:43:54.113490', '18', 'xxx', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (98, '2019-09-07 15:43:54.206455', '17', 'zzz', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (99, '2019-09-07 15:43:54.283392', '16', '疯了', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (100, '2019-09-07 15:43:54.372347', '15', '疯了', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (101, '2019-09-07 15:43:54.449305', '14', '顶顶顶', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (102, '2019-09-07 15:43:54.538248', '13', '奋斗', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (103, '2019-09-07 15:43:54.615204', '12', '最后', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (104, '2019-09-07 15:43:54.717143', '11', 'dddddddddddddddd', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (105, '2019-09-07 15:43:54.803112', '10', '地方', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (106, '2019-09-07 15:43:54.979991', '9', '222', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (107, '2019-09-07 15:43:55.090927', '8', '嘎嘎嘎', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (108, '2019-09-07 15:43:55.274823', '7', '呃呃呃', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (109, '2019-09-07 15:43:55.423739', '6', '111', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (110, '2019-09-07 15:44:39.443285', '3', '标签3', 3, '', 9, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (7, 'blog', 'article');
INSERT INTO `django_content_type` VALUES (13, 'blog', 'article2tag');
INSERT INTO `django_content_type` VALUES (12, 'blog', 'articledetail');
INSERT INTO `django_content_type` VALUES (14, 'blog', 'articleupdown');
INSERT INTO `django_content_type` VALUES (8, 'blog', 'blog');
INSERT INTO `django_content_type` VALUES (11, 'blog', 'category');
INSERT INTO `django_content_type` VALUES (10, 'blog', 'comment');
INSERT INTO `django_content_type` VALUES (9, 'blog', 'tag');
INSERT INTO `django_content_type` VALUES (6, 'blog', 'userinfo');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-08-22 09:35:06.575494');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2019-08-22 09:35:08.405469');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2019-08-22 09:35:10.424292');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2019-08-22 09:35:15.534366');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2019-08-22 09:35:15.620317');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2019-08-22 09:35:15.699279');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2019-08-22 09:35:15.820220');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2019-08-22 09:35:15.877188');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2019-08-22 09:35:15.955123');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2019-08-22 09:35:16.042079');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2019-08-22 09:35:16.095042');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2019-08-22 09:35:16.331911');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2019-08-22 09:35:16.393872');
INSERT INTO `django_migrations` VALUES (14, 'blog', '0001_initial', '2019-08-22 09:35:23.733670');
INSERT INTO `django_migrations` VALUES (15, 'admin', '0001_initial', '2019-08-22 09:35:45.078449');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0002_logentry_remove_auto_add', '2019-08-22 09:35:47.616995');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0003_logentry_add_action_flag_choices', '2019-08-22 09:35:47.692951');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2019-08-22 09:35:48.123704');
INSERT INTO `django_migrations` VALUES (19, 'blog', '0002_auto_20190825_0728', '2019-08-24 23:28:43.234050');
INSERT INTO `django_migrations` VALUES (20, 'blog', '0003_auto_20190907_1436', '2019-09-07 14:36:30.201852');
INSERT INTO `django_migrations` VALUES (21, 'blog', '0004_auto_20190907_1442', '2019-09-07 14:42:39.413158');

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

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('12njr2f8z8zrm4tar45id19wbzcg18xb', 'MjBmNzZkNWZhOWY0OGYxZDZlN2YxZTk3MWYyZDhjNGIzZjQyOTBlYTp7Imd0X3NlcnZlcl9zdGF0dXMiOjEsInVzZXJfaWQiOiJ0ZXN0IiwiX2F1dGhfdXNlcl9pZCI6IjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjcyNWQ1NWU2N2VmMjE1ZDE4MTdjMDg1NDI4ZjY5NzBlYWVkY2RkNTQifQ==', '2019-09-20 20:28:55.212855');
INSERT INTO `django_session` VALUES ('4sp6wfg2kss1rmougzfoys17dk9h24me', 'ODYzYzQ5YjliM2IwMDg5MjM3ZWY1MmRkOTlkODM1MGMxZmU1M2IyMTp7Imd0X3NlcnZlcl9zdGF0dXMiOjEsInVzZXJfaWQiOiJ0ZXN0In0=', '2019-09-22 14:10:54.305771');

SET FOREIGN_KEY_CHECKS = 1;
