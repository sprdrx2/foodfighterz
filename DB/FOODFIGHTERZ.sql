-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: foodfighterz
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CategoriesRecettes`
--

DROP TABLE IF EXISTS `CategoriesRecettes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoriesRecettes` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleC` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriesRecettes`
--

LOCK TABLES `CategoriesRecettes` WRITE;
/*!40000 ALTER TABLE `CategoriesRecettes` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoriesRecettes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FamillesIngredients`
--

DROP TABLE IF EXISTS `FamillesIngredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FamillesIngredients` (
  `idFamille` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleF` varchar(50) NOT NULL,
  PRIMARY KEY (`idFamille`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FamillesIngredients`
--

LOCK TABLES `FamillesIngredients` WRITE;
/*!40000 ALTER TABLE `FamillesIngredients` DISABLE KEYS */;
INSERT INTO `FamillesIngredients` VALUES (1,'condiments et sauce'),(2,'divers'),(3,'plantes aromatiques'),(4,'le sucré '),(5,'les incontournables'),(6,'légumes et tubercules'),(7,'champignons'),(8,'fruits et fruits secs'),(9,'viandes, oeufs, charcuteries'),(10,'poissons, coquillages et crustacés'),(11,'produits laitiers'),(12,'pates, riz, céréales...'),(13,'épices et arômes'),(14,'alcools et boissons'),(15,'matières graces');
/*!40000 ALTER TABLE `FamillesIngredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredients`
--

DROP TABLE IF EXISTS `Ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ingredients` (
  `idIngr` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleI` varchar(50) NOT NULL,
  `idFamille` int(11) NOT NULL,
  `Pluriel` varchar(50) DEFAULT NULL,
  `Alias` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idIngr`),
  KEY `Ingredients_FK_FamillesIngredients` (`idFamille`),
  CONSTRAINT `Ingredients_FK_FamillesIngredients` FOREIGN KEY (`idFamille`) REFERENCES `FamillesIngredients` (`idFamille`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredients`
--

LOCK TABLES `Ingredients` WRITE;
/*!40000 ALTER TABLE `Ingredients` DISABLE KEYS */;
INSERT INTO `Ingredients` VALUES (1,'câpres',1,NULL,NULL),(2,'combava',1,NULL,NULL),(3,'concentre de tomates',1,NULL,NULL),(4,'cornichons',1,NULL,NULL),(5,'coulis de tomates',1,NULL,NULL),(6,'échalotes',1,NULL,NULL),(7,'encre de seiche',1,NULL,NULL),(8,'gingembre',1,NULL,NULL),(9,'gomasio',1,NULL,NULL),(10,'harissa',1,NULL,NULL),(11,'Ketchup',1,NULL,NULL),(12,'mayonnaise',1,NULL,NULL),(13,'miso',1,NULL,NULL),(14,'moutarde',1,NULL,NULL),(15,'sauce béarnaise',1,NULL,NULL),(16,'sauce soja',1,NULL,NULL),(17,'sauce Worcestershiresel de céleri',1,NULL,NULL),(18,'Tabasco',1,NULL,NULL),(19,'tapenade',1,NULL,NULL),(20,'tomates',1,NULL,NULL),(21,'tomates confites',1,NULL,NULL),(22,'tomates séchées',1,NULL,NULL),(23,'vinaigre',1,NULL,NULL),(24,'vinaigre balsamique',1,NULL,NULL),(25,'vinaigrette',1,NULL,NULL),(26,'vinaigre blanc',1,NULL,NULL),(27,'vinaigre de cidre',1,NULL,NULL),(28,'vinaigre de framboise',1,NULL,NULL),(29,'vinaigre de noix',1,NULL,NULL),(30,'vinaigre de riz',1,NULL,NULL),(31,'vinaigre de Xérès',1,NULL,NULL),(32,'agar-agar',2,NULL,NULL),(33,'bicarbonate de soude',2,NULL,NULL),(34,'biscottes',2,NULL,NULL),(35,'bouillon cube',2,NULL,NULL),(36,'chapelure',2,NULL,NULL),(37,'colorant alimentaire',2,NULL,NULL),(38,'crème de sésame',2,NULL,NULL),(39,'fécule de blé',2,NULL,NULL),(40,'pommes de terre',2,NULL,NULL),(41,'feuille de brick',2,NULL,NULL),(42,'galettes',2,NULL,NULL),(43,'gélatine',2,NULL,NULL),(44,'levure chimique',2,NULL,NULL),(45,'levure de bière',2,NULL,NULL),(46,'levure de boulanger',2,NULL,NULL),(47,'maïzena',2,NULL,NULL),(48,'pain',2,NULL,NULL),(49,'pain à hamburgers',2,NULL,NULL),(50,'pain de mie',2,NULL,NULL),(51,'pâte d\'amandes',2,NULL,NULL),(52,'pâte de pistaches',2,NULL,NULL),(53,'pâte sablée',2,NULL,NULL),(54,'praliné',2,NULL,NULL),(55,'tacos',2,NULL,NULL),(56,'tapioca',2,NULL,NULL),(57,'tofu',2,NULL,NULL),(58,'algues wakamé',3,NULL,NULL),(59,'aneth',3,NULL,NULL),(60,'anis',3,NULL,NULL),(61,'badiane',3,NULL,NULL),(62,'baies de genévrier',3,NULL,NULL),(63,'basilic',3,NULL,NULL),(64,'basilic thaï',3,NULL,NULL),(65,'cacao',3,NULL,NULL),(66,'café',3,NULL,NULL),(67,'carvi',3,NULL,NULL),(68,'cerfeuil',3,NULL,NULL),(69,'ciboulette',3,NULL,NULL),(70,'citronnelle',3,NULL,NULL),(71,'coriandre',3,NULL,NULL),(72,'estragon',3,NULL,NULL),(73,'herbes de Provence',3,NULL,NULL),(74,'kombu',3,NULL,NULL),(75,'laurier',3,NULL,NULL),(76,'lavande',3,NULL,NULL),(77,'menthe',3,NULL,NULL),(78,'origan',3,NULL,NULL),(79,'pavot',3,NULL,NULL),(80,'persil',3,NULL,NULL),(81,'romarin',3,NULL,NULL),(82,'sauge',3,NULL,NULL),(83,'sésame',3,NULL,NULL),(84,'thé',3,NULL,NULL),(85,'thé Matcha',3,NULL,NULL),(86,'thym',3,NULL,NULL),(87,'verveine',3,NULL,NULL),(88,'beurre de cacahuètes',4,NULL,NULL),(89,'boudoirs',4,NULL,NULL),(90,'caramel',4,NULL,NULL),(91,'chocolat blanc',4,NULL,NULL),(92,'compote de pommes',4,NULL,NULL),(93,'confiture d\'abricots',4,NULL,NULL),(94,'confiture d\'oranges',4,NULL,NULL),(95,'confiture de cassis',4,NULL,NULL),(96,'confiture de figues',4,NULL,NULL),(97,'confiture de fraises',4,NULL,NULL),(98,'confiture de framboises',4,NULL,NULL),(99,'confiture de groseilles',4,NULL,NULL),(100,'confiture de lait',4,NULL,NULL),(101,'confiture de mûres',4,NULL,NULL),(102,'confiture de myrtilles',4,NULL,NULL),(103,'confiture de pêches',4,NULL,NULL),(104,'confiture de prunes',4,NULL,NULL),(105,'crème de marrons',4,NULL,NULL),(106,'glace banane',4,NULL,NULL),(107,'glace café',4,NULL,NULL),(108,'glace caramel',4,NULL,NULL),(109,'glace chocolat',4,NULL,NULL),(110,'glace fraise',4,NULL,NULL),(111,'glace framboise',4,NULL,NULL),(112,'glace menthe-chocolat',4,NULL,NULL),(113,'glace noix de cocoglace pistache',4,NULL,NULL),(114,'glace pralinée',4,NULL,NULL),(115,'glace rhum-raisins',4,NULL,NULL),(116,'glace vanille',4,NULL,NULL),(117,'meringues',4,NULL,NULL),(118,'Nutella',4,NULL,NULL),(119,'pain d\'épices',4,NULL,NULL),(120,'petits beurres',4,NULL,NULL),(121,'sirop d\'érable',4,NULL,NULL),(122,'sorbet abricot',4,NULL,NULL),(123,'sorbet ananas',4,NULL,NULL),(124,'sorbet cassis',4,NULL,NULL),(125,'sorbet citron',4,NULL,NULL),(126,'sorbet fruits de la passion',4,NULL,NULL),(127,'sorbet mangue',4,NULL,NULL),(128,'sorbet melon',4,NULL,NULL),(129,'Speculoos',4,NULL,NULL),(130,'sucre glace',4,NULL,NULL),(131,'sucre perlé',4,NULL,NULL),(132,'sucre roux',4,NULL,NULL),(133,'sucre vanillé',4,NULL,NULL),(134,'ail',5,NULL,NULL),(135,'beurre',5,NULL,NULL),(136,'margarine',5,NULL,NULL),(137,'chocolat',5,NULL,NULL),(138,'creme fraiche',5,NULL,NULL),(139,'gruyère',5,NULL,NULL),(140,'emmental',5,NULL,NULL),(141,'huile d\'olive',5,NULL,NULL),(142,'huile de tournesol',5,NULL,NULL),(143,'lait',5,NULL,NULL),(144,'miel',5,NULL,NULL),(145,'oeuf',5,NULL,NULL),(146,'oignons',5,NULL,NULL),(147,'pâte brisee',5,NULL,NULL),(148,'pâte feuilletée',5,NULL,NULL),(149,'poivre',5,NULL,NULL),(150,'pomme de terrer',5,NULL,NULL),(151,'iz blanc',5,NULL,NULL),(152,'sel',5,NULL,NULL),(153,'sucre',5,NULL,NULL),(154,'tomate(s)',5,NULL,NULL),(155,'vinaigre balsamique',5,NULL,NULL),(156,'vinaigre de vin',5,NULL,NULL),(157,'yaourt nature',5,NULL,NULL),(158,'artichaut',6,NULL,NULL),(159,'asperge',6,NULL,NULL),(160,'aubergine',6,NULL,NULL),(161,'avocat',6,NULL,NULL),(162,'betterave',6,NULL,NULL),(163,'bettes',6,NULL,NULL),(164,'blettes',6,NULL,NULL),(165,'broccoli',6,NULL,NULL),(166,'carottes',6,NULL,NULL),(167,'céleri',6,NULL,NULL),(168,'céleri rave',6,NULL,NULL),(169,'chou',6,NULL,NULL),(170,'chou chinois',6,NULL,NULL),(171,'chou fractal',6,NULL,NULL),(172,'chou rouge',6,NULL,NULL),(173,'chou-fleur',6,NULL,NULL),(174,'choux de Bruxelles',6,NULL,NULL),(175,'citrouille',6,NULL,NULL),(176,'coeur de palmier',6,NULL,NULL),(177,'concombre',6,NULL,NULL),(178,'courge',6,NULL,NULL),(179,'courgette',6,NULL,NULL),(180,'cresson',6,NULL,NULL),(181,'endive',6,NULL,NULL),(182,'epinards',6,NULL,NULL),(183,'fenouil',6,NULL,NULL),(184,'feves',6,NULL,NULL),(185,'flageolet',6,NULL,NULL),(186,'germes de soja',6,NULL,NULL),(187,'haricots beurre',6,NULL,NULL),(188,'haricots blancs',6,NULL,NULL),(189,'haricots rouges',6,NULL,NULL),(190,'haricots verts',6,NULL,NULL),(191,'lentilles',6,NULL,NULL),(192,'lentilles corail',6,NULL,NULL),(193,'mâche',6,NULL,NULL),(194,'maïs',6,NULL,NULL),(195,'navets',6,NULL,NULL),(196,'olives noires',6,NULL,NULL),(197,'olives vertes',6,NULL,NULL),(198,'orties',6,NULL,NULL),(199,'oseille',6,NULL,NULL),(200,'panais',6,NULL,NULL),(201,'patate douce',6,NULL,NULL),(202,'petits pois',6,NULL,NULL),(203,'piment',6,NULL,NULL),(204,'pissenlits',6,NULL,NULL),(205,'poireau',6,NULL,NULL),(206,'pois cassés',6,NULL,NULL),(207,'pois chiches',6,NULL,NULL),(208,'pois gourmands',6,NULL,NULL),(209,'poivrons rouge',6,NULL,NULL),(210,'poivrons vert',6,NULL,NULL),(211,'poivrons jaune',6,NULL,NULL),(212,'potimarron',6,NULL,NULL),(213,'potiron',6,NULL,NULL),(214,'pourpier',6,NULL,NULL),(215,'radis',6,NULL,NULL),(216,'radis noir',6,NULL,NULL),(217,'roquette',6,NULL,NULL),(218,'rutabaga',6,NULL,NULL),(219,'salade rouge',6,NULL,NULL),(220,'salade verte',6,NULL,NULL),(221,'tomate verte',6,NULL,NULL),(222,'topinambour',6,NULL,NULL),(223,'bolets',7,NULL,NULL),(224,'cèpes',7,NULL,NULL),(225,'champignons de Paris',7,NULL,NULL),(226,'champignons noirs',7,NULL,NULL),(227,'chanterelles',7,NULL,NULL),(228,'coulemelles',7,NULL,NULL),(229,'girolles',7,NULL,NULL),(230,'lactaires sanguins',7,NULL,NULL),(231,'morilles',7,NULL,NULL),(232,'pieds de mouton',7,NULL,NULL),(233,'pleurottes',7,NULL,NULL),(234,'shitake',7,NULL,NULL),(235,'trompettes de la mort',7,NULL,NULL),(236,'truffes',7,NULL,NULL),(237,'vesses de loup',7,NULL,NULL),(238,'abricot',8,NULL,NULL),(239,'abricots secs',8,NULL,NULL),(240,'airelles',8,NULL,NULL),(241,'amandes',8,NULL,NULL),(242,'ananas',8,NULL,NULL),(243,'banane',8,NULL,NULL),(244,'cacahuètes',8,NULL,NULL),(245,'cassis',8,NULL,NULL),(246,'cerises',8,NULL,NULL),(247,'châtaignes',8,NULL,NULL),(248,'citron',8,NULL,NULL),(249,'citron vert',8,NULL,NULL),(250,'clémentine',8,NULL,NULL),(251,'coing',8,NULL,NULL),(252,'dattes',8,NULL,NULL),(253,'figues',8,NULL,NULL),(254,'fraises',8,NULL,NULL),(255,'framboises',8,NULL,NULL),(256,'fruit de la passion',8,NULL,NULL),(257,'fruits confits',8,NULL,NULL),(258,'fruits rouges',8,NULL,NULL),(259,'goyave',8,NULL,NULL),(260,'grenade',8,NULL,NULL),(261,'groseilles',8,NULL,NULL),(262,'kiwi',8,NULL,NULL),(263,'litchies',8,NULL,NULL),(264,'mangue',8,NULL,NULL),(265,'marrons',8,NULL,NULL),(266,'melon',8,NULL,NULL),(267,'mirabelles',8,NULL,NULL),(268,'mûres',8,NULL,NULL),(269,'myrtilles',8,NULL,NULL),(270,'nèfles',8,NULL,NULL),(271,'noisettes',8,NULL,NULL),(272,'noix',8,NULL,NULL),(273,'noix de cajou',8,NULL,NULL),(274,'noix de coco',8,NULL,NULL),(275,'noix de macadamia',8,NULL,NULL),(276,'noix de pécan',8,NULL,NULL),(277,'orange',8,NULL,NULL),(278,'pamplemousse',8,NULL,NULL),(279,'papaye',8,NULL,NULL),(280,'pastèque',8,NULL,NULL),(281,'pêche',8,NULL,NULL),(282,'pignons de pin',8,NULL,NULL),(283,'pistaches',8,NULL,NULL),(284,'poire',8,NULL,NULL),(285,'pomme',8,NULL,NULL),(286,'pruneaux',8,NULL,NULL),(287,'prunes',8,NULL,NULL),(288,'raisin blanc',8,NULL,NULL),(289,'raisin noir',8,NULL,NULL),(290,'raisins secs',8,NULL,NULL),(291,'rhubarbe',8,NULL,NULL),(292,'agneau',9,NULL,NULL),(293,'andouille',9,NULL,NULL),(294,'andouillette',9,NULL,NULL),(295,'bacon',9,NULL,NULL),(296,'boeuf',9,NULL,NULL),(297,'boudin blanc',9,NULL,NULL),(298,'boudin noir',9,NULL,NULL),(299,'caille',9,NULL,NULL),(300,'caillette',9,NULL,NULL),(301,'canard',9,NULL,NULL),(302,'chorizo',9,NULL,NULL),(303,'crêpine',9,NULL,NULL),(304,'dindees',9,NULL,NULL),(305,'cargots',9,NULL,NULL),(306,'foie de génisse',9,NULL,NULL),(307,'foie de veau',9,NULL,NULL),(308,'foie gras',9,NULL,NULL),(309,'foies de volaille',9,NULL,NULL),(310,'gésiers',9,NULL,NULL),(311,'jambon blanc',9,NULL,NULL),(312,'jambon cru',9,NULL,NULL),(313,'jambon fumé',9,NULL,NULL),(314,'lapin',9,NULL,NULL),(315,'lard',9,NULL,NULL),(316,'lardons',9,NULL,NULL),(317,'merguez',9,NULL,NULL),(318,'moutono',9,NULL,NULL),(319,'eufs de caille',9,NULL,NULL),(320,'os à moëlle',9,NULL,NULL),(321,'petit salé',9,NULL,NULL),(322,'pied de veau',9,NULL,NULL),(323,'pigeon',9,NULL,NULL),(324,'porc',9,NULL,NULL),(325,'poulet',9,NULL,NULL),(326,'quenelles',9,NULL,NULL),(327,'rognons',9,NULL,NULL),(328,'saucisse',9,NULL,NULL),(329,'saucisson',9,NULL,NULL),(330,'tripes',9,NULL,NULL),(331,'veau',9,NULL,NULL),(332,'aigle fin',10,NULL,NULL),(333,'amandes de mer',10,NULL,NULL),(334,'anchois au sel',10,NULL,NULL),(335,'anchois frais',10,NULL,NULL),(336,'anguille',10,NULL,NULL),(337,'araignée de mer',10,NULL,NULL),(338,'bar',10,NULL,NULL),(339,'barbu',10,NULL,NULL),(340,'bonite',10,NULL,NULL),(341,'brochet',10,NULL,NULL),(342,'cabillaud',10,NULL,NULL),(343,'calamars',10,NULL,NULL),(344,'carpe',10,NULL,NULL),(345,'colin',10,NULL,NULL),(346,'congre',10,NULL,NULL),(347,'coques',10,NULL,NULL),(348,'crevettes',10,NULL,NULL),(349,'daurade',10,NULL,NULL),(350,'écrevisses',10,NULL,NULL),(351,'encornet',10,NULL,NULL),(352,'séperlans',10,NULL,NULL),(353,'espadon',10,NULL,NULL),(354,'étrilles',10,NULL,NULL),(355,'flétan',10,NULL,NULL),(356,'fumet de poisson',10,NULL,NULL),(357,'gambas',10,NULL,NULL),(358,'haddock',10,NULL,NULL),(359,'hareng',10,NULL,NULL),(360,'homard',10,NULL,NULL),(361,'huîtres',10,NULL,NULL),(362,'langouste',10,NULL,NULL),(363,'langoustines',10,NULL,NULL),(364,'lieu',10,NULL,NULL),(365,'limande',10,NULL,NULL),(366,'lotte',10,NULL,NULL),(367,'loup de mer',10,NULL,NULL),(368,'maquereau',10,NULL,NULL),(369,'merlan',10,NULL,NULL),(370,'merlu',10,NULL,NULL),(371,'mérou',10,NULL,NULL),(372,'morue',10,NULL,NULL),(373,'moules',10,NULL,NULL),(374,'noix de pétoncle',10,NULL,NULL),(375,'oeufs de lump',10,NULL,NULL),(376,'palourdes',10,NULL,NULL),(377,'panga',10,NULL,NULL),(378,'perche',10,NULL,NULL),(379,'poulpe',10,NULL,NULL),(380,'poutargue',10,NULL,NULL),(381,'rouget',10,NULL,NULL),(382,'rouille',10,NULL,NULL),(383,'roussette',10,NULL,NULL),(384,'Saint Jacques',10,NULL,NULL),(385,'sandre',10,NULL,NULL),(386,'sardines',10,NULL,NULL),(387,'saumon',10,NULL,NULL),(388,'saumon en boîte',10,NULL,NULL),(389,'thon',10,NULL,NULL),(390,'tourteau',10,NULL,NULL),(391,'truite',10,NULL,NULL),(392,'Beaufort',11,NULL,NULL),(393,'bleu d\'Auvergne',11,NULL,NULL),(394,'Brie',11,NULL,NULL),(395,'camembert',11,NULL,NULL),(396,'Cantal',11,NULL,NULL),(397,'cheddar',11,NULL,NULL),(398,'chèvre',11,NULL,NULL),(399,'brebis',11,NULL,NULL),(400,'Comté',11,NULL,NULL),(401,'crème Chantilly',11,NULL,NULL),(402,'crème de soja',11,NULL,NULL),(403,'faisselle',11,NULL,NULL),(404,'feta',11,NULL,NULL),(405,'fromage blanc',11,NULL,NULL),(406,'fromage frais',11,NULL,NULL),(407,'Gorgonzola',11,NULL,NULL),(408,'gouda',11,NULL,NULL),(409,'lait concentré',11,NULL,NULL),(410,'lait de coco',11,NULL,NULL),(411,'lait de soja',11,NULL,NULL),(412,'lait fermenté',11,NULL,NULL),(413,'Mascarpone',11,NULL,NULL),(414,'mimolette',11,NULL,NULL),(415,'Mont d\'Ormorbier',11,NULL,NULL),(416,'mozzarella',11,NULL,NULL),(417,'Munster',11,NULL,NULL),(418,'parmesan',11,NULL,NULL),(419,'petits suisses',11,NULL,NULL),(420,'raclette',11,NULL,NULL),(421,'reblochon',11,NULL,NULL),(422,'Roquefort',11,NULL,NULL),(423,'saint nectaire',11,NULL,NULL),(424,'Saint-Marcellin',11,NULL,NULL),(425,'pates',12,NULL,NULL),(426,'blé',12,NULL,NULL),(427,'boulghour',12,NULL,NULL),(428,'farine d\'orge',12,NULL,NULL),(429,'farine de châtaignes',12,NULL,NULL),(430,'farine de froment',12,NULL,NULL),(431,'farine de maïs',12,NULL,NULL),(432,'farine de noix de coco',12,NULL,NULL),(433,'farine de petit épeautre',12,NULL,NULL),(434,'farine de pois chiches',12,NULL,NULL),(435,'farine de quinoa',12,NULL,NULL),(436,'farine de riz',12,NULL,NULL),(437,'farine de sarrazin',12,NULL,NULL),(438,'farine de seigle',12,NULL,NULL),(439,'galettes de riz',12,NULL,NULL),(440,'galettes de riz',12,NULL,NULL),(441,'graines de courge',12,NULL,NULL),(442,'graines de tournesol',12,NULL,NULL),(443,'lasagnes',12,NULL,NULL),(444,'mil',12,NULL,NULL),(445,'müesli',12,NULL,NULL),(446,'nouilles chinoises',12,NULL,NULL),(447,'pâtes de riz',12,NULL,NULL),(448,'quinoa',12,NULL,NULL),(449,'riz complet',12,NULL,NULL),(450,'sarrazin',12,NULL,NULL),(451,'semoule de blé',12,NULL,NULL),(452,'semoule de maïs',12,NULL,NULL),(453,'vermicelles de riz',12,NULL,NULL),(454,'cannelle',13,NULL,NULL),(455,'cardamome',13,NULL,NULL),(456,'clous de girofle',13,NULL,NULL),(457,'colombo',13,NULL,NULL),(458,'cumin',13,NULL,NULL),(459,'curcuma',13,NULL,NULL),(460,'curry',13,NULL,NULL),(461,'eau de fleurs d\'oranger',13,NULL,NULL),(462,'eau de rose',13,NULL,NULL),(463,'essence d\'amandes',13,NULL,NULL),(464,'extrait d\'amandes amères',13,NULL,NULL),(465,'garam massala',13,NULL,NULL),(466,'kari gosse',13,NULL,NULL),(467,'noix de muscade',13,NULL,NULL),(468,'paprika',13,NULL,NULL),(469,'piment',13,NULL,NULL),(470,'safran',13,NULL,NULL),(471,'vanille',13,NULL,NULL),(472,'armagnac',14,NULL,NULL),(473,'bière',14,NULL,NULL),(474,'calvados',14,NULL,NULL),(475,'champagne',14,NULL,NULL),(476,'cidre',14,NULL,NULL),(477,'cognac',14,NULL,NULL),(478,'cointreau',14,NULL,NULL),(479,'eau de vie',14,NULL,NULL),(480,'eau gazeuse',14,NULL,NULL),(481,'Grand Marnier',14,NULL,NULL),(482,'Kirsch',14,NULL,NULL),(483,'madère',14,NULL,NULL),(484,'Martini',14,NULL,NULL),(485,'muscat',14,NULL,NULL),(486,'pastis',14,NULL,NULL),(487,'porto',14,NULL,NULL),(488,'rhum',14,NULL,NULL),(489,'saké',14,NULL,NULL),(490,'vin blanc',14,NULL,NULL),(491,'vin rouge',14,NULL,NULL),(492,'vodka',14,NULL,NULL),(493,'whisky',14,NULL,NULL),(494,'graisse de canard',15,NULL,NULL),(495,'huile d\'arachide',15,NULL,NULL),(496,'huile de noix',15,NULL,NULL),(497,'huile de palme',15,NULL,NULL),(498,'huile de pépins de raisin',15,NULL,NULL),(499,'huile de sésame',15,NULL,NULL),(500,'saindoux',15,NULL,NULL);
/*!40000 ALTER TABLE `Ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recettes`
--

DROP TABLE IF EXISTS `Recettes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recettes` (
  `idRecette` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleR` varchar(50) NOT NULL,
  `instructions` varchar(1000) NOT NULL,
  PRIMARY KEY (`idRecette`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recettes`
--

LOCK TABLES `Recettes` WRITE;
/*!40000 ALTER TABLE `Recettes` DISABLE KEYS */;
INSERT INTO `Recettes` VALUES (1,'Salade d\'automne','\nBon comme elle avait une belle gueule, j\'ai d?cid? de mettre cette recette sur le site, ?a mange pas de pain. Quoique un pain aux noix, c\'est pas mal en accompagnement :)\n\nH? b?... On met les oeufs ? cuire 10 min (?a donnera genre oeufs mollets-durs), on les ?caille sous l\'eau froide, on attend qu\'ils refroidissent, on les coupe en 4 et on m?lange le tout !\n\nOn accompagne tout ?a d\'une vinaigrette et paf, la salade d\'automne.\n'),(2,'Salade de pates multicolore','\n- 1) Dans une grande casserole, faites cuire dans un grand volume d\'eau sal?e les p?tes tricolores en les gardant bien fermes. Egouttez-les et placez la passoire sous le robinet d\'eau fra?che. Brassez les p?tes sous l\'eau jusqu\'? elles aient bien refroidi (cette op?ration stoppe leur cuisson, les garde fermes, et les emp?che de coller en les d?barrassant de l\'amidon de bl? dissous dans l\'eau de cuisson). Egouttez ? nouveau.\nVersez les p?tes dans un saladier et arrosez-les d\'un filet d\'huile d\'olive. M?langez d?licatement et r?servez.\n- 2) Lavez les poivrons. Ep?pinez-les et coupez-les en d?s. Epluchez le concombre, ?p?pinez-le et coupez-le en cubes. Egouttez le ma?s. A joutez ces l?gumes aux p?tes dans le saladier.\n- 3) D?graissez le ou les fonds de jambon. Coupez en cubes et mettez-les dans le saladier.\n- 4) Pr?parez la sauce. Pelez, d?germez et hachez finement la gousse d\'ail. M?langez au fouet dans un bol 10 c. ? s. D\'huile d\'olive, 1 c. ? s. De moutarde, 2 c. ? s. De vinaigre, ide'),(3,'Les pates a la carbonara',' \nMettre ? bouillir l\'eau des p?tes. Une fois les p?tes jet?es dans l\'eau, faites chauffer une petite po?le avec un peu d\'huile d\'olive puis lorsqu\'elle fr?mit mettez-y le lard (coup? en lardons) ? frire 2-3 minutes (oui, certains (certaines ?) crieront au scandale, comme si les lardons n\'?taient pas assez gras comme ?a ! - ben oui c\'est bien meilleur comme ?a !).\nCasser l\'oeuf et s?parer le blanc du jaune pour ne garder que ce dernier.\n\nLorsque les p?tes sont cuites, ajouter les lardons, le jaune d\'oeuf et poivrez l?g?rement.\nAllez, je vous l\'autorise, vous pouvez mettre une cuiller ? soupe de cr?me fra?che ?paisse si vous en avez. Et un peu d\'huile d\'olive (r??o ?a va... ). Et quelques copeaux de parmesan. Et r?galez-vous.\n'),(4,'Linguine au roquefort','\nPortez ? ?bullition une grande casserole d\'eau sal?e. Lorsque l\'eau bout, jetez les p?tes dedans et pendant qu\'elles cuisent faites chauffer ? feu moyen une petite casserole avec la cr?me fra?che et le roquefort. Remuez r?guli?rement jusqu\'? obtenir une cr?me homog?ne.\n\nEgouttez les p?tes et disposez la sauce dessus, ajoutez un peu de parmesan ou de fromage r?p? si vous en avez. Bon app?tit !\n'),(5,'Mijote d\'agneau aux feves','\n1. Si votre boucher ne l\'a pas fait, d?coupez la viande en 8 morceaux de taille ?gale. Faites-les dorer quelques minutes dans votre plat ? tajine ou cocotte avec quelques cuill?res ? soupe d\'huile d\'olive, le cumin et le piment ; arrosez le tout d\'eau, ajoutez quelques brins de coriandre fra?che, les gousses d\'ail non pel?es, le concentr? de tomate puis salez : c\'est parti pour 2 h minimum de cuisson ! Notez que la viande devra ?tre toujours recouverte de liquide pendant au moins la premi?re heure de cuisson.\n\n2. Pr?paration des f?ves : c\'est l\'?tape la plus fastidieuse... ?cossez les f?ves en vous d?brouillant pour enlever le germe en m?me temps ; pratiquez une incision en croix ? l\'emplacement du germe de chaque f?ve. Portez ? ?bullition une casserole d\'eau (si vous avez, ajoutez une cuill?re ? caf? de bicarbonate de soude), lorsque l\'eau bout plongez les f?ves 3-4 minutes dedans ; sortez les f?ves ? l\'aide d\'une ?cumoire (laissez la casserole d\'eau sur le feu) puis trempez-les dans'),(6,'Pekinoise et nems de poisson marine','\nOn commence par ?plucher la carotte et la mangue pas trop m?re.\n\nTailler en fines fines lamelles avec une fine lame. R?server.\n\nL?, il faut pr?parer la marinade pour le poisson.\n\nAlors, il faut pr?lever le jus des citrons et le zeste.\n\nVerser dans le bol la sauce soja, le vinaigre de riz, le piment, le gingembre r?p?, l\'ail coup? fin, le poivre.\n\nIl s\'agit de bien r?aliser le pliage des nems, pour rendre les galettes de riz utilisables (il en faut deux pour chaque rouleau ) il faut les tremper quelques minutes dans l\'eau chaude, elles vont devenir souples et un rien gluantes sous vos doigts,\n\nc\'est le moment de les ?taler sur un papier absorbant mouill?, c\'est important si vous ne voulez pas vous retrouver avec un \"truc\" collant et impossible ? manipuler !\n\nVoil?, vos deux galettes de riz sont superpos?es et ?tal?es devant vous, vous allez d?poser au centre un morceau poisson marin? quelques carottes en lamelles et quelques tiges d\'oignons nouveaux.\n\nReplier les bords de la galette su'),(7,'Poulet aux trois poivrons','\n1. D?coupez le poulet et les poivrons en morceaux de taille ?gale (n\'oubliez pas d\'enlever le coeur des poivrons). Emincez l\'ail et le gingembre et coupez l\'oignon en lamelles.\n\n2. Dans une po?le bien chaude et bien huil?e (on n\'est pas des pros du wok non plus, et puis l\'huile d\'olive c\'est tellement bon hein), faites sauter tout ?a (n\'oubliez pas le sel) une dizaine de minutes ? feu vif (faites bien sauter ou remuez bien en permanence pour ne pas que ?a crame).\n\n3. Sortez du feu, reste plus qu\'? ajouter le basilic ou la coriandre hach?e au moment de servir, et bonne d?gustation !\n    un reste de poulet r?ti (le blanc surtout) ou deux escalopes\n'),(8,'Tajine de printemps','\nDans un plat ? tajine ou un faitout, faire revenir quelques minutes dans un peu d\'huile d\'olive les morceaux d\'agneau ? feu moyen (pensez ? intercaler un diffuseur de chaleur sous le plat ? tajine pour pr?server la terre cuite) puis ajouter les tomates, le piment, les navets ?pluch?s et les gousses d\'ail avec leur peau. Recouvrir d\'eau (la viande ne doit pas ?tre ? l\'air libre) puis laisser mijoter une bonne heure, toujours ? feu moyen.\nAjouter ensuite les carottes puis, une demi-heure plus tard, les pommes de terre et les petits pois et laisser mijoter encore une demi-heure jusqu\'? cuisson compl?te de ces derniers.\n\nC\'est pr?t mais n\'oubliez pas, un plat mijot? est toujours meilleur apr?s refroidissement complet puis r?chauffage !\n'),(9,'Tarte Tomate et Thon','\n1. Pr?chauffez votre four ? 190? (th 6-7), d?roulez la p?te, disposez-la dans un plat allant au four et piquez-en le fond avec une fourchette.\n\n2. Pr?cuisez la p?te une quinzaine de minutes.\n\n3. Pendant ce temps, pr?parez la garniture :\n- Mixez la tomate, les ?pices et les 2 cuill?res d\'huile d\'olive\n- Ajoutez au thon ?miett?\n- M?langez bien et r?servez\n\n4. Sortez la p?te du four et ?talez le fromage frais.\nVersez par-dessus la garniture thon-tomate et saupoudrez d\'emmental r?p?.\n\n5. Cuire 20 minutes au four\n\n6. Servez accompagn? d\'une salade verte\n'),(10,'Douceur de pamplemousse au citron vert','\nEn place pour commencer ?!!\n\nIl fait chaud, il me faut une salade !! Mais pas quelque chose de trop classique !! J\'ai besoin d\'exotisme moi !!\n\nRetirer ? l\'aide d\'un grand couteau les supr?mes des pamplemousses, ?plucher un concombre et le tailler en cubes.\nVerser le lait de coco (il est l? l\'exotisme...! !), ajouter le jus de citron vert (l? aussi...!), le cumin en poudre (ha le cumin... Utilis? au moins depuis l\'Egypte ancienne puis ? Rome et ensuite au Moyen ?ge, ramen? des croisades... Si c\'est pas de l\'exotisme ?a !!) le sel et le poivre.\nPlacer cette petite salade au frais, puis la dresser dans des coupes.\n\nVoil?, c\'est fini. Bonne d?gustation !!\n'),(11,'Salade de thon ','\nCoupez l\'avocat et les tomates en cubes, ?mincez l\'oignon, ?miettez le thon et la feta.\nMettez le tout dans un saladier ou dans deux assiettes. Ajoutez les olives et/ou tout autre ingr?dient du genre (tomates s?ch?es, c?pres... ). Ajoutez un filet d\'huile d\'olive, 2 cuill?res ? soupe de vinaigre balsamique, salez, poivrez, m?langez. C\'est pr?t.\n'),(12,'Salade de pois chiches et carottes au cumin','\nles pois chiches : si vous avez des pois chiches en boite un peu dur vous pouvez les refaire cuire 10 minutes dans leur jus pour les attendrir avant de commencer la recette.\nRincez-les biens ? l\'eau courante et si vous ?tes patient enlevez les peaux (on me dit toujours que ?a ne change rien mais bon je n\'y peux rien ces peaux m\'?nervent alors je ne peux pas ne pas les enlever !)\nR?servez dans un saladier\nLes carottes : ?pluchez et r?pez-les (si possible pas trop fin afin de garder un cot? croquant)\nM?langez les au pois chiches et ajoutez-y l\'huile d\'olive, le jus de citron, le cumin (en poudre et en graines ), salez et poivrez. M?langez bien.\nEpluchez et ?mincez l\'oignon et ajoutez-le ? la salade. M?langez bien.\nAjoutez un peu de piment si vous aimez ?a et rectifiez l\'assaisonnement si n?cessaire.\nLaissez reposer au frais afin que tous les aromes se m?langent.\n\nSortez la salade en avance du frigo afin qu\'elle ne soit pas glaciale et parsemez de persil hach? au moment de servir\nBon ap?'),(13,'Salade exotique','\nUne recette tr?s classique de ma grand-m?re qui n\'en est pas moins exotique !\nAlors bon ben c\'est tout simple hein :\n\n1. Coupez les avocats en deux, enlevez le noyau et s?parez la chair de la peau, puis coupez la chair en d?s plus ou moins gros.\n\n2. D?cortiquez les crevettes, enlevez absolument tout pour ne garder que la chair !\n\n3. Pelez le pamplemousse, enlevez bien la peau blanche ?galement et d?taillez les quartiers en morceaux.\n\n4. Pr?parez une vinaigrette classique dans laquelle vous remplacerez le vinaigre par du citron ou du jus de pamplemousse ou du vinaigre de framboise, vous pouvez ajouter aussi un peu de curry, ce qui vous chante quoi c\'est exotique on improvise on improvise !\n\nIl n\'y a plus qu\'? m?langer le tout, mais ?a vous l\'aurez bien compris...\n'),(14,'Recette de chou rouge ','\n?a y est !! La premi?re recette de chou rouge est sur Lebruitdufrigo !!\n\nJ\'ai bien cru qu\'on n\'y arriverait jamais.\n\nNous commen?ons donc avec une tr?s bonne salade, les cl?mentines ou oranges se mariant tr?s bien avec ce l?gume capricieux gr?ce ? leur saveur sucr?e. La texture est ?galement importante dans cette salade, surtout si vous associez un peu de graines ou de fruits ? coques pour contraster avec le s?v?re croquant du chou rouge. C\'est surprenant et un r?gal pour les papilles !\n\nDonc bon ben on m?lange le tout hein apr?s avoir ?pluch? les agrumes, une petite vinaigrette pif paf c\'est dans la bo?te.\n\nBonne d?gustation !\n'),(15,'Entree mediterraneenne','\nComme il me restait quelques f?ves du tajine d\'agneau, je me suis dit qu\'une bonne petite salade de f?ves serait parfaite pour ne pas les perdre. Vous allez voir, c\'est d?licieux !\n\n1. Pr?paration des f?ves : c\'est l\'?tape la plus fastidieuse... ?cossez les f?ves en vous d?brouillant pour enlever le germe en m?me temps ; pratiquez une incision en croix ? l\'emplacement du germe de chaque f?ve. Portez ? ?bullition une casserole d\'eau (si vous avez, ajoutez une cuill?re ? caf? de bicarbonate de soude), lorsque l\'eau bout plongez les f?ves 10 minutes dedans ; sortez les f?ves ? l\'aide d\'une ?cumoire (laissez la casserole d\'eau sur le feu) puis trempez-les dans l\'eau froide. Lorsqu\'elles sont refroidies, vous pouvez commencer ? les d?rober une par une pour enlever leur peau. C\'est long mais indispensable !\nMettez ensuite les f?ves au frais.\n\n2. Une fois les f?ves d?rob?es et refroidies, pr?parez la vinaigrette en m?langeant l\'huile d\'olive, le sel, le citron et le cumin. Incorporez aux f?v'),(16,'Salade tomates feta croutons','\nD?couper la tomate et le fromage en gros d?s\nDans l\'assiette, disposer la salade m?che, les tomates, les d?s de fromages, des cro?tons (? l\'ail de pr?f?rence c\'est meilleur)\nAssaisonner avec un filet d\'huile d\'olive et du vinaigre balsamique\nC\'est pr?t !\n\nVous pouvez rajouter des lardons et/ou du ma?s suivant les envies\n'),(17,'Pas trop chou','\nCa para?t pas comme ?a, mais c\'est d?licieux ! Surtout avec du gomasio et de la levure de bi?re, qui ont un go?t et une texture parfaits pour accompagner.\n\nSuffit juste de peler et r?per les betteraves, de ciseler le chou, et pi voil? quoi.\n');
/*!40000 ALTER TABLE `Recettes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Saisons`
--

DROP TABLE IF EXISTS `Saisons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Saisons` (
  `IdSaison` int(11) NOT NULL AUTO_INCREMENT,
  `LibelleS` varchar(50) NOT NULL,
  `DateDebut` date NOT NULL,
  `DateFin` date NOT NULL,
  PRIMARY KEY (`IdSaison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Saisons`
--

LOCK TABLES `Saisons` WRITE;
/*!40000 ALTER TABLE `Saisons` DISABLE KEYS */;
/*!40000 ALTER TABLE `Saisons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appartenir`
--

DROP TABLE IF EXISTS `appartenir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appartenir` (
  `idIngr` int(10) NOT NULL,
  `idFamille` int(10) NOT NULL,
  PRIMARY KEY (`idIngr`,`idFamille`),
  KEY `appartenir_FamilleIngredient0_FK` (`idFamille`),
  CONSTRAINT `appartenir_FamilleIngredient0_FK` FOREIGN KEY (`idFamille`) REFERENCES `FamillesIngredients` (`idFamille`),
  CONSTRAINT `appartenir_Ingredient_FK` FOREIGN KEY (`idIngr`) REFERENCES `Ingredients` (`idIngr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartenir`
--

LOCK TABLES `appartenir` WRITE;
/*!40000 ALTER TABLE `appartenir` DISABLE KEYS */;
/*!40000 ALTER TABLE `appartenir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composer`
--

DROP TABLE IF EXISTS `composer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composer` (
  `idRecette` int(10) NOT NULL,
  `idIngr` int(10) NOT NULL,
  `estRemplacable` int(1) NOT NULL,
  `quantite` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idRecette`,`idIngr`),
  KEY `composer_Ingredient0_FK` (`idIngr`),
  CONSTRAINT `composer_Ingredient0_FK` FOREIGN KEY (`idIngr`) REFERENCES `Ingredients` (`idIngr`),
  CONSTRAINT `composer_Recette_FK` FOREIGN KEY (`idRecette`) REFERENCES `Recettes` (`idRecette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composer`
--

LOCK TABLES `composer` WRITE;
/*!40000 ALTER TABLE `composer` DISABLE KEYS */;
INSERT INTO `composer` VALUES (1,145,0,'2'),(1,162,0,'1'),(1,217,0,'1'),(2,11,0,'2cs'),(2,14,0,'1cs'),(2,23,0,'2cs'),(2,134,0,'1gousse'),(2,141,0,'10cs'),(2,149,0,'NULL'),(2,152,0,'NULL'),(2,177,0,'1/2'),(2,209,0,'1'),(2,210,0,'1'),(2,425,0,'250g'),(3,145,0,'1'),(3,149,0,'NULL'),(3,315,0,'1tranche'),(3,425,0,'125g'),(4,138,0,'10cl'),(4,422,0,'20g'),(4,425,0,'125g'),(5,3,0,'2cs'),(5,71,0,'1bouquet'),(5,134,0,'8gousses'),(5,141,0,'NULL'),(5,152,0,'NULL'),(5,182,0,'400g'),(5,184,0,'3kg'),(5,203,0,'1cc'),(5,292,0,'800g'),(5,458,0,'1cs'),(6,8,0,'1cm'),(6,16,0,'2cc'),(6,30,0,'2cs'),(6,132,0,'1pinc?e'),(6,134,0,'1gousse'),(6,141,0,'3cs'),(6,146,0,'2'),(6,149,0,'NULL'),(6,166,0,'1'),(6,203,0,'1/2cc'),(6,249,0,'2'),(6,264,0,'1'),(7,134,0,'1gousse'),(7,141,0,'NULL'),(7,146,0,'1'),(7,152,0,'NULL'),(7,209,0,'1'),(7,210,0,'1'),(7,211,0,'1'),(8,20,0,'4'),(8,40,0,'8'),(8,134,0,'1tete'),(8,141,0,'NULL'),(8,152,0,'NULL'),(8,166,0,'8'),(8,195,0,'8'),(8,202,0,'500g'),(8,203,0,'1pinc?e'),(8,292,0,'800g'),(9,20,0,'2'),(9,140,0,'70g'),(9,147,0,'1'),(9,149,0,'NULL'),(9,152,0,'NULL'),(9,389,0,'1boite'),(9,406,0,'150g'),(10,69,0,'1bouquet'),(10,149,0,'NULL'),(10,152,0,'NULL'),(10,177,0,'1'),(10,249,0,'1'),(10,278,0,'2'),(10,410,0,'25cl'),(10,458,0,'1cc'),(11,20,0,'2'),(11,24,0,'NULL'),(11,141,0,'NULL'),(11,146,0,'1/2'),(11,149,0,'NULL'),(11,152,0,'NULL'),(11,161,0,'1'),(11,196,0,'1poign?e'),(11,389,0,'1bo?te'),(11,404,0,'1morceau'),(12,141,0,'5cs'),(12,146,0,'1'),(12,149,0,'NULL'),(12,152,0,'NULL'),(12,166,0,'4'),(12,207,0,'1bocal'),(12,248,0,'2cs'),(12,458,0,'2-3cs'),(13,161,0,'2'),(13,278,0,'1gros'),(13,348,0,'1poign?e'),(14,25,0,'NULL'),(14,172,0,'1'),(14,250,0,'Quelques'),(15,71,0,'NULL'),(15,141,0,'2-3cs'),(15,149,0,'NULL'),(15,152,0,'NULL'),(15,184,0,'2kg'),(15,248,0,'1'),(15,458,0,'NULL'),(16,20,0,'1'),(16,24,0,'NULL'),(16,141,0,'NULL'),(16,193,0,'2poign?es'),(16,404,0,'NULL'),(17,162,0,'2'),(17,169,0,'1/8');
/*!40000 ALTER TABLE `composer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consommer`
--

DROP TABLE IF EXISTS `consommer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consommer` (
  `IdSaison` int(10) NOT NULL,
  `idIngr` int(10) NOT NULL,
  PRIMARY KEY (`IdSaison`,`idIngr`),
  KEY `consommer_Ingredient0_FK` (`idIngr`),
  CONSTRAINT `consommer_Ingredient0_FK` FOREIGN KEY (`idIngr`) REFERENCES `Ingredients` (`idIngr`),
  CONSTRAINT `consommer_Saison_FK` FOREIGN KEY (`IdSaison`) REFERENCES `Saisons` (`IdSaison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consommer`
--

LOCK TABLES `consommer` WRITE;
/*!40000 ALTER TABLE `consommer` DISABLE KEYS */;
/*!40000 ALTER TABLE `consommer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regrouper`
--

DROP TABLE IF EXISTS `regrouper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regrouper` (
  `idCategorie` int(10) NOT NULL,
  `idRecette` int(10) NOT NULL,
  PRIMARY KEY (`idCategorie`,`idRecette`),
  KEY `regrouper_Recette0_FK` (`idRecette`),
  CONSTRAINT `regrouper_CategorieRecette_FK` FOREIGN KEY (`idCategorie`) REFERENCES `CategoriesRecettes` (`idCategorie`),
  CONSTRAINT `regrouper_Recette0_FK` FOREIGN KEY (`idRecette`) REFERENCES `Recettes` (`idRecette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regrouper`
--

LOCK TABLES `regrouper` WRITE;
/*!40000 ALTER TABLE `regrouper` DISABLE KEYS */;
/*!40000 ALTER TABLE `regrouper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggerer`
--

DROP TABLE IF EXISTS `suggerer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggerer` (
  `idRecette` int(10) NOT NULL,
  `IdSaison` int(10) NOT NULL,
  PRIMARY KEY (`idRecette`,`IdSaison`),
  KEY `suggerer_Saison0_FK` (`IdSaison`),
  CONSTRAINT `suggerer_Recette_FK` FOREIGN KEY (`idRecette`) REFERENCES `Recettes` (`idRecette`),
  CONSTRAINT `suggerer_Saison0_FK` FOREIGN KEY (`IdSaison`) REFERENCES `Saisons` (`IdSaison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggerer`
--

LOCK TABLES `suggerer` WRITE;
/*!40000 ALTER TABLE `suggerer` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggerer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-05 12:44:26
