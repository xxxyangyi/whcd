-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: whcd
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activityName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `context` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  `endTime` date DEFAULT NULL,
  `expertNum` int(11) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `userNum` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'选美大赛','选美大赛 选出最美女生','2016-09-02','2016-09-30',0,'2016-08-30',2,0.6),(2,'选美活动2','选美活动2','2016-09-06','2016-09-30',0,'2016-09-01',0,0.6),(3,'选美活动3','选美活动3','2016-09-06','2016-09-30',0,'2016-09-01',0,0.6),(4,'选美活动4','选美活动4','2016-09-06','2016-09-30',0,'2016-09-01',0,0.6),(5,'选美活动5','选美活动5','2016-09-06','2016-09-30',0,'2016-09-01',0,0.6),(6,'选美活动6','选美活动6','2016-09-11','2016-09-30',0,'2016-09-11',0,0.6);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenery`
--

DROP TABLE IF EXISTS `scenery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenery` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `detail` text COLLATE utf8_bin,
  `detailsub` text COLLATE utf8_bin,
  `isaudited` int(11) DEFAULT NULL,
  `picaddr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `summary` text COLLATE utf8_bin,
  `tab_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK721F33D36CA4C961` (`tab_id`),
  KEY `FK721F33D37BC556F3` (`user_id`),
  CONSTRAINT `FK721F33D36CA4C961` FOREIGN KEY (`tab_id`) REFERENCES `tab` (`id`),
  CONSTRAINT `FK721F33D37BC556F3` FOREIGN KEY (`user_id`) REFERENCES `user` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenery`
--

LOCK TABLES `scenery` WRITE;
/*!40000 ALTER TABLE `scenery` DISABLE KEYS */;
INSERT INTO `scenery` VALUES ('354ff0e241434104b1fc531a96c393a5','2016-09-02 23:20:55','桂林，便是这样一个地方。这里的山，并非连绵不断，而是常有异峰突起，呈锥状或圆柱状，像是从地里冒出来的一棵棵石笋，真是奇峰林立，形态万千。这\r\n是石灰岩的地质构造长期受水溶蚀后形成的特殊地貌，因而溶洞亦多，可谓“无山不洞，无洞不奇”。洞内石幔、石笋、石花，以及各种钟乳石，争奇斗异，瑰丽异\r\n常。\r\n<p>　　这里的长短江河像玉带萦回于峭壁陡峰之间，大小湖泊散布在山峰脚下，青山碧水，相映成趣。桂林这座城市，街道和房屋建在山间水畔，形成了“城在山水中，山水在城中”的奇特风貌。</p>\r\n<p>　　游览桂林山水的重要节目，是坐船漫游漓江。从桂林到阳朔83公里长的漓江，像一条青绸绿带，逶迤曲折，两岸万点峰峦夹峙，削壁垂河，碧水托山。\r\n水中倒影与岸上山峰连成一体，构成高低起伏的优美曲线。漓江两岸，有农舍、渔村、山庄、田野、茂林、翠竹、村姑、牧童；水上有竹筏、渔翁、游鱼、水鸟；青\r\n山错落，人家处处，一派田园风光。傍晚，点着马灯的竹筏上，常能见到几只被称作“渔鹰”的黑以鸬鹚，水里一有动静，鸬鹚立即跃入水中，随即衔起一条鱼来跃\r\n回竹筏；渔翁坐收渔利，放入鱼篓。观赏鸬鹚捕鱼是夜游漓江的精彩节目。</p>\r\n<p>　　“桂林山水甲天下”的说法，已经流传了千百年。中国诗人说，与其升天做神仙，不如做个桂林人。美国前总统尼克松说过，世界上所有的地方都比不上\r\n桂林美。世界上大多数国家和地区都有山有水，所谓“甲天下”，只是因其山水形态的独特和山水组合的奇妙引起人们的赞叹而已。其实，这样独具个性的山水风\r\n光，在中国又何止桂林一处。</p>\r\n<p>　　<b>长江三峡</b></p>\r\n<p>　　<img style=\"WIDTH: 270px; HEIGHT: 225px; align: right; hspace: 0; vspace: 0\" src=\"http://www.fmprc.gov.cn/ce/cehu/chn/zggk/W020050318751335164125.jpg\" name=\"normal\" align=\"right\" height=\"225\" hspace=\"0\" width=\"270\">长\r\n江三峡是瞿塘峡、巫峡、西陵峡的总称，西起重庆奉节的白帝城，东至湖北宜昌的南津关，全长193公里。峡岸风光如画，是驰名中外的游览胜地。瞿塘峡长约\r\n33公里，以雄奇壮观著称，此段有江面宽仅100余米、位于三峡入口处的夔门，被誉为“天下雄”。中段的巫峡长约40公里，横跨巫山、巴东两县，加之西岸\r\n巫山十二峰，秀丽多姿，为最具观赏价值的水程。位于巫山西北的大宁河还有“小三峡”，是长江的分支，那里曲水通幽，楚楚动人。西陵峡居东，在巴东至宜昌境\r\n内，长约120公里，以滩多水急闻名。三峡山翠、水清、峰奇、瀑飞，不知倾倒了多少游人。</p>\r\n<p>　　乘船游三峡，一路上名胜古迹甚多，包括白帝城、秭归屈原庙、香溪昭君故里、三游洞等，可随时靠岸游览。沿江一些小村镇上的风土人情，古朴的民俗，更令游人流连。</p>\r\n<p>　　正在建设的长江三峡水利工程，带给海内外旅行商一个发动广告攻势的机会。他们纷纷打出“告别三峡游”的口号，掀起三峡旅游热潮。其实，大坝筑\r\n成、水位升高之后，三峡风景将有增有减，而不是单纯的“减”。有些暗礁险滩受淹，虽将失去惊险之趣，却带来更多的安全感，有的名胜古迹搬到高处，不能搬的\r\n摩崖石刻将以罩形建筑建成水下博物馆。目前许多溪水窄浅、不能行舟的支流，坝成后将水势充盈，形成一个个“小三峡”，游人们可顺水而入，饱览藏在深谷中的\r\n仙容美色。那时，三峡库区将出现一个水路纵横交织的旅游网。1997年11月8日，大江截流，长江三峡一期工程已告结束。</p>\r\n<p>　　<b>九寨沟</b></p>\r\n<p>　　<img style=\"WIDTH: 270px; HEIGHT: 187px; align: left; hspace: 0; vspace: 0\" src=\"http://www.fmprc.gov.cn/ce/cehu/chn/zggk/W020050318751335311476.jpg\" name=\"normal\" align=\"left\" height=\"187\" hspace=\"0\" width=\"270\">被称为“人间仙境”、“童话世界”的九寨沟，千万年来隐藏于四川北部阿坝藏族羌族自治州南坪县的莽莽丛林中，可谓“养在深闺人未识”。直到本世纪60年代中期，由于伐木工人修公路，扎营寨，才发现了这个奇幻纯美的胜地。</p>\r\n<p>　　九寨沟因沟内居住着9个藏族村寨而得名。在宽广幽深的沟内，偶尔可见藏式木结构民居、飘动的经幡、迟缓的牦牛，还有溪流之上的小木桥和水磨房，静美如世外桃源。</p>\r\n<p>　　九寨沟的美，是一种不见纤尘、自然纯净的美。高山、峡谷、森林、草坡、湖泊、瀑布、溪流、沟壑，无不保持着原始状态。天，蓝得晶莹；云，白得纯\r\n洁；水，澄澈透底；山，剔透神奇。翠海、叠瀑、彩林、雪峰、藏情，被誉为“五绝”。九寨沟处于南北植被过渡地带，针叶阔叶树种繁多；浓荫蔽日的森林中栖息\r\n着大熊猫、金丝猴、白唇鹿、羚牛等珍稀动物，是天然的动植物园。</p>\r\n<p>　　九寨沟的精灵是水，湖、泉、瀑、溪、河、滩，连缀一体，飞动而又静美，刚烈却又温柔。当地叫做“海子”的大小湖泊，随阳光、季节的变化而异彩纷\r\n呈，扑朔迷离。这里有些树林长在溪流之中，溪水绕树而流；游人在林中曲折的木质栈道上穿行，溪水就在脚下汩汩流动。瀑布上方的珍珠滩，是一块微斜的流水漫\r\n过的大石坪，游人站在石滩上，水从脚踝或脚背匆匆流过，此水往下跌落便成瀑布。</p>\r\n<p>　　占地720平方公里的九寨沟，处于四川盆地向青藏高原过渡的边缘地带，在地貌形态变化最大的裂点线上，属高山深谷碳酸盐堰塞湖地貌，有长海、剑\r\n岩、诺日朗、树正、扎如、黑海六大奇观。这里距成都400多公里，游览区海拔1980米—3100米；气温最低时为一月，月平均气温2.5℃，最高时七\r\n月，平均气温17℃，四季宜游。1992年，联合国教科文组织将九寨沟列入“世界自然遗产”名录。</p>\r\n<p>　　<b>黄果树瀑布</b></p>\r\n<p>　　<img style=\"WIDTH: 270px; HEIGHT: 187px; align: right; hspace: 0; vspace: 0\" src=\"http://www.fmprc.gov.cn/ce/cehu/chn/zggk/W020050318751335625201.jpg\" name=\"normal\" align=\"right\" height=\"187\" hspace=\"0\" width=\"270\">说\r\n起瀑布，贵州的黄果树瀑布群堪称“中国之最”。它由18个地上瀑布和4个地下瀑布，以及石林、溶洞等多种景观组成，散布于200平方公里的范围内。这里夏\r\n季平均气温23℃，盛暑无酷热。春夏之交，河水暴涨，瀑布尤为壮观，其中就以黄果树瀑布最为著名。它宽81米，高71米，水大时，5公里外就能听到轰鸣\r\n声。远看，一股水气腾空而起，迷迷蒙蒙；近看，河水奔腾，倾云倒雪，谷鸣地颤，激起浪花万朵；直泻入潭的瀑布反激起高低不一的水柱，雾珠升腾数百米，溅珠\r\n抛洒到百米以外。水小时，瀑布分成4支，奔流减缓，却显得妩媚娟秀，水珠潇潇洒洒，向四周飘散。</p>\r\n<p>　　黄果树瀑布无论远观近赏，从上往下看或从下往上看，都各有特色。尤为奇妙的是钻入瀑布背后的崖廊洞穴，从“水帘洞”里往外观赏大瀑布，格外惊心动魄。</p>\r\n<p>　　<b>黄山</b></p>\r\n<p>　　<img style=\"WIDTH: 213px; HEIGHT: 216px; align: left; hspace: 0; vspace: 0\" src=\"http://www.fmprc.gov.cn/ce/cehu/chn/zggk/W020050318751335782554.jpg\" name=\"normal\" align=\"left\" height=\"216\" hspace=\"0\" width=\"213\">中国古代著名的地理学家、旅行家徐霞客将五岳看作中国众山的代表，评曰：“五岳归来不看山”。他又称，“黄山归来不看岳”，“登黄山天下无山”，将安徽的黄山推崇为众山之首。</p>\r\n<p>　　的确，黄山无愧于这样的盛誉。黄山大小峰72座，最高峰1800米以上，以奇、险、深、幽著称，而且不同季节有不同景色。黄山的奇松、怪石、云\r\n海、温泉，有“四绝”之称。长在悬崖峭壁上的古松仪态万千，称为“无石不松，无松不奇”。形态各异的怪石造型生动，遍布全山。因山高谷深、雨水充沛而形成\r\n的云雾，使山上游上常有身处云天之上的感觉。这里的温泉清澄洁净，可饮可浴。在黄山，常常可看到云雾贴着山脊上下飘移，变幻无常，远近山峰时隐时现。黄山\r\n激发了许多画家的创作灵感。活到百岁的大画家刘海粟，曾先后十多次登临黄山，拜谒大自然。</p>\r\n<p>　　<b>武陵源<img style=\"WIDTH: 129px; HEIGHT: 225px; align: right; hspace: 0; vspace: 0\" src=\"http://www.fmprc.gov.cn/ce/cehu/chn/zggk/W020050318751335945304.jpg\" name=\"normal\" align=\"right\" height=\"225\" hspace=\"0\" width=\"129\"></b></p>\r\n<p>　　湖南的武陵源风景名胜区总面积264平方公里，由张家界国家森林公园、索溪峪和天子山三大景区组成。仅张家界国家森林公园内，就有13平方公里\r\n的红砂岩峰林地貌。由于地表涵水的切割浸蚀作用，造就了四周高壁林立，形若盆状的独特地形。数千座各具姿态的岩峰，其岩层构造清晰可辨，远看好似一块块巨\r\n大岩石层层垒叠而成。公园内古木苍苍，森林成片，林木覆盖率达97.7%，年均气温16℃，冬暖夏凉，四季适宜旅游。</p>\r\n<p>　　<img style=\"WIDTH: 270px; HEIGHT: 194px; align: left; hspace: 0; vspace: 0\" src=\"http://www.fmprc.gov.cn/ce/cehu/chn/zggk/W020050318751336095982.jpg\" name=\"normal\" align=\"left\" height=\"194\" hspace=\"0\" width=\"270\"><b>张家界</b></p>\r\n<p>　　张家界的景色，具有神、奇、秀、野的特点，一步一景，人称“大自然的迷宫”。游人可攀登黄师寨，观赏各种形态的山峰奇观；可漫步于蜿蜒的溪流旁，两边峭岩夹峙，茂林幽深，分外清静。</p>\r\n<p>　　<b>神农架<img style=\"WIDTH: 270px; HEIGHT: 148px; align: right; hspace: 0; vspace: 0\" src=\"http://www.fmprc.gov.cn/ce/cehu/chn/zggk/W020050318751336415723.jpg\" name=\"normal\" align=\"right\" height=\"148\" hspace=\"0\" width=\"270\"></b></p>\r\n<p>　　还有一处充满神秘感的旅游胜地是湖北的神农架。方圆3000多平方公里内山川交错，沟壑纵横，有一望无际的茂密的原始森林，有四季飘香的奇花异\r\n草，还有许多珍禽异兽。多年来盛传这里有“野人”的踪迹，使这一地区扑朔迷离，更添几分神秘。近些年神农架对外开放，人们可能走进这座充满原始洪荒气氛的\r\n森林公园作生态旅游，满足回归自然的需求。</p>\r\n<p>　　<b>西湖</b></p>\r\n<p>　　<img style=\"WIDTH: 270px; HEIGHT: 151px; align: left; hspace: 0; vspace: 0\" src=\"http://www.fmprc.gov.cn/ce/cehu/chn/zggk/W020050318751336561012.jpg\" name=\"normal\" align=\"left\" height=\"151\" hspace=\"0\" width=\"270\">中国久负盛名的风景区当属杭州的西湖，自古就有“人间天堂”的美名。西湖三面环山，一面濒城，5.6平方公里的水面可以泛舟，湖中三个岛屿上的古典园林可供游览。沿湖四周绿地连绵，树木葱茏，散布着许多名胜古迹。</p>\r\n<p>　　<b>千岛湖<img style=\"WIDTH: 226px; HEIGHT: 168px; align: right; hspace: 0; vspace: 0\" src=\"http://www.fmprc.gov.cn/ce/cehu/chn/zggk/W020050318751336722090.jpg\" name=\"normal\" align=\"right\" height=\"168\" hspace=\"0\" width=\"226\"></b></p>\r\n<p>　　离杭州西湖不太远的千岛湖，是新兴的风景区。湖面比西湖大10倍，湖中有大小岛屿1078个，其中有鹿岛、猴岛、蛇岛等，游人可以上岛游览。湖水四周青山环绕，植被覆盖率90%以上，被称为“绿色的千岛湖”。荡舟湖上，满目青山碧水，白帆点点，风光旖旎。</p>				  							','桂林，便是这样一个地方。这里的山，并非连绵不断，而是常有异峰突起，呈锥状或圆柱状，像是从地里冒出来的一棵棵石笋，真是奇峰林立，形态万千。这是石灰岩的地质构造长期受水溶蚀后形成的特殊地貌，因而溶洞亦多，可',1,'/jsp/img/3df7de380c83451689c3f5defb88247c.png','桂林山水',1,'user');
/*!40000 ALTER TABLE `scenery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab`
--

DROP TABLE IF EXISTS `tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isused` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab`
--

LOCK TABLES `tab` WRITE;
/*!40000 ALTER TABLE `tab` DISABLE KEYS */;
INSERT INTO `tab` VALUES (1,1,'中国风景',0);
/*!40000 ALTER TABLE `tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `mail` varchar(255) COLLATE utf8_bin NOT NULL,
  `identity` int(11) DEFAULT NULL,
  `isused` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  PRIMARY KEY (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin',0,1,'admin','admin',1),('expert',2,1,'expert','expert',1),('user',1,1,'user','user',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertoactivity`
--

DROP TABLE IF EXISTS `usertoactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertoactivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `votefor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4E6640957BC556F3` (`user_id`),
  KEY `FK4E6640956C4CABF3` (`activity_id`),
  CONSTRAINT `FK4E6640956C4CABF3` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
  CONSTRAINT `FK4E6640957BC556F3` FOREIGN KEY (`user_id`) REFERENCES `user` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertoactivity`
--

LOCK TABLES `usertoactivity` WRITE;
/*!40000 ALTER TABLE `usertoactivity` DISABLE KEYS */;
INSERT INTO `usertoactivity` VALUES (1,'admin',1,'admin'),(2,'admin',1,'user');
/*!40000 ALTER TABLE `usertoactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `expertVoteNum` int(11) DEFAULT NULL,
  `review` int(11) DEFAULT NULL,
  `userImg` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `voteNum` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3752EA7BC556F3` (`user_id`),
  KEY `FK3752EA6C4CABF3` (`activity_id`),
  CONSTRAINT `FK3752EA6C4CABF3` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
  CONSTRAINT `FK3752EA7BC556F3` FOREIGN KEY (`user_id`) REFERENCES `user` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (1,'这是我的美图哦','2016-09-02 23:32:17',0,1,'e0aad24102d34a54be6a1c8655e984bc.png',2,1,'admin'),(2,'这是我的美图2','2016-09-02 23:32:17',0,1,'b8ad7785a73a4bb490a573acb03f619a.png',1,1,'user');
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-13  0:12:35
