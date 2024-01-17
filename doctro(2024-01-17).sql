/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : doctro

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 17/01/2024 03:25:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointment_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(11, 2) NOT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointment_for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `report_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `drug_effect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `payment_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `appointment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `illness_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_commission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `admin_commission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cancel_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancel_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `discount_id` int(11) NULL DEFAULT NULL,
  `discount_price` int(11) NULL DEFAULT NULL,
  `hospital_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `is_from` tinyint(1) NULL DEFAULT NULL,
  `zoom_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_doctorId`(`doctor_id`) USING BTREE,
  INDEX `fk_userId`(`user_id`) USING BTREE,
  INDEX `hospital_id`(`hospital_id`) USING BTREE,
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_doctorId` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userId` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, 'Skin care', '63e38df8131a0.png', '#', 1, '2021-05-05 13:14:57', '2023-02-28 18:45:56');
INSERT INTO `banner` VALUES (2, 'Family care', '63e38e055a4e9.png', '#', 1, '2021-05-05 14:03:01', '2023-02-28 18:45:50');
INSERT INTO `banner` VALUES (3, 'Baby Care', '63e38e0debd93.png', '#', 1, '2021-05-05 14:03:49', '2023-02-28 18:45:42');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_ref` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `release_now` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `treatment_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_name_unique`(`name`) USING BTREE,
  INDEX `fk_treatment_id`(`treatment_id`) USING BTREE,
  CONSTRAINT `fk_treatment_id` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Dentist', '65a5e96f9c1a2.png', 2, 1, '2024-01-16 07:56:55', '2024-01-16 07:58:15');
INSERT INTO `category` VALUES (2, 'Cardiologist', '65a5e984b4f47.png', 3, 1, '2024-01-16 07:57:16', '2024-01-16 07:58:14');
INSERT INTO `category` VALUES (3, 'Orthopedic', '65a5e993b5007.png', 2, 1, '2024-01-16 07:57:31', '2024-01-16 07:58:13');
INSERT INTO `category` VALUES (4, 'Neurology', '65a5e9a4a83b5.png', 1, 1, '2024-01-16 07:57:48', '2024-01-16 07:58:13');
INSERT INTO `category` VALUES (5, 'Urology', '65a5e9b5e2ea6.png', 1, 1, '2024-01-16 07:58:05', '2024-01-16 07:58:12');

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nicename` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `numcode` smallint(6) NULL DEFAULT NULL,
  `phonecode` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 240 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES (1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93);
INSERT INTO `country` VALUES (2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355);
INSERT INTO `country` VALUES (3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213);
INSERT INTO `country` VALUES (4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684);
INSERT INTO `country` VALUES (5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376);
INSERT INTO `country` VALUES (6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244);
INSERT INTO `country` VALUES (7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264);
INSERT INTO `country` VALUES (8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0);
INSERT INTO `country` VALUES (9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268);
INSERT INTO `country` VALUES (10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54);
INSERT INTO `country` VALUES (11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374);
INSERT INTO `country` VALUES (12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297);
INSERT INTO `country` VALUES (13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61);
INSERT INTO `country` VALUES (14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43);
INSERT INTO `country` VALUES (15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994);
INSERT INTO `country` VALUES (16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242);
INSERT INTO `country` VALUES (17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973);
INSERT INTO `country` VALUES (18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880);
INSERT INTO `country` VALUES (19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246);
INSERT INTO `country` VALUES (20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375);
INSERT INTO `country` VALUES (21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32);
INSERT INTO `country` VALUES (22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501);
INSERT INTO `country` VALUES (23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229);
INSERT INTO `country` VALUES (24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441);
INSERT INTO `country` VALUES (25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975);
INSERT INTO `country` VALUES (26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591);
INSERT INTO `country` VALUES (27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387);
INSERT INTO `country` VALUES (28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267);
INSERT INTO `country` VALUES (29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0);
INSERT INTO `country` VALUES (30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55);
INSERT INTO `country` VALUES (31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246);
INSERT INTO `country` VALUES (32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673);
INSERT INTO `country` VALUES (33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359);
INSERT INTO `country` VALUES (34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226);
INSERT INTO `country` VALUES (35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257);
INSERT INTO `country` VALUES (36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855);
INSERT INTO `country` VALUES (37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237);
INSERT INTO `country` VALUES (38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1);
INSERT INTO `country` VALUES (39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238);
INSERT INTO `country` VALUES (40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345);
INSERT INTO `country` VALUES (41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236);
INSERT INTO `country` VALUES (42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235);
INSERT INTO `country` VALUES (43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56);
INSERT INTO `country` VALUES (44, 'CN', 'CHINA', 'China', 'CHN', 156, 86);
INSERT INTO `country` VALUES (45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61);
INSERT INTO `country` VALUES (46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672);
INSERT INTO `country` VALUES (47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57);
INSERT INTO `country` VALUES (48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269);
INSERT INTO `country` VALUES (49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242);
INSERT INTO `country` VALUES (50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242);
INSERT INTO `country` VALUES (51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682);
INSERT INTO `country` VALUES (52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506);
INSERT INTO `country` VALUES (53, 'CI', 'COTE DIVOIRE', 'Cote DIvoire', 'CIV', 384, 225);
INSERT INTO `country` VALUES (54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385);
INSERT INTO `country` VALUES (55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53);
INSERT INTO `country` VALUES (56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357);
INSERT INTO `country` VALUES (57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420);
INSERT INTO `country` VALUES (58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45);
INSERT INTO `country` VALUES (59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253);
INSERT INTO `country` VALUES (60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767);
INSERT INTO `country` VALUES (61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809);
INSERT INTO `country` VALUES (62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593);
INSERT INTO `country` VALUES (63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20);
INSERT INTO `country` VALUES (64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503);
INSERT INTO `country` VALUES (65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240);
INSERT INTO `country` VALUES (66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291);
INSERT INTO `country` VALUES (67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372);
INSERT INTO `country` VALUES (68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251);
INSERT INTO `country` VALUES (69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500);
INSERT INTO `country` VALUES (70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298);
INSERT INTO `country` VALUES (71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679);
INSERT INTO `country` VALUES (72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358);
INSERT INTO `country` VALUES (73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33);
INSERT INTO `country` VALUES (74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594);
INSERT INTO `country` VALUES (75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689);
INSERT INTO `country` VALUES (76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0);
INSERT INTO `country` VALUES (77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241);
INSERT INTO `country` VALUES (78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220);
INSERT INTO `country` VALUES (79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995);
INSERT INTO `country` VALUES (80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49);
INSERT INTO `country` VALUES (81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233);
INSERT INTO `country` VALUES (82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350);
INSERT INTO `country` VALUES (83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30);
INSERT INTO `country` VALUES (84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299);
INSERT INTO `country` VALUES (85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473);
INSERT INTO `country` VALUES (86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590);
INSERT INTO `country` VALUES (87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671);
INSERT INTO `country` VALUES (88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502);
INSERT INTO `country` VALUES (89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224);
INSERT INTO `country` VALUES (90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245);
INSERT INTO `country` VALUES (91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592);
INSERT INTO `country` VALUES (92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509);
INSERT INTO `country` VALUES (93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0);
INSERT INTO `country` VALUES (94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39);
INSERT INTO `country` VALUES (95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504);
INSERT INTO `country` VALUES (96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852);
INSERT INTO `country` VALUES (97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36);
INSERT INTO `country` VALUES (98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354);
INSERT INTO `country` VALUES (99, 'IN', 'INDIA', 'India', 'IND', 356, 91);
INSERT INTO `country` VALUES (100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62);
INSERT INTO `country` VALUES (101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98);
INSERT INTO `country` VALUES (102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964);
INSERT INTO `country` VALUES (103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353);
INSERT INTO `country` VALUES (104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972);
INSERT INTO `country` VALUES (105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39);
INSERT INTO `country` VALUES (106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876);
INSERT INTO `country` VALUES (107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81);
INSERT INTO `country` VALUES (108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962);
INSERT INTO `country` VALUES (109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7);
INSERT INTO `country` VALUES (110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254);
INSERT INTO `country` VALUES (111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686);
INSERT INTO `country` VALUES (112, 'KP', 'KOREA, DEMOCRATIC PEOPLES REPUBLIC OF', 'Korea, Democratic Peoples Republic of', 'PRK', 408, 850);
INSERT INTO `country` VALUES (113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82);
INSERT INTO `country` VALUES (114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965);
INSERT INTO `country` VALUES (115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996);
INSERT INTO `country` VALUES (116, 'LA', 'LAO PEOPLES DEMOCRATIC REPUBLIC', 'Lao Peoples Democratic Republic', 'LAO', 418, 856);
INSERT INTO `country` VALUES (117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371);
INSERT INTO `country` VALUES (118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961);
INSERT INTO `country` VALUES (119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266);
INSERT INTO `country` VALUES (120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231);
INSERT INTO `country` VALUES (121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218);
INSERT INTO `country` VALUES (122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423);
INSERT INTO `country` VALUES (123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370);
INSERT INTO `country` VALUES (124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352);
INSERT INTO `country` VALUES (125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853);
INSERT INTO `country` VALUES (126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389);
INSERT INTO `country` VALUES (127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261);
INSERT INTO `country` VALUES (128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265);
INSERT INTO `country` VALUES (129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60);
INSERT INTO `country` VALUES (130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960);
INSERT INTO `country` VALUES (131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223);
INSERT INTO `country` VALUES (132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356);
INSERT INTO `country` VALUES (133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692);
INSERT INTO `country` VALUES (134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596);
INSERT INTO `country` VALUES (135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222);
INSERT INTO `country` VALUES (136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230);
INSERT INTO `country` VALUES (137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269);
INSERT INTO `country` VALUES (138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52);
INSERT INTO `country` VALUES (139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691);
INSERT INTO `country` VALUES (140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373);
INSERT INTO `country` VALUES (141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377);
INSERT INTO `country` VALUES (142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976);
INSERT INTO `country` VALUES (143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664);
INSERT INTO `country` VALUES (144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212);
INSERT INTO `country` VALUES (145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258);
INSERT INTO `country` VALUES (146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95);
INSERT INTO `country` VALUES (147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264);
INSERT INTO `country` VALUES (148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674);
INSERT INTO `country` VALUES (149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977);
INSERT INTO `country` VALUES (150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31);
INSERT INTO `country` VALUES (151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599);
INSERT INTO `country` VALUES (152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687);
INSERT INTO `country` VALUES (153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64);
INSERT INTO `country` VALUES (154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505);
INSERT INTO `country` VALUES (155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227);
INSERT INTO `country` VALUES (156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234);
INSERT INTO `country` VALUES (157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683);
INSERT INTO `country` VALUES (158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672);
INSERT INTO `country` VALUES (159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670);
INSERT INTO `country` VALUES (160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47);
INSERT INTO `country` VALUES (161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968);
INSERT INTO `country` VALUES (162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92);
INSERT INTO `country` VALUES (163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680);
INSERT INTO `country` VALUES (164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970);
INSERT INTO `country` VALUES (165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507);
INSERT INTO `country` VALUES (166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675);
INSERT INTO `country` VALUES (167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595);
INSERT INTO `country` VALUES (168, 'PE', 'PERU', 'Peru', 'PER', 604, 51);
INSERT INTO `country` VALUES (169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63);
INSERT INTO `country` VALUES (170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0);
INSERT INTO `country` VALUES (171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48);
INSERT INTO `country` VALUES (172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351);
INSERT INTO `country` VALUES (173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787);
INSERT INTO `country` VALUES (174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974);
INSERT INTO `country` VALUES (175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262);
INSERT INTO `country` VALUES (176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40);
INSERT INTO `country` VALUES (177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70);
INSERT INTO `country` VALUES (178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250);
INSERT INTO `country` VALUES (179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290);
INSERT INTO `country` VALUES (180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869);
INSERT INTO `country` VALUES (181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758);
INSERT INTO `country` VALUES (182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508);
INSERT INTO `country` VALUES (183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784);
INSERT INTO `country` VALUES (184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684);
INSERT INTO `country` VALUES (185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378);
INSERT INTO `country` VALUES (186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239);
INSERT INTO `country` VALUES (187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966);
INSERT INTO `country` VALUES (188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221);
INSERT INTO `country` VALUES (189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381);
INSERT INTO `country` VALUES (190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248);
INSERT INTO `country` VALUES (191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232);
INSERT INTO `country` VALUES (192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65);
INSERT INTO `country` VALUES (193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421);
INSERT INTO `country` VALUES (194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386);
INSERT INTO `country` VALUES (195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677);
INSERT INTO `country` VALUES (196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252);
INSERT INTO `country` VALUES (197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27);
INSERT INTO `country` VALUES (198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0);
INSERT INTO `country` VALUES (199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34);
INSERT INTO `country` VALUES (200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94);
INSERT INTO `country` VALUES (201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249);
INSERT INTO `country` VALUES (202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597);
INSERT INTO `country` VALUES (203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47);
INSERT INTO `country` VALUES (204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268);
INSERT INTO `country` VALUES (205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46);
INSERT INTO `country` VALUES (206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41);
INSERT INTO `country` VALUES (207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963);
INSERT INTO `country` VALUES (208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886);
INSERT INTO `country` VALUES (209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992);
INSERT INTO `country` VALUES (210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255);
INSERT INTO `country` VALUES (211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66);
INSERT INTO `country` VALUES (212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670);
INSERT INTO `country` VALUES (213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228);
INSERT INTO `country` VALUES (214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690);
INSERT INTO `country` VALUES (215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676);
INSERT INTO `country` VALUES (216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868);
INSERT INTO `country` VALUES (217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216);
INSERT INTO `country` VALUES (218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90);
INSERT INTO `country` VALUES (219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370);
INSERT INTO `country` VALUES (220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649);
INSERT INTO `country` VALUES (221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688);
INSERT INTO `country` VALUES (222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256);
INSERT INTO `country` VALUES (223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380);
INSERT INTO `country` VALUES (224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971);
INSERT INTO `country` VALUES (225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44);
INSERT INTO `country` VALUES (226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1);
INSERT INTO `country` VALUES (227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1);
INSERT INTO `country` VALUES (228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598);
INSERT INTO `country` VALUES (229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998);
INSERT INTO `country` VALUES (230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678);
INSERT INTO `country` VALUES (231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58);
INSERT INTO `country` VALUES (232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84);
INSERT INTO `country` VALUES (233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284);
INSERT INTO `country` VALUES (234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340);
INSERT INTO `country` VALUES (235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681);
INSERT INTO `country` VALUES (236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212);
INSERT INTO `country` VALUES (237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967);
INSERT INTO `country` VALUES (238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260);
INSERT INTO `country` VALUES (239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `currency` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `code` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `symbol` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES (1, 'Albania', 'Leke', 'ALL', 'Lek');
INSERT INTO `currency` VALUES (2, 'America', 'Dollars', 'USD', '$');
INSERT INTO `currency` VALUES (3, 'Afghanistan', 'Afghanis', 'AFN', '؋');
INSERT INTO `currency` VALUES (4, 'Argentina', 'Pesos', 'ARS', '$');
INSERT INTO `currency` VALUES (5, 'Aruba', 'Guilders', 'AWG', 'Afl');
INSERT INTO `currency` VALUES (6, 'Australia', 'Dollars', 'AUD', '$');
INSERT INTO `currency` VALUES (7, 'Azerbaijan', 'New Manats', 'AZN', '₼');
INSERT INTO `currency` VALUES (8, 'Bahamas', 'Dollars', 'BSD', '$');
INSERT INTO `currency` VALUES (9, 'Barbados', 'Dollars', 'BBD', '$');
INSERT INTO `currency` VALUES (10, 'Belarus', 'Rubles', 'BYR', 'p.');
INSERT INTO `currency` VALUES (11, 'Belgium', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (12, 'Beliz', 'Dollars', 'BZD', 'BZ$');
INSERT INTO `currency` VALUES (13, 'Bermuda', 'Dollars', 'BMD', '$');
INSERT INTO `currency` VALUES (14, 'Bolivia', 'Bolivianos', 'BOB', '$b');
INSERT INTO `currency` VALUES (15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM');
INSERT INTO `currency` VALUES (16, 'Botswana', 'Pula', 'BWP', 'P');
INSERT INTO `currency` VALUES (17, 'Bulgaria', 'Leva', 'BGN', 'Лв.');
INSERT INTO `currency` VALUES (18, 'Brazil', 'Reais', 'BRL', 'R$');
INSERT INTO `currency` VALUES (19, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£\r\n');
INSERT INTO `currency` VALUES (20, 'Brunei Darussalam', 'Dollars', 'BND', '$');
INSERT INTO `currency` VALUES (21, 'Cambodia', 'Riels', 'KHR', '៛');
INSERT INTO `currency` VALUES (22, 'Canada', 'Dollars', 'CAD', '$');
INSERT INTO `currency` VALUES (23, 'Cayman Islands', 'Dollars', 'KYD', '$');
INSERT INTO `currency` VALUES (24, 'Chile', 'Pesos', 'CLP', '$');
INSERT INTO `currency` VALUES (25, 'China', 'Yuan Renminbi', 'CNY', '¥');
INSERT INTO `currency` VALUES (26, 'Colombia', 'Pesos', 'COP', '$');
INSERT INTO `currency` VALUES (27, 'Costa Rica', 'Colón', 'CRC', '₡');
INSERT INTO `currency` VALUES (28, 'Croatia', 'Kuna', 'HRK', 'kn');
INSERT INTO `currency` VALUES (29, 'Cuba', 'Pesos', 'CUP', '₱');
INSERT INTO `currency` VALUES (30, 'Cyprus', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (31, 'Czech Republic', 'Koruny', 'CZK', 'Kč');
INSERT INTO `currency` VALUES (32, 'Denmark', 'Kroner', 'DKK', 'kr');
INSERT INTO `currency` VALUES (33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$');
INSERT INTO `currency` VALUES (34, 'East Caribbean', 'Dollars', 'XCD', '$');
INSERT INTO `currency` VALUES (35, 'Egypt', 'Pounds', 'EGP', '£');
INSERT INTO `currency` VALUES (36, 'El Salvador', 'Colones', 'SVC', '$');
INSERT INTO `currency` VALUES (37, 'England (United Kingdom)', 'Pounds', 'GBP', '£');
INSERT INTO `currency` VALUES (38, 'Euro', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (39, 'Falkland Islands', 'Pounds', 'FKP', '£');
INSERT INTO `currency` VALUES (40, 'Fiji', 'Dollars', 'FJD', '$');
INSERT INTO `currency` VALUES (41, 'France', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (42, 'Ghana', 'Cedis', 'GHC', 'GH₵');
INSERT INTO `currency` VALUES (43, 'Gibraltar', 'Pounds', 'GIP', '£');
INSERT INTO `currency` VALUES (44, 'Greece', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (45, 'Guatemala', 'Quetzales', 'GTQ', 'Q');
INSERT INTO `currency` VALUES (46, 'Guernsey', 'Pounds', 'GGP', '£');
INSERT INTO `currency` VALUES (47, 'Guyana', 'Dollars', 'GYD', '$');
INSERT INTO `currency` VALUES (48, 'Holland (Netherlands)', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (49, 'Honduras', 'Lempiras', 'HNL', 'L');
INSERT INTO `currency` VALUES (50, 'Hong Kong', 'Dollars', 'HKD', '$');
INSERT INTO `currency` VALUES (51, 'Hungary', 'Forint', 'HUF', 'Ft');
INSERT INTO `currency` VALUES (52, 'Iceland', 'Kronur', 'ISK', 'kr');
INSERT INTO `currency` VALUES (53, 'India', 'Rupees', 'INR', '₹');
INSERT INTO `currency` VALUES (54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp');
INSERT INTO `currency` VALUES (55, 'Iran', 'Rials', 'IRR', '﷼');
INSERT INTO `currency` VALUES (56, 'Ireland', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (57, 'Isle of Man', 'Pounds', 'IMP', '£');
INSERT INTO `currency` VALUES (58, 'Israel', 'New Shekels', 'ILS', '₪');
INSERT INTO `currency` VALUES (59, 'Italy', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (60, 'Jamaica', 'Dollars', 'JMD', 'J$');
INSERT INTO `currency` VALUES (61, 'Japan', 'Yen', 'JPY', '¥');
INSERT INTO `currency` VALUES (62, 'Jersey', 'Pounds', 'JEP', '£');
INSERT INTO `currency` VALUES (63, 'Kazakhstan', 'Tenge', 'KZT', '₸');
INSERT INTO `currency` VALUES (64, 'Korea (North)', 'Won', 'KPW', '₩');
INSERT INTO `currency` VALUES (65, 'Korea (South)', 'Won', 'KRW', '₩');
INSERT INTO `currency` VALUES (66, 'Kyrgyzstan', 'Soms', 'KGS', 'Лв');
INSERT INTO `currency` VALUES (67, 'Laos', 'Kips', 'LAK', '	₭');
INSERT INTO `currency` VALUES (68, 'Latvia', 'Lati', 'LVL', 'Ls');
INSERT INTO `currency` VALUES (69, 'Lebanon', 'Pounds', 'LBP', '£');
INSERT INTO `currency` VALUES (70, 'Liberia', 'Dollars', 'LRD', '$');
INSERT INTO `currency` VALUES (71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF');
INSERT INTO `currency` VALUES (72, 'Lithuania', 'Litai', 'LTL', 'Lt');
INSERT INTO `currency` VALUES (73, 'Luxembourg', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (74, 'Macedonia', 'Denars', 'MKD', 'Ден\r\n');
INSERT INTO `currency` VALUES (75, 'Malaysia', 'Ringgits', 'MYR', 'RM');
INSERT INTO `currency` VALUES (76, 'Malta', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (77, 'Mauritius', 'Rupees', 'MUR', '₹');
INSERT INTO `currency` VALUES (78, 'Mexico', 'Pesos', 'MXN', '$');
INSERT INTO `currency` VALUES (79, 'Mongolia', 'Tugriks', 'MNT', '₮');
INSERT INTO `currency` VALUES (80, 'Mozambique', 'Meticais', 'MZN', 'MT');
INSERT INTO `currency` VALUES (81, 'Namibia', 'Dollars', 'NAD', '$');
INSERT INTO `currency` VALUES (82, 'Nepal', 'Rupees', 'NPR', '₹');
INSERT INTO `currency` VALUES (83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ');
INSERT INTO `currency` VALUES (84, 'Netherlands', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (85, 'New Zealand', 'Dollars', 'NZD', '$');
INSERT INTO `currency` VALUES (86, 'Nicaragua', 'Cordobas', 'NIO', 'C$');
INSERT INTO `currency` VALUES (87, 'Nigeria', 'Nairas', 'NGN', '₦');
INSERT INTO `currency` VALUES (88, 'North Korea', 'Won', 'KPW', '₩');
INSERT INTO `currency` VALUES (89, 'Norway', 'Krone', 'NOK', 'kr');
INSERT INTO `currency` VALUES (90, 'Oman', 'Rials', 'OMR', '﷼');
INSERT INTO `currency` VALUES (91, 'Pakistan', 'Rupees', 'PKR', '₹');
INSERT INTO `currency` VALUES (92, 'Panama', 'Balboa', 'PAB', 'B/.');
INSERT INTO `currency` VALUES (93, 'Paraguay', 'Guarani', 'PYG', 'Gs');
INSERT INTO `currency` VALUES (94, 'Peru', 'Nuevos Soles', 'PEN', 'S/.');
INSERT INTO `currency` VALUES (95, 'Philippines', 'Pesos', 'PHP', 'Php');
INSERT INTO `currency` VALUES (96, 'Poland', 'Zlotych', 'PLN', 'zł');
INSERT INTO `currency` VALUES (97, 'Qatar', 'Rials', 'QAR', '﷼');
INSERT INTO `currency` VALUES (98, 'Romania', 'New Lei', 'RON', 'lei');
INSERT INTO `currency` VALUES (99, 'Russia', 'Rubles', 'RUB', '₽');
INSERT INTO `currency` VALUES (100, 'Saint Helena', 'Pounds', 'SHP', '£');
INSERT INTO `currency` VALUES (101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼');
INSERT INTO `currency` VALUES (102, 'Serbia', 'Dinars', 'RSD', 'ع.د');
INSERT INTO `currency` VALUES (103, 'Seychelles', 'Rupees', 'SCR', '₹');
INSERT INTO `currency` VALUES (104, 'Singapore', 'Dollars', 'SGD', '$');
INSERT INTO `currency` VALUES (105, 'Slovenia', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (106, 'Solomon Islands', 'Dollars', 'SBD', '$');
INSERT INTO `currency` VALUES (107, 'Somalia', 'Shillings', 'SOS', 'S');
INSERT INTO `currency` VALUES (108, 'South Africa', 'Rand', 'ZAR', 'R');
INSERT INTO `currency` VALUES (109, 'South Korea', 'Won', 'KRW', '₩');
INSERT INTO `currency` VALUES (110, 'Spain', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (111, 'Sri Lanka', 'Rupees', 'LKR', '₹');
INSERT INTO `currency` VALUES (112, 'Sweden', 'Kronor', 'SEK', 'kr');
INSERT INTO `currency` VALUES (113, 'Switzerland', 'Francs', 'CHF', 'CHF');
INSERT INTO `currency` VALUES (114, 'Suriname', 'Dollars', 'SRD', '$');
INSERT INTO `currency` VALUES (115, 'Syria', 'Pounds', 'SYP', '£');
INSERT INTO `currency` VALUES (116, 'Taiwan', 'New Dollars', 'TWD', 'NT$');
INSERT INTO `currency` VALUES (117, 'Thailand', 'Baht', 'THB', '฿');
INSERT INTO `currency` VALUES (118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$');
INSERT INTO `currency` VALUES (119, 'Turkey', 'Lira', 'TRY', 'TL');
INSERT INTO `currency` VALUES (120, 'Turkey', 'Liras', 'TRL', '₺');
INSERT INTO `currency` VALUES (121, 'Tuvalu', 'Dollars', 'TVD', '$');
INSERT INTO `currency` VALUES (122, 'Ukraine', 'Hryvnia', 'UAH', '₴');
INSERT INTO `currency` VALUES (123, 'United Kingdom', 'Pounds', 'GBP', '£');
INSERT INTO `currency` VALUES (124, 'United States of America', 'Dollars', 'USD', '$');
INSERT INTO `currency` VALUES (125, 'Uruguay', 'Pesos', 'UYU', '$U');
INSERT INTO `currency` VALUES (127, 'Vatican City', 'Euro', 'EUR', '€');
INSERT INTO `currency` VALUES (128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs');
INSERT INTO `currency` VALUES (129, 'Vietnam', 'Dong', 'VND', '₫\r\n');
INSERT INTO `currency` VALUES (130, 'Yemen', 'Rials', 'YER', '﷼');
INSERT INTO `currency` VALUES (131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `treatment_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `expertise_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `hospital_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `education` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `certificate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `appointment_fees` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `experience` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `timeslot` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `since` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `subscription_status` int(11) NULL DEFAULT NULL,
  `based_on` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_popular` int(11) NOT NULL DEFAULT 0,
  `commission_amount` decimal(11, 2) NULL DEFAULT NULL,
  `custom_timeslot` int(11) NULL DEFAULT NULL,
  `is_filled` tinyint(1) NOT NULL,
  `language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `patient_vcall` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tretment_id`(`treatment_id`) USING BTREE,
  INDEX `fk_category_id`(`category_id`) USING BTREE,
  INDEX `fk_expertise_id`(`expertise_id`) USING BTREE,
  INDEX `fk_hospital_id`(`hospital_id`) USING BTREE,
  INDEX `fk_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_expertise_id` FOREIGN KEY (`expertise_id`) REFERENCES `expertise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tretment_id` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, 2, 1, 2, '1', 2, '633572c8a0713.png', 'This is the doctor Pfo', '[{\"degree\":\"BAMS\",\"college\":\"BAMS University\",\"year\":\"2009\"}]', '[{\"certificate\":\"BAMS Ceritifiate\",\"certificate_year\":\"2019\"},{\"certificate\":\"MBBS Certificate\",\"certificate_year\":\"2022\"}]', '299', '8', '30', 'Jasmin Smith', '1990-11-01', 'male', '08:00 AM', '07:00 PM', '2024-01-16 , 08:11 AM', 1, 1, 'commission', 0, 10.00, NULL, 1, NULL, 0, '2024-01-16 08:11:58', '2024-01-16 08:16:27');
INSERT INTO `doctor` VALUES (2, 2, 1, 2, '1', 3, '65a5ee03bf002.png', 'This is the unique Dentist Doctor in Netherlands', '[{\"degree\":\"BAMS1\",\"college\":\"BAMS University\",\"year\":\"2009\"}]', '[{\"certificate\":\"BAMS Ceritifiate\",\"certificate_year\":\"2019\"},{\"certificate\":\"MBBS Certificate\",\"certificate_year\":\"2022\"}]', '299', '8', '30', 'Victor Denmal', '1989-07-06', 'male', '08:00 AM', '07:00 PM', '2024-01-16 , 08:11 AM', 1, 1, 'commission', 1, 9.00, NULL, 1, NULL, 0, '2024-01-16 08:11:58', '2024-01-16 08:17:11');
INSERT INTO `doctor` VALUES (3, 1, 4, 7, '1', 4, '65a5ee2f6a1b7.jpg', 'This is the unique Dentist Doctor in Netherlands', '[{\"degree\":\"BAMS\",\"college\":\"BAMS University\",\"year\":\"2009\"}]', '[{\"certificate\":\"BAMS Ceritifiate\",\"certificate_year\":\"2019\"},{\"certificate\":\"MBBS Certificate\",\"certificate_year\":\"2022\"}]', '299', '8', '30', 'Suneel Kumar', '1984-04-06', 'female', '08:00 AM', '07:00 PM', '2024-01-16 , 08:11 AM', 1, 1, 'commission', 1, 9.00, NULL, 1, NULL, 0, '2024-01-16 08:11:58', '2024-01-16 08:39:11');
INSERT INTO `doctor` VALUES (4, 3, 2, 4, '1', 5, '621655037dc1e.png', 'This is the unique Dentist Doctor in Netherlands', '[{\"degree\":\"BAMS\",\"college\":\"BAMS University\",\"year\":\"2009\"}]', '[{\"certificate\":\"BAMS Ceritifiate\",\"certificate_year\":\"2019\"},{\"certificate\":\"MBBS Certificate1\",\"certificate_year\":\"2022\"}]', '299', '8', '30', 'Jamal Hassan', '1992-03-06', 'male', '08:00 AM', '07:00 PM', '2024-01-16 , 08:11 AM', 1, 1, 'commission', 1, 9.00, NULL, 1, NULL, 0, '2024-01-16 08:11:58', '2024-01-16 08:38:45');
INSERT INTO `doctor` VALUES (5, 2, 1, 2, '1', 6, '6193737358cda.png', 'This is the unique Dentist Doctor in Netherlands', '[{\"degree\":\"BAMS\",\"college\":\"BAMS University\",\"year\":\"2009\"}]', '[{\"certificate\":\"BAMS Ceritifiate\",\"certificate_year\":\"2019\"},{\"certificate\":\"MBBS Certificate\",\"certificate_year\":\"2022\"}]', '299', '8', '30', 'Camilla Wisozk', '1991-01-01', 'female', '08:00 am', '07:00 pm', '2024-01-16 , 08:11 AM', 1, 1, 'commission', 1, 9.00, NULL, 1, NULL, 0, '2024-01-16 08:11:58', '2024-01-16 08:11:58');

-- ----------------------------
-- Table structure for doctor_subscription
-- ----------------------------
DROP TABLE IF EXISTS `doctor_subscription`;
CREATE TABLE `doctor_subscription`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `duration` int(11) NOT NULL,
  `start_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `amount` decimal(11, 2) NULL DEFAULT NULL,
  `payment_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `booked_appointment` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_doctor`(`doctor_id`) USING BTREE,
  INDEX `fk_subscription`(`subscription_id`) USING BTREE,
  CONSTRAINT `fk_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_subscription` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for expertise
-- ----------------------------
DROP TABLE IF EXISTS `expertise`;
CREATE TABLE `expertise`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_expertise`(`category_id`) USING BTREE,
  CONSTRAINT `fk_expertise` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expertise
-- ----------------------------
INSERT INTO `expertise` VALUES (1, 'Orthodontist', 1, 1, '2024-01-16 07:59:16', '2024-01-16 07:59:16');
INSERT INTO `expertise` VALUES (2, 'General Dentist', 1, 1, '2024-01-16 07:59:30', '2024-01-16 07:59:30');
INSERT INTO `expertise` VALUES (3, 'Advanced Heart Failure And Transplantation', 2, 1, '2024-01-16 08:00:11', '2024-01-16 08:00:11');
INSERT INTO `expertise` VALUES (4, 'Electrophysiology', 2, 1, '2024-01-16 08:00:24', '2024-01-16 08:00:24');
INSERT INTO `expertise` VALUES (5, 'General Orthopedic', 3, 1, '2024-01-16 08:00:53', '2024-01-16 08:00:53');
INSERT INTO `expertise` VALUES (6, 'Neuro-Oncology', 4, 1, '2024-01-16 08:01:25', '2024-01-16 08:01:25');
INSERT INTO `expertise` VALUES (7, 'Neurocritical Care', 4, 1, '2024-01-16 08:01:35', '2024-01-16 08:01:35');
INSERT INTO `expertise` VALUES (8, 'General Urology', 5, 1, '2024-01-16 08:02:00', '2024-01-16 08:02:00');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for faviroute
-- ----------------------------
DROP TABLE IF EXISTS `faviroute`;
CREATE TABLE `faviroute`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `doctorId`(`doctor_id`) USING BTREE,
  INDEX `userId`(`user_id`) USING BTREE,
  CONSTRAINT `doctorId` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userId` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of faviroute
-- ----------------------------
INSERT INTO `faviroute` VALUES (1, 3, 1, '2024-01-16 14:38:50', '2024-01-16 14:38:50');

-- ----------------------------
-- Table structure for hospital
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `facility` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hospital
-- ----------------------------
INSERT INTO `hospital` VALUES (1, 'Devine Chiropractic Care', '909098909', 'undefined', '40.7127281', '-74.0060152', 'best in class,General class', 1, '2024-01-16 08:07:42', '2024-01-16 08:07:42');

-- ----------------------------
-- Table structure for hospital_gallery
-- ----------------------------
DROP TABLE IF EXISTS `hospital_gallery`;
CREATE TABLE `hospital_gallery`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hospital_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_hospital`(`hospital_id`) USING BTREE,
  CONSTRAINT `fk_hospital` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lab
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `commission` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `lab_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lab_settle
-- ----------------------------
DROP TABLE IF EXISTS `lab_settle`;
CREATE TABLE `lab_settle`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lab_id` bigint(20) UNSIGNED NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `admin_amount` decimal(11, 2) NOT NULL,
  `lab_amount` decimal(11, 2) NOT NULL,
  `payment` int(11) NOT NULL,
  `lab_status` int(11) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lab_id`(`lab_id`) USING BTREE,
  INDEX `report_id`(`report_id`) USING BTREE,
  CONSTRAINT `lab_settle_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lab_settle_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `report` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lab_working_hours
-- ----------------------------
DROP TABLE IF EXISTS `lab_working_hours`;
CREATE TABLE `lab_working_hours`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lab_id` bigint(20) UNSIGNED NOT NULL,
  `day_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `period_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lab_id`(`lab_id`) USING BTREE,
  CONSTRAINT `lab_working_hours_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `json_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES (1, 'English', 'English.json', 'English.png', 'ltr', 1, '2021-08-26 18:20:20', '2022-11-18 13:26:25');
INSERT INTO `language` VALUES (2, 'Arabic', 'Arabic.json', 'Arabic.png', 'rtl', 1, '2021-08-26 18:21:20', '2022-11-18 13:25:57');

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pharmacy_id` bigint(20) UNSIGNED NOT NULL,
  `medicine_category_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `total_stock` int(11) NOT NULL,
  `use_stock` int(11) NULL DEFAULT 0,
  `incoming_stock` int(11) NOT NULL,
  `price_pr_strip` int(11) NOT NULL,
  `number_of_medicine` int(11) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `works` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prescription_required` tinyint(1) NOT NULL,
  `meta_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_medicine_pharamacy_id`(`pharmacy_id`) USING BTREE,
  INDEX `fk_medicine_category_id`(`medicine_category_id`) USING BTREE,
  CONSTRAINT `fk_medicine_category_id` FOREIGN KEY (`medicine_category_id`) REFERENCES `medicine_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `medicine_ibfk_1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for medicine_category
-- ----------------------------
DROP TABLE IF EXISTS `medicine_category`;
CREATE TABLE `medicine_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicine_category
-- ----------------------------
INSERT INTO `medicine_category` VALUES (1, 'Chiropractic Treatment', 1, '2024-01-16 08:02:55', '2024-01-16 08:02:55');
INSERT INTO `medicine_category` VALUES (2, 'Sleep disorders‎', 1, '2024-01-16 08:02:55', '2024-01-16 08:02:55');
INSERT INTO `medicine_category` VALUES (3, 'Inflammations', 1, '2024-01-16 08:02:55', '2024-01-16 08:02:55');
INSERT INTO `medicine_category` VALUES (4, 'Baby care', 1, '2024-01-16 08:02:55', '2024-01-16 08:02:55');
INSERT INTO `medicine_category` VALUES (5, 'Rare diseases‎', 1, '2024-01-16 08:02:55', '2024-01-16 08:02:55');
INSERT INTO `medicine_category` VALUES (6, 'Skin care', 1, '2024-01-16 08:02:55', '2024-01-16 08:02:55');
INSERT INTO `medicine_category` VALUES (7, 'Hair care', 1, '2024-01-16 08:02:55', '2024-01-16 08:02:55');
INSERT INTO `medicine_category` VALUES (8, 'Cancer', 1, '2024-01-16 08:02:55', '2024-01-16 08:02:55');
INSERT INTO `medicine_category` VALUES (9, 'Family care', 1, '2024-01-16 08:02:55', '2024-01-16 08:02:55');
INSERT INTO `medicine_category` VALUES (10, 'Phytopathology', 1, '2024-01-16 08:02:55', '2024-01-16 08:02:55');

-- ----------------------------
-- Table structure for medicine_child
-- ----------------------------
DROP TABLE IF EXISTS `medicine_child`;
CREATE TABLE `medicine_child`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_medicine_id` bigint(20) UNSIGNED NOT NULL,
  `medicine_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_purchase_medicine_id`(`purchase_medicine_id`) USING BTREE,
  INDEX `fk_medicineId`(`medicine_id`) USING BTREE,
  CONSTRAINT `fk_medicineId` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_purchase_medicine_id` FOREIGN KEY (`purchase_medicine_id`) REFERENCES `purchase_medicine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2021_04_14_114114_create_permission_tables', 2);
INSERT INTO `migrations` VALUES (5, '2021_04_19_063440_create_treatments_table', 3);
INSERT INTO `migrations` VALUES (6, '2021_04_19_122222_create_category_table', 4);
INSERT INTO `migrations` VALUES (7, '2021_04_20_055822_create_expertise_table', 5);
INSERT INTO `migrations` VALUES (8, '2021_04_20_093227_create_medicine_table', 6);
INSERT INTO `migrations` VALUES (9, '2021_04_21_041726_create_hospital_table', 7);
INSERT INTO `migrations` VALUES (10, '2021_04_21_084328_create_doctor_table', 8);
INSERT INTO `migrations` VALUES (11, '2021_04_23_070033_create_working_hour_table', 9);
INSERT INTO `migrations` VALUES (12, '2021_04_24_112427_create_blog_table', 10);
INSERT INTO `migrations` VALUES (13, '2021_04_26_111355_create_subscription_table', 11);
INSERT INTO `migrations` VALUES (14, '2021_04_28_092927_create_offer_table', 12);
INSERT INTO `migrations` VALUES (15, '2021_04_28_192443_create_hospital_gallery_table', 13);
INSERT INTO `migrations` VALUES (16, '2021_04_29_090851_create_notification_template_table', 14);
INSERT INTO `migrations` VALUES (18, '2021_05_03_092738_create_doctor_subscription_table', 15);
INSERT INTO `migrations` VALUES (20, '2021_05_05_090404_create_banner_table', 16);
INSERT INTO `migrations` VALUES (21, '2021_05_06_133656_create_appointment_table', 17);
INSERT INTO `migrations` VALUES (22, '2021_05_07_170002_create_faviroute_table', 18);
INSERT INTO `migrations` VALUES (23, '2021_05_08_173223_create_prescription_table', 19);
INSERT INTO `migrations` VALUES (24, '2021_05_10_185108_create_purchase_medicine_table', 20);
INSERT INTO `migrations` VALUES (25, '2021_05_10_185841_create_medicine_child_table', 20);
INSERT INTO `migrations` VALUES (26, '2021_05_11_124851_create_review_table', 21);
INSERT INTO `migrations` VALUES (27, '2021_05_14_104048_create_settle_table', 22);
INSERT INTO `migrations` VALUES (28, '2021_05_15_172945_create_pharmacy_table', 23);
INSERT INTO `migrations` VALUES (29, '2021_05_15_201146_create_medicine_category_table', 24);
INSERT INTO `migrations` VALUES (30, '2016_06_01_000001_create_oauth_auth_codes_table', 25);
INSERT INTO `migrations` VALUES (31, '2016_06_01_000002_create_oauth_access_tokens_table', 25);
INSERT INTO `migrations` VALUES (32, '2016_06_01_000003_create_oauth_refresh_tokens_table', 25);
INSERT INTO `migrations` VALUES (33, '2016_06_01_000004_create_oauth_clients_table', 25);
INSERT INTO `migrations` VALUES (34, '2016_06_01_000005_create_oauth_personal_access_clients_table', 25);
INSERT INTO `migrations` VALUES (35, '2019_11_18_105032_create_pages_table', 26);
INSERT INTO `migrations` VALUES (36, '2019_11_18_105615_create_uploads_table', 26);
INSERT INTO `migrations` VALUES (37, '2020_04_18_064412_create_page_translations_table', 26);
INSERT INTO `migrations` VALUES (38, '2020_04_18_065546_create_settings_table', 26);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 2);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 7);

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  INDEX `notification_ibfk_2`(`user_id`) USING BTREE,
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notification_template
-- ----------------------------
DROP TABLE IF EXISTS `notification_template`;
CREATE TABLE `notification_template`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification_template
-- ----------------------------
INSERT INTO `notification_template` VALUES (1, 'verification', 'verification', 'dear {{user_name}} your verification code is {{otp}} from {{app_name}}', '<p>Dear {{User_name}} Your Verification Code Is {{Otp}} {{App_name}}</p><p><br></p>', NULL, '2021-07-06 18:54:47');
INSERT INTO `notification_template` VALUES (2, 'create appointment', 'create appointment', 'dear {{user_name}} appointment created successfully appointment id is {{appointment_id}} at {{date}}{{time}} from {{app_name}}', '<p>dear {{user_name}} appointment created successfully appointment id is {{appointment_id}} at {{date}}{{time}}</p><p>from:{{app_name}}</p>', NULL, '2021-04-30 20:19:00');
INSERT INTO `notification_template` VALUES (3, 'forgot password', 'forgot password', 'dear {{user_name}} your new password is {{password}} from {{app_name}}', 'dear {{user_name}} your new password is {{password}} from {{app_name}}', NULL, '2021-04-30 20:20:19');
INSERT INTO `notification_template` VALUES (4, 'status change', 'status change', 'dear {{user_name}} your appointment appointment id is {{appointment_id}} is successfully {{status}} at {{date}} from {{app_name}}', '<p>dear {{user_name}} your appointment appointment id is {{appointment_id}} is successfully {{status}} at {{date}} </p><p>from {{app_name}}</p><p>thank you..</p>', NULL, '2021-04-30 20:21:35');
INSERT INTO `notification_template` VALUES (5, 'Doctor Book Appointment', 'doctor book appointment', 'dear {{doctor_name}} recently booked your appointment {{appointment_id}} to {{date}} {{user_name}} from {{app_name}}', '<p>Dear {{doctor_name}}&nbsp;recently booked your appointment {{appointment_id}} to {{date}} {{user_name}} </p><p>from {{app_name}}</p><p><br></p>', '2021-07-26 20:07:16', '2021-07-26 21:19:23');

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_access_tokens_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_auth_codes_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_clients_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES (1, NULL, 'Laravel Personal Access Client', 'JYgWpRDPtOeBB5tvfPNFVlIKg1pjPy7qcFXhuZuF', NULL, 'http://localhost', 1, 0, 0, '2021-05-20 15:31:54', '2021-05-20 15:31:54');
INSERT INTO `oauth_clients` VALUES (2, NULL, 'Laravel Password Grant Client', 'yFf8bF9Y31FNRsmpgthVEMUi0bCg8gHMVQ6inmxl', 'users', 'http://localhost', 0, 1, 0, '2021-05-20 15:31:54', '2021-05-20 15:31:54');

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO `oauth_personal_access_clients` VALUES (1, 1, '2021-05-20 15:31:54', '2021-05-20 15:31:54');

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_refresh_tokens_access_token_id_index`(`access_token_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for offer
-- ----------------------------
DROP TABLE IF EXISTS `offer`;
CREATE TABLE `offer`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_use` int(11) NOT NULL,
  `use_count` int(11) NULL DEFAULT 0,
  `min_discount` int(11) NOT NULL,
  `is_flat` int(11) NOT NULL,
  `flatDiscount` int(11) NULL DEFAULT NULL,
  `start_end_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) NULL DEFAULT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pathology
-- ----------------------------
DROP TABLE IF EXISTS `pathology`;
CREATE TABLE `pathology`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lab_id` bigint(20) UNSIGNED NOT NULL,
  `report_days` int(11) NOT NULL,
  `test_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `charge` int(11) NOT NULL,
  `pathology_category_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prescription_required` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lab_id`(`lab_id`) USING BTREE,
  INDEX `pathology_category_id`(`pathology_category_id`) USING BTREE,
  CONSTRAINT `pathology_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pathology_ibfk_2` FOREIGN KEY (`pathology_category_id`) REFERENCES `pathology_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pathology_category
-- ----------------------------
DROP TABLE IF EXISTS `pathology_category`;
CREATE TABLE `pathology_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_guard_name_unique`(`name`, `guard_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'superadmin_dashboard', 'web', '2021-04-15 08:26:17', '2021-04-15 08:26:17');
INSERT INTO `permissions` VALUES (2, 'superadmin_setting', 'web', '2021-04-15 08:35:55', '2021-04-15 08:35:55');
INSERT INTO `permissions` VALUES (3, 'treatment_access', 'web', '2021-04-19 02:50:49', '2021-04-19 02:50:49');
INSERT INTO `permissions` VALUES (4, 'treatment_add', 'web', '2021-04-19 02:50:49', '2021-04-19 02:50:49');
INSERT INTO `permissions` VALUES (5, 'treatment_edit', 'web', '2021-04-19 02:50:49', '2021-04-19 02:50:49');
INSERT INTO `permissions` VALUES (6, 'treatment_delete', 'web', '2021-04-19 02:50:49', '2021-04-19 02:50:49');
INSERT INTO `permissions` VALUES (7, 'category_access', 'web', '2021-04-19 10:23:48', '2021-04-19 10:23:48');
INSERT INTO `permissions` VALUES (8, 'category_add', 'web', '2021-04-19 10:23:48', '2021-04-19 10:23:48');
INSERT INTO `permissions` VALUES (9, 'category_edit', 'web', '2021-04-19 10:23:48', '2021-04-19 10:23:48');
INSERT INTO `permissions` VALUES (10, 'category_delete', 'web', '2021-04-19 10:23:49', '2021-04-19 10:23:49');
INSERT INTO `permissions` VALUES (11, 'expertise_access', 'web', '2021-04-20 03:55:58', '2021-04-20 03:55:58');
INSERT INTO `permissions` VALUES (12, 'expertise_add', 'web', '2021-04-20 03:55:58', '2021-04-20 03:55:58');
INSERT INTO `permissions` VALUES (13, 'expertise_edit', 'web', '2021-04-20 03:55:58', '2021-04-20 03:55:58');
INSERT INTO `permissions` VALUES (14, 'expertise_delete', 'web', '2021-04-20 03:55:58', '2021-04-20 03:55:58');
INSERT INTO `permissions` VALUES (19, 'hospital_access', 'web', '2021-04-21 02:20:10', '2021-04-21 02:20:10');
INSERT INTO `permissions` VALUES (20, 'hospital_add', 'web', '2021-04-21 02:20:10', '2021-04-21 02:20:10');
INSERT INTO `permissions` VALUES (21, 'hospital_edit', 'web', '2021-04-21 02:20:10', '2021-04-21 02:20:10');
INSERT INTO `permissions` VALUES (22, 'hospital_delete', 'web', '2021-04-21 02:20:10', '2021-04-21 02:20:10');
INSERT INTO `permissions` VALUES (23, 'doctor_access', 'web', '2021-04-21 06:49:43', '2021-04-21 06:49:43');
INSERT INTO `permissions` VALUES (24, 'doctor_add', 'web', '2021-04-21 06:49:43', '2021-04-21 06:49:43');
INSERT INTO `permissions` VALUES (25, 'doctor_edit', 'web', '2021-04-21 06:49:43', '2021-04-21 06:49:43');
INSERT INTO `permissions` VALUES (26, 'doctor_delete', 'web', '2021-04-21 06:49:43', '2021-04-21 06:49:43');
INSERT INTO `permissions` VALUES (27, 'role_access', 'web', '2021-04-24 05:18:46', '2021-04-24 05:18:46');
INSERT INTO `permissions` VALUES (28, 'role_add', 'web', '2021-04-24 05:18:46', '2021-04-24 05:18:46');
INSERT INTO `permissions` VALUES (29, 'role_edit', 'web', '2021-04-24 05:18:46', '2021-04-24 05:18:46');
INSERT INTO `permissions` VALUES (30, 'role_delete', 'web', '2021-04-24 05:18:46', '2021-04-24 05:18:46');
INSERT INTO `permissions` VALUES (31, 'blog_access', 'web', '2021-04-24 09:25:15', '2021-04-24 09:25:15');
INSERT INTO `permissions` VALUES (32, 'blog_add', 'web', '2021-04-24 09:25:15', '2021-04-24 09:25:15');
INSERT INTO `permissions` VALUES (33, 'blog_edit', 'web', '2021-04-24 09:25:15', '2021-04-24 09:25:15');
INSERT INTO `permissions` VALUES (34, 'blog_delete', 'web', '2021-04-24 09:25:15', '2021-04-24 09:25:15');
INSERT INTO `permissions` VALUES (35, 'subscription_access', 'web', '2021-04-26 09:25:03', '2021-04-26 09:25:03');
INSERT INTO `permissions` VALUES (36, 'subscription_add', 'web', '2021-04-26 09:25:03', '2021-04-26 09:25:03');
INSERT INTO `permissions` VALUES (37, 'subscription_edit', 'web', '2021-04-26 09:25:03', '2021-04-26 09:25:03');
INSERT INTO `permissions` VALUES (38, 'subscription_delete', 'web', '2021-04-26 09:25:03', '2021-04-26 09:25:03');
INSERT INTO `permissions` VALUES (39, 'patient_access', 'web', '2021-04-27 17:00:55', '2021-04-27 17:00:55');
INSERT INTO `permissions` VALUES (40, 'patient_add', 'web', '2021-04-27 17:00:55', '2021-04-27 17:00:55');
INSERT INTO `permissions` VALUES (41, 'patient_edit', 'web', '2021-04-27 17:00:55', '2021-04-27 17:00:55');
INSERT INTO `permissions` VALUES (42, 'patient_delete', 'web', '2021-04-27 17:00:55', '2021-04-27 17:00:55');
INSERT INTO `permissions` VALUES (43, 'offer_access', 'web', '2021-04-28 07:24:35', '2021-04-28 07:24:35');
INSERT INTO `permissions` VALUES (44, 'offer_add', 'web', '2021-04-28 07:24:35', '2021-04-28 07:24:35');
INSERT INTO `permissions` VALUES (45, 'offer_edit', 'web', '2021-04-28 07:24:35', '2021-04-28 07:24:35');
INSERT INTO `permissions` VALUES (46, 'offer_delete', 'web', '2021-04-28 07:24:35', '2021-04-28 07:24:35');
INSERT INTO `permissions` VALUES (47, 'appointment_calendar_access', 'web', '2021-04-28 15:23:52', '2021-04-28 15:23:52');
INSERT INTO `permissions` VALUES (48, 'hospital_gallery_access', 'web', '2021-04-28 17:19:03', '2021-04-28 17:19:03');
INSERT INTO `permissions` VALUES (49, 'hospital_gallery_add', 'web', '2021-04-28 17:19:03', '2021-04-28 17:19:03');
INSERT INTO `permissions` VALUES (50, 'hospital_gallery_edit', 'web', '2021-04-28 17:19:03', '2021-04-28 17:19:03');
INSERT INTO `permissions` VALUES (51, 'hospital_gallery_delete', 'web', '2021-04-28 17:19:03', '2021-04-28 17:19:03');
INSERT INTO `permissions` VALUES (52, 'doctor_home', 'web', '2021-05-01 12:40:25', '2021-05-01 12:40:25');
INSERT INTO `permissions` VALUES (54, 'doctor_subscription_purchase', 'web', '2021-05-03 09:04:25', '2021-05-03 09:04:25');
INSERT INTO `permissions` VALUES (56, 'subscription_history', 'web', '2021-05-03 15:46:47', '2021-05-03 15:46:47');
INSERT INTO `permissions` VALUES (57, 'doctor_schedule', 'web', '2021-05-03 16:32:29', '2021-05-03 16:32:29');
INSERT INTO `permissions` VALUES (58, 'doctor_profile', 'web', '2021-05-03 16:52:10', '2021-05-03 16:52:10');
INSERT INTO `permissions` VALUES (59, 'commission_details', 'web', '2021-05-04 12:47:37', '2021-05-04 12:47:37');
INSERT INTO `permissions` VALUES (60, 'appointment_access', 'web', '2021-05-04 13:09:17', '2021-05-04 13:09:17');
INSERT INTO `permissions` VALUES (61, 'banner_add', 'web', '2021-05-05 07:11:34', '2021-05-05 07:11:34');
INSERT INTO `permissions` VALUES (62, 'banner_access', 'web', '2021-05-05 07:11:34', '2021-05-05 07:11:34');
INSERT INTO `permissions` VALUES (63, 'banner_edit', 'web', '2021-05-05 07:11:34', '2021-05-05 07:11:34');
INSERT INTO `permissions` VALUES (64, 'banner_delete', 'web', '2021-05-05 07:11:34', '2021-05-05 07:11:34');
INSERT INTO `permissions` VALUES (65, 'report_access', 'web', '2021-05-15 07:33:20', '2021-05-15 07:33:20');
INSERT INTO `permissions` VALUES (67, 'pharmacy_access', 'web', '2021-05-15 15:24:06', '2021-05-15 15:24:06');
INSERT INTO `permissions` VALUES (68, 'pharmacy_add', 'web', '2021-05-15 15:24:52', '2021-05-15 15:24:52');
INSERT INTO `permissions` VALUES (69, 'pharmacy_edit', 'web', '2021-05-15 15:24:52', '2021-05-15 15:24:52');
INSERT INTO `permissions` VALUES (70, 'pharmacy_delete', 'web', '2021-05-15 15:24:53', '2021-05-15 15:24:53');
INSERT INTO `permissions` VALUES (71, 'medicine_category_access', 'web', '2021-05-15 18:27:48', '2021-05-15 18:27:48');
INSERT INTO `permissions` VALUES (72, 'medicine_category_add', 'web', '2021-05-15 18:27:48', '2021-05-15 18:27:48');
INSERT INTO `permissions` VALUES (73, 'medicine_category_edit', 'web', '2021-05-15 18:27:48', '2021-05-15 18:27:48');
INSERT INTO `permissions` VALUES (74, 'medicine_category_delete', 'web', '2021-05-15 18:27:48', '2021-05-15 18:27:48');
INSERT INTO `permissions` VALUES (75, 'pharmacy_dashboard', 'web', '2021-05-17 10:32:44', '2021-05-17 10:32:44');
INSERT INTO `permissions` VALUES (76, 'admin_medicine_access', 'web', '2021-05-17 10:41:24', '2021-05-17 10:41:24');
INSERT INTO `permissions` VALUES (77, 'admin_medicine_add', 'web', '2021-05-17 10:41:24', '2021-05-17 10:41:24');
INSERT INTO `permissions` VALUES (78, 'admin_medicine_edit', 'web', '2021-05-17 10:41:25', '2021-05-17 10:41:25');
INSERT INTO `permissions` VALUES (79, 'admin_medicine_delete', 'web', '2021-05-17 10:41:25', '2021-05-17 10:41:25');
INSERT INTO `permissions` VALUES (80, 'medicine_add', 'web', '2021-05-17 10:45:54', '2021-05-17 10:45:54');
INSERT INTO `permissions` VALUES (81, 'medicine_edit', 'web', '2021-05-17 10:46:10', '2021-05-17 10:46:10');
INSERT INTO `permissions` VALUES (82, 'medicine_delete', 'web', '2021-05-17 10:46:26', '2021-05-17 10:46:26');
INSERT INTO `permissions` VALUES (83, 'medicine_access', 'web', '2021-05-17 10:46:42', '2021-05-17 10:46:42');
INSERT INTO `permissions` VALUES (84, 'pharmacy_schedule', 'web', '2021-05-18 19:38:52', '2021-05-18 19:38:52');
INSERT INTO `permissions` VALUES (85, 'pharmacy_commission_access', 'web', '2021-05-20 07:45:38', '2021-05-20 07:45:38');
INSERT INTO `permissions` VALUES (86, 'pharmacy_profile', 'web', '2021-05-20 08:32:50', '2021-05-20 08:32:50');
INSERT INTO `permissions` VALUES (87, 'pharmacy_purchase_medicine', 'web', '2021-05-21 18:44:21', '2021-05-21 18:44:21');
INSERT INTO `permissions` VALUES (88, 'language_access', 'web', '2021-08-20 15:57:38', '2021-08-20 15:57:38');
INSERT INTO `permissions` VALUES (89, 'language_add', 'web', '2021-08-20 15:57:38', '2021-08-20 15:57:38');
INSERT INTO `permissions` VALUES (90, 'language_edit', 'web', '2021-08-20 15:57:38', '2021-08-20 15:57:38');
INSERT INTO `permissions` VALUES (91, 'language_delete', 'web', '2021-08-20 15:57:39', '2021-08-20 15:57:39');
INSERT INTO `permissions` VALUES (92, 'doctor_review', 'web', '2021-08-26 13:59:59', '2021-08-26 13:59:59');
INSERT INTO `permissions` VALUES (93, 'lab_access', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (94, 'lab_add', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (95, 'lab_edit', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (96, 'lab_delete', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (97, 'pathology_category_access', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (98, 'pathology_category_add', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (99, 'pathology_category_edit', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (100, 'pathology_category_delete', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (101, 'radiology_category_access', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (102, 'radiology_category_add', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (103, 'radiology_category_edit', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (104, 'radiology_category_delete', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (105, 'laboratory_home', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (106, 'pathology_access', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (107, 'pathology_add', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (108, 'pathology_edit', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (109, 'pathology_delete', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (110, 'radiology_access', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (111, 'radiology_add', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (112, 'radiology_edit', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (113, 'radiology_delete', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (114, 'test_report', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (115, 'lab_commission', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (116, 'lab_timeslot', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (118, 'admin_user_access', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (119, 'admin_user_add', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (120, 'admin_user_edit', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (121, 'admin_user_delete', 'web', NULL, NULL);
INSERT INTO `permissions` VALUES (124, 'zoom_setting', 'web', NULL, NULL);

-- ----------------------------
-- Table structure for pharamacy_settle
-- ----------------------------
DROP TABLE IF EXISTS `pharamacy_settle`;
CREATE TABLE `pharamacy_settle`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_medicine_id` bigint(20) UNSIGNED NOT NULL,
  `pharamacy_id` bigint(20) UNSIGNED NOT NULL,
  `admin_amount` decimal(11, 2) NOT NULL,
  `pharamacy_amount` decimal(11, 2) NULL DEFAULT NULL,
  `payment` int(11) NOT NULL,
  `pharamacy_status` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_settle_pharamacy_id`(`pharamacy_id`) USING BTREE,
  INDEX `fk_settle_medicine_id`(`purchase_medicine_id`) USING BTREE,
  CONSTRAINT `pharamacy_settle_ibfk_1` FOREIGN KEY (`purchase_medicine_id`) REFERENCES `purchase_medicine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pharamacy_settle_ibfk_2` FOREIGN KEY (`pharamacy_id`) REFERENCES `pharmacy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pharamacy_working_hour
-- ----------------------------
DROP TABLE IF EXISTS `pharamacy_working_hour`;
CREATE TABLE `pharamacy_working_hour`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pharamacy_id` bigint(20) UNSIGNED NOT NULL,
  `day_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_pharamcy_working`(`pharamacy_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pharmacy
-- ----------------------------
DROP TABLE IF EXISTS `pharmacy`;
CREATE TABLE `pharmacy`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission_amount` decimal(11, 2) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_shipping` int(11) NOT NULL DEFAULT 0,
  `delivery_charges` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(1) NOT NULL,
  `language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_pharamacy`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pharmacy_settle
-- ----------------------------
DROP TABLE IF EXISTS `pharmacy_settle`;
CREATE TABLE `pharmacy_settle`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_medicine_id` bigint(20) UNSIGNED NOT NULL,
  `pharmacy_id` bigint(20) UNSIGNED NOT NULL,
  `admin_amount` decimal(11, 2) NOT NULL,
  `pharmacy_amount` decimal(11, 2) NULL DEFAULT NULL,
  `payment` int(11) NOT NULL,
  `pharmacy_status` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_settle_pharamacy_id`(`pharmacy_id`) USING BTREE,
  INDEX `fk_settle_medicine_id`(`purchase_medicine_id`) USING BTREE,
  CONSTRAINT `pharmacy_settle_ibfk_1` FOREIGN KEY (`purchase_medicine_id`) REFERENCES `purchase_medicine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pharmacy_settle_ibfk_2` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pharmacy_working_hour
-- ----------------------------
DROP TABLE IF EXISTS `pharmacy_working_hour`;
CREATE TABLE `pharmacy_working_hour`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pharmacy_id` bigint(20) UNSIGNED NOT NULL,
  `day_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_pharamcy_working`(`pharmacy_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prescription
-- ----------------------------
DROP TABLE IF EXISTS `prescription`;
CREATE TABLE `prescription`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointment_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `medicines` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pdf` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_Appointment`(`appointment_id`) USING BTREE,
  INDEX `fk_pre_doctorId`(`doctor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for purchase_medicine
-- ----------------------------
DROP TABLE IF EXISTS `purchase_medicine`;
CREATE TABLE `purchase_medicine`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `medicine_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pdf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `amount` decimal(11, 2) NOT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `admin_commission` int(11) NOT NULL,
  `pharmacy_commission` int(11) NOT NULL,
  `pharmacy_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_at` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `delivery_charge` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_medicine_user_id`(`user_id`) USING BTREE,
  INDEX `fk_pharamacy_id`(`pharmacy_id`) USING BTREE,
  INDEX `fk_medicine_address_id`(`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for radiology
-- ----------------------------
DROP TABLE IF EXISTS `radiology`;
CREATE TABLE `radiology`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `radiology_category_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `report_days` int(11) NOT NULL,
  `charge` int(11) NOT NULL,
  `lab_id` bigint(20) UNSIGNED NOT NULL,
  `screening_for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lab_id`(`lab_id`) USING BTREE,
  INDEX `radiology_ibfk_1`(`radiology_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for radiology_category
-- ----------------------------
DROP TABLE IF EXISTS `radiology_category`;
CREATE TABLE `radiology_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `report_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lab_id` bigint(20) UNSIGNED NOT NULL,
  `pathology_category_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `pathology_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `radiology_category_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `radiology_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amount` decimal(20, 2) NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `prescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `patient_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_no` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `age` int(20) NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payment_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_status` int(11) NOT NULL,
  `upload_report` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  INDEX `lab_id`(`lab_id`) USING BTREE,
  INDEX `pathology_category_id`(`pathology_category_id`) USING BTREE,
  INDEX `radiology_category_id`(`radiology_category_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `pathology_id`(`pathology_id`) USING BTREE,
  INDEX `radiology_id`(`radiology_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL,
  `appointment_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_review_doctor_id`(`doctor_id`) USING BTREE,
  INDEX `fk_review_appointment_id`(`appointment_id`) USING BTREE,
  INDEX `fk_review_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (35, 2);
INSERT INTO `role_has_permissions` VALUES (39, 2);
INSERT INTO `role_has_permissions` VALUES (40, 2);
INSERT INTO `role_has_permissions` VALUES (41, 2);
INSERT INTO `role_has_permissions` VALUES (42, 2);
INSERT INTO `role_has_permissions` VALUES (47, 2);
INSERT INTO `role_has_permissions` VALUES (52, 2);
INSERT INTO `role_has_permissions` VALUES (54, 2);
INSERT INTO `role_has_permissions` VALUES (56, 2);
INSERT INTO `role_has_permissions` VALUES (57, 2);
INSERT INTO `role_has_permissions` VALUES (58, 2);
INSERT INTO `role_has_permissions` VALUES (59, 2);
INSERT INTO `role_has_permissions` VALUES (60, 2);
INSERT INTO `role_has_permissions` VALUES (75, 5);
INSERT INTO `role_has_permissions` VALUES (80, 5);
INSERT INTO `role_has_permissions` VALUES (81, 5);
INSERT INTO `role_has_permissions` VALUES (82, 5);
INSERT INTO `role_has_permissions` VALUES (83, 5);
INSERT INTO `role_has_permissions` VALUES (84, 5);
INSERT INTO `role_has_permissions` VALUES (85, 5);
INSERT INTO `role_has_permissions` VALUES (86, 5);
INSERT INTO `role_has_permissions` VALUES (87, 5);
INSERT INTO `role_has_permissions` VALUES (92, 2);
INSERT INTO `role_has_permissions` VALUES (105, 6);
INSERT INTO `role_has_permissions` VALUES (106, 6);
INSERT INTO `role_has_permissions` VALUES (107, 6);
INSERT INTO `role_has_permissions` VALUES (108, 6);
INSERT INTO `role_has_permissions` VALUES (109, 6);
INSERT INTO `role_has_permissions` VALUES (110, 6);
INSERT INTO `role_has_permissions` VALUES (111, 6);
INSERT INTO `role_has_permissions` VALUES (112, 6);
INSERT INTO `role_has_permissions` VALUES (113, 6);
INSERT INTO `role_has_permissions` VALUES (114, 6);
INSERT INTO `role_has_permissions` VALUES (115, 6);
INSERT INTO `role_has_permissions` VALUES (116, 6);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_guard_name_unique`(`name`, `guard_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'super admin', 'web', 1, '2021-04-14 16:31:07', '2021-04-14 16:31:07');
INSERT INTO `roles` VALUES (2, 'doctor', 'web', 1, '2021-04-22 09:21:13', '2021-04-22 09:21:13');
INSERT INTO `roles` VALUES (5, 'pharmacy', 'web', 1, '2021-05-15 20:52:41', '2021-05-15 20:52:41');
INSERT INTO `roles` VALUES (6, 'laboratory', 'web', 1, NULL, NULL);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `company_white_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `company_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `company_favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `currency_symbol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `currency_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `website_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cod` tinyint(1) NULL DEFAULT NULL,
  `stripe` tinyint(1) NULL DEFAULT NULL,
  `paypal` tinyint(1) NULL DEFAULT NULL,
  `razor` tinyint(1) NULL DEFAULT NULL,
  `flutterwave` tinyint(1) NULL DEFAULT NULL,
  `paystack` tinyint(1) NULL DEFAULT NULL,
  `stripe_public_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `stripe_secret_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `paypal_secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `paypal_client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `razor_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `flutterwave_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `flutterwave_encryption_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isLiveKey` tinyint(1) NOT NULL DEFAULT 0,
  `paystack_public_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `timezone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `default_commission` int(11) NULL DEFAULT NULL,
  `pharmacy_commission` int(11) NULL DEFAULT NULL,
  `pharamacy_commission` int(11) NULL DEFAULT NULL,
  `default_base_on` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `map_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `verification` tinyint(1) NULL DEFAULT NULL,
  `using_mail` tinyint(1) NULL DEFAULT NULL,
  `using_msg` tinyint(1) NULL DEFAULT NULL,
  `twilio_auth_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `twilio_acc_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `twilio_phone_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mail_mailer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `mail_host` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `mail_port` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `mail_username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `mail_password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `mail_encryption` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `mail_from_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `mail_from_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancel_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `radius` int(11) NOT NULL DEFAULT 50,
  `clinic_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `doctor_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `footer_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `doctor_mail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `patient_mail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `patient_notification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `doctor_notification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `patient_app_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `patient_auth_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `patient_api_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `doctor_app_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `doctor_auth_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `doctor_api_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `license_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `client_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `license_verify` tinyint(1) NULL DEFAULT NULL,
  `language` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `auto_cancel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `playstore` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `appstore` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `privacy_policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `about_us` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `agora_app_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `agora_app_certificate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `banner_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `banner_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `landing_popup_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `popup_timer_seconds` int(11) NOT NULL DEFAULT 5,
  `popup_target_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `landing_popup_switch` tinyint(1) NOT NULL DEFAULT 0,
  `pathologist_commission` int(11) NULL DEFAULT NULL,
  `facebook_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `linkdin_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `instagram_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `twitter_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `home_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `home_content_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'Doctro', 'doctro@example.com', '774455662211', '65a6ba36f104d.png', '65a6ba36f1623.png', '63f6efb85dbc2.png', '$', 'USD', 2, '#2b93ee', '#2d83fb', 1, 0, 0, 0, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', 0, ' ', 'Asia/Kolkata', 10, 10, 10, 'commission', '2341sdfaqerqerqwersdfsdf', 0, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '[\"appointment time doctor not available.\",\"Now I am perfectly alright.\",\"Hospital not find and I missed appointment time.\",\"Personal Reasons\"]', 100, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<br></p>', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</p><p><br></p><p>web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes</p>', '<p><span style=\"color: rgb(255, 255, 255);\"><span style=\"font-family: Helvetica;\">﻿</span><span style=\"font-family: Helvetica; text-transform: none;\">In layman\'s terms,&nbsp;</span><span style=\"font-family: Helvetica;\">﻿</span><span style=\"font-family: Helvetica;\"><b style=\"font-family: arial, sans-serif; text-transform: none;\">Lorem Ipsu</b></span><span style=\"font-family: Helvetica;\">﻿</span><b style=\"font-family: arial, sans-serif; text-transform: none;\"><span style=\"font-family: Helvetica;\">m</span></b><span style=\"font-family: Helvetica; text-transform: none;\">&nbsp;is a dummy or placeho</span><span style=\"font-family: Helvetica;\">﻿</span><span style=\"font-family: Helvetica; text-transform: none;\">ld</span><span style=\"font-family: Helvetica;\">﻿</span><span style=\"font-family: Helvetica; text-transform: none;\">er text. It\'s often used in laying out print, infographics, or web design</span><span style=\"font-family: Helvetica;\">﻿</span></span></p>', '0', '0', '0', '0', ' ', ' ', ' ', ' ', ' ', ' ', '', '', 1, 'English', '60', 'https://doctro.saasmonks.in', 'https://doctro.saasmonks.in', NULL, '<p><br></p><div id=\"bannerR\" style=\"margin: 0px -160px 0px 0px; padding: 0px; position: sticky; top: 20px; width: 160px; height: 10px; float: right; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-transform: none;\"><div id=\"div-gpt-ad-1474537762122-3\" data-google-query-id=\"CLSL_tr4gfkCFTq9SwUd2xcE-w\" style=\"margin: 0px; padding: 0px;\"><div id=\"google_ads_iframe_/15188745,22440292294/Lipsum-Unit4_0__container__\" style=\"margin: 0px; padding: 0px; border: 0pt none; width: 160px; height: 600px;\"></div></div></div><div class=\"boxed\" style=\"margin: 10px 28.7969px; padding: 0px; clear: both; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: center; text-transform: none;\"><div id=\"lipsum\" style=\"margin: 0px; padding: 0px; text-align: justify;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum, velit quis pretium egestas, lorem dui finibus mauris, a lacinia orci quam nec metus. Nam ut dui enim. Vestibulum lorem turpis, dictum sit amet sollicitudin ut, sagittis non massa. Praesent mollis tortor non dapibus porttitor. Nam pretium metus nunc, sit amet placerat tellus semper at. Duis pretium elit eu eros cursus, sit amet aliquam neque rutrum. Nulla facilisi. Phasellus condimentum pharetra enim nec tempor. Mauris non cursus velit. Vestibulum venenatis elementum tellus non condimentum. Curabitur at ultricies arcu. Integer pharetra ante ac magna luctus, sit amet ullamcorper nunc bibendum. Aenean hendrerit consectetur massa ac fringilla. Mauris tristique nulla eu eleifend dignissim. Cras consequat faucibus arcu, non semper velit gravida tincidunt.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Duis quam augue, semper non felis tincidunt, cursus suscipit elit. Curabitur quis iaculis enim. Nulla facilisi. Nam nec orci a mauris condimentum dictum. Maecenas eros diam, aliquet eget lorem eget, aliquam fermentum tortor. Vivamus vehicula mauris est, id rhoncus arcu pellentesque vel. Vestibulum id hendrerit nunc. Sed purus leo, faucibus vitae tincidunt in, auctor sed mi.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque risus arcu, luctus in lectus et, finibus eleifend tellus. Praesent mauris ex, consectetur quis egestas vitae, auctor sed libero. Nulla commodo, orci malesuada accumsan vehicula, ex leo tempus magna, id cursus sem dui eget nunc. In fringilla magna quis purus pulvinar varius. Proin non libero lectus. Sed non aliquet purus. Cras cursus ullamcorper eros, et rhoncus odio pharetra ac. Aliquam posuere tellus a accumsan imperdiet. Vivamus tristique erat maximus ornare maximus. In hac habitasse platea dictumst. Praesent at tempor lacus. Donec gravida neque non blandit auctor. Vivamus nec tincidunt lectus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Nam quis risus mi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus vehicula nisi non urna mattis, at vulputate nisi cursus. Aenean in quam eu odio pellentesque imperdiet. Morbi sed nulla non urna tempor gravida. Aenean at vehicula enim. Donec volutpat vulputate mattis.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Morbi placerat, dolor ac mollis tincidunt, erat ligula mattis ligula, et ultricies mi nisi et elit. Curabitur ornare a nunc et fermentum. Suspendisse potenti. Proin vel pulvinar dolor. Nulla justo ante, efficitur a elementum sit amet, egestas fringilla ante. Nulla vitae placerat neque, eget sollicitudin augue. Aliquam quis ante id lacus euismod facilisis non a sapien. Sed vitae ante non justo dignissim venenatis. Quisque maximus eleifend est, vitae malesuada turpis ultrices at. Aliquam pulvinar urna sed dui mollis, a bibendum lectus consequat. Ut condimentum dolor et efficitur lobortis. Morbi tempor tincidunt felis, pretium congue mi. Maecenas finibus, massa vel blandit volutpat, velit nisl finibus elit, id hendrerit tortor tortor nec purus. Sed venenatis, turpis a luctus gravida, odio magna sodales neque, nec consequat odio odio sed libero. Aliquam erat volutpat. Fusce imperdiet, quam vel dignissim dictum, sapien velit convallis risus, vitae porttitor velit ex quis arcu.</p></div></div>', NULL, NULL, '63e38dd64a28a.png', 'https://doctro.saasmonks.in', '', 0, '', 0, 10, 'https://doctro.saasmonks.in', 'https://doctro.saasmonks.in', 'https://doctro.saasmonks.in', 'https://doctro.saasmonks.in', 'Browse by Specialities', '<p>Lorem ipsum dolor sit amet, elit. Euismod habitasse pulvinar faucibus eget.Lorem ipsum dolor sit amet, elit. Euismod habitasse pulvinar faucibus eget.<br></p>', '40.7127281', '-74.0060152', '2021-04-16 07:59:47', '2024-01-16 22:49:45');

-- ----------------------------
-- Table structure for settle
-- ----------------------------
DROP TABLE IF EXISTS `settle`;
CREATE TABLE `settle`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointment_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_amount` decimal(11, 2) NOT NULL,
  `admin_amount` decimal(11, 2) NOT NULL,
  `payment` int(11) NOT NULL,
  `doctor_status` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_settle_doctor_id`(`doctor_id`) USING BTREE,
  INDEX `fk_settle_appointment_id`(`appointment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subscription
-- ----------------------------
DROP TABLE IF EXISTS `subscription`;
CREATE TABLE `subscription`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `total_appointment` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subscription
-- ----------------------------
INSERT INTO `subscription` VALUES (1, 'basic', '[{\"month\":\"3\",\"price\":\"600\"},{\"month\":\"6\",\"price\":\"800\"}]', 1000, '2021-04-26 10:29:44', '2021-04-26 10:29:44');
INSERT INTO `subscription` VALUES (2, 'Advantager', '[{\"month\":\"6\",\"price\":\"5000\"}]', 5000, '2021-04-26 10:41:37', '2021-04-27 16:44:02');
INSERT INTO `subscription` VALUES (5, 'free', '[{\"month\":null,\"price\":null}]', 500, '2021-05-03 08:09:49', '2021-05-03 08:09:49');

-- ----------------------------
-- Table structure for timezones
-- ----------------------------
DROP TABLE IF EXISTS `timezones`;
CREATE TABLE `timezones`  (
  `CountryCode` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Coordinates` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TimeZone` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Comments` varchar(85) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UTC_offset` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UTC_DST_offset` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Notes` varchar(79) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TimeZone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of timezones
-- ----------------------------
INSERT INTO `timezones` VALUES ('CI', '+0519-00402', 'Africa/Abidjan', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('GH', '+0533-00013', 'Africa/Accra', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('ET', '+0902+03842', 'Africa/Addis_Ababa', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('DZ', '+3647+00303', 'Africa/Algiers', '', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('ER', '+1520+03853', 'Africa/Asmara', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Africa/Asmera', '', '+03:00', '+03:00', 'Link to Africa/Asmara');
INSERT INTO `timezones` VALUES ('ML', '+1239-00800', 'Africa/Bamako', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('CF', '+0422+01835', 'Africa/Bangui', '', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('GM', '+1328-01639', 'Africa/Banjul', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('GW', '+1151-01535', 'Africa/Bissau', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('MW', '-1547+03500', 'Africa/Blantyre', '', '+02:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('CG', '-0416+01517', 'Africa/Brazzaville', '', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('BI', '-0323+02922', 'Africa/Bujumbura', '', '+02:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('EG', '+3003+03115', 'Africa/Cairo', '', '+02:00', '+02:00', 'DST has been canceled since 2011');
INSERT INTO `timezones` VALUES ('MA', '+3339-00735', 'Africa/Casablanca', '', '+00:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('ES', '+3553-00519', 'Africa/Ceuta', 'Ceuta & Melilla', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('GN', '+0931-01343', 'Africa/Conakry', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('SN', '+1440-01726', 'Africa/Dakar', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('TZ', '-0648+03917', 'Africa/Dar_es_Salaam', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('DJ', '+1136+04309', 'Africa/Djibouti', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('CM', '+0403+00942', 'Africa/Douala', '', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('EH', '+2709-01312', 'Africa/El_Aaiun', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('SL', '+0830-01315', 'Africa/Freetown', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('BW', '-2439+02555', 'Africa/Gaborone', '', '+02:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('ZW', '-1750+03103', 'Africa/Harare', '', '+02:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('ZA', '-2615+02800', 'Africa/Johannesburg', '', '+02:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('SS', '+0451+03136', 'Africa/Juba', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('UG', '+0019+03225', 'Africa/Kampala', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('SD', '+1536+03232', 'Africa/Khartoum', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('RW', '-0157+03004', 'Africa/Kigali', '', '+02:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('CD', '-0418+01518', 'Africa/Kinshasa', 'west Dem. Rep. of Congo', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('NG', '+0627+00324', 'Africa/Lagos', '', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('GA', '+0023+00927', 'Africa/Libreville', '', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('TG', '+0608+00113', 'Africa/Lome', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('AO', '-0848+01314', 'Africa/Luanda', '', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('CD', '-1140+02728', 'Africa/Lubumbashi', 'east Dem. Rep. of Congo', '+02:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('ZM', '-1525+02817', 'Africa/Lusaka', '', '+02:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('GQ', '+0345+00847', 'Africa/Malabo', '', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('MZ', '-2558+03235', 'Africa/Maputo', '', '+02:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('LS', '-2928+02730', 'Africa/Maseru', '', '+02:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('SZ', '-2618+03106', 'Africa/Mbabane', '', '+02:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('SO', '+0204+04522', 'Africa/Mogadishu', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('LR', '+0618-01047', 'Africa/Monrovia', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('KE', '-0117+03649', 'Africa/Nairobi', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('TD', '+1207+01503', 'Africa/Ndjamena', '', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('NE', '+1331+00207', 'Africa/Niamey', '', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('MR', '+1806-01557', 'Africa/Nouakchott', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('BF', '+1222-00131', 'Africa/Ouagadougou', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('BJ', '+0629+00237', 'Africa/Porto-Novo', '', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('ST', '+0020+00644', 'Africa/Sao_Tome', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Africa/Timbuktu', '', '+00:00', '+00:00', 'Link to Africa/Bamako');
INSERT INTO `timezones` VALUES ('LY', '+3254+01311', 'Africa/Tripoli', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('TN', '+3648+01011', 'Africa/Tunis', '', '+01:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('NA', '-2234+01706', 'Africa/Windhoek', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('', '', 'AKST9AKDT', '', 'âˆ’09:00', 'âˆ’08:00', 'Link to America/Anchorage');
INSERT INTO `timezones` VALUES ('US', '+515248-1763929', 'America/Adak', 'Aleutian Islands', 'âˆ’10:00', 'âˆ’09:00', '');
INSERT INTO `timezones` VALUES ('US', '+611305-1495401', 'America/Anchorage', 'Alaska Time', 'âˆ’09:00', 'âˆ’08:00', '');
INSERT INTO `timezones` VALUES ('AI', '+1812-06304', 'America/Anguilla', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('AG', '+1703-06148', 'America/Antigua', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('BR', '-0712-04812', 'America/Araguaina', 'Tocantins', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AR', '-3436-05827', 'America/Argentina/Buenos_Aires', 'Buenos Aires (BA, CF)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AR', '-2828-06547', 'America/Argentina/Catamarca', 'Catamarca (CT), Chubut (CH)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Argentina/ComodRivadavia', '', 'âˆ’03:00', 'âˆ’03:00', 'Link to America/Argentina/Catamarca');
INSERT INTO `timezones` VALUES ('AR', '-3124-06411', 'America/Argentina/Cordoba', 'most locations (CB, CC, CN, ER, FM, MN, SE, SF)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AR', '-2411-06518', 'America/Argentina/Jujuy', 'Jujuy (JY)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AR', '-2926-06651', 'America/Argentina/La_Rioja', 'La Rioja (LR)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AR', '-3253-06849', 'America/Argentina/Mendoza', 'Mendoza (MZ)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AR', '-5138-06913', 'America/Argentina/Rio_Gallegos', 'Santa Cruz (SC)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AR', '-2447-06525', 'America/Argentina/Salta', '(SA, LP, NQ, RN)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AR', '-3132-06831', 'America/Argentina/San_Juan', 'San Juan (SJ)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AR', '-3319-06621', 'America/Argentina/San_Luis', 'San Luis (SL)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AR', '-2649-06513', 'America/Argentina/Tucuman', 'Tucuman (TM)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AR', '-5448-06818', 'America/Argentina/Ushuaia', 'Tierra del Fuego (TF)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AW', '+1230-06958', 'America/Aruba', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('PY', '-2516-05740', 'America/Asuncion', '', 'âˆ’04:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('CA', '+484531-0913718', 'America/Atikokan', 'Eastern Standard Time - Atikokan, Ontario and Southampton I, Nunavut', 'âˆ’05:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Atka', '', 'âˆ’10:00', 'âˆ’09:00', 'Link to America/Adak');
INSERT INTO `timezones` VALUES ('BR', '-1259-03831', 'America/Bahia', 'Bahia', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('MX', '+2048-10515', 'America/Bahia_Banderas', 'Mexican Central Time - Bahia de Banderas', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('BB', '+1306-05937', 'America/Barbados', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('BR', '-0127-04829', 'America/Belem', 'Amapa, E Para', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('BZ', '+1730-08812', 'America/Belize', '', 'âˆ’06:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('CA', '+5125-05707', 'America/Blanc-Sablon', 'Atlantic Standard Time - Quebec - Lower North Shore', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('BR', '+0249-06040', 'America/Boa_Vista', 'Roraima', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('CO', '+0436-07405', 'America/Bogota', '', 'âˆ’05:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('US', '+433649-1161209', 'America/Boise', 'Mountain Time - south Idaho & east Oregon', 'âˆ’07:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Buenos_Aires', '', 'âˆ’03:00', 'âˆ’03:00', 'Link to America/Argentina/Buenos_Aires');
INSERT INTO `timezones` VALUES ('CA', '+690650-1050310', 'America/Cambridge_Bay', 'Mountain Time - west Nunavut', 'âˆ’07:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('BR', '-2027-05437', 'America/Campo_Grande', 'Mato Grosso do Sul', 'âˆ’04:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('MX', '+2105-08646', 'America/Cancun', 'Central Time - Quintana Roo', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('VE', '+1030-06656', 'America/Caracas', '', 'âˆ’04:30', 'âˆ’04:30', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Catamarca', '', 'âˆ’03:00', 'âˆ’03:00', 'Link to America/Argentina/Catamarca');
INSERT INTO `timezones` VALUES ('GF', '+0456-05220', 'America/Cayenne', '', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('KY', '+1918-08123', 'America/Cayman', '', 'âˆ’05:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('US', '+415100-0873900', 'America/Chicago', 'Central Time', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('MX', '+2838-10605', 'America/Chihuahua', 'Mexican Mountain Time - Chihuahua away from US border', 'âˆ’07:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Coral_Harbour', '', 'âˆ’05:00', 'âˆ’05:00', 'Link to America/Atikokan');
INSERT INTO `timezones` VALUES ('', '', 'America/Cordoba', '', 'âˆ’03:00', 'âˆ’03:00', 'Link to America/Argentina/Cordoba');
INSERT INTO `timezones` VALUES ('CR', '+0956-08405', 'America/Costa_Rica', '', 'âˆ’06:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('CA', '+4906-11631', 'America/Creston', 'Mountain Standard Time - Creston, British Columbia', 'âˆ’07:00', 'âˆ’07:00', '');
INSERT INTO `timezones` VALUES ('BR', '-1535-05605', 'America/Cuiaba', 'Mato Grosso', 'âˆ’04:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('CW', '+1211-06900', 'America/Curacao', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('GL', '+7646-01840', 'America/Danmarkshavn', 'east coast, north of Scoresbysund', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('CA', '+6404-13925', 'America/Dawson', 'Pacific Time - north Yukon', 'âˆ’08:00', 'âˆ’07:00', '');
INSERT INTO `timezones` VALUES ('CA', '+5946-12014', 'America/Dawson_Creek', 'Mountain Standard Time - Dawson Creek & Fort Saint John, British Columbia', 'âˆ’07:00', 'âˆ’07:00', '');
INSERT INTO `timezones` VALUES ('US', '+394421-1045903', 'America/Denver', 'Mountain Time', 'âˆ’07:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('US', '+421953-0830245', 'America/Detroit', 'Eastern Time - Michigan - most locations', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('DM', '+1518-06124', 'America/Dominica', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('CA', '+5333-11328', 'America/Edmonton', 'Mountain Time - Alberta, east British Columbia & west Saskatchewan', 'âˆ’07:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('BR', '-0640-06952', 'America/Eirunepe', 'W Amazonas', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('SV', '+1342-08912', 'America/El_Salvador', '', 'âˆ’06:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Ensenada', '', 'âˆ’08:00', 'âˆ’07:00', 'Link to America/Tijuana');
INSERT INTO `timezones` VALUES ('BR', '-0343-03830', 'America/Fortaleza', 'NE Brazil (MA, PI, CE, RN, PB)', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Fort_Wayne', '', 'âˆ’05:00', 'âˆ’04:00', 'Link to America/Indiana/Indianapolis');
INSERT INTO `timezones` VALUES ('CA', '+4612-05957', 'America/Glace_Bay', 'Atlantic Time - Nova Scotia - places that did not observe DST 1966-1971', 'âˆ’04:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('GL', '+6411-05144', 'America/Godthab', 'most locations', 'âˆ’03:00', 'âˆ’02:00', '');
INSERT INTO `timezones` VALUES ('CA', '+5320-06025', 'America/Goose_Bay', 'Atlantic Time - Labrador - most locations', 'âˆ’04:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('TC', '+2128-07108', 'America/Grand_Turk', '', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('GD', '+1203-06145', 'America/Grenada', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('GP', '+1614-06132', 'America/Guadeloupe', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('GT', '+1438-09031', 'America/Guatemala', '', 'âˆ’06:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('EC', '-0210-07950', 'America/Guayaquil', 'mainland', 'âˆ’05:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('GY', '+0648-05810', 'America/Guyana', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('CA', '+4439-06336', 'America/Halifax', 'Atlantic Time - Nova Scotia (most places), PEI', 'âˆ’04:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('CU', '+2308-08222', 'America/Havana', '', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('MX', '+2904-11058', 'America/Hermosillo', 'Mountain Standard Time - Sonora', 'âˆ’07:00', 'âˆ’07:00', '');
INSERT INTO `timezones` VALUES ('US', '+394606-0860929', 'America/Indiana/Indianapolis', 'Eastern Time - Indiana - most locations', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('US', '+411745-0863730', 'America/Indiana/Knox', 'Central Time - Indiana - Starke County', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('US', '+382232-0862041', 'America/Indiana/Marengo', 'Eastern Time - Indiana - Crawford County', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('US', '+382931-0871643', 'America/Indiana/Petersburg', 'Eastern Time - Indiana - Pike County', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('US', '+375711-0864541', 'America/Indiana/Tell_City', 'Central Time - Indiana - Perry County', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('US', '+384452-0850402', 'America/Indiana/Vevay', 'Eastern Time - Indiana - Switzerland County', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('US', '+384038-0873143', 'America/Indiana/Vincennes', 'Eastern Time - Indiana - Daviess, Dubois, Knox & Martin Counties', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('US', '+410305-0863611', 'America/Indiana/Winamac', 'Eastern Time - Indiana - Pulaski County', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Indianapolis', '', 'âˆ’05:00', 'âˆ’04:00', 'Link to America/Indiana/Indianapolis');
INSERT INTO `timezones` VALUES ('CA', '+682059-1334300', 'America/Inuvik', 'Mountain Time - west Northwest Territories', 'âˆ’07:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('CA', '+6344-06828', 'America/Iqaluit', 'Eastern Time - east Nunavut - most locations', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('JM', '+1800-07648', 'America/Jamaica', '', 'âˆ’05:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Jujuy', '', 'âˆ’03:00', 'âˆ’03:00', 'Link to America/Argentina/Jujuy');
INSERT INTO `timezones` VALUES ('US', '+581807-1342511', 'America/Juneau', 'Alaska Time - Alaska panhandle', 'âˆ’09:00', 'âˆ’08:00', '');
INSERT INTO `timezones` VALUES ('US', '+381515-0854534', 'America/Kentucky/Louisville', 'Eastern Time - Kentucky - Louisville area', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('US', '+364947-0845057', 'America/Kentucky/Monticello', 'Eastern Time - Kentucky - Wayne County', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Knox_IN', '', 'âˆ’06:00', 'âˆ’05:00', 'Link to America/Indiana/Knox');
INSERT INTO `timezones` VALUES ('BQ', '+120903-0681636', 'America/Kralendijk', '', 'âˆ’04:00', 'âˆ’04:00', 'Link to America/Curacao');
INSERT INTO `timezones` VALUES ('BO', '-1630-06809', 'America/La_Paz', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('PE', '-1203-07703', 'America/Lima', '', 'âˆ’05:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('US', '+340308-1181434', 'America/Los_Angeles', 'Pacific Time', 'âˆ’08:00', 'âˆ’07:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Louisville', '', 'âˆ’05:00', 'âˆ’04:00', 'Link to America/Kentucky/Louisville');
INSERT INTO `timezones` VALUES ('SX', '+180305-0630250', 'America/Lower_Princes', '', 'âˆ’04:00', 'âˆ’04:00', 'Link to America/Curacao');
INSERT INTO `timezones` VALUES ('BR', '-0940-03543', 'America/Maceio', 'Alagoas, Sergipe', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('NI', '+1209-08617', 'America/Managua', '', 'âˆ’06:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('BR', '-0308-06001', 'America/Manaus', 'E Amazonas', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('MF', '+1804-06305', 'America/Marigot', '', 'âˆ’04:00', 'âˆ’04:00', 'Link to America/Guadeloupe');
INSERT INTO `timezones` VALUES ('MQ', '+1436-06105', 'America/Martinique', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('MX', '+2550-09730', 'America/Matamoros', 'US Central Time - Coahuila, Durango, Nuevo LeÃ³n, Tamaulipas near US border', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('MX', '+2313-10625', 'America/Mazatlan', 'Mountain Time - S Baja, Nayarit, Sinaloa', 'âˆ’07:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Mendoza', '', 'âˆ’03:00', 'âˆ’03:00', 'Link to America/Argentina/Mendoza');
INSERT INTO `timezones` VALUES ('US', '+450628-0873651', 'America/Menominee', 'Central Time - Michigan - Dickinson, Gogebic, Iron & Menominee Counties', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('MX', '+2058-08937', 'America/Merida', 'Central Time - Campeche, YucatÃ¡n', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('US', '+550737-1313435', 'America/Metlakatla', 'Metlakatla Time - Annette Island', 'âˆ’08:00', 'âˆ’08:00', '');
INSERT INTO `timezones` VALUES ('MX', '+1924-09909', 'America/Mexico_City', 'Central Time - most locations', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('PM', '+4703-05620', 'America/Miquelon', '', 'âˆ’03:00', 'âˆ’02:00', '');
INSERT INTO `timezones` VALUES ('CA', '+4606-06447', 'America/Moncton', 'Atlantic Time - New Brunswick', 'âˆ’04:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('MX', '+2540-10019', 'America/Monterrey', 'Mexican Central Time - Coahuila, Durango, Nuevo LeÃ³n, Tamaulipas away from US border', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('UY', '-3453-05611', 'America/Montevideo', '', 'âˆ’03:00', 'âˆ’02:00', '');
INSERT INTO `timezones` VALUES ('CA', '+4531-07334', 'America/Montreal', 'Eastern Time - Quebec - most locations', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('MS', '+1643-06213', 'America/Montserrat', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('BS', '+2505-07721', 'America/Nassau', '', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('US', '+404251-0740023', 'America/New_York', 'Eastern Time', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('CA', '+4901-08816', 'America/Nipigon', 'Eastern Time - Ontario & Quebec - places that did not observe DST 1967-1973', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('US', '+643004-1652423', 'America/Nome', 'Alaska Time - west Alaska', 'âˆ’09:00', 'âˆ’08:00', '');
INSERT INTO `timezones` VALUES ('BR', '-0351-03225', 'America/Noronha', 'Atlantic islands', 'âˆ’02:00', 'âˆ’02:00', '');
INSERT INTO `timezones` VALUES ('US', '+471551-1014640', 'America/North_Dakota/Beulah', 'Central Time - North Dakota - Mercer County', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('US', '+470659-1011757', 'America/North_Dakota/Center', 'Central Time - North Dakota - Oliver County', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('US', '+465042-1012439', 'America/North_Dakota/New_Salem', 'Central Time - North Dakota - Morton County (except Mandan area)', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('MX', '+2934-10425', 'America/Ojinaga', 'US Mountain Time - Chihuahua near US border', 'âˆ’07:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('PA', '+0858-07932', 'America/Panama', '', 'âˆ’05:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('CA', '+6608-06544', 'America/Pangnirtung', 'Eastern Time - Pangnirtung, Nunavut', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('SR', '+0550-05510', 'America/Paramaribo', '', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('US', '+332654-1120424', 'America/Phoenix', 'Mountain Standard Time - Arizona', 'âˆ’07:00', 'âˆ’07:00', '');
INSERT INTO `timezones` VALUES ('HT', '+1832-07220', 'America/Port-au-Prince', '', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Porto_Acre', '', 'âˆ’04:00', 'âˆ’04:00', 'Link to America/Rio_Branco');
INSERT INTO `timezones` VALUES ('BR', '-0846-06354', 'America/Porto_Velho', 'Rondonia', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('TT', '+1039-06131', 'America/Port_of_Spain', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('PR', '+182806-0660622', 'America/Puerto_Rico', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('CA', '+4843-09434', 'America/Rainy_River', 'Central Time - Rainy River & Fort Frances, Ontario', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('CA', '+624900-0920459', 'America/Rankin_Inlet', 'Central Time - central Nunavut', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('BR', '-0803-03454', 'America/Recife', 'Pernambuco', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('CA', '+5024-10439', 'America/Regina', 'Central Standard Time - Saskatchewan - most locations', 'âˆ’06:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('CA', '+744144-0944945', 'America/Resolute', 'Central Standard Time - Resolute, Nunavut', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('BR', '-0958-06748', 'America/Rio_Branco', 'Acre', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Rosario', '', 'âˆ’03:00', 'âˆ’03:00', 'Link to America/Argentina/Cordoba');
INSERT INTO `timezones` VALUES ('BR', '-0226-05452', 'America/Santarem', 'W Para', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('MX', '+3018-11452', 'America/Santa_Isabel', 'Mexican Pacific Time - Baja California away from US border', 'âˆ’08:00', 'âˆ’07:00', '');
INSERT INTO `timezones` VALUES ('CL', '-3327-07040', 'America/Santiago', 'most locations', 'âˆ’04:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('DO', '+1828-06954', 'America/Santo_Domingo', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('BR', '-2332-04637', 'America/Sao_Paulo', 'S & SE Brazil (GO, DF, MG, ES, RJ, SP, PR, SC, RS)', 'âˆ’03:00', 'âˆ’02:00', '');
INSERT INTO `timezones` VALUES ('GL', '+7029-02158', 'America/Scoresbysund', 'Scoresbysund / Ittoqqortoormiit', 'âˆ’01:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('US', '+364708-1084111', 'America/Shiprock', 'Mountain Time - Navajo', 'âˆ’07:00', 'âˆ’06:00', 'Link to America/Denver');
INSERT INTO `timezones` VALUES ('US', '+571035-1351807', 'America/Sitka', 'Alaska Time - southeast Alaska panhandle', 'âˆ’09:00', 'âˆ’08:00', '');
INSERT INTO `timezones` VALUES ('BL', '+1753-06251', 'America/St_Barthelemy', '', 'âˆ’04:00', 'âˆ’04:00', 'Link to America/Guadeloupe');
INSERT INTO `timezones` VALUES ('CA', '+4734-05243', 'America/St_Johns', 'Newfoundland Time, including SE Labrador', 'âˆ’03:30', 'âˆ’02:30', '');
INSERT INTO `timezones` VALUES ('KN', '+1718-06243', 'America/St_Kitts', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('LC', '+1401-06100', 'America/St_Lucia', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('VI', '+1821-06456', 'America/St_Thomas', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('VC', '+1309-06114', 'America/St_Vincent', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('CA', '+5017-10750', 'America/Swift_Current', 'Central Standard Time - Saskatchewan - midwest', 'âˆ’06:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('HN', '+1406-08713', 'America/Tegucigalpa', '', 'âˆ’06:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('GL', '+7634-06847', 'America/Thule', 'Thule / Pituffik', 'âˆ’04:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('CA', '+4823-08915', 'America/Thunder_Bay', 'Eastern Time - Thunder Bay, Ontario', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('MX', '+3232-11701', 'America/Tijuana', 'US Pacific Time - Baja California near US border', 'âˆ’08:00', 'âˆ’07:00', '');
INSERT INTO `timezones` VALUES ('CA', '+4339-07923', 'America/Toronto', 'Eastern Time - Ontario - most locations', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('VG', '+1827-06437', 'America/Tortola', '', 'âˆ’04:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('CA', '+4916-12307', 'America/Vancouver', 'Pacific Time - west British Columbia', 'âˆ’08:00', 'âˆ’07:00', '');
INSERT INTO `timezones` VALUES ('', '', 'America/Virgin', '', 'âˆ’04:00', 'âˆ’04:00', 'Link to America/St_Thomas');
INSERT INTO `timezones` VALUES ('CA', '+6043-13503', 'America/Whitehorse', 'Pacific Time - south Yukon', 'âˆ’08:00', 'âˆ’07:00', '');
INSERT INTO `timezones` VALUES ('CA', '+4953-09709', 'America/Winnipeg', 'Central Time - Manitoba & west Ontario', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('US', '+593249-1394338', 'America/Yakutat', 'Alaska Time - Alaska panhandle neck', 'âˆ’09:00', 'âˆ’08:00', '');
INSERT INTO `timezones` VALUES ('CA', '+6227-11421', 'America/Yellowknife', 'Mountain Time - central Northwest Territories', 'âˆ’07:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('AQ', '-6617+11031', 'Antarctica/Casey', 'Casey Station, Bailey Peninsula', '+11:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('AQ', '-6835+07758', 'Antarctica/Davis', 'Davis Station, Vestfold Hills', '+05:00', '+07:00', '');
INSERT INTO `timezones` VALUES ('AQ', '-6640+14001', 'Antarctica/DumontDUrville', 'Dumont-dUrville Station, Terre Adelie', '+10:00', '+10:00', '');
INSERT INTO `timezones` VALUES ('AQ', '-5430+15857', 'Antarctica/Macquarie', 'Macquarie Island Station, Macquarie Island', '+11:00', '+11:00', '');
INSERT INTO `timezones` VALUES ('AQ', '-6736+06253', 'Antarctica/Mawson', 'Mawson Station, Holme Bay', '+05:00', '+05:00', '');
INSERT INTO `timezones` VALUES ('AQ', '-7750+16636', 'Antarctica/McMurdo', 'McMurdo Station, Ross Island', '+12:00', '+13:00', '');
INSERT INTO `timezones` VALUES ('AQ', '-6448-06406', 'Antarctica/Palmer', 'Palmer Station, Anvers Island', 'âˆ’04:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AQ', '-6734-06808', 'Antarctica/Rothera', 'Rothera Station, Adelaide Island', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('AQ', '-9000+00000', 'Antarctica/South_Pole', 'Amundsen-Scott Station, South Pole', '+12:00', '+13:00', 'Link to Antarctica/McMurdo');
INSERT INTO `timezones` VALUES ('AQ', '-690022+0393524', 'Antarctica/Syowa', 'Syowa Station, E Ongul I', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('AQ', '-7824+10654', 'Antarctica/Vostok', 'Vostok Station, Lake Vostok', '+06:00', '+06:00', '');
INSERT INTO `timezones` VALUES ('SJ', '+7800+01600', 'Arctic/Longyearbyen', '', '+01:00', '+02:00', 'Link to Europe/Oslo');
INSERT INTO `timezones` VALUES ('YE', '+1245+04512', 'Asia/Aden', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('KZ', '+4315+07657', 'Asia/Almaty', 'most locations', '+06:00', '+06:00', '');
INSERT INTO `timezones` VALUES ('JO', '+3157+03556', 'Asia/Amman', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('RU', '+6445+17729', 'Asia/Anadyr', 'Moscow+08 - Bering Sea', '+12:00', '+12:00', '');
INSERT INTO `timezones` VALUES ('KZ', '+4431+05016', 'Asia/Aqtau', 'Atyrau (Atirau, Guryev), Mangghystau (Mankistau)', '+05:00', '+05:00', '');
INSERT INTO `timezones` VALUES ('KZ', '+5017+05710', 'Asia/Aqtobe', 'Aqtobe (Aktobe)', '+05:00', '+05:00', '');
INSERT INTO `timezones` VALUES ('TM', '+3757+05823', 'Asia/Ashgabat', '', '+05:00', '+05:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Asia/Ashkhabad', '', '+05:00', '+05:00', 'Link to Asia/Ashgabat');
INSERT INTO `timezones` VALUES ('IQ', '+3321+04425', 'Asia/Baghdad', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('BH', '+2623+05035', 'Asia/Bahrain', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('AZ', '+4023+04951', 'Asia/Baku', '', '+04:00', '+05:00', '');
INSERT INTO `timezones` VALUES ('TH', '+1345+10031', 'Asia/Bangkok', '', '+07:00', '+07:00', '');
INSERT INTO `timezones` VALUES ('LB', '+3353+03530', 'Asia/Beirut', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('KG', '+4254+07436', 'Asia/Bishkek', '', '+06:00', '+06:00', '');
INSERT INTO `timezones` VALUES ('BN', '+0456+11455', 'Asia/Brunei', '', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Asia/Calcutta', '', '+05:30', '+05:30', 'Link to Asia/Kolkata');
INSERT INTO `timezones` VALUES ('MN', '+4804+11430', 'Asia/Choibalsan', 'Dornod, Sukhbaatar', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('CN', '+2934+10635', 'Asia/Chongqing', 'central China - Sichuan, Yunnan, Guangxi, Shaanxi, Guizhou, etc.', '+08:00', '+08:00', 'Covering historic Kansu-Szechuan time zone.');
INSERT INTO `timezones` VALUES ('', '', 'Asia/Chungking', '', '+08:00', '+08:00', 'Link to Asia/Chongqing');
INSERT INTO `timezones` VALUES ('LK', '+0656+07951', 'Asia/Colombo', '', '+05:30', '+05:30', '');
INSERT INTO `timezones` VALUES ('', '', 'Asia/Dacca', '', '+06:00', '+06:00', 'Link to Asia/Dhaka');
INSERT INTO `timezones` VALUES ('SY', '+3330+03618', 'Asia/Damascus', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('BD', '+2343+09025', 'Asia/Dhaka', '', '+06:00', '+06:00', '');
INSERT INTO `timezones` VALUES ('TL', '-0833+12535', 'Asia/Dili', '', '+09:00', '+09:00', '');
INSERT INTO `timezones` VALUES ('AE', '+2518+05518', 'Asia/Dubai', '', '+04:00', '+04:00', '');
INSERT INTO `timezones` VALUES ('TJ', '+3835+06848', 'Asia/Dushanbe', '', '+05:00', '+05:00', '');
INSERT INTO `timezones` VALUES ('PS', '+3130+03428', 'Asia/Gaza', 'Gaza Strip', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('CN', '+4545+12641', 'Asia/Harbin', 'Heilongjiang (except Mohe), Jilin', '+08:00', '+08:00', 'Covering historic Changpai time zone.');
INSERT INTO `timezones` VALUES ('PS', '+313200+0350542', 'Asia/Hebron', 'West Bank', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('HK', '+2217+11409', 'Asia/Hong_Kong', '', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('MN', '+4801+09139', 'Asia/Hovd', 'Bayan-Olgiy, Govi-Altai, Hovd, Uvs, Zavkhan', '+07:00', '+07:00', '');
INSERT INTO `timezones` VALUES ('VN', '+1045+10640', 'Asia/Ho_Chi_Minh', '', '+07:00', '+07:00', '');
INSERT INTO `timezones` VALUES ('RU', '+5216+10420', 'Asia/Irkutsk', 'Moscow+05 - Lake Baikal', '+09:00', '+09:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Asia/Istanbul', '', '+02:00', '+03:00', 'Link to Europe/Istanbul');
INSERT INTO `timezones` VALUES ('ID', '-0610+10648', 'Asia/Jakarta', 'Java & Sumatra', '+07:00', '+07:00', '');
INSERT INTO `timezones` VALUES ('ID', '-0232+14042', 'Asia/Jayapura', 'west New Guinea (Irian Jaya) & Malukus (Moluccas)', '+09:00', '+09:00', '');
INSERT INTO `timezones` VALUES ('IL', '+3146+03514', 'Asia/Jerusalem', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('AF', '+3431+06912', 'Asia/Kabul', '', '+04:30', '+04:30', '');
INSERT INTO `timezones` VALUES ('RU', '+5301+15839', 'Asia/Kamchatka', 'Moscow+08 - Kamchatka', '+12:00', '+12:00', '');
INSERT INTO `timezones` VALUES ('PK', '+2452+06703', 'Asia/Karachi', '', '+05:00', '+05:00', '');
INSERT INTO `timezones` VALUES ('CN', '+3929+07559', 'Asia/Kashgar', 'west Tibet & Xinjiang', '+08:00', '+08:00', 'Covering historic Kunlun time zone.');
INSERT INTO `timezones` VALUES ('NP', '+2743+08519', 'Asia/Kathmandu', '', '+05:45', '+05:45', '');
INSERT INTO `timezones` VALUES ('', '', 'Asia/Katmandu', '', '+05:45', '+05:45', 'Link to Asia/Kathmandu');
INSERT INTO `timezones` VALUES ('IN', '+2232+08822', 'Asia/Kolkata', '', '+05:30', '+05:30', 'Note: Different zones in history, see Time in India.');
INSERT INTO `timezones` VALUES ('RU', '+5601+09250', 'Asia/Krasnoyarsk', 'Moscow+04 - Yenisei River', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('MY', '+0310+10142', 'Asia/Kuala_Lumpur', 'peninsular Malaysia', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('MY', '+0133+11020', 'Asia/Kuching', 'Sabah & Sarawak', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('KW', '+2920+04759', 'Asia/Kuwait', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Asia/Macao', '', '+08:00', '+08:00', 'Link to Asia/Macau');
INSERT INTO `timezones` VALUES ('MO', '+2214+11335', 'Asia/Macau', '', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('RU', '+5934+15048', 'Asia/Magadan', 'Moscow+08 - Magadan', '+12:00', '+12:00', '');
INSERT INTO `timezones` VALUES ('ID', '-0507+11924', 'Asia/Makassar', 'east & south Borneo, Sulawesi (Celebes), Bali, Nusa Tenggara, west Timor', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('PH', '+1435+12100', 'Asia/Manila', '', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('OM', '+2336+05835', 'Asia/Muscat', '', '+04:00', '+04:00', '');
INSERT INTO `timezones` VALUES ('CY', '+3510+03322', 'Asia/Nicosia', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('RU', '+5345+08707', 'Asia/Novokuznetsk', 'Moscow+03 - Novokuznetsk', '+07:00', '+07:00', '');
INSERT INTO `timezones` VALUES ('RU', '+5502+08255', 'Asia/Novosibirsk', 'Moscow+03 - Novosibirsk', '+07:00', '+07:00', '');
INSERT INTO `timezones` VALUES ('RU', '+5500+07324', 'Asia/Omsk', 'Moscow+03 - west Siberia', '+07:00', '+07:00', '');
INSERT INTO `timezones` VALUES ('KZ', '+5113+05121', 'Asia/Oral', 'West Kazakhstan', '+05:00', '+05:00', '');
INSERT INTO `timezones` VALUES ('KH', '+1133+10455', 'Asia/Phnom_Penh', '', '+07:00', '+07:00', '');
INSERT INTO `timezones` VALUES ('ID', '-0002+10920', 'Asia/Pontianak', 'west & central Borneo', '+07:00', '+07:00', '');
INSERT INTO `timezones` VALUES ('KP', '+3901+12545', 'Asia/Pyongyang', '', '+09:00', '+09:00', '');
INSERT INTO `timezones` VALUES ('QA', '+2517+05132', 'Asia/Qatar', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('KZ', '+4448+06528', 'Asia/Qyzylorda', 'Qyzylorda (Kyzylorda, Kzyl-Orda)', '+06:00', '+06:00', '');
INSERT INTO `timezones` VALUES ('MM', '+1647+09610', 'Asia/Rangoon', '', '+06:30', '+06:30', '');
INSERT INTO `timezones` VALUES ('SA', '+2438+04643', 'Asia/Riyadh', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Asia/Saigon', '', '+07:00', '+07:00', 'Link to Asia/Ho_Chi_Minh');
INSERT INTO `timezones` VALUES ('RU', '+4658+14242', 'Asia/Sakhalin', 'Moscow+07 - Sakhalin Island', '+11:00', '+11:00', '');
INSERT INTO `timezones` VALUES ('UZ', '+3940+06648', 'Asia/Samarkand', 'west Uzbekistan', '+05:00', '+05:00', '');
INSERT INTO `timezones` VALUES ('KR', '+3733+12658', 'Asia/Seoul', '', '+09:00', '+09:00', '');
INSERT INTO `timezones` VALUES ('CN', '+3114+12128', 'Asia/Shanghai', 'east China - Beijing, Guangdong, Shanghai, etc.', '+08:00', '+08:00', 'Covering historic Chungyuan time zone.');
INSERT INTO `timezones` VALUES ('SG', '+0117+10351', 'Asia/Singapore', '', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('TW', '+2503+12130', 'Asia/Taipei', '', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('UZ', '+4120+06918', 'Asia/Tashkent', 'east Uzbekistan', '+05:00', '+05:00', '');
INSERT INTO `timezones` VALUES ('GE', '+4143+04449', 'Asia/Tbilisi', '', '+04:00', '+04:00', '');
INSERT INTO `timezones` VALUES ('IR', '+3540+05126', 'Asia/Tehran', '', '+03:30', '+04:30', '');
INSERT INTO `timezones` VALUES ('', '', 'Asia/Tel_Aviv', '', '+02:00', '+03:00', 'Link to Asia/Jerusalem');
INSERT INTO `timezones` VALUES ('', '', 'Asia/Thimbu', '', '+06:00', '+06:00', 'Link to Asia/Thimphu');
INSERT INTO `timezones` VALUES ('BT', '+2728+08939', 'Asia/Thimphu', '', '+06:00', '+06:00', '');
INSERT INTO `timezones` VALUES ('JP', '+353916+1394441', 'Asia/Tokyo', '', '+09:00', '+09:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Asia/Ujung_Pandang', '', '+08:00', '+08:00', 'Link to Asia/Makassar');
INSERT INTO `timezones` VALUES ('MN', '+4755+10653', 'Asia/Ulaanbaatar', 'most locations', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Asia/Ulan_Bator', '', '+08:00', '+08:00', 'Link to Asia/Ulaanbaatar');
INSERT INTO `timezones` VALUES ('CN', '+4348+08735', 'Asia/Urumqi', 'most of Tibet & Xinjiang', '+08:00', '+08:00', 'Covering historic Sinkiang-Tibet time zone.');
INSERT INTO `timezones` VALUES ('LA', '+1758+10236', 'Asia/Vientiane', '', '+07:00', '+07:00', '');
INSERT INTO `timezones` VALUES ('RU', '+4310+13156', 'Asia/Vladivostok', 'Moscow+07 - Amur River', '+11:00', '+11:00', '');
INSERT INTO `timezones` VALUES ('RU', '+6200+12940', 'Asia/Yakutsk', 'Moscow+06 - Lena River', '+10:00', '+10:00', '');
INSERT INTO `timezones` VALUES ('RU', '+5651+06036', 'Asia/Yekaterinburg', 'Moscow+02 - Urals', '+06:00', '+06:00', '');
INSERT INTO `timezones` VALUES ('AM', '+4011+04430', 'Asia/Yerevan', '', '+04:00', '+04:00', '');
INSERT INTO `timezones` VALUES ('PT', '+3744-02540', 'Atlantic/Azores', 'Azores', 'âˆ’01:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('BM', '+3217-06446', 'Atlantic/Bermuda', '', 'âˆ’04:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('ES', '+2806-01524', 'Atlantic/Canary', 'Canary Islands', '+00:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('CV', '+1455-02331', 'Atlantic/Cape_Verde', '', 'âˆ’01:00', 'âˆ’01:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Atlantic/Faeroe', '', '+00:00', '+01:00', 'Link to Atlantic/Faroe');
INSERT INTO `timezones` VALUES ('FO', '+6201-00646', 'Atlantic/Faroe', '', '+00:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Atlantic/Jan_Mayen', '', '+01:00', '+02:00', 'Link to Europe/Oslo');
INSERT INTO `timezones` VALUES ('PT', '+3238-01654', 'Atlantic/Madeira', 'Madeira Islands', '+00:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('IS', '+6409-02151', 'Atlantic/Reykjavik', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('GS', '-5416-03632', 'Atlantic/South_Georgia', '', 'âˆ’02:00', 'âˆ’02:00', '');
INSERT INTO `timezones` VALUES ('FK', '-5142-05751', 'Atlantic/Stanley', '', 'âˆ’03:00', 'âˆ’03:00', '');
INSERT INTO `timezones` VALUES ('SH', '-1555-00542', 'Atlantic/St_Helena', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Australia/ACT', '', '+10:00', '+11:00', 'Link to Australia/Sydney');
INSERT INTO `timezones` VALUES ('AU', '-3455+13835', 'Australia/Adelaide', 'South Australia', '+09:30', '+10:30', '');
INSERT INTO `timezones` VALUES ('AU', '-2728+15302', 'Australia/Brisbane', 'Queensland - most locations', '+10:00', '+10:00', '');
INSERT INTO `timezones` VALUES ('AU', '-3157+14127', 'Australia/Broken_Hill', 'New South Wales - Yancowinna', '+09:30', '+10:30', '');
INSERT INTO `timezones` VALUES ('', '', 'Australia/Canberra', '', '+10:00', '+11:00', 'Link to Australia/Sydney');
INSERT INTO `timezones` VALUES ('AU', '-3956+14352', 'Australia/Currie', 'Tasmania - King Island', '+10:00', '+11:00', '');
INSERT INTO `timezones` VALUES ('AU', '-1228+13050', 'Australia/Darwin', 'Northern Territory', '+09:30', '+09:30', '');
INSERT INTO `timezones` VALUES ('AU', '-3143+12852', 'Australia/Eucla', 'Western Australia - Eucla area', '+08:45', '+08:45', '');
INSERT INTO `timezones` VALUES ('AU', '-4253+14719', 'Australia/Hobart', 'Tasmania - most locations', '+10:00', '+11:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Australia/LHI', '', '+10:30', '+11:00', 'Link to Australia/Lord_Howe');
INSERT INTO `timezones` VALUES ('AU', '-2016+14900', 'Australia/Lindeman', 'Queensland - Holiday Islands', '+10:00', '+10:00', '');
INSERT INTO `timezones` VALUES ('AU', '-3133+15905', 'Australia/Lord_Howe', 'Lord Howe Island', '+10:30', '+11:00', '');
INSERT INTO `timezones` VALUES ('AU', '-3749+14458', 'Australia/Melbourne', 'Victoria', '+10:00', '+11:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Australia/North', '', '+09:30', '+09:30', 'Link to Australia/Darwin');
INSERT INTO `timezones` VALUES ('', '', 'Australia/NSW', '', '+10:00', '+11:00', 'Link to Australia/Sydney');
INSERT INTO `timezones` VALUES ('AU', '-3157+11551', 'Australia/Perth', 'Western Australia - most locations', '+08:00', '+08:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Australia/Queensland', '', '+10:00', '+10:00', 'Link to Australia/Brisbane');
INSERT INTO `timezones` VALUES ('', '', 'Australia/South', '', '+09:30', '+10:30', 'Link to Australia/Adelaide');
INSERT INTO `timezones` VALUES ('AU', '-3352+15113', 'Australia/Sydney', 'New South Wales - most locations', '+10:00', '+11:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Australia/Tasmania', '', '+10:00', '+11:00', 'Link to Australia/Hobart');
INSERT INTO `timezones` VALUES ('', '', 'Australia/Victoria', '', '+10:00', '+11:00', 'Link to Australia/Melbourne');
INSERT INTO `timezones` VALUES ('', '', 'Australia/West', '', '+08:00', '+08:00', 'Link to Australia/Perth');
INSERT INTO `timezones` VALUES ('', '', 'Australia/Yancowinna', '', '+09:30', '+10:30', 'Link to Australia/Broken_Hill');
INSERT INTO `timezones` VALUES ('', '', 'Brazil/Acre', '', 'âˆ’04:00', 'âˆ’04:00', 'Link to America/Rio_Branco');
INSERT INTO `timezones` VALUES ('', '', 'Brazil/DeNoronha', '', 'âˆ’02:00', 'âˆ’02:00', 'Link to America/Noronha');
INSERT INTO `timezones` VALUES ('', '', 'Brazil/East', '', 'âˆ’03:00', 'âˆ’02:00', 'Link to America/Sao_Paulo');
INSERT INTO `timezones` VALUES ('', '', 'Brazil/West', '', 'âˆ’04:00', 'âˆ’04:00', 'Link to America/Manaus');
INSERT INTO `timezones` VALUES ('', '', 'Canada/Atlantic', '', 'âˆ’04:00', 'âˆ’03:00', 'Link to America/Halifax');
INSERT INTO `timezones` VALUES ('', '', 'Canada/Central', '', 'âˆ’06:00', 'âˆ’05:00', 'Link to America/Winnipeg');
INSERT INTO `timezones` VALUES ('', '', 'Canada/East-Saskatchewan', '', 'âˆ’06:00', 'âˆ’06:00', 'Link to America/Regina');
INSERT INTO `timezones` VALUES ('', '', 'Canada/Eastern', '', 'âˆ’05:00', 'âˆ’04:00', 'Link to America/Toronto');
INSERT INTO `timezones` VALUES ('', '', 'Canada/Mountain', '', 'âˆ’07:00', 'âˆ’06:00', 'Link to America/Edmonton');
INSERT INTO `timezones` VALUES ('', '', 'Canada/Newfoundland', '', 'âˆ’03:30', 'âˆ’02:30', 'Link to America/St_Johns');
INSERT INTO `timezones` VALUES ('', '', 'Canada/Pacific', '', 'âˆ’08:00', 'âˆ’07:00', 'Link to America/Vancouver');
INSERT INTO `timezones` VALUES ('', '', 'Canada/Saskatchewan', '', 'âˆ’06:00', 'âˆ’06:00', 'Link to America/Regina');
INSERT INTO `timezones` VALUES ('', '', 'Canada/Yukon', '', 'âˆ’08:00', 'âˆ’07:00', 'Link to America/Whitehorse');
INSERT INTO `timezones` VALUES ('', '', 'CET', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Chile/Continental', '', 'âˆ’04:00', 'âˆ’03:00', 'Link to America/Santiago');
INSERT INTO `timezones` VALUES ('', '', 'Chile/EasterIsland', '', 'âˆ’06:00', 'âˆ’05:00', 'Link to Pacific/Easter');
INSERT INTO `timezones` VALUES ('', '', 'CST6CDT', '', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Cuba', '', 'âˆ’05:00', 'âˆ’04:00', 'Link to America/Havana');
INSERT INTO `timezones` VALUES ('', '', 'EET', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Egypt', '', '+02:00', '+02:00', 'Link to Africa/Cairo');
INSERT INTO `timezones` VALUES ('', '', 'Eire', '', '+00:00', '+01:00', 'Link to Europe/Dublin');
INSERT INTO `timezones` VALUES ('', '', 'EST', '', 'âˆ’05:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('', '', 'EST5EDT', '', 'âˆ’05:00', 'âˆ’04:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Etc./GMT', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('', '', 'Etc./GMT+0', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('', '', 'Etc./UCT', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('', '', 'Etc./Universal', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('', '', 'Etc./UTC', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('', '', 'Etc./Zulu', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('NL', '+5222+00454', 'Europe/Amsterdam', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('AD', '+4230+00131', 'Europe/Andorra', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('GR', '+3758+02343', 'Europe/Athens', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Europe/Belfast', '', '+00:00', '+01:00', 'Link to Europe/London');
INSERT INTO `timezones` VALUES ('RS', '+4450+02030', 'Europe/Belgrade', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('DE', '+5230+01322', 'Europe/Berlin', '', '+01:00', '+02:00', 'In 1945, the Trizone did not follow Berlins switch to DST, see Time in Germany');
INSERT INTO `timezones` VALUES ('SK', '+4809+01707', 'Europe/Bratislava', '', '+01:00', '+02:00', 'Link to Europe/Prague');
INSERT INTO `timezones` VALUES ('BE', '+5050+00420', 'Europe/Brussels', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('RO', '+4426+02606', 'Europe/Bucharest', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('HU', '+4730+01905', 'Europe/Budapest', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('MD', '+4700+02850', 'Europe/Chisinau', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('DK', '+5540+01235', 'Europe/Copenhagen', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('IE', '+5320-00615', 'Europe/Dublin', '', '+00:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('GI', '+3608-00521', 'Europe/Gibraltar', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('GG', '+4927-00232', 'Europe/Guernsey', '', '+00:00', '+01:00', 'Link to Europe/London');
INSERT INTO `timezones` VALUES ('FI', '+6010+02458', 'Europe/Helsinki', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('IM', '+5409-00428', 'Europe/Isle_of_Man', '', '+00:00', '+01:00', 'Link to Europe/London');
INSERT INTO `timezones` VALUES ('TR', '+4101+02858', 'Europe/Istanbul', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('JE', '+4912-00207', 'Europe/Jersey', '', '+00:00', '+01:00', 'Link to Europe/London');
INSERT INTO `timezones` VALUES ('RU', '+5443+02030', 'Europe/Kaliningrad', 'Moscow-01 - Kaliningrad', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('UA', '+5026+03031', 'Europe/Kiev', 'most locations', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('PT', '+3843-00908', 'Europe/Lisbon', 'mainland', '+00:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('SI', '+4603+01431', 'Europe/Ljubljana', '', '+01:00', '+02:00', 'Link to Europe/Belgrade');
INSERT INTO `timezones` VALUES ('GB', '+513030-0000731', 'Europe/London', '', '+00:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('LU', '+4936+00609', 'Europe/Luxembourg', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('ES', '+4024-00341', 'Europe/Madrid', 'mainland', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('MT', '+3554+01431', 'Europe/Malta', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('AX', '+6006+01957', 'Europe/Mariehamn', '', '+02:00', '+03:00', 'Link to Europe/Helsinki');
INSERT INTO `timezones` VALUES ('BY', '+5354+02734', 'Europe/Minsk', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('MC', '+4342+00723', 'Europe/Monaco', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('RU', '+5545+03735', 'Europe/Moscow', 'Moscow+00 - west Russia', '+04:00', '+04:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Europe/Nicosia', '', '+02:00', '+03:00', 'Link to Asia/Nicosia');
INSERT INTO `timezones` VALUES ('NO', '+5955+01045', 'Europe/Oslo', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('FR', '+4852+00220', 'Europe/Paris', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('ME', '+4226+01916', 'Europe/Podgorica', '', '+01:00', '+02:00', 'Link to Europe/Belgrade');
INSERT INTO `timezones` VALUES ('CZ', '+5005+01426', 'Europe/Prague', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('LV', '+5657+02406', 'Europe/Riga', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('IT', '+4154+01229', 'Europe/Rome', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('RU', '+5312+05009', 'Europe/Samara', 'Moscow+00 - Samara, Udmurtia', '+04:00', '+04:00', '');
INSERT INTO `timezones` VALUES ('SM', '+4355+01228', 'Europe/San_Marino', '', '+01:00', '+02:00', 'Link to Europe/Rome');
INSERT INTO `timezones` VALUES ('BA', '+4352+01825', 'Europe/Sarajevo', '', '+01:00', '+02:00', 'Link to Europe/Belgrade');
INSERT INTO `timezones` VALUES ('UA', '+4457+03406', 'Europe/Simferopol', 'central Crimea', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('MK', '+4159+02126', 'Europe/Skopje', '', '+01:00', '+02:00', 'Link to Europe/Belgrade');
INSERT INTO `timezones` VALUES ('BG', '+4241+02319', 'Europe/Sofia', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('SE', '+5920+01803', 'Europe/Stockholm', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('EE', '+5925+02445', 'Europe/Tallinn', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('AL', '+4120+01950', 'Europe/Tirane', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Europe/Tiraspol', '', '+02:00', '+03:00', 'Link to Europe/Chisinau');
INSERT INTO `timezones` VALUES ('UA', '+4837+02218', 'Europe/Uzhgorod', 'Ruthenia', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('LI', '+4709+00931', 'Europe/Vaduz', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('VA', '+415408+0122711', 'Europe/Vatican', '', '+01:00', '+02:00', 'Link to Europe/Rome');
INSERT INTO `timezones` VALUES ('AT', '+4813+01620', 'Europe/Vienna', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('LT', '+5441+02519', 'Europe/Vilnius', '', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('RU', '+4844+04425', 'Europe/Volgograd', 'Moscow+00 - Caspian Sea', '+04:00', '+04:00', '');
INSERT INTO `timezones` VALUES ('PL', '+5215+02100', 'Europe/Warsaw', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('HR', '+4548+01558', 'Europe/Zagreb', '', '+01:00', '+02:00', 'Link to Europe/Belgrade');
INSERT INTO `timezones` VALUES ('UA', '+4750+03510', 'Europe/Zaporozhye', 'Zaporozhye, E Lugansk / Zaporizhia, E Luhansk', '+02:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('CH', '+4723+00832', 'Europe/Zurich', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('', '', 'GB', '', '+00:00', '+01:00', 'Link to Europe/London');
INSERT INTO `timezones` VALUES ('', '', 'GB-Eire', '', '+00:00', '+01:00', 'Link to Europe/London');
INSERT INTO `timezones` VALUES ('', '', 'GMT', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('', '', 'GMT+0', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('', '', 'GMT-0', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('', '', 'GMT0', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('', '', 'Greenwich', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('', '', 'Hong Kong', '', '+08:00', '+08:00', 'Link to Asia/Hong_Kong');
INSERT INTO `timezones` VALUES ('', '', 'HST', '', 'âˆ’10:00', 'âˆ’10:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Iceland', '', '+00:00', '+00:00', 'Link to Atlantic/Reykjavik');
INSERT INTO `timezones` VALUES ('MG', '-1855+04731', 'Indian/Antananarivo', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('IO', '-0720+07225', 'Indian/Chagos', '', '+06:00', '+06:00', '');
INSERT INTO `timezones` VALUES ('CX', '-1025+10543', 'Indian/Christmas', '', '+07:00', '+07:00', '');
INSERT INTO `timezones` VALUES ('CC', '-1210+09655', 'Indian/Cocos', '', '+06:30', '+06:30', '');
INSERT INTO `timezones` VALUES ('KM', '-1141+04316', 'Indian/Comoro', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('TF', '-492110+0701303', 'Indian/Kerguelen', '', '+05:00', '+05:00', '');
INSERT INTO `timezones` VALUES ('SC', '-0440+05528', 'Indian/Mahe', '', '+04:00', '+04:00', '');
INSERT INTO `timezones` VALUES ('MV', '+0410+07330', 'Indian/Maldives', '', '+05:00', '+05:00', '');
INSERT INTO `timezones` VALUES ('MU', '-2010+05730', 'Indian/Mauritius', '', '+04:00', '+04:00', '');
INSERT INTO `timezones` VALUES ('YT', '-1247+04514', 'Indian/Mayotte', '', '+03:00', '+03:00', '');
INSERT INTO `timezones` VALUES ('RE', '-2052+05528', 'Indian/Reunion', '', '+04:00', '+04:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Iran', '', '+03:30', '+04:30', 'Link to Asia/Tehran');
INSERT INTO `timezones` VALUES ('', '', 'Israel', '', '+02:00', '+03:00', 'Link to Asia/Jerusalem');
INSERT INTO `timezones` VALUES ('', '', 'Jamaica', '', 'âˆ’05:00', 'âˆ’05:00', 'Link to America/Jamaica');
INSERT INTO `timezones` VALUES ('', '', 'Japan', '', '+09:00', '+09:00', 'Link to Asia/Tokyo');
INSERT INTO `timezones` VALUES ('', '', 'JST-9', '', '+09:00', '+09:00', 'Link to Asia/Tokyo');
INSERT INTO `timezones` VALUES ('', '', 'Kwajalein', '', '+12:00', '+12:00', 'Link to Pacific/Kwajalein');
INSERT INTO `timezones` VALUES ('', '', 'Libya', '', '+02:00', '+02:00', 'Link to Africa/Tripoli');
INSERT INTO `timezones` VALUES ('', '', 'MET', '', '+01:00', '+02:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Mexico/BajaNorte', '', 'âˆ’08:00', 'âˆ’07:00', 'Link to America/Tijuana');
INSERT INTO `timezones` VALUES ('', '', 'Mexico/BajaSur', '', 'âˆ’07:00', 'âˆ’06:00', 'Link to America/Mazatlan');
INSERT INTO `timezones` VALUES ('', '', 'Mexico/General', '', 'âˆ’06:00', 'âˆ’05:00', 'Link to America/Mexico_City');
INSERT INTO `timezones` VALUES ('', '', 'MST', '', 'âˆ’07:00', 'âˆ’07:00', '');
INSERT INTO `timezones` VALUES ('', '', 'MST7MDT', '', 'âˆ’07:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Navajo', '', 'âˆ’07:00', 'âˆ’06:00', 'Link to America/Denver');
INSERT INTO `timezones` VALUES ('', '', 'NZ', '', '+12:00', '+13:00', 'Link to Pacific/Auckland');
INSERT INTO `timezones` VALUES ('', '', 'NZ-CHAT', '', '+12:45', '+13:45', 'Link to Pacific/Chatham');
INSERT INTO `timezones` VALUES ('WS', '-1350-17144', 'Pacific/Apia', '', '+13:00', '+14:00', '');
INSERT INTO `timezones` VALUES ('NZ', '-3652+17446', 'Pacific/Auckland', 'most locations', '+12:00', '+13:00', '');
INSERT INTO `timezones` VALUES ('NZ', '-4357-17633', 'Pacific/Chatham', 'Chatham Islands', '+12:45', '+13:45', '');
INSERT INTO `timezones` VALUES ('FM', '+0725+15147', 'Pacific/Chuuk', 'Chuuk (Truk) and Yap', '+10:00', '+10:00', '');
INSERT INTO `timezones` VALUES ('CL', '-2709-10926', 'Pacific/Easter', 'Easter Island & Sala y Gomez', 'âˆ’06:00', 'âˆ’05:00', '');
INSERT INTO `timezones` VALUES ('VU', '-1740+16825', 'Pacific/Efate', '', '+11:00', '+11:00', '');
INSERT INTO `timezones` VALUES ('KI', '-0308-17105', 'Pacific/Enderbury', 'Phoenix Islands', '+13:00', '+13:00', '');
INSERT INTO `timezones` VALUES ('TK', '-0922-17114', 'Pacific/Fakaofo', '', '+13:00', '+13:00', '');
INSERT INTO `timezones` VALUES ('FJ', '-1808+17825', 'Pacific/Fiji', '', '+12:00', '+13:00', '');
INSERT INTO `timezones` VALUES ('TV', '-0831+17913', 'Pacific/Funafuti', '', '+12:00', '+12:00', '');
INSERT INTO `timezones` VALUES ('EC', '-0054-08936', 'Pacific/Galapagos', 'Galapagos Islands', 'âˆ’06:00', 'âˆ’06:00', '');
INSERT INTO `timezones` VALUES ('PF', '-2308-13457', 'Pacific/Gambier', 'Gambier Islands', 'âˆ’09:00', 'âˆ’09:00', '');
INSERT INTO `timezones` VALUES ('SB', '-0932+16012', 'Pacific/Guadalcanal', '', '+11:00', '+11:00', '');
INSERT INTO `timezones` VALUES ('GU', '+1328+14445', 'Pacific/Guam', '', '+10:00', '+10:00', '');
INSERT INTO `timezones` VALUES ('US', '+211825-1575130', 'Pacific/Honolulu', 'Hawaii', 'âˆ’10:00', 'âˆ’10:00', '');
INSERT INTO `timezones` VALUES ('UM', '+1645-16931', 'Pacific/Johnston', 'Johnston Atoll', 'âˆ’10:00', 'âˆ’10:00', '');
INSERT INTO `timezones` VALUES ('KI', '+0152-15720', 'Pacific/Kiritimati', 'Line Islands', '+14:00', '+14:00', '');
INSERT INTO `timezones` VALUES ('FM', '+0519+16259', 'Pacific/Kosrae', 'Kosrae', '+11:00', '+11:00', '');
INSERT INTO `timezones` VALUES ('MH', '+0905+16720', 'Pacific/Kwajalein', 'Kwajalein', '+12:00', '+12:00', '');
INSERT INTO `timezones` VALUES ('MH', '+0709+17112', 'Pacific/Majuro', 'most locations', '+12:00', '+12:00', '');
INSERT INTO `timezones` VALUES ('PF', '-0900-13930', 'Pacific/Marquesas', 'Marquesas Islands', 'âˆ’09:30', 'âˆ’09:30', '');
INSERT INTO `timezones` VALUES ('UM', '+2813-17722', 'Pacific/Midway', 'Midway Islands', 'âˆ’11:00', 'âˆ’11:00', '');
INSERT INTO `timezones` VALUES ('NR', '-0031+16655', 'Pacific/Nauru', '', '+12:00', '+12:00', '');
INSERT INTO `timezones` VALUES ('NU', '-1901-16955', 'Pacific/Niue', '', 'âˆ’11:00', 'âˆ’11:00', '');
INSERT INTO `timezones` VALUES ('NF', '-2903+16758', 'Pacific/Norfolk', '', '+11:30', '+11:30', '');
INSERT INTO `timezones` VALUES ('NC', '-2216+16627', 'Pacific/Noumea', '', '+11:00', '+11:00', '');
INSERT INTO `timezones` VALUES ('AS', '-1416-17042', 'Pacific/Pago_Pago', '', 'âˆ’11:00', 'âˆ’11:00', '');
INSERT INTO `timezones` VALUES ('PW', '+0720+13429', 'Pacific/Palau', '', '+09:00', '+09:00', '');
INSERT INTO `timezones` VALUES ('PN', '-2504-13005', 'Pacific/Pitcairn', '', 'âˆ’08:00', 'âˆ’08:00', '');
INSERT INTO `timezones` VALUES ('FM', '+0658+15813', 'Pacific/Pohnpei', 'Pohnpei (Ponape)', '+11:00', '+11:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Pacific/Ponape', '', '+11:00', '+11:00', 'Link to Pacific/Pohnpei');
INSERT INTO `timezones` VALUES ('PG', '-0930+14710', 'Pacific/Port_Moresby', '', '+10:00', '+10:00', '');
INSERT INTO `timezones` VALUES ('CK', '-2114-15946', 'Pacific/Rarotonga', '', 'âˆ’10:00', 'âˆ’10:00', '');
INSERT INTO `timezones` VALUES ('MP', '+1512+14545', 'Pacific/Saipan', '', '+10:00', '+10:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Pacific/Samoa', '', 'âˆ’11:00', 'âˆ’11:00', 'Link to Pacific/Pago_Pago');
INSERT INTO `timezones` VALUES ('PF', '-1732-14934', 'Pacific/Tahiti', 'Society Islands', 'âˆ’10:00', 'âˆ’10:00', '');
INSERT INTO `timezones` VALUES ('KI', '+0125+17300', 'Pacific/Tarawa', 'Gilbert Islands', '+12:00', '+12:00', '');
INSERT INTO `timezones` VALUES ('TO', '-2110-17510', 'Pacific/Tongatapu', '', '+13:00', '+13:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Pacific/Truk', '', '+10:00', '+10:00', 'Link to Pacific/Chuuk');
INSERT INTO `timezones` VALUES ('UM', '+1917+16637', 'Pacific/Wake', 'Wake Island', '+12:00', '+12:00', '');
INSERT INTO `timezones` VALUES ('WF', '-1318-17610', 'Pacific/Wallis', '', '+12:00', '+12:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Pacific/Yap', '', '+10:00', '+10:00', 'Link to Pacific/Chuuk');
INSERT INTO `timezones` VALUES ('', '', 'Poland', '', '+01:00', '+02:00', 'Link to Europe/Warsaw');
INSERT INTO `timezones` VALUES ('', '', 'Portugal', '', '+00:00', '+01:00', 'Link to Europe/Lisbon');
INSERT INTO `timezones` VALUES ('', '', 'PRC', '', '+08:00', '+08:00', 'Link to Asia/Shanghai');
INSERT INTO `timezones` VALUES ('', '', 'PST8PDT', '', 'âˆ’08:00', 'âˆ’07:00', '');
INSERT INTO `timezones` VALUES ('', '', 'ROC', '', '+08:00', '+08:00', 'Link to Asia/Taipei');
INSERT INTO `timezones` VALUES ('', '', 'ROK', '', '+09:00', '+09:00', 'Link to Asia/Seoul');
INSERT INTO `timezones` VALUES ('', '', 'Singapore', '', '+08:00', '+08:00', 'Link to Asia/Singapore');
INSERT INTO `timezones` VALUES ('', '', 'Turkey', '', '+02:00', '+03:00', 'Link to Europe/Istanbul');
INSERT INTO `timezones` VALUES ('', '', 'UCT', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('', '', 'Universal', '', '+00:00', '+00:00', 'Link to UTC');
INSERT INTO `timezones` VALUES ('', '', 'US/Alaska', '', 'âˆ’09:00', 'âˆ’08:00', 'Link to America/Anchorage');
INSERT INTO `timezones` VALUES ('', '', 'US/Aleutian', '', 'âˆ’10:00', 'âˆ’09:00', 'Link to America/Adak');
INSERT INTO `timezones` VALUES ('', '', 'US/Arizona', '', 'âˆ’07:00', 'âˆ’07:00', 'Link to America/Phoenix');
INSERT INTO `timezones` VALUES ('', '', 'US/Central', '', 'âˆ’06:00', 'âˆ’05:00', 'Link to America/Chicago');
INSERT INTO `timezones` VALUES ('', '', 'US/East-Indiana', '', 'âˆ’05:00', 'âˆ’04:00', 'Link to America/Indiana/Indianapolis');
INSERT INTO `timezones` VALUES ('', '', 'US/Eastern', '', 'âˆ’05:00', 'âˆ’04:00', 'Link to America/New_York');
INSERT INTO `timezones` VALUES ('', '', 'US/Hawaii', '', 'âˆ’10:00', 'âˆ’10:00', 'Link to Pacific/Honolulu');
INSERT INTO `timezones` VALUES ('', '', 'US/Indiana-Starke', '', 'âˆ’06:00', 'âˆ’05:00', 'Link to America/Indiana/Knox');
INSERT INTO `timezones` VALUES ('', '', 'US/Michigan', '', 'âˆ’05:00', 'âˆ’04:00', 'Link to America/Detroit');
INSERT INTO `timezones` VALUES ('', '', 'US/Mountain', '', 'âˆ’07:00', 'âˆ’06:00', 'Link to America/Denver');
INSERT INTO `timezones` VALUES ('', '', 'US/Pacific', '', 'âˆ’08:00', 'âˆ’07:00', 'Link to America/Los_Angeles');
INSERT INTO `timezones` VALUES ('', '', 'US/Pacific-New', '', 'âˆ’08:00', 'âˆ’07:00', 'Link to America/Los_Angeles');
INSERT INTO `timezones` VALUES ('', '', 'US/Samoa', '', 'âˆ’11:00', 'âˆ’11:00', 'Link to Pacific/Pago_Pago');
INSERT INTO `timezones` VALUES ('', '', 'UTC', '', '+00:00', '+00:00', '');
INSERT INTO `timezones` VALUES ('', '', 'W-SU', '', '+04:00', '+04:00', 'Link to Europe/Moscow');
INSERT INTO `timezones` VALUES ('', '', 'WET', '', '+00:00', '+01:00', '');
INSERT INTO `timezones` VALUES ('', '', 'Zulu', '', '+00:00', '+00:00', 'Link to UTC');

-- ----------------------------
-- Table structure for treatments
-- ----------------------------
DROP TABLE IF EXISTS `treatments`;
CREATE TABLE `treatments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of treatments
-- ----------------------------
INSERT INTO `treatments` VALUES (1, 'General Medicine', '65a5e7745b50a.png', 1, '2024-01-16 07:48:28', '2024-01-16 07:48:28');
INSERT INTO `treatments` VALUES (2, 'Bone & Joints', '65a5d6f143742.png', 1, '2024-01-16 06:38:01', '2024-01-16 06:38:01');
INSERT INTO `treatments` VALUES (3, 'TERED', '65a5d6f143742.png', 1, '2024-01-16 06:38:01', '2024-01-16 06:38:01');
INSERT INTO `treatments` VALUES (4, 'Woman\'s Health', '65a5e74141494.png', 1, '2024-01-16 07:47:37', '2024-01-16 07:47:37');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_userAddress_userId`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `verify` tinyint(1) NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `otp` int(11) NULL DEFAULT NULL,
  `dob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `device_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `channel_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `agora_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `fk_doctor`(`doctor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin doctro', 'admindoctro@gmail.com', NULL, '$2y$10$g/L/W4ID9zR6bB6QQPtmhOc6.jeMbT9gZx.Wy9dOMqRhSk6YOW3Qi', '7788994455', '+91', 1, NULL, NULL, NULL, 'male', 'defaultUser.png', 1, NULL, NULL, 'English', NULL, NULL, '2023-02-08 21:55:48', '2024-01-16 21:50:08');
INSERT INTO `users` VALUES (2, 'Jasmin Smith', 'jasminsmith@email.com', NULL, '$2y$10$ynY.w68NyMX1M91AYfkWiubSRg9ojfnxEkMy8u0RY8ecgRby4iay2', '5662211', '+34', 1, NULL, NULL, NULL, 'male', 'defaultUser.png', 1, 1, NULL, NULL, NULL, NULL, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `users` VALUES (3, 'Victor Denmal', 'VictorDenmal@email.com', NULL, '$2y$10$ynY.w68NyMX1M91AYfkWiubSRg9ojfnxEkMy8u0RY8ecgRby4iay2', '35884', '+34', 1, NULL, NULL, NULL, 'male', 'defaultUser.png', 1, 2, NULL, NULL, NULL, NULL, '2024-01-16 08:11:58', '2024-01-16 08:37:12');
INSERT INTO `users` VALUES (4, 'Suneel Kumar', 'SuneelKumar@email.com', NULL, '$2y$10$ynY.w68NyMX1M91AYfkWiubSRg9ojfnxEkMy8u0RY8ecgRby4iay2', '5662211', '+34', 1, NULL, NULL, NULL, 'female', 'defaultUser.png', 1, 3, NULL, NULL, NULL, NULL, '2024-01-16 08:11:58', '2024-01-16 08:37:13');
INSERT INTO `users` VALUES (5, 'Jamal Hassan', 'JamalHassan@email.com', NULL, '$2y$10$ynY.w68NyMX1M91AYfkWiubSRg9ojfnxEkMy8u0RY8ecgRby4iay2', '4844574', '+34', 1, NULL, NULL, NULL, 'male', 'defaultUser.png', 1, 4, NULL, NULL, NULL, NULL, '2024-01-16 08:11:58', '2024-01-16 08:37:13');
INSERT INTO `users` VALUES (6, 'Camilla Wisozk', 'CamillaWisozk@email.com', NULL, '$2y$10$ynY.w68NyMX1M91AYfkWiubSRg9ojfnxEkMy8u0RY8ecgRby4iay2', '5662211', '+34', 1, NULL, NULL, NULL, 'male', 'defaultUser.png', 1, 5, NULL, NULL, NULL, NULL, '2024-01-16 08:11:58', '2024-01-16 08:37:14');
INSERT INTO `users` VALUES (7, 'Jason K', 'jasonk@email.com', NULL, '$2y$10$b/m9OapH/Hkt7Hr0KEZKoe8AS7PpdYYlAYgWDdGGRbSNIdOUR2vnW', '2544411', '+0', 1, NULL, NULL, NULL, 'male', 'defaultUser.png', 1, NULL, NULL, NULL, NULL, NULL, '2024-01-16 08:36:36', '2024-01-16 08:36:36');

-- ----------------------------
-- Table structure for videocall_history
-- ----------------------------
DROP TABLE IF EXISTS `videocall_history`;
CREATE TABLE `videocall_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `start_time` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `duration` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for working_hour
-- ----------------------------
DROP TABLE IF EXISTS `working_hour`;
CREATE TABLE `working_hour`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `day_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_doctor_id`(`doctor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of working_hour
-- ----------------------------
INSERT INTO `working_hour` VALUES (1, 1, 'Sunday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (2, 1, 'Monday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (3, 1, 'Tuesday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (4, 1, 'Wednesday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (5, 1, 'Thursday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (6, 1, 'Friday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (7, 1, 'Saturday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (8, 2, 'Sunday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (9, 2, 'Monday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (10, 2, 'Tuesday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (11, 2, 'Wednesday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (12, 2, 'Thursday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (13, 2, 'Friday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (14, 3, 'Sunday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (15, 3, 'Monday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (16, 3, 'Tuesday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (17, 3, 'Wednesday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (18, 3, 'Thursday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (19, 3, 'Friday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (20, 4, 'Sunday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (21, 4, 'Monday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (22, 4, 'Tuesday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (23, 4, 'Wednesday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (24, 4, 'Thursday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (25, 4, 'Friday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (26, 5, 'Sunday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (27, 5, 'Monday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (28, 5, 'Tuesday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (29, 5, 'Wednesday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (30, 5, 'Thursday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');
INSERT INTO `working_hour` VALUES (31, 5, 'Friday', '[{\"start_time\":\"08:00 am\",\"end_time\":\"07:00 pm\"}]', 1, '2024-01-16 08:11:58', '2024-01-16 08:11:58');

-- ----------------------------
-- Table structure for zoom_meeting
-- ----------------------------
DROP TABLE IF EXISTS `zoom_meeting`;
CREATE TABLE `zoom_meeting`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `zoom_api_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zoom_api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zoom_api_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
