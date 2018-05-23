/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50543
 Source Host           : localhost:3306
 Source Schema         : db_ishopmall

 Target Server Type    : MySQL
 Target Server Version : 50543
 File Encoding         : 65001

 Date: 23/05/2018 14:02:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('admin', '123');
INSERT INTO `admin_user` VALUES ('taikoo', '123');

-- ----------------------------
-- Table structure for tb_authorization
-- ----------------------------
DROP TABLE IF EXISTS `tb_authorization`;
CREATE TABLE `tb_authorization`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_item_cat
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_cat`;
CREATE TABLE `tb_item_cat`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '节点唯一id',
  `parent_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点状态',
  `sort_order` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_item_cat
-- ----------------------------
INSERT INTO `tb_item_cat` VALUES (0, '-1', '商品类别', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (1, '0', '数码/科技', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (4, '0', '二次元/动漫', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (6, '0', '鲜花/宠物', '1', '3', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (7, '0', '女装/男装', '1', '4', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (8, '0', '美妆/保健品', '1', '5', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (9, '0', '运动/户外', '1', '7', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (10, '0', '鞋靴/箱包', '1', '6', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (11, '0', '珠宝/眼镜', '1', '8', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (12, '0', '家具/家饰', '1', '9', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (13, '0', '零食/美食', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (15, '13', '威化饼干1', '1', '3', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (17, '0', '汽车/二手车', '1', '11', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (18, '0', '办公/DIY', '1', '12', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (75, '13', '蛋黄派', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (76, '4', '圣斗士星矢', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (77, '1', 'Sony笔记本', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (88, '0', '百货/餐厨', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (94, '0', '童装玩具/孕产', '1', NULL, NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (95, '0', '房产/装修', '1', NULL, NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (96, '0', '学习/卡券', '1', NULL, NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (101, '6', '多肉植物', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (102, '6', '花卉', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (104, '6', '泰迪', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (106, '7', '羊毛大衣', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (107, '7', '西装', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (108, '8', '补水美白', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (109, '8', '口服液', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (110, '9', '健身', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (111, '9', '游泳', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (112, '10', '马丁靴', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (113, '10', '男包', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (114, '11', '琥珀', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (115, '11', '护目镜', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (116, '12', '茶几餐桌', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (117, '12', '书桌', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (118, '17', '宝马', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (119, '17', '法拉利', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (120, '18', '打印机', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (121, '18', '点钞机', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (122, '18', '木版画', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (123, '1', '显卡', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (124, '1', '键盘', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (125, '4', '手办', '1', '1', NULL, NULL);
INSERT INTO `tb_item_cat` VALUES (126, '13', '夹心饼干', '1', '1', NULL, NULL);

-- ----------------------------
-- Table structure for tb_mall_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_notice`;
CREATE TABLE `tb_mall_notice`  (
  `notice_id` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `notice_type` int(10) NOT NULL COMMENT '公告类别，1表示普通公告，2表示特惠通知',
  `notice_state` int(10) NOT NULL COMMENT '状态，0为不启用，1为启用',
  `notice_write` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `notice_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_mall_notice
-- ----------------------------
INSERT INTO `tb_mall_notice` VALUES (00001, 1, 1, 'noticeTXT/1.txt', '《正义联盟》拯救世界的英雄戏码', '2017-11-24 18:48:29');
INSERT INTO `tb_mall_notice` VALUES (00002, 1, 1, 'noticeTXT/2.txt', '×张毛爷爷，搞定靓妆容', '2017-11-24 18:10:11');
INSERT INTO `tb_mall_notice` VALUES (00003, 1, 1, 'noticeTXT/3.txt', '【早报】罗永浩自曝新品 / 贝索斯身家超过 1000 亿美金 / Steam 「吃鸡」在线人数破新高', '2017-11-27 11:17:38');
INSERT INTO `tb_mall_notice` VALUES (00004, 2, 1, '测试公告4', '测试公告4', '2017-11-21 18:58:28');
INSERT INTO `tb_mall_notice` VALUES (00005, 2, 0, '测试公告5-不启用的', '测试公告5', '2017-11-21 18:58:29');

-- ----------------------------
-- Table structure for tb_orders_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_orders_info`;
CREATE TABLE `tb_orders_info`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `prod_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `prod_imgurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `prod_num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `pay_money` double(50, 2) NULL DEFAULT NULL COMMENT '应支付金额',
  `distribution` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送方式',
  `post_fee` int(30) NULL DEFAULT NULL COMMENT '快递费',
  `end_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交易完成时间',
  `pay_monent` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `shipping_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流名称',
  `shipping_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `user_receiver` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人名称',
  `user_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人手机号码',
  `user_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `user_city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `user_district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人地址',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `buyer_nick` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家留言',
  `buyer_rate` int(11) NULL DEFAULT NULL COMMENT '买家是否已经评价，1-评价，0-为评价',
  `status` int(11) NULL DEFAULT NULL COMMENT '1-代付款，2-代发货，3-待收货，4-待评论',
  `pay_status` int(11) NULL DEFAULT NULL COMMENT '1-已支付，2-未支付，0-失效',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单创建时间',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_orders_info
-- ----------------------------
INSERT INTO `tb_orders_info` VALUES ('00a0cf28-6f45-4c89-8e21-784ff78f4174', '4d1807c6-0e49-4234-8695-5849d58376b5', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 10:11:16', '银联', '顺丰', 'fe7050d7-d275-4f58-a823-cae3262cf25e', '区振业', '18575783085', '香港特别行政区', '香港岛', '湾仔', '我要测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 10:11:16', '2017-11-30 10:11:16');
INSERT INTO `tb_orders_info` VALUES ('1', '783f67ca-6042-44a4-be52-4f1eca5ec182', 'ishopmall/images/520.jpg', 10, NULL, '快递', 20, '2017-11-30 14:24:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c834f877-38ea-41d0-a84c-65ad2964a1ef', NULL, 0, 2, 2, '2017-11-30 10:11:16', '2017-11-30 10:11:16');
INSERT INTO `tb_orders_info` VALUES ('1342fb30-c011-44a4-92e3-30c867e4d678', 'c6d53d2f-035c-4969-9dab-6c3e1aedccf7', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:13:59', '银联', '申通', '500cf918-bde3-419e-8e5b-b7009c55e97b', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 12:13:59', '2017-11-30 12:13:59');
INSERT INTO `tb_orders_info` VALUES ('1c4fb185-76fd-48c6-a095-094e900d22a3', '94668e01-0b50-4fc7-8255-a792a17d8f17', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:03:42', '银联', '申通', '7e2b5113-4ba9-4131-9169-e5ddb93e5915', '测试', '18575783085', '北京', '北京市', '东城区', '我要支付成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 12:03:42', '2017-11-30 12:03:42');
INSERT INTO `tb_orders_info` VALUES ('222d519a-5a90-49ef-be86-9bbd996be30a', '72978c74-e6d3-41cd-918c-b453aa14d615', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 14:46:09', '微信', '顺丰', 'fc81027e-76f3-464f-aac7-6412d0eb1e86', '区振业', '18575783085', '香港特别行政区', '香港岛', '湾仔', '我要测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 1, 1, '2017-11-30 14:46:00', '2017-11-30 14:46:09');
INSERT INTO `tb_orders_info` VALUES ('240835c4-dab3-44d8-9462-396bdccc417a', 'fad32295-6d7d-4e97-a27d-bbedb0678e05', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:54:22', '银联', '中通', '8f3a9682-a166-45c2-ba49-6d336f00728a', '测试', '18575783085', '北京', '北京市', '东城区', '我要支付成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:54:22', '2017-11-30 11:54:22');
INSERT INTO `tb_orders_info` VALUES ('27c2c53d-54da-4524-8c38-5f1ca85734c8', '34a198fa-23af-47fc-8ece-03d1be22d163', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:49:14', '银联', '圆通', 'dbf19762-034a-4ef1-a542-5320eb5e70c7', '区振业', '18575783085', '香港特别行政区', '香港岛', '湾仔', '我要测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:49:14', '2017-11-30 11:49:14');
INSERT INTO `tb_orders_info` VALUES ('2d967821-ec89-4620-9573-0618c503828a', '67a18744-241f-4eda-81ee-39b5b6fa9280', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 09:11:31', '银联', '韵达', '3d6fe0d4-d532-40db-bd32-a3517c5aadd2', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 09:11:31', '2017-11-30 09:11:31');
INSERT INTO `tb_orders_info` VALUES ('2dc63f25-4433-4af9-b5d0-f0aa94a62007', '0be36836-cd99-4514-b1a0-9edd8b9c6f42', 'ishopmall/images/520.jpg', 100, 1130.00, '快递', 10, '2017-11-30 16:34:02', '银联', '顺丰', '59de10b4-0070-4310-9890-d1a059e90e82', 'ouzhenye', '18575783078', '香港特别行政区', '九龙', '九龙城区', '测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 16:34:02', '2017-11-30 16:34:02');
INSERT INTO `tb_orders_info` VALUES ('41880b04-6b33-4dea-854d-627851c16d75', '41a9a664-9354-449d-954c-190fd87e7dfa', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:24:41', '银联', '圆通', 'e6a9f98f-40df-4bdc-8436-28e0c1a61a00', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 12:24:41', '2017-11-30 12:24:41');
INSERT INTO `tb_orders_info` VALUES ('445b379f-66c9-4b84-a5ae-4cf725dd60d1', '8885be8e-1081-4e9f-b05a-a92f321ebbee', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 10:08:14', '银联', '申通', '11352a14-224c-4c1f-8fc5-c703028a2f7a', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 10:08:14', '2017-11-30 10:08:14');
INSERT INTO `tb_orders_info` VALUES ('4608ccfe-e70f-4e1e-a1e5-9d0a5fd074e9', 'c39e34f5-e86f-4990-9b66-bc4d972e63e3', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:16:57', '银联', '韵达', '0bf24f0d-cd58-4fe0-b30c-6f612edd467e', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:16:57', '2017-11-30 11:16:57');
INSERT INTO `tb_orders_info` VALUES ('4de8a663-9ac6-4654-b6f1-9b683463f80e', 'adca31a1-f15a-4e4a-ade1-e7c778ed8a59', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:53:16', '银联', '圆通', 'e562ac46-733a-4e80-8fe9-a072501eafa0', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 12:53:16', '2017-11-30 12:53:16');
INSERT INTO `tb_orders_info` VALUES ('52a345bf-b2e0-4f99-857d-ec1ea533f17f', '0a4d0d69-820b-47b8-b357-629a8a18ffb0', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:35:41', '银联', '圆通', 'f1ff30e7-efa8-427b-be61-c605daea6634', '测试', '18575783085', '北京', '北京市', '东城区', '我要支付成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:35:41', '2017-11-30 11:35:41');
INSERT INTO `tb_orders_info` VALUES ('5a26ef82-e9ce-469e-a7ac-93cbfa07142f', 'd38bda02-c7f5-49da-b5fe-8c39f1e7c130', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:57:47', '银联', '韵达', '6bf47cc7-9c2c-4ab2-af21-d290bb32e486', '测试', '18575783085', '北京', '北京市', '东城区', '我要支付成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:57:47', '2017-11-30 11:57:47');
INSERT INTO `tb_orders_info` VALUES ('61d52b5e-d5c7-4374-ad9f-23152ffeb4fa', '1831369f-6eb8-498b-8321-8e50b984cb78', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:59:53', '银联', '申通', '3e30e068-e6a3-4b12-b4cf-47e0797c1115', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 1, 1, '2017-11-30 12:58:42', '2017-11-30 12:59:53');
INSERT INTO `tb_orders_info` VALUES ('64b213ee-5b19-45f9-9a4f-bf3874bd1b7e', '27dda9ed-7a25-48e4-80f1-371491333857', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:34:56', '银联', '中通', 'b550d74d-492e-4845-9f5c-0c6671768eca', '测试', '18575783085', '北京', '北京市', '东城区', '我要支付成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:34:56', '2017-11-30 11:34:56');
INSERT INTO `tb_orders_info` VALUES ('662fae6a-c71c-4102-a252-44d182cd5177', '9e889ec9-a65f-406b-be74-6d132e67c44b', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:34:04', '银联', '顺丰', '1165f7c3-d15e-41fe-9c20-6acd68ee478b', '测试', '18575783085', '北京', '北京市', '东城区', '我要支付成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:34:04', '2017-11-30 11:34:04');
INSERT INTO `tb_orders_info` VALUES ('7156731b-838b-4354-b276-fa801857c527', 'da18c375-c95a-4ad8-bd74-d5b9d660a5a7', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:12:40', '银联', '韵达', 'fca634f5-6b36-409a-80c4-cf55c32651e9', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 12:12:40', '2017-11-30 12:12:40');
INSERT INTO `tb_orders_info` VALUES ('7761d297-1ff6-4ad6-9ef0-1a30bed12359', '9e539dc7-4af3-4fd6-b659-516efc64f7f2', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:11:02', '银联', '申通', 'f3dfb2e5-c178-4f58-8b9c-0679e846ec52', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 12:11:02', '2017-11-30 12:11:02');
INSERT INTO `tb_orders_info` VALUES ('8a7bab09-b7c3-44ec-b34c-698920061917', '064cb49d-03e6-4f34-92b5-ff65aa586b1f', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:50:09', '银联', '申通', 'cebcc78c-8674-41df-b520-e10a3ac4bf18', '区振业', '18575783085', '香港特别行政区', '香港岛', '湾仔', '我要测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:50:09', '2017-11-30 11:50:09');
INSERT INTO `tb_orders_info` VALUES ('966d33b8-98dc-4686-81b3-f335c56f7416', '1e71a85d-f61c-417b-a711-fa82cd404868', 'ishopmall/images/520.jpg', 100, 1130.00, '快递', 10, '2017-11-30 16:35:15', '支付宝', '申通', '0c6645da-81f4-4341-b0bc-d257fba6a81d', 'ouzhenye', '18575783078', '香港特别行政区', '九龙', '九龙城区', '测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 1, 1, '2017-11-30 16:35:00', '2017-11-30 16:35:15');
INSERT INTO `tb_orders_info` VALUES ('967bc89c-30ef-4dfe-9926-0b0dc5962dea', '0e8048fa-0c1a-402d-a4b0-596b63f525bf', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:37:47', '银联', '申通', '3a0cbf61-279b-4582-8a48-33c2e816b342', '区振业', '18575783085', '香港特别行政区', '香港岛', '湾仔', '我要测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:37:47', '2017-11-30 11:37:47');
INSERT INTO `tb_orders_info` VALUES ('9d5f804c-4ecc-4f4b-966e-cafba276dac1', 'ad7a3064-818d-461c-b7b4-beb2c1198c20', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:44:14', '银联', '申通', '684ec47a-2f6c-4b34-9665-28d4cc88d3c7', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 12:44:14', '2017-11-30 12:44:14');
INSERT INTO `tb_orders_info` VALUES ('9e53dc9d-e461-41a2-a4cb-1abd7e50d9ba', '45fb6306-65c2-4dd1-bb94-6c8b59506c1f', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:25:26', '银联', '申通', '43a0f12b-63eb-4cf8-86d7-673b027ad32a', '区振业', '18575783085', '香港特别行政区', '香港岛', '湾仔', '我要测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 12:25:26', '2017-11-30 12:25:26');
INSERT INTO `tb_orders_info` VALUES ('a5093bb1-4cf3-49cd-954a-b228ba0b9c5c', 'a005e665-0f51-47ec-a07d-a04db8d56aaf', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:45:40', '银联', '韵达', '7a283ef4-7d61-4eb6-aef0-d4164670458c', '区振业', '18575783085', '香港特别行政区', '香港岛', '湾仔', '我要测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:45:40', '2017-11-30 11:45:40');
INSERT INTO `tb_orders_info` VALUES ('ac91ec0d-a702-4d0f-bc40-a9b4fbcc147f', '04f39fcd-9b8c-4cc6-b2d4-845339ed1de8', 'ishopmall/images/520.jpg', 100, 1130.00, '快递', 10, '2017-11-30 16:35:53', '微信', '申通', '4678f1e6-52a4-4051-9a46-72ee3a7fb4c9', 'ouzhenye', '18575783078', '香港特别行政区', '九龙', '九龙城区', '测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 1, 1, '2017-11-30 16:35:43', '2017-11-30 16:35:53');
INSERT INTO `tb_orders_info` VALUES ('ad3d6db8-afe6-4c5c-a2eb-62719addf3a2', 'af7e77e7-388d-489b-b8fa-97cd06e9bb25', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:23:12', '银联', '中通', '9e744ef6-fb01-4d2f-9adf-6f88ae55f89b', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:23:12', '2017-11-30 11:23:12');
INSERT INTO `tb_orders_info` VALUES ('ba14c324-6e5e-4b62-b612-6a9f0447915b', 'e8799348-cce9-4fd9-a65b-be6f446bb614', 'ishopmall/images/520.jpg', 100, 1130.00, '快递', 10, '2017-11-30 15:47:53', '微信', '申通', 'c92a847f-5176-4ef3-b900-ed68e9f8fa2a', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 1, 1, '2017-11-30 15:47:48', '2017-11-30 15:47:53');
INSERT INTO `tb_orders_info` VALUES ('c77a866d-1351-4494-b410-d963dd36d035', 'fad39308-e22a-4f50-b1c4-2ddef5e906fa', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 14:12:40', '支付宝', '中通', 'fb2ed5d3-784c-45d2-86e3-50721d447613', '测试', '18575783085', '北京', '北京市', '东城区', '我要支付成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 14:12:40', '2017-11-30 14:12:40');
INSERT INTO `tb_orders_info` VALUES ('ca45e943-d490-4289-8d0c-388d12a2831b', '80e5227a-8c98-4f8b-b6ba-6be20ba02e0a', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:52:39', '银联', '顺丰', '8776f037-68ff-4281-9e82-159cfb60ec18', '区振业', '18575783085', '香港特别行政区', '香港岛', '湾仔', '我要测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:52:39', '2017-11-30 11:52:39');
INSERT INTO `tb_orders_info` VALUES ('d16c8324-13ea-40ce-99fa-1aeddec1c7d1', '5c8f2385-c726-43f8-b883-6333736363c1', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:38:11', '银联', '申通', 'fc0390b1-1871-4a4f-970a-292c45c27026', '区振业', '18575783085', '香港特别行政区', '香港岛', '湾仔', '我要测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:38:11', '2017-11-30 11:38:11');
INSERT INTO `tb_orders_info` VALUES ('d2da059b-db39-4c0f-bf52-c4719c28c512', '81d840e2-84f9-4d88-8161-62d179a4b260', 'ishopmall/images/520.jpg', 100, 1130.00, '快递', 10, '2017-11-30 15:40:19', '微信', '申通', 'cdafcdce-2a6a-4281-8ae0-da1acf00410a', '区振业', '18575783085', '香港特别行政区', '香港岛', '湾仔', '我要测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 1, 1, '2017-11-30 15:40:00', '2017-11-30 15:40:19');
INSERT INTO `tb_orders_info` VALUES ('d7b25c7c-0998-487d-9812-d84e8f445cfa', '3236470a-d56c-4fb9-9ddc-5fa7b582c0ea', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:29:45', '银联', '申通', 'b397b056-5400-486d-9e17-b6f31c7f2a9f', '区振业', '18575783085', '香港特别行政区', '香港岛', '湾仔', '我要测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 12:29:45', '2017-11-30 12:29:45');
INSERT INTO `tb_orders_info` VALUES ('e1738c1d-c540-4baa-b7d7-808184287590', 'e65cbf3f-6063-460f-9562-57b5456b8816', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:01:41', '银联', '申通', '7372f896-b581-445f-9b3c-4e2c175c9fa9', '测试', '18575783085', '北京', '北京市', '东城区', '我要支付成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 12:01:41', '2017-11-30 12:01:41');
INSERT INTO `tb_orders_info` VALUES ('eefb86a4-d67b-4f2f-a4bf-528805e6181e', '3906b73b-08ad-4646-8961-b4499829eb34', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:59:40', '银联', '申通', 'fa94dba0-b0ee-4725-a281-0b0b0ed6c54e', '测试', '18575783085', '北京', '北京市', '东城区', '我要支付成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:59:40', '2017-11-30 11:59:40');
INSERT INTO `tb_orders_info` VALUES ('f20f0729-165b-4903-9114-a126d3492a11', '4c6bc4ff-e60c-4453-a56c-965776d78446', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 09:26:28', '银联', '中通', '2e17e251-a74d-4b8b-a6d8-4a00d2a6c80e', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 09:26:28', '2017-11-30 09:26:28');
INSERT INTO `tb_orders_info` VALUES ('f3326142-d20b-4674-bb1e-b917c70258bd', 'e74ff0a9-5245-4f5c-8783-33561438e699', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 10:25:21', '银联', '申通', '0f68a2f6-d36b-4823-86ab-342c60f03dcb', '区振业', '18575783085', '香港特别行政区', '香港岛', '湾仔', '我要测试成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 10:25:21', '2017-11-30 10:25:21');
INSERT INTO `tb_orders_info` VALUES ('f49ffc30-369b-46b5-b987-2be91ec2c78d', 'f791c76c-eb91-431e-a7d3-5158a57d80e4', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 11:19:02', '银联', '韵达', '1e1979c8-e57c-4c75-b863-385996733548', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 11:19:02', '2017-11-30 11:19:02');
INSERT INTO `tb_orders_info` VALUES ('f7f33319-466b-4ea5-963e-7819d8008330', '74cdf878-8dfb-43cc-b819-5f6552dd4659', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:05:01', '银联', '申通', '17bc8c9d-c1b7-47d9-a5a0-51902cae8acb', '测试', '18575783085', '北京', '北京市', '东城区', '我要支付成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 12:05:01', '2017-11-30 12:05:01');
INSERT INTO `tb_orders_info` VALUES ('f8fbebe5-279d-4eb8-a76b-66bd7cdf0632', 'c143af62-044f-478f-9eff-211135916dbf', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 14:44:03', '支付宝', '顺丰', 'dbfb9b97-d420-47aa-bbfc-c737b1f8d55c', '测试', '18575783085', '北京', '北京市', '东城区', '我要支付成功', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 1, 1, '2017-11-30 14:43:59', '2017-11-30 14:44:03');
INSERT INTO `tb_orders_info` VALUES ('fd4602e9-0740-4fe6-a6e5-854dfd8e83c4', '783f67ca-6042-44a4-be52-4f1eca5ec182', 'ishopmall/images/520.jpg', 100, 244.00, '快递', 10, '2017-11-30 12:41:22', '银联', '申通', '93b10aa6-2936-4395-9347-eb69fcc25e0f', '欧欧', '18575783085', '内蒙古自治区', '呼和浩特市', '新城区', '我要编辑成功！！！', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 2, 2, '2017-11-30 12:41:22', '2017-11-30 12:41:22');
INSERT INTO `tb_orders_info` VALUES ('fded6999-2f22-4a48-a003-cb8de9ee7da6', 'ed448c7f-5b2e-4c35-a269-c113e28db5cf', 'ishopmall/images/520.jpg', 100, 1130.00, '快递', 10, '2017-11-30 21:40:55', '微信', '圆通', '8dfd4650-4fbb-4132-b912-d2f4c98ec8a4', '良种量', '18575783085', '天津', '天津市', '和平区', '峰会', '015c3c1b-d924-4064-989e-52349a7ecc73', NULL, 0, 1, 1, '2017-11-30 21:40:51', '2017-11-30 21:40:55');

-- ----------------------------
-- Table structure for tb_orders_pays
-- ----------------------------
DROP TABLE IF EXISTS `tb_orders_pays`;
CREATE TABLE `tb_orders_pays`  (
  `id` int(11) NOT NULL COMMENT '序号',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `pay_monent` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式，1-支付宝，2-微信，3-易支付',
  `pay_money` double NULL DEFAULT NULL COMMENT '应支付金额',
  `pay_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付流水号',
  `pay_status` int(11) NULL DEFAULT NULL COMMENT '1-已支付，2-未支付，0-失效',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_orders_shipping
-- ----------------------------
DROP TABLE IF EXISTS `tb_orders_shipping`;
CREATE TABLE `tb_orders_shipping`  (
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `receiver_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人全名',
  `receiver_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机电话',
  `receiver_province` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区县',
  `receiver_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `receiver_zip` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_pays_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_pays_info`;
CREATE TABLE `tb_pays_info`  (
  `id` int(11) NOT NULL COMMENT '支付id',
  `monent` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式,例：支付宝，微信支付，易宝支付',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_prods_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_prods_comment`;
CREATE TABLE `tb_prods_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `prod_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论的商品',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论用户id',
  `content` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `status` int(11) NULL DEFAULT NULL COMMENT '1-显示，0-不显示',
  `content_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  `evaluation` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_prods_comment
-- ----------------------------
INSERT INTO `tb_prods_comment` VALUES (1, '00ad717b-1b1d-493f-81c8-6d24280362db', '1', '这是评论内容', 1, '2017-11-26 11:34:09', 1);
INSERT INTO `tb_prods_comment` VALUES (2, '00ad717b-1b1d-493f-81c8-6d24280362db', '2', '评论', 1, '2017-11-27 20:16:11', 1);
INSERT INTO `tb_prods_comment` VALUES (3, '05e20c1a-0401-4c0a-82ab-6fb0f37db397', 'c834f877-38ea-41d0-a84c-65ad2964a1ef', '这是内容，要求很多，这是内容，要求很多这是内容，要求很多这是内容，要求很多', 1, '2017-11-27 20:16:16', 1);
INSERT INTO `tb_prods_comment` VALUES (5, '00ad717b-1b1d-493f-81c8-6d24280362db', NULL, 'asdadsad', 1, '2017-11-28 15:03:25', NULL);
INSERT INTO `tb_prods_comment` VALUES (6, '00ad717b-1b1d-493f-81c8-6d24280362db', NULL, 'asdadsad', 1, '2017-11-28 15:03:26', NULL);
INSERT INTO `tb_prods_comment` VALUES (7, '00ad717b-1b1d-493f-81c8-6d24280362db', NULL, 'asdasda', 1, '2017-11-28 15:03:27', NULL);
INSERT INTO `tb_prods_comment` VALUES (8, '00ad717b-1b1d-493f-81c8-6d24280362db', NULL, 'asdadsas', 1, '2017-11-28 15:03:27', NULL);
INSERT INTO `tb_prods_comment` VALUES (9, '00ad717b-1b1d-493f-81c8-6d24280362db', NULL, 'sdadsa', 1, '2017-11-28 15:03:27', NULL);
INSERT INTO `tb_prods_comment` VALUES (10, '00ad717b-1b1d-493f-81c8-6d24280362db', NULL, '12312', 1, '2017-11-28 15:03:28', NULL);
INSERT INTO `tb_prods_comment` VALUES (12, '05e20c1a-0401-4c0a-82ab-6fb0f37db397', 'c834f877-38ea-41d0-a84c-65ad2964a1ef', '这是内容，要求很多，这是内容，要求很多这是内容，要求很多这是内容，要求很多', 1, '2017-11-29 16:48:20', 1);
INSERT INTO `tb_prods_comment` VALUES (13, '05e20c1a-0401-4c0a-82ab-6fb0f37db397', 'c834f877-38ea-41d0-a84c-65ad2964a1ef', '3', 1, '2017-11-30 16:51:16', 1);
INSERT INTO `tb_prods_comment` VALUES (14, '05e20c1a-0401-4c0a-82ab-6fb0f37db397', 'c834f877-38ea-41d0-a84c-65ad2964a1ef', '4', 1, '2017-11-30 16:51:19', 1);
INSERT INTO `tb_prods_comment` VALUES (15, '05e20c1a-0401-4c0a-82ab-6fb0f37db397', 'c834f877-38ea-41d0-a84c-65ad2964a1ef', '5', 1, '2017-11-30 16:51:21', 1);
INSERT INTO `tb_prods_comment` VALUES (16, '05e20c1a-0401-4c0a-82ab-6fb0f37db397', 'c834f877-38ea-41d0-a84c-65ad2964a1ef', '6', 1, '2017-11-30 16:51:23', 1);
INSERT INTO `tb_prods_comment` VALUES (17, '05e20c1a-0401-4c0a-82ab-6fb0f37db397', 'c834f877-38ea-41d0-a84c-65ad2964a1ef', '7', 1, '2017-11-30 16:51:28', 1);
INSERT INTO `tb_prods_comment` VALUES (18, '05e20c1a-0401-4c0a-82ab-6fb0f37db397', 'c834f877-38ea-41d0-a84c-65ad2964a1ef', '8', 1, '2017-11-30 16:51:29', 1);
INSERT INTO `tb_prods_comment` VALUES (19, '05e20c1a-0401-4c0a-82ab-6fb0f37db397', 'c834f877-38ea-41d0-a84c-65ad2964a1ef', '9', 1, '2017-11-30 16:51:30', 1);
INSERT INTO `tb_prods_comment` VALUES (20, '05e20c1a-0401-4c0a-82ab-6fb0f37db397', 'c834f877-38ea-41d0-a84c-65ad2964a1ef', '10', 1, '2017-11-30 16:51:36', 1);
INSERT INTO `tb_prods_comment` VALUES (21, '05e20c1a-0401-4c0a-82ab-6fb0f37db397', 'c834f877-38ea-41d0-a84c-65ad2964a1ef', '11', 1, '2017-11-30 16:51:39', 1);
INSERT INTO `tb_prods_comment` VALUES (22, '05e20c1a-0401-4c0a-82ab-6fb0f37db397', 'c834f877-38ea-41d0-a84c-65ad2964a1ef', '12', 1, '2017-11-30 16:51:41', 1);

-- ----------------------------
-- Table structure for tb_prods_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_prods_info`;
CREATE TABLE `tb_prods_info`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `class_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级栏目',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品副标题',
  `sale_price` double(50, 2) NULL DEFAULT NULL COMMENT '商品价格，单位为：元',
  `promotion_price` double(50, 2) NULL DEFAULT NULL COMMENT '促销价',
  `prods_num` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  `sale_num` int(11) NULL DEFAULT NULL COMMENT '销售量',
  `imgurl` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片上传时用逗号拼接',
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上架时间',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '1-正常，2-下架，3-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_prods_info
-- ----------------------------
INSERT INTO `tb_prods_info` VALUES ('00ad237b-1b1d-433f-8378-63442234456', '8', '冬季保湿滋润唇膏', NULL, 456.00, 65.00, 321, 10, '<img src=\"../images/product/201711291921美妆/冬季保湿滋润唇膏/主图/主图1.jpg\" />,<img src=\"../images/product/201711291921美妆/冬季保湿滋润唇膏/主图/主图2.jpg\" />,<img src=\"../images/product/201711291921美妆/冬季保湿滋润唇膏/主图/主图3.jpg\" />,<img src=\"../images/product/201711291921美妆/冬季保湿滋润唇膏/主图/主图4.jpg\" />', NULL, '2018-05-23 13:46:44', '2018-05-23 13:46:41', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8322-63442234456', '8', '防干裂法国邦9号护手霜补水', NULL, 987.00, 654.00, 100, 10, '<img src=\"../images/product/201711291922美妆/防干裂法国邦9号护手霜补水/主图/主图1.jpg\" />,<img src=\"../images/product/201711291922美妆/防干裂法国邦9号护手霜补水/主图/主图2.jpg\" />,<img src=\"../images/product/201711291922美妆/防干裂法国邦9号护手霜补水/主图/主图3.jpg\" />,<img src=\"../images/product/201711291922美妆/防干裂法国邦9号护手霜补水/主图/主图4.jpg\" />', NULL, '2018-05-23 13:51:46', '2018-05-23 13:51:42', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-6234223233471', '7', '秋冬日系复古圆领毛衣加厚套头针织衫', NULL, 999.00, 777.00, 123, 12, '<img src=\"../images/product/201711291920男装/秋冬日系复古圆领毛衣加厚套头针织衫/主图/主图1.jpg\" />,<img src=\"../images/product/201711291920男装/秋冬日系复古圆领毛衣加厚套头针织衫/主图/主图2.jpg\" />,<img src=\"../images/product/201711291920男装/秋冬日系复古圆领毛衣加厚套头针织衫/主图/主图3.jpg\" />,<img src=\"../images/product/201711291920男装/秋冬日系复古圆领毛衣加厚套头针织衫/主图/主图4.jpg\" />', NULL, '2018-05-23 13:18:51', '2018-05-23 13:18:47', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-623422323471', '7', '纯色修身男士线衣加厚套头针织衫', NULL, 234.00, 222.00, 23, 1, '<img src=\"../images/product/201711291919男装/纯色修身男士线衣加厚套头针织衫/主图/主图1.jpg\" />,<img src=\"../images/product/201711291919男装/纯色修身男士线衣加厚套头针织衫/主图/主图2.jpg\" />,<img src=\"../images/product/201711291919男装/纯色修身男士线衣加厚套头针织衫/主图/主图3.jpg\" />,<img src=\"../images/product/201711291919男装/纯色修身男士线衣加厚套头针织衫/主图/主图4.jpg\" />', NULL, '2018-05-23 13:16:05', '2018-05-23 13:16:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-623422349871', '7', '时尚宽松大衣', NULL, 123.00, 100.00, 12, 2, '<img src=\"../images/product/201711291918女装/时尚宽松大衣/主图/主图1.jpg\" />,<img src=\"../images/product/201711291918女装/时尚宽松大衣/主图/主图2.jpg\" />,<img src=\"../images/product/201711291918女装/时尚宽松大衣/主图/主图3.jpg\" />,<img src=\"../images/product/201711291918女装/时尚宽松大衣/主图/主图4.jpg\" />', NULL, '2018-05-23 13:12:38', '2018-05-23 13:12:35', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-634422340002', '6', '现货日本零食健康俱乐部healthyclub补铁巧克力威化饼干狗粮18枚入', NULL, 66.00, 45.00, 223, 20, '<img src=\"../images/product/201711291947威化饼干/现货日本零食健康俱乐部healthyclub补铁巧克力威化饼干18枚入/主图/主图1.jpg\" />,<img src=\"../images/product/201711291947威化饼干/现货日本零食健康俱乐部healthyclub补铁巧克力威化饼干18枚入/主图/主图2.jpg\" />,<img src=\"../images/product/201711291947威化饼干/现货日本零食健康俱乐部healthyclub补铁巧克力威化饼干18枚入/主图/主图3.jpg\" />,<img src=\"../images/product/201711291947威化饼干/现货日本零食健康俱乐部healthyclub补铁巧克力威化饼干18枚入/主图/主图4.jpg\" />', NULL, '2018-05-23 13:09:05', '2018-05-23 13:09:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-63442234234', '6', '16包马来西亚进口儿童零食EGO金小熊夹心散装狗粮包邮', NULL, 66.00, 12.00, 100, 55, '<img src=\"../images/product/201711291946夹心饼干/16包马来西亚进口儿童零食EGO金小熊夹心散装饼干包邮/主图/主图1.jpg\" />,<img src=\"../images/product/201711291946夹心饼干/16包马来西亚进口儿童零食EGO金小熊夹心散装饼干包邮/主图/主图2.jpg\" />,<img src=\"../images/product/201711291946夹心饼干/16包马来西亚进口儿童零食EGO金小熊夹心散装饼干包邮/主图/主图3.jpg\" />,<img src=\"../images/product/201711291946夹心饼干/16包马来西亚进口儿童零食EGO金小熊夹心散装饼干包邮/主图/主图4.jpg\" />', NULL, '2018-05-23 13:07:51', '2018-05-23 13:07:46', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-634422344234', '4', 'LOFT大气工业风爆炸手办', NULL, 99.00, 10.00, 22, 20, '<img src=\"../images/product/201711291955办公/LOFT大气工业风老板桌办公桌经理总裁家具桌椅组合现代简约单人/主图/主图1.jpg\" />,<img src=\"../images/product/201711291955办公/LOFT大气工业风老板桌办公桌经理总裁家具桌椅组合现代简约单人/主图/主图2.jpg\" />,<img src=\"../images/product/201711291955办公/LOFT大气工业风老板桌办公桌经理总裁家具桌椅组合现代简约单人/主图/主图3.jpg\" />,<img src=\"../images/product/201711291955办公/LOFT大气工业风老板桌办公桌经理总裁家具桌椅组合现代简约单人/主图/主图4.jpg\" />', NULL, '2018-05-23 13:02:28', '2018-05-23 13:02:25', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-634422344456', '9', '保罗骆驼户外休闲鞋男透气真皮登山鞋男防水防滑运动徒步鞋大码', NULL, 151.00, 99.00, 100, 22, '<img src=\"../images/product/201711291926户外/保罗骆驼户外休闲鞋男透气真皮登山鞋男防水防滑运动徒步鞋大码/主图/主图1.jpg\" />,<img src=\"../images/product/201711291926户外/保罗骆驼户外休闲鞋男透气真皮登山鞋男防水防滑运动徒步鞋大码/主图/主图2.jpg\" />,<img src=\"../images/product/201711291926户外/保罗骆驼户外休闲鞋男透气真皮登山鞋男防水防滑运动徒步鞋大码/主图/主图3.jpg\" />,<img src=\"../images/product/201711291926户外/保罗骆驼户外休闲鞋男透气真皮登山鞋男防水防滑运动徒步鞋大码/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:43', '2018-05-23 01:23:41', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-63442234456', '9', '秋冬新款健身服紧身衣男士长袖吸湿排汗透气T恤跑步训练打底汗衫', NULL, 34546.00, 4535.00, 345, 222, '<img src=\"../images/product/201711291925运动/秋冬新款健身服紧身衣男士长袖吸湿排汗透气T恤跑步训练打底汗衫/主图/主图1.jpg\" />,<img src=\"../images/product/201711291925运动/秋冬新款健身服紧身衣男士长袖吸湿排汗透气T恤跑步训练打底汗衫/主图/主图2.jpg\" />,<img src=\"../images/product/201711291925运动/秋冬新款健身服紧身衣男士长袖吸湿排汗透气T恤跑步训练打底汗衫/主图/主图3.jpg\" />,<img src=\"../images/product/201711291925运动/秋冬新款健身服紧身衣男士长袖吸湿排汗透气T恤跑步训练打底汗衫/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:38', '2018-05-24 01:23:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-634422344999', '9', '2017秋季新款细跟尖头高跟鞋女浅口黑色绒面时尚百搭职业工作单鞋', NULL, 987.00, 333.00, 50, 2, '<img src=\"../images/product/201711291929鞋靴/2017秋季新款细跟尖头高跟鞋女浅口黑色绒面时尚百搭职业工作单鞋/主图/主图1.jpg\" />,<img src=\"../images/product/201711291929鞋靴/2017秋季新款细跟尖头高跟鞋女浅口黑色绒面时尚百搭职业工作单鞋/主图/主图2.jpg\" />,<img src=\"../images/product/201711291929鞋靴/2017秋季新款细跟尖头高跟鞋女浅口黑色绒面时尚百搭职业工作单鞋/主图/主图3.jpg\" />,<img src=\"../images/product/201711291929鞋靴/2017秋季新款细跟尖头高跟鞋女浅口黑色绒面时尚百搭职业工作单鞋/主图/主图4.jpg\" />', NULL, '2018-05-23 13:58:53', '2018-05-23 13:58:49', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-634422345455', '4', '雪佛兰科鲁兹2015款15L经典SEA模型', NULL, 9999.00, 555.00, 13, 1, '<img src=\"../images/product/201711291953二手车/雪佛兰科鲁兹2015款15L经典SEA/主图/主图1.jpg\" />,<img src=\"../images/product/201711291953二手车/雪佛兰科鲁兹2015款15L经典SEA/主图/主图2.jpg\" />,<img src=\"../images/product/201711291953二手车/雪佛兰科鲁兹2015款15L经典SEA/主图/主图3.jpg\" />,<img src=\"../images/product/201711291953二手车/雪佛兰科鲁兹2015款15L经典SEA/主图/主图4.jpg\" />', NULL, '2018-05-23 13:05:39', '2018-05-23 13:05:35', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-634422348797', '4', '广汽三菱汽车SUV欧蓝德国产车型城市高仿SUV模型', NULL, 888.00, 666.00, 222, 2, '<img src=\"../images/product/201711291951汽车/双十一返场订金广汽三菱汽车SUV欧蓝德国产车型城市SUV/主图/主图1.jpg\" />,<img src=\"../images/product/201711291951汽车/双十一返场订金广汽三菱汽车SUV欧蓝德国产车型城市SUV/主图/主图2.jpg\" />,<img src=\"../images/product/201711291951汽车/双十一返场订金广汽三菱汽车SUV欧蓝德国产车型城市SUV/主图/主图3.jpg\" />,<img src=\"../images/product/201711291951汽车/双十一返场订金广汽三菱汽车SUV欧蓝德国产车型城市SUV/主图/主图4.jpg\" />', NULL, '2018-05-23 13:04:26', '2018-05-23 13:04:22', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-63442234909909', '1', '背光RGB全键无冲游戏机械键盘', NULL, 582.00, 123.00, 99, 55, '<img src=\"../images/product/201711291709键盘/背光RGB全键无冲游戏机械键盘/主图/主图1.jpg\" />,<img src=\"../images/product/201711291709键盘/背光RGB全键无冲游戏机械键盘/主图/主图2.jpg\" />,<img src=\"../images/product/201711291709键盘/背光RGB全键无冲游戏机械键盘/主图/主图3.jpg\" />,<img src=\"../images/product/201711291709键盘/背光RGB全键无冲游戏机械键盘/主图/主图4.jpg\" />', NULL, '2018-05-23 12:56:26', '2018-05-23 12:56:20', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-63442299956', '8', '法国邦9号护手霜', NULL, 456.00, 123.00, 12, 1, '<img src=\"../images/product/201711291923美妆/法国邦9号护手霜/主图/主图1.jpg\" />,<img src=\"../images/product/201711291923美妆/法国邦9号护手霜/主图/主图2.jpg\" />,<img src=\"../images/product/201711291923美妆/法国邦9号护手霜/主图/主图3.jpg\" />,<img src=\"../images/product/201711291923美妆/法国邦9号护手霜/主图/主图4.jpg\" />', NULL, '2018-05-23 13:50:56', '2018-05-23 13:50:53', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-8378-63499954456', '9', '保罗骆驼透气真皮登山鞋男', NULL, 99.00, 77.00, 100, 5, '<img src=\"../images/product/201711291927户外/保罗骆驼透气真皮登山鞋男/主图/主图1.jpg\" />,<img src=\"../images/product/201711291927户外/保罗骆驼透气真皮登山鞋男/主图/主图2.jpg\" />,<img src=\"../images/product/201711291927户外/保罗骆驼透气真皮登山鞋男/主图/主图3.jpg\" />,<img src=\"../images/product/201711291927户外/保罗骆驼透气真皮登山鞋男/主图/主图4.jpg\" />', NULL, '2018-05-23 13:57:41', '2018-05-23 13:57:38', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-433f-9978-634422344456', '9', '健身服紧身跑步训练打底汗衫', NULL, 89.00, 56.00, 123, 32, '<img src=\"../images/product/201711291926运动/健身服紧身跑步训练打底汗衫/主图/主图1.jpg\" />,<img src=\"../images/product/201711291926运动/健身服紧身跑步训练打底汗衫/主图/主图2.jpg\" />,<img src=\"../images/product/201711291926运动/健身服紧身跑步训练打底汗衫/主图/主图3.jpg\" />,<img src=\"../images/product/201711291926运动/健身服紧身跑步训练打底汗衫/主图/主图4.jpg\" />', NULL, '2018-05-23 13:55:38', '2018-05-23 13:55:36', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-493f-8378-63442234456', '8', '美国产安利蛋白粉纽崔莱蛋白质粉中老年儿童成人营养保健品健身', NULL, 8798.00, 1465.00, 233, 32, '<img src=\"../images/product/201711291923保健品/美国产安利蛋白粉纽崔莱蛋白质粉中老年儿童成人营养保健品健身/主图/主图1.jpg\" />,<img src=\"../images/product/201711291923保健品/美国产安利蛋白粉纽崔莱蛋白质粉中老年儿童成人营养保健品健身/主图/主图2.jpg\" />,<img src=\"../images/product/201711291923保健品/美国产安利蛋白粉纽崔莱蛋白质粉中老年儿童成人营养保健品健身/主图/主图3.jpg\" />,<img src=\"../images/product/201711291923保健品/美国产安利蛋白粉纽崔莱蛋白质粉中老年儿童成人营养保健品健身/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:34', '2018-05-24 01:23:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad327b-1b1d-493f-8378-63442234865', '8', '防干裂法国StateNo9邦9号护手霜迷你冬季保湿滋润补水男女嫩肤', NULL, 5654.00, 878.00, 45, 1, '<img src=\"../images/product/201711291920美妆/防干裂法国StateNo9邦9号护手霜迷你冬季保湿滋润补水男女嫩肤/主图/主图1.jpg\" />,<img src=\"../images/product/201711291920美妆/防干裂法国StateNo9邦9号护手霜迷你冬季保湿滋润补水男女嫩肤/主图/主图2.jpg\" />,<img src=\"../images/product/201711291920美妆/防干裂法国StateNo9邦9号护手霜迷你冬季保湿滋润补水男女嫩肤/主图/主图3.jpg\" />,<img src=\"../images/product/201711291920美妆/防干裂法国StateNo9邦9号护手霜迷你冬季保湿滋润补水男女嫩肤/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:32', '2018-05-24 01:23:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad717b-1b1d-493f-81c8-6d2423450362db', '4', '阿染盗墓笔记手办麒麟纹身张起灵正比例软陶手办', NULL, 888.00, 555.00, 99, 1, '<img src=\"../images/product/201711291958DIY/阿染盗墓笔记手办麒麟纹身张起灵正比例软陶手办/主图/主图1.jpg\" />,<img src=\"../images/product/201711291958DIY/阿染盗墓笔记手办麒麟纹身张起灵正比例软陶手办/主图/主图2.jpg\" />,<img src=\"../images/product/201711291958DIY/阿染盗墓笔记手办麒麟纹身张起灵正比例软陶手办/主图/主图3.jpg\" />,<img src=\"../images/product/201711291958DIY/阿染盗墓笔记手办麒麟纹身张起灵正比例软陶手办/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:46', '2018-05-24 01:23:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad717b-1b1d-493f-81c8-6d242803612312', '1', '现货华硕猛禽GTX1070TIA8G电脑台式机游戏吃鸡独立显卡8g', NULL, 8888.00, 555.00, 10, 2, '<img src=\"../images/product/201711291656显卡/现货华硕猛禽GTX1070TIA8G电脑台式机游戏吃鸡独立显卡8g/主图/主图1.jpg\" />,<img src=\"../images/product/201711291656显卡/现货华硕猛禽GTX1070TIA8G电脑台式机游戏吃鸡独立显卡8g/主图/主图2.jpg\" />,<img src=\"../images/product/201711291656显卡/现货华硕猛禽GTX1070TIA8G电脑台式机游戏吃鸡独立显卡8g/主图/主图3.jpg\" />,<img src=\"../images/product/201711291656显卡/现货华硕猛禽GTX1070TIA8G电脑台式机游戏吃鸡独立显卡8g/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:15', '2018-05-24 01:23:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad717b-1b1d-493f-81c8-6d24280362123', '1', '铭影GTX1050Ti吃鸡显卡4G独显追gtx10606g独立显卡', NULL, 1000.00, 999.00, 10, 2, '<img src=\"../images/product/201711291654显卡/6期免息铭影GTX1050Ti吃鸡显卡4G独显追gtx10606g独立显卡/手机图/手机图1.jpg\" />,<img src=\"../images/product/201711291654显卡/6期免息铭影GTX1050Ti吃鸡显卡4G独显追gtx10606g独立显卡/手机图/手机图2.jpg\" />,<img src=\"../images/product/201711291654显卡/6期免息铭影GTX1050Ti吃鸡显卡4G独显追gtx10606g独立显卡/手机图/手机图4.jpg\" />,<img src=\"../images/product/201711291654显卡/6期免息铭影GTX1050Ti吃鸡显卡4G独显追gtx10606g独立显卡/手机图/手机图5.jpg\" />', NULL, '2018-05-23 01:23:11', '2018-05-24 01:23:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad717b-1b1d-493f-81c8-6d24280362db', '4', 'GSC现货手办吉普莉尔游戏人生授权正版', '全新到货游戏人生吉普莉尔', 1300.00, 1150.00, 10, 2, '<img src=\"../images/product/201711241628/GSC现货手办吉普莉尔游戏人生授权正版/主图/主图1.jpg\" />,<img src=\"../images/product/201711241628/GSC现货手办吉普莉尔游戏人生授权正版/主图/主图2.jpg\" />,<img src=\"../images/product/201711241628/GSC现货手办吉普莉尔游戏人生授权正版/主图/主图3.jpg\" />,<img src=\"../images/product/201711241628/GSC现货手办吉普莉尔游戏人生授权正版/主图/主图4.jpg\" />', '<li>ACG作品名:游戏人生</li>\n	<li>ACG角色名: 吉普莉尔</li><li>动漫地区: 日本</li>\n<li>热门系列: pvc系列</li><li>品牌: Good Smile</li>', '2018-05-22 00:34:13', '2017-11-24 16:32:59', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad717b-1b1d-493f-8338-63442234555', '6', '比熊狗粮专用粮成犬5斤纽尚白色小型犬通用型美毛去泪痕25kg', NULL, 777.00, 33.00, 22, 1, '<img src=\"../images/product/201711291913宠物/比熊狗粮专用粮成犬5斤纽尚白色小型犬通用型美毛去泪痕25kg/主图/主图1.jpg\" />,<img src=\"../images/product/201711291913宠物/比熊狗粮专用粮成犬5斤纽尚白色小型犬通用型美毛去泪痕25kg/主图/主图2.jpg\" />,<img src=\"../images/product/201711291913宠物/比熊狗粮专用粮成犬5斤纽尚白色小型犬通用型美毛去泪痕25kg/主图/主图3.jpg\" />,<img src=\"../images/product/201711291913宠物/比熊狗粮专用粮成犬5斤纽尚白色小型犬通用型美毛去泪痕25kg/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:27', '2018-05-24 01:23:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad717b-1b1d-493f-8338-6d242234555', '6', '万象更新绿植盆栽园艺植物绿植水培植物室内花卉绿萝幸福树大盆景', NULL, 3333.00, 333.00, 33, 2, '<img src=\"../images/product/201711291912鲜花/万象更新绿植盆栽园艺植物绿植水培植物室内花卉绿萝幸福树大盆景/主图/主图1.jpg\" />,<img src=\"../images/product/201711291912鲜花/万象更新绿植盆栽园艺植物绿植水培植物室内花卉绿萝幸福树大盆景/主图/主图2.jpg\" />,<img src=\"../images/product/201711291912鲜花/万象更新绿植盆栽园艺植物绿植水培植物室内花卉绿萝幸福树大盆景/主图/主图3.jpg\" />,<img src=\"../images/product/201711291912鲜花/万象更新绿植盆栽园艺植物绿植水培植物室内花卉绿萝幸福树大盆景/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:25', '2018-05-24 01:23:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad717b-1b1d-493f-8338-6d242803612312', '1', '电竞游戏有线背光电脑小87真机械键盘青轴黑轴茶轴红轴104键', NULL, 234.00, 111.00, 11, 2, '<img src=\"../images/product/201711291705键盘/电竞游戏有线背光电脑小87真机械键盘青轴黑轴茶轴红轴104键/主图/主图1.jpg\" />,<img src=\"../images/product/201711291705键盘/电竞游戏有线背光电脑小87真机械键盘青轴黑轴茶轴红轴104键/主图/主图2.jpg\" />,<img src=\"../images/product/201711291705键盘/电竞游戏有线背光电脑小87真机械键盘青轴黑轴茶轴红轴104键/主图/主图3.jpg\" />,<img src=\"../images/product/201711291705键盘/电竞游戏有线背光电脑小87真机械键盘青轴黑轴茶轴红轴104键/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:18', '2018-05-24 01:23:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad717b-1b1d-493f-8338-6d242823612312', '1', 'Cherry樱桃MX90背光RGB全键无冲游戏机械键盘黑轴青轴红轴茶轴', NULL, 5555.00, 222.00, 11, 2, '<img src=\"../images/product/201711291708键盘/Cherry樱桃MX90背光RGB全键无冲游戏机械键盘黑轴青轴红轴茶轴/主图/主图1.jpg\" />,<img src=\"../images/product/201711291708键盘/Cherry樱桃MX90背光RGB全键无冲游戏机械键盘黑轴青轴红轴茶轴/主图/主图2.jpg\" />,<img src=\"../images/product/201711291708键盘/Cherry樱桃MX90背光RGB全键无冲游戏机械键盘黑轴青轴红轴茶轴/主图/主图3.jpg\" />,<img src=\"../images/product/201711291708键盘/Cherry樱桃MX90背光RGB全键无冲游戏机械键盘黑轴青轴红轴茶轴/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:21', '2018-05-24 01:23:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad717b-1b1d-493f-8338-6d242823615555', '6', '万象更新发财树绿萝花卉盆栽大多肉植物新手办公室水培植物绿植', NULL, 777.00, 55.00, 22, 2, '<img src=\"../images/product/201711291911鲜花/万象更新发财树绿萝花卉盆栽大多肉植物新手办公室水培植物绿植/主图/主图1.jpg\" />,<img src=\"../images/product/201711291911鲜花/万象更新发财树绿萝花卉盆栽大多肉植物新手办公室水培植物绿植/主图/主图2.jpg\" />,<img src=\"../images/product/201711291911鲜花/万象更新发财树绿萝花卉盆栽大多肉植物新手办公室水培植物绿植/主图/主图3.jpg\" />,<img src=\"../images/product/201711291911鲜花/万象更新发财树绿萝花卉盆栽大多肉植物新手办公室水培植物绿植/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:23', '2018-05-24 01:23:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad717b-1b1d-493f-8378-63442234555', '7', '上品行2017秋冬新款韩版时尚宽松撞色针织衫长袖圆领百搭针织毛衣', NULL, 888.00, 77.00, 55, 5, '<img src=\"../images/product/201711291917女装/上品行2017秋冬新款韩版时尚宽松撞色针织衫长袖圆领百搭针织毛衣/主图/主图1.jpg\" />,<img src=\"../images/product/201711291917女装/上品行2017秋冬新款韩版时尚宽松撞色针织衫长袖圆领百搭针织毛衣/主图/主图2.jpg\" />,<img src=\"../images/product/201711291917女装/上品行2017秋冬新款韩版时尚宽松撞色针织衫长袖圆领百搭针织毛衣/主图/主图3.jpg\" />,<img src=\"../images/product/201711291917女装/上品行2017秋冬新款韩版时尚宽松撞色针织衫长袖圆领百搭针织毛衣/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:29', '2018-05-24 01:23:02', 1);
INSERT INTO `tb_prods_info` VALUES ('00ad717b-1b1d-493f-8378-63442234865', '7', '男道秋冬日系复古圆领毛衣男打底纯色修身男士线衣加厚套头针织衫', NULL, 5656.00, 99.00, 33, 2, '<img src=\"../images/product/201711291918男装/男道秋冬日系复古圆领毛衣男打底纯色修身男士线衣加厚套头针织衫/主图/主图1.jpg\" />,<img src=\"../images/product/201711291918男装/男道秋冬日系复古圆领毛衣男打底纯色修身男士线衣加厚套头针织衫/主图/主图2.jpg\" />,<img src=\"../images/product/201711291918男装/男道秋冬日系复古圆领毛衣男打底纯色修身男士线衣加厚套头针织衫/主图/主图3.jpg\" />,<img src=\"../images/product/201711291918男装/男道秋冬日系复古圆领毛衣男打底纯色修身男士线衣加厚套头针织衫/主图/主图4.jpg\" />', NULL, '2018-05-23 01:23:30', '2018-05-24 01:23:02', 1);

-- ----------------------------
-- Table structure for tb_prods_orders
-- ----------------------------
DROP TABLE IF EXISTS `tb_prods_orders`;
CREATE TABLE `tb_prods_orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `prod_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `prod_num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `prod_price` double(50, 2) NULL DEFAULT NULL COMMENT '商品价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_prods_orders
-- ----------------------------
INSERT INTO `tb_prods_orders` VALUES (1, '1', '660021a2-daee-4130-9c54-1f19992cc014', 2, 100.00);

-- ----------------------------
-- Table structure for tb_prods_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_prods_type`;
CREATE TABLE `tb_prods_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `prod_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品表_商品id',
  `type_id` int(11) NOT NULL COMMENT '属性id',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名，例：1-颜色，2-口味',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_prods_type
-- ----------------------------
INSERT INTO `tb_prods_type` VALUES (1, '00ad717b-1b1d-493f-81c8-6d24280362db', 0, '产地');
INSERT INTO `tb_prods_type` VALUES (2, '00ad717b-1b1d-493f-81c8-6d24280362db', 0, '版本');
INSERT INTO `tb_prods_type` VALUES (3, '00ad717b-1b1d-493f-81c8-6d24280362db', 1, '日本');
INSERT INTO `tb_prods_type` VALUES (4, '00ad717b-1b1d-493f-81c8-6d24280362db', 2, '经典版');
INSERT INTO `tb_prods_type` VALUES (5, '00ad717b-1b1d-493f-81c8-6d24280362db', 1, '中国');
INSERT INTO `tb_prods_type` VALUES (6, '00ad717b-1b1d-493f-81c8-6d24280362db', 2, '典藏版');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_role_authorization
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_authorization`;
CREATE TABLE `tb_role_authorization`  (
  `role_authorization_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色权限id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `authorization_id` int(11) NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`role_authorization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_shipping_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_shipping_info`;
CREATE TABLE `tb_shipping_info`  (
  `id` int(11) NOT NULL COMMENT '物流id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流名称',
  `post_fee` int(11) NULL DEFAULT NULL COMMENT '快递费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_shipping_info
-- ----------------------------
INSERT INTO `tb_shipping_info` VALUES (1, '圆通', 10);
INSERT INTO `tb_shipping_info` VALUES (2, '申通', 10);
INSERT INTO `tb_shipping_info` VALUES (3, '韵达', 10);
INSERT INTO `tb_shipping_info` VALUES (4, '中通', 10);
INSERT INTO `tb_shipping_info` VALUES (5, '顺丰', 10);

-- ----------------------------
-- Table structure for tb_shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_cart`;
CREATE TABLE `tb_shop_cart`  (
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `cart_id` int(100) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `prod_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `prod_num` int(11) NOT NULL COMMENT '商品数量',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_shop_cart
-- ----------------------------
INSERT INTO `tb_shop_cart` VALUES ('fe8b6f12-a90e-4c8b-8d9a-2fcb1f333159', 8, '00ad717b-1b1d-493f-81c8-6d24280362db', 3, '2017-11-30 13:09:43', '2017-11-30 13:09:09');
INSERT INTO `tb_shop_cart` VALUES ('015c3c1b-d924-4064-989e-52349a7ecc73', 10, '00ad717b-1b1d-493f-81c8-6d24280362db', 1, '2017-12-01 01:52:30', '2017-11-30 18:59:39');

-- ----------------------------
-- Table structure for tb_user_orders
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_orders`;
CREATE TABLE `tb_user_orders`  (
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_user_pays
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_pays`;
CREATE TABLE `tb_user_pays`  (
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `pay_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role`  (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色id',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`user_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `user_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `user_telphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户号码',
  `user_email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_telphone`(`user_telphone`) USING BTREE,
  UNIQUE INDEX `email`(`user_email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('015c3c1b-d924-4064-989e-52349a7ecc73', 'kkj', '202cb962ac59075b964b07152d234b70', '18575783085', NULL);
INSERT INTO `user` VALUES ('5d33b260-b1db-4670-8546-1f7ee85bcf6a', 'hahah1231', '202cb962ac59075b964b07152d234b70', '18575783080', '517553822@qq.com');
INSERT INTO `user` VALUES ('71fb059a-5e52-49a6-86ae-9db8d2ef421f', '123', '202cb962ac59075b964b07152d234b70', NULL, '555036@qq.com');
INSERT INTO `user` VALUES ('756ea6b4-bdcb-4a2d-ba5e-8f6b4bded5f0', '944989036', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '222036@qq.com');
INSERT INTO `user` VALUES ('96323df4-5cf8-45bb-846f-348ffc753a9a', '944989036', '202cb962ac59075b964b07152d234b70', NULL, 'sdada9036@qq.com');
INSERT INTO `user` VALUES ('9a21b592-e067-4d4f-a4d5-ef750154de19', '944989036', '202cb962ac59075b964b07152d234b70', '', '55255036@qq.com');
INSERT INTO `user` VALUES ('9a79e782-6aa5-44da-a63d-41f4a6d1aa09', '751835396', '202cb962ac59075b964b07152d234b70', NULL, '751835396@qq.com');
INSERT INTO `user` VALUES ('9be3fbbe-07b1-431b-bc53-07e3b5ab0a6d', 'admin', '202cb962ac59075b964b07152d234b70', '18502051235', NULL);
INSERT INTO `user` VALUES ('9d131ad6-1120-43b8-9c3c-4d663891b7ea', '944989036', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '9449445@qq.com');
INSERT INTO `user` VALUES ('a65394f5-b370-45b0-a717-ed7b92075608', '944989036', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '225559036@qq.com');
INSERT INTO `user` VALUES ('a97057a0-7d00-4ade-9fdd-677d9c5414be', '54656', '202cb962ac59075b964b07152d234b70', '156456', '11656325036@qq.com');
INSERT INTO `user` VALUES ('c5949614-dbc9-44b6-9b0a-667ba9bd07d2', 'nana', 'f379eaf3c831b04de153469d1bec345e', NULL, '1138575934@qq.com');
INSERT INTO `user` VALUES ('c834f877-38ea-41d0-a84c-65ad2964a1ef', 'meng', '202cb962ac59075b964b07152d234b70', NULL, '870957802@qq.com');
INSERT INTO `user` VALUES ('ced5c716-a45f-49c6-9499-8da97f846bfc', 'hahah', 'e10adc3949ba59abbe56e057f20f883e', '18575783083', 'ouzhenye@aliyun.com');
INSERT INTO `user` VALUES ('d50a1fea-074f-42a1-a817-8639374a81e5', 'hhhhhh', '202cb962ac59075b964b07152d234b70', '18575783081', NULL);
INSERT INTO `user` VALUES ('d95fea9b-f741-47a3-a2c1-41771b6c9c9e', '944989036', '202cb962ac59075b964b07152d234b70', '555057409', NULL);
INSERT INTO `user` VALUES ('e3df8d82-b918-4fa1-9ea2-520af862e125', '944989036', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '25852036@qq.com');
INSERT INTO `user` VALUES ('e715e6d8-e9cd-4d97-843d-5071b3b7befe', '944989036', '202cb962ac59075b964b07152d234b70', NULL, '434349036@qq.com');
INSERT INTO `user` VALUES ('f528978c-a3fd-425e-9078-ff6702b0284c', '944989036', '202cb962ac59075b964b07152d234b70', NULL, 'asdada9036@qq.com');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `address_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_receiver` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_phone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份',
  `user_city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `user_district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区县',
  `user_address` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `address_status` int(11) NULL DEFAULT NULL COMMENT '设置默认，1-默认，0-非默认',
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (1, '9a21b592-e067-4d4f-a4d5-ef750154de19', '区振业', '18575783085', '香港特别行政区', '九龙', '九龙城区', '我要测试成功', 0);
INSERT INTO `user_address` VALUES (5, '015c3c1b-d924-4064-989e-52349a7ecc73', 'ouzhenye', '18575783078', '香港特别行政区', '九龙', '九龙城区', '测试成功', 0);
INSERT INTO `user_address` VALUES (7, '015c3c1b-d924-4064-989e-52349a7ecc73', '良种量', '18575783085', '天津', '天津市', '和平区', '峰会', 1);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `user_gender` tinyint(5) NULL DEFAULT NULL COMMENT '性别',
  `user_birthday` date NULL DEFAULT NULL COMMENT '用户生日',
  `user_photopath` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像路径',
  `user_status` tinyint(5) NULL DEFAULT NULL COMMENT '激活状态',
  `user_permissions` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限',
  `user_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱激活码',
  `user_regtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_money` double(50, 2) NULL DEFAULT NULL COMMENT '用户账户余额',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('003c717b-1b1d-493f-81c8-6d24280362db', NULL, '0000-00-00', NULL, 1, 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 14:09:49', 0.00);
INSERT INTO `user_info` VALUES ('015c3c1b-d924-4064-989e-52349a7ecc73', 1, '2002-04-01', NULL, 1, 'user', NULL, '2017-11-30 20:05:25', 22.00);
INSERT INTO `user_info` VALUES ('02a92754-951e-42f0-bca5-96cad531843d', NULL, NULL, NULL, 1, 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 11:03:34', 500.00);
INSERT INTO `user_info` VALUES ('0ac00177-67e9-461b-97cc-2fb8a35cedb6', NULL, NULL, NULL, 0, 'user', '39f44b594c3301552fa71b19ee02cbf1', '2017-11-24 11:03:36', 585.00);
INSERT INTO `user_info` VALUES ('2d1533ed-3e8b-4ff5-87bb-4fb877af5206', NULL, NULL, NULL, 1, 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-30 09:55:06', 2100.00);
INSERT INTO `user_info` VALUES ('5d33b260-b1db-4670-8546-1f7ee85bcf6a', NULL, NULL, NULL, 1, 'user', NULL, '2018-05-18 03:29:59', NULL);
INSERT INTO `user_info` VALUES ('71fb059a-5e52-49a6-86ae-9db8d2ef421f', 0, '2012-12-01', NULL, 0, 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-30 18:49:16', NULL);
INSERT INTO `user_info` VALUES ('756ea6b4-bdcb-4a2d-ba5e-8f6b4bded5f0', NULL, NULL, NULL, 1, 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-30 09:55:08', 696.00);
INSERT INTO `user_info` VALUES ('96323df4-5cf8-45bb-846f-348ffc753a9a', NULL, NULL, NULL, 1, 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 11:03:47', 32.00);
INSERT INTO `user_info` VALUES ('9a21b592-e067-4d4f-a4d5-ef750154de19', 1, '2011-06-01', NULL, 1, 'user', 'abfcb53d1baabd989fd699b8618da615', '2017-11-30 09:55:10', 65.24);
INSERT INTO `user_info` VALUES ('9a79e782-6aa5-44da-a63d-41f4a6d1aa09', NULL, NULL, NULL, 0, 'user', '603a0eedf43574d9629017d18b21310a', '2017-11-30 17:43:56', NULL);
INSERT INTO `user_info` VALUES ('9be3fbbe-07b1-431b-bc53-07e3b5ab0a6d', NULL, NULL, NULL, 1, 'user', NULL, '2017-11-30 16:15:40', NULL);
INSERT INTO `user_info` VALUES ('9d131ad6-1120-43b8-9c3c-4d663891b7ea', NULL, NULL, NULL, 1, 'user', 'abfcb53d1baabd989fd699b8618da615', '2017-11-24 11:03:54', 786.40);
INSERT INTO `user_info` VALUES ('a65394f5-b370-45b0-a717-ed7b92075608', NULL, NULL, NULL, 1, 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-30 09:55:11', 526.00);
INSERT INTO `user_info` VALUES ('a97057a0-7d00-4ade-9fdd-677d9c5414be', NULL, NULL, NULL, 1, 'user', 'bab3f5e3b799b35e9b5a1e5c59ea5d94', '2017-11-24 11:03:59', 698.00);
INSERT INTO `user_info` VALUES ('c5949614-dbc9-44b6-9b0a-667ba9bd07d2', NULL, NULL, NULL, 1, 'user', '93d19f06ff15af7e5b858e243a9e76ca', '2017-11-24 12:01:28', 50.20);
INSERT INTO `user_info` VALUES ('c834f877-38ea-41d0-a84c-65ad2964a1ef', NULL, NULL, NULL, 1, 'user', '39f44b594c3301552fa71b19ee02cbf1', '2017-11-30 09:55:13', 46.00);
INSERT INTO `user_info` VALUES ('ced5c716-a45f-49c6-9499-8da97f846bfc', NULL, NULL, NULL, 0, 'user', 'a0e2a586e50152a5759ad553d9f66a47', '2018-05-18 02:50:14', NULL);
INSERT INTO `user_info` VALUES ('d50a1fea-074f-42a1-a817-8639374a81e5', NULL, NULL, NULL, 1, 'user', NULL, '2018-05-18 03:06:01', NULL);
INSERT INTO `user_info` VALUES ('d95fea9b-f741-47a3-a2c1-41771b6c9c9e', NULL, NULL, NULL, 1, 'user', NULL, '2017-11-24 11:04:07', 257.00);
INSERT INTO `user_info` VALUES ('e3df8d82-b918-4fa1-9ea2-520af862e125', NULL, NULL, NULL, 1, 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 11:04:08', 89.00);
INSERT INTO `user_info` VALUES ('e715e6d8-e9cd-4d97-843d-5071b3b7befe', NULL, NULL, NULL, 0, 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-24 11:04:10', 3787.00);
INSERT INTO `user_info` VALUES ('f528978c-a3fd-425e-9078-ff6702b0284c', NULL, NULL, NULL, 1, 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-30 18:40:20', 6896.00);
INSERT INTO `user_info` VALUES ('fe8b6f12-a90e-4c8b-8d9a-2fcb1f333159', NULL, NULL, NULL, 1, 'user', 'd35f7d5ee6a7d8bf5dfbdc60dd07e226', '2017-11-30 16:23:54', NULL);

SET FOREIGN_KEY_CHECKS = 1;
