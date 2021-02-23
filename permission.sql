/*
Navicat MySQL Data Transfer

Source Server         : spring
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : permission

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2020-06-15 11:53:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint(20) NOT NULL COMMENT '上级部门ID。一级部门为0',
  `name` varchar(50) NOT NULL COMMENT '部门名称',
  `type` tinyint(2) NOT NULL COMMENT '类型。0：公司；1：部门；2：科室/小组',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值。越小越靠前',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态。0：正常；1：禁用',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='部门表';

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('37', '36', '测试小组01', '2', '2', '1', null, null, null);
INSERT INTO `dept` VALUES ('36', '1', '测试部门999', '1', '4', '0', '2019-05-01 17:13:48', null, '2020-05-01 17:13:48');
INSERT INTO `dept` VALUES ('3', '2', '研发组', '2', '3', '0', '2019-05-01 17:13:48', null, '2020-06-03 17:13:48');
INSERT INTO `dept` VALUES ('2', '1', 'IT部', '1', '2', '0', '2019-05-01 17:12:54', null, '2020-06-03 17:12:54');
INSERT INTO `dept` VALUES ('1', '-1', '科技部', '0', '1', '0', '2019-05-11 15:35:24', null, '2020-05-11 15:35:24');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint(20) NOT NULL COMMENT '父菜单ID。一级菜单为0',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `permission` varchar(200) DEFAULT NULL COMMENT '授权标识。多个用逗号分隔，如：user:list,user:create',
  `type` tinyint(2) DEFAULT NULL COMMENT '类型。0：目录；1：菜单；2：按钮；3：导航菜单',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态。0：正常；1：禁用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值。越小越靠前',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='菜单表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '-1', '系统管理2', '', '', '0', null, '0', '0', null, '2020-05-06 21:46:33');
INSERT INTO `menu` VALUES ('2', '1', '用户管理', 'sys/user/index', 'sys:user:index', '1', null, '0', '1', null, '2020-05-06 21:46:47');
INSERT INTO `menu` VALUES ('3', '1', '菜单管理', 'sys/menu/index', 'sys:menu:index', '1', null, '0', '2', null, '2020-05-11 11:50:57');
INSERT INTO `menu` VALUES ('4', '1', '角色管理', 'sys/role/index', 'sys:role:index', '1', null, '0', '3', null, '2020-05-11 11:51:31');
INSERT INTO `menu` VALUES ('5', '1', '部门管理', 'sys/dept/index', 'sys:dept:index', '1', null, '0', '1', null, '2020-05-06 11:51:58');
INSERT INTO `menu` VALUES ('7', '-1', '系统审计', '', '', '0', null, '0', '1', null, '2020-05-11 12:04:09');
INSERT INTO `menu` VALUES ('9', '7', '操作日志', 'sys/log/index', 'sys:log:index', '1', null, '0', '0', null, '2020-05-11 13:26:02');
INSERT INTO `menu` VALUES ('10', '2', '添加', '', 'sys:user:add', '2', null, '0', '3', null, '2020-05-07 21:25:46');
INSERT INTO `menu` VALUES ('11', '2', '删除', '', 'sys:user:del', '2', null, '0', '2', null, '2020-06-15 14:26:54');
INSERT INTO `menu` VALUES ('12', '2', '编辑', '', 'sys:user:edit', '2', null, '0', '1', null, '2020-05-11 14:28:06');
INSERT INTO `menu` VALUES ('13', '3', '添加', '', 'sys:menu:add', '2', null, '0', '0', null, '2020-05-11 14:28:59');
INSERT INTO `menu` VALUES ('14', '3', '编辑', '', 'sys:menu:edit', '2', null, '0', '1', null, '2020-06-15 14:29:35');
INSERT INTO `menu` VALUES ('15', '3', '删除', '', 'sys:menu:del', '2', null, '0', '2', null, '2020-06-15 14:29:55');
INSERT INTO `menu` VALUES ('16', '4', '添加', '', 'sys:role:add', '2', null, '0', '0', null, '2020-06-15 14:30:07');
INSERT INTO `menu` VALUES ('17', '4', '编辑', '', 'sys:role:edit', '2', null, '0', '1', null, '2019-05-11 14:30:28');
INSERT INTO `menu` VALUES ('18', '4', '删除', '', 'sys:role:del', '2', null, '0', '2', null, '2019-05-11 14:30:37');
INSERT INTO `menu` VALUES ('19', '4', '权限设置', '', 'sys:role:permission', '2', null, '0', '3', null, '2019-05-11 14:30:37');
INSERT INTO `menu` VALUES ('20', '5', '添加', '', 'sys:dept:add', '2', null, '0', '0', null, '2019-05-11 14:30:47');
INSERT INTO `menu` VALUES ('21', '5', '编辑', '', 'sys:dept:edit', '2', null, '0', '1', null, '2019-05-11 14:30:58');
INSERT INTO `menu` VALUES ('22', '5', '删除', '', 'sys:dept:del', '2', null, '0', '2', null, '2019-05-11 14:31:13');
INSERT INTO `menu` VALUES ('23', '2', '重置密码', '', 'sys:user:reset', '2', null, '0', '3', null, '2019-05-12 18:01:10');
INSERT INTO `menu` VALUES ('24', '-1', 'Druid监控', 'druid/index.html', '', '3', null, '0', '0', null, '2019-05-20 22:43:09');
INSERT INTO `menu` VALUES ('25', '-1', '代码生成', '', '', '0', null, '0', '2', null, '2019-06-10 22:47:31');
INSERT INTO `menu` VALUES ('26', '25', '生成管理', 'generator/table/index', 'gen:table:index', '1', null, '0', '0', null, '2019-06-10 22:50:09');
INSERT INTO `menu` VALUES ('27', '1', '字典管理', 'sys/dict/index', 'sys:dict:index', '1', null, '0', '4', null, '2019-08-12 09:47:31');
INSERT INTO `menu` VALUES ('28', '27', '添加', '', 'sys:dict:add', '2', null, '0', '0', null, '2019-08-12 09:48:03');
INSERT INTO `menu` VALUES ('29', '27', '编辑', '', 'sys:dict:edit', '2', null, '0', '0', null, '2019-08-12 09:48:20');
INSERT INTO `menu` VALUES ('30', '27', '删除', '', 'sys:dict:del', '2', null, '0', '0', null, '2019-08-12 09:48:45');
INSERT INTO `menu` VALUES ('31', '1', '定时任务', 'schedule/job/index', 'schedule:job:index', '1', null, '0', '5', null, '2019-08-17 18:13:22');
INSERT INTO `menu` VALUES ('32', '31', '添加', '', 'schedule:job:add', '2', null, '0', '0', null, '2019-08-17 18:14:20');
INSERT INTO `menu` VALUES ('33', '31', '编辑', '', 'schedule:job:edit', '2', null, '0', '0', null, '2019-08-17 18:14:36');
INSERT INTO `menu` VALUES ('34', '31', '删除', '', 'schedule:job:del', '2', null, '0', '0', null, '2019-08-17 18:14:55');
INSERT INTO `menu` VALUES ('35', '31', '暂停', '', 'schedule:job:pause', '2', null, '0', '0', null, '2019-08-17 18:16:10');
INSERT INTO `menu` VALUES ('36', '31', '恢复', '', 'schedule:job:resume', '2', null, '0', '0', null, '2020-06-15 18:16:28');
INSERT INTO `menu` VALUES ('37', '-1', '组件管理', '', '', '0', null, '0', '3', null, '2020-03-31 11:14:02');
INSERT INTO `menu` VALUES ('38', '37', '富文本', 'sys/component/ueditor/index', 'component:ueditor:index', '1', null, '0', '1', null, '2020-03-09 11:17:55');
INSERT INTO `menu` VALUES ('39', '37', '图标库', 'sys/component/icons/index', 'component:icons:index', '1', null, '0', '0', null, '2020-03-31 11:22:09');
INSERT INTO `menu` VALUES ('75', '-1', '测试目录1', '', '', '0', null, '0', '1', null, '2020-06-05 07:20:36');
INSERT INTO `menu` VALUES ('76', '75', '测试菜单1', 'users1', 'users:add1', '1', null, '0', '2', null, '2020-06-05 07:21:13');
INSERT INTO `menu` VALUES ('77', '76', '测试按钮1', 'users', 'users:add1', '2', null, '0', '31', null, '2020-06-05 07:21:35');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `parent_id` bigint(20) NOT NULL COMMENT '父级ID',
  `type` tinyint(2) NOT NULL COMMENT '类型。0：分类；1：角色',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('3', '系统管理员', '-1', '1', '', null, null, null);
INSERT INTO `role` VALUES ('4', '项目组长', '2', '1', '', null, null, null);
INSERT INTO `role` VALUES ('5', '开发者', '-1', '1', '', null, null, null);
INSERT INTO `role` VALUES ('2', '研发组', '-1', '0', '', null, null, null);
INSERT INTO `role` VALUES ('10', '测试角色1', '-1', '0', '分类11', null, '2020-06-09 14:21:56', null);
INSERT INTO `role` VALUES ('11', '测试角色2', '10', '0', '分类2', null, null, null);
INSERT INTO `role` VALUES ('12', '测试角色3', '11', '1', '角色', null, null, null);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色菜单表';

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '3', '7');
INSERT INTO `role_menu` VALUES ('2', '3', '9');
INSERT INTO `role_menu` VALUES ('3', '3', '1');
INSERT INTO `role_menu` VALUES ('4', '3', '2');
INSERT INTO `role_menu` VALUES ('6', '3', '12');
INSERT INTO `role_menu` VALUES ('7', '3', '11');
INSERT INTO `role_menu` VALUES ('8', '3', '23');
INSERT INTO `role_menu` VALUES ('9', '3', '5');
INSERT INTO `role_menu` VALUES ('10', '3', '20');
INSERT INTO `role_menu` VALUES ('11', '3', '21');
INSERT INTO `role_menu` VALUES ('12', '3', '22');
INSERT INTO `role_menu` VALUES ('13', '3', '3');
INSERT INTO `role_menu` VALUES ('14', '3', '13');
INSERT INTO `role_menu` VALUES ('15', '3', '14');
INSERT INTO `role_menu` VALUES ('16', '3', '15');
INSERT INTO `role_menu` VALUES ('17', '3', '4');
INSERT INTO `role_menu` VALUES ('18', '3', '16');
INSERT INTO `role_menu` VALUES ('19', '3', '17');
INSERT INTO `role_menu` VALUES ('20', '3', '18');
INSERT INTO `role_menu` VALUES ('21', '3', '19');
INSERT INTO `role_menu` VALUES ('22', '3', '24');
INSERT INTO `role_menu` VALUES ('23', '3', '25');
INSERT INTO `role_menu` VALUES ('24', '3', '26');
INSERT INTO `role_menu` VALUES ('34', '3', '27');
INSERT INTO `role_menu` VALUES ('35', '3', '30');
INSERT INTO `role_menu` VALUES ('36', '3', '28');
INSERT INTO `role_menu` VALUES ('37', '3', '29');
INSERT INTO `role_menu` VALUES ('38', '3', '31');
INSERT INTO `role_menu` VALUES ('39', '3', '32');
INSERT INTO `role_menu` VALUES ('40', '3', '33');
INSERT INTO `role_menu` VALUES ('41', '3', '34');
INSERT INTO `role_menu` VALUES ('42', '3', '35');
INSERT INTO `role_menu` VALUES ('43', '3', '36');
INSERT INTO `role_menu` VALUES ('114', '4', '9');
INSERT INTO `role_menu` VALUES ('113', '4', '7');
INSERT INTO `role_menu` VALUES ('46', '3', '37');
INSERT INTO `role_menu` VALUES ('47', '3', '39');
INSERT INTO `role_menu` VALUES ('48', '3', '38');
INSERT INTO `role_menu` VALUES ('49', '6', '75');
INSERT INTO `role_menu` VALUES ('50', '6', '76');
INSERT INTO `role_menu` VALUES ('51', '6', '77');
INSERT INTO `role_menu` VALUES ('52', '6', '24');
INSERT INTO `role_menu` VALUES ('53', '6', '37');
INSERT INTO `role_menu` VALUES ('54', '6', '38');
INSERT INTO `role_menu` VALUES ('55', '6', '7');
INSERT INTO `role_menu` VALUES ('56', '6', '9');
INSERT INTO `role_menu` VALUES ('115', '4', '24');
INSERT INTO `role_menu` VALUES ('112', '5', '24');
INSERT INTO `role_menu` VALUES ('111', '5', '77');
INSERT INTO `role_menu` VALUES ('110', '5', '76');
INSERT INTO `role_menu` VALUES ('109', '5', '75');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dept_id` bigint(20) NOT NULL COMMENT '归属部门',
  `username` varchar(30) NOT NULL COMMENT '用户名登录使用',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `realname` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `tel` varchar(30) DEFAULT NULL COMMENT '电话',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(300) DEFAULT NULL COMMENT '用户头像',
  `job_title` varchar(30) DEFAULT NULL COMMENT '职务名称',
  `status` tinyint(2) DEFAULT '0' COMMENT '用户状态。0：正常；1：禁用',
  `sort` int(11) DEFAULT '0' COMMENT '排序。值越小越靠前',
  `del_flag` int(11) DEFAULT '0' COMMENT '删除标识。0：未删除；1：已删除',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', 'kappy', '123456', '张三', '男', '135456123789', 'yishuihan@163.com', null, 'chengxuyuan', '0', '1', '0', '12', null, '2020-06-15 10:51:08');
INSERT INTO `user` VALUES ('2', '3', 'kevin', '123456', '李四', '男', '135456123789', 'yishuihan@163.com', null, 'chengxuyuan', '0', '1', '0', '12', null, '2020-06-15 10:51:14');
INSERT INTO `user` VALUES ('3', '2', 'lily', '123456', '小李', '男', '135456123789', 'yishuihan@163.com', null, 'chengxuyuan', '1', '1', '0', '12', null, '2020-06-15 10:51:15');
INSERT INTO `user` VALUES ('4', '36', 'lucy', '123456', '王肃', '男', '135456123789', 'yishuihan@163.com', null, '1', '1', '1', '0', '12', null, '2020-06-15 10:51:17');
INSERT INTO `user` VALUES ('5', '36', 'admin', '123456', '莉莉', '女', '135456123789', 'yishuihan@163.com', null, 'chengxuyuan', '1', '1', '0', '12', null, '2020-06-15 10:51:18');
INSERT INTO `user` VALUES ('6', '2', 'zhangsan', '123456', '王二', '男', '135456123789', 'yishuihan@163.com', null, 'chengxuyuan', '1', '1', '0', '12', null, '2020-06-15 10:51:19');
INSERT INTO `user` VALUES ('7', '3', 'lisi', '123456', '丽丽', '女', '135456123789', 'yishuihan@163.com', null, 'chengxuyuan', '0', '1', '0', '12', null, '2020-06-15 10:51:20');
INSERT INTO `user` VALUES ('8', '2', 'wangwu', '123456', '小红', '女', '135456123789', 'yishuihan@163.com', null, 'chengxuyuan', '0', '1', '0', '12', null, '2020-06-15 10:51:22');
INSERT INTO `user` VALUES ('9', '36', 'zhaoliu', '123456', '天天', '女', '135456123789', 'yishuihan@163.com', null, 'chengxuyuan', '0', '1', '0', '12', null, '2020-06-15 10:51:23');
INSERT INTO `user` VALUES ('10', '36', 'liqi2', '123456', '会回2', '女', '135456123789', 'yishuihan@163.com', null, 'chengxuyuan', '1', '1', '0', '12', null, '2020-06-15 10:51:26');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('4', '2', '14', null);
INSERT INTO `user_role` VALUES ('5', '4', '14', null);
INSERT INTO `user_role` VALUES ('6', '20', '2', null);
INSERT INTO `user_role` VALUES ('7', '20', '4', null);
