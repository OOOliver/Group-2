/*
MySQL Data Transfer
Source Host: localhost
Source Database: plantdata
Target Host: localhost
Target Database: plantdata
Date: 2013/12/26 19:38:00
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for level
-- ----------------------------
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `levelCN` text,
  `levelEN` text,
  `levelLatin` text NOT NULL,
  `levelSimple` text,
  `number` text,
  PRIMARY KEY  (`levelLatin`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `level` VALUES ('纲', 'Class', 'Classis', 'CL', '10');
INSERT INTO `level` VALUES ('门', 'Phylum', 'Divisio', 'DI', '3');
INSERT INTO `level` VALUES ('科', 'Family', 'Familia', 'FA', '299');
INSERT INTO `level` VALUES ('属', 'Genus', 'Genus', 'GE', '3430');
INSERT INTO `level` VALUES ('目', 'Order', 'Ordo', 'OR', '75');
INSERT INTO `level` VALUES ('界', 'Kingdom', 'Regnum', 'RE', '1');
INSERT INTO `level` VALUES ('组', 'Section', 'Sectio', 'ST', '2048');
INSERT INTO `level` VALUES ('系', 'Series', 'Series', 'SR', '1227');
INSERT INTO `level` VALUES ('种', 'Species', 'Species', 'SP', '31167');
INSERT INTO `level` VALUES ('亚纲', 'Subclass', 'Subclassis', 'sCL', '2');
INSERT INTO `level` VALUES ('亚门', 'Subphylum', 'Subdivisio', 'sDI', '5');
INSERT INTO `level` VALUES ('亚科', 'Subfamily', 'Subfamilia', 'sFA', '175');
INSERT INTO `level` VALUES ('亚属', 'Subgenus', 'Subgenus', 'sGE', '316');
INSERT INTO `level` VALUES ('亚目', 'Suborder', 'Subordo', 'sOR', '63');
INSERT INTO `level` VALUES ('亚族', 'Subtribe', 'Subtribus', 'sTR', '202');
INSERT INTO `level` VALUES ('族', 'Tribe', 'Tribus', 'TR', '454');
