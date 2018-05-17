/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : db_ishopmall

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-11-24 20:38:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_item_cat`
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_cat`;
CREATE TABLE `tb_item_cat` (
  `id` varchar(10) NOT NULL COMMENT '节点唯一id',
  `parent_id` varchar(10) DEFAULT NULL COMMENT '父节点',
  `name` varchar(30) DEFAULT NULL COMMENT '节点名称',
  `status` varchar(10) DEFAULT NULL COMMENT '节点状态',
  `sort_order` varchar(10) DEFAULT NULL COMMENT '排序',
  `create` datetime DEFAULT NULL COMMENT '创建时间',
  `update` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_item_cat
-- ----------------------------
INSERT INTO `tb_item_cat` VALUES ('1', '0', '数码/科技', '1', '1', null, null);
INSERT INTO `tb_item_cat` VALUES ('10', '0', '杩愬姩/鎴峰', '1', '6', null, null);
INSERT INTO `tb_item_cat` VALUES ('11', '0', '闉嬮澊/绠卞寘', '1', '8', null, null);
INSERT INTO `tb_item_cat` VALUES ('12', '0', '娴嬭瘯/娴嬭瘯', '1', '9', null, null);
INSERT INTO `tb_item_cat` VALUES ('13', '0', '娴嬭瘯/娴嬭瘯', null, null, null, null);
INSERT INTO `tb_item_cat` VALUES ('14', '0', '娴嬭瘯/娴嬭瘯', null, null, null, null);
INSERT INTO `tb_item_cat` VALUES ('15', '0', '娴嬭瘯/娴嬭瘯', null, null, null, null);
INSERT INTO `tb_item_cat` VALUES ('16', '0', '娴嬭瘯/娴嬭瘯', null, null, null, null);
INSERT INTO `tb_item_cat` VALUES ('17', '0', '娴嬭瘯/娴嬭瘯', null, null, null, null);
INSERT INTO `tb_item_cat` VALUES ('18', '0', '娴嬭瘯/娴嬭瘯', null, null, null, null);
INSERT INTO `tb_item_cat` VALUES ('19', '0', '娴嬭瘯/娴嬭瘯', null, null, null, null);
INSERT INTO `tb_item_cat` VALUES ('2', '1', '鏄惧崱', '1', '1', null, null);
INSERT INTO `tb_item_cat` VALUES ('3', '1', '涓绘澘', '1', '1', null, null);
INSERT INTO `tb_item_cat` VALUES ('4', '0', '二次元/动漫', '1', '2', null, null);
INSERT INTO `tb_item_cat` VALUES ('5', '4', '手办', '1', '2', null, null);
INSERT INTO `tb_item_cat` VALUES ('6', '0', '椋熷搧/闆堕', '1', '3', null, null);
INSERT INTO `tb_item_cat` VALUES ('7', '0', 'DIY/鐢佃剳閰嶄欢', '1', '4', null, null);
INSERT INTO `tb_item_cat` VALUES ('8', '0', '娓告垙/鍗曟満', '1', '5', null, null);
INSERT INTO `tb_item_cat` VALUES ('9', '0', '鏈嶈/鎼厤', '1', '7', null, null);

-- ----------------------------
-- Table structure for `tb_mall_notice`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_notice`;
CREATE TABLE `tb_mall_notice` (
  `notice_id` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `notice_type` int(10) NOT NULL COMMENT '公告类别，1表示普通公告，2表示特惠通知',
  `notice_state` int(10) NOT NULL COMMENT '状态，0为不启用，1为启用',
  `notice_write` varchar(200) DEFAULT NULL COMMENT '公告内容',
  `notice_title` varchar(50) DEFAULT NULL COMMENT '公告标题',
  `notice_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mall_notice
-- ----------------------------
INSERT INTO `tb_mall_notice` VALUES ('00001', '1', '1', 'noticeTXT/1.txt', '《正义联盟》拯救世界的英雄戏码', '2017-11-24 18:48:29');
INSERT INTO `tb_mall_notice` VALUES ('00002', '1', '1', 'noticeTXT/2.txt', '×张毛爷爷，搞定靓妆容', '2017-11-24 18:10:11');
INSERT INTO `tb_mall_notice` VALUES ('00003', '1', '1', '测试公告3', '测试公告3', '2017-11-21 18:58:26');
INSERT INTO `tb_mall_notice` VALUES ('00004', '2', '1', '测试公告4', '测试公告4', '2017-11-21 18:58:28');
INSERT INTO `tb_mall_notice` VALUES ('00005', '2', '0', '测试公告5-不启用的', '测试公告5', '2017-11-21 18:58:29');

-- ----------------------------
-- Table structure for `tb_prods_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tb_prods_comment`;
CREATE TABLE `tb_prods_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `prod_id` varchar(50) DEFAULT NULL COMMENT '评论的商品',
  `user_id` varchar(50) DEFAULT NULL COMMENT '评论用户id',
  `content` varchar(50) DEFAULT NULL COMMENT '评论内容',
  `status` int(11) DEFAULT NULL COMMENT '1-显示，0-不显示',
  `content_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  `reply_content` varchar(50) DEFAULT NULL COMMENT '回复内容',
  `reply_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '回复时间',
  `reply_person` varchar(50) DEFAULT NULL COMMENT '回复人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_prods_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_prods_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_prods_info`;
CREATE TABLE `tb_prods_info` (
  `id` varchar(50) NOT NULL COMMENT '商品id',
  `class_id` varchar(50) DEFAULT NULL COMMENT '一级栏目',
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `title` varchar(50) DEFAULT NULL COMMENT '商品副标题',
  `sale_price` double(50,2) DEFAULT NULL COMMENT '商品价格，单位为：元',
  `promotion_price` double(50,2) DEFAULT NULL COMMENT '促销价',
  `prods_num` int(11) DEFAULT NULL COMMENT '库存数量',
  `sale_num` int(11) DEFAULT NULL COMMENT '销售量',
  `imgurl` varchar(100) DEFAULT NULL COMMENT '图片上传时用逗号拼接',
  `remark` varchar(100) DEFAULT NULL COMMENT '商品描述',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上架时间',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `status` int(11) DEFAULT NULL COMMENT '1-正常，2-下架，3-删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_prods_info
-- ----------------------------
INSERT INTO `tb_prods_info` VALUES ('00ad717b-1b1d-493f-81c8-6d24280362db', '5', 'GSC现货手办吉普莉尔游戏人生授权正版', '全新到货游戏人生吉普莉尔', '1300.00', '1150.00', '10', '2', 'test', '商品描述', '2017-11-24 18:15:17', '2017-11-24 16:32:59', '1');

-- ----------------------------
-- Table structure for `tb_prods_orders`
-- ----------------------------
DROP TABLE IF EXISTS `tb_prods_orders`;
CREATE TABLE `tb_prods_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_id` varchar(100) DEFAULT NULL COMMENT '订单id',
  `prod_id` varchar(100) DEFAULT NULL COMMENT '商品id',
  `prod_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `prod_price` double(50,2) DEFAULT NULL COMMENT '商品价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_prods_orders
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_prods_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_prods_type`;
CREATE TABLE `tb_prods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `prod_id` varchar(50) DEFAULT NULL COMMENT '商品表_商品id',
  `type_id` int(11) NOT NULL COMMENT '属性id',
  `type_name` varchar(50) DEFAULT NULL COMMENT '属性名，例：1-颜色，2-口味',
  `type_value_id` int(11) DEFAULT NULL COMMENT '属性值id',
  `type_value_name` varchar(50) DEFAULT NULL COMMENT '属性值，例：1-1-黑色，2-1-原味',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_prods_type
-- ----------------------------
INSERT INTO `tb_prods_type` VALUES ('1', '00ad717b-1b1d-493f-81c8-6d24280362db', '1', '版本', '1', '日本');
INSERT INTO `tb_prods_type` VALUES ('2', '00ad717b-1b1d-493f-81c8-6d24280362db', '1', '版本', '2', '中国');
INSERT INTO `tb_prods_type` VALUES ('3', '00ad717b-1b1d-493f-81c8-6d24280362db', '2', '型号', '1', '经典版');
INSERT INTO `tb_prods_type` VALUES ('4', '00ad717b-1b1d-493f-81c8-6d24280362db', '2', '版本', '2', '典藏版');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(100) NOT NULL COMMENT '用户id',
  `user_name` varchar(30) NOT NULL COMMENT '用户密码',
  `user_password` varchar(100) NOT NULL COMMENT '用户名称',
  `user_telphone` varchar(11) DEFAULT NULL COMMENT '用户号码',
  `user_email` varchar(32) DEFAULT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_telphone` (`user_telphone`),
  UNIQUE KEY `email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('003c717b-1b1d-493f-81c8-6d24280362db', '944989036', '202cb962ac59075b964b07152d234b70', null, 'asdadsad9036@qq.com');
INSERT INTO `user` VALUES ('02a92754-951e-42f0-bca5-96cad531843d', '944989036', '202cb962ac59075b964b07152d234b70', null, '2525036@qq.com');
INSERT INTO `user` VALUES ('2d1533ed-3e8b-4ff5-87bb-4fb877af5206', '944989036', '202cb962ac59075b964b07152d234b70', null, 'sadasdad9036@qq.com');
INSERT INTO `user` VALUES ('756ea6b4-bdcb-4a2d-ba5e-8f6b4bded5f0', '944989036', '81dc9bdb52d04dc20036dbd8313ed055', null, '222036@qq.com');
INSERT INTO `user` VALUES ('96323df4-5cf8-45bb-846f-348ffc753a9a', '944989036', '202cb962ac59075b964b07152d234b70', null, 'sdada9036@qq.com');
INSERT INTO `user` VALUES ('9a21b592-e067-4d4f-a4d5-ef750154de19', '944989036', '202cb962ac59075b964b07152d234b70', '18826057409', '55255036@qq.com');
INSERT INTO `user` VALUES ('9d131ad6-1120-43b8-9c3c-4d663891b7ea', '944989036', '81dc9bdb52d04dc20036dbd8313ed055', null, '944989036@qq.com');
INSERT INTO `user` VALUES ('a65394f5-b370-45b0-a717-ed7b92075608', '944989036', '81dc9bdb52d04dc20036dbd8313ed055', null, '225559036@qq.com');
INSERT INTO `user` VALUES ('a97057a0-7d00-4ade-9fdd-677d9c5414be', '54656', '202cb962ac59075b964b07152d234b70', '156456', '11656325036@qq.com');
INSERT INTO `user` VALUES ('c5949614-dbc9-44b6-9b0a-667ba9bd07d2', 'nana', 'f379eaf3c831b04de153469d1bec345e', null, '1138575934@qq.com');
INSERT INTO `user` VALUES ('c834f877-38ea-41d0-a84c-65ad2964a1ef', 'meng', '88d356f8eaa4be602010ceb088073302', null, '870957802@qq.com');
INSERT INTO `user` VALUES ('d95fea9b-f741-47a3-a2c1-41771b6c9c9e', '944989036', '202cb962ac59075b964b07152d234b70', '555057409', null);
INSERT INTO `user` VALUES ('e3df8d82-b918-4fa1-9ea2-520af862e125', '944989036', '81dc9bdb52d04dc20036dbd8313ed055', null, '25852036@qq.com');
INSERT INTO `user` VALUES ('e715e6d8-e9cd-4d97-843d-5071b3b7befe', '944989036', '202cb962ac59075b964b07152d234b70', null, '434349036@qq.com');
INSERT INTO `user` VALUES ('f528978c-a3fd-425e-9078-ff6702b0284c', '944989036', '202cb962ac59075b964b07152d234b70', null, 'asdada9036@qq.com');

-- ----------------------------
-- Table structure for `user_address`
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `address_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_phone` varchar(13) NOT NULL,
  `user_address` varchar(120) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_address
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` varchar(100) NOT NULL COMMENT '用户id',
  `user_gender` tinyint(5) DEFAULT NULL COMMENT '性别',
  `user_birthday` date DEFAULT NULL COMMENT '用户生日',
  `user_photopath` varchar(20) DEFAULT NULL COMMENT '用户头像路径',
  `user_status` tinyint(5) DEFAULT NULL COMMENT '激活状态',
  `user_permissions` varchar(20) DEFAULT NULL COMMENT '权限',
  `user_code` varchar(40) DEFAULT NULL COMMENT '邮箱激活码',
  `user_regtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_money` double(50,2) DEFAULT NULL COMMENT '用户账户余额',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('003c717b-1b1d-493f-81c8-6d24280362db', null, '0000-00-00', null, '1', 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 14:09:49', '0.00');
INSERT INTO `user_info` VALUES ('02a92754-951e-42f0-bca5-96cad531843d', null, null, null, '1', 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 11:03:34', '500.00');
INSERT INTO `user_info` VALUES ('0ac00177-67e9-461b-97cc-2fb8a35cedb6', null, null, null, '0', 'user', '39f44b594c3301552fa71b19ee02cbf1', '2017-11-24 11:03:36', '585.00');
INSERT INTO `user_info` VALUES ('2d1533ed-3e8b-4ff5-87bb-4fb877af5206', null, null, null, '1', 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 11:03:42', '2100.00');
INSERT INTO `user_info` VALUES ('756ea6b4-bdcb-4a2d-ba5e-8f6b4bded5f0', null, null, null, '1', 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 11:03:44', '696.00');
INSERT INTO `user_info` VALUES ('96323df4-5cf8-45bb-846f-348ffc753a9a', null, null, null, '1', 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 11:03:47', '32.00');
INSERT INTO `user_info` VALUES ('9a21b592-e067-4d4f-a4d5-ef750154de19', null, null, null, '1', 'user', 'abfcb53d1baabd989fd699b8618da615', '2017-11-24 11:03:51', '65.24');
INSERT INTO `user_info` VALUES ('9d131ad6-1120-43b8-9c3c-4d663891b7ea', null, null, null, '1', 'user', 'abfcb53d1baabd989fd699b8618da615', '2017-11-24 11:03:54', '786.40');
INSERT INTO `user_info` VALUES ('a65394f5-b370-45b0-a717-ed7b92075608', null, null, null, '0', 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 11:03:56', '526.00');
INSERT INTO `user_info` VALUES ('a97057a0-7d00-4ade-9fdd-677d9c5414be', null, null, null, '1', 'user', 'bab3f5e3b799b35e9b5a1e5c59ea5d94', '2017-11-24 11:03:59', '698.00');
INSERT INTO `user_info` VALUES ('c5949614-dbc9-44b6-9b0a-667ba9bd07d2', null, null, null, '1', 'user', '93d19f06ff15af7e5b858e243a9e76ca', '2017-11-24 12:01:28', '50.20');
INSERT INTO `user_info` VALUES ('c834f877-38ea-41d0-a84c-65ad2964a1ef', null, null, null, '0', 'user', '39f44b594c3301552fa71b19ee02cbf1', '2017-11-24 11:04:02', '46.00');
INSERT INTO `user_info` VALUES ('d95fea9b-f741-47a3-a2c1-41771b6c9c9e', null, null, null, '1', 'user', null, '2017-11-24 11:04:07', '257.00');
INSERT INTO `user_info` VALUES ('e3df8d82-b918-4fa1-9ea2-520af862e125', null, null, null, '1', 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 11:04:08', '89.00');
INSERT INTO `user_info` VALUES ('e715e6d8-e9cd-4d97-843d-5071b3b7befe', null, null, null, '0', 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 11:04:10', '3787.00');
INSERT INTO `user_info` VALUES ('f528978c-a3fd-425e-9078-ff6702b0284c', null, null, null, '1', 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 11:04:12', '6896.00');
