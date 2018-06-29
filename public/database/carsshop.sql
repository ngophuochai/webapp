/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : carsshop

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 29/06/2018 10:41:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('user10', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'Ngô Phước Hải', 'ngophuochai1512138@gmail.com', 'huyện Cai Lậy, tỉnh Tiền Giang');
INSERT INTO `account` VALUES ('admin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'Ngô Chí Hải - Anh Hai', 'kienthucth13@gmail.com', 'Xã Cẩm Sơn, tỉnh Tiền Giang');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ProID` int(255) NOT NULL,
  `ProQuantity` int(11) NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `CheckoutDay` datetime(0) NULL DEFAULT NULL,
  `Status` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (6, 'admin', 1, 1, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-06 11:49:07', 'Đã giao');
INSERT INTO `cart` VALUES (7, 'admin', 1, 1, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-15 11:49:29', 'Đã giao');
INSERT INTO `cart` VALUES (8, 'admin', 1, 1, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-28 11:51:47', 'Đã giao');
INSERT INTO `cart` VALUES (9, 'admin', 2, 1, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-28 12:13:48', 'Đã giao');
INSERT INTO `cart` VALUES (10, 'admin', 2, 1, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-28 13:55:02', 'Đã giao');
INSERT INTO `cart` VALUES (11, 'admin', 2, 1, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-28 13:59:33', 'Đã giao');
INSERT INTO `cart` VALUES (12, 'admin', 3, 1, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-28 14:00:38', 'Đã giao');
INSERT INTO `cart` VALUES (13, 'admin', 3, 2, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-28 14:04:21', 'Đã giao');
INSERT INTO `cart` VALUES (14, 'admin', 3, 2, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-28 14:04:21', 'Đã giao');
INSERT INTO `cart` VALUES (15, 'admin', 3, 1, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-28 14:07:11', 'Đã giao');
INSERT INTO `cart` VALUES (16, 'admin', 2, 3, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-28 14:07:46', 'Đã giao');
INSERT INTO `cart` VALUES (17, 'admin', 2, 1, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-28 18:34:29', 'Đã giao');
INSERT INTO `cart` VALUES (18, 'admin', 2, 1, '231a/13 Dương Bá Trạc, P1, Q8, TP HCM', '2018-06-28 18:35:39', 'Đã giao');
INSERT INTO `cart` VALUES (19, 'admin', 1, 1, '231a/13Dương Bá TrạcP1Q8', '2018-06-28 21:48:26', 'Đã giao');
INSERT INTO `cart` VALUES (20, 'admin', 15, 1, '231a/13Dương Bá TrạcP1Q8', '2018-06-28 21:48:26', 'Đã giao');
INSERT INTO `cart` VALUES (21, 'admin', 2, 1, 'Dia chithanh phoquanxa', '2018-06-28 21:50:19', 'Đã giao');
INSERT INTO `cart` VALUES (22, 'admin', 15, 1, ', , , ', '2018-06-28 21:52:14', 'Đã giao');
INSERT INTO `cart` VALUES (23, 'admin', 15, 1, ', , , ', '2018-06-28 21:52:23', 'Đã giao');
INSERT INTO `cart` VALUES (24, 'admin', 15, 1, ', , , ', '2018-06-28 21:54:44', 'Đã giao');
INSERT INTO `cart` VALUES (25, 'admin', 9, 1, ', , , ', '2018-06-28 22:31:40', 'Đã giao');
INSERT INTO `cart` VALUES (26, 'admin', 1, 1, ', , , ', '2018-06-28 22:44:58', 'Đã giao');
INSERT INTO `cart` VALUES (27, 'admin', 9, 1, ', , , ', '2018-06-28 22:48:55', 'Đã giao');
INSERT INTO `cart` VALUES (28, 'admin', 1, 1, ', , , ', '2018-06-28 22:49:30', 'Đã giao');
INSERT INTO `cart` VALUES (29, 'admin', 9, 1, ', , , ', '2018-06-28 22:58:47', 'Đã giao');
INSERT INTO `cart` VALUES (30, 'admin', 1, 1, ', , , ', '2018-06-28 22:58:57', 'Đã giao');
INSERT INTO `cart` VALUES (31, 'admin', 2, 2, ', , , ', '2018-06-28 23:00:01', 'Đã giao');
INSERT INTO `cart` VALUES (32, 'admin', 3, 2, ', , , ', '2018-06-28 23:03:15', 'Đã giao');
INSERT INTO `cart` VALUES (33, 'admin', 1, 2, ', , , ', '2018-06-28 23:08:26', 'Đã giao');
INSERT INTO `cart` VALUES (34, 'admin', 2, 2, ', , , ', '2018-06-28 23:08:55', 'Đã giao');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Sedan');
INSERT INTO `category` VALUES (2, 'SUV');
INSERT INTO `category` VALUES (3, 'Luxury');
INSERT INTO `category` VALUES (4, 'Coupe');

-- ----------------------------
-- Table structure for producer
-- ----------------------------
DROP TABLE IF EXISTS `producer`;
CREATE TABLE `producer`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of producer
-- ----------------------------
INSERT INTO `producer` VALUES (1, 'Hyundai');
INSERT INTO `producer` VALUES (2, 'Lexus');
INSERT INTO `producer` VALUES (3, 'Toyota');
INSERT INTO `producer` VALUES (4, 'Mitsubishi');
INSERT INTO `producer` VALUES (5, 'Suzuki');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Category` int(255) NULL DEFAULT NULL,
  `Producer` int(255) NULL DEFAULT NULL,
  `Infor` varchar(2550) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Views` int(11) NULL DEFAULT NULL,
  `Quantity` int(11) NULL DEFAULT NULL,
  `QuantitySold` int(11) NULL DEFAULT NULL,
  `Country` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Price` decimal(10, 2) NULL DEFAULT NULL,
  `InputDay` date NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Hyundai Elantra GLS', 1, 1, 'The Hyundai Accent is available as a sedan and a hatchback. The 2018 Accent starts at $14,995 (MSRP), with a destination charge of $885. It gets EPA-estimated 31-32 MPG combined.', 11, 5, 7, 'South Korea', 23000000.00, '2018-06-12');
INSERT INTO `products` VALUES (2, 'Hyundai Elantra Limited', 1, 1, 'The Elantra was initially marketed as the Lantra in Australia and some European markets. In Australia, this was due to the similarly named Mitsubishi Magna Elante model.[1] This gave rise to disagreement with other motor manufacturers, and the name was standardized as \"Elantra\" worldwide in 2001 (except in Korea)', 11, 4, 5, 'South Korea', 23000000.00, '2018-06-22');
INSERT INTO `products` VALUES (3, 'Hyundai Sonata Limited 2.0T', 1, 1, 'The Elantra was initially marketed as the Lantra in Australia and some European markets. In Australia, this was due to the similarly named Mitsubishi Magna Elante model.[1] This gave rise to disagreement with other motor manufacturers, and the name was standardized as \"Elantra\" worldwide in 2001 (except in Korea)', 1, 3, 4, 'South Korea', 23000000.00, '2018-06-06');
INSERT INTO `products` VALUES (4, 'Hyundai Tucson Limited', 1, 1, 'The Elantra was initially marketed as the Lantra in Australia and some European markets. In Australia, this was due to the similarly named Mitsubishi Magna Elante model.[1] This gave rise to disagreement with other motor manufacturers, and the name was standardized as \"Elantra\" worldwide in 2001 (except in Korea)', 1, 5, 3, 'South Korea', 23000000.00, '2018-05-29');
INSERT INTO `products` VALUES (5, 'Hyundai Veloster Base', 1, 1, 'The Elantra was initially marketed as the Lantra in Australia and some European markets. In Australia, this was due to the similarly named Mitsubishi Magna Elante model.[1] This gave rise to disagreement with other motor manufacturers, and the name was standardized as \"Elantra\" worldwide in 2001 (except in Korea)', 11, 1, 5, 'South Korea', 23000000.00, '2018-06-12');
INSERT INTO `products` VALUES (6, 'Lexus CT 200h Base', 1, 2, 'Production began at the end of December 2010 and European sales following shortly after.[10] Japan sales began in 12 January 2011,[11] while US sales began in March 2011.[12] The CT has been discontinued in the US, with the 2017 model year being the last.[13]', 11, 3, 6, 'Japan', 23000000.00, '2018-06-11');
INSERT INTO `products` VALUES (7, 'Lexus ES 330', 1, 2, 'Production began at the end of December 2010 and European sales following shortly after.[10] Japan sales began in 12 January 2011,[11] while US sales began in March 2011.[12] The CT has been discontinued in the US, with the 2017 model year being the last.[13]', 11, 3, 4, 'Japan', 23000000.00, '2018-06-02');
INSERT INTO `products` VALUES (8, 'Lexus IS 250 Base', 1, 2, 'Production began at the end of December 2010 and European sales following shortly after.[10] Japan sales began in 12 January 2011,[11] while US sales began in March 2011.[12] The CT has been discontinued in the US, with the 2017 model year being the last.[13]', 1, 4, 3, 'Japan', 23000000.00, '2018-06-01');
INSERT INTO `products` VALUES (9, 'Lexus IS-F Base', 1, 2, 'Production began at the end of December 2010 and European sales following shortly after.[10] Japan sales began in 12 January 2011,[11] while US sales began in March 2011.[12] The CT has been discontinued in the US, with the 2017 model year being the last.[13]', 1, 0, 2, 'Japan', 23000000.00, '2018-06-12');
INSERT INTO `products` VALUES (10, 'Lexus LC 500', 1, 2, 'Production began at the end of December 2010 and European sales following shortly after.[10] Japan sales began in 12 January 2011,[11] while US sales began in March 2011.[12] The CT has been discontinued in the US, with the 2017 model year being the last.[13]', 11, 3, 1, 'Japan', 23000000.00, '2018-06-05');
INSERT INTO `products` VALUES (11, 'Toyota Camry CE', 1, 3, 'Between 1979 and 1982, the Camry nameplate was delegated to a four-door sedan model in Japan, known as the Celica Camry. When Camry became an independent model line in 1982 with the V10 series, Toyota made it available as a five-door liftback in addition to the sedan', 11, 2, 2, 'Japan', 23000000.00, '2018-06-04');
INSERT INTO `products` VALUES (12, 'Toyota 4Runner TRD Pro', 1, 3, 'Between 1979 and 1982, the Camry nameplate was delegated to a four-door sedan model in Japan, known as the Celica Camry. When Camry became an independent model line in 1982 with the V10 series, Toyota made it available as a five-door liftback in addition to the sedan', 2, 3, 2, 'Japan', 23000000.00, '2018-05-27');
INSERT INTO `products` VALUES (13, 'Toyota Camry LE', 1, 3, 'Between 1979 and 1982, the Camry nameplate was delegated to a four-door sedan model in Japan, known as the Celica Camry. When Camry became an independent model line in 1982 with the V10 series, Toyota made it available as a five-door liftback in addition to the sedan', 32, 4, 1, 'Japan', 23000000.00, '2018-05-28');
INSERT INTO `products` VALUES (14, 'Toyota Celica ST', 1, 3, 'Between 1979 and 1982, the Camry nameplate was delegated to a four-door sedan model in Japan, known as the Celica Camry. When Camry became an independent model line in 1982 with the V10 series, Toyota made it available as a five-door liftback in addition to the sedan', 4, 3, 4, 'Japan', 23000000.00, '2018-05-30');
INSERT INTO `products` VALUES (15, 'Toyota Highlander Limited', 1, 3, 'Between 1979 and 1982, the Camry nameplate was delegated to a four-door sedan model in Japan, known as the Celica Camry. When Camry became an independent model line in 1982 with the V10 series, Toyota made it available as a five-door liftback in addition to the sedan', 2, 5, 5, 'Japan', 23000000.00, '2018-06-12');
INSERT INTO `products` VALUES (16, 'Honda Civic', 1, 2, 'Between 1979 and 1982, the Camry nameplate was delegated to a four-door sedan model in Japan, known as the Celica Camry. When Camry became an independent model line in 1982 with the V10 series, Toyota made it available as a five-door liftback in addition to the sedan', 4, 3, 3, 'South Korea', 34000000.00, '2018-06-20');
INSERT INTO `products` VALUES (17, 'Toyota Camry', 1, 4, 'Between 1979 and 1982, the Camry nameplate was delegated to a four-door sedan model in Japan, known as the Celica Camry. When Camry became an independent model line in 1982 with the V10 series, Toyota made it available as a five-door liftback in addition to the sedan', 3, 11, 12, 'South Korea', 12999999.00, '2018-06-29');
INSERT INTO `products` VALUES (18, 'Dodge Charger', 1, 5, 'The Dodge Charger is a full-size sedan that\'s available with rear- or all-wheel drive. It has standard V-6 power and offers a choice of V-8 engines including a supercharged V-8 in the SRT Hellcat model that makes 707 horsepower. Competitors include the Nissan Maxima, Chevrolet Impala and Ford Taurus.', 2, 12, 7, 'South Korea', 12333333.00, '2018-07-03');
INSERT INTO `products` VALUES (19, 'Kia Stinger', 2, 5, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 3, 3, 5, 'South Korea', 99999999.00, '2018-06-13');
INSERT INTO `products` VALUES (20, ' Hyundai Elantra', 2, 2, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 5, 4, 6, 'South Korea', 99999999.00, '2018-06-27');
INSERT INTO `products` VALUES (21, 'Volkswagen Passat', 2, 2, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 6, 6, 5, 'South Korea', 99999999.00, '2018-06-04');
INSERT INTO `products` VALUES (22, 'BMW M3', 2, 2, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 8, 8, 5, 'South Korea', 99999999.00, '2018-06-11');
INSERT INTO `products` VALUES (23, ' Audi A4', 2, 4, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 2, 9, 9, 'South Korea', 99999999.00, '2018-06-08');
INSERT INTO `products` VALUES (24, 'Acura TLX', 2, 4, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 12, 6, 8, 'South Korea', 99999999.00, '2018-06-18');
INSERT INTO `products` VALUES (25, 'Subaru WRX', 2, 4, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 4, 7, 6, 'South Korea', 99999999.00, '2018-06-23');
INSERT INTO `products` VALUES (26, 'Chevrolet Malibu', 2, 4, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 6, 8, 2, 'South Korea', 99999999.00, '2018-06-20');
INSERT INTO `products` VALUES (27, 'Audi S5', 2, 4, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 9, 6, 4, 'South Korea', 99999999.00, '2018-06-18');
INSERT INTO `products` VALUES (28, 'INFINITI Q50', 2, 4, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 8, 7, 6, 'South Korea', 99999999.00, '2018-06-20');
INSERT INTO `products` VALUES (29, 'Chevrolet Cruze', 2, 4, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 3, 8, 7, 'South Korea', 99999999.00, '2018-06-10');
INSERT INTO `products` VALUES (30, 'Nissan Altima', 2, 4, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 3, 4, 6, 'South Korea', 99999999.00, '2018-06-12');
INSERT INTO `products` VALUES (31, 'Chrysler 300', 3, 4, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 4, 6, 45, 'South Korea', 99999999.00, '2018-06-23');
INSERT INTO `products` VALUES (32, 'Hyundai Sonata', 3, 4, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 5, 5, 34, 'South Korea', 99999999.00, '2018-06-23');
INSERT INTO `products` VALUES (33, 'Chevrolet Impala', 3, 4, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 6, 7, 4, 'South Korea', 99999999.00, '2018-06-21');
INSERT INTO `products` VALUES (34, 'Alfa Romeo Giulia', 3, 5, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 3, 8, 6, 'South Korea', 99999999.00, '2018-06-25');
INSERT INTO `products` VALUES (35, 'BMW M5', 3, 5, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 2, 5, 7, 'South Korea', 99999999.00, '2018-06-13');
INSERT INTO `products` VALUES (36, 'Ford Focus', 3, 5, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 4, 6, 5, 'South Korea', 99999999.00, '2018-06-11');
INSERT INTO `products` VALUES (37, 'Mazda Mazda3', 4, 5, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 3, 7, 6, 'South Korea', 99999999.00, '2018-06-07');
INSERT INTO `products` VALUES (38, 'Toyota Corolla', 4, 3, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 5, 8, 5, 'South Korea', 99999999.00, '2018-06-04');
INSERT INTO `products` VALUES (39, 'Ford Fusion', 4, 3, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 6, 5, 4, 'South Korea', 99999999.00, '2018-06-05');
INSERT INTO `products` VALUES (40, 'Subaru WRX STI', 4, 5, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 1, 6, 3, 'South Korea', 99999999.00, '2018-06-03');
INSERT INTO `products` VALUES (41, 'Kia Optima', 4, 1, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 2, 7, 5, 'South Korea', 99999999.00, '2018-06-04');
INSERT INTO `products` VALUES (42, 'Mazda Mazda6', 4, 1, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 3, 4, 5, 'South Korea', 99999999.00, '2018-06-22');
INSERT INTO `products` VALUES (43, 'Mercedes-Benz AMG E 63', 3, 1, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 3, 4, 5, 'South Korea', 99999999.00, '2018-06-20');
INSERT INTO `products` VALUES (44, 'Mercedes-Benz AMG C 63', 3, 5, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 5, 4, 5, 'South Korea', 99999999.00, '2018-06-17');
INSERT INTO `products` VALUES (45, 'Nissan Maxima', 3, 5, 'Hyundai redesigned its Elantra compact sedan last year with structural enhancements and new styling inside and out, as well as new powertrains, safety features and technology. Elantra competitors include the Chevrolet Cruze, Ford Focus, Honda Civic, Mazda3, Nissan Sentra and Toyota Corolla. The Elantra GT four-door hatchback is covered separately in the Cars.com Research section.', 3, 4, 5, 'South Korea', 99999999.00, '2018-06-18');

SET FOREIGN_KEY_CHECKS = 1;
