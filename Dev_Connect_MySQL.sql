-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dev_connect
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_tokens`
--

DROP TABLE IF EXISTS `access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_tokens` (
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `last_activity_at` datetime NOT NULL,
  `lifetime_seconds` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`token`),
  KEY `access_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_tokens`
--

LOCK TABLES `access_tokens` WRITE;
/*!40000 ALTER TABLE `access_tokens` DISABLE KEYS */;
INSERT INTO `access_tokens` VALUES ('EsOGfDY3OW0drKzWvAN0OaFbXzTdp7LvVtCZDQDn',1,'2019-10-06 16:12:46',3600,'2019-10-06 16:12:46'),('hgvjy8UeEEfzdha4gtTI1YplYFBk5h7oElqkN15o',9,'2019-10-09 18:25:08',3600,'2019-10-09 18:25:08'),('Zx1Z1wMkFCWEtiiAEfmiS1NjKkmmoXRVenh8WJtN',1,'2019-10-09 17:47:27',3600,'2019-10-09 17:47:27');
/*!40000 ALTER TABLE `access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_keys` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `allowed_ips` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_keys_key_unique` (`key`),
  KEY `api_keys_user_id_foreign` (`user_id`),
  CONSTRAINT `api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_tag`
--

DROP TABLE IF EXISTS `discussion_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussion_tag` (
  `discussion_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`discussion_id`,`tag_id`),
  KEY `discussion_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `discussion_tag_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discussion_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_tag`
--

LOCK TABLES `discussion_tag` WRITE;
/*!40000 ALTER TABLE `discussion_tag` DISABLE KEYS */;
INSERT INTO `discussion_tag` VALUES (1,1),(3,1),(4,2),(5,4),(4,6),(5,6),(5,10),(5,12);
/*!40000 ALTER TABLE `discussion_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_user`
--

DROP TABLE IF EXISTS `discussion_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussion_user` (
  `user_id` int(10) unsigned NOT NULL,
  `discussion_id` int(10) unsigned NOT NULL,
  `last_read_at` datetime DEFAULT NULL,
  `last_read_post_number` int(10) unsigned DEFAULT NULL,
  `subscription` enum('follow','ignore') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`,`discussion_id`),
  KEY `discussion_user_discussion_id_foreign` (`discussion_id`),
  CONSTRAINT `discussion_user_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discussion_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_user`
--

LOCK TABLES `discussion_user` WRITE;
/*!40000 ALTER TABLE `discussion_user` DISABLE KEYS */;
INSERT INTO `discussion_user` VALUES (1,1,'2019-10-06 14:16:04',3,NULL),(1,3,'2019-10-09 17:57:18',4,NULL),(1,4,'2019-10-06 16:16:35',1,NULL),(1,5,'2019-10-09 17:55:18',6,NULL),(9,1,'2019-09-29 07:07:17',2,'follow'),(9,3,'2019-10-06 15:45:21',2,NULL),(9,4,'2019-10-06 15:48:12',1,NULL),(10,3,'2019-10-09 16:31:43',4,NULL),(10,4,'2019-10-09 16:30:38',2,'follow'),(10,5,'2019-10-09 16:29:08',1,NULL),(11,3,'2019-10-09 17:56:24',4,NULL),(11,4,'2019-10-09 17:56:10',2,NULL),(11,5,'2019-10-09 17:56:18',6,NULL),(12,3,'2019-10-09 18:22:54',4,NULL);
/*!40000 ALTER TABLE `discussion_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions`
--

DROP TABLE IF EXISTS `discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  `participant_count` int(10) unsigned NOT NULL DEFAULT '0',
  `post_number_index` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `first_post_id` int(10) unsigned DEFAULT NULL,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_user_id` int(10) unsigned DEFAULT NULL,
  `last_post_id` int(10) unsigned DEFAULT NULL,
  `last_post_number` int(10) unsigned DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(1) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL,
  `hotness` double(10,4) NOT NULL,
  `best_answer_post_id` int(10) unsigned DEFAULT NULL,
  `best_answer_user_id` int(10) unsigned DEFAULT NULL,
  `best_answer_notified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discussions_hidden_user_id_foreign` (`hidden_user_id`),
  KEY `discussions_first_post_id_foreign` (`first_post_id`),
  KEY `discussions_last_post_id_foreign` (`last_post_id`),
  KEY `discussions_last_posted_at_index` (`last_posted_at`),
  KEY `discussions_last_posted_user_id_index` (`last_posted_user_id`),
  KEY `discussions_created_at_index` (`created_at`),
  KEY `discussions_user_id_index` (`user_id`),
  KEY `discussions_comment_count_index` (`comment_count`),
  KEY `discussions_participant_count_index` (`participant_count`),
  KEY `discussions_hidden_at_index` (`hidden_at`),
  KEY `discussions_is_locked_index` (`is_locked`),
  KEY `discussions_is_sticky_created_at_index` (`is_sticky`,`created_at`),
  FULLTEXT KEY `title` (`title`),
  CONSTRAINT `discussions_first_post_id_foreign` FOREIGN KEY (`first_post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `discussions_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `discussions_last_post_id_foreign` FOREIGN KEY (`last_post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `discussions_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions`
--

LOCK TABLES `discussions` WRITE;
/*!40000 ALTER TABLE `discussions` DISABLE KEYS */;
INSERT INTO `discussions` VALUES (1,'Welcome to Dev_Connect',2,2,3,'2019-09-29 05:18:36',1,1,'2019-09-29 07:07:16',9,2,2,'2019-10-06 15:44:04',1,'welcome-to-dev-connect',0,1,0,1,-1,-25200.6223,2,1,1),(3,'Welcome to DevConnect Q&A Portal!',3,3,4,'2019-10-06 14:20:48',1,5,'2019-10-09 16:31:42',10,11,4,NULL,NULL,'welcome-to-devconnect-q-a-portal',0,1,0,1,3,-25200.1452,NULL,NULL,0),(4,'NPM Proxy Setup Issue',2,2,2,'2019-10-06 15:48:12',9,7,'2019-10-09 16:30:37',10,10,2,NULL,NULL,'npm-proxy-setup-issue',0,1,0,0,1,-25200.6223,NULL,NULL,0),(5,'Do we have any teams working on React in ITT',3,3,6,'2019-10-09 16:29:08',10,9,'2019-10-09 17:54:31',1,15,5,NULL,NULL,'do-we-have-any-teams-working-on-react-in-itt',0,1,1,0,0,0.0000,12,1,0);
/*!40000 ALTER TABLE `discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_tokens`
--

DROP TABLE IF EXISTS `email_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `email_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `email_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_tokens`
--

LOCK TABLES `email_tokens` WRITE;
/*!40000 ALTER TABLE `email_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flagrow_file_downloads`
--

DROP TABLE IF EXISTS `flagrow_file_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flagrow_file_downloads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `discussion_id` int(10) unsigned DEFAULT NULL,
  `post_id` int(10) unsigned DEFAULT NULL,
  `actor_id` int(10) unsigned DEFAULT NULL,
  `downloaded_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flagrow_file_downloads_file_id_foreign` (`file_id`),
  KEY `flagrow_file_downloads_discussion_id_foreign` (`discussion_id`),
  KEY `flagrow_file_downloads_actor_id_foreign` (`actor_id`),
  CONSTRAINT `flagrow_file_downloads_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `flagrow_file_downloads_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `flagrow_file_downloads_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `flagrow_files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flagrow_file_downloads`
--

LOCK TABLES `flagrow_file_downloads` WRITE;
/*!40000 ALTER TABLE `flagrow_file_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `flagrow_file_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flagrow_files`
--

DROP TABLE IF EXISTS `flagrow_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flagrow_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actor_id` int(10) unsigned DEFAULT NULL,
  `discussion_id` int(10) unsigned DEFAULT NULL,
  `post_id` int(10) unsigned DEFAULT NULL,
  `base_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `upload_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `remote_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flagrow_files`
--

LOCK TABLES `flagrow_files` WRITE;
/*!40000 ALTER TABLE `flagrow_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `flagrow_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flags_post_id_foreign` (`post_id`),
  KEY `flags_user_id_foreign` (`user_id`),
  KEY `flags_created_at_index` (`created_at`),
  CONSTRAINT `flags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_permission`
--

DROP TABLE IF EXISTS `group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_permission` (
  `group_id` int(10) unsigned NOT NULL,
  `permission` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`,`permission`),
  CONSTRAINT `group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_permission`
--

LOCK TABLES `group_permission` WRITE;
/*!40000 ALTER TABLE `group_permission` DISABLE KEYS */;
INSERT INTO `group_permission` VALUES (2,'fof.gamification.viewRankingPage'),(2,'viewDiscussions'),(3,'discussion.flagPosts'),(3,'discussion.likePosts'),(3,'discussion.reply'),(3,'discussion.replyWithoutApproval'),(3,'discussion.selectBestAnswer'),(3,'discussion.startWithoutApproval'),(3,'discussion.vote'),(3,'startDiscussion'),(3,'viewUserList'),(4,'discussion.approvePosts'),(4,'discussion.editPosts'),(4,'discussion.hide'),(4,'discussion.hidePosts'),(4,'discussion.lock'),(4,'discussion.rename'),(4,'discussion.sticky'),(4,'discussion.tag'),(4,'discussion.viewFlags'),(4,'discussion.viewIpsPosts'),(4,'user.suspend'),(4,'user.viewLastSeenAt');
/*!40000 ALTER TABLE `group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_user` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_user_group_id_foreign` (`group_id`),
  CONSTRAINT `group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user`
--

LOCK TABLES `group_user` WRITE;
/*!40000 ALTER TABLE `group_user` DISABLE KEYS */;
INSERT INTO `group_user` VALUES (1,1);
/*!40000 ALTER TABLE `group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_singular` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_plural` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Admin','Admins','#B72A2A','fas fa-wrench'),(2,'Guest','Guests',NULL,NULL),(3,'Member','Members',NULL,NULL),(4,'Mod','Mods','#80349E','fas fa-bolt');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `is_internal` tinyint(1) NOT NULL DEFAULT '0',
  `is_newtab` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (1,'Guidelines','http://localhost/forums/public/guidelines',1,0,0),(2,'FAQ','http://localhost/forums/public/p/3-project-wiki',2,1,0),(3,'Home','http://localhost/forums/public/home',0,1,0),(4,'Code Editor','http://localhost/forums/public/p/2-code-editor',4,1,0),(5,'Project Wiki','http://localhost/forums/public/p/3-project-wiki',3,1,0);
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_providers`
--

DROP TABLE IF EXISTS `login_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_providers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_providers_provider_identifier_unique` (`provider`,`identifier`),
  KEY `login_providers_user_id_foreign` (`user_id`),
  CONSTRAINT `login_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_providers`
--

LOCK TABLES `login_providers` WRITE;
/*!40000 ALTER TABLE `login_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2015_02_24_000000_create_access_tokens_table',NULL),('2015_02_24_000000_create_api_keys_table',NULL),('2015_02_24_000000_create_config_table',NULL),('2015_02_24_000000_create_discussions_table',NULL),('2015_02_24_000000_create_email_tokens_table',NULL),('2015_02_24_000000_create_groups_table',NULL),('2015_02_24_000000_create_notifications_table',NULL),('2015_02_24_000000_create_password_tokens_table',NULL),('2015_02_24_000000_create_permissions_table',NULL),('2015_02_24_000000_create_posts_table',NULL),('2015_02_24_000000_create_users_discussions_table',NULL),('2015_02_24_000000_create_users_groups_table',NULL),('2015_02_24_000000_create_users_table',NULL),('2015_09_15_000000_create_auth_tokens_table',NULL),('2015_09_20_224327_add_hide_to_discussions',NULL),('2015_09_22_030432_rename_notification_read_time',NULL),('2015_10_07_130531_rename_config_to_settings',NULL),('2015_10_24_194000_add_ip_address_to_posts',NULL),('2015_12_05_042721_change_access_tokens_columns',NULL),('2015_12_17_194247_change_settings_value_column_to_text',NULL),('2016_02_04_095452_add_slug_to_discussions',NULL),('2017_04_07_114138_add_is_private_to_discussions',NULL),('2017_04_07_114138_add_is_private_to_posts',NULL),('2018_01_11_093900_change_access_tokens_columns',NULL),('2018_01_11_094000_change_access_tokens_add_foreign_keys',NULL),('2018_01_11_095000_change_api_keys_columns',NULL),('2018_01_11_101800_rename_auth_tokens_to_registration_tokens',NULL),('2018_01_11_102000_change_registration_tokens_rename_id_to_token',NULL),('2018_01_11_102100_change_registration_tokens_created_at_to_datetime',NULL),('2018_01_11_120604_change_posts_table_to_innodb',NULL),('2018_01_11_155200_change_discussions_rename_columns',NULL),('2018_01_11_155300_change_discussions_add_foreign_keys',NULL),('2018_01_15_071700_rename_users_discussions_to_discussion_user',NULL),('2018_01_15_071800_change_discussion_user_rename_columns',NULL),('2018_01_15_071900_change_discussion_user_add_foreign_keys',NULL),('2018_01_15_072600_change_email_tokens_rename_id_to_token',NULL),('2018_01_15_072700_change_email_tokens_add_foreign_keys',NULL),('2018_01_15_072800_change_email_tokens_created_at_to_datetime',NULL),('2018_01_18_130400_rename_permissions_to_group_permission',NULL),('2018_01_18_130500_change_group_permission_add_foreign_keys',NULL),('2018_01_18_130600_rename_users_groups_to_group_user',NULL),('2018_01_18_130700_change_group_user_add_foreign_keys',NULL),('2018_01_18_133000_change_notifications_columns',NULL),('2018_01_18_133100_change_notifications_add_foreign_keys',NULL),('2018_01_18_134400_change_password_tokens_rename_id_to_token',NULL),('2018_01_18_134500_change_password_tokens_add_foreign_keys',NULL),('2018_01_18_134600_change_password_tokens_created_at_to_datetime',NULL),('2018_01_18_135000_change_posts_rename_columns',NULL),('2018_01_18_135100_change_posts_add_foreign_keys',NULL),('2018_01_30_112238_add_fulltext_index_to_discussions_title',NULL),('2018_01_30_220100_create_post_user_table',NULL),('2018_01_30_222900_change_users_rename_columns',NULL),('2018_07_21_000000_seed_default_groups',NULL),('2018_07_21_000100_seed_default_group_permissions',NULL),('2018_09_15_041340_add_users_indicies',NULL),('2018_09_15_041828_add_discussions_indicies',NULL),('2018_09_15_043337_add_notifications_indices',NULL),('2018_09_15_043621_add_posts_indices',NULL),('2018_09_22_004100_change_registration_tokens_columns',NULL),('2018_09_22_004200_create_login_providers_table',NULL),('2018_10_08_144700_add_shim_prefix_to_group_icons',NULL),('2019_06_24_145100_change_posts_content_column_to_mediumtext',NULL),('2015_09_21_011527_add_is_approved_to_discussions','flarum-approval'),('2015_09_21_011706_add_is_approved_to_posts','flarum-approval'),('2017_07_22_000000_add_default_permissions','flarum-approval'),('2018_09_29_060444_replace_emoji_shorcuts_with_unicode','flarum-emoji'),('2015_09_02_000000_add_flags_read_time_to_users_table','flarum-flags'),('2015_09_02_000000_create_flags_table','flarum-flags'),('2017_07_22_000000_add_default_permissions','flarum-flags'),('2018_06_27_101500_change_flags_rename_time_to_created_at','flarum-flags'),('2018_06_27_101600_change_flags_add_foreign_keys','flarum-flags'),('2018_06_27_105100_change_users_rename_flags_read_time_to_read_flags_at','flarum-flags'),('2018_09_15_043621_add_flags_indices','flarum-flags'),('2015_05_11_000000_create_posts_likes_table','flarum-likes'),('2015_09_04_000000_add_default_like_permissions','flarum-likes'),('2018_06_27_100600_rename_posts_likes_to_post_likes','flarum-likes'),('2018_06_27_100700_change_post_likes_add_foreign_keys','flarum-likes'),('2015_02_24_000000_add_locked_to_discussions','flarum-lock'),('2017_07_22_000000_add_default_permissions','flarum-lock'),('2018_09_15_043621_add_discussions_indices','flarum-lock'),('2015_05_11_000000_create_mentions_posts_table','flarum-mentions'),('2015_05_11_000000_create_mentions_users_table','flarum-mentions'),('2018_06_27_102000_rename_mentions_posts_to_post_mentions_post','flarum-mentions'),('2018_06_27_102100_rename_mentions_users_to_post_mentions_user','flarum-mentions'),('2018_06_27_102200_change_post_mentions_post_rename_mentions_id_to_mentions_post_id','flarum-mentions'),('2018_06_27_102300_change_post_mentions_post_add_foreign_keys','flarum-mentions'),('2018_06_27_102400_change_post_mentions_user_rename_mentions_id_to_mentions_user_id','flarum-mentions'),('2018_06_27_102500_change_post_mentions_user_add_foreign_keys','flarum-mentions'),('2015_02_24_000000_add_sticky_to_discussions','flarum-sticky'),('2017_07_22_000000_add_default_permissions','flarum-sticky'),('2018_09_15_043621_add_discussions_indices','flarum-sticky'),('2015_05_11_000000_add_subscription_to_users_discussions_table','flarum-subscriptions'),('2015_05_11_000000_add_suspended_until_to_users_table','flarum-suspend'),('2015_09_14_000000_rename_suspended_until_column','flarum-suspend'),('2017_07_22_000000_add_default_permissions','flarum-suspend'),('2018_06_27_111400_change_users_rename_suspend_until_to_suspended_until','flarum-suspend'),('2015_02_24_000000_create_discussions_tags_table','flarum-tags'),('2015_02_24_000000_create_tags_table','flarum-tags'),('2015_02_24_000000_create_users_tags_table','flarum-tags'),('2015_02_24_000000_set_default_settings','flarum-tags'),('2015_10_19_061223_make_slug_unique','flarum-tags'),('2017_07_22_000000_add_default_permissions','flarum-tags'),('2018_06_27_085200_change_tags_columns','flarum-tags'),('2018_06_27_085300_change_tags_add_foreign_keys','flarum-tags'),('2018_06_27_090400_rename_users_tags_to_tag_user','flarum-tags'),('2018_06_27_100100_change_tag_user_rename_read_time_to_marked_as_read_at','flarum-tags'),('2018_06_27_100200_change_tag_user_add_foreign_keys','flarum-tags'),('2018_06_27_103000_rename_discussions_tags_to_discussion_tag','flarum-tags'),('2018_06_27_103100_add_discussion_tag_foreign_keys','flarum-tags'),('2019_04_21_000000_add_icon_to_tags_table','flarum-tags'),('2019_07_09_000000_create_post_votes_table','fof-gamification'),('2019_07_09_000001_add_attributes_to_users','fof-gamification'),('2019_07_09_000002_add_votes_and_hotness_to_discussions','fof-gamification'),('2019_07_09_000003_add_default_permissions','fof-gamification'),('2019_07_09_000004_create_rank_users_table','fof-gamification'),('2019_07_09_000005_migrate_extension_settings','fof-gamification'),('2019_07_10_000000_create_ranks_table','fof-gamification'),('2019_08_09_000000_add_votes_foreign_keys','fof-gamification'),('2016_10_06_203438_add_default_best_answer_permissions','wiwatsrt-best-answer'),('2016_10_07_202338_add_best_answer_post_id_to_discussions_table','wiwatsrt-best-answer'),('2019_05_14_000000_add_best_answer_user_id_and_notified_to_discussions_table','wiwatsrt-best-answer'),('2016_11_03_000000_create_flagrow_files','flagrow-upload'),('2016_11_07_000000_add_remote_id','flagrow-upload'),('2016_11_11_000000_add_markdown_string','flagrow-upload'),('2017_04_14_000000_uuid','flagrow-upload'),('2017_04_14_000001_downloads_table','flagrow-upload'),('2017_04_19_000000_remove_markdown_string','flagrow-upload'),('2017_04_19_000001_add_tag','flagrow-upload'),('2017_04_19_000002_add_relations','flagrow-upload'),('2019_06_10_000000_rename_permissions','fof-user-directory'),('2016_02_13_000000_create_links_table','fof-links'),('2016_04_19_065618_change_links_columns','fof-links'),('2016_04_11_182821__create_pages_table','fof-pages'),('2016_08_28_180020_add_is_html','fof-pages');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `from_user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(10) unsigned DEFAULT NULL,
  `data` blob,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `read_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_from_user_id_foreign` (`from_user_id`),
  KEY `notifications_user_id_index` (`user_id`),
  CONSTRAINT `notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,9,'postMentioned',1,_binary '{\"replyNumber\":2}','2019-09-29 07:07:16',0,'2019-10-02 13:35:43'),(2,1,9,'postLiked',1,NULL,'2019-09-29 07:07:51',0,'2019-10-02 13:35:43'),(3,1,9,'vote',1,_binary '\"None\"','2019-10-01 17:59:55',0,'2019-10-02 13:35:43'),(5,1,9,'vote',1,_binary '\"Up\"','2019-10-01 17:59:59',0,'2019-10-02 13:35:43'),(7,1,9,'postLiked',5,NULL,'2019-10-06 15:44:46',0,NULL),(8,1,9,'postMentioned',5,_binary '{\"replyNumber\":2}','2019-10-06 15:45:20',0,NULL),(10,1,9,'vote',5,_binary '\"Up\"','2019-10-06 15:52:48',0,NULL),(11,9,1,'postLiked',6,NULL,'2019-10-06 16:15:36',0,NULL),(12,9,10,'vote',7,_binary '\"Up\"','2019-10-09 16:29:18',0,NULL),(13,9,10,'postLiked',7,NULL,'2019-10-09 16:29:19',0,NULL),(14,9,10,'postMentioned',7,_binary '{\"replyNumber\":2}','2019-10-09 16:30:37',0,NULL),(15,1,10,'postLiked',5,NULL,'2019-10-09 16:31:11',0,NULL),(16,1,10,'vote',5,_binary '\"Up\"','2019-10-09 16:31:13',0,NULL),(17,1,10,'postMentioned',5,_binary '{\"replyNumber\":4}','2019-10-09 16:31:42',0,NULL),(18,10,11,'postMentioned',9,_binary '{\"replyNumber\":2}','2019-10-09 17:46:53',0,NULL),(19,11,1,'vote',12,_binary '\"Up\"','2019-10-09 17:52:18',0,NULL),(20,10,1,'discussionLocked',5,_binary '{\"postNumber\":4}','2019-10-09 17:53:00',1,NULL),(21,10,1,'discussionLocked',5,_binary '{\"postNumber\":6}','2019-10-09 17:55:09',0,NULL),(22,1,12,'vote',5,_binary '\"Up\"','2019-10-09 18:22:53',0,NULL),(23,10,12,'vote',11,_binary '\"Up\"','2019-10-09 18:22:57',0,NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `edit_time` datetime DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `is_html` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (2,'Code Editor','code-editor','2019-10-09 18:42:34','2019-10-09 19:13:09','<r><p>&lt;iframe src=\"<URL url=\"https://stackblitz.com/edit/angular-ncsxxm\">https://stackblitz.com/edit/angular-ncsxxm</URL>\" scrolling=\"yes\" height=\"800px\" width=\"900px\"&gt;&lt;/iframe&gt;</p></r>',1,1),(3,'Project Wiki','project-wiki','2019-10-09 19:17:01',NULL,'<t><p>&lt;h1&gt; Paste Confluence link for respective project &lt;/h1&gt;</p></t>',0,1);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_tokens`
--

DROP TABLE IF EXISTS `password_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `password_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_tokens`
--

LOCK TABLES `password_tokens` WRITE;
/*!40000 ALTER TABLE `password_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_likes` (
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `post_likes_user_id_foreign` (`user_id`),
  CONSTRAINT `post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
INSERT INTO `post_likes` VALUES (6,1),(1,9),(2,9),(5,9),(5,10),(7,10);
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_mentions_post`
--

DROP TABLE IF EXISTS `post_mentions_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_mentions_post` (
  `post_id` int(10) unsigned NOT NULL,
  `mentions_post_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`mentions_post_id`),
  KEY `post_mentions_post_mentions_post_id_foreign` (`mentions_post_id`),
  CONSTRAINT `post_mentions_post_mentions_post_id_foreign` FOREIGN KEY (`mentions_post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_mentions_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_mentions_post`
--

LOCK TABLES `post_mentions_post` WRITE;
/*!40000 ALTER TABLE `post_mentions_post` DISABLE KEYS */;
INSERT INTO `post_mentions_post` VALUES (2,1),(6,5),(11,5),(10,7),(12,9);
/*!40000 ALTER TABLE `post_mentions_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_mentions_user`
--

DROP TABLE IF EXISTS `post_mentions_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_mentions_user` (
  `post_id` int(10) unsigned NOT NULL,
  `mentions_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`mentions_user_id`),
  KEY `post_mentions_user_mentions_user_id_foreign` (`mentions_user_id`),
  CONSTRAINT `post_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_mentions_user`
--

LOCK TABLES `post_mentions_user` WRITE;
/*!40000 ALTER TABLE `post_mentions_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_mentions_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_user`
--

DROP TABLE IF EXISTS `post_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_user` (
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `post_user_user_id_foreign` (`user_id`),
  CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_user`
--

LOCK TABLES `post_user` WRITE;
/*!40000 ALTER TABLE `post_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_votes`
--

DROP TABLE IF EXISTS `post_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_votes_post_id_foreign` (`post_id`),
  CONSTRAINT `post_votes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_votes`
--

LOCK TABLES `post_votes` WRITE;
/*!40000 ALTER TABLE `post_votes` DISABLE KEYS */;
INSERT INTO `post_votes` VALUES (4,2,9,'Up'),(6,1,9,'Up'),(7,1,1,'Down'),(10,5,9,'Up'),(11,7,10,'Up'),(12,5,10,'Up'),(13,12,1,'Up'),(15,5,12,'Up'),(16,11,12,'Up');
/*!40000 ALTER TABLE `post_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` int(10) unsigned NOT NULL,
  `number` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci COMMENT ' ',
  `edited_at` datetime DEFAULT NULL,
  `edited_user_id` int(10) unsigned DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_discussion_id_number_unique` (`discussion_id`,`number`),
  KEY `posts_edited_user_id_foreign` (`edited_user_id`),
  KEY `posts_hidden_user_id_foreign` (`hidden_user_id`),
  KEY `posts_discussion_id_number_index` (`discussion_id`,`number`),
  KEY `posts_discussion_id_created_at_index` (`discussion_id`,`created_at`),
  KEY `posts_user_id_created_at_index` (`user_id`,`created_at`),
  FULLTEXT KEY `content` (`content`),
  CONSTRAINT `posts_edited_user_id_foreign` FOREIGN KEY (`edited_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,1,'2019-09-29 05:18:36',1,'comment','<t><p>Hi All,</p>\n\n<p>Welcome to Dev Connect forum!!</p>\n\n<p>Regards,<br/>\nTeam</p></t>',NULL,NULL,NULL,NULL,'::1',0,1),(2,1,2,'2019-09-29 07:07:16',9,'comment','<r><p>Thanks! &#128516; <C><s>`</s>&lt;button style=\"color:\'red\'\"&gt; Thanks!&lt;/button&gt;<e>`</e></C><br/>\n<POSTMENTION discussionid=\"1\" displayname=\"STARBOY\" id=\"1\" number=\"1\" username=\"STARBOY\">@STARBOY#1</POSTMENTION></p> </r>',NULL,NULL,NULL,NULL,'::1',0,1),(3,1,3,'2019-10-02 15:12:06',1,'discussionStickied','{\"sticky\":true}',NULL,NULL,NULL,NULL,NULL,0,1),(4,2,1,'2019-10-06 13:22:31',1,'comment','<t><p>Hi</p>\n</t>',NULL,NULL,NULL,NULL,'::1',0,1),(5,3,1,'2019-10-06 14:20:48',1,'comment','<r><p>Welcome guys..! &#128515;</p> \n\n<LIST type=\"decimal\"><LI><s>1. </s>Post all your development related questions.</LI>\n<LI><s>2. </s>Connect with other developers.</LI>\n<LI><s>3. </s>Get rewarded for answering questions.</LI>\n<LI><s>4. </s>Gain recognition among other developers.</LI>\n<LI><s>5. </s>Earn reputation points and be a community champion.</LI></LIST>\n </r>',NULL,NULL,NULL,NULL,'::1',0,1),(6,3,2,'2019-10-06 15:45:20',9,'comment','<r><p><POSTMENTION discussionid=\"3\" displayname=\"STARBOY\" id=\"5\" number=\"1\" username=\"STARBOY\">@STARBOY#5</POSTMENTION> Thanks! &#128512;</p> </r>',NULL,NULL,NULL,NULL,'::1',0,1),(7,4,1,'2019-10-06 15:48:12',9,'comment','<t><p>Hi All,</p>\n\n<p>I am getting error while trying to install Bootstrap in my Angular project. Error 407 - Proxy Authentication Required.</p>\n\n<p>I have added below proxy settings to .npmrc bu still I am getting same Proxy error.</p></t>',NULL,NULL,NULL,NULL,'::1',0,1),(8,3,3,'2019-10-06 16:15:54',1,'discussionStickied','{\"sticky\":true}',NULL,NULL,NULL,NULL,NULL,0,1),(9,5,1,'2019-10-09 16:29:08',10,'comment','<r><p>Hi guys,</p>\n\n<p>I need to develop an application using <STRONG><s>**</s>React<e>**</e></STRONG> for my project and I have some queries regarding it. <br/>\nIt would help, if someone helps me answer those. &#128512;</p> \n\n<p>Cheers,<br/>\nPridhvi</p></r>',NULL,NULL,NULL,NULL,'::1',0,1),(10,4,2,'2019-10-09 16:30:37',10,'comment','<r><p><POSTMENTION discussionid=\"4\" displayname=\"sai_teja\" id=\"7\" number=\"1\" username=\"sai_teja\">@sai_teja#7</POSTMENTION>  Can you please provide the contents of .npmrc file ?</p></r>',NULL,NULL,NULL,NULL,'::1',0,1),(11,3,4,'2019-10-09 16:31:42',10,'comment','<r><p><POSTMENTION discussionid=\"3\" displayname=\"STARBOY\" id=\"5\" number=\"1\" username=\"STARBOY\">@STARBOY#5</POSTMENTION>  Thank you! <IMG alt=\"\" src=\"https://previews.123rf.com/images/yayayoy/yayayoy1706/yayayoy170600010/81039860-female-emoticon-showing-thumb-up.jpg\"><s>![</s><e>](https://previews.123rf.com/images/yayayoy/yayayoy1706/yayayoy170600010/81039860-female-emoticon-showing-thumb-up.jpg)</e></IMG></p></r>','2019-10-09 17:31:09',10,NULL,NULL,'::1',0,1),(12,5,2,'2019-10-09 17:46:53',11,'comment','<r><p>Hi <POSTMENTION discussionid=\"5\" displayname=\"pridhvi_krishna\" id=\"9\" number=\"1\" username=\"pridhvi_krishna\">@pridhvi_krishna#9</POSTMENTION></p> \n\n<p>I\'m currently on Recon project where I need to fetch Bond details from FIX. So I\'m using React for my FIXP application to perform the Recon.</p>\n\n<p>Cheers,<br/>\nAlekhya &#128512;</p>  </r>',NULL,NULL,NULL,NULL,'::1',0,1),(13,5,3,'2019-10-09 17:52:41',1,'discussionTagged','[[4,6,10],[4,6,10,12]]',NULL,NULL,NULL,NULL,NULL,0,1),(15,5,5,'2019-10-09 17:54:31',1,'comment','<t><p>Great. &#128513;</p> \n\n<p>I\'m closing the thread, as this is resolved.</p>\n\n<p>Thanks,<br/>\nSTARBOY</p> </t>',NULL,NULL,NULL,NULL,'::1',0,1),(16,5,6,'2019-10-09 17:55:09',1,'discussionLocked','{\"locked\":true}',NULL,NULL,NULL,NULL,NULL,0,1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank_users`
--

DROP TABLE IF EXISTS `rank_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rank_users` (
  `rank_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`rank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank_users`
--

LOCK TABLES `rank_users` WRITE;
/*!40000 ALTER TABLE `rank_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `rank_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `points` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,5,'Novice','#000000'),(2,10,'Intermediate','#000000'),(3,15,'Expert','#000000');
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_tokens`
--

DROP TABLE IF EXISTS `registration_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_attributes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_tokens`
--

LOCK TABLES `registration_tokens` WRITE;
/*!40000 ALTER TABLE `registration_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('allow_post_editing','reply'),('allow_renaming','10'),('allow_sign_up','1'),('custom_less',''),('default_locale','en'),('default_route','/all'),('extensions_enabled','[\"flarum-approval\",\"flarum-bbcode\",\"flarum-emoji\",\"flarum-lang-english\",\"flarum-flags\",\"flarum-likes\",\"flarum-lock\",\"flarum-markdown\",\"flarum-mentions\",\"flarum-sticky\",\"flarum-subscriptions\",\"flarum-suspend\",\"flarum-tags\",\"flarum-pusher\",\"isaced-email-verification-switch\",\"fof-gamification\",\"wiwatsrt-best-answer\",\"reflar-level-ranks\",\"flagrow-upload\",\"fof-user-directory\",\"fof-links\",\"fof-pages\",\"santiagobiali-logo\",\"flarum-statistics\",\"flagrow-analytics\",\"avatar4eg-users-list\",\"flagrow-users-list\"]'),('flarum-best-answer.allow_select_own_post','1'),('flarum-best-answer.select_best_answer_reminder_days','2'),('flarum-tags.max_primary_tags','2'),('flarum-tags.max_secondary_tags','3'),('flarum-tags.min_primary_tags','1'),('flarum-tags.min_secondary_tags','0'),('fof-gamification.autoUpvotePosts','0'),('fof-gamification.convertedLikes','converting'),('fof-gamification.customRankingImages','0'),('fof-gamification.iconName','thumbs'),('fof-gamification.pointsPlaceholder','Points: {points}'),('fof-gamification.rankAmt','2'),('fof-gamification.rateLimit','0'),('fof-gamification.showVotesOnDiscussionPage','1'),('forum_description','Welcome to Dev Connect!'),('forum_title','Dev Connect'),('mail_driver','mail'),('mail_from','noreply@localhost'),('reflar-level-ranks.pointsText','Level'),('show_language_selector','1'),('theme_colored_header','0'),('theme_dark_mode','0'),('theme_primary_color','#4D698E'),('theme_secondary_color','#e7672e'),('version','0.1.0-beta.10'),('welcome_message','Connect with various developers across platforms'),('welcome_title','Welcome to Dev Connect');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_user`
--

DROP TABLE IF EXISTS `tag_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_user` (
  `user_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `marked_as_read_at` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`tag_id`),
  KEY `tag_user_tag_id_foreign` (`tag_id`),
  CONSTRAINT `tag_user_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tag_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_user`
--

LOCK TABLES `tag_user` WRITE;
/*!40000 ALTER TABLE `tag_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_mode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `default_sort` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `discussion_count` int(10) unsigned NOT NULL DEFAULT '0',
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_discussion_id` int(10) unsigned DEFAULT NULL,
  `last_posted_user_id` int(10) unsigned DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`),
  KEY `tags_parent_id_foreign` (`parent_id`),
  KEY `tags_last_posted_user_id_foreign` (`last_posted_user_id`),
  KEY `tags_last_posted_discussion_id_foreign` (`last_posted_discussion_id`),
  CONSTRAINT `tags_last_posted_discussion_id_foreign` FOREIGN KEY (`last_posted_discussion_id`) REFERENCES `discussions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tags_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tags_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `tags` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General','general',NULL,'#888',NULL,NULL,0,NULL,NULL,0,0,2,'2019-10-06 15:45:20',3,9,NULL),(2,'Support','support','','#4B93D6',NULL,NULL,4,NULL,NULL,0,0,1,'2019-10-06 15:48:12',4,9,'icon fas fa-wrench Button-icon'),(3,'Feedback','feedback','','#9354CA',NULL,NULL,2,NULL,NULL,0,0,0,NULL,NULL,NULL,'icon fas fa-comment-dots Button-icon'),(4,'Platform','platform','','#52B640',NULL,NULL,3,NULL,NULL,0,0,2,'2019-10-09 17:46:53',5,11,'fas fa-layer-group'),(5,'Java','java','','#000000',NULL,NULL,0,6,NULL,0,0,0,'2019-10-06 13:22:31',NULL,1,'fab fa-java'),(6,'Dev','dev','','#000000',NULL,NULL,1,NULL,NULL,0,0,3,'2019-10-09 17:46:53',5,11,'icon fas fa-code Button-icon'),(7,'Android','android','','#000000',NULL,NULL,1,6,NULL,0,0,0,NULL,NULL,NULL,'fab fa-android'),(8,'C2E','c2e','','#52B640',NULL,NULL,0,4,NULL,0,0,0,NULL,NULL,NULL,''),(9,'IBGT','ibgt','','#52B640',NULL,NULL,1,4,NULL,0,0,0,NULL,NULL,NULL,''),(10,'ITT','itt','','#52B640',NULL,NULL,2,4,NULL,0,0,2,'2019-10-09 17:46:53',5,11,''),(11,'MOT','mot','','#52B640',NULL,NULL,3,4,NULL,0,0,0,NULL,NULL,NULL,''),(12,'Solved','solved','','#52B640',NULL,NULL,NULL,NULL,NULL,0,0,1,'2019-10-09 17:46:53',5,11,'icon fas fa-check Button-icon'),(13,'Python','python','','#000000',NULL,NULL,2,6,NULL,0,0,0,NULL,NULL,NULL,'fab fa-python');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `avatar_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` blob,
  `joined_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `marked_all_as_read_at` datetime DEFAULT NULL,
  `read_notifications_at` datetime DEFAULT NULL,
  `discussion_count` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  `read_flags_at` datetime DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL,
  `votes` int(11) NOT NULL,
  `rank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_vote_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_joined_at_index` (`joined_at`),
  KEY `users_last_seen_at_index` (`last_seen_at`),
  KEY `users_discussion_count_index` (`discussion_count`),
  KEY `users_comment_count_index` (`comment_count`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'STARBOY','chsaitejachowdary@gmail.com',1,'$2y$10$uJ5u/ltelz30q4tdhXumMuhAmUyjEU.rqYq3g9IMD4Wp/vVKJoJJW',NULL,NULL,_binary '{\"notify_discussionRenamed_alert\":true,\"notify_postLiked_alert\":true,\"notify_discussionLocked_alert\":true,\"notify_postMentioned_alert\":true,\"notify_postMentioned_email\":false,\"notify_userMentioned_alert\":true,\"notify_userMentioned_email\":false,\"notify_newPost_alert\":true,\"notify_newPost_email\":true,\"notify_userSuspended_alert\":true,\"notify_userUnsuspended_alert\":true,\"followAfterReply\":false,\"discloseOnline\":true,\"indexProfile\":true,\"locale\":null}','2019-09-29 04:49:51','2019-10-09 19:30:52','2019-10-09 17:51:41','2019-10-09 19:30:52',2,4,'2019-10-06 13:20:25',NULL,1,NULL,'2019-10-09 17:55:05'),(9,'sai_teja','saiteja@gmail.com',1,'$2y$10$IgPeoAHrt.TnjLfjgYEUtOa6EiNxRIGdJ4wILXKvMXQj2z.Vt.86u',NULL,NULL,_binary '{\"notify_discussionRenamed_alert\":true,\"notify_postLiked_alert\":true,\"notify_discussionLocked_alert\":true,\"notify_postMentioned_alert\":true,\"notify_postMentioned_email\":false,\"notify_userMentioned_alert\":true,\"notify_userMentioned_email\":false,\"notify_newPost_alert\":true,\"notify_newPost_email\":false,\"notify_userSuspended_alert\":true,\"notify_userUnsuspended_alert\":true,\"notify_vote_alert\":true,\"notify_selectBestAnswer_alert\":true,\"followAfterReply\":false,\"discloseOnline\":true,\"indexProfile\":true,\"locale\":null}','2019-09-29 07:05:23','2019-10-09 19:19:27',NULL,'2019-10-09 19:19:27',1,3,NULL,NULL,2,NULL,'2019-10-06 15:52:48'),(10,'pridhvi_krishna','pridhvikrishna@gmail.com',1,'$2y$10$nt22sNlZ2bL1neSZ5MEQL.5ZOFeUB6uMCvsupW0r1eAilQqZo8A0i',NULL,NULL,NULL,'2019-10-09 16:25:14','2019-10-09 17:43:30',NULL,NULL,1,3,NULL,NULL,1,NULL,'2019-10-09 16:31:13'),(11,'alekhya_malepati','alekhyamalepati@gmail.com',1,'$2y$10$mYUJH2saoGRKrGC7F.cYXu5YJgP9JGHn71Wf2X0aPdEdUQA/q4k9e',NULL,NULL,NULL,'2019-10-09 17:43:57','2019-10-09 18:22:19',NULL,NULL,0,1,NULL,NULL,1,NULL,NULL),(12,'pranav_srivardan','pranavsrivardan@gmail.com',1,'$2y$10$c35mkQHiggta.x3vMfKP.eEKt1p9X2I1TjmiLLeegUzggezfzF7EK',NULL,NULL,NULL,'2019-10-09 18:22:45','2019-10-09 18:24:10','2019-10-09 18:23:07','2019-10-09 18:24:07',0,0,NULL,NULL,0,NULL,'2019-10-09 18:22:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-10  2:57:35
