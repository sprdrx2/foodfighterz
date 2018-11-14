-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: foodfighterz
-- ------------------------------------------------------
-- Server version	5.5.52-0+deb8u1

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
-- Table structure for table `CategorieRecette`
--

DROP TABLE IF EXISTS `CategorieRecette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategorieRecette` (
  `idCategorie` int(11) NOT NULL,
  `LibelleC` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategorieRecette`
--

LOCK TABLES `CategorieRecette` WRITE;
/*!40000 ALTER TABLE `CategorieRecette` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategorieRecette` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriesRecettes`
--

LOCK TABLES `CategoriesRecettes` WRITE;
/*!40000 ALTER TABLE `CategoriesRecettes` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoriesRecettes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FamilleIngredient`
--

DROP TABLE IF EXISTS `FamilleIngredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FamilleIngredient` (
  `idFamille` int(11) NOT NULL,
  `LibelleF` varchar(50) NOT NULL,
  PRIMARY KEY (`idFamille`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FamilleIngredient`
--

LOCK TABLES `FamilleIngredient` WRITE;
/*!40000 ALTER TABLE `FamilleIngredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `FamilleIngredient` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FamillesIngredients`
--

LOCK TABLES `FamillesIngredients` WRITE;
/*!40000 ALTER TABLE `FamillesIngredients` DISABLE KEYS */;
INSERT INTO `FamillesIngredients` VALUES (1,'condiments et sauce'),(2,'divers'),(3,'plantes aromatiques'),(4,'le sucré '),(5,'les incontournables'),(6,'légumes et tubercules'),(7,'champignons'),(8,'fruits et fruits secs'),(9,'viandes, oeufs, charcuteries'),(10,'poissons, coquillages et crustacés'),(11,'produits laitiers'),(12,'pates, riz, céréales...'),(13,'épices et arômes'),(14,'alcools et boissons'),(15,'matières grasses');
/*!40000 ALTER TABLE `FamillesIngredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredient`
--

DROP TABLE IF EXISTS `Ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ingredient` (
  `idIngr` int(11) NOT NULL,
  `LibelleI` varchar(50) NOT NULL,
  PRIMARY KEY (`idIngr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredient`
--

LOCK TABLES `Ingredient` WRITE;
/*!40000 ALTER TABLE `Ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ingredient` ENABLE KEYS */;
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
  `LibelleI_Pluriel` varchar(50) DEFAULT NULL,
  `Alias_Singulier` varchar(50) DEFAULT NULL,
  `Alias_Pluriel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idIngr`),
  KEY `Ingredients_FK_FamillesIngredients` (`idFamille`),
  CONSTRAINT `Ingredients_FK_FamillesIngredients` FOREIGN KEY (`idFamille`) REFERENCES `FamillesIngredients` (`idFamille`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredients`
--

LOCK TABLES `Ingredients` WRITE;
/*!40000 ALTER TABLE `Ingredients` DISABLE KEYS */;
INSERT INTO `Ingredients` VALUES (1,'câpre',1,'câpres','NULL','NULL'),(2,'combava',1,'combavas','NULL','NULL'),(3,'concentré de tomate',1,'concentré de tomates','NULL','NULL'),(4,'cornichon',1,'cornichons','NULL','NULL'),(5,'coulis de tomate',1,'coulis de tomates','NULL','NULL'),(6,'échalote',1,'échalotes','NULL','NULL'),(7,'encre de seiche',1,'encre de seiches','NULL','NULL'),(8,'gingembre',1,'NULL','NULL','NULL'),(9,'gomasio',1,'NULL','NULL','NULL'),(10,'harissa',1,'NULL','NULL','NULL'),(11,'ketchup',1,'NULL','NULL','NULL'),(12,'mayonnaise',1,'NULL','NULL','NULL'),(13,'miso',1,'NULL','NULL','NULL'),(14,'moutarde',1,'NULL','NULL','NULL'),(15,'sauce béarnaise',1,'NULL','NULL','NULL'),(16,'sauce soja',1,'NULL','NULL','NULL'),(17,'sauce worcestershire',1,'NULL','NULL','NULL'),(18,'sel de céleri',1,'NULL','NULL','NULL'),(19,'tabasco',1,'NULL','NULL','NULL'),(20,'tapenade',1,'tapenades','NULL','NULL'),(21,'tomate',1,'tomates','NULL','NULL'),(22,'tomate confite',1,'tomates confites','NULL','NULL'),(23,'tomate séchée',1,'tomates séchées','NULL','NULL'),(24,'vinaigre',1,'NULL','NULL','NULL'),(25,'vinaigre balsamique',1,'NULL','NULL','NULL'),(26,'vinaigrette',1,'NULL','NULL','NULL'),(27,'vinaigre blanc',1,'NULL','NULL','NULL'),(28,'vinaigre de cidre',1,'NULL','NULL','NULL'),(29,'vinaigre de framboise',1,'vinaigre de framboises','NULL','NULL'),(30,'vinaigre de noix',1,'NULL','NULL','NULL'),(31,'vinaigre de riz',1,'NULL','NULL','NULL'),(32,'vinaigre de xérès',1,'NULL','NULL','NULL'),(33,'agar-agar',2,'NULL','NULL','NULL'),(34,'bicarbonate de soude',2,'NULL','NULL','NULL'),(35,'biscottes',2,'biscotte','NULL','NULL'),(36,'bouillon cube',2,'bouillons cubes','NULL','NULL'),(37,'chapelure',2,'NULL','NULL','NULL'),(38,'colorant alimentaire',2,'colorants alimentaires','NULL','NULL'),(39,'crème de sésame',2,'crème de sésames','NULL','NULL'),(40,'fécule de blé',2,'NULL','NULL','NULL'),(41,'pomme de terre',2,'pommes de terre','patate','patates'),(42,'feuille de brick',2,'feuilles de brick','NULL','NULL'),(43,'galette',2,'galettes','NULL','NULL'),(44,'gélatine',2,'feuille de gélatine','feuilles de gélatine','NULL'),(45,'levure chimique',2,'levures chimiques','NULL','NULL'),(46,'levure de bière',2,'levures de bière','NULL','NULL'),(47,'levure de boulanger',2,'levures de boulanger','NULL','NULL'),(48,'maïzena',2,'NULL','NULL','NULL'),(49,'pain',2,'pains','NULL','NULL'),(50,'pain à burgers',2,'pains à burgers','pain à burger','pains à burger'),(51,'pain de mie',2,'NULL','NULL','NULL'),(52,'pâte d\'amande',2,'pâte d\'amandes','pâtes d\'amande','pâtes d\'amandes'),(53,'pâte de pistaches',2,'pâte de pistache','pâtes de pistache','pâtes de pistaches'),(54,'pâte sablée',2,'pâtes sablées','NULL','NULL'),(55,'praliné',2,'pralinés','NULL','NULL'),(56,'tacos',2,'NULL','NULL','NULL'),(57,'tapioca',2,'NULL','NULL','NULL'),(58,'tofu',2,'NULL','NULL','NULL'),(59,'algue wakamé',3,'algues wakamé','NULL','NULL'),(60,'aneth',3,'NULL','NULL','NULL'),(61,'anis',3,'NULL','NULL','NULL'),(62,'badiane',3,'NULL','NULL','NULL'),(63,'baie de genévrier',3,'baies de genévrier','NULL','NULL'),(64,'basilic',3,'NULL','NULL','NULL'),(65,'basilic thaï',3,'NULL','NULL','NULL'),(66,'cacao',3,'poudre de cacao','NULL','NULL'),(67,'café',3,'cafés','NULL','NULL'),(68,'carvi',3,'NULL','NULL','NULL'),(69,'cerfeuil',3,'NULL','NULL','NULL'),(70,'ciboulette',3,'NULL','NULL','NULL'),(71,'citronnelle',3,'NULL','NULL','NULL'),(72,'coriandre',3,'NULL','NULL','NULL'),(73,'estragon',3,'NULL','NULL','NULL'),(74,'herbe de Provence',3,'herbes de Provence','NULL','NULL'),(75,'kombu',3,'NULL','NULL','NULL'),(76,'laurier',3,'lauriers','feuille de laurier','feuilles de lauriers'),(77,'lavande',3,'NULL','NULL','NULL'),(78,'menthe',3,'NULL','NULL','NULL'),(79,'origan',3,'NULL','NULL','NULL'),(80,'pavot',3,'pavots','graine de pavot','graines de pavots'),(81,'persil',3,'NULL','NULL','NULL'),(82,'romarin',3,'NULL','NULL','NULL'),(83,'sauge',3,'NULL','NULL','NULL'),(84,'sésame',3,'sésames','graine de sésame','graines de sésames'),(85,'thé',3,'NULL','NULL','NULL'),(86,'thé matcha',3,'NULL','NULL','NULL'),(87,'thym',3,'NULL','NULL','NULL'),(88,'verveine',3,'NULL','NULL','NULL'),(89,'beurre de cacahuète',4,'beurre de cacahuètes','NULL','NULL'),(90,'boudoir',4,'boudoirs','NULL','NULL'),(91,'caramel',4,'caramels','NULL','NULL'),(92,'chocolat blanc',4,'chocolats blancs','NULL','NULL'),(93,'compote de pommes',4,'compotes de pommes','compote de pomme','compotes de pomme'),(94,'confiture d\'abricot',4,'confiture d\'abricots','NULL','NULL'),(95,'confiture d\'orange',4,'confiture d\'oranges','NULL','NULL'),(96,'confiture de cassis',4,'NULL','NULL','NULL'),(97,'confiture de figue',4,'confiture de figues','NULL','NULL'),(98,'confiture de fraise',4,'confiture de fraises','NULL','NULL'),(99,'confiture de framboise',4,'confiture de framboises','NULL','NULL'),(100,'confiture de groseille',4,'confiture de groseilles','NULL','NULL'),(101,'confiture de lait',4,'NULL','NULL','NULL'),(102,'confiture de mûre',4,'confiture de mûres','NULL','NULL'),(103,'confiture de myrtille',4,'confiture de myrtilles','NULL','NULL'),(104,'confiture de pêche',4,'confiture de pêches','NULL','NULL'),(105,'confiture de prune',4,'confiture de prunes','NULL','NULL'),(106,'crème de marron',4,'crème de marrons','NULL','NULL'),(107,'glace banane',4,'NULL','glace à la banane','NULL'),(108,'glace café',4,'NULL','glace au café','NULL'),(109,'glace caramel',4,'NULL','glace au caramel','NULL'),(110,'glace chocolat',4,'NULL','glace au chocolat','NULL'),(111,'glace fraise',4,'NULL','glace à la fraise','NULL'),(112,'glace framboise',4,'NULL','glace à la framboise','NULL'),(113,'glace menthe-chocolat',4,'NULL','NULL','NULL'),(114,'glace noix de coco',4,'NULL','glace à la noix de coco','NULL'),(115,'glace pistache',4,'NULL','glace à la pistache','NULL'),(116,'glace pralinée',4,'NULL','glace au praline','glace aux pralines'),(117,'glace rhum-raisin',4,'glace rhum-raisins','NULL','NULL'),(118,'glace vanille',4,'NULL','glace à la vanille','NULL'),(119,'meringue',4,'meringues','NULL','NULL'),(120,'nutella',4,'NULL','NULL','NULL'),(121,'pain d\'épices',4,'pain d\'épice','NULL','NULL'),(122,'petit beurre',4,'petits beurre','petit beurres','petits beurres'),(123,'sirop d\'érable',4,'sirop d\'érables','NULL','NULL'),(124,'sorbet abricot',4,'sorbet à l\'abricot','NULL','NULL'),(125,'sorbet ananas',4,'sorbet à l\'ananas','NULL','NULL'),(126,'sorbet cassis',4,'sorbet au cassis','NULL','NULL'),(127,'sorbet citron',4,'sorbet au citron','NULL','NULL'),(128,'sorbet fruits de la passion',4,'sorbet aux fruits de la passion','NULL','NULL'),(129,'sorbet mangue',4,'sorbet à la mange','NULL','NULL'),(130,'sorbet melon',4,'sorbet au melon','NULL','NULL'),(131,'speculos',4,'NULL','NULL','NULL'),(132,'sucre glace',4,'NULL','NULL','NULL'),(133,'sucre perlé',4,'NULL','NULL','NULL'),(134,'sucre roux',4,'NULL','NULL','NULL'),(135,'sucre vanillé',4,'NULL','NULL','NULL'),(136,'ail',5,'ails','NULL','NULL'),(137,'beurre',5,'beurres','NULL','NULL'),(138,'margarine',5,'margarines','NULL','NULL'),(139,'chocolat',5,'chocolats','NULL','NULL'),(140,'crème fraiche',5,'crèmes fraiches','NULL','NULL'),(141,'gruyère',5,'NULL','NULL','NULL'),(142,'emmental',5,'NULL','NULL','NULL'),(143,'huile d\'olive',5,'huile d\'olives','NULL','NULL'),(144,'huile de tournesol',5,'huile de tournesols','NULL','NULL'),(145,'lait',5,'NULL','NULL','NULL'),(146,'miel',5,'NULL','NULL','NULL'),(147,'oeuf',5,'oeufs','NULL','NULL'),(148,'oignons',5,'oignon','NULL','NULL'),(149,'pâte brisée',5,'pâtes brisées','NULL','NULL'),(150,'pâte feuilletée',5,'pâtes feuilletées','NULL','NULL'),(151,'poivre',5,'NULL','NULL','NULL'),(152,'pomme de terre',5,'pommes de terre','patate','patates'),(153,'riz blanc',5,'NULL','NULL','NULL'),(154,'sel',5,'NULL','NULL','NULL'),(155,'sucre',5,'sucres','NULL','NULL'),(156,'tomate',5,'tomates','NULL','NULL'),(157,'vinaigre balsamique',5,'NULL','NULL','NULL'),(158,'vinaigre de vin',5,'NULL','NULL','NULL'),(159,'yaourt nature',5,'yaourts natures','NULL','NULL'),(160,'artichaut',6,'artichauts','NULL','NULL'),(161,'asperge',6,'asperges','NULL','NULL'),(162,'aubergine',6,'aubergines','NULL','NULL'),(163,'avocat',6,'avocats','NULL','NULL'),(164,'betterave',6,'betteraves','NULL','NULL'),(165,'bette',6,'blette','bettes','blettes'),(166,'broccoli',6,'brocolis','brocoli','broccolis'),(167,'carotte',6,'carottes','NULL','NULL'),(168,'céleri',6,'NULL','NULL','NULL'),(169,'céleri rave',6,'NULL','NULL','NULL'),(170,'chou',6,'choux','NULL','NULL'),(171,'chou chinois',6,'choux chinois','NULL','NULL'),(172,'chou fractal',6,'choux fractals','NULL','NULL'),(173,'chou rouge',6,'choux rouges','NULL','NULL'),(174,'chou-fleur',6,'choux-fleurs','NULL','NULL'),(175,'chou de Bruxelles',6,'choux de Bruxelles','NULL','NULL'),(176,'citrouille',6,'citrouilles','NULL','NULL'),(177,'coeur de palmier',6,'coeurs de palmier','NULL','NULL'),(178,'concombre',6,'concombres','NULL','NULL'),(179,'courge',6,'courges','NULL','NULL'),(180,'courgette',6,'courgettes','NULL','NULL'),(181,'cresson',6,'cressons','NULL','NULL'),(182,'endive',6,'endives','NULL','NULL'),(183,'epinards',6,'NULL','NULL','NULL'),(184,'fenouil',6,'NULL','NULL','NULL'),(185,'fève',6,'fèves','NULL','NULL'),(186,'flageolet',6,'flageolets','NULL','NULL'),(187,'germe de soja',6,'germes de soja','NULL','NULL'),(188,'haricot beurre',6,'haricots beurres','NULL','NULL'),(189,'haricot blanc',6,'haricots blancs','NULL','NULL'),(190,'haricot rouge',6,'haricots rouges','NULL','NULL'),(191,'haricot vert',6,'haricots verts','NULL','NULL'),(192,'lentille',6,'lentilles','NULL','NULL'),(193,'lentille corail',6,'lentilles corail','NULL','NULL'),(194,'mâche',6,'mâches','NULL','NULL'),(195,'maïs',6,'NULL','NULL','NULL'),(196,'navet',6,'navets','NULL','NULL'),(197,'olive noire',6,'olives noires','NULL','NULL'),(198,'olive verte',6,'olives vertes','NULL','NULL'),(199,'orties',6,'NULL','NULL','NULL'),(200,'oseille',6,'oseilles','NULL','NULL'),(201,'panais',6,'NULL','NULL','NULL'),(202,'patate douce',6,'patates douces','NULL','NULL'),(203,'petits pois',6,'NULL','NULL','NULL'),(204,'piment',6,'piments','NULL','NULL'),(205,'pissenlit',6,'pissenlits','NULL','NULL'),(206,'poireau',6,'poireaux','NULL','NULL'),(207,'pois cassés',6,'NULL','NULL','NULL'),(208,'pois chiches',6,'NULL','NULL','NULL'),(209,'pois gourmands',6,'NULL','NULL','NULL'),(210,'poivron rouge',6,'poivrons rouges','NULL','NULL'),(211,'poivron vert',6,'poivrons verts','NULL','NULL'),(212,'poivron jaune',6,'poivrons jaunes','NULL','NULL'),(213,'potimarron',6,'potimarrons','NULL','NULL'),(214,'potiron',6,'potirons','NULL','NULL'),(215,'pourpier',6,'pourpiers','NULL','NULL'),(216,'radis',6,'NULL','NULL','NULL'),(217,'radis noir',6,'radis noirs','NULL','NULL'),(218,'roquette',6,'roquettes','NULL','NULL'),(219,'rutabaga',6,'rutabagas','NULL','NULL'),(220,'salade rouge',6,'salades rouges','NULL','NULL'),(221,'salade verte',6,'salades vertes','NULL','NULL'),(222,'tomate verte',6,'tomates vertes','NULL','NULL'),(223,'topinambour',6,'topinambours','NULL','NULL'),(224,'bolet',7,'bolets','NULL','NULL'),(225,'cèpe',7,'cèpes','NULL','NULL'),(226,'champignon de Paris',7,'champignons de Paris','NULL','NULL'),(227,'champignon noirs',7,'champignons noir','NULL','NULL'),(228,'chanterelle',7,'chanterelles','NULL','NULL'),(229,'coulemelle',7,'coulemelles','NULL','NULL'),(230,'girolle',7,'girolles','NULL','NULL'),(231,'lactaire sanguin',7,'lactaires sanguins','NULL','NULL'),(232,'morille',7,'morilles','NULL','NULL'),(233,'pied de mouton',7,'pieds de mouton','NULL','NULL'),(234,'pleurotte',7,'pleurottes','NULL','NULL'),(235,'shitake',7,'shitakes','NULL','NULL'),(236,'trompette de la mort',7,'trompettes de la mort','NULL','NULL'),(237,'truffe',7,'truffes','NULL','NULL'),(238,'vesse de loup',7,'vesses de loup','NULL','NULL'),(239,'abricot',8,'abricots','NULL','NULL'),(240,'abricot sec',8,'abricots sec','abricot secs','abricots secs'),(241,'airelle',8,'airelles','NULL','NULL'),(242,'amande',8,'amandes','NULL','NULL'),(243,'ananas',8,'NULL','NULL','NULL'),(244,'banane',8,'bananes','NULL','NULL'),(245,'cacahuète',8,'cacahuètes','NULL','NULL'),(246,'cassis',8,'NULL','NULL','NULL'),(247,'cerise',8,'cerises','NULL','NULL'),(248,'châtaigne',8,'châtaignes','NULL','NULL'),(249,'citron',8,'citrons','NULL','NULL'),(250,'citron vert',8,'citrons vert','citron verts','citrons verts'),(251,'clémentine',8,'clémentines','NULL','NULL'),(252,'coing',8,'coings','NULL','NULL'),(253,'datte',8,'dattes','NULL','NULL'),(254,'figue',8,'figues','NULL','NULL'),(255,'fraise',8,'fraises','NULL','NULL'),(256,'framboise',8,'framboises','NULL','NULL'),(257,'fruit de la passion',8,'fruits de la passion','NULL','NULL'),(258,'fruit confit',8,'fruits confit','fruit confits','fruits confits'),(259,'fruit rouge',8,'fruits rouge','fruit rouges','fruits rouges'),(260,'goyave',8,'goyaves','NULL','NULL'),(261,'grenade',8,'grenades','NULL','NULL'),(262,'groseille',8,'groseilles','NULL','NULL'),(263,'kiwi',8,'kiwis','NULL','NULL'),(264,'litchi',8,'litchies','NULL','NULL'),(265,'mangue',8,'mangues','NULL','NULL'),(266,'marron',8,'marrons','NULL','NULL'),(267,'melon',8,'melons','NULL','NULL'),(268,'mirabelle',8,'mirabelles','NULL','NULL'),(269,'mûre',8,'mûres','NULL','NULL'),(270,'myrtille',8,'myrtilles','NULL','NULL'),(271,'nèfle',8,'nèfles','NULL','NULL'),(272,'noisette',8,'noisettes','NULL','NULL'),(273,'noix',8,'NULL','NULL','NULL'),(274,'noix de cajou',8,'NULL','NULL','NULL'),(275,'noix de coco',8,'NULL','NULL','NULL'),(276,'noix de macadamia',8,'NULL','NULL','NULL'),(277,'noix de pécan',8,'NULL','NULL','NULL'),(278,'orange',8,'oranges','NULL','NULL'),(279,'pamplemousse',8,'pamplemousses','NULL','NULL'),(280,'papaye',8,'papayes','NULL','NULL'),(281,'pastèque',8,'pastèques','NULL','NULL'),(282,'pêche',8,'pêches','NULL','NULL'),(283,'pignon de pin',8,'pignons de pin','NULL','NULL'),(284,'pistache',8,'pistaches','NULL','NULL'),(285,'poire',8,'poires','NULL','NULL'),(286,'pomme',8,'pommes','NULL','NULL'),(287,'pruneau',8,'pruneaux','NULL','NULL'),(288,'prune',8,'prunes','NULL','NULL'),(289,'raisin blanc',8,'raisins blancs','raisin secs','raisins blancs'),(290,'raisin noir',8,'raisin noirs','raisins noir','raisins noirs'),(291,'raisin sec',8,'raisins secs','raisin secs','raisins secs'),(292,'rhubarbe',8,'rhubarbes','NULL','NULL'),(293,'agneau',9,'agneaux','NULL','NULL'),(294,'andouille',9,'andouilles','NULL','NULL'),(295,'andouillette',9,'andouillettes','NULL','NULL'),(296,'bacon',9,'NULL','NULL','NULL'),(297,'boeuf',9,'boeufs','NULL','NULL'),(298,'boudin blanc',9,'boudins blanc','boudins blancs','boudin blancs'),(299,'boudin noir',9,'boudins noir','boudins noirs','boudin noirs'),(300,'caille',9,'cailles','NULL','NULL'),(301,'caillette',9,'caillettes','NULL','NULL'),(302,'canard',9,'canards','NULL','NULL'),(303,'chorizo',9,'NULL','NULL','NULL'),(304,'crépine',9,'crépines','NULL','NULL'),(305,'dinde',9,'dindes','NULL','NULL'),(306,'escargot',9,'escargots','NULL','NULL'),(307,'foie de génisse',9,'foies de génisse','foies de génisses','foie de génisses'),(308,'foie de veau',9,'foies de veau','foies de veaux','foie de veaux'),(309,'foie gras',9,'foies gras','NULL','NULL'),(310,'foie de volaille',9,'foies de volaille','foie de volailles','foies de volailles'),(311,'gésier',9,'gésiers','NULL','NULL'),(312,'jambon blanc',9,'jambons blanc','jambon blancs','jambons blancs'),(313,'jambon cru',9,'jambons cru','jambon crus','jambons crus'),(314,'jambon fumé',9,'jambons fumé','jambon fumés','jambons fumés'),(315,'lapin',9,'lapins','NULL','NULL'),(316,'lard',9,'lards','NULL','NULL'),(317,'lardon',9,'lardons','NULL','NULL'),(318,'merguez',9,'NULL','NULL','NULL'),(319,'mouton',9,'moutons','NULL','NULL'),(320,'oeuf de caille',9,'oeufs de caille','oeufs de cailles','oeufs de cailles'),(321,'os à moelle',9,'os à moelles','NULL','NULL'),(322,'petit salé',9,'petits salé','petit salés','petits salés'),(323,'pied de veau',9,'pieds de veau','pieds de veaux','pied de veaux'),(324,'pigeon',9,'pigeons','NULL','NULL'),(325,'porc',9,'porcs','NULL','NULL'),(326,'poulet',9,'poulets','NULL','NULL'),(327,'quenelle',9,'quenelles','NULL','NULL'),(328,'rognon',9,'rognons','NULL','NULL'),(329,'saucisse',9,'saucisses','NULL','NULL'),(330,'saucisson',9,'saucissons','NULL','NULL'),(331,'tripe',9,'tripes','NULL','NULL'),(332,'veau',9,'veaux','NULL','NULL'),(333,'aiglefin',10,'églefin','aiglefins','églefins'),(334,'amande de mer',10,'amandes de mer','NULL','NULL'),(335,'anchois au sel',10,'NULL','NULL','NULL'),(336,'anchois frais',10,'NULL','NULL','NULL'),(337,'anguille',10,'anguilles','NULL','NULL'),(338,'araignée de mer',10,'araignées de mer','NULL','NULL'),(339,'bar',10,'bars','NULL','NULL'),(340,'barbu',10,'barbus','barbeau','barbeaux'),(341,'bonite',10,'bonites','NULL','NULL'),(342,'brochet',10,'brochets','NULL','NULL'),(343,'cabillaud',10,'cabillauds','NULL','NULL'),(344,'calamar',10,'calmar','calamars','calmars'),(345,'carpe',10,'carpes','NULL','NULL'),(346,'colin',10,'colins','NULL','NULL'),(347,'congre',10,'congres','NULL','NULL'),(348,'coque',10,'coques','NULL','NULL'),(349,'crevette',10,'crevettes','NULL','NULL'),(350,'daurade',10,'daurades','NULL','NULL'),(351,'écrevisse',10,'écrevisses','NULL','NULL'),(352,'encornet',10,'encornets','NULL','NULL'),(353,'éperlan',10,'éperlans','NULL','NULL'),(354,'espadon',10,'espadons','NULL','NULL'),(355,'étrille',10,'étrilles','NULL','NULL'),(356,'flétan',10,'flétans','NULL','NULL'),(357,'fumet de poisson',10,'fumet de poissons','NULL','NULL'),(358,'gamba',10,'gambas','NULL','NULL'),(359,'haddock',10,'haddocks','NULL','NULL'),(360,'hareng',10,'harengs','NULL','NULL'),(361,'homard',10,'homards','NULL','NULL'),(362,'huître',10,'huîtres','NULL','NULL'),(363,'langouste',10,'langoustes','NULL','NULL'),(364,'langoustine',10,'langoustines','NULL','NULL'),(365,'lieu',10,'lieus','NULL','NULL'),(366,'limande',10,'limandes','NULL','NULL'),(367,'lotte',10,'lottes','NULL','NULL'),(368,'loup de mer',10,'loups de mer','NULL','NULL'),(369,'maquereau',10,'maquereaux','NULL','NULL'),(370,'merlan',10,'merlans','NULL','NULL'),(371,'merlu',10,'merlus','NULL','NULL'),(372,'mérou',10,'mérous','NULL','NULL'),(373,'morue',10,'morues','NULL','NULL'),(374,'moule',10,'moules','NULL','NULL'),(375,'noix de pétoncle',10,'NULL','NULL','NULL'),(376,'oeuf de lump',10,'oeufs de lump','NULL','NULL'),(377,'palourde',10,'palourdes','NULL','NULL'),(378,'panga',10,'pangas','NULL','NULL'),(379,'perche',10,'perches','NULL','NULL'),(380,'poulpe',10,'poulpes','NULL','NULL'),(381,'poutargue',10,'poutargues','NULL','NULL'),(382,'rouget',10,'rougets','NULL','NULL'),(383,'rouille',10,'NULL','NULL','NULL'),(384,'roussette',10,'roussettes','NULL','NULL'),(385,'saint-jacques',10,'saint jacques','NULL','NULL'),(386,'sandre',10,'sandres','NULL','NULL'),(387,'sardine',10,'sardines','NULL','NULL'),(388,'saumon',10,'saumons','NULL','NULL'),(389,'saumon en boîte',10,'saumons en boîte','saumons en boîtes','saumon en boîtes'),(390,'thon',10,'thons','NULL','NULL'),(391,'tourteau',10,'tourteaux','NULL','NULL'),(392,'truite',10,'truites','NULL','NULL'),(393,'beaufort',11,'NULL','NULL','NULL'),(394,'bleu d\'auvergne',11,'NULL','NULL','NULL'),(395,'brie',11,'NULL','NULL','NULL'),(396,'camembert',11,'NULL','NULL','NULL'),(397,'cantal',11,'NULL','NULL','NULL'),(398,'cheddar',11,'NULL','NULL','NULL'),(399,'chèvre',11,'NULL','NULL','NULL'),(400,'brebis',11,'NULL','NULL','NULL'),(401,'comté',11,'NULL','NULL','NULL'),(402,'crème chantilly',11,'NULL','NULL','NULL'),(403,'crème de soja',11,'NULL','NULL','NULL'),(404,'faisselle',11,'NULL','NULL','NULL'),(405,'feta',11,'NULL','NULL','NULL'),(406,'fromage blanc',11,'fromages blanc','fromage blancs','fromages blancs'),(407,'fromage frais',11,'fromages frais','NULL','NULL'),(408,'gorgonzola',11,'NULL','NULL','NULL'),(409,'gouda',11,'NULL','NULL','NULL'),(410,'lait concentré',11,'NULL','NULL','NULL'),(411,'lait de coco',11,'NULL','NULL','NULL'),(412,'lait de soja',11,'NULL','NULL','NULL'),(413,'lait fermenté',11,'NULL','NULL','NULL'),(414,'mascarpone',11,'NULL','NULL','NULL'),(415,'mimolette',11,'NULL','NULL','NULL'),(416,'mont d\'Ormorbier',11,'NULL','NULL','NULL'),(417,'mozzarella',11,'NULL','NULL','NULL'),(418,'munster',11,'NULL','NULL','NULL'),(419,'parmesan',11,'NULL','NULL','NULL'),(420,'petit suisse',11,'petits suisses','petit suisses','NULL'),(421,'raclette',11,'NULL','NULL','NULL'),(422,'reblochon',11,'NULL','NULL','NULL'),(423,'roquefort',11,'NULL','NULL','NULL'),(424,'saint-nectaire',11,'saint nectaire','NULL','NULL'),(425,'saint-marcellin',11,'saint marcellin','NULL','NULL'),(426,'pate',12,'pates','NULL','NULL'),(427,'blé',12,'NULL','NULL','NULL'),(428,'boulghour',12,'NULL','NULL','NULL'),(429,'farine d\'orge',12,'NULL','NULL','NULL'),(430,'farine de châtaignes',12,'farine de châtaigne','NULL','NULL'),(431,'farine de froment',12,'NULL','NULL','NULL'),(432,'farine de maïs',12,'NULL','NULL','NULL'),(433,'farine de noix de coco',12,'NULL','NULL','NULL'),(434,'farine de petit épeautre',12,'NULL','NULL','NULL'),(435,'farine de pois chiches',12,'farine de pois chiche','NULL','NULL'),(436,'farine de quinoa',12,'NULL','NULL','NULL'),(437,'farine de riz',12,'NULL','NULL','NULL'),(438,'farine de sarrazin',12,'farine de sarrasin','NULL','NULL'),(439,'farine de seigle',12,'NULL','NULL','NULL'),(440,'galette de riz',12,'galettes de riz','NULL','NULL'),(441,'graine de courge',12,'graines de courge','graines de courges','NULL'),(442,'graine de tournesol',12,'graines de tournesol','graines de tournesols','NULL'),(443,'lasagne',12,'lasagnes','NULL','NULL'),(444,'mil',12,'NULL','NULL','NULL'),(445,'müesli',12,'NULL','NULL','NULL'),(446,'nouille chinoise',12,'nouilles chinoises','nouille chinoises','NULL'),(447,'pâte de riz',12,'pâtes de riz','NULL','NULL'),(448,'quinoa',12,'NULL','NULL','NULL'),(449,'riz complet',12,'NULL','NULL','NULL'),(450,'sarrazin',12,'sarrasin','NULL','NULL'),(451,'semoule de blé',12,'NULL','NULL','NULL'),(452,'semoule de maïs',12,'NULL','NULL','NULL'),(453,'vermicelle de riz',12,'vermicelles de riz','NULL','NULL'),(454,'cannelle',13,'NULL','NULL','NULL'),(455,'cardamome',13,'NULL','NULL','NULL'),(456,'clou de girofle',13,'clous de girofle','NULL','NULL'),(457,'colombo',13,'NULL','NULL','NULL'),(458,'cumin',13,'NULL','NULL','NULL'),(459,'curcuma',13,'NULL','NULL','NULL'),(460,'curry',13,'NULL','NULL','NULL'),(461,'eau de fleur d\'oranger',13,'eau de fleurs d\'oranger','eau de fleurs d\'orangers','NULL'),(462,'eau de rose',13,'eau de roses','NULL','NULL'),(463,'essence d\'amande',13,'essence d\'amandes','NULL','NULL'),(464,'extrait d\'amande amère',13,'extrait d\'amandes amères','extrait d\'amande amères','extrait d\'amandes amère'),(465,'garam massala',13,'garam masala','NULL','NULL'),(466,'kari gosse',13,'NULL','NULL','NULL'),(467,'noix de muscade',13,'noix de muscades','NULL','NULL'),(468,'paprika',13,'NULL','NULL','NULL'),(469,'piment',13,'piments','NULL','NULL'),(470,'safran',13,'safrans','NULL','NULL'),(471,'vanille',13,'vanilles','NULL','NULL'),(472,'armagnac',14,'NULL','NULL','NULL'),(473,'bière',14,'bières','NULL','NULL'),(474,'calvados',14,'NULL','NULL','NULL'),(475,'champagne',14,'champagnes','NULL','NULL'),(476,'cidre',14,'cidres','NULL','NULL'),(477,'cognac',14,'cognacs','NULL','NULL'),(478,'cointreau',14,'NULL','NULL','NULL'),(479,'eau de vie',14,'NULL','NULL','NULL'),(480,'eau gazeuse',14,'eaux gazeuse','eaux gazeuses','eau gazeuses'),(481,'grand marnier',14,'NULL','NULL','NULL'),(482,'kirsch',14,'NULL','NULL','NULL'),(483,'madère',14,'NULL','NULL','NULL'),(484,'martini',14,'NULL','NULL','NULL'),(485,'muscat',14,'muscats','NULL','NULL'),(486,'pastis',14,'NULL','NULL','NULL'),(487,'porto',14,'portos','NULL','NULL'),(488,'rhum',14,'rhums','NULL','NULL'),(489,'saké',14,'sakés','NULL','NULL'),(490,'vin blanc',14,'vins blanc','vin blancs','vins blancs'),(491,'vin rouge',14,'vins rouge','vin rouges','vins rouges'),(492,'vodka',14,'vodkas','NULL','NULL'),(493,'whisky',14,'whiskey','whiskys','NULL'),(494,'graisse de canard',15,'graisses de canard','graisses de canards','graisse de canards'),(495,'huile d\'arachide',15,'huiles d\'arachide','huile d\'arachides','huiles d\'arachides'),(496,'huile de noix',15,'huiles de noix','NULL','NULL'),(497,'huile de palme',15,'huiles de palme','NULL','NULL'),(498,'huile de pépins de raisin',15,'huile de pépin de raisin','huile de pépins de raisins','huile de pépin de raisins'),(499,'huile de sésame',15,'huiles de sésame','NULL','NULL'),(500,'saindoux',15,'NULL','NULL','NULL');
/*!40000 ALTER TABLE `Ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recette`
--

DROP TABLE IF EXISTS `Recette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recette` (
  `idRecette` int(11) NOT NULL,
  `LibelleR` varchar(50) NOT NULL,
  PRIMARY KEY (`idRecette`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recette`
--

LOCK TABLES `Recette` WRITE;
/*!40000 ALTER TABLE `Recette` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recette` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recettes`
--

LOCK TABLES `Recettes` WRITE;
/*!40000 ALTER TABLE `Recettes` DISABLE KEYS */;
INSERT INTO `Recettes` VALUES (1,'Salade d\'automne','\nBon comme elle avait une belle gueule, j\'ai décidé de mettre cette recette sur le site, ça mange pas de pain. Quoique un pain aux noix, c\'est pas mal en accompagnement :)\n\nHé bé... On met les oeufs à cuire 10 min (ça donnera genre oeufs mollets-durs), on les écaille sous l\'eau froide, on attend qu\'ils refroidissent, on les coupe en 4 et on mélange le tout !\n\nOn accompagne tout ça d\'une vinaigrette et paf, la salade d\'automne.\n'),(2,'Salade de pates multicolore','\n- 1) Dans une grande casserole, faites cuire dans un grand volume d\'eau salée les pâtes tricolores en les gardant bien fermes. Egouttez-les et placez la passoire sous le robinet d\'eau fraîche. Brassez les pâtes sous l\'eau jusqu\'à elles aient bien refroidi (cette opération stoppe leur cuisson, les garde fermes, et les empêche de coller en les débarrassant de l\'amidon de blé dissous dans l\'eau de cuisson). Egouttez à nouveau.\nVersez les pâtes dans un saladier et arrosez-les d\'un filet d\'huile d\'olive. Mélangez délicatement et réservez.\n- 2) Lavez les poivrons. Epépinez-les et coupez-les en dés. Epluchez le concombre, épépinez-le et coupez-le en cubes. Egouttez le maïs. A joutez ces légumes aux pâtes dans le saladier.\n- 3) Dégraissez le ou les fonds de jambon. Coupez en cubes et mettez-les dans le saladier.\n- 4) Préparez la sauce. Pelez, dégermez et hachez finement la gousse d\'ail. Mélangez au fouet dans un bol 10 c. à s. D\'huile d\'olive, 1 c. à s. De moutarde, 2 c. à s. De vinaigre, ide'),(3,'Les pates a la carbonara',' \nMettre à bouillir l\'eau des pâtes. Une fois les pâtes jetées dans l\'eau, faites chauffer une petite poêle avec un peu d\'huile d\'olive puis lorsqu\'elle frémit mettez-y le lard (coupé en lardons) à frire 2-3 minutes (oui, certains (certaines ?) crieront au scandale, comme si les lardons n\'étaient pas assez gras comme ça ! - ben oui c\'est bien meilleur comme ça !).\nCasser l\'oeuf et séparer le blanc du jaune pour ne garder que ce dernier.\n\nLorsque les pâtes sont cuites, ajouter les lardons, le jaune d\'oeuf et poivrez légèrement.\nAllez, je vous l\'autorise, vous pouvez mettre une cuiller à soupe de crème fraîche épaisse si vous en avez. Et un peu d\'huile d\'olive (rôôo ça va... ). Et quelques copeaux de parmesan. Et régalez-vous.\n'),(4,'Linguine au roquefort','\nPortez à ébullition une grande casserole d\'eau salée. Lorsque l\'eau bout, jetez les pâtes dedans et pendant qu\'elles cuisent faites chauffer à feu moyen une petite casserole avec la crème fraîche et le roquefort. Remuez régulièrement jusqu\'à obtenir une crème homogène.\n\nEgouttez les pâtes et disposez la sauce dessus, ajoutez un peu de parmesan ou de fromage râpé si vous en avez. Bon appétit !\n'),(5,'Mijote d\'agneau aux feves','\n1. Si votre boucher ne l\'a pas fait, découpez la viande en 8 morceaux de taille égale. Faites-les dorer quelques minutes dans votre plat à tajine ou cocotte avec quelques cuillères à soupe d\'huile d\'olive, le cumin et le piment ; arrosez le tout d\'eau, ajoutez quelques brins de coriandre fraîche, les gousses d\'ail non pelées, le concentré de tomate puis salez : c\'est parti pour 2 h minimum de cuisson ! Notez que la viande devra être toujours recouverte de liquide pendant au moins la première heure de cuisson.\n\n2. Préparation des fèves : c\'est l\'étape la plus fastidieuse... écossez les fèves en vous débrouillant pour enlever le germe en même temps ; pratiquez une incision en croix à l\'emplacement du germe de chaque fève. Portez à ébullition une casserole d\'eau (si vous avez, ajoutez une cuillère à café de bicarbonate de soude), lorsque l\'eau bout plongez les fèves 3-4 minutes dedans ; sortez les fèves à l\'aide d\'une écumoire (laissez la casserole d\'eau sur le feu) puis trempez-les dans'),(6,'Pekinoise et nems de poisson marine','\nOn commence par éplucher la carotte et la mangue pas trop mûre.\n\nTailler en fines fines lamelles avec une fine lame. Réserver.\n\nLà, il faut préparer la marinade pour le poisson.\n\nAlors, il faut prélever le jus des citrons et le zeste.\n\nVerser dans le bol la sauce soja, le vinaigre de riz, le piment, le gingembre râpé, l\'ail coupé fin, le poivre.\n\nIl s\'agit de bien réaliser le pliage des nems, pour rendre les galettes de riz utilisables (il en faut deux pour chaque rouleau ) il faut les tremper quelques minutes dans l\'eau chaude, elles vont devenir souples et un rien gluantes sous vos doigts,\n\nc\'est le moment de les étaler sur un papier absorbant mouillé, c\'est important si vous ne voulez pas vous retrouver avec un \"truc\" collant et impossible à manipuler !\n\nVoilà, vos deux galettes de riz sont superposées et étalées devant vous, vous allez déposer au centre un morceau poisson mariné quelques carottes en lamelles et quelques tiges d\'oignons nouveaux.\n\nReplier les bords de la galette su'),(7,'Poulet aux trois poivrons','\n1. Découpez le poulet et les poivrons en morceaux de taille égale (n\'oubliez pas d\'enlever le coeur des poivrons). Emincez l\'ail et le gingembre et coupez l\'oignon en lamelles.\n\n2. Dans une poêle bien chaude et bien huilée (on n\'est pas des pros du wok non plus, et puis l\'huile d\'olive c\'est tellement bon hein), faites sauter tout ça (n\'oubliez pas le sel) une dizaine de minutes à feu vif (faites bien sauter ou remuez bien en permanence pour ne pas que ça crame).\n\n3. Sortez du feu, reste plus qu\'à ajouter le basilic ou la coriandre hachée au moment de servir, et bonne dégustation !\n    un reste de poulet rôti (le blanc surtout) ou deux escalopes\n'),(8,'Tajine de printemps','\nDans un plat à tajine ou un faitout, faire revenir quelques minutes dans un peu d\'huile d\'olive les morceaux d\'agneau à feu moyen (pensez à intercaler un diffuseur de chaleur sous le plat à tajine pour préserver la terre cuite) puis ajouter les tomates, le piment, les navets épluchés et les gousses d\'ail avec leur peau. Recouvrir d\'eau (la viande ne doit pas être à l\'air libre) puis laisser mijoter une bonne heure, toujours à feu moyen.\nAjouter ensuite les carottes puis, une demi-heure plus tard, les pommes de terre et les petits pois et laisser mijoter encore une demi-heure jusqu\'à cuisson complète de ces derniers.\n\nC\'est prêt mais n\'oubliez pas, un plat mijoté est toujours meilleur après refroidissement complet puis réchauffage !\n'),(9,'Tarte Tomate et Thon','\n1. Préchauffez votre four à 190° (th 6-7), déroulez la pâte, disposez-la dans un plat allant au four et piquez-en le fond avec une fourchette.\n\n2. Précuisez la pâte une quinzaine de minutes.\n\n3. Pendant ce temps, préparez la garniture :\n- Mixez la tomate, les épices et les 2 cuillères d\'huile d\'olive\n- Ajoutez au thon émietté\n- Mélangez bien et réservez\n\n4. Sortez la pâte du four et étalez le fromage frais.\nVersez par-dessus la garniture thon-tomate et saupoudrez d\'emmental râpé.\n\n5. Cuire 20 minutes au four\n\n6. Servez accompagné d\'une salade verte\n'),(10,'Douceur de pamplemousse au citron vert','\nEn place pour commencer ?!!\n\nIl fait chaud, il me faut une salade !! Mais pas quelque chose de trop classique !! J\'ai besoin d\'exotisme moi !!\n\nRetirer à l\'aide d\'un grand couteau les suprêmes des pamplemousses, éplucher un concombre et le tailler en cubes.\nVerser le lait de coco (il est là l\'exotisme...! !), ajouter le jus de citron vert (là aussi...!), le cumin en poudre (ha le cumin... Utilisé au moins depuis l\'Egypte ancienne puis à Rome et ensuite au Moyen âge, ramené des croisades... Si c\'est pas de l\'exotisme ça !!) le sel et le poivre.\nPlacer cette petite salade au frais, puis la dresser dans des coupes.\n\nVoilà, c\'est fini. Bonne dégustation !!\n'),(11,'Salade de thon ','\nCoupez l\'avocat et les tomates en cubes, émincez l\'oignon, émiettez le thon et la feta.\nMettez le tout dans un saladier ou dans deux assiettes. Ajoutez les olives et/ou tout autre ingrédient du genre (tomates séchées, câpres... ). Ajoutez un filet d\'huile d\'olive, 2 cuillères à soupe de vinaigre balsamique, salez, poivrez, mélangez. C\'est prêt.\n'),(12,'Salade de pois chiches et carottes au cumin','\nles pois chiches : si vous avez des pois chiches en boite un peu dur vous pouvez les refaire cuire 10 minutes dans leur jus pour les attendrir avant de commencer la recette.\nRincez-les biens à l\'eau courante et si vous êtes patient enlevez les peaux (on me dit toujours que ça ne change rien mais bon je n\'y peux rien ces peaux m\'énervent alors je ne peux pas ne pas les enlever !)\nRéservez dans un saladier\nLes carottes : épluchez et râpez-les (si possible pas trop fin afin de garder un coté croquant)\nMélangez les au pois chiches et ajoutez-y l\'huile d\'olive, le jus de citron, le cumin (en poudre et en graines ), salez et poivrez. Mélangez bien.\nEpluchez et émincez l\'oignon et ajoutez-le à la salade. Mélangez bien.\nAjoutez un peu de piment si vous aimez ça et rectifiez l\'assaisonnement si nécessaire.\nLaissez reposer au frais afin que tous les aromes se mélangent.\n\nSortez la salade en avance du frigo afin qu\'elle ne soit pas glaciale et parsemez de persil haché au moment de servir\nBon apé'),(13,'Salade exotique','\nUne recette très classique de ma grand-mère qui n\'en est pas moins exotique !\nAlors bon ben c\'est tout simple hein :\n\n1. Coupez les avocats en deux, enlevez le noyau et séparez la chair de la peau, puis coupez la chair en dés plus ou moins gros.\n\n2. Décortiquez les crevettes, enlevez absolument tout pour ne garder que la chair !\n\n3. Pelez le pamplemousse, enlevez bien la peau blanche également et détaillez les quartiers en morceaux.\n\n4. Préparez une vinaigrette classique dans laquelle vous remplacerez le vinaigre par du citron ou du jus de pamplemousse ou du vinaigre de framboise, vous pouvez ajouter aussi un peu de curry, ce qui vous chante quoi c\'est exotique on improvise on improvise !\n\nIl n\'y a plus qu\'à mélanger le tout, mais ça vous l\'aurez bien compris...\n'),(14,'Recette de chou rouge ','\nça y est !! La première recette de chou rouge est sur Lebruitdufrigo !!\n\nJ\'ai bien cru qu\'on n\'y arriverait jamais.\n\nNous commençons donc avec une très bonne salade, les clémentines ou oranges se mariant très bien avec ce légume capricieux grâce à leur saveur sucrée. La texture est également importante dans cette salade, surtout si vous associez un peu de graines ou de fruits à coques pour contraster avec le sévère croquant du chou rouge. C\'est surprenant et un régal pour les papilles !\n\nDonc bon ben on mélange le tout hein après avoir épluché les agrumes, une petite vinaigrette pif paf c\'est dans la boîte.\n\nBonne dégustation !\n'),(15,'Entree mediterraneenne','\nComme il me restait quelques fèves du tajine d\'agneau, je me suis dit qu\'une bonne petite salade de fèves serait parfaite pour ne pas les perdre. Vous allez voir, c\'est délicieux !\n\n1. Préparation des fèves : c\'est l\'étape la plus fastidieuse... écossez les fèves en vous débrouillant pour enlever le germe en même temps ; pratiquez une incision en croix à l\'emplacement du germe de chaque fève. Portez à ébullition une casserole d\'eau (si vous avez, ajoutez une cuillère à café de bicarbonate de soude), lorsque l\'eau bout plongez les fèves 10 minutes dedans ; sortez les fèves à l\'aide d\'une écumoire (laissez la casserole d\'eau sur le feu) puis trempez-les dans l\'eau froide. Lorsqu\'elles sont refroidies, vous pouvez commencer à les dérober une par une pour enlever leur peau. C\'est long mais indispensable !\nMettez ensuite les fèves au frais.\n\n2. Une fois les fèves dérobées et refroidies, préparez la vinaigrette en mélangeant l\'huile d\'olive, le sel, le citron et le cumin. Incorporez aux fèv'),(16,'Salade tomates feta croutons','\nDécouper la tomate et le fromage en gros dés\nDans l\'assiette, disposer la salade mâche, les tomates, les dés de fromages, des croûtons (à l\'ail de préférence c\'est meilleur)\nAssaisonner avec un filet d\'huile d\'olive et du vinaigre balsamique\nC\'est prêt !\n\nVous pouvez rajouter des lardons et/ou du maïs suivant les envies\n'),(17,'Pas trop chou','\nCa paraît pas comme ça, mais c\'est délicieux ! Surtout avec du gomasio et de la levure de bière, qui ont un goût et une texture parfaits pour accompagner.\n\nSuffit juste de peler et râper les betteraves, de ciseler le chou, et pi voilà quoi.\n');
/*!40000 ALTER TABLE `Recettes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Saison`
--

DROP TABLE IF EXISTS `Saison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Saison` (
  `IdSaison` int(11) NOT NULL,
  `LibelleS` varchar(50) NOT NULL,
  `DateDebut` date NOT NULL,
  `DateFin` date NOT NULL,
  PRIMARY KEY (`IdSaison`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Saison`
--

LOCK TABLES `Saison` WRITE;
/*!40000 ALTER TABLE `Saison` DISABLE KEYS */;
/*!40000 ALTER TABLE `Saison` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  CONSTRAINT `appartenir_Ingredient_FK` FOREIGN KEY (`idIngr`) REFERENCES `Ingredients` (`idIngr`),
  CONSTRAINT `appartenir_FamilleIngredient0_FK` FOREIGN KEY (`idFamille`) REFERENCES `FamillesIngredients` (`idFamille`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  CONSTRAINT `composer_Recette_FK` FOREIGN KEY (`idRecette`) REFERENCES `Recettes` (`idRecette`),
  CONSTRAINT `composer_Ingredient0_FK` FOREIGN KEY (`idIngr`) REFERENCES `Ingredients` (`idIngr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composer`
--

LOCK TABLES `composer` WRITE;
/*!40000 ALTER TABLE `composer` DISABLE KEYS */;
INSERT INTO `composer` VALUES (1,147,0,'2'),(1,164,0,'1'),(1,218,0,'1'),(2,11,0,'2cs'),(2,14,0,'1cs'),(2,24,0,'2cs'),(2,136,0,'1gousse'),(2,143,0,'10cs'),(2,151,0,'NULL'),(2,154,0,'NULL'),(2,178,0,'1/2'),(2,210,0,'1'),(2,211,0,'1'),(2,426,0,'250g'),(3,147,0,'1'),(3,151,0,'NULL'),(3,316,0,'1tranche'),(3,426,0,'125g'),(4,140,0,'10cl'),(4,423,0,'20g'),(4,426,0,'125g'),(5,3,0,'2cs'),(5,72,0,'1bouquet'),(5,136,0,'8gousses'),(5,143,0,'NULL'),(5,154,0,'NULL'),(5,183,0,'400g'),(5,185,0,'3kg'),(5,204,0,'1cc'),(5,293,0,'800g'),(5,458,0,'1cs'),(6,8,0,'1cm'),(6,16,0,'2cc'),(6,31,0,'2cs'),(6,134,0,'1pincée'),(6,136,0,'1gousse'),(6,143,0,'3cs'),(6,148,0,'2'),(6,151,0,'NULL'),(6,167,0,'1'),(6,204,0,'1/2cc'),(6,250,0,'2'),(6,265,0,'1'),(7,136,0,'1gousse'),(7,143,0,'NULL'),(7,148,0,'1'),(7,154,0,'NULL'),(7,210,0,'1'),(7,211,0,'1'),(7,212,0,'1'),(8,21,0,'4'),(8,41,0,'8'),(8,136,0,'1tete'),(8,143,0,'NULL'),(8,154,0,'NULL'),(8,167,0,'8'),(8,196,0,'8'),(8,203,0,'500g'),(8,204,0,'1pincée'),(8,293,0,'800g'),(9,21,0,'2'),(9,142,0,'70g'),(9,149,0,'1'),(9,151,0,'NULL'),(9,154,0,'NULL'),(9,390,0,'1boite'),(9,407,0,'150g'),(10,70,0,'1bouquet'),(10,151,0,'NULL'),(10,154,0,'NULL'),(10,178,0,'1'),(10,250,0,'1'),(10,279,0,'2'),(10,411,0,'25cl'),(10,458,0,'1cc'),(11,21,0,'2'),(11,25,0,'NULL'),(11,143,0,'NULL'),(11,148,0,'1/2'),(11,151,0,'NULL'),(11,154,0,'NULL'),(11,163,0,'1'),(11,197,0,'1poignée'),(11,390,0,'1boîte'),(11,405,0,'1morceau'),(12,143,0,'5cs'),(12,148,0,'1'),(12,151,0,'NULL'),(12,154,0,'NULL'),(12,167,0,'4'),(12,208,0,'1bocal'),(12,249,0,'2cs'),(12,458,0,'2-3cs'),(13,163,0,'2'),(13,279,0,'1gros'),(13,349,0,'1poignée'),(14,26,0,'NULL'),(14,173,0,'1'),(14,251,0,'Quelques'),(15,72,0,'NULL'),(15,143,0,'2-3cs'),(15,151,0,'NULL'),(15,154,0,'NULL'),(15,185,0,'2kg'),(15,249,0,'1'),(15,458,0,'NULL'),(16,21,0,'1'),(16,25,0,'NULL'),(16,143,0,'NULL'),(16,194,0,'2poignées'),(16,405,0,'NULL'),(17,164,0,'2'),(17,170,0,'1/8');
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
  CONSTRAINT `consommer_Saison_FK` FOREIGN KEY (`IdSaison`) REFERENCES `Saisons` (`IdSaison`),
  CONSTRAINT `consommer_Ingredient0_FK` FOREIGN KEY (`idIngr`) REFERENCES `Ingredients` (`idIngr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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

-- Dump completed on 2018-11-14 12:09:06
