-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.8.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- counsel 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `counsel` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `counsel`;

-- 테이블 counsel.counsel_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `counsel_info` (
  `COUNSEL_BNO` int(11) NOT NULL,
  `COUNSEL_TITLE` varchar(500) NOT NULL DEFAULT '',
  `COUNSEL_CONTENT` varchar(2000) NOT NULL DEFAULT '',
  `COUNSEL_WRITER` varchar(200) NOT NULL DEFAULT '',
  `COUNSEL_USERID` varchar(100) NOT NULL,
  `COUNSEL_REGDATE` datetime NOT NULL DEFAULT current_timestamp(),
  `COUNSEL_REPLYCNT` int(11) NOT NULL DEFAULT 0,
  `COUNSEL_UPDATEWRITER` varchar(200) DEFAULT NULL,
  `COUNSEL_UPDATEDATE` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`COUNSEL_BNO`),
  KEY `FK_USER_INFO_USERID` (`COUNSEL_USERID`),
  CONSTRAINT `FK_USER_INFO_USERID` FOREIGN KEY (`COUNSEL_USERID`) REFERENCES `user_info` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='게시판 테이블';

-- 테이블 데이터 counsel.counsel_info:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `counsel_info` DISABLE KEYS */;
INSERT IGNORE INTO `counsel_info` (`COUNSEL_BNO`, `COUNSEL_TITLE`, `COUNSEL_CONTENT`, `COUNSEL_WRITER`, `COUNSEL_USERID`, `COUNSEL_REGDATE`, `COUNSEL_REPLYCNT`, `COUNSEL_UPDATEWRITER`, `COUNSEL_UPDATEDATE`) VALUES
	(1018, '게시글 작성 커몬', '게시글 작성 커몬', '테스트', 'wang', '2022-06-21 16:17:59', 1, NULL, '2022-06-24 17:42:15'),
	(1022, '비속어 테스트 *****', '***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ********** ********** ********** ********** ***** ***** ***** ***** ***** ***** ********** ***** ***** ***** *****', '욕쟁이', 'wang', '2022-06-21 16:20:42', 1, NULL, '2022-06-24 17:42:15'),
	(1023, '*****', '*****', '유효성', 'wang', '2022-06-21 16:22:10', 1, NULL, '2022-06-24 17:42:15'),
	(1025, '***** 바이 *****', '***** 바이 ***** ***** 바이 ***** ***** 바이 ***** ***** 바이 *****', '크리젠', 'wang', '2022-06-21 17:52:30', 2, NULL, '2022-06-24 17:42:15'),
	(1030, '감감감', '감감감', '감감감', 'wang', '2022-06-24 13:16:34', 1, NULL, '2022-06-24 17:42:15'),
	(1031, '게시글 작성 커몬', '123', '44', 'song', '2022-06-24 15:29:55', 0, NULL, '2022-06-24 17:42:15');
/*!40000 ALTER TABLE `counsel_info` ENABLE KEYS */;

-- 테이블 counsel.counsel_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `counsel_reply` (
  `COUNSEL_REPLY_RNO` int(11) NOT NULL,
  `COUNSEL_REPLY_CONTENT` varchar(2000) NOT NULL,
  `COUNSEL_REPLY_WRITER` varchar(200) NOT NULL,
  `COUNSEL_REPLY_REGDATE` datetime NOT NULL DEFAULT current_timestamp(),
  `COUNSEL_REPLY_BNO` int(11) NOT NULL,
  PRIMARY KEY (`COUNSEL_REPLY_RNO`) USING BTREE,
  KEY `FK_COUNSEL_INFO_BNO` (`COUNSEL_REPLY_BNO`) USING BTREE,
  CONSTRAINT `FK_COUNSEL_INFO_BNO` FOREIGN KEY (`COUNSEL_REPLY_BNO`) REFERENCES `counsel_info` (`COUNSEL_BNO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='덧글 테이블';

-- 테이블 데이터 counsel.counsel_reply:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `counsel_reply` DISABLE KEYS */;
INSERT IGNORE INTO `counsel_reply` (`COUNSEL_REPLY_RNO`, `COUNSEL_REPLY_CONTENT`, `COUNSEL_REPLY_WRITER`, `COUNSEL_REPLY_REGDATE`, `COUNSEL_REPLY_BNO`) VALUES
	(1018, '게시글 작성 커몬', '테스트', '2022-06-21 16:18:56', 1018),
	(1022, '***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ********** ********** ********** ********** ***** ***** ***** ***** ***** ***** ********** ***** ***** *****', '욕쟁이', '2022-06-21 16:20:48', 1022),
	(1027, '******************************', '***** 김*****', '2022-06-21 16:23:15', 1023),
	(1028, '***** 바이 ***** ***** 바이 ***** ***** 바이 ***** ***** 바이 *****', '김둥둥', '2022-06-21 17:52:41', 1025),
	(1029, '***** 바이 ***** ***** 바이 ***** ***** 바이 ***** ***** 바이 *****', '김둥둥', '2022-06-21 17:52:49', 1025),
	(1031, 'asd', 'asd', '2022-06-24 13:47:50', 1030);
/*!40000 ALTER TABLE `counsel_reply` ENABLE KEYS */;

-- 테이블 counsel.counsel_slang 구조 내보내기
CREATE TABLE IF NOT EXISTS `counsel_slang` (
  `counsel_slang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='비속어 테이블';

-- 테이블 데이터 counsel.counsel_slang:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `counsel_slang` DISABLE KEYS */;
INSERT IGNORE INTO `counsel_slang` (`counsel_slang`) VALUES
	('건성'),
	('찌질'),
	('말투'),
	('뻔뻔'),
	('싸가지');
/*!40000 ALTER TABLE `counsel_slang` ENABLE KEYS */;

-- 테이블 counsel.seq_counsel 구조 내보내기
CREATE TABLE IF NOT EXISTS `seq_counsel` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 counsel.seq_counsel:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `seq_counsel` DISABLE KEYS */;
INSERT IGNORE INTO `seq_counsel` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(2001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `seq_counsel` ENABLE KEYS */;

-- 테이블 counsel.seq_counsel_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `seq_counsel_reply` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 counsel.seq_counsel_reply:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `seq_counsel_reply` DISABLE KEYS */;
INSERT IGNORE INTO `seq_counsel_reply` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(2001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `seq_counsel_reply` ENABLE KEYS */;

-- 테이블 counsel.user_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_auth` (
  `USER_ID` varchar(100) NOT NULL,
  `USER_AUTH` varchar(100) NOT NULL,
  PRIMARY KEY (`USER_ID`,`USER_AUTH`),
  CONSTRAINT `FK_USER_USERID` FOREIGN KEY (`USER_ID`) REFERENCES `user_info` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='계정 권한 테이블';

-- 테이블 데이터 counsel.user_auth:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
INSERT IGNORE INTO `user_auth` (`USER_ID`, `USER_AUTH`) VALUES
	('haha', 'ROLE_MEMBER'),
	('song', 'ROLE_ADMIN'),
	('song', 'ROLE_MEMBER'),
	('wang', 'ROLE_MEMBER');
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;

-- 테이블 counsel.user_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_info` (
  `USER_ID` varchar(100) NOT NULL,
  `USER_PW` varchar(100) NOT NULL,
  `USER_NAME` varchar(200) NOT NULL,
  `USER_REGDATE` datetime NOT NULL DEFAULT current_timestamp(),
  `USER_ENABLED` char(1) NOT NULL DEFAULT '1',
  `USER_AUTHS` varchar(50) DEFAULT NULL,
  `USER_FAILEDCNT` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='회원 테이블';

-- 테이블 데이터 counsel.user_info:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT IGNORE INTO `user_info` (`USER_ID`, `USER_PW`, `USER_NAME`, `USER_REGDATE`, `USER_ENABLED`, `USER_AUTHS`, `USER_FAILEDCNT`) VALUES
	('haha', 'f78628f57d3c3fa30e048b1d388c5998f5378db0002df8a95becd2a97799c37d2ce9bbcffa849348', '하하맨', '2022-06-23 16:10:09', '1', NULL, 0),
	('song', '7a3837615fcfbdf263ec0d3fce6a0812334dc325b9abdf4ed4ac672b61ac11f4c53cb9740d208cd8', '송송이', '2022-06-23 15:20:07', '1', NULL, 1),
	('wang', 'e43cd7376ff7403c65199c09921fd0019af09937ecb0afc3a25834f2564cbb67b612c0ecde442a6c', '왕방구', '2022-06-23 15:18:58', '1', NULL, 0);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
