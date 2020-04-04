/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : taojin

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2019-06-20 03:56:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `phone` varchar(200) default NULL,
  `address` varchar(200) default NULL,
  `userId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('9', '孟鹏宇', '10086', '江苏省南京市玄武区啊啊啊街道', '9');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL auto_increment,
  `admin_name` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for `carousel_img`
-- ----------------------------
DROP TABLE IF EXISTS `carousel_img`;
CREATE TABLE `carousel_img` (
  `carousel_id` int(11) NOT NULL auto_increment,
  `carousel_imgs` varchar(255) default NULL,
  `click_imgs` varchar(255) default NULL,
  PRIMARY KEY  (`carousel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carousel_img
-- ----------------------------
INSERT INTO `carousel_img` VALUES ('8', '5c2b1d4c-bfe1-4314-9915-da1b0aec82d6tj1.jpg', null);

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '手机');
INSERT INTO `category` VALUES ('2', '电脑');
INSERT INTO `category` VALUES ('3', '衣服');
INSERT INTO `category` VALUES ('4', '手表');
INSERT INTO `category` VALUES ('5', '零食');
INSERT INTO `category` VALUES ('6', '化妆品');

-- ----------------------------
-- Table structure for `order_`
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `id` int(11) NOT NULL auto_increment,
  `order_code` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `post` varchar(255) default NULL,
  `receiver` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `user_message` varchar(255) default NULL,
  `create_date` datetime default NULL,
  `pay_date` datetime default NULL,
  `delivery_date` datetime default NULL,
  `confirm_date` datetime default NULL,
  `user_id` int(11) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_order_user` USING BTREE (`user_id`),
  CONSTRAINT `order__ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES ('44', '20190620034012845', '收货人：孟鹏宇\r\n电话：10086\r\n地址：江苏省南京市玄武区啊啊啊街道', null, null, null, '', '2019-06-20 03:40:12', null, null, null, '9', 'waitPay');
INSERT INTO `order_` VALUES ('45', '20190620034237914', '收货人：孟鹏宇\r\n电话：10086\r\n地址：江苏省南京市玄武区啊啊啊街道', null, null, null, '', '2019-06-20 00:00:00', '2019-06-20 00:00:00', '2019-06-20 03:43:58', null, '9', 'waitConfirm');

-- ----------------------------
-- Table structure for `order_item`
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `number` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_orderitem_user` USING BTREE (`user_id`),
  KEY `fk_orderitem_product` USING BTREE (`product_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('73', '966', '44', '9', '2');
INSERT INTO `order_item` VALUES ('74', '975', '45', '9', '1');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `sub_title` varchar(255) default NULL,
  `price` float default NULL,
  `sale` float default NULL,
  `stock` int(11) default NULL,
  `category_id` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_product_category` USING BTREE (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=976 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('966', 'Meizu/魅族 X8 准旗舰游戏拍照手机 骁龙710 6.2英寸全面屏拍照游戏智能手机学生机老人机', '魅族手机', '1999', '88', '99', '1', null);
INSERT INTO `product` VALUES ('967', '魅族16S立减700元【3期免息+0元抢解码耳放/魅族周边18壕礼】Meizu/魅族 16s骁龙855手机官方旗舰店官网17th', '魅族手机', '2699', '87', '96', '1', null);
INSERT INTO `product` VALUES ('968', '魅族note9[省329送18重礼选电源/EP21耳机/手环]Meizu/魅族 Note9手机旗舰店官网x8/16xs plus魅蓝note9/8', '魅族手机', '2099', '86', '100', '1', null);
INSERT INTO `product` VALUES ('969', 'Mate 20学生价 8X全网通4G智能拍照游戏商务手机 华为荣耀20i 10', '华为手机', '3000', '85', '101', '1', null);
INSERT INTO `product` VALUES ('970', '正品6.5英寸水滴屏人脸指纹解锁吃鸡全三网通4G智能手机推华为荐', '华为手机', '3100', '84', '102', '1', null);
INSERT INTO `product` VALUES ('971', '【现货】 华为mate20/pro/20x 麒麟980智能徕卡三摄拍照游戏手机', '华为手机', '3199', '83', '103', '1', null);
INSERT INTO `product` VALUES ('972', '全新超薄一体机电脑吃鸡台式主机全套i5i7游戏独显迷你家用办公', '电脑', '9999', '82', '104', '2', null);
INSERT INTO `product` VALUES ('973', '夏季男女新款情侣装卡通汤姆猫宽松百搭学生原宿风短袖T恤上衣服', '衣服', '10', '82', '104', '3', null);
INSERT INTO `product` VALUES ('974', '瑞士专柜全自动机械表防水精钢镂空男表 多功能夜光男士腕表手表', '手表', '100', '81', '105', '4', null);
INSERT INTO `product` VALUES ('975', '【买二送一】零食彩色水果味糖豆彩虹色吉利豆软糖果装饰酸甜硬250克', '零食', '0.01', '89', '106', '5', null);

-- ----------------------------
-- Table structure for `product_image`
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) default NULL,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_productimage_product` USING BTREE (`product_id`),
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10264 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('10214', '966', null);
INSERT INTO `product_image` VALUES ('10215', '966', null);
INSERT INTO `product_image` VALUES ('10216', '966', null);
INSERT INTO `product_image` VALUES ('10217', '966', null);
INSERT INTO `product_image` VALUES ('10218', '966', null);
INSERT INTO `product_image` VALUES ('10219', '967', null);
INSERT INTO `product_image` VALUES ('10220', '967', null);
INSERT INTO `product_image` VALUES ('10221', '967', null);
INSERT INTO `product_image` VALUES ('10222', '967', null);
INSERT INTO `product_image` VALUES ('10223', '967', null);
INSERT INTO `product_image` VALUES ('10224', '968', null);
INSERT INTO `product_image` VALUES ('10225', '968', null);
INSERT INTO `product_image` VALUES ('10226', '968', null);
INSERT INTO `product_image` VALUES ('10227', '968', null);
INSERT INTO `product_image` VALUES ('10228', '968', null);
INSERT INTO `product_image` VALUES ('10229', '969', null);
INSERT INTO `product_image` VALUES ('10230', '969', null);
INSERT INTO `product_image` VALUES ('10231', '969', null);
INSERT INTO `product_image` VALUES ('10232', '969', null);
INSERT INTO `product_image` VALUES ('10233', '969', null);
INSERT INTO `product_image` VALUES ('10234', '970', null);
INSERT INTO `product_image` VALUES ('10235', '970', null);
INSERT INTO `product_image` VALUES ('10236', '970', null);
INSERT INTO `product_image` VALUES ('10237', '970', null);
INSERT INTO `product_image` VALUES ('10238', '970', null);
INSERT INTO `product_image` VALUES ('10239', '971', null);
INSERT INTO `product_image` VALUES ('10240', '971', null);
INSERT INTO `product_image` VALUES ('10241', '971', null);
INSERT INTO `product_image` VALUES ('10242', '971', null);
INSERT INTO `product_image` VALUES ('10243', '971', null);
INSERT INTO `product_image` VALUES ('10244', '972', null);
INSERT INTO `product_image` VALUES ('10245', '972', null);
INSERT INTO `product_image` VALUES ('10246', '972', null);
INSERT INTO `product_image` VALUES ('10247', '972', null);
INSERT INTO `product_image` VALUES ('10248', '972', null);
INSERT INTO `product_image` VALUES ('10249', '973', null);
INSERT INTO `product_image` VALUES ('10250', '973', null);
INSERT INTO `product_image` VALUES ('10251', '973', null);
INSERT INTO `product_image` VALUES ('10252', '973', null);
INSERT INTO `product_image` VALUES ('10253', '973', null);
INSERT INTO `product_image` VALUES ('10254', '974', null);
INSERT INTO `product_image` VALUES ('10255', '974', null);
INSERT INTO `product_image` VALUES ('10256', '974', null);
INSERT INTO `product_image` VALUES ('10257', '974', null);
INSERT INTO `product_image` VALUES ('10258', '974', null);
INSERT INTO `product_image` VALUES ('10259', '975', null);
INSERT INTO `product_image` VALUES ('10260', '975', null);
INSERT INTO `product_image` VALUES ('10261', '975', null);
INSERT INTO `product_image` VALUES ('10262', '975', null);
INSERT INTO `product_image` VALUES ('10263', '975', null);

-- ----------------------------
-- Table structure for `property`
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int(11) NOT NULL auto_increment,
  `category_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_property_category` USING BTREE (`category_id`),
  CONSTRAINT `property_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES ('1', '1', '处理器');
INSERT INTO `property` VALUES ('2', '1', '内核');
INSERT INTO `property` VALUES ('3', '1', '像素');
INSERT INTO `property` VALUES ('4', '2', '处理器');
INSERT INTO `property` VALUES ('5', '3', '类型');
INSERT INTO `property` VALUES ('6', '4', '类型');
INSERT INTO `property` VALUES ('7', '5', '甜吗');

-- ----------------------------
-- Table structure for `property_value`
-- ----------------------------
DROP TABLE IF EXISTS `property_value`;
CREATE TABLE `property_value` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) default NULL,
  `property_id` int(11) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_propertyvalue_property` USING BTREE (`property_id`),
  CONSTRAINT `property_value_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14099 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property_value
-- ----------------------------
INSERT INTO `property_value` VALUES ('1', '966', '1', '高通晓龙710');
INSERT INTO `property_value` VALUES ('2', '966', '2', '真8核');
INSERT INTO `property_value` VALUES ('3', '966', '3', '2000万');
INSERT INTO `property_value` VALUES ('14092', '967', null, '晓龙835');
INSERT INTO `property_value` VALUES ('14093', '967', '2', '8');
INSERT INTO `property_value` VALUES ('14094', '967', '3', '4000完美');
INSERT INTO `property_value` VALUES ('14095', '972', null, '牛逼');
INSERT INTO `property_value` VALUES ('14096', '973', null, '原宿风');
INSERT INTO `property_value` VALUES ('14097', '974', null, '机械表');
INSERT INTO `property_value` VALUES ('14098', '975', null, '甜');

-- ----------------------------
-- Table structure for `referal_link`
-- ----------------------------
DROP TABLE IF EXISTS `referal_link`;
CREATE TABLE `referal_link` (
  `id` int(11) NOT NULL auto_increment COMMENT '唯一索引id',
  `text` varchar(255) NOT NULL COMMENT '超链显示的文字',
  `link` varchar(255) NOT NULL COMMENT '超链的地址',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of referal_link
-- ----------------------------
INSERT INTO `referal_link` VALUES ('1', '推荐1', '推荐1');
INSERT INTO `referal_link` VALUES ('2', '推荐2', '推荐1');

-- ----------------------------
-- Table structure for `review`
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int(11) NOT NULL auto_increment,
  `content` varchar(4000) default NULL,
  `user_id` int(11) default NULL,
  `product_id` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_review_product` USING BTREE (`product_id`),
  KEY `fk_review_user` USING BTREE (`user_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'user', '123456');
INSERT INTO `user` VALUES ('9', '875066875@qq.com', 'mn430522');
