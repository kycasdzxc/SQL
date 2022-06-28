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
  `COUNSEL_BNO` int(11) NOT NULL DEFAULT nextval(`counsel`.`seq_counsel`),
  `COUNSEL_TITLE` varchar(100) NOT NULL DEFAULT '',
  `COUNSEL_CONTENT` varchar(2000) NOT NULL DEFAULT '',
  `COUNSEL_WRITER` varchar(50) NOT NULL DEFAULT '',
  `COUNSEL_REGDATE` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`COUNSEL_BNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='게시판 테이블';

-- 테이블 데이터 counsel.counsel_info:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `counsel_info` DISABLE KEYS */;
INSERT IGNORE INTO `counsel_info` (`COUNSEL_BNO`, `COUNSEL_TITLE`, `COUNSEL_CONTENT`, `COUNSEL_WRITER`, `COUNSEL_REGDATE`) VALUES
	(11, 'Hello, MariaDB!', 'MariaDB 첫 사용!', '크리젠', '2022-06-17 09:47:37'),
	(12, 'Hello, MariaDB!', 'MariaDB 첫 사용!', '크리젠', '2022-06-17 09:47:50'),
	(13, 'Hello, MariaDB!', 'MariaDB 첫 사용!', '크리젠', '2022-06-17 09:47:51'),
	(14, 'MariaDB 수정', '내용 수정!', '크리젠', '2022-06-17 09:47:52'),
	(15, 'Hello, MariaDB!', 'MariaDB 첫 사용!', '크리젠', '2022-06-17 09:47:52'),
	(16, 'Hello, MariaDB!', 'MariaDB 첫 사용!', '크리젠', '2022-06-17 09:47:52'),
	(17, 'Hello, MariaDB!', 'MariaDB 첫 사용!', '김둥둥', '2022-06-17 11:30:44');
/*!40000 ALTER TABLE `counsel_info` ENABLE KEYS */;

-- 테이블 counsel.counsel_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `counsel_reply` (
  `COUNSEL_REPLY_RNO` int(11) NOT NULL DEFAULT nextval(`counsel`.`seq_counsel_reply`),
  `COUNSEL_REPLY_CONTENT` varchar(50) DEFAULT NULL,
  `COUNSEL_REPLY_WRITER` varchar(50) DEFAULT NULL,
  `COUNSEL_REPLY_REGDATE` datetime DEFAULT current_timestamp(),
  `COUNSEL_REPLY_BNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`COUNSEL_REPLY_RNO`) USING BTREE,
  KEY `FK_COUNSEL_INFO_BNO` (`COUNSEL_REPLY_BNO`) USING BTREE,
  CONSTRAINT `FK_COUNSEL_INFO_BNO` FOREIGN KEY (`COUNSEL_REPLY_BNO`) REFERENCES `counsel_info` (`COUNSEL_BNO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='덧글 테이블';

-- 테이블 데이터 counsel.counsel_reply:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `counsel_reply` DISABLE KEYS */;
INSERT IGNORE INTO `counsel_reply` (`COUNSEL_REPLY_RNO`, `COUNSEL_REPLY_CONTENT`, `COUNSEL_REPLY_WRITER`, `COUNSEL_REPLY_REGDATE`, `COUNSEL_REPLY_BNO`) VALUES
	(13, '덧글 하이!', '김둥둥', '2022-06-17 10:05:00', 14),
	(14, '덧글 하이!', '김둥둥', '2022-06-17 10:05:00', 14),
	(15, '덧글 하이!', '김둥둥', '2022-06-17 10:05:01', 14),
	(16, '덧글 하이!', '김둥둥', '2022-06-17 10:05:01', 14),
	(17, '덧글 하이!', '김둥둥', '2022-06-17 10:05:01', 14),
	(18, '덧글 하이!', '김둥둥', '2022-06-17 10:05:01', 14),
	(19, '덧글 하이!', '김둥둥', '2022-06-17 10:05:02', 14);
/*!40000 ALTER TABLE `counsel_reply` ENABLE KEYS */;

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
	(1001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
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
	(1001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `seq_counsel_reply` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
