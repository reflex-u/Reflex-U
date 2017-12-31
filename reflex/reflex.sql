-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: reflex
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `booking`
--

create database if not exists reflex;
use reflex;

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(45) NOT NULL,
  `startTime` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phoneNo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `centerId` varchar(10) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `centerId_idx` (`centerId`),
  CONSTRAINT `centerId` FOREIGN KEY (`centerId`) REFERENCES `center` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center`
--

DROP TABLE IF EXISTS `center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center` (
  `id` varchar(10) NOT NULL,
  `city` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `contactNo` varchar(11) NOT NULL,
  `rate` int(1) DEFAULT NULL,
  `therapist` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `therapist_idx` (`therapist`),
  CONSTRAINT `therapist` FOREIGN KEY (`therapist`) REFERENCES `therapist` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center`
--

LOCK TABLES `center` WRITE;
/*!40000 ALTER TABLE `center` DISABLE KEYS */;
INSERT INTO `center` VALUES ('c1','Skudai','D\'alam Therapy','No 5A, jalan Enau 9, Taman Teratai, 81300 Skudai, Johor.','0108891730',3,'yanti@gmail.com');
/*!40000 ALTER TABLE `center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--
create database if not exists reflex;
use reflex;

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `forumId` varchar(50) NOT NULL,
  `conversationId` varchar(45) NOT NULL,
  `conversationContent` varchar(500) DEFAULT NULL,
  `conversationDate` datetime DEFAULT NULL,
  `sender` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`conversationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES ('1','1','saya selalu sakit kepala','2017-11-26 15:25:51','amy'),('1','2','ada apa apa cara ke utk saya hilangkan ? saya taksuka panadol','2017-11-26 15:30:00','amy'),('1','3','jangan selalu terdedah pada matahari','2017-12-01 16:00:00','ainnn'),('1','4','awak boleh cuba perah kasturi atas kepala dan picit dibahagian kepala yang sakit','2017-12-30 13:45:25','Yanti'),('1','5','it\'s workkk ! terima kasih','2017-12-30 14:06:54','amy'),('1','6','sama sama !','2017-12-31 14:59:47','Yanti');
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forumdetails`
--

DROP TABLE IF EXISTS `forumdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forumdetails` (
  `forumId` int(11) NOT NULL,
  `forumTitle` varchar(45) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `startUser` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`forumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forumdetails`
--

LOCK TABLES `forumdetails` WRITE;
/*!40000 ALTER TABLE `forumdetails` DISABLE KEYS */;
INSERT INTO `forumdetails` VALUES (1,'migrain','2017-11-26 15:25:51','amy'),(2,'cramp','2017-11-30 20:25:00','mae'),(3,'backpain','2017-12-01 01:00:50','amy');
/*!40000 ALTER TABLE `forumdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `telno` varchar(50) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('ain@gmail.com','9596','Ain Balqis','0197626236'),('ainnn@gmail.com','000','ainnn','147898635');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `therapist`
--

DROP TABLE IF EXISTS `therapist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `therapist` (
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `therapistID` varchar(45) NOT NULL,
  `telno` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `therapist`
--

LOCK TABLES `therapist` WRITE;
/*!40000 ALTER TABLE `therapist` DISABLE KEYS */;
INSERT INTO `therapist` VALUES ('yanti@gmail.com','123','Yanti','A4578','01128989869','No. 5A, Jalan Enau 9, Taman Teratai, 81300 Skudai, Johor');
/*!40000 ALTER TABLE `therapist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorialear`
--

DROP TABLE IF EXISTS `tutorialear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorialear` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `steps` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorialear`
--

LOCK TABLES `tutorialear` WRITE;
/*!40000 ALTER TABLE `tutorialear` DISABLE KEYS */;
INSERT INTO `tutorialear` VALUES (1,'BackPain','This pressure point is located at the top of your ear, at the tip. This point is closely associated with your back and shoulders and can help with soreness of these areas. ','You can massage it for as little as a few minutes a day to half an hour depending on your schedule, but it should help relieve some of the pain from the areas.'),(2,'Digestion','For minor digestive issues, try massaging the point just above your earlobe. ','This point can help with minor discomfort, bloating, or gas. Just massage it gently for a few minutes when you start to feel the discomfort and you should start to feel better within a few minutes.'),(3,'HeadHeart','The spot that is most closely associated to the two major parts of your body is the earlobe. By massaging this area on the ear you can promote good heart health and deal with tension in your head.','Massaging this point is great for dealing with pressure headaches, and it only takes a few minutes a day.'),(4,'Joints','This pain may come from the change in season or arthritis but this point should go a long way in relieving some discomfort without relying on medications. ','This next point is located in the upper-middle part of the ear and is used to relieve joint pain and discomfort. Just apply pressure for a few minutes a day to relieve your joints.'),(5,'Organ','If you are having severe internal pain you should absolutely consult a physician, but for minor discomfort there is a point in the ear that can be helpful. ','It is located just below the first point, where the bridge of the ear meets the outside of the ear. Massaging this point a few minutes a day can ease your internal discomfort.'),(6,'Sinus','When youâ€™re suffering from a cold or sinus infection, this next point can help by relieving pressure in these areas. ','This point is located on the lower-middle part of the ear. By applying pressure with your fingers, you can relieve some of the pressure in your sinuses allowing you to breathe clearer and sleep easier.');
/*!40000 ALTER TABLE `tutorialear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorialfoot`
--

DROP TABLE IF EXISTS `tutorialfoot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorialfoot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `steps` varchar(1000) NOT NULL,
  `video` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorialfoot`
--

LOCK TABLES `tutorialfoot` WRITE;
/*!40000 ALTER TABLE `tutorialfoot` DISABLE KEYS */;
INSERT INTO `tutorialfoot` VALUES (1,'Anxiety','According to traditional Chinese medical theory, emotional stress and anxiety particularly involves the kidneys, heart, liver and spleen. Massaging these points on your feet is therefore recommended. ','1. Sit on a firm but comfortable chair, or on the edge of your bed.<br>2. Lift one foot and rest it on the knee of the other leg so that you can see the bottom of your foot.<br> 3. If you divide the length of your sole, between the base of your toes and your heel, into thirds,  the point is found at the junction of the first and middle thirds. <br>4. Use the tip of your thumb to press the point deeply for 1-2 minutes. If your thumb gets sore,  rest it for a moment then continue. <br>5. Press hard enough to cause a comfortable pain. <br>6. Repeat on the other foot, using the other thumb.<br>','https://www.youtube.com/embed/8xfuD6z7xos'),(2,'BackPain','You can treat lower back pain by applying pressure to the reflexes on the soles of your feet, the entire area around your heel and around your ankle, as well as the inner edge of each foot. You can treat upper back pain by applying reflexology to the reflex points for your shoulders and upper back,  which are represented on the soles and tops of your feet just beneath the base of your toes.','The spine reflex points follow the line of the inside edge of your foot.<br> 1. Support your right foot with your left hand.<br> 2. Use your right thumb to work all of the spine reflexes that are located along the inside edge of your foot. (from the tip of your big toe all the way to your ankle.)<br>3. Starting at your toe, press your thumb firmly into the skin and move slowly along the whole length of your foot.<br>4. Repeat on the other foot.<br>','https://www.youtube.com/embed/D4tLb2i0wEY'),(3,'BeforeSleep','A simple reflexology routine that works on just the feet can help you to drift off to sleep naturally.  There are nearly 15,000 nerves in your feet alone, one of many reasons that foot reflexology is so calming,  soothing and effective.','1. Relax the feet, one at a time.<br> 2. With simple relaxation techniques: pressing and squeezing, lightly slapping or gently kneading. <br> 3. Finish by pressing and holding your thumb on the solar plexus point of each foot for 5-10 seconds each.<br> 4. On the bottom of each foot, \"walk\" your thumb up from the base of the heel to each toe. <br> 5. Press these reflex points with the outer edge of your thumb or tip of your forefinger. <br> 6. End with \"breeze strokes\" - lightly running your fingertips down the tops, bottoms and sides of each foot. <br>','https://www.youtube.com/embed/v40PWlIg7BI'),(4,'Constipation','Reflexology for Constipation relief tips can real life savers, sometimes constipation is unexpected and can be extremely painful if not very uncomfortable at the least. The following techniques are for mild and unexpected constipation.','1. Use the Thumb Walking technique.<br>2. Thumb walk criss-crossed one way and then the other way across the whole small intestine area.<br> 3. Thumb walk the large intestine area .<br>4. Begin with right foot, thumb walk vertically up to the point where the large intestine bends ninety degrees.<br> 5. Thumb walk across the foot horizontally following the large intestine all the way to the middle of the right foot.<br>6. Repeat step 3 to 5 for 1-2 minutes. <br>  7. Thumb walk large intestine area on left foot, walk horizontally across large intestine area. <br>8. At edge of foot thumb walk vertically downwards then back across. <br> 9. Repeat step 7 and 8 for 1-2 minutes. <br> 10. Continue on the left foot.<br>','https://www.youtube.com/embed/G6xl4X6lfxs'),(5,'Headache','The area of the head is represented on the foot by the big toe; the other toes also represent the head and the sinuses and teeth as well. ','Headache at the Temples<br>The point on your foot that represents the temple area is located just inside the big toe. Simply applying pressure and releasing several times can ease the pain of a temple-centered headache. The left foot is used for the left side of the head, right foot for the right side.<br><br>Sinus Headaches<br>The second joint down on each toe, front and back, represents your face and sinuses. To help relieve a sinus headache, firmly massage this small area of the foot to ease pressure. A squeeze and release technique is generally used. For this type of headache, it is best to work both feet. <br><br>Headaches in the Center, Front or Back of the Head<br>The outside base of each big toe is associated with the brain, while the top of each toe, front and back, is the point of contact for a generalized headache.  For the brain area, rubbing the area firmly is suggested.  The head area is manipulated by pinching each of the toes on both feet.','https://www.youtube.com/embed/k4Ro6vOke8E'),(6,'MenstrualCramp','Reflexology treatment for Pre-Menstrual Syndrome (PMS) must include this point. It is located in the arch of the inside of the foot, a thumb width from the ball of the foot.Â  Stimulation of this point by pressing it with the fingers helps in relieving abdominal cramps.','1. Located four finger widths above your inner ankle bone, just behind the shinbone, it helps relax the cervix, according to Chinese medicine. (If you feel pain when you press down, you\'re on the wrong spot.)<br> 2. Take your thumb and press on the point for six seconds, then release it for two seconds.Keep this up for five minutes.<br>3. Switch to the other leg and repeat.<br>','https://www.youtube.com/embed/xvxBwqhwXzY');
/*!40000 ALTER TABLE `tutorialfoot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorialhand`
--

DROP TABLE IF EXISTS `tutorialhand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorialhand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(500) NOT NULL,
  `steps` varchar(1000) NOT NULL,
  `video` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorialhand`
--

LOCK TABLES `tutorialhand` WRITE;
/*!40000 ALTER TABLE `tutorialhand` DISABLE KEYS */;
INSERT INTO `tutorialhand` VALUES (1,'Anxiety','Reflexology is a great way of relaxing and learning to manage your stress levels and anxiety symptoms. You can also use hand reflexology in between sessions in order to manage your response to your anxiety symptoms yourself.','1. Grip your left index finger with your right hand and squeeze gently. <br>2. Hold until you can feel your heart beat then release it.<br>3. Move to the middle finger and again squeeze gently until you can feel your pulse.<br>4. Continue with the ring and little fingers and then move to your right hand.','https://www.youtube.com/embed/Glk8MAVP1sE'),(2,'BackPain','If you\'re suffering from back ache or menstrual cramps, hand reflexology provides a quick self-help treatment that can be carried out at your desk, in your car or at home.','For your neck and spine<br>1 .\'Creep\' forward along the spinal reflex - the point which runs from the middle of your wrist to the top of your thumb.<br> 2. Creep up and down this area twice, working around the base of the thumb to contact the neck.<br><br>To soothe your shoulder<br>1. \'Creep\' along your little finger from the bottom to the top - this should help relieve your shoulder.','https://www.youtube.com/embed/Oy72LfXbbWg'),(3,'BeforeSleep','In most cases, people face difficulty to fall asleep or stay asleep due to disturbed sleep.Acupressure and reflexology are an effective alternative in this case and the potent acupressure points for sleep can improve the quality of sleep.','1. Press the highlighted point for 3-5 seconds using your thumb or finger kunckle of the other hand.<br>2. Repeat on the other thumb.','https://www.youtube.com/embed/nCjwaIeUd98'),(4,'Constipation','This is a temporary hand reflexology solution for a fussy stomach and constipation problems. Do these steps two or three times a week until you find relief from your stomach and constipation problems.','Joining the Valley (LI4)<br>1. Stimulate this point by squeezing the fleshy tissue using your fingertips for about 1 minute while taking deep breaths.<br>2.  Repeat the same on your other hand.','https://www.youtube.com/embed/1eZzNw4nNE4'),(5,'Headache','Applying pressure in these specific regions of the body helps in clearing the blocked meridians so that energy may flow freely throughout the body releasing endorphins, the natural pain killer that our body produces.','1. Apply pressure and massage the top of each finger, including the nail bed of each finger, and thumb.<br>2. Repeat this on both hands for several minutes or for as long as is comfortable.<br>3. For someone suffering with blocked or painful sinus, continue the massage the length of all the ','https://www.youtube.com/embed/4BfS1V7-0vc'),(6,'MenstrualCramp','If you\'re feeling under the weather from menstrual pain, hand reflexology can help relieve cramping, back pain and general tiredness from period pain. ','For your womb<br>1. The uterus or womb reflex lies on the outside of your wrist right at the top, just below your thumb.<br>2. Because this area is quite delicate, press this \'reflex\' and hold for five to eight seconds. <br><br>For your ovary<br>1. Use the same finger to work the ovary \'reflex\'.<br>2. This point is found in front of your wrist bone, below your little finger.<br>3. Hold for five to eight seconds.<br><br>For your fallopian tubes<br>1. Creep all four fingers along your fallopian tube reflex - which wraps around the top of your wrist.','https://www.youtube.com/embed/R6r6UB6eKmc');
/*!40000 ALTER TABLE `tutorialhand` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-01  1:54:26
