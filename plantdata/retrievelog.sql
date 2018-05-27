/*
MySQL Data Transfer
Source Host: localhost
Source Database: plantdata
Target Host: localhost
Target Database: plantdata
Date: 2013/12/26 19:38:38
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for retrievelog
-- ----------------------------
DROP TABLE IF EXISTS `retrievelog`;
CREATE TABLE `retrievelog` (
  `retrieveLimits` text,
  `inputInfo` text,
  `score` int(11) default NULL,
  `mark` text NOT NULL,
  `time` text,
  PRIMARY KEY  (`mark`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013121916340300277', '2013-12-19 16:34:03');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013121916405100962', '2013-12-19 16:40:51');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '5', '2013121916430900597', '2013-12-19 16:43:09');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '苔藓', '0', '2013121919212100438', '2013-12-19 19:21:21');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121919454200198', '2013-12-19 19:45:42');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920145000550', '2013-12-19 20:14:50');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920265100844', '2013-12-19 20:26:51');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920283700719', '2013-12-19 20:28:37');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920295300985', '2013-12-19 20:29:53');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920341100343', '2013-12-19 20:34:11');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920350200347', '2013-12-19 20:35:02');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920353700368', '2013-12-19 20:35:37');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920365900070', '2013-12-19 20:36:59');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920384400893', '2013-12-19 20:38:44');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920385800981', '2013-12-19 20:38:58');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920393900983', '2013-12-19 20:39:39');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920402500917', '2013-12-19 20:40:25');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920410600398', '2013-12-19 20:41:06');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920415100650', '2013-12-19 20:41:51');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920422000653', '2013-12-19 20:42:20');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '5', '2013121920443000743', '2013-12-19 20:44:30');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013121920454200029', '2013-12-19 20:45:42');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '1', '2013121920480400735', '2013-12-19 20:48:04');
INSERT INTO `retrievelog` VALUES ('', '荷花', '0', '2013121920483400433', '2013-12-19 20:48:34');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形', '0', '2013121920531200805', '2013-12-19 20:53:12');
INSERT INTO `retrievelog` VALUES ('', '果实和根有剧毒', '5', '2013121920551800369', '2013-12-19 20:55:18');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013122008490000963', '2013-12-20 08:49:00');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013122016055200102', '2013-12-20 16:05:52');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013122016304100881', '2013-12-20 16:30:41');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '4', '2013122020290200962', '2013-12-20 20:29:02');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '5', '2013122020301600566', '2013-12-20 20:30:16');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013122101390300631', '2013-12-21 01:39:03');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013122102153600835', '2013-12-21 02:15:36');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '4', '2013122102162600823', '2013-12-21 02:16:26');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013122414205200107', '2013-12-24 14:20:52');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013122414432700507', '2013-12-24 14:43:27');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '5', '2013122414433500911', '2013-12-24 14:43:35');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013122414474700744', '2013-12-24 14:47:47');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '4', '2013122415540800886', '2013-12-24 15:54:08');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '江苏植物志', '0', '2013122417253500336', '2013-12-24 17:25:35');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013122510580700120', '2013-12-25 10:58:07');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', 'aa', '0', '2013122511025600527', '2013-12-25 11:02:56');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', 'aa', '0', '2013122511041600999', '2013-12-25 11:04:16');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', 'aa', '0', '2013122511064600854', '2013-12-25 11:06:46');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', 'aa', '0', '2013122511131000059', '2013-12-25 11:13:10');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', 'aa', '0', '2013122513082800693', '2013-12-25 13:08:28');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013122513395700282', '2013-12-25 13:39:57');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013122514310600638', '2013-12-25 14:31:06');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013122514363400384', '2013-12-25 14:36:34');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '蓝芥', '0', '2013122522353000423', '2013-12-25 22:35:30');
INSERT INTO `retrievelog` VALUES ('科 Familia,属 Genus,种 Species', '荷花', '0', '2013122609421900550', '2013-12-26 09:42:19');
INSERT INTO `retrievelog` VALUES ('族 Tribus,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '5', '2013122609475300987', '2013-12-26 09:47:53');
INSERT INTO `retrievelog` VALUES ('种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013122617171800300', '2013-12-26 17:17:18');
INSERT INTO `retrievelog` VALUES ('族 Tribus,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '0', '2013122617185600516', '2013-12-26 17:18:56');
INSERT INTO `retrievelog` VALUES ('族 Tribus,属 Genus,种 Species', '乔木，树冠圆形，叶片椭圆形或卵形，伞房花序，苞片膜质，花瓣倒卵形，果实扁球形。', '5', '2013122618003800437', '2013-12-26 18:00:38');
