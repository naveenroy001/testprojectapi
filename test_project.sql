-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6333
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for test_project
CREATE DATABASE IF NOT EXISTS `test_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `test_project`;

-- Dumping structure for table test_project.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table test_project.cities: ~10 rows (approximately)
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`id`, `name`) VALUES
	(1, 'Mumbai'),
	(2, 'Delhi'),
	(3, 'Bangalore'),
	(4, 'Hyderabad'),
	(5, 'Ahmedabad'),
	(6, 'Chennai'),
	(7, 'Kolkata'),
	(8, 'Nagpur'),
	(9, 'Raipur'),
	(10, 'Bhopal');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;

-- Dumping structure for table test_project.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table test_project.password_resets: ~4 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
	(1, 'somanray@gmail.com', 'NfjkrGektoQxfoIMv6nqqFxh00Lod6Lw3ikN7W0tGwm8uyGGCA2lzr0CxnoEbbKWNU7BrqyrSSyU90RxZ32KzPZZO7qGSYv5Egau', '2021-10-21 05:02:22'),
	(2, 'somanray@gmail.com', 'hcIcSVswvoCX4YkWy5yObWFHYQeJG03hAspxubIaXDD4kqGiMJvGhRL9PLlhEZtWSSfhEkw3xoesnI4watsF4pr5UTgYVknFBhRd', '2021-10-21 05:14:42'),
	(3, 'somanray@gmail.com', 'MWMCfBFqoZIaNsYX9b8EyFf442LGZvmeTjMCySkZiGbOnHywBvAk3fDqsNqIzguQb7GWwRoQGclzYEUYHHV2mP37yIOgtvbQtZSA', '2021-10-21 06:59:08'),
	(7, 'somanray@gmail.com', '7h9JHDa9R7POEBBy6ZFD31OeED6flkGbrhcBpR684cgljernQhKkmVoz5vNUgb4dGhBdKM5YF4jiZmc24zjzD4UTh2B6QO8pRdDE', '2021-10-21 08:04:22'),
	(8, 'somanray@gmail.com', 'ugiq2gaKTEaROGbLi0p01Tbjog2sv7scokzT3IyJlkqpriUGcBoCQJnjBVwtA8HOeRyTT84npBQ5MAKcI4TcJj6DMCkewkFyGuwK', '2021-10-21 09:50:47'),
	(9, 'somanray@gmail.com', 'SbtxA0V6yC1pSKnMiX3v1QArsmdrIUuyN8Uh2dMQDysYSxbZMPV2dvUBj15ddhDE1hFnpoB9jmJlLIAxJccPnhCwbbXgVVZ12RoN', '2021-10-21 09:52:51'),
	(10, 'somanray@gmail.com', '6evabMsEPPZjD0X4irLHxEeoiVGe258Ft1WT6yMAMbt43S4lbqOxMOg5110fj12Hityx3orZrIllQpW1hxOJLAMu6zgK0mW3m4TZ', '2021-10-21 09:54:01'),
	(11, 'somanray@gmail.com', 'JzXrAqz0J8WXH1g0ioUJkRwpflKCCXlkFKSVTPJb8kQ8Z3pbJcJYGTgP4Kf2BSyufX2oFI1omgNnUNfpqA0JjE54h77q9Cl2oYs4', '2021-10-21 09:54:26'),
	(12, 'somanray@gmail.com', 'MnzkINnqTg3z6DfBtz3LJ2V7nxv2Itf0zGuUec5QI98GwIkIbxqGYFUaWC4tyRPLBVeZwWOqAhOrlP1iWuPsxLGYSgfwkBVIHMrC', '2021-10-21 09:55:20'),
	(13, 'somanray@gmail.com', 'OAxYUbNUXc8gXBnIa3yNal8gje36DsBrfOv8czLcdLVwbhuziAT8tWrwlzOWmboPvV8PsqzawZGzc3xkrk5qe1ZIXpnEG6nOb1ow', '2021-10-21 09:55:59'),
	(14, 'somanray@gmail.com', '4JQ52hE7GcZoROQ5f9rgLNlU6fId1UR5TofrEmHCOqayhaTTTrhwMVVlb8Uw4dPt6z1XOwa24lpLpCU3IHgNo2Y9PxW4PzlUoYab', '2021-10-21 10:25:39'),
	(15, 'somanray@gmail.com', 'ONnNuFQorXXSdxyb5nJyMGbctKc5N3MpQycjUXszURVZShcK8i1SgL3XWVYeq7TFzHp6njzzNCDMKn1OeL6nUaRVIebQq5S912AU', '2021-10-21 10:27:04'),
	(16, 'somanray@gmail.com', 'SxyvTe026HMYZbjueRuWtJBQiXt8jED0woE4Cu6zIPIF1CM6fXBnJk8E5LYc2GSKNGXI7ye8kVF9gyYYrmNQrzWZ7gApE6oEdQjL', '2021-10-21 10:28:30'),
	(17, 'somanray@gmail.com', '7CmtytSSnG2XzTXG0I1MoJ5QHhH0V8T14yxFTSCsbSI9Y8T3INsI9XlaUXrSRArGlvEGYlnN9IjsWm8sLaig6xvyBrsPQPcsZNaE', '2021-10-21 10:33:32'),
	(18, 'somanray@gmail.com', 'NNZHd2CKXVNYi7wMPoeSX828xaphHW0frjvaqmplCHai1xTujI2Q15dLwNTf0nG4Mu6cSVyx3X8rBjGB2Ua4ghLXCY63TnyvEu6K', '2021-10-21 10:34:02'),
	(19, 'somanray@gmail.com', 'vQahmBq88SGwy5cnsEWessFnwf5P8OPH2vNyyxgOzvO7XdHSIGGHHuNHdOMRTfxhG8TcyMHujSnSWqX8pvkUdFdZZhJTbrK5KDCk', '2021-10-21 10:34:44'),
	(20, 'naveenroy001@gmail.com', 'zd5L208gd4Rg9Ofjs03Tvz4LdgMc88gOsqA2l8EPJrd2aVai4jMdypnrYQko2lDggPs1EpF9axAfzJnopuqGtDTdNy4GywZTXqwK', '2021-10-21 10:35:37'),
	(21, 'naveenroy001@gmail.com', 'GtnaFUDmpQPKFpASmK3azfBYhMFKCCzaJ5fOlrgG5OemednqsKWV3VRFugDE0xfmXtQ22TECcIHrUTbvNCBHZfWF1ULxyVU47WJP', '2021-10-21 10:37:18'),
	(22, 'naveenroy001@gmail.com', 'WDmsJRSFUztodk5BKayVQhoXxMUIoIQCcAb2toT73Bnh0VbOnLwMquQPsaJPpyOrU2zpSsoqFESfgJEDNXu27FFpYvDxDBEpY9Tw', '2021-10-21 10:39:20'),
	(23, 'naveenroy001@gmail.com', '1TC5nTM59fXIGpNvFd9ESAGmEmZ6atWhgvKgnHixfCzZUwRfsPK7fxswtdrLXJyKDAj3576x852gTrjjksuWn0EsslkcoPiJXGyi', '2021-10-21 10:41:50'),
	(24, 'naveenroy001@gmail.com', 'ybrCcCRoYojhz8VfzNIc1IWPzoHYBMnrPp3vnwOrmWIqf8tCBk1t6AkO0LMCRADAhP8TtliajroinwDsyw6qx94VCfYFUcg96Vm9', '2021-10-21 10:42:46'),
	(25, 'naveenroy001@gmail.com', 'wSGHnPg8RaVPUxICTztmfFdWzSsHYFXcSpuuBao41eOTlCHvLvstNH8lWLqJcKQhRBguxz3ZRBbgx0r6Z9OmIFlYm3NPrcOcA2pA', '2021-10-21 10:43:12'),
	(26, 'naveenroy001@gmail.com', 'OljRCuv2mCIFUS8yD3YqK7U4wW3zEswO4VcaWuYGQ3LchsmywIK2ablWozPHKmnUbumRww9yJRDVpJnaX0DrefkQr8DSV84kNB0a', '2021-10-21 10:43:13'),
	(27, 'naveenroy001@gmail.com', 'qMhkY4uNBUx3abvl64kfvy0fvVZXU1i8fTgcVO50ngL2S9ys09UFV4pB4VWEDy74PBxsgT4gQwSTdxsYlxcnm3kJaWQNsi9i2IDp', '2021-10-21 10:43:13'),
	(28, 'naveenroy001@gmail.com', 'xl3iqLr6QfnzZiyroDEz7ZCZg5ZwcnFiSYpl5JkEdANNgsDuhvvsuDDDwK2cIPKFGAX9uyMjyHFEVxcnUke9XEgwHFdqvcWl20sh', '2021-10-21 10:46:29'),
	(29, 'naveenroy001@gmail.com', 'dgkrgjwNU76Byaa3IJm2bhoWgeU3zO6n2peLHNG1yyuidmD05qavyEi68jy2gveAgmAtxnZ71nD1SMDstRJMNYBhNyFHw1OoqRvb', '2021-10-21 10:47:43'),
	(30, 'naveenroy001@gmail.com', 'sFhaGaE5gvHNHDXcQmnA0ZRlzPqljyTVkRMkEEVxLSgbKPhUTXpr3w2dFL4CjBqZHenaTIZQ8I7qbaoPovVZRDyjMEUHZMCCCL7R', '2021-10-21 10:49:31');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table test_project.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `revenue` double DEFAULT NULL,
  `target_revenue` double DEFAULT NULL,
  `city_id` int(3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table test_project.products: ~5 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `product_name`, `user_id`, `revenue`, `target_revenue`, `city_id`, `created_at`, `updated_at`) VALUES
	(1, 'Colgete', 1, 50000000, 90000000, 1, '2021-10-20 07:32:06', '2021-10-20 08:17:14'),
	(2, 'Britania', 1, 70000000, 75121210, 2, '2021-10-20 07:32:06', '2021-10-20 08:23:07'),
	(3, 'Parle G', 1, 54212200, 64551212, 6, '2021-10-20 07:33:34', '2021-10-20 08:23:10'),
	(4, 'Maggi', 1, 65884555, 85416516, 5, '2021-10-20 07:34:13', '2021-10-20 08:23:12'),
	(5, 'Dettol', 1, 84541212, 100154500, 7, '2021-10-20 07:34:49', '2021-10-20 08:23:14');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table test_project.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `gst_no` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table test_project.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `company_name`, `gst_no`, `created_at`, `updated_at`, `is_active`) VALUES
	(1, 'Naveen Roy', 'naveenroy', '$2a$10$h4zfGT94itpWbGh7aZoNIOFa6reJcx03ePZnsJQrFWNmMEI1oNvmW', 'somanray@gmail.com', 'Wipro', 'DF4564', '2021-10-20 06:51:06', '2021-10-21 08:38:20', 1),
	(25, 'Test', 'test1', '$2a$10$tAp/vP/QcI8Sb727vh27kO6595h/QgLmFUyAsCAOZ60JdlMs47lpC', 'naveenroy001@gmail.com', 'asdkfjasdlk', 'alkdsjfkladsf', '2021-10-20 12:30:37', '2021-10-20 12:30:37', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
