/*
MySQL Data Transfer
Source Host: localhost
Source Database: plantdata
Target Host: localhost
Target Database: plantdata
Date: 2013/12/26 19:37:45
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for emails
-- ----------------------------
DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails` (
  `marker` mediumtext NOT NULL,
  `userName` mediumtext,
  `userEmail` mediumtext,
  `title` mediumtext,
  `description` mediumtext,
  `time` mediumtext,
  `type` mediumtext,
  PRIMARY KEY  (`marker`(30))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
