-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 103.90.228.60    Database: tmdt
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `anhsanpham`
--

DROP TABLE IF EXISTS `anhsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anhsanpham` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Anh` varchar(200) DEFAULT NULL,
  `SanPhamId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anhsanpham`
--

LOCK TABLES `anhsanpham` WRITE;
/*!40000 ALTER TABLE `anhsanpham` DISABLE KEYS */;
/*!40000 ALTER TABLE `anhsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitiethoadon`
--

DROP TABLE IF EXISTS `chitiethoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitiethoadon` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `HoaDonId` int DEFAULT NULL,
  `SanPhamId` int DEFAULT NULL,
  `SoLuong` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiethoadon`
--

LOCK TABLES `chitiethoadon` WRITE;
/*!40000 ALTER TABLE `chitiethoadon` DISABLE KEYS */;
/*!40000 ALTER TABLE `chitiethoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chucnang`
--

DROP TABLE IF EXISTS `chucnang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chucnang` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TenChucNang` varchar(50) DEFAULT NULL,
  `TenForm` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chucnang`
--

LOCK TABLES `chucnang` WRITE;
/*!40000 ALTER TABLE `chucnang` DISABLE KEYS */;
/*!40000 ALTER TABLE `chucnang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhmuc`
--

DROP TABLE IF EXISTS `danhmuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhmuc` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TenDanhMuc` varchar(100) DEFAULT NULL,
  `DanhMucCha` int DEFAULT NULL,
  `MoTa` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhmuc`
--

LOCK TABLES `danhmuc` WRITE;
/*!40000 ALTER TABLE `danhmuc` DISABLE KEYS */;
INSERT INTO `danhmuc` VALUES (1,'Điện Thoại - Máy Tính Bảng',0,NULL),(2,'Điện thoại Smartphone',1,NULL),(3,'Điện thoại phổ thông',1,NULL),(4,'Điện thoại bàn',1,NULL),(5,'Máy tính bảng',1,NULL),(6,'Máy đọc sách',1,NULL),(7,'Điện tử - Điện Lạnh',0,NULL),(8,'Âm thanh và phụ kiện Tivi',7,NULL),(9,'Tủ lạnh',7,NULL),(10,'Máy giặt',7,NULL),(11,'Máy lạnh - Máy điều hòa',7,NULL),(12,'Tủ đông - Tủ mát',7,NULL),(13,'Tivi',7,NULL),(14,'Máy nước nóng',7,NULL),(15,'Phụ kiện điện lạnh',7,NULL),(16,'Máy rửa chén',7,NULL),(17,'Máy sấy quần áo',7,NULL),(18,'Tủ ướp rượu',7,NULL),(19,'Loa',8,NULL),(20,'Loa Karaoke ',19,NULL),(21,'Loa thanh, Soundbar',19,NULL),(22,'Loa thùng, loa vệ tinh',19,NULL),(23,'Loa Sub, siêu trầm',19,NULL),(24,'Loa Bookshelf',19,NULL),(25,'Loa sân khấu, ngoài trời',19,NULL),(26,'Loa âm trần - âm tường',19,NULL),(27,'Phụ kiện Tivi',8,NULL),(28,'Điều khiển từ xa Tivi',27,NULL),(29,'Giá treo Tivi',27,NULL),(30,'Cáp Tivi',27,NULL),(31,'Anten Tivi',27,NULL),(32,'Đầu thu kỹ thuật số',27,NULL),(33,'Bộ vệ sinh, bảo vệ Tivi',27,NULL),(34,'Kính 3D',27,NULL),(35,'Receivers, Amplifier, Mixer',8,NULL),(36,'Micro Karaoke - sân khấu',8,NULL),(37,'Phụ kiện âm thanh',8,NULL),(38,'Giá treo loa',37,NULL),(39,'Cáp loa, đầu chuyển',37,NULL),(40,'Phụ kiện âm thanh khác',37,NULL),(41,'Android TV Box, Smart Box',8,NULL),(42,'Dàn âm thanh',8,NULL),(43,'Dàn Karaoke',42,NULL),(44,'Dàn âm thanh giải trí tại gia',42,NULL),(45,'Đầu CD, DVD, karaoke, Blu-ray',8,NULL),(46,'Đầu phát karaoke',45,NULL),(47,'Đầu ghi phát DVD, Blu-ray',45,NULL),(48,'Máy radio cassette',8,NULL),(49,'Bộ giải mã âm thanh DAC',8,NULL),(50,'Thiết bị phát Streaming',8,NULL),(51,'Smart Tivi - Android Tivi',13,NULL),(52,'Tivi 4K',13,NULL),(53,'Tivi QLED',13,NULL),(54,'Tivi Cao Cấp',13,NULL),(55,'Tivi Thường (LED)',13,NULL),(56,'Tivi OLED',13,NULL),(57,'Internet Tivi',13,NULL),(58,'Phụ kiện linh kiện máy lạnh',15,NULL),(59,'Phụ kiện, linh kiện máy giặt',15,NULL),(60,'Phụ kiện, linh kiện tủ lạnh',15,NULL),(61,'Phụ kiện, linh kiện máy nước nóng',15,NULL),(62,'Phụ kiện, linh kiện điện lạnh khác',15,NULL),(63,'Thiết bị số - Phụ kiện số',0,NULL),(64,'Phụ kiện điện thoại, máy tính bảng',63,NULL),(65,'Bao da - Ốp lưng',64,NULL),(66,'Bao da - Ốp lưng điện thoại Samsung',65,NULL),(67,'Bao da - Ốp lưng điện thoại Oppo',65,NULL),(68,'Bao da - Ốp lưng điện thoại Iphone',65,NULL),(69,'Bao da - Ốp lưng điện thoại Xiaomi',65,NULL),(70,'Bao da - Ốp lưng điện thoại Huawei',65,NULL),(71,'Bao da - Ốp lưng điện thoại Vivo',65,NULL),(72,'Bao da - Ốp lưng điện thoại Nokia',65,NULL),(73,'Bao da - Ốp lưng điện thoại Sony',65,NULL),(74,'Bao da - Ốp lưng điện thoại Asus',65,NULL),(75,'Bao da - Ốp lưng điện thoại Khác',65,NULL),(76,'Bao da - Ốp lưng Ipad',65,NULL),(77,'Bao da - Ốp lưng điện thoại Honor',65,NULL),(78,'Bao da - Ốp lưng Máy tính bảng khác',65,NULL),(79,'SIM Điện thoại',64,NULL),(80,'SIM Số',79,NULL),(81,'SIM Data - SIM 3G / 4G',79,NULL),(82,'Miếng Dán Màn Hình',64,NULL),(83,'Miếng Dán Màn Hình Điện Thoại',82,NULL),(84,'Miếng Dán Thiết Bị Di Động Khác',82,NULL),(85,'Dây Sạc - Dây Cáp',64,NULL),(86,'Dây Cáp Sạc iPhone, iPad',85,NULL),(87,'Dây Cáp Sạc USB Type-C',85,NULL),(88,'Dây Cáp Sạc Micro USB',85,NULL),(89,'Dây Cáp Sạc Đa Năng',85,NULL),(90,'Các Loại Cáp Khác',85,NULL),(91,'Linh Kiện Thay Thế',64,NULL),(92,'Pin Thay Thế',91,NULL),(93,'Màn Hình Thay Thế',91,NULL),(94,'Vỏ - Case Thay Thế',91,NULL),(95,'Linh Kiện Thay Thế Khác',91,NULL),(96,'Adapter - Củ Sạc',64,NULL),(97,'Adapter Sạc - Củ Sạc Thường',96,NULL),(98,'Bộ Adapter Sạc Kèm Cáp Sạc',96,NULL),(99,'Adapter Sạc - Củ Sạc Xe Hơi',96,NULL),(100,'Đế Sạc Không Dây',96,NULL),(101,'Giá Đỡ - Chân Đế - Móc Dán',64,NULL),(102,'Giá Đỡ - Chân Đế Thường',101,NULL),(103,'Móc Dán Đỡ Điện Thoại',101,NULL),(104,'Giá Đỡ - Chân Đế Gắn Ô Tô, Xe Máy',101,NULL),(105,'Pin Sạc Dự Phòng',64,NULL),(106,'Pin Sạc Dự Phòng Di Động',105,NULL),(107,'Pin Sạc Dự Phòng Ốp Lưng',106,NULL),(108,'Hộp Đựng - Túi Đựng Phụ Kiện',64,NULL),(109,'Thẻ Nhớ và Bộ Nhớ Mở Rộng',64,NULL),(110,'Thẻ Nhớ Điện Thoại',109,NULL),(111,'USB OTG',109,NULL),(112,'Phụ Kiện Chụp Hình',64,NULL),(113,'Gậy Tự Sướng - Selfie',112,NULL),(114,'Đèn Flash Selfie - Flash Mini',112,NULL),(115,'Lens Cho Điện Thoại',112,NULL),(116,'Bàn Phím Rời - Bút Cảm Ứng',64,NULL),(117,'Bàn Phím Rời - Ốp Tích Hợp Bàn Phím',116,NULL),(118,'Bút Cảm Ứng',116,NULL),(119,'Phụ Kiện Chơi Game',64,NULL),(120,'Nút Bấm Chơi Game Điện Thoại',119,NULL),(121,'Tay Cầm Chơi Game Điện Thoại',119,NULL),(122,'Phụ Kiện Chơi Game Điện Thoại Khác',119,NULL),(123,'Túi Bảo Vệ - Túi Chống Nước',64,NULL),(124,'Dây Đeo và Phụ Kiện Trang Trí',64,NULL),(125,'Dụng Cụ Sửa Chữa và Vệ Sinh',64,NULL),(126,'Vòng Đeo - Đai Đeo',64,NULL),(127,'Dụng Cụ Sửa Chữa',125,NULL),(128,'Dụng Cụ Vệ Sinh',125,NULL),(129,'Phụ Kiện Di Động Khác',64,NULL),(130,'Phụ kiện máy tính và Laptop',63,NULL),(131,'Phụ Kiện Laptop',130,NULL),(132,'Skin và Decal Dán Laptop',131,NULL),(133,'Đế Tản Nhiệt Laptop',131,NULL),(134,'Giá Đỡ Laptop',131,NULL),(135,'Case - Vỏ Ốp Lưng Laptop',131,NULL),(136,'Miếng Phủ Bàn Phím Laptop',131,NULL),(137,'Dây Chống Trộm Laptop',131,NULL),(138,'Các Loại Cáp Chuyển Đổi',130,NULL),(139,'Cáp HDMI - Displayport',138,NULL),(140,'Bộ Chuyển Đổi Tín Hiệu HDMI/VGA/DVI/DP',138,NULL),(141,'Hub Chuyển Đổi USB Type-C',138,NULL),(142,'Dây Cáp USB',138,NULL),(143,'Hub USB',138,NULL),(144,'Dây Cáp VGA-DVI',138,NULL),(145,'Dây Cáp Tín Hiệu Khác',138,NULL),(146,'Bộ Chuyển Đổi Khác',138,NULL),(147,'Đầu Đọc Thẻ Nhớ',138,NULL),(148,'Cáp Song Song - Cáp Máy In - Cáp Serial',138,NULL),(149,'Hub Chuyển Đổi USB-A',138,NULL),(150,'Dây Nguồn',138,NULL),(151,'Dây Cáp SATA',138,NULL),(152,'Dây Cáp Thunderbolt',138,NULL),(153,'Bàn Di Chuột - Miếng Lót Chuột',130,NULL),(154,'Phụ Kiện Phím Chuột Văn Phòng',130,NULL),(155,'Chuột Văn Phòng',154,NULL),(156,'Bàn Phím Văn Phòng',154,NULL),(157,'Bộ Phím Chuột Văn Phòng',154,NULL),(158,'Phụ Kiện Phím Chuột Văn Phòng Khác',154,NULL),(159,'Chuột Văn Phòng Không Dây',155,NULL),(160,'Chuột Văn Phòng Có Dây',155,NULL),(161,'Bàn Phím Văn Phòng Có Dây',156,NULL),(162,'Bàn Phím Văn Phòng Không Dây',156,NULL),(163,'Phụ Kiện Phím Chuột Chơi Game',130,NULL),(164,'Chuột Chơi Game',163,NULL),(165,'Bàn Phím Chơi Game',163,NULL),(166,'Bộ Phím Chuột Chơi Game',163,NULL),(167,'Phụ Kiện Phím Chuột Chơi Game Khác',163,NULL),(168,'Tai Nghe Máy Tính',130,NULL),(169,'Tai Nghe Chơi Game',168,NULL),(170,'Tai Nghe Văn Phòng - Headset',168,NULL),(171,'Công Cụ Đồ Họa - Thiết Bị Cảm Ứng',130,NULL),(172,'Bảng Vẽ Đồ Họa Cảm Ứng',171,NULL),(173,'Thiết Bị Cân Bằng Màu',171,NULL),(174,'Thiết Bị Đồ Họa và Công Cụ Khác',171,NULL),(175,'Webcam Máy Tính',130,NULL),(176,'Bút Trình Chiếu',130,NULL),(177,'Dụng Cụ Vệ Sinh và Sửa Chữa',130,NULL),(178,'Dụng Cụ Vệ Sinh',177,NULL),(179,'Dụng Cụ Sửa Chữa',177,NULL),(180,'Thiết Bị Âm Thanh và Phụ Kiện',63,NULL),(181,'Loa Nghe Nhạc',180,NULL),(182,'Loa Bluetooth',181,NULL),(183,'Loa Vi Tính',181,NULL),(184,'Loa Kéo',181,NULL),(185,'Loa Trợ Giảng',181,NULL),(186,'Loa Bluetooth Vi Tính',181,NULL),(187,'Loa Hi-Fi - Audiophiles',181,NULL),(188,'Tai Nghe Bluetooth',180,NULL),(189,'Tai Nghe Bluetooth Nhét Tai',188,NULL),(190,'Tai Nghe True Wireless',188,NULL),(191,'Tai Nghe Bluetooth Chụp Tai Over-Ear',188,NULL),(192,'Tai Nghe Bluetooth Đàm Thoại',188,NULL),(193,'Tai Nghe Bluetooth Chụp Tai On-Ear',188,NULL),(194,'Tai Nghe Có Dây',180,NULL),(195,'Tai Nghe Có Dây Nhét Tai',194,NULL),(196,'Tai Nghe Có Dây Chụp Tai (Over-Ear)',194,NULL),(197,'Tai Nghe Có Dây Chụp Tai (On-Ear)',194,NULL),(198,'Phụ Kiện Âm Thanh',180,NULL),(199,'Cáp Âm Thanh',198,NULL),(200,'Phụ Kiện Âm Thanh',198,NULL),(201,'Bộ Chuyển Đổi Không Dây',198,NULL),(202,'Đệm và Nút Tai Nghe',198,NULL),(203,'Micro',180,NULL),(204,'Microphone Di Động',203,NULL),(205,'Micro Karaoke Bluetooth',203,NULL),(206,'Microphone Vi Tính',203,NULL),(207,'Máy Thu và Máy Phát Âm Thanh',180,NULL),(208,'Máy Nghe Nhạc',207,NULL),(209,'Máy Ghi Âm',207,NULL),(210,'DAC và Amplifier Di Động',180,NULL),(211,'Thiết Bị Đeo Thông Minh và Phụ Kiện',63,NULL),(212,'Thiết Bị Thông Minh và Linh Kiện Điện Tử',63,NULL),(213,'Thiết Bị Chơi Game và Phụ Kiện',63,NULL),(214,'Phụ Kiện Thiết Bị Đeo Thông Minh',211,NULL),(215,'Đồng Hồ Thông Minh',211,NULL),(216,'Vòng Đeo Thông Minh - Vòng Theo Dõi Vận Động',211,NULL),(217,'Thiết Bị Thực Tế Ảo VR',211,NULL),(218,'Mắt Kính Thông Minh',211,NULL),(219,'Dây Đeo Thay Thế, Phụ Trợ - Phụ Kiện Khác',214,NULL),(220,'Miếng Dán Màn Hình',214,NULL),(221,'Adapter Sạc - Cáp Sạc Cho Thiết Bị Đeo',214,NULL),(222,'Mạch Điện Lập Trình và Linh Kiện Điện Tử',212,NULL),(223,'Thiết Bị Số - Thiết Bị Thông Minh',212,NULL),(224,'Các Module Tích Hợp',222,NULL),(225,'Cảm Biến',222,NULL),(226,'Dây, Cáp Nối và Adapter Nguồn',222,NULL),(227,'Máy Tính Nhúng - Kit Phát Triển',222,NULL),(228,'Linh Kiện và Các Phần Cứng Khác',222,NULL),(229,'Phụ Kiện và Dụng Cụ Khác',222,NULL),(230,'Thiết Bị Robot',222,NULL),(239,'Máy Bộ Đàm',223,NULL),(240,'Thiết Bị Nhà Thông Minh',223,NULL),(241,'Đồ Chơi Công Nghệ - Thiết Bị Số và Phụ Kiện Số Khác',223,NULL),(242,'Thiết Bị Định Vị GPS',223,NULL),(243,'Kim Từ Điển và Các Loại Máy Thông Dịch',223,NULL),(244,'Phụ Kiện Gaming',213,NULL),(245,'Tay Bấm Game - Thiết Bị Điều Khiển',213,NULL),(246,'Máy Chơi Game - Console',213,NULL),(247,'Ghế Gaming',213,NULL),(248,'Đĩa Game',213,NULL),(249,'PlayStation',246,NULL),(250,'Nintendo',246,NULL),(251,'Máy Chơi Game Khác',246,NULL),(252,'Đồng hồ và Trang sức',0,NULL),(253,'Túi thời trang nữ',0,NULL),(254,'Thời trang nữ',0,NULL),(255,'Giày - Dép nữ',0,NULL),(256,'Thời trang nam',0,NULL),(257,'Giày - Dép nam',0,NULL),(258,'Túi thời trang nam',0,NULL),(259,'Balo và Vali',0,NULL),(260,'Phụ kiện thời trang',0,NULL),(261,'Laptop - Máy Vi Tính - Linh kiện',0,NULL),(262,'Máy Ảnh - Máy Quay Phim',0,NULL),(263,'Điện Gia Dụng',0,NULL),(264,'Nhà Cửa - Đời Sống',0,NULL),(265,'Bách Hóa Online',0,NULL),(266,'Đồ Chơi - Mẹ & Bé',0,NULL),(267,'Làm Đẹp - Sức Khỏe',0,NULL),(268,'Thể Thao - Dã Ngoại',0,NULL),(269,'Ô Tô - Xe Máy - Xe Đạp',0,NULL),(270,'Hàng Quốc Tế',0,NULL),(271,'Nhà Sách Tiki',0,NULL),(272,'Voucher - Dịch vụ',0,NULL),(273,'Trang sức',252,NULL),(274,'Đồng hồ nữ',252,NULL),(275,'Đồng hồ nam',252,NULL),(276,'Phụ kiện đồng hồ',252,NULL),(277,'Đồng hồ trẻ em',252,NULL),(278,'Vòng tay',273,NULL),(279,'Dây chuyền',273,NULL),(280,'Nhẫn',273,NULL),(281,'Bông tai',273,NULL),(282,'Bộ trang sức',273,NULL),(283,'Vàng miếng',273,NULL),(284,'Đồng hồ dây kim loại',274,NULL),(285,'Đồng hồ dây da',274,NULL),(286,'Đồng hồ thể thao nữ',274,NULL),(287,'Đồng hồ thời trang, casual nam',275,NULL),(288,'Đồng hồ business nam',275,NULL),(289,'Đồng hồ thể thao nam',275,NULL),(290,'Đồng hồ lộ máy',275,NULL),(291,'Dây đồng hồ',276,NULL),(292,'Hộp đựng đồng hồ',276,NULL),(293,'Dụng cụ sửa đồng hồ',276,NULL),(294,'Pin đồng hồ',276,NULL),(295,'Đồng hồ bé trai',277,NULL),(296,'Đồng hồ bé gái',277,NULL),(297,'Túi đeo chéo, túi đeo vai nữ',253,NULL),(298,'Túi tote nữ',253,NULL),(299,'Ví nữ',253,NULL),(300,'Túi xách tay nữ',253,NULL),(301,'Phụ kiện túi',253,NULL),(302,'Túi đeo chéo dạo phố',297,NULL),(303,'Túi đeo chéo công sở',297,NULL),(304,'Túi tote không khóa',298,NULL),(305,'Túi tote có khóa',298,NULL),(306,'Ví dài',299,NULL),(307,'Ví ngắn',299,NULL),(308,'Túi xách vừa và nhỏ',300,NULL),(309,'Túi xách to bản',300,NULL),(310,'Phụ kiện cài túi',301,NULL),(311,'Dây, quai đeo túi',301,NULL),(312,'Áo nữ',254,NULL),(313,'Đồ ngủ - Đồ mặc nhà nữ',254,NULL),(314,'Đầm nữ',254,NULL),(315,'Áo khoác nữ',254,NULL),(316,'Quần nữ',254,NULL),(317,'Chân váy',253,NULL),(318,'Áo liền quần - Bộ trang phục',253,NULL),(319,'Trang phục bơi nữ',253,NULL),(320,'Thời trang trung niên',253,NULL),(321,'Thời trang bầu và sau sinh',253,NULL),(322,'Áo thun nữ',312,NULL),(323,'Áo kiểu',312,NULL),(324,'Áo sơ mi nữ',312,NULL),(325,'Áo crop-top',312,NULL),(326,'Áo hai dây - Áo ba lỗ nữ',312,NULL),(327,'Đồ ngủ nữ',313,NULL),(328,'Đồ mặc nhà',313,NULL),(329,'Đầm suông',314,NULL),(330,'Đầm dáng xòe',314,NULL),(331,'Đầm dáng ôm',314,NULL),(332,'Đầm dự tiệc',314,NULL),(333,'Đầm công sở',314,NULL),(334,'Đầm maxi',314,NULL),(335,'Áo thun - Áo khoác nỉ nữ',315,NULL),(336,'Áo vest, blazer nữ',315,NULL),(337,'Áo khoác dạ nữ',315,NULL),(338,'Áo khoác chống nắng nữ',315,NULL),(339,'Áo cardigan nữ',315,NULL),(340,'Áo khoác phao nữ',315,NULL),(341,'Áo khoác jeans nữ',315,NULL),(342,'Áo khoác bomber jackets',315,NULL),(343,'Áo khoác da nữ',315,NULL),(344,'Quần tây nữ',316,NULL),(345,'Quần jean nữ',316,NULL),(346,'Quần shorts nữ',316,NULL),(347,'Quần ống rộng nữ',316,NULL),(348,'Quần legging - tregging nữ',316,NULL),(349,'Quần baggy nữ',316,NULL),(350,'Quần yếm',316,NULL),(351,'Chân váy ngắn',317,NULL),(352,'Chân váy dài',317,NULL),(353,'Chân váy chữ A',317,NULL),(354,'Chân váy xếp li',317,NULL),(355,'Chân váy bút chì',317,NULL),(356,'Chân váy công sở',317,NULL),(357,'Áo liền quần',318,NULL),(358,'Bộ trang phục',318,NULL),(359,'Áo dài',318,NULL),(360,'Đồ bơi hai mảnh',319,NULL),(361,'Đồ bơi một mảnh',319,NULL),(362,'Bikini',319,NULL),(363,'Đầm bầu',321,NULL),(364,'Đồ lót bầu',321,NULL),(365,'Quần bầu',321,NULL),(366,'Giày cao gót',255,NULL),(367,'Dép - Guốc nữ',255,NULL),(368,'Giày sandals nữ',255,NULL),(369,'Giày thể thao nữ',255,NULL),(370,'Giày lười nữ',255,NULL),(371,'Giày búp bê',255,NULL),(372,'Giày boots nữ',255,NULL),(373,'Phụ kiện giày',255,NULL),(374,'Giày Đế xuồng nữ',255,NULL),(375,'Giày bít mũi quai ngang',366,NULL),(376,'Giày cao gót hở mũi',366,NULL),(377,'Giày cao gót nhọn',366,NULL),(378,'Giày cao gót quai sau',366,NULL),(379,'Giày cao gót sục',366,NULL),(380,'Dép quai ngang',367,NULL),(381,'Dép đi trong nhà',367,NULL),(382,'Dép xỏ ngón',367,NULL),(383,'Giày sandals đế bằng',368,NULL),(384,'Giày sandals chiến binh',368,NULL),(385,'Giày sandals xỏ ngón',368,NULL),(386,'Giày sandals buộc dây',368,NULL),(387,'Giày thể thao cổ thấp',369,NULL),(388,'Giày thể thao cổ cao',369,NULL),(389,'Giày lười mũi nhọn',370,NULL),(390,'Giày lười hở gót',370,NULL),(391,'Giày lười mũi vuông',370,NULL),(392,'Giày lười cao gót',370,NULL),(393,'Giày búp bê mũi tròn',371,NULL),(394,'Giày búp bê mũi nhọn',371,NULL),(395,'Giày búp bê mũi vuông',371,NULL),(396,'Giày boots nữ cổ ngắn',372,NULL),(397,'Giày boots nữ cổ cao',372,NULL),(398,'Giày boots nữ gót nhọn',372,NULL),(399,'Miếng lót giày',373,NULL),(400,'Phụ kiện cho giày',373,NULL),(401,'Vệ sinh giày',373,NULL),(402,'Áo thun nam',256,NULL),(403,'Quần nam',256,NULL),(404,'Áo sơ mi nam',256,NULL),(405,'Áo vest - Áo khoác nam',256,NULL),(406,'Đồ lót nam',256,NULL),(407,'Áo hoodie nam',256,NULL),(408,'Áo nỉ - Áo len nam',256,NULL),(409,'Đồ ngủ, đồ mặc nhà nam',256,NULL),(410,'Đồ bơi - Đồ đi biển nam',256,NULL),(411,'Đồ đôi - Đồ gia đình nam',256,NULL),(412,'Quần áo nam kích cỡ lớn',256,NULL),(413,'Quần áo nam trung niên',256,NULL),(414,'Áo thun nam ngắn tay không cổ',402,NULL),(415,'Áo thun nam ngắn tay có cổ',402,NULL),(416,'Áo thun nam dài tay',402,NULL),(417,'Áo thun nam ba lỗ',402,NULL),(418,'Quần jeans nam',403,NULL),(419,'Quần kaki nam',403,NULL),(420,'Quần thun nam',403,NULL),(421,'Quần jogger nam',403,NULL),(422,'Quần tây nam',403,NULL),(423,'Áo sơ mi nam tay dài',404,NULL),(424,'Áo sơ mi nam tay ngắn',404,NULL),(425,'Áo sơ mi nam cổ tàu',404,NULL),(426,'Áo khoác gió',405,NULL),(427,'Áo khoác nỉ',405,NULL),(428,'Bộ vest nam',405,NULL),(429,'Áo khoác jeans nam',405,NULL),(430,'Áo khoác da nam',405,NULL),(431,'Áo khoác phao nam',405,NULL),(432,'Áo khoác bomber nam',405,NULL),(433,'Áo cardigan nam',405,NULL),(434,'Quần lót nam',406,NULL),(435,'Bộ đồ lót nam',406,NULL),(436,'Áo hoodies nam vải nỉ',407,NULL),(437,'Áo hoodies nam vải cotton',407,NULL),(438,'Áo hoodies nam vải da cá',407,NULL),(439,'Áo len dệt kim',408,NULL),(440,'Áo nỉ nam',408,NULL),(441,'Đồ mặc nhà nam - Bộ dài',409,NULL),(442,'Đồ mặc nhà nam - Bộ ngắn',409,NULL),(443,'Quần bơi - đi biển nam',410,NULL),(444,'Áo bơi - đi biển nam',410,NULL),(445,'Áo gia đình',411,NULL),(446,'Áo đôi',411,NULL),(447,'Quần đôi',411,NULL),(448,'Áo nam trung niên',413,NULL),(449,'Quần nam trung niên',413,NULL),(450,'Giày tây nam',257,NULL),(451,'Giày lười nam',257,NULL),(452,'Dép nam',257,NULL),(453,'Giày thể thao nam',257,NULL),(454,'Giày sandals nam',257,NULL),(455,'Phụ kiện giày nam',257,NULL),(456,'Giày boots nam',257,NULL),(457,'Giày tây nam không dây',450,NULL),(458,'Giày tây nam có dây',450,NULL),(459,'Giày lười da nam',451,NULL),(460,'Giày lười vải nam',451,NULL),(461,'Giày lười nhựa nam',451,NULL),(462,'Dép nam quai ngang',452,NULL),(463,'Dép nam xỏ ngón',452,NULL),(464,'Dép nam đi trong nhà',452,NULL),(465,'Giày thể thao nam cổ thấp',453,NULL),(466,'Giày thể thao nam cổ cao',453,NULL),(467,'Giày sandals nam quai ngang',454,NULL),(468,'Giày sandals nam quai chéo',454,NULL),(469,'Phụ kiện cho giày nam',455,NULL),(470,'Miếng lót giày nam',455,NULL),(471,'Vệ sinh giày',455,NULL),(472,'Giày boots nam cổ cao',456,NULL),(473,'Giày boots nam cổ thấp',456,NULL),(474,'Túi đeo chéo nam',258,NULL),(475,'Ví nam',258,NULL),(476,'Túi xách công sở nam',258,NULL),(477,'Túi bao tử, túi đeo bụng',258,NULL),(478,'Ví nam ngang',475,NULL),(479,'Ví nam đứng',475,NULL),(480,'Balo',259,NULL),(481,'Balo, cặp, túi chống sốc laptop',259,NULL),(482,'Túi du lịch và phụ kiện',259,NULL),(483,'Vali, phụ kiện vali',259,NULL),(484,'Balo nữ',480,NULL),(485,'Balo dây rút',480,NULL),(486,'Balo laptop',480,NULL),(487,'Balo nam',480,NULL),(488,'Túi chống sốc',481,NULL),(489,'Cặp đựng laptop',481,NULL),(490,'Túi trống',482,NULL),(491,'Balo du lịch, phượt',482,NULL),(492,'Ví passport',482,NULL),(493,'Vali nhựa',483,NULL),(494,'Phụ kiện vali',483,NULL),(495,'Vali vải',483,NULL),(496,'Vali trẻ em',483,NULL),(497,'Phụ kiện thời trang nữ',260,NULL),(498,'Mắt kính',260,NULL),(499,'Phụ kiện thời trang nam',260,NULL),(500,'Khăn - Tất - Vớ nữ',497,NULL),(501,'Phụ kiện tóc nữ',497,NULL),(502,'Nón nữ',497,NULL),(503,'Cài Áo',497,NULL),(504,'Thắt lưng - Dây nịt nữ và phụ kiện',497,NULL),(505,'Phụ kiện cưới',497,NULL),(506,'Kính mát',498,NULL),(507,'Gọng kính',498,NULL),(508,'Mắt kính trẻ em',498,NULL),(509,'Phụ kiện kính',498,NULL),(510,'Kính áp tròng',498,NULL),(511,'Thắt lưng, dây nịt nam',499,NULL),(512,'Nón nam',499,NULL),(513,'Tất, vớ nam',499,NULL),(514,'Khăn - Găng tay nam',499,NULL),(515,'Găng tay nam',499,NULL),(516,'Hình xăm',499,NULL),(517,'Linh Kiện Máy Tính - Phụ Kiện Máy Tính',261,NULL),(518,'Thiết Bị Văn Phòng - Thiết Bị Ngoại Vi',261,NULL),(519,'Thiết Bị Mạng',261,NULL),(520,'Thiết Bị Lưu Trữ',261,NULL),(521,'Laptop',261,NULL),(522,'PC - Máy Tính Bộ',261,NULL),(523,'Linh Kiện Thay Thế Cho Laptop',517,NULL),(524,'Hệ Thống Tản Nhiệt',517,NULL),(525,'RAM Máy Tính',517,NULL),(594,'Mainboard - Board Mạch Chủ',517,NULL),(595,'Nguồn Máy Tính',517,NULL),(596,'Vỏ Case - Thùng Máy',517,NULL),(597,'Bộ Lưu Điện - UPS',517,NULL),(598,'Bộ Vi Xử Lý CPU',517,NULL),(599,'Sound Card - Card Âm Thanh',517,NULL),(600,'Card Màn Hình - VGA',517,NULL),(601,'KVM Switches - Switch HDMI',517,NULL),(602,'Thiết Bị Streaming và Capture Cards',517,NULL),(603,'Ổ Đĩa Quang',517,NULL),(604,'I/O Port Cards',517,NULL),(605,'Linh Kiện Máy Tính Khác',517,NULL),(606,'Adapter Sạc Laptop',523,NULL),(607,'Pin Thay Thế Laptop',523,NULL),(608,'Bàn Phím Thay Thế Laptop',523,NULL),(609,'Linh Kiện Thay Thế Laptop Khác',523,NULL),(610,'Quạt Tản Nhiệt',524,NULL),(611,'Keo - Pad Tản Nhiệt',524,NULL),(612,'RAM Desktop',525,NULL),(613,'RAM Laptop',525,NULL),(614,'Mực In và Toner',518,NULL),(615,'Máy In - Photocopy',518,NULL),(616,'Máy Chấm Công',518,NULL),(617,'Giấy In',518,NULL),(618,'Máy Scan Mã Vạch',518,NULL),(619,'Màn Hình Máy Tính',518,NULL),(620,'Máy Chiếu và Phụ Kiện Máy Chiếu',518,NULL),(621,'Phần Mềm Máy Tính',518,NULL),(622,'Máy Đếm Tiền',518,NULL),(623,'Thiết Bị Truyền Thông Hội Nghị',518,NULL),(624,'Máy Scan Tài Liệu',518,NULL),(625,'Máy Hủy Tài Liệu',518,NULL),(626,'Máy Fax',518,NULL),(627,'Phụ Kiện Thiết Bị Mạng',519,NULL),(628,'Thiết Bị Phát Sóng Wifi',519,NULL),(629,'Bộ Chia Mạng - Switch',519,NULL),(630,'Bộ Phát Wifi Di Động 3G/4G - Mifi',519,NULL),(631,'Bộ Chuyển Đổi - Transceivers',519,NULL),(632,'Bộ Kích Sóng Wifi',519,NULL),(633,'Card Mạng',519,NULL),(634,'Mở Rộng Mạng Qua Đường Điện - Powerline Ethernet',519,NULL),(635,'Modem ADSL',519,NULL),(636,'Ăng-Ten Mạng',519,NULL),(637,'Ổ Cứng Gắn Trong',520,NULL),(638,'USB',520,NULL),(639,'Case Ổ Cứng- Hộp Đựng HDD Box - Dock Ổ Cứng',520,NULL),(640,'Ổ Cứng Di Động',520,NULL),(641,'Thiết Bị Lưu Trữ Qua Mạng NAS',520,NULL),(642,'Đĩa Trắng - Băng Cuộn',520,NULL),(643,'Laptop Truyền Thống',521,NULL),(644,'Laptop Gaming',521,NULL),(645,'Laptop 2 trong 1',521,NULL),(646,'Macbook',521,NULL),(647,'Máy Tính Bộ Thương Hiệu',522,NULL),(648,'Máy Tính Để Bàn Lắp Ráp',522,NULL),(649,'Máy Tính All in one',522,NULL),(650,'Mini PC',522,NULL),(651,'Towers - Máy Chủ - Server',522,NULL),(652,'Phụ Kiện Máy Ảnh, Máy Quay',262,NULL),(653,'Camera Giám Sát',262,NULL),(654,'Balo - Túi Đựng - Bao Da',262,NULL),(655,'Camera Hành Trình - Action Camera và Phụ Kiện',262,NULL),(656,'Thiết Bị Ánh Sáng',262,NULL),(657,'Ống Kính - Ống Ngắm',262,NULL),(658,'Ống Kính (Lens)',262,NULL),(659,'Máy Ảnh',262,NULL),(660,'Thiết Bị Quay Phim',262,NULL),(661,'Máy Bay Camera và Phụ Kiện',262,NULL),(662,'Chân Máy Ảnh, Monopod, Tripod',652,NULL),(663,'Pin - Sạc Máy Ảnh, Máy Quay',652,NULL),(664,'Kính Lọc - Filter',652,NULL),(665,'Thẻ Nhớ Máy Ảnh',652,NULL),(666,'Lens Hood',652,NULL),(667,'Gimbal',652,NULL),(668,'Miếng Dán Bảo Vệ Màn Hình Máy Ảnh',652,NULL),(669,'Adapter - Ngàm Chuyển',652,NULL),(670,'Túi Hút Ẩm Cho Máy Ảnh, Máy Quay',652,NULL),(671,'Thiết Bị Phòng Tối',652,NULL),(672,'Hộp Chụp Ảnh Sản Phẩm',652,NULL),(673,'Dụng Cụ Vệ Sinh Máy Ảnh',652,NULL),(674,'Nắp Ống Kính',652,NULL),(675,'Phụ Kiện Cho Ống Kính',652,NULL),(676,'Điều Khiển Từ Xa',652,NULL),(677,'Ngàm Gắn Máy Quay Trên Người',652,NULL),(678,'Phụ Kiện Máy Ảnh, Máy Quay Khác',652,NULL),(679,'Camera IP',653,NULL),(680,'Camera Quan Sát Analog',653,NULL),(681,'Đầu Ghi Hình Camera',653,NULL),(682,'Phụ Kiện Camera Giám Sát',653,NULL),(683,'Hệ Thống Camera Giám Sát',653,NULL),(684,'Túi và Hộp Đựng Máy Ảnh',654,NULL),(685,'Dây Đeo Máy Ảnh, Máy Quay, Ống Nhòm',654,NULL),(686,'Hộp Đựng - Tủ Chống Ẩm',654,NULL),(687,'Túi Đựng Máy Ảnh',654,NULL),(688,'Bao Đựng Chống Sốc, Chống Nước',654,NULL),(689,'Túi và Hộp Đựng Máy Quay',654,NULL),(690,'Hộp Đựng Filter',654,NULL),(691,'Hộp Đựng Lens',654,NULL),(692,'Túi Đựng Chân Đế Tripod và Monopod',654,NULL),(693,'Camera Hành Trình Ô Tô, Xe Máy',655,NULL),(694,'Phụ Kiện Camera Hành Trình',655,NULL),(695,'Action Camera',655,NULL),(696,'Đèn Chiếu Sáng Studio',656,NULL),(697,'Thiết Bị Phản Sáng và Phụ Kiện',656,NULL),(698,'Đèn Flash và Phụ Kiện',656,NULL),(699,'Máy Đo Sáng và Phụ Kiện',656,NULL),(700,'Ống Nhòm',657,NULL),(701,'Kính Hiển Vi',657,NULL),(702,'Kính Viễn Vọng - Kính Thiên Văn',657,NULL),(703,'Phụ Kiện Ống Kính, Ống Ngắm',657,NULL),(704,'Ống Ngắm',657,NULL),(705,'Ống Kính Máy Ảnh',658,NULL),(706,'Ống Kính Máy Quay Phim',658,NULL),(707,'Máy Ảnh Mirrorless',659,NULL),(708,'Máy Ảnh Compact - Máy Ảnh Du Lịch',659,NULL),(709,'Máy Ảnh DSLR',659,NULL),(710,'Máy Ảnh Lấy Liền',659,NULL),(711,'Máy Chụp Ảnh Phim',659,NULL),(712,'Micro Cho Máy Quay',660,NULL),(713,'Máy Quay Phim',660,NULL),(714,'Máy Quay Phim Chuyên Dụng',660,NULL),(715,'Phụ Kiện Máy Bay Camera - Drone',661,NULL),(716,'Máy Bay Camera - Drone',661,NULL),(717,'Linh Kiện Thay Thế Máy Bay camera - Drone',661,NULL),(718,'Đồ dùng nhà bếp',263,NULL),(719,'Thiết bị gia đình',263,NULL),(720,'Bếp các loại',718,NULL),(721,'Nồi điện các loại',718,NULL),(722,'Máy xay, máy ép',718,NULL),(723,'Máy hút khói, khử mùi',718,NULL),(724,'Bình đun siêu tốc',718,NULL),(725,'Lò nướng điện',718,NULL),(726,'Đồ dùng nhà bếp khác',718,NULL),(727,'Máy pha cà phê',718,NULL),(728,'Lò vi sóng',718,NULL),(729,'Máy đánh trứng',718,NULL),(730,'Vỉ nướng điện',718,NULL),(731,'Máy hút chân không',718,NULL),(732,'Máy hàn miệng túi',718,NULL),(733,'Siêu sắc thuốc',718,NULL),(734,'Bình thủy điện',718,NULL),(735,'Máy làm bánh',718,NULL),(736,'Máy sấy chén',718,NULL),(737,'Máy làm tỏi đen',718,NULL),(738,'Máy làm sữa đậu nành',718,NULL),(739,'Máy cắt thịt đông lạnh',718,NULL),(740,'Máy làm sữa chua',718,NULL),(741,'Máy sấy thực phẩm',718,NULL),(742,'Máy làm kem',718,NULL),(743,'Máy làm mì sợi',718,NULL),(744,'Quạt điện',719,NULL),(745,'Máy lọc nước',719,NULL),(746,'Máy hút bụi',719,NULL),(747,'Thiết bị sưởi ấm',719,NULL),(748,'Máy lọc không khí',719,NULL),(749,'Máy tạo ẩm',719,NULL),(750,'Bàn ủi, bàn là',719,NULL),(751,'Cây Nước Nóng Lạnh',719,NULL),(752,'Máy may, thêu, vắt sổ',719,NULL),(753,'Máy sấy quần áo',719,NULL),(754,'Máy hút ẩm',719,NULL),(755,'Máy sấy tay',719,NULL),(756,'Trang trí nhà cửa',264,NULL),(757,'Đồ dùng phòng ngủ',264,NULL),(758,'Nội thất',264,NULL),(759,'Sửa chữa nhà cửa',264,NULL),(760,'Dụng cụ nhà bếp',264,NULL),(761,'Đồ dùng phòng ăn',264,NULL),(762,'Đèn & thiết bị chiếu sáng',264,NULL),(763,'Đồ dùng và thiết bị nhà tắm',264,NULL),(764,'Ngoài trời & sân vườn',264,NULL),(765,'Vật phẩm phong thủy',264,NULL),(766,'Đồ thờ cúng',264,NULL),(767,'Bảo vệ nhà cửa',264,NULL),(768,'Nhạc cụ',264,NULL),(769,'Hoa tươi và cây cảnh',264,NULL),(770,'Dụng cụ vệ sinh',264,NULL),(771,'Ổ cắm điện',264,NULL),(772,'Ổn áp, biến áp',264,NULL),(773,'Phụ kiện giặt ủi',264,NULL),(774,'Thiết bị điều khiển thông minh',264,NULL),(775,'Dụng cụ diệt chuột, côn trùng',264,NULL),(776,'Pin và dụng cụ sạc pin',264,NULL),(777,'Tranh trang trí',756,NULL),(778,'Giấy dán tường',756,NULL),(779,'Decal',756,NULL),(780,'Đồng hồ treo tường',756,NULL),(781,'Vật phẩm trang trí',756,NULL),(782,'Trang trí nhà cửa khác',756,NULL),(783,'Đồng hồ để bàn',756,NULL),(784,'Bình hoa',756,NULL),(785,'Đồ đốt tinh dầu',756,NULL),(786,'Hoa trang trí',756,NULL),(787,'Móc treo, móc dán tường',756,NULL),(788,'Tranh đồng hồ',756,NULL),(789,'Nến trang trí',756,NULL),(790,'Giấy dán kính',756,NULL),(791,'Tranh treo tường',756,NULL),(792,'Phù điêu',756,NULL),(793,'Tháp đồng hồ',756,NULL),(794,'Bộ ga, ra, drap',757,NULL),(795,'Gối, ruột gối, vỏ gối',757,NULL),(796,'Chăn, mền và phụ kiện',757,NULL),(797,'Nệm và phụ kiện',757,NULL),(798,'Phụ kiện phòng ngủ',757,NULL),(799,'Chiếu',757,NULL),(800,'Đệm ngồi',757,NULL),(801,'Mùng, màn ngủ',757,NULL),(802,'Võng',757,NULL),(803,'Nội thất phòng khách',758,NULL),(804,'Nội thất phòng ngủ',758,NULL),(805,'Nội thất phòng học, làm việc',758,NULL),(806,'Nội thất phòng ăn',758,NULL),(807,'Nội thất trẻ em',758,NULL),(808,'Nội thất khác',758,NULL),(809,'Sơn, dầu mỡ, hóa chất',759,NULL),(810,'Dụng cụ sửa chữa khác',759,NULL),(811,'Máy khoan, mũi khoan',759,NULL),(812,'Kềm các loại',759,NULL),(813,'Máy vặn vít, tua vít',759,NULL),(814,'Máy mài, máy cắt',759,NULL),(815,'Thước đo các loại',759,NULL),(816,'Cờ lê, mỏ lết',759,NULL),(817,'Bảo hộ lao động',759,NULL),(818,'Bộ dụng cụ đa năng',759,NULL),(819,'Máy hàn',759,NULL),(820,'Thùng đồ nghề, túi công cụ',759,NULL),(821,'Thang nhôm',759,NULL),(822,'Bộ lục giác',759,NULL),(823,'Đá cắt, que hàn, lưỡi cưa',759,NULL),(824,'Cưa gỗ, cưa sắt',759,NULL),(825,'Máy chà nhám, đánh bóng',759,NULL),(826,'Búa các loại',759,NULL),(827,'Máy cưa',759,NULL),(828,'Xe đẩy hàng',759,NULL),(829,'Palang, ròng rọc, con đội',759,NULL),(830,'Cây lăn - Súng phun sơn',759,NULL),(831,'Ron, miếng dán khe cửa, chân cửa',759,NULL),(832,'Máy, mũi soi, phay gỗ',759,NULL),(833,'Cảo',759,NULL),(834,'Máy thổi',759,NULL),(835,'Súng bắn keo',759,NULL),(836,'Dũa các loại',759,NULL),(837,'Máy phát điện',759,NULL),(838,'Máy phun xịt rửa',759,NULL),(839,'Phụ kiện nhà bếp',760,NULL),(840,'Dụng cụ chứa đựng thực phẩm',760,NULL),(841,'Dụng cụ nấu ăn',760,NULL),(842,'Dao và phụ kiện',760,NULL),(843,'Dụng cụ làm bánh',760,NULL),(844,'Kệ nhà bếp',760,NULL),(845,'Bếp nướng, vỉ nướng',760,NULL),(846,'Đồ dùng một lần',760,NULL),(847,'Thớt nhà bếp',760,NULL),(848,'Kéo nhà bếp',760,NULL),(849,'Ấm nước các loại',760,NULL),(850,'Ly, cốc',761,NULL),(851,'Bình nước, bình giữ nhiệt',761,NULL),(852,'Bình, ca đựng nước',761,NULL),(853,'Tô, chén, dĩa',761,NULL),(854,'Phụ kiện phòng ăn',761,NULL),(855,'Bình, ly uống trà và phụ kiện',761,NULL),(856,'Đũa, muỗng, nĩa',761,NULL),(857,'Bình, ly uống cà phê và phụ kiện',761,NULL),(858,'Bình lọc, lõi lọc, thiết bị lọc nước',761,NULL),(859,'Dụng cụ pha chế',761,NULL),(860,'Khăn trải bàn',761,NULL),(861,'Bộ Bình Ly',761,NULL),(862,'Đèn trang trí',762,NULL),(863,'Bóng đèn',762,NULL),(864,'Đèn trần',762,NULL),(865,'Đèn ngoài trời',762,NULL),(866,'Đèn bàn',762,NULL),(867,'Đèn ngủ',762,NULL),(868,'Đèn pin',762,NULL),(869,'Đèn khác',762,NULL),(870,'Linh kiện đèn',762,NULL),(871,'Đèn chùm',762,NULL),(872,'Đèn cảm ứng',762,NULL),(873,'Đèn sạc',762,NULL),(874,'Đèn đọc sách',762,NULL),(875,'Đèn đứng',762,NULL),(876,'Thiết bị phòng tắm',763,NULL),(877,'Kệ nhà tắm',763,NULL),(878,'Phụ kiện nhà tắm khác',763,NULL),(879,'Thảm chùi chân',763,NULL),(880,'Móc treo, kẹp quần áo',763,NULL),(881,'Khăn',763,NULL),(882,'Giá, kệ phơi quần áo',763,NULL),(883,'Chổi, cây lau nhà',763,NULL),(884,'Bộ lau nhà',763,NULL),(885,'Thau, chậu',763,NULL),(886,'Phụ kiện giặt ủi',763,NULL),(887,'Khăn lau, cước cọ rửa',763,NULL),(888,'Rèm phòng tắm',763,NULL),(889,'Cước cọ rửa',763,NULL),(890,'Miếng lót bồn cầu',763,NULL),(891,'Áo choàng tắm',763,NULL),(892,'Dép nhà tắm',763,NULL),(893,'Ca múc nước',763,NULL),(894,'Ghế kê chân',763,NULL),(895,'Xô lau nhà',763,NULL),(896,'Máy lau hơi nước',763,NULL),(897,'Hạt giống',764,NULL),(898,'Vòi nước và phụ kiện tưới cây',764,NULL),(899,'Chậu trồng cây',764,NULL),(900,'Phân bón',764,NULL),(901,'Dụng cụ làm vườn',764,NULL),(902,'Áo mưa, ô dù và phụ kiện',764,NULL),(903,'Máy xịt rửa và phụ kiện',764,NULL),(904,'Dụng cụ ngoài trời khác',764,NULL),(905,'Máy bơm',764,NULL),(906,'Bể bơi ngoài trời',764,NULL),(907,'Nội thất ngoài trời',764,NULL),(908,'Bộ hẹn giờ tưới cây',764,NULL),(909,'Ngoại thất sân vườn',764,NULL),(910,'Bình tưới nước',764,NULL),(911,'Kệ trang trí cây',764,NULL),(912,'Đồ trang trí ngoài trời',764,NULL),(913,'Lưới che nắng',764,NULL),(914,'Máy cắt cỏ',764,NULL),(915,'Mái hiên',764,NULL),(916,'Tấm trải đa năng',764,NULL),(917,'Tượng Phật',765,NULL),(918,'Tiền hoa mai, đồng xu, tiền cổ',765,NULL),(919,'Đá quý, đá phong thủy',765,NULL),(920,'Vật phẩm phong thủy khác',765,NULL),(921,'Bộ 12 con giáp',765,NULL),(922,'Tỳ hưu phong thủy',765,NULL),(923,'Thiềm thừ phong thủy',765,NULL),(924,'Cây phong thủy',765,NULL),(925,'Mèo thần tài',765,NULL),(926,'Linh vật phong thủy khác',765,NULL),(927,'Thác nước phong thủy',765,NULL),(928,'Rồng phong thủy',765,NULL),(929,'Ngựa phong thủy',765,NULL),(930,'Tam đa (Phước Lộc Thọ)',765,NULL),(931,'Long Quy',765,NULL),(932,'Gương bát quái, La bàn',765,NULL),(933,'Kỳ Lân',765,NULL),(934,'Cá phong thủy',765,NULL),(935,'Bắp cải phong thủy',765,NULL),(936,'Quy',765,NULL),(937,'Phượng Hoàng',765,NULL),(938,'Hương, nhang',766,NULL),(939,'Phụ kiện thờ cúng',766,NULL),(940,'Lư trầm',766,NULL),(941,'Bàn thờ',766,NULL),(942,'Bộ đồ thờ',766,NULL),(943,'Đèn thờ điện',766,NULL),(944,'Bát hương, bát nhang',766,NULL),(945,'Ông Địa - Ông Thần Tài',766,NULL),(946,'Đèn thờ dầu',766,NULL),(947,'Cốc nước thờ',766,NULL),(948,'Nến thờ',766,NULL),(949,'Miếng chắn khói',766,NULL),(950,'Chuông, mõ',766,NULL),(951,'Đỉnh đồng',766,NULL),(952,'Hạc đồng',766,NULL),(953,'Ổ khóa',767,NULL),(954,'Bảo vệ nhà cửa khác',767,NULL),(955,'Chuông báo',767,NULL),(956,'Khóa cửa thông minh',767,NULL),(957,'Đàn guitar thùng, gỗ',768,NULL),(958,'Đàn Kalimba',768,NULL),(959,'Phụ kiện khác',768,NULL),(960,'Kèn - Sáo',768,NULL),(961,'Đàn ukulele - guitarlele',768,NULL),(962,'Dây đàn',768,NULL),(963,'Đàn organ - keyboard',768,NULL),(964,'Nhạc cụ dân tộc - Gizheng - Echu',768,NULL),(965,'Trống - Drum',768,NULL),(966,'Đàn piano điện',768,NULL),(967,'Phụ kiện đàn ukulele - guitarlele',768,NULL),(968,'Amply guitar điện, bass, gỗ',768,NULL),(969,'Phụ kiện trống',768,NULL),(970,'Hộp đàn - Bao đàn',768,NULL),(971,'Giá đỡ',768,NULL),(972,'Đàn violin - viola',768,NULL),(973,'Máy lên dây, tuner',768,NULL),(974,'Phơ Guitar',768,NULL),(975,'Trống Lục Lạc Gõ Bo - Tambourine',768,NULL),(976,'Đàn guitar điện',768,NULL),(977,'Pickup đàn acoustics',768,NULL),(978,'Đàn piano Upright',768,NULL),(979,'Đàn guitar bass',768,NULL),(980,'Pickup đàn Guitar điện',768,NULL),(981,'Cây để bàn',769,NULL),(982,'Cây nội thất - Văn phòng',769,NULL),(983,'Cây chậu treo',769,NULL),(984,'Cây ngoài trời',769,NULL),(985,'Hoa bó',769,NULL),(986,'Hoa giỏ - Lẵng - Kệ',769,NULL),(987,'Phụ kiện hoa',769,NULL),(988,'Chậu hoa',769,NULL),(989,'Hoa hộp',769,NULL),(990,'Phụ kiện cây',769,NULL),(991,'Hoa bình - Lọ',769,NULL),(992,'Hoa chia buồn',769,NULL),(993,'Hoa chậu treo',769,NULL),(994,'Hoa cưới',769,NULL),(995,'Tiểu cảnh',769,NULL),(996,'Thùng rác',770,NULL),(997,'Bàn chải, dụng cụ thông tắc, cọ rửa',770,NULL),(998,'Khăn lau đa năng',770,NULL),(999,'Miếng rửa chén, chà nồi',770,NULL),(1000,'Túi đựng rác',770,NULL),(1001,'Găng tay',770,NULL),(1002,'Cây lau kiếng',770,NULL),(1003,'Đồ hốt rác, ky rác',770,NULL),(1004,'Phụ kiện giặt ủi khác',773,NULL),(1005,'Giỏ đựng quần áo',773,NULL),(1006,'Túi giặt',773,NULL),(1007,'Cây lăn bụi',773,NULL),(1008,'Bàn để ủi',773,NULL),(1009,'Áo bọc bàn để ủi',773,NULL),(1010,'Đèn diệt côn trùng',775,NULL),(1011,'Dụng cụ diệt côn trùng khác',775,NULL),(1012,'Vợt muỗi',775,NULL),(1013,'Pin tiểu, pin sạc',776,NULL),(1014,'Pin sạc',776,NULL),(1015,'Máy sạc pin',776,NULL),(1016,'Thực phẩm',265,NULL),(1017,'Đồ uống - Pha chế',265,NULL),(1018,'Chăm sóc thú cưng',265,NULL),(1019,'Chăm sóc nhà cửa',265,NULL),(1020,'Gia vị',265,NULL),(1021,'Bánh kẹo',265,NULL),(1022,'Đồ uống - Giải khát',265,NULL),(1023,'Thực phẩm bổ dưỡng',265,NULL),(1024,'Thực phẩm bảo vệ sức khỏe',265,NULL),(1025,'Thực phẩm hữu cơ',265,NULL),(1026,'Bộ quà tặng',265,NULL),(1027,'Thực phẩm cao cấp',265,NULL),(1028,'Thực phẩm chay',265,NULL),(1029,'Thực phẩm khô',1016,NULL),(1030,'Nấu ăn và làm bánh',1016,NULL),(1031,'Đồ hộp',1016,NULL),(1032,'Đặc sản Việt Nam',1016,NULL),(1033,'Thực phẩm cho trẻ em',1016,NULL),(1034,'Trà',1017,NULL),(1035,'Cà phê',1017,NULL),(1036,'Ngũ cốc, bột',1017,NULL),(1037,'Sữa bột',1017,NULL),(1038,'Dành cho chó',1018,NULL),(1039,'Dành cho mèo',1018,NULL),(1040,'Dành cho thú nuôi nhỏ khác',1018,NULL),(1041,'Dành cho chim',1018,NULL),(1042,'Vệ sinh nhà bếp',1019,NULL),(1043,'Vệ sinh nhà cửa',1019,NULL),(1044,'Giặt giũ & Chăm sóc quần áo',1019,NULL),(1045,'Vệ sinh nhà tắm',1019,NULL),(1046,'Khăn giấy',1019,NULL),(1047,'Gia vị dạng bột',1020,NULL),(1048,'Gia vị dạng nước',1020,NULL),(1049,'Dầu ăn',1020,NULL),(1050,'Bánh',1021,NULL),(1051,'Kẹo',1021,NULL),(1052,'Snack',1021,NULL),(1053,'Chocolate',1021,NULL),(1054,'Bánh kẹo khác',1021,NULL),(1055,'Đồ uống không gas',1022,NULL),(1056,'Bia',1022,NULL),(1057,'Nước ngọt - Đồ uống có gas',1022,NULL),(1058,'Rượu - Đồ uống có cồn',1022,NULL),(1059,'Thời Trang Cho Mẹ Và Bé',266,NULL),(1060,'Đồ chơi',266,NULL),(1061,'Đồ dùng cho bé',266,NULL),(1062,'Dinh dưỡng cho bé',266,NULL),(1063,'Tã, Bỉm',266,NULL),(1064,'Chăm sóc mẹ mang thai, sau sinh',266,NULL),(1065,'Dinh dưỡng cho người lớn',266,NULL),(1066,'Dinh dưỡng cho mẹ',266,NULL),(1067,'Thực phẩm ăn dặm',266,NULL),(1068,'Chuẩn bị mang thai',266,NULL),(1069,'Thời trang bé gái',1059,NULL),(1070,'Phụ kiện cho bé',1059,NULL),(1071,'Thời trang bé trai',1059,NULL),(1072,'Thời trang bầu',1059,NULL),(1073,'Thời trang sơ sinh',1059,NULL),(1074,'Đồ chơi gỗ',1060,NULL),(1075,'Lắp ghép, Xếp hình',1060,NULL),(1076,'Búp bê, Thú bông',1060,NULL),(1077,'Đồ chơi mô hình',1060,NULL),(1078,'Đồ chơi vận động',1060,NULL),(1079,'Đồ chơi giáo dục',1060,NULL),(1080,'Lều thảm',1060,NULL),(1081,'Boardgame',1060,NULL),(1082,'Cờ',1060,NULL),(1083,'Đồ chơi sơ sinh',1060,NULL),(1084,'Bột nặn, Cát nặn',1060,NULL),(1085,'Đồ chơi thủ công',1060,NULL),(1086,'Trò chơi trí tuệ',1060,NULL),(1087,'Đồ chơi điều khiển',1060,NULL),(1088,'Đồ chơi ảo thuật',1060,NULL),(1089,'Đồ chơi nhạc cụ',1060,NULL),(1090,'Trò chơi dân gian',1060,NULL),(1091,'Đồ dùng phòng ngủ cho bé',1061,NULL),(1092,'Đồ dùng ăn uống cho bé',1061,NULL),(1093,'Đồ dùng vệ sinh cho bé',1061,NULL),(1094,'Đồ dùng đi chơi',1061,NULL),(1095,'Đồ dùng bảo vệ bé',1061,NULL),(1096,'Dụng cụ chăm sóc sức khỏe',1061,NULL),(1097,'Sữa bột cho bé',1062,NULL),(1098,'Vitamins',1062,NULL),(1099,'Thực phẩm chế biến sẵn',1062,NULL),(1100,'Bột ăn dặm',1062,NULL),(1101,'Sữa công thức pha sẵn',1062,NULL),(1102,'Bánh ăn dặm',1062,NULL),(1103,'Trà và Thức uống cho bé',1062,NULL),(1104,'Dầu ăn cho bé',1062,NULL),(1105,'Nước trái cây cho bé',1062,NULL),(1106,'Bánh quy',1062,NULL),(1107,'Tã quần',1063,NULL),(1108,'Tã dán',1063,NULL),(1109,'Khăn giấy ướt cho bé',1063,NULL),(1110,'Tã vải',1063,NULL),(1111,'Tã giấy',1063,NULL),(1112,'Tã bỉm dành cho người lớn',1063,NULL),(1113,'Miếng lót sơ sinh',1063,NULL),(1114,'Phụ kiện cho mẹ',1064,NULL),(1115,'Máy hút sữa, Túi trữ sữa',1064,NULL),(1116,'Dung dịch tắm gội, Chăm sóc da',1064,NULL),(1117,'Đai nịt bụng, Quần tạo dáng sau sinh',1064,NULL),(1118,'Phương pháp dân gian',1064,NULL),(1119,'Đai đỡ bụng bầu',1064,NULL),(1120,'Chăm sóc da mặt',267,NULL),(1121,'Trang điểm',267,NULL),(1122,'Chăm sóc cơ thể',267,NULL),(1123,'Thực phẩm chức năng',267,NULL),(1124,'Chăm sóc tóc và da đầu',267,NULL),(1125,'Chăm sóc cá nhân',267,NULL),(1126,'Thiết bị chăm sóc sức khỏe',267,NULL),(1127,'Sản phẩm thiên nhiên',267,NULL),(1128,'Thiết bị làm đẹp',267,NULL),(1129,'Hỗ trợ tình dục',267,NULL),(1130,'Nước hoa',267,NULL),(1131,'Tinh dầu spa',267,NULL),(1132,'Dược mỹ phẩm',267,NULL),(1133,'Bộ sản phẩm làm đẹp',267,NULL),(1134,'Làm sạch da mặt',1120,NULL),(1135,'Mặt nạ',1120,NULL),(1136,'Dưỡng trắng',1120,NULL),(1137,'Dưỡng ẩm',1120,NULL),(1138,'Chống lão hóa',1120,NULL),(1139,'Sản phẩm chống nắng và phục hồi sau khi đi nắng',1120,NULL),(1140,'Nước hoa hồng, toner',1120,NULL),(1141,'Sản phẩm trị mụn',1120,NULL),(1142,'Bộ chăm sóc da mặt',1120,NULL),(1143,'Kem dưỡng da & Serum khác',1120,NULL),(1144,'Chăm sóc vùng da mắt',1120,NULL),(1145,'Xịt khoáng',1120,NULL),(1146,'Chăm sóc da chuyên sâu',1120,NULL),(1147,'Sản phẩm chăm sóc da mặt khác',1120,NULL),(1148,'Chăm sóc da nhạy cảm, kích ứng',1120,NULL),(1149,'Máy hút mụn',1120,NULL),(1150,'Dụng cụ trang điểm',1121,NULL),(1151,'Trang điểm môi',1121,NULL),(1152,'Trang điểm mặt',1121,NULL),(1153,'Chăm sóc móng',1121,NULL),(1154,'Trang điểm mắt',1121,NULL),(1155,'Tẩy trang, khăn ướt',1121,NULL),(1156,'Bộ trang điểm',1121,NULL),(1157,'Sữa tắm, xà bông, muối tắm',1122,NULL),(1158,'Dưỡng Thể',1122,NULL),(1159,'Nước rửa tay',1122,NULL),(1160,'Sản phẩm khử mùi',1122,NULL),(1161,'Tẩy tế bào chết, massage',1122,NULL),(1162,'Sản phẩm chăm sóc cơ thể khác',1122,NULL),(1163,'Sản phẩm dưỡng tay, chân',1122,NULL),(1164,'Sản phẩm chống nắng',1122,NULL),(1165,'Sản phẩm tẩy lông',1122,NULL),(1166,'Massage toàn thân',1122,NULL),(1167,'Bộ chăm sóc toàn thân',1122,NULL),(1168,'Kem tan mỡ',1122,NULL),(1169,'Trị rạn nứt da',1122,NULL),(1170,'Chăm sóc ngực',1122,NULL),(1171,'Thực phẩm chức năng sức khỏe',1123,NULL),(1172,'Thực phẩm chức năng thiên nhiên',1123,NULL),(1173,'Thực phẩm chức năng làm đẹp',1123,NULL),(1174,'Kiểm soát cân nặng',1123,NULL),(1175,'Dầu gội, dầu xả',1124,NULL),(1176,'Dưỡng tóc, ủ tóc',1124,NULL),(1177,'Lược, băng đô',1124,NULL),(1178,'Tạo kiểu tóc',1124,NULL),(1179,'Thuốc nhuộm tóc',1124,NULL),(1180,'Bộ chăm sóc tóc',1124,NULL),(1181,'Thuốc duỗi, uốn',1124,NULL),(1182,'Lô quấn tóc',1124,NULL),(1183,'Chăm sóc răng miệng',1125,NULL),(1184,'Sản phẩm chăm sóc cá nhân',1125,NULL),(1185,'Dụng cụ cạo râu',1125,NULL),(1186,'Dung dịch vệ sinh nam nữ',1125,NULL),(1187,'Sản phẩm chăm sóc cá nhân khác',1125,NULL),(1188,'Thiết bị chăm sóc răng',1125,NULL),(1189,'Băng keo cá nhân',1125,NULL),(1190,'Chăm sóc mắt',1125,NULL),(1191,'Thiết bị khác',1126,NULL),(1192,'Máy massage toàn thân',1126,NULL),(1193,'Dụng cụ theo dõi sức khỏe',1126,NULL),(1194,'Thiết Bị Y Tế',1126,NULL),(1195,'Cân sức khỏe',1126,NULL),(1196,'Túi chườm',1126,NULL),(1197,'Nhiệt kế',1126,NULL),(1198,'Vớ ngăn giãn tĩnh mạch',1126,NULL),(1199,'Máy xông mũi họng',1126,NULL),(1200,'Dụng cụ sơ cứu',1126,NULL),(1201,'Que thử thai',1126,NULL),(1202,'Tinh dầu các loại',1127,NULL),(1203,'Đèn xông hương',1127,NULL),(1204,'Sản phẩm thiên nhiên làm đẹp',1127,NULL),(1205,'Nến thơm',1127,NULL),(1206,'Dụng cụ làm đẹp',1128,NULL),(1207,'Dụng cụ tạo kiểu tóc',1128,NULL),(1208,'Massage thư giãn và làm đẹp',1128,NULL),(1209,'Máy xông da mặt',1128,NULL),(1210,'Dụng cụ tẩy lông',1128,NULL),(1211,'Sản phẩm định hình',1128,NULL),(1212,'Bao cao su',1129,NULL),(1213,'Hỗ trợ tình dục khác',1129,NULL),(1214,'Gel bôi trơn',1129,NULL),(1215,'Nước hoa nữ',1130,NULL),(1216,'Nước hoa nam',1130,NULL),(1217,'Đèn xông tinh dầu',1131,NULL),(1218,'Bộ sản phẩm tinh dầu',1131,NULL),(1219,'Sản phẩm chăm sóc chuyên sâu',1132,NULL),(1220,'Sữa, gel rửa mặt',1132,NULL),(1221,'Dưỡng trắng da',1132,NULL),(1222,'Trị mụn',1132,NULL),(1223,'Chống nắng',1132,NULL),(1224,'Dưỡng ẩm da',1132,NULL),(1225,'Sữa, gel tắm',1132,NULL),(1226,'Dầu gội, xả',1132,NULL),(1227,'Nước hoa hồng, xịt khoáng, nước cân bằng',1132,NULL),(1228,'Chống lão hóa da',1132,NULL),(1229,'Tẩy trang, tẩy tế bào chết',1132,NULL),(1230,'Kem dưỡng vùng mắt',1132,NULL),(1231,'Bộ chăm sóc da mặt',1133,NULL),(1232,'Bộ chăm sóc cơ thể',1133,NULL),(1233,'Bộ trang điểm',1133,NULL),(1234,'Bộ chăm sóc tóc và da đầu',1133,NULL);
/*!40000 ALTER TABLE `danhmuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giatrithuoctinh`
--

DROP TABLE IF EXISTS `giatrithuoctinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giatrithuoctinh` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SanPhamId` int DEFAULT NULL,
  `ThuocTinhId` int DEFAULT NULL,
  `GiaTri` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giatrithuoctinh`
--

LOCK TABLES `giatrithuoctinh` WRITE;
/*!40000 ALTER TABLE `giatrithuoctinh` DISABLE KEYS */;
/*!40000 ALTER TABLE `giatrithuoctinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hangsanxuat`
--

DROP TABLE IF EXISTS `hangsanxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hangsanxuat` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TenHangSX` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hangsanxuat`
--

LOCK TABLES `hangsanxuat` WRITE;
/*!40000 ALTER TABLE `hangsanxuat` DISABLE KEYS */;
INSERT INTO `hangsanxuat` VALUES (1,'Samsung'),(2,'Nokia'),(3,'Vinsmart'),(4,'Apple'),(5,'Lg'),(6,'Sony'),(7,'Philip'),(8,'Panasonic'),(9,'Sharp'),(10,'Xiaomi'),(11,'Huawei'),(12,'Dell'),(13,'Asus'),(14,'Canifa'),(15,'Highland'),(16,'Lenovo'),(17,'Hp'),(18,'Kinh Đô'),(19,'Lotteria'),(20,'Vivo'),(21,'Bphone');
/*!40000 ALTER TABLE `hangsanxuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MaKhachHang` int DEFAULT NULL,
  `NgayTao` date DEFAULT NULL,
  `TinhTrang` int DEFAULT NULL,
  `TongTien` float DEFAULT NULL,
  `NgayCapNhat` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(50) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(10) DEFAULT NULL,
  `DiaChi` varchar(200) DEFAULT NULL,
  `MatKhau` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaisanpham`
--

DROP TABLE IF EXISTS `loaisanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaisanpham` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TenLoai` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaisanpham`
--

LOCK TABLES `loaisanpham` WRITE;
/*!40000 ALTER TABLE `loaisanpham` DISABLE KEYS */;
/*!40000 ALTER TABLE `loaisanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoidung`
--

DROP TABLE IF EXISTS `nguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoidung` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TaiKhoan` varchar(50) DEFAULT NULL,
  `MatKhau` varchar(50) DEFAULT NULL,
  `HoTen` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(10) DEFAULT NULL,
  `VaiTroId` int DEFAULT NULL,
  `Avatar` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoidung`
--

LOCK TABLES `nguoidung` WRITE;
/*!40000 ALTER TABLE `nguoidung` DISABLE KEYS */;
INSERT INTO `nguoidung` VALUES (1,'son','1','Trần Văn Sơn','tranvansonhy@gmail.com','0931444838',0,'img1.jpg'),(2,'admin','1','Trần Văn Sơn','tranvansonhy@gmail.com','0931444838',0,'img2.jpg'),(3,'huyhuyhy','1','Nguyễn Văn Huy','huy@gmail.com','0945234765',0,'img3.jpg'),(11,'toannt','123','Đào Thanh Toàn','toan@gmail.com','0368889679',0,'img4.jpg'),(12,'ha123','123456','Nguyễn Thu Hà','HoangNg1402001@gmail.com','0988234569',0,'img10.jpg');
/*!40000 ALTER TABLE `nguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phanquyen`
--

DROP TABLE IF EXISTS `phanquyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phanquyen` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VaiTroId` int DEFAULT NULL,
  `ChucNangId` int DEFAULT NULL,
  `DanhSach` tinyint(1) DEFAULT NULL,
  `Them` tinyint(1) DEFAULT NULL,
  `Sua` tinyint(1) DEFAULT NULL,
  `Xoa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phanquyen`
--

LOCK TABLES `phanquyen` WRITE;
/*!40000 ALTER TABLE `phanquyen` DISABLE KEYS */;
/*!40000 ALTER TABLE `phanquyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MaSanPham` varchar(20) DEFAULT NULL,
  `TenSanPham` varchar(200) DEFAULT NULL,
  `GiaTien` float DEFAULT NULL,
  `SoLuong` int DEFAULT NULL,
  `MoTa` blob,
  `DanhMucId` int DEFAULT NULL,
  `LoaiSPId` int DEFAULT NULL,
  `HangSXId` int DEFAULT NULL,
  `XuatXuId` int DEFAULT NULL,
  `NgayTao` date DEFAULT NULL,
  `NgayCapNhat` date DEFAULT NULL,
  `NgayXoa` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanphamgiamgia`
--

DROP TABLE IF EXISTS `sanphamgiamgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanphamgiamgia` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SanPhamId` int DEFAULT NULL,
  `GiaGiam` float DEFAULT NULL,
  `ThoiGian` date DEFAULT NULL,
  `NgayThem` date DEFAULT NULL,
  `NgayCapNhat` date DEFAULT NULL,
  `NgayXoa` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanphamgiamgia`
--

LOCK TABLES `sanphamgiamgia` WRITE;
/*!40000 ALTER TABLE `sanphamgiamgia` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanphamgiamgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taikhoan` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TaiKhoan` varchar(50) DEFAULT NULL,
  `MatKhau` varchar(50) DEFAULT NULL,
  `HoTen` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(10) DEFAULT NULL,
  `VaiTroId` int DEFAULT NULL,
  `Avatar` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` VALUES (1,'son','1','Trần Văn Sơn','tranvansonhy@gmail.com','0931444838',0,NULL),(2,'admin','1','admin','admin@gmail.com','0931444838',0,NULL);
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuoctinhsp`
--

DROP TABLE IF EXISTS `thuoctinhsp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoctinhsp` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TenThuocTinh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoctinhsp`
--

LOCK TABLES `thuoctinhsp` WRITE;
/*!40000 ALTER TABLE `thuoctinhsp` DISABLE KEYS */;
/*!40000 ALTER TABLE `thuoctinhsp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinhtrang`
--

DROP TABLE IF EXISTS `tinhtrang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinhtrang` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TenTinhTrang` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinhtrang`
--

LOCK TABLES `tinhtrang` WRITE;
/*!40000 ALTER TABLE `tinhtrang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinhtrang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaitro`
--

DROP TABLE IF EXISTS `vaitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaitro` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MaVaiTro` varchar(10) DEFAULT NULL,
  `TenVaiTro` varchar(50) DEFAULT NULL,
  `MoTa` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaitro`
--

LOCK TABLES `vaitro` WRITE;
/*!40000 ALTER TABLE `vaitro` DISABLE KEYS */;
INSERT INTO `vaitro` VALUES (1,'Ad','Admin','Quyen quan tri cao nhat'),(2,'NV','Nhan vien','Quan ly san pham');
/*!40000 ALTER TABLE `vaitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuatxu`
--

DROP TABLE IF EXISTS `xuatxu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xuatxu` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `XuatXu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuatxu`
--

LOCK TABLES `xuatxu` WRITE;
/*!40000 ALTER TABLE `xuatxu` DISABLE KEYS */;
INSERT INTO `xuatxu` VALUES (1,'Trung Quốc'),(2,'Mỹ'),(3,'Việt Nam'),(4,'Thái Lan'),(5,'Ấn độ'),(6,'Indonesia'),(7,'Đài Loan'),(8,'Malaysia'),(9,'Nhật Bản'),(10,'Hàn Quốc'),(11,'Singapo'),(12,'Anh'),(13,'Pháp'),(14,'Hà Lan'),(15,'Thụy Điển'),(16,'Đức');
/*!40000 ALTER TABLE `xuatxu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-08  9:19:34
