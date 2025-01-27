-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2025 at 12:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dms_third`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigned_check_lists`
--

CREATE TABLE `assigned_check_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `is_checked` tinyint(4) DEFAULT NULL COMMENT '0 = unchecked, 1 = checked',
  `make_model` varchar(255) DEFAULT NULL,
  `make_manufacture` varchar(255) DEFAULT NULL,
  `unit_location` varchar(255) DEFAULT NULL,
  `qty` varchar(255) DEFAULT NULL,
  `item_status` varchar(255) DEFAULT NULL COMMENT '1 = new, 2 = processing, 3 = complete',
  `remark` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL COMMENT 'group by category',
  `order` varchar(255) DEFAULT NULL COMMENT 'order number',
  `check_list_information_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT '0 = Inactive, 1 = Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assigned_check_lists`
--

INSERT INTO `assigned_check_lists` (`id`, `category`, `category_id`, `item_name`, `is_checked`, `make_model`, `make_manufacture`, `unit_location`, `qty`, `item_status`, `remark`, `department_id`, `group_id`, `order`, `check_list_information_id`, `status`, `created_at`, `updated_at`) VALUES
(388, 'Epabx', 1, 'IPBX', 1, 'Tata', 'Alkatel / NEC', 'Delhi', '2', '2', 'testing', 1, '1', '1', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(389, 'Epabx', 1, 'Epabx Main 400 Pair Mdf Installation', 1, 'Crone Box', 'Crone Box', 'Delhi', '8', '1', 'testing', 1, '1', '1', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(390, 'Epabx', 1, 'Epabx Extension Testing At Each Floor', 1, 'Crone Box', 'Crone Box', 'Delhi', '5', '1', 'testing', 1, '1', '1', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(391, 'Epabx', 1, 'Guest Bath-Room Handsets', 1, 'Tata', '21', 'Delhi', '4', '2', 'DTPN0012 DOLPHY', 1, '1', '1', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(392, 'Epabx', 1, 'Office Phone', 1, 'Tata', '10 Channel', 'Delhi', '9', '1', 'As per HOD', 1, '1', '1', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(393, 'Epabx', 1, 'Extenssion List And Programing', 1, 'Canon', 'Ip camera Minimum 2,4,5Mega Pixel', 'Delhi', '5', '3', 'testing', 1, '1', '1', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(394, 'CCTV', 2, 'Camera Installation', 1, 'Canon', 'Ip camera Minimum 2,4,5Mega Pixel', 'Delhi', '4', '2', 'testing', 1, '2', '2', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(395, 'CCTV', 2, 'Wiring', 1, 'Canon', 'One 4 MP camera with Recoding system In Reception', 'Delhi', '6', '2', 'Cp Plus / Hikvision', 1, '2', '2', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(396, 'CCTV', 2, '24 Port POE Switch', 1, 'Canon', 'As per Camera', 'Delhi', '6', '1', 'Hp/ CISCO', 1, '2', '2', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(397, 'CCTV', 2, '8 TB surveillance Hdd', 1, 'Canon', 'As per Camera', 'Delhi', '12', '2', 'Testing', 1, '2', '2', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(398, 'Sound System', 3, 'Speaker Installation', 1, 'Sony', '\"6W METAL GRILLE CEILING SPEAKER,BOSLBD0606\"', 'Delhi', '6', '2', 'Testing', 1, '3', '3', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(399, 'Sound System', 3, 'Amplifier Installation', 1, 'Sony', '\"PLENA all-in-one 180W Two Zone Mixer Amplifier\"', 'Delhi', '13', '3', 'Testing', 1, '3', '3', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(400, 'Sound System', 3, 'Pen Drive', 1, 'Hp', 'HP', 'Delhi', '22', '2', 'Testing', 1, '3', '3', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(401, 'IT HARDWARE', 4, 'Laptop', 1, 'HP', 'M8420', 'Delhi', '2', '2', 'Testing', 1, '4', '4', 15, '1', '2024-06-24 23:43:50', '2024-06-24 23:46:03'),
(402, 'IT HARDWARE', 4, 'Desktop', 1, 'Dell', 'Optiplex 3040', 'Delhi', '2', '1', 'Testing', 1, '4', '4', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(403, 'IT HARDWARE', 4, 'Online UPS For CCTV,IPBX', 1, 'Hp', 'As per Load', 'Delhi', '5', '3', 'Testing', 1, '4', '4', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(404, 'IT HARDWARE', 4, 'Pos Printers', 1, 'Hp', 'As per Load', 'Delhi', '5', NULL, 'Testing', 1, '4', '4', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(405, 'Networking', 5, 'Network Switches 24ports', 1, 'HP', 'Hp/CISCO', 'Delhi', '6', '2', 'Testing', 1, '5', '5', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(406, 'Networking', 5, 'Patch Chords', 1, 'D-link', 'D-link', 'Delhi', '5', '2', 'Testing', 1, '5', '5', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(407, 'Networking', 5, 'Io Point Termination On Each Floor & Office', 1, 'D-link', 'D-link', 'Delhi', '3', '1', 'Testing', 1, '5', '5', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(408, 'Software', 6, 'Anti Virus Software As Per user Quick Heal', 1, 'Quick Heal', 'As per System', 'Delhi', '5', '2', 'Testing', 1, '6', '6', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(409, 'Software', 6, 'Windows & Ms Office', 1, 'Quick Heal', 'As per System', 'Delhi', '2', '2', 'Testing', 1, '6', '6', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(410, 'Broadband', 8, 'Isp For Broadband', 1, 'D-link', '100 MBPS For Backup', 'Delhi', '6', '1', 'Testing', 1, '8', '8', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(411, 'Attendance Systen', 9, 'Attendance System', 1, 'E9C ESSL', 'E9C ESSL', 'Delhi', '6', '1', 'Wi-FI,Fingerprint,RFID,Face', 1, '9', '9', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(412, 'Cable TV', 10, 'connection in all rooms', 1, 'Airtel Dish TV', 'Airtel Dish TV', 'Delhi', '4', '1', 'Testing', 1, '10', '10', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(413, 'PA System', 11, 'Mic Amplifire', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '6', '3', 'Testing', 1, '11', '11', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(414, 'E-Mail For All Department', 12, 'G-suite Cygnett Email I\'d as per user', 1, 'Gmail', 'As per User', 'Delhi', '6', '2', 'Testing', 1, '12', '12', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(415, 'Computer Security', 13, 'Firwall', 1, 'Cisco / SoPhos', 'Cisco / SoPhos', 'Delhi', '3', '2', 'Testing', 1, '13', '13', 15, '1', '2024-06-24 23:43:51', '2024-06-24 23:46:03'),
(416, 'Epabx', 1, 'IPBX', 1, 'Tata', 'Alkatel / NEC', 'Delhi', '2', '2', 'testing', 1, '1', '1', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(417, 'Epabx', 1, 'Epabx Main 400 Pair Mdf Installation', 1, 'Crone Box', 'Crone Box', 'Delhi', '8', '1', 'testing', 1, '1', '1', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(418, 'Epabx', 1, 'Epabx Extension Testing At Each Floor', 1, 'Crone Box', 'Crone Box', 'Delhi', '5', '1', 'testing', 1, '1', '1', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(419, 'Epabx', 1, 'Guest Bath-Room Handsets', 1, 'Tata', '21', 'Delhi', '4', '2', 'DTPN0012 DOLPHY', 1, '1', '1', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(420, 'Epabx', 1, 'Office Phone', 1, 'Tata', '10 Channel', 'Delhi', '9', '1', 'As per HOD', 1, '1', '1', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(421, 'Epabx', 1, 'Extenssion List And Programing', 1, 'Canon', 'Ip camera Minimum 2,4,5Mega Pixel', 'Delhi', '5', '3', 'testing', 1, '1', '1', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(422, 'CCTV', 2, 'Camera Installation', 1, 'Canon', 'Ip camera Minimum 2,4,5Mega Pixel', 'Delhi', '4', '2', 'testing', 1, '2', '2', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(423, 'CCTV', 2, 'Camera', 1, 'Canon', 'One 4 MP camera with Recoding system In Reception', 'Delhi', '5', '3', 'Testing', 1, '2', '2', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(424, 'CCTV', 2, 'NVR Encoder Installation', 1, 'Canon', 'NVR', 'Delhi', '7', '2', 'Testing', 1, '2', '2', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(425, 'CCTV', 2, 'Wiring', 1, 'Canon', 'One 4 MP camera with Recoding system In Reception', 'Delhi', '6', '2', 'Cp Plus / Hikvision', 1, '2', '2', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(426, 'CCTV', 2, 'Camera Display Screen', 1, 'Canon', 'As per Camera', 'Delhi', '12', '3', 'Hp/ CISCO', 1, '2', '2', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(427, 'CCTV', 2, '24 Port POE Switch', 1, 'Canon', 'As per Camera', 'Delhi', '6', '1', 'Hp/ CISCO', 1, '2', '2', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(428, 'CCTV', 2, '8 TB surveillance Hdd', 1, 'Canon', 'As per Camera', 'Delhi', '12', '2', 'Testing', 1, '2', '2', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(429, 'Sound System', 3, 'Speaker Installation', 1, 'Sony', '\"6W METAL GRILLE CEILING SPEAKER,BOSLBD0606\"', 'Delhi', '6', '2', 'Testing', 1, '3', '3', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(430, 'Sound System', 3, 'Amplifier Installation', 1, 'Sony', '\"PLENA all-in-one 180W Two Zone Mixer Amplifier\"', 'Delhi', '13', '1', 'Testing', 1, '3', '3', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(431, 'Sound System', 3, 'Volume Installation', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '19', '2', 'Testing', 1, '3', '3', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(432, 'Sound System', 3, 'Pen Drive', 1, 'Hp', 'HP', 'Delhi', '22', '2', 'Testing', 1, '3', '3', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(433, 'Sound System', 3, 'Racks', 1, 'Dell', 'Cisco/Dell', 'Delhi', '5', '1', 'Testing', 1, '3', '3', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(434, 'IT HARDWARE', 4, 'Laptop', 1, 'HP', 'M8420', 'Delhi', '2', '2', 'Testing', 1, '4', '4', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(435, 'IT HARDWARE', 4, 'Desktop', 1, 'Dell', 'Optiplex 3040', 'Delhi', '2', '1', 'Testing', 1, '4', '4', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(436, 'IT HARDWARE', 4, 'Colour Printer', 1, 'Canon', 'M44TY', 'Delhi', '5', '2', 'Testing', 1, '4', '4', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(437, 'IT HARDWARE', 4, 'Laser Printers All In One', 1, 'HP', 'M44TY', 'delhi', '2', '1', 'Testing', 1, '4', '4', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(438, 'IT HARDWARE', 4, 'Online UPS For CCTV,IPBX', 1, 'Hp', 'As per Load', 'Delhi', '5', '3', 'Testing', 1, '4', '4', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(439, 'IT HARDWARE', 4, 'Pos Printers', 1, 'Hp', 'As per Load', 'Delhi', '5', NULL, 'Testing', 1, '4', '4', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(440, 'Networking', 5, 'Network Switches 24ports', 1, 'HP', 'Hp/CISCO', 'Delhi', '6', '2', 'Testing', 1, '5', '5', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(441, 'Networking', 5, 'Network Rack', 1, 'Cisco', 'Cisco/Dell', 'Delhi', '3', '1', 'Testing', 1, '5', '5', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(442, 'Networking', 5, 'Patch Panel', 1, 'Cisco', 'Cisco', 'Delhi', '5', '3', 'Testing', 1, '5', '5', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(443, 'Networking', 5, 'Patch Chords', 1, 'D-link', 'D-link', 'Delhi', '5', '2', 'Testing', 1, '5', '5', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(444, 'Networking', 5, 'Io Point Termination On Each Floor & Office', 1, 'D-link', 'D-link', 'Delhi', '3', '1', 'Testing', 1, '5', '5', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(445, 'Software', 6, 'Hotel Management Cloud Base Software Cygnett Cloud', 1, 'Hotels System', 'Hotels System', 'Delhi', '5', '1', 'Testing', 1, '6', '6', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(446, 'Software', 6, 'Cygnett Cloud PMS Installtion', 1, 'Hotels System', 'Hotels System', 'Delhi', '5', '2', 'Testing', 1, '6', '6', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(447, 'Software', 6, 'Anti Virus Software As Per user Quick Heal', 1, 'Quick Heal', 'As per System', 'Delhi', '5', '2', 'Testing', 1, '6', '6', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(448, 'Software', 6, 'Windows & Ms Office', 1, 'Quick Heal', 'As per System', 'Delhi', '2', '2', 'Testing', 1, '6', '6', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(449, 'Lised Line', 7, 'Lised Line', 1, 'D-link', 'Minimum 30 MBPS', 'Delhi', '6', '2', 'Testng', 1, '7', '7', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(450, 'Lised Line', 7, 'Wi-fi Hotspot Service Provider', 1, 'D-link', 'HSIA/ 24 Online', 'Delhi', NULL, '1', 'Pms Interface & Coupon Generator', 1, '7', '7', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(451, 'Lised Line', 7, 'Wi Fi Service Provider', 1, 'D-link', 'Microtek / Airpro', 'Delhi', NULL, '1', 'Testng', 1, '7', '7', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(452, 'Broadband', 8, 'Isp For Broadband', 1, 'D-link', '100 MBPS For Backup', 'Delhi', '6', '1', 'Testing', 1, '8', '8', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(453, 'Attendance System', 9, 'Wiring For Attendance System', 1, 'E9C ESSL', 'E9C ESSL', 'Delhi', '6', '1', 'E9C ESSL', 1, '9', '9', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(454, 'Attendance Systen', 9, 'Attendance System', 1, 'E9C ESSL', 'E9C ESSL', 'Delhi', '6', '1', 'Wi-FI,Fingerprint,RFID,Face', 1, '9', '9', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(455, 'Cable TV', 10, 'Setuptop box', 1, 'Tata Sky /Airtel Dish TV', 'Tata Sky /Airtel Dish TV', 'Delhi', '4', '1', 'Testing', 1, '10', '10', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(456, 'Cable TV', 10, 'connection in all rooms', 1, 'Airtel Dish TV', 'Airtel Dish TV', 'Delhi', '4', '1', 'Testing', 1, '10', '10', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(457, 'PA System', 11, 'Mic Amplifire', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '6', '3', 'Testing', 1, '11', '11', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(458, 'PA System', 11, 'Wiring For Hooter', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '12', '2', 'Testing', 1, '11', '11', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(459, 'E-Mail For All Department', 12, 'G-suite Cygnett Email I\'d as per user', 1, 'Gmail', 'As per User', 'Delhi', '6', '2', 'Testing', 1, '12', '12', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(460, 'Computer Security', 13, 'Firwall', 1, 'Cisco / SoPhos', 'Cisco / SoPhos', 'Delhi', '3', '2', 'Testing', 1, '13', '13', 16, '1', '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(461, 'Epabx', 1, 'PRI Line Connection / SIP', 1, 'Tata', '10 Channel', 'Delhi', '6', '1', 'testing', 1, '1', '1', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(462, 'Epabx', 1, 'IPBX', 1, 'Tata', 'Alkatel / NEC', 'Delhi', '2', '1', 'testing', 1, '1', '1', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(463, 'Epabx', 1, 'Epabx Main Unit Installation', 1, 'Tata', 'Alkatel / NEC', 'Delhi', '10', '1', 'testing', 1, '1', '1', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(464, 'Epabx', 1, 'Epabx Main 400 Pair Mdf Installation', 1, 'Crone Box', 'Crone Box', 'Delhi', '8', '1', 'testing', 1, '1', '1', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(465, 'Epabx', 1, 'Epabx Extension Testing At Each Floor', 1, 'Crone Box', 'Crone Box', 'Delhi', '5', '1', 'testing', 1, '1', '1', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(466, 'Epabx', 1, 'Digital Phones', 1, 'Tata', '6', 'Delhi', '4', '1', 'Reception-2,Gm Office,IRD,HK,MD OFFICE', 1, '1', '1', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(467, 'Epabx', 1, 'Guest Room Handsets', 1, 'Tata', '22', 'Delhi', '5', '1', 'DTPN0012 DOLPHY', 1, '1', '1', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(468, 'Epabx', 1, 'Guest Bath-Room Handsets', 1, 'Tata', '21', 'Delhi', '4', '1', 'DTPN0012 DOLPHY', 1, '1', '1', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(469, 'Epabx', 1, 'Epabx Points', 1, 'Tata', 'Alkatel / NEC', 'Dlhi', '5', '1', 'As per HOD', 1, '1', '1', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(470, 'Epabx', 1, 'Office Phone', 1, 'Tata', '10 Channel', 'Delhi', '9', '1', 'As per HOD', 1, '1', '1', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(471, 'Epabx', 1, 'Extenssion List And Programing', 1, 'Canon', 'Ip camera Minimum 2,4,5Mega Pixel', 'Delhi', '5', '1', 'testing', 1, '1', '1', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(472, 'CCTV', 2, 'Camera Installation', 1, 'Canon', 'Ip camera Minimum 2,4,5Mega Pixel', 'Delhi', '4', '1', 'testing', 1, '2', '2', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(473, 'CCTV', 2, 'Camera', 1, 'Canon', 'One 4 MP camera with Recoding system In Reception', 'Delhi', '5', '1', 'Testing', 1, '2', '2', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(474, 'CCTV', 2, 'NVR Encoder Installation', 1, 'Canon', 'NVR', 'Delhi', '7', '1', 'Testing', 1, '2', '2', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(475, 'CCTV', 2, 'Wiring', 1, 'Canon', 'One 4 MP camera with Recoding system In Reception', 'Delhi', '6', '1', 'Cp Plus / Hikvision', 1, '2', '2', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(476, 'CCTV', 2, 'Camera Display Screen', 1, 'Canon', 'As per Camera', 'Delhi', '12', '1', 'Hp/ CISCO', 1, '2', '2', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(477, 'CCTV', 2, '24 Port POE Switch', 1, 'Canon', 'As per Camera', 'Delhi', '6', '1', 'Hp/ CISCO', 1, '2', '2', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(478, 'CCTV', 2, '8 TB surveillance Hdd', 1, 'Canon', 'As per Camera', 'Delhi', '12', '1', 'Testing', 1, '2', '2', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(479, 'Sound System', 3, 'Speaker Installation', 1, 'Sony', '\"6W METAL GRILLE CEILING SPEAKER,BOSLBD0606\"', 'Delhi', '6', '1', 'Testing', 1, '3', '3', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(480, 'Sound System', 3, 'Amplifier Installation', 1, 'Sony', '\"PLENA all-in-one 180W Two Zone Mixer Amplifier\"', 'Delhi', '13', '1', 'Testing', 1, '3', '3', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(481, 'Sound System', 3, 'Volume Installation', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '19', '1', 'Testing', 1, '3', '3', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(482, 'Sound System', 3, 'Pen Drive', 1, 'Hp', 'HP', 'Delhi', '22', '1', 'Testing', 1, '3', '3', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(483, 'Sound System', 3, 'Racks', 1, 'Dell', 'Cisco/Dell', 'Delhi', '5', '1', 'Testing', 1, '3', '3', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(484, 'IT HARDWARE', 4, 'Laptop', 1, 'HP', 'M8420', 'Delhi', '2', '1', 'Testing', 1, '4', '4', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(485, 'IT HARDWARE', 4, 'Desktop', 1, 'Dell', 'Optiplex 3040', 'Delhi', '2', '1', 'Testing', 1, '4', '4', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(486, 'IT HARDWARE', 4, 'Colour Printer', 1, 'Canon', 'M44TY', 'Delhi', '5', '1', 'Testing', 1, '4', '4', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(487, 'IT HARDWARE', 4, 'Laser Printers All In One', 1, 'HP', 'M44TY', 'delhi', '2', '1', 'Testing', 1, '4', '4', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(488, 'IT HARDWARE', 4, 'Online UPS For CCTV,IPBX', 1, 'Hp', 'As per Load', 'Delhi', '5', '1', 'Testing', 1, '4', '4', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(489, 'IT HARDWARE', 4, 'Pos Printers', 1, 'Hp', 'As per Load', 'Delhi', '5', '1', 'Testing', 1, '4', '4', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(490, 'Networking', 5, 'Network Switches 24ports', 1, 'HP', 'Hp/CISCO', 'Delhi', '6', '1', 'Testing', 1, '5', '5', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(491, 'Networking', 5, 'Network Rack', 1, 'Cisco', 'Cisco/Dell', 'Delhi', '3', '1', 'Testing', 1, '5', '5', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(492, 'Networking', 5, 'Patch Panel', 1, 'Cisco', 'Cisco', 'Delhi', '5', '1', 'Testing', 1, '5', '5', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(493, 'Networking', 5, 'Patch Chords', 1, 'D-link', 'D-link', 'Delhi', '5', '1', 'Testing', 1, '5', '5', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(494, 'Networking', 5, 'Io Point Termination On Each Floor & Office', 1, 'D-link', 'D-link', 'Delhi', '3', '1', 'Testing', 1, '5', '5', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(495, 'Software', 6, 'Hotel Management Cloud Base Software Cygnett Cloud', 1, 'Hotels System', 'Hotels System', 'Delhi', '5', '1', 'Testing', 1, '6', '6', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(496, 'Software', 6, 'Cygnett Cloud PMS Installtion', 1, 'Hotels System', 'Hotels System', 'Delhi', '5', '1', 'Testing', 1, '6', '6', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(497, 'Software', 6, 'Anti Virus Software As Per user Quick Heal', 1, 'Quick Heal', 'As per System', 'Delhi', '5', '1', 'Testing', 1, '6', '6', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(498, 'Software', 6, 'Windows & Ms Office', 1, 'Quick Heal', 'As per System', 'Delhi', '2', '1', 'Testing', 1, '6', '6', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(499, 'Lised Line', 7, 'Lised Line', 1, 'D-link', 'Minimum 30 MBPS', 'Delhi', '6', '1', 'Testng', 1, '7', '7', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(500, 'Lised Line', 7, 'Wi-fi Hotspot Service Provider', 1, 'D-link', 'HSIA/ 24 Online', 'Delhi', NULL, '1', 'Pms Interface & Coupon Generator', 1, '7', '7', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(501, 'Lised Line', 7, 'Wi Fi Service Provider', 1, 'D-link', 'Microtek / Airpro', 'Delhi', NULL, '1', 'Testng', 1, '7', '7', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(502, 'Broadband', 8, 'Isp For Broadband', 1, 'D-link', '100 MBPS For Backup', 'Delhi', '6', '1', 'Testing', 1, '8', '8', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(503, 'Attendance System', 9, 'Wiring For Attendance System', 1, 'E9C ESSL', 'E9C ESSL', 'Delhi', '6', '1', 'E9C ESSL', 1, '9', '9', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(504, 'Attendance Systen', 9, 'Attendance System', 1, 'E9C ESSL', 'E9C ESSL', 'Delhi', '6', '1', 'Wi-FI,Fingerprint,RFID,Face', 1, '9', '9', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(505, 'Cable TV', 10, 'Setuptop box', 1, 'Tata Sky /Airtel Dish TV', 'Tata Sky /Airtel Dish TV', 'Delhi', '4', '1', 'Testing', 1, '10', '10', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(506, 'Cable TV', 10, 'connection in all rooms', 1, 'Airtel Dish TV', 'Airtel Dish TV', 'Delhi', '4', '1', 'Testing', 1, '10', '10', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(507, 'PA System', 11, 'Mic Amplifire', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '6', '1', 'Testing', 1, '11', '11', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(508, 'PA System', 11, 'Wiring For Hooter', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '12', '1', 'Testing', 1, '11', '11', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(509, 'E-Mail For All Department', 12, 'G-suite Cygnett Email I\'d as per user', 1, 'Gmail', 'As per User', 'Delhi', '6', '1', 'Testing', 1, '12', '12', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(510, 'Computer Security', 13, 'Firwall', 1, 'Cisco / SoPhos', 'Cisco / SoPhos', 'Delhi', '3', '1', 'Testing', 1, '13', '13', 17, '1', '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(511, 'Epabx', 1, 'PRI Line Connection / SIP', 1, 'Tata', '10 Channel', 'Delhi', '6', '1', 'testing', 1, '1', '1', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(512, 'Epabx', 1, 'IPBX', 1, 'Tata', 'Alkatel / NEC', 'Delhi', '2', '1', 'testing', 1, '1', '1', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(513, 'Epabx', 1, 'Epabx Main Unit Installation', 1, 'Tata', 'Alkatel / NEC', 'Delhi', '10', '1', 'testing', 1, '1', '1', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(514, 'Epabx', 1, 'Epabx Main 400 Pair Mdf Installation', 1, 'Crone Box', 'Crone Box', 'Delhi', '8', '1', 'testing', 1, '1', '1', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(515, 'Epabx', 1, 'Epabx Extension Testing At Each Floor', 1, 'Crone Box', 'Crone Box', 'Delhi', '5', '1', 'testing', 1, '1', '1', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(516, 'Epabx', 1, 'Digital Phones', 1, 'Tata', '6', 'Delhi', '4', '1', 'Reception-2,Gm Office,IRD,HK,MD OFFICE', 1, '1', '1', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(517, 'Epabx', 1, 'Guest Room Handsets', 1, 'Tata', '22', 'Delhi', '5', '1', 'DTPN0012 DOLPHY', 1, '1', '1', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(518, 'Epabx', 1, 'Guest Bath-Room Handsets', 1, 'Tata', '21', 'Delhi', '4', '1', 'DTPN0012 DOLPHY', 1, '1', '1', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(519, 'Epabx', 1, 'Epabx Points', 1, 'Tata', 'Alkatel / NEC', 'Dlhi', '5', '1', 'As per HOD', 1, '1', '1', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(520, 'Epabx', 1, 'Office Phone', 1, 'Tata', '10 Channel', 'Delhi', '9', '1', 'As per HOD', 1, '1', '1', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(521, 'Epabx', 1, 'Extenssion List And Programing', 1, 'Canon', 'Ip camera Minimum 2,4,5Mega Pixel', 'Delhi', '5', '1', 'testing', 1, '1', '1', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(522, 'CCTV', 2, 'Camera Installation', 1, 'Canon', 'Ip camera Minimum 2,4,5Mega Pixel', 'Delhi', '4', '1', 'testing', 1, '2', '2', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(523, 'CCTV', 2, 'Camera', 1, 'Canon', 'One 4 MP camera with Recoding system In Reception', 'Delhi', '5', '1', 'Testing', 1, '2', '2', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(524, 'CCTV', 2, 'NVR Encoder Installation', 1, 'Canon', 'NVR', 'Delhi', '7', '1', 'Testing', 1, '2', '2', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(525, 'CCTV', 2, 'Wiring', 1, 'Canon', 'One 4 MP camera with Recoding system In Reception', 'Delhi', '6', '1', 'Cp Plus / Hikvision', 1, '2', '2', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(526, 'CCTV', 2, 'Camera Display Screen', 1, 'Canon', 'As per Camera', 'Delhi', '12', '1', 'Hp/ CISCO', 1, '2', '2', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(527, 'CCTV', 2, '24 Port POE Switch', 1, 'Canon', 'As per Camera', 'Delhi', '6', '1', 'Hp/ CISCO', 1, '2', '2', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(528, 'CCTV', 2, '8 TB surveillance Hdd', 1, 'Canon', 'As per Camera', 'Delhi', '12', '1', 'Testing', 1, '2', '2', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(529, 'Sound System', 3, 'Speaker Installation', 1, 'Sony', '\"6W METAL GRILLE CEILING SPEAKER,BOSLBD0606\"', 'Delhi', '6', '1', 'Testing', 1, '3', '3', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(530, 'Sound System', 3, 'Amplifier Installation', 1, 'Sony', '\"PLENA all-in-one 180W Two Zone Mixer Amplifier\"', 'Delhi', '13', '1', 'Testing', 1, '3', '3', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(531, 'Sound System', 3, 'Volume Installation', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '19', '1', 'Testing', 1, '3', '3', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(532, 'Sound System', 3, 'Pen Drive', 1, 'Hp', 'HP', 'Delhi', '22', '1', 'Testing', 1, '3', '3', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(533, 'Sound System', 3, 'Racks', 1, 'Dell', 'Cisco/Dell', 'Delhi', '5', '1', 'Testing', 1, '3', '3', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(534, 'IT HARDWARE', 4, 'Laptop', 1, 'HP', 'M8420', 'Delhi', '2', '1', 'Testing', 1, '4', '4', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(535, 'IT HARDWARE', 4, 'Desktop', 1, 'Dell', 'Optiplex 3040', 'Delhi', '2', '1', 'Testing', 1, '4', '4', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(536, 'IT HARDWARE', 4, 'Colour Printer', 1, 'Canon', 'M44TY', 'Delhi', '5', '1', 'Testing', 1, '4', '4', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(537, 'IT HARDWARE', 4, 'Laser Printers All In One', 1, 'HP', 'M44TY', 'delhi', '2', '1', 'Testing', 1, '4', '4', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(538, 'IT HARDWARE', 4, 'Online UPS For CCTV,IPBX', 1, 'Hp', 'As per Load', 'Delhi', '5', '1', 'Testing', 1, '4', '4', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(539, 'IT HARDWARE', 4, 'Pos Printers', 1, 'Hp', 'As per Load', 'Delhi', '5', '1', 'Testing', 1, '4', '4', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(540, 'Networking', 5, 'Network Switches 24ports', 1, 'HP', 'Hp/CISCO', 'Delhi', '6', '1', 'Testing', 1, '5', '5', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(541, 'Networking', 5, 'Network Rack', 1, 'Cisco', 'Cisco/Dell', 'Delhi', '3', '1', 'Testing', 1, '5', '5', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(542, 'Networking', 5, 'Patch Panel', 1, 'Cisco', 'Cisco', 'Delhi', '5', '1', 'Testing', 1, '5', '5', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(543, 'Networking', 5, 'Patch Chords', 1, 'D-link', 'D-link', 'Delhi', '5', '1', 'Testing', 1, '5', '5', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(544, 'Networking', 5, 'Io Point Termination On Each Floor & Office', 1, 'D-link', 'D-link', 'Delhi', '3', '1', 'Testing', 1, '5', '5', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(545, 'Software', 6, 'Hotel Management Cloud Base Software Cygnett Cloud', 1, 'Hotels System', 'Hotels System', 'Delhi', '5', '1', 'Testing', 1, '6', '6', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(546, 'Software', 6, 'Cygnett Cloud PMS Installtion', 1, 'Hotels System', 'Hotels System', 'Delhi', '5', '1', 'Testing', 1, '6', '6', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(547, 'Software', 6, 'Anti Virus Software As Per user Quick Heal', 1, 'Quick Heal', 'As per System', 'Delhi', '5', '1', 'Testing', 1, '6', '6', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(548, 'Software', 6, 'Windows & Ms Office', 1, 'Quick Heal', 'As per System', 'Delhi', '2', '1', 'Testing', 1, '6', '6', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(549, 'Lised Line', 7, 'Lised Line', 1, 'D-link', 'Minimum 30 MBPS', 'Delhi', '6', '1', 'Testng', 1, '7', '7', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(550, 'Lised Line', 7, 'Wi-fi Hotspot Service Provider', 1, 'D-link', 'HSIA/ 24 Online', 'Delhi', NULL, '1', 'Pms Interface & Coupon Generator', 1, '7', '7', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(551, 'Lised Line', 7, 'Wi Fi Service Provider', 1, 'D-link', 'Microtek / Airpro', 'Delhi', NULL, '1', 'Testng', 1, '7', '7', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(552, 'Broadband', 8, 'Isp For Broadband', 1, 'D-link', '100 MBPS For Backup', 'Delhi', '6', '1', 'Testing', 1, '8', '8', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(553, 'Attendance System', 9, 'Wiring For Attendance System', 1, 'E9C ESSL', 'E9C ESSL', 'Delhi', '6', '1', 'E9C ESSL', 1, '9', '9', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(554, 'Attendance Systen', 9, 'Attendance System', 1, 'E9C ESSL', 'E9C ESSL', 'Delhi', '6', '1', 'Wi-FI,Fingerprint,RFID,Face', 1, '9', '9', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(555, 'Cable TV', 10, 'Setuptop box', 1, 'Tata Sky /Airtel Dish TV', 'Tata Sky /Airtel Dish TV', 'Delhi', '4', '1', 'Testing', 1, '10', '10', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(556, 'Cable TV', 10, 'connection in all rooms', 1, 'Airtel Dish TV', 'Airtel Dish TV', 'Delhi', '4', '1', 'Testing', 1, '10', '10', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(557, 'PA System', 11, 'Mic Amplifire', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '6', '1', 'Testing', 1, '11', '11', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(558, 'PA System', 11, 'Wiring For Hooter', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '12', '1', 'Testing', 1, '11', '11', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(559, 'E-Mail For All Department', 12, 'G-suite Cygnett Email I\'d as per user', 1, 'Gmail', 'As per User', 'Delhi', '6', '1', 'Testing', 1, '12', '12', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06'),
(560, 'Computer Security', 13, 'Firwall', 1, 'Cisco / SoPhos', 'Cisco / SoPhos', 'Delhi', '3', '1', 'Testing', 1, '13', '13', 18, '1', '2024-09-06 02:17:06', '2024-09-06 02:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `check_list_information`
--

CREATE TABLE `check_list_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `hotel_detail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `check_list_information`
--

INSERT INTO `check_list_information` (`id`, `hotel_name`, `hotel_detail`, `title`, `description`, `start_date`, `start_time`, `end_date`, `end_time`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(15, 'Holiday Inn New Delhi Int\'l Airport', 'New Delhi', 'Holiday Inn New Delhi Int\'l Airport', 'Holiday Inn New Delhi Int\'l Airport', '2024-06-26', NULL, '2024-07-13', NULL, 39, 1, '2024-06-24 23:43:50', '2024-06-24 23:43:50'),
(16, '10', 'New Delhi', 'testing', 'Testing', '2024-07-02', NULL, '2024-07-04', NULL, 39, 1, '2024-07-01 05:55:58', '2024-07-01 05:55:58'),
(17, 'Homegrown Hideaway', 'New Delhi', 'Welcome to Serenity Suites: Your Home Away from Home', 'Indulge in Luxury at Serenity Suites', '2024-07-03', NULL, '2024-07-05', NULL, 39, 1, '2024-07-01 06:05:56', '2024-07-01 06:05:56'),
(18, 'Homegrown Hideaway', 'New Delhi', 'testtestestes', 'sadfasfd', '2024-09-05', NULL, '2024-10-19', NULL, 39, 1, '2024-09-06 02:17:06', '2024-09-06 02:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'North and Middle Andaman', 32, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(2, 'South Andaman', 32, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(3, 'Nicobar', 32, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(4, 'Adilabad', 1, 0, '2024-10-30 06:31:25', '2024-12-14 05:08:46'),
(5, 'Anantapur', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(6, 'Chittoor', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(7, 'East Godavari', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(8, 'Guntur', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(9, 'Hyderabad', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(10, 'Kadapa', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(11, 'Karimnagar', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(12, 'Khammam', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(13, 'Krishna', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(14, 'Kurnool', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(15, 'Mahbubnagar', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(16, 'Medak', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(17, 'Nalgonda', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(18, 'Nellore', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(19, 'Nizamabad', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(20, 'Prakasam', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(21, 'Rangareddi', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(22, 'Srikakulam', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(23, 'Vishakhapatnam', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(24, 'Vizianagaram', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(25, 'Warangal', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(26, 'West Godavari', 1, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(27, 'Anjaw', 3, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(28, 'Changlang', 3, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(29, 'East Kameng', 3, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(30, 'Lohit', 3, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(31, 'Lower Subansiri', 3, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(32, 'Papum Pare', 3, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(33, 'Tirap', 3, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(34, 'Dibang Valley', 3, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(35, 'Upper Subansiri', 3, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(36, 'West Kameng', 3, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(37, 'Barpeta', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(38, 'Bongaigaon', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(39, 'Cachar', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(40, 'Darrang', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(41, 'Dhemaji', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(42, 'Dhubri', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(43, 'Dibrugarh', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(44, 'Goalpara', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(45, 'Golaghat', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(46, 'Hailakandi', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(47, 'Jorhat', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(48, 'Karbi Anglong', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(49, 'Karimganj', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(50, 'Kokrajhar', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(51, 'Lakhimpur', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(52, 'Marigaon', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(53, 'Nagaon', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(54, 'Nalbari', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(55, 'North Cachar Hills', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(56, 'Sibsagar', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(57, 'Sonitpur', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(58, 'Tinsukia', 2, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(59, 'Araria', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(60, 'Aurangabad', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(61, 'Banka', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(62, 'Begusarai', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(63, 'Bhagalpur', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(64, 'Bhojpur', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(65, 'Buxar', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(66, 'Darbhanga', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(67, 'Purba Champaran', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(68, 'Gaya', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(69, 'Gopalganj', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(70, 'Jamui', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(71, 'Jehanabad', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(72, 'Khagaria', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(73, 'Kishanganj', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(74, 'Kaimur', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(75, 'Katihar', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(76, 'Lakhisarai', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(77, 'Madhubani', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(78, 'Munger', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(79, 'Madhepura', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(80, 'Muzaffarpur', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(81, 'Nalanda', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(82, 'Nawada', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(83, 'Patna', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(84, 'Purnia', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(85, 'Rohtas', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(86, 'Saharsa', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(87, 'Samastipur', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(88, 'Sheohar', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(89, 'Sheikhpura', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(90, 'Saran', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(91, 'Sitamarhi', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(92, 'Supaul', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(93, 'Siwan', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(94, 'Vaishali', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(95, 'Pashchim Champaran', 4, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(96, 'Bastar', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(97, 'Bilaspur', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(98, 'Dantewada', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(99, 'Dhamtari', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(100, 'Durg', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(101, 'Jashpur', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(102, 'Janjgir-Champa', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(103, 'Korba', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(104, 'Koriya', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(105, 'Kanker', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(106, 'Kawardha', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(107, 'Mahasamund', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(108, 'Raigarh', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(109, 'Rajnandgaon', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(110, 'Raipur', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(111, 'Surguja', 36, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(112, 'Diu', 29, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(113, 'Daman', 29, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(114, 'Central Delhi', 25, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(115, 'East Delhi', 25, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(116, 'New Delhi', 25, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(117, 'North Delhi', 25, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(118, 'North East Delhi', 25, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(119, 'North West Delhi', 25, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(120, 'South Delhi', 25, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(121, 'South West Delhi', 25, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(122, 'West Delhi', 25, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(123, 'North Goa', 26, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(124, 'South Goa', 26, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(125, 'Ahmedabad', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(126, 'Amreli District', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(127, 'Anand', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(128, 'Banaskantha', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(129, 'Bharuch', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(130, 'Bhavnagar', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(131, 'Dahod', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(132, 'The Dangs', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(133, 'Gandhinagar', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(134, 'Jamnagar', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(135, 'Junagadh', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(136, 'Kutch', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(137, 'Kheda', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(138, 'Mehsana', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(139, 'Narmada', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(140, 'Navsari', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(141, 'Patan', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(142, 'Panchmahal', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(143, 'Porbandar', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(144, 'Rajkot', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(145, 'Sabarkantha', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(146, 'Surendranagar', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(147, 'Surat', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(148, 'Vadodara', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(149, 'Valsad', 5, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(150, 'Ambala', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(151, 'Bhiwani', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(152, 'Faridabad', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(153, 'Fatehabad', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(154, 'Gurgaon', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(155, 'Hissar', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(156, 'Jhajjar', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(157, 'Jind', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(158, 'Karnal', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(159, 'Kaithal', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(160, 'Kurukshetra', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(161, 'Mahendragarh', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(162, 'Mewat', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(163, 'Panchkula', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(164, 'Panipat', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(165, 'Rewari', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(166, 'Rohtak', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(167, 'Sirsa', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(168, 'Sonepat', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(169, 'Yamuna Nagar', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(170, 'Palwal', 6, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(171, 'Bilaspur', 7, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(172, 'Chamba', 7, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(173, 'Hamirpur', 7, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(174, 'Kangra', 7, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(175, 'Kinnaur', 7, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(176, 'Kulu', 7, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(177, 'Lahaul and Spiti', 7, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(178, 'Mandi', 7, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(179, 'Shimla', 7, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(180, 'Sirmaur', 7, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(181, 'Solan', 7, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(182, 'Una', 7, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(183, 'Anantnag', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(184, 'Badgam', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(185, 'Bandipore', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(186, 'Baramula', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(187, 'Doda', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(188, 'Jammu', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(189, 'Kargil', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(190, 'Kathua', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(191, 'Kupwara', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(192, 'Leh', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(193, 'Poonch', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(194, 'Pulwama', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(195, 'Rajauri', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(196, 'Srinagar', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(197, 'Samba', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(198, 'Udhampur', 8, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(199, 'Bokaro', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(200, 'Chatra', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(201, 'Deoghar', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(202, 'Dhanbad', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(203, 'Dumka', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(204, 'Purba Singhbhum', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(205, 'Garhwa', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(206, 'Giridih', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(207, 'Godda', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(208, 'Gumla', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(209, 'Hazaribagh', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(210, 'Koderma', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(211, 'Lohardaga', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(212, 'Pakur', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(213, 'Palamu', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(214, 'Ranchi', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(215, 'Sahibganj', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(216, 'Seraikela and Kharsawan', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(217, 'Pashchim Singhbhum', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(218, 'Ramgarh', 34, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(219, 'Bidar', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(220, 'Belgaum', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(221, 'Bijapur', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(222, 'Bagalkot', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(223, 'Bellary', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(224, 'Bangalore Rural District', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(225, 'Bangalore Urban District', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(226, 'Chamarajnagar', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(227, 'Chikmagalur', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(228, 'Chitradurga', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(229, 'Davanagere', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(230, 'Dharwad', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(231, 'Dakshina Kannada', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(232, 'Gadag', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(233, 'Gulbarga', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(234, 'Hassan', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(235, 'Haveri District', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(236, 'Kodagu', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(237, 'Kolar', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(238, 'Koppal', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(239, 'Mandya', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(240, 'Mysore', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(241, 'Raichur', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(242, 'Shimoga', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(243, 'Tumkur', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(244, 'Udupi', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(245, 'Uttara Kannada', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(246, 'Ramanagara', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(247, 'Chikballapur', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(248, 'Yadagiri', 9, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(249, 'Alappuzha', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(250, 'Ernakulam', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(251, 'Idukki', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(252, 'Kollam', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(253, 'Kannur', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(254, 'Kasaragod', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(255, 'Kottayam', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(256, 'Kozhikode', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(257, 'Malappuram', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(258, 'Palakkad', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(259, 'Pathanamthitta', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(260, 'Thrissur', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(261, 'Thiruvananthapuram', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(262, 'Wayanad', 10, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(263, 'Alirajpur', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(264, 'Anuppur', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(265, 'Ashok Nagar', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(266, 'Balaghat', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(267, 'Barwani', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(268, 'Betul', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(269, 'Bhind', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(270, 'Bhopal', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(271, 'Burhanpur', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(272, 'Chhatarpur', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(273, 'Chhindwara', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(274, 'Damoh', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(275, 'Datia', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(276, 'Dewas', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(277, 'Dhar', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(278, 'Dindori', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(279, 'Guna', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(280, 'Gwalior', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(281, 'Harda', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(282, 'Hoshangabad', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(283, 'Indore', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(284, 'Jabalpur', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(285, 'Jhabua', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(286, 'Katni', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(287, 'Khandwa', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(288, 'Khargone', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(289, 'Mandla', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(290, 'Mandsaur', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(291, 'Morena', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(292, 'Narsinghpur', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(293, 'Neemuch', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(294, 'Panna', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(295, 'Rewa', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(296, 'Rajgarh', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(297, 'Ratlam', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(298, 'Raisen', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(299, 'Sagar', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(300, 'Satna', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(301, 'Sehore', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(302, 'Seoni', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(303, 'Shahdol', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(304, 'Shajapur', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(305, 'Sheopur', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(306, 'Shivpuri', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(307, 'Sidhi', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(308, 'Singrauli', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(309, 'Tikamgarh', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(310, 'Ujjain', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(311, 'Umaria', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(312, 'Vidisha', 11, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(313, 'Ahmednagar', 12, 1, '2024-10-30 06:31:25', '2024-12-14 05:08:55'),
(314, 'Akola', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(315, 'Amrawati', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(316, 'Aurangabad', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(317, 'Bhandara', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(318, 'Beed', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(319, 'Buldhana', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(320, 'Chandrapur', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(321, 'Dhule', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(322, 'Gadchiroli', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(323, 'Gondiya', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(324, 'Hingoli', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(325, 'Jalgaon', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(326, 'Jalna', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(327, 'Kolhapur', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(328, 'Latur', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(329, 'Mumbai City', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(330, 'Mumbai suburban', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(331, 'Nandurbar', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(332, 'Nanded', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(333, 'Nagpur', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(334, 'Nashik', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(335, 'Osmanabad', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(336, 'Parbhani', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(337, 'Pune', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(338, 'Raigad', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(339, 'Ratnagiri', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(340, 'Sindhudurg', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(341, 'Sangli', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(342, 'Solapur', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(343, 'Satara', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(344, 'Thane', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(345, 'Wardha', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(346, 'Washim', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(347, 'Yavatmal', 12, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(348, 'Bishnupur', 13, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(349, 'Churachandpur', 13, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(350, 'Chandel', 13, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(351, 'Imphal East', 13, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(352, 'Senapati', 13, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(353, 'Tamenglong', 13, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(354, 'Thoubal', 13, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(355, 'Ukhrul', 13, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(356, 'Imphal West', 13, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(357, 'East Garo Hills', 14, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(358, 'East Khasi Hills', 14, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(359, 'Jaintia Hills', 14, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(360, 'Ri-Bhoi', 14, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(361, 'South Garo Hills', 14, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(362, 'West Garo Hills', 14, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(363, 'West Khasi Hills', 14, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(364, 'Aizawl', 15, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(365, 'Champhai', 15, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(366, 'Kolasib', 15, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(367, 'Lawngtlai', 15, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(368, 'Lunglei', 15, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(369, 'Mamit', 15, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(370, 'Saiha', 15, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(371, 'Serchhip', 15, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(372, 'Dimapur', 16, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(373, 'Kohima', 16, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(374, 'Mokokchung', 16, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(375, 'Mon', 16, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(376, 'Phek', 16, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(377, 'Tuensang', 16, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(378, 'Wokha', 16, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(379, 'Zunheboto', 16, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(380, 'Angul', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(381, 'Boudh', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(382, 'Bhadrak', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(383, 'Bolangir', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(384, 'Bargarh', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(385, 'Baleswar', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(386, 'Cuttack', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(387, 'Debagarh', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(388, 'Dhenkanal', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(389, 'Ganjam', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(390, 'Gajapati', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(391, 'Jharsuguda', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(392, 'Jajapur', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(393, 'Jagatsinghpur', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(394, 'Khordha', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(395, 'Kendujhar', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(396, 'Kalahandi', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(397, 'Kandhamal', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(398, 'Koraput', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(399, 'Kendrapara', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(400, 'Malkangiri', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(401, 'Mayurbhanj', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(402, 'Nabarangpur', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(403, 'Nuapada', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(404, 'Nayagarh', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(405, 'Puri', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(406, 'Rayagada', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(407, 'Sambalpur', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(408, 'Subarnapur', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(409, 'Sundargarh', 17, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(410, 'Karaikal', 27, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(411, 'Mahe', 27, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(412, 'Puducherry', 27, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(413, 'Yanam', 27, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(414, 'Amritsar', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(415, 'Bathinda', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(416, 'Firozpur', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(417, 'Faridkot', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(418, 'Fatehgarh Sahib', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(419, 'Gurdaspur', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(420, 'Hoshiarpur', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(421, 'Jalandhar', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(422, 'Kapurthala', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(423, 'Ludhiana', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(424, 'Mansa', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(425, 'Moga', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(426, 'Mukatsar', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(427, 'Nawan Shehar', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(428, 'Patiala', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(429, 'Rupnagar', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(430, 'Sangrur', 18, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(431, 'Ajmer', 19, 1, '2024-10-30 06:31:25', '2024-12-14 05:13:28'),
(432, 'Alwar', 19, 1, '2024-10-30 06:31:25', '2024-12-14 05:13:31'),
(433, 'Banswara', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(434, 'Baran', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(435, 'Bharatpur', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(436, 'Bikaner', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(437, 'Churu', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(438, 'Dausa', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(439, 'Dholpur', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(440, 'Dungarpur', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(441, 'Hanumangarh', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(442, 'Jaipur', 19, 1, '2024-10-30 06:31:25', '2024-12-14 05:18:01'),
(443, 'Jaisalmer', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(444, 'Jhalawar', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(445, 'Jhunjhunu', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(446, 'Nagaur', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(447, 'Pali', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(448, 'Rajasthan', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(449, 'Sikar', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(450, 'Sirohi', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(451, 'Tonk', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(452, 'Udaipur', 19, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(453, 'North Goa', 20, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(454, 'South Goa', 20, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(455, 'Ahmedabad', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(456, 'Amreli', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(457, 'Anand', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(458, 'Banaskantha', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(459, 'Bharuch', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(460, 'Bhavnagar', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(461, 'Dahod', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(462, 'Gandhinagar', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(463, 'Kutch', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(464, 'Mehsana', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(465, 'Narmada', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(466, 'Navsari', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(467, 'Panchmahal', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(468, 'Patan', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(469, 'Sabarkantha', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(470, 'Surat', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(471, 'Tapi', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(472, 'Vadodara', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(473, 'Valsad', 21, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(474, 'Ambala', 22, 0, '2024-10-30 06:31:25', '2024-12-14 05:12:36'),
(475, 'Bhiwani', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(476, 'Faridabad', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(477, 'Fatehabad', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(478, 'Gurgaon', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(479, 'Hisar', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(480, 'Jhajjar', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(481, 'Jind', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(482, 'Kaithal', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(483, 'Karnal', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(484, 'Kurukshetra', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(485, 'Mahendragarh', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(486, 'Mewat', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(487, 'Palwal', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(488, 'Panchkula', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(489, 'Panipat', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(490, 'Rewari', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(491, 'Rohtak', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(492, 'Sirsa', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(493, 'Sonipat', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(494, 'Yamunanagar', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(495, 'Dhalai', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(496, 'Gomati', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(497, 'Khowai', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(498, 'North Tripura', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(499, 'Dhalai', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(500, 'South Tripura', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(501, 'West Tripura', 22, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(502, 'Almora', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(503, 'Bageshwar', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(504, 'Chamoli', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(505, 'Champawat', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(506, 'Dehradun', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(507, 'Haridwar', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(508, 'Nainital', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(509, 'Pauri Garhwal', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(510, 'Pithoragharh', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(511, 'Rudraprayag', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(512, 'Tehri Garhwal', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(513, 'Udham Singh Nagar', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(514, 'Uttarkashi', 33, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(515, 'Agra', 23, 1, '2024-10-30 06:31:25', '2024-12-14 05:51:54'),
(516, 'Allahabad', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(517, 'Aligarh', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(518, 'Ambedkar Nagar', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(519, 'Auraiya', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(520, 'Azamgarh', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(521, 'Barabanki', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(522, 'Badaun', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(523, 'Bagpat', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(524, 'Bahraich', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(525, 'Bijnor', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(526, 'Ballia', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(527, 'Banda', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(528, 'Balrampur', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(529, 'Bareilly', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(530, 'Basti', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(531, 'Bulandshahr', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(532, 'Chandauli', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(533, 'Chitrakoot', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(534, 'Deoria', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(535, 'Etah', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(536, 'Kanshiram Nagar', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(537, 'Etawah', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(538, 'Firozabad', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(539, 'Farrukhabad', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(540, 'Fatehpur', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(541, 'Faizabad', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(542, 'Gautam Buddha Nagar', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(543, 'Gonda', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(544, 'Ghazipur', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(545, 'Gorkakhpur', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(546, 'Ghaziabad', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(547, 'Hamirpur', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(548, 'Hardoi', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(549, 'Mahamaya Nagar', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(550, 'Jhansi', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(551, 'Jalaun', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(552, 'Jyotiba Phule Nagar', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(553, 'Jaunpur District', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(554, 'Kanpur Dehat', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(555, 'Kannauj', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(556, 'Kanpur Nagar', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(557, 'Kaushambi', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(558, 'Kushinagar', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(559, 'Lalitpur', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(560, 'Lakhimpur Kheri', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(561, 'Lucknow', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(562, 'Mau', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(563, 'Meerut', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(564, 'Maharajganj', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(565, 'Mahoba', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(566, 'Mirzapur', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(567, 'Moradabad', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(568, 'Mainpuri', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(569, 'Mathura', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(570, 'Muzaffarnagar', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(571, 'Pilibhit', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(572, 'Pratapgarh', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(573, 'Rampur', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(574, 'Rae Bareli', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(575, 'Saharanpur', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(576, 'Sitapur', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(577, 'Shahjahanpur', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(578, 'Sant Kabir Nagar', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(579, 'Siddharthnagar', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(580, 'Sonbhadra', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(581, 'Sant Ravidas Nagar', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(582, 'Sultanpur', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(583, 'Shravasti', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(584, 'Unnao', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(585, 'Varanasi', 23, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(586, 'Birbhum', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(587, 'Bankura', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(588, 'Bardhaman', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(589, 'Darjeeling', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(590, 'Dakshin Dinajpur', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(591, 'Hooghly', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(592, 'Howrah', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(593, 'Jalpaiguri', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(594, 'Cooch Behar', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(595, 'Kolkata', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(596, 'Malda', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(597, 'Midnapore', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(598, 'Murshidabad', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(599, 'Nadia', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(600, 'North 24 Parganas', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(601, 'South 24 Parganas', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(602, 'Purulia', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(603, 'Uttar Dinajpur', 24, 1, '2024-10-30 06:31:25', '2024-10-30 06:31:25'),
(604, 'Chandigarh', 31, 1, '2024-11-07 08:19:06', '2024-11-07 08:19:06');

-- --------------------------------------------------------

--
-- Table structure for table `department_types`
--

CREATE TABLE `department_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department_types`
--

INSERT INTO `department_types` (`id`, `name`, `short_name`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'IT (Information Technology)', 'IT', NULL, 1, '2024-09-14 09:46:53', '2024-12-19 06:10:04', NULL),
(2, 'Accounts', 'A/C', NULL, 1, '2024-09-26 06:51:41', '2024-10-16 23:51:28', NULL),
(3, 'HR (Human Resources)', 'HR', NULL, 1, '2024-07-31 07:12:35', '2024-10-16 23:51:36', NULL),
(4, 'FO (Front Office)', 'FO', NULL, 1, '2024-07-31 07:12:49', '2024-10-16 23:51:43', NULL),
(5, 'F & BS (Food & Beverage Service)', 'F & BS', NULL, 1, '2024-07-31 07:13:14', '2024-10-16 23:51:52', NULL),
(6, 'HK (House Keeping)', 'HK', NULL, 1, '2024-07-31 07:13:33', '2024-10-16 23:52:00', NULL),
(7, 'F & BP (Food and Beverage Production)', 'F & BP', NULL, 1, '2024-07-31 07:13:49', '2024-10-16 23:52:11', NULL),
(8, 'Engineering', 'ENG', NULL, 1, '2024-07-31 07:14:08', '2024-10-16 23:52:19', NULL),
(9, 'Store Purchase', 'SP', NULL, 1, '2024-07-31 07:14:25', '2024-10-16 23:52:27', NULL),
(10, 'Security', 'SCU', NULL, 1, '2024-07-31 07:14:37', '2024-10-16 23:52:40', NULL),
(11, 'Sales', 'Sales', NULL, 1, '2024-07-31 07:14:59', '2024-10-16 23:52:56', NULL),
(12, 'Administration', 'Admin', NULL, 1, '2024-07-31 07:15:15', '2024-10-16 23:53:19', NULL),
(13, 'Legal', 'Legal', NULL, 1, '2024-07-31 07:15:30', '2024-10-16 23:53:29', NULL),
(14, 'MD', 'MD', NULL, 1, '2024-07-31 12:03:19', '2024-10-16 23:53:38', NULL),
(15, 'Owner', 'Owner', NULL, 1, '2024-07-31 12:03:19', '2024-10-16 23:53:47', NULL),
(16, 'Cygnett', 'CYG', NULL, 1, '2024-07-31 12:04:04', '2024-10-16 23:53:57', NULL),
(17, 'Unit GM', NULL, NULL, 1, '2024-07-31 12:04:29', '2024-07-31 12:04:29', NULL),
(18, 'Corporate', 'Corp', NULL, 1, '2024-07-31 12:04:42', '2024-10-16 23:54:06', NULL),
(19, 'Pre Opening', 'Pre Ope', NULL, 1, '2024-07-31 12:05:12', '2024-10-16 23:54:21', NULL),
(20, 'SOP', 'SOP', NULL, 1, '2024-07-31 12:05:41', '2024-10-16 23:54:29', NULL),
(21, 'Omfowtech', 'Omfo', NULL, 0, '2024-07-31 12:05:56', '2024-12-13 09:40:27', NULL),
(37, 'Digital', 'Digital', NULL, 0, '2024-09-25 10:55:47', '2024-12-13 09:37:05', NULL),
(38, 'HR (Human Resources)', 'HR', NULL, 0, '2024-09-26 05:46:52', '2024-12-13 08:35:13', NULL),
(65, 'Test Department', 'TD', NULL, 1, '2024-10-18 07:48:27', '2024-11-25 06:43:42', '2024-11-25 06:43:42'),
(66, 'Cygnett Testing', 'CG', NULL, 1, '2024-10-19 04:28:29', '2024-11-25 06:41:12', '2024-11-25 06:41:12'),
(67, 'test', 'test', NULL, 1, '2024-10-30 00:14:50', '2024-10-30 00:15:17', '2024-10-30 00:15:17'),
(68, 'test', 'test', NULL, 1, '2024-11-03 23:31:31', '2024-11-03 23:33:16', '2024-11-03 23:33:16'),
(69, 'test', 'test', NULL, 1, '2024-11-25 07:16:52', '2024-11-25 07:18:19', '2024-11-25 07:18:19'),
(70, 'test', 'test', NULL, 1, '2024-12-14 07:40:59', '2024-12-14 07:40:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `main_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `can_download` tinyint(4) DEFAULT NULL,
  `doc_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `converted_file` text DEFAULT NULL,
  `doc_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `document_title`, `main_category_id`, `sub_category_id`, `main_folder_id`, `sub_folder_id`, `department_type_id`, `description`, `role_type_id`, `user_id`, `start_date`, `start_time`, `end_date`, `end_time`, `can_download`, `doc_file`, `converted_file`, `doc_path`, `admin_id`, `owner_id`, `disk`, `assigned_users`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'test_boq', NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1729509646.docx', 'Error reading Word file: PDF rendering library or library path has not been defined.', 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-10-21 05:50:46', '2024-10-28 10:35:08', NULL),
(2, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1729509706.docx', 'Error reading Word file: PDF rendering library or library path has not been defined.', 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-10-21 05:51:46', '2024-10-21 05:51:46', NULL),
(3, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1729509904.docx', '1729509904.pdf', 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-10-21 05:55:04', '2024-10-21 05:55:04', NULL),
(4, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1729509971.doc', 'General error: The archive failed to load with the following error code: 19', 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-10-21 05:56:11', '2024-10-21 05:56:11', NULL),
(5, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1729511255.docx', '1729511257.pdf', 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-10-21 06:17:35', '2024-10-21 06:17:37', NULL),
(6, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1729511469.docx', '1729511469.pdf', 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-10-21 06:21:09', '2024-10-21 06:21:09', NULL),
(7, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1729511517.doc', 'General error: The archive failed to load with the following error code: 19', 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-10-21 06:21:57', '2024-10-21 06:21:57', NULL),
(8, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1729512581.docx', '1729512583.pdf', 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-10-21 06:39:41', '2024-10-21 06:39:44', NULL),
(9, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1729582138.xlsx', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-10-22 01:58:58', '2024-10-22 01:58:58', NULL),
(10, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1729593001.png', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-10-22 05:00:01', '2024-10-22 05:00:01', NULL),
(11, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1729593078.pdf', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-10-22 05:01:18', '2024-10-22 05:01:18', NULL),
(12, NULL, 'IT Reports', NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1729937237.docx', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 162, NULL, NULL, NULL, '2024-10-26 10:07:17', '2024-12-02 11:58:16', NULL),
(14, NULL, 'test_boq', NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1730112007.php', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-10-28 10:40:07', '2024-12-12 05:44:45', NULL),
(16, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1731744511.pdf', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 193, NULL, NULL, NULL, '2024-11-16 02:38:31', '2024-11-16 02:38:31', NULL),
(17, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1731744904.png', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 198, NULL, '[195,196,197]', NULL, '2024-11-16 02:45:04', '2024-11-22 11:06:24', NULL),
(18, NULL, NULL, NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1731745013.png', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 213, NULL, '[197,198]', NULL, '2024-11-16 02:46:53', '2024-12-14 07:28:00', NULL),
(19, NULL, 'upload my admin', NULL, NULL, 37, 55, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1732104018.docx', NULL, 'public/folders/Digital/SEO', NULL, 1, NULL, NULL, NULL, '2024-11-20 12:00:18', '2024-12-13 05:54:31', '2024-12-13 05:54:31'),
(20, NULL, 'new', NULL, NULL, 37, 55, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1732104217.jpg', NULL, 'public/folders/Digital/SEO', NULL, 1, NULL, '[196]', NULL, '2024-11-20 12:03:37', '2024-11-22 10:44:46', NULL),
(21, NULL, 'test test', NULL, NULL, 37, 55, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1732106118.jpg', NULL, 'public/folders/Digital/SEO', NULL, 193, NULL, '[196]', NULL, '2024-11-20 12:35:18', '2024-12-13 05:55:39', '2024-12-13 05:55:39'),
(22, NULL, 'by rahul', NULL, NULL, 37, 55, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1732164315.jpg', NULL, 'public/folders/Digital/SEO', NULL, 196, NULL, '[199]', NULL, '2024-11-21 04:45:15', '2024-12-18 06:58:52', NULL),
(23, NULL, 'upload by sachin', NULL, NULL, 37, 55, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1732166128.jpg', NULL, 'public/folders/Digital/SEO', NULL, 201, NULL, '[196,211]', NULL, '2024-11-21 05:15:28', '2024-12-13 05:55:29', '2024-12-13 05:55:29'),
(27, NULL, 'Web Designe', NULL, NULL, 14, 1, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1732521838.xlsx', NULL, 'public/folders/MD/MD-1', NULL, 1, NULL, NULL, NULL, '2024-11-25 08:03:58', '2024-12-13 05:54:56', NULL),
(28, NULL, 'Card activity arabic stage 2 final', NULL, NULL, 14, 2, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1732521878.pdf', NULL, 'public/folders/MD/MD-2', NULL, 1, NULL, NULL, NULL, '2024-11-25 08:04:38', '2024-12-13 05:55:34', '2024-12-13 05:55:34'),
(31, NULL, 'sdfdd', NULL, NULL, 13, 8, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1734603879.csv', NULL, 'public/folders/Legal/HMA', NULL, 1, NULL, '[194,195,201]', NULL, '2024-11-28 07:15:29', '2024-12-19 10:24:39', NULL),
(35, NULL, 'No Title', NULL, NULL, 2, 87, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1733831314.png', NULL, 'public/folders/Accounts/Acc Test', NULL, 1, NULL, NULL, NULL, '2024-12-10 11:48:34', '2024-12-10 11:48:34', NULL),
(36, NULL, 'sdfsaf', NULL, NULL, 3, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1733831325.png', NULL, 'public/folders/Accounts/Acc Test', NULL, 1, NULL, NULL, NULL, '2024-12-10 11:48:45', '2024-12-14 08:24:47', NULL),
(37, NULL, 'No Title gdf', NULL, NULL, 2, 87, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1733999563.png', NULL, 'public/folders/Digital/SEO', NULL, 1, NULL, '[193,197]', NULL, '2024-12-12 10:32:43', '2024-12-20 06:04:49', NULL),
(38, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the', NULL, NULL, 2, 87, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1734165237.png', NULL, 'public/folders/Accounts/Acc Test', NULL, 1, NULL, NULL, NULL, '2024-12-14 08:33:57', '2024-12-14 08:33:57', NULL),
(39, NULL, 'No Titledfdf dgdfgdffssd', NULL, NULL, 2, 87, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1734594989.csv', NULL, 'public/folders/Accounts/test', NULL, 1, NULL, '[193,195]', NULL, '2024-12-14 10:40:55', '2024-12-21 07:17:28', NULL),
(40, NULL, 'test', NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1734774706.png', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-12-21 09:51:46', '2024-12-21 09:51:46', NULL),
(41, NULL, 'dffdgdfg', NULL, NULL, 12, 3, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1734777768.png', NULL, 'public/folders/Administration/ADMIN-1', NULL, 1, NULL, NULL, NULL, '2024-12-21 10:42:48', '2024-12-21 10:42:48', NULL),
(42, NULL, 'dffdf', NULL, NULL, 37, 55, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1734779653.png', NULL, 'public/folders/Digital/SEO', NULL, 204, NULL, NULL, NULL, '2024-12-21 11:14:13', '2024-12-21 11:14:13', NULL),
(43, NULL, 'dfdf', NULL, NULL, 37, 55, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 204, NULL, NULL, NULL, '2024-12-21 11:20:20', '2024-12-21 11:20:20', NULL),
(44, NULL, 'ghgh', NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1735028982.xlsx', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-12-24 08:29:42', '2024-12-24 08:29:42', NULL),
(45, NULL, 'ghjghfj', NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test.xlsx', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-12-24 08:31:31', '2024-12-24 08:31:31', NULL),
(46, NULL, 'testin', NULL, NULL, 12, 3, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1735035514.png', NULL, 'public/folders/Accounts/Acc Test', NULL, 1, NULL, NULL, NULL, '2024-12-24 10:18:34', '2024-12-26 10:11:24', NULL),
(47, NULL, '<script>alert(\'hello world\');</script>', NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1735035829.png', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-12-24 10:23:49', '2024-12-24 10:23:49', NULL),
(48, NULL, 'console.log(\'hello\');', NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1735035864.png', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-12-24 10:24:24', '2024-12-24 10:24:24', NULL),
(49, NULL, 'file1111', NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1735035942.png', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-12-24 10:25:42', '2024-12-24 10:25:42', NULL),
(50, NULL, 'file1111', NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1735035953.png', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-12-24 10:25:53', '2024-12-24 10:25:53', NULL),
(51, NULL, 'Helloo', NULL, NULL, 12, 3, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1735037040.png', NULL, 'public/folders/Administration/ADMIN-1', NULL, 1, NULL, NULL, NULL, '2024-12-24 10:44:00', '2024-12-24 10:44:00', NULL),
(52, NULL, 'testing', NULL, NULL, 12, 3, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1735037064.png', NULL, 'public/folders/Administration/ADMIN-1', NULL, 1, NULL, NULL, NULL, '2024-12-24 10:44:24', '2024-12-24 10:44:24', NULL),
(53, NULL, 'No Title', NULL, NULL, 12, 3, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1735195493.png', NULL, 'public/folders/Administration/ADMIN-1', NULL, 1, NULL, NULL, NULL, '2024-12-26 06:44:53', '2024-12-26 10:02:29', NULL),
(54, NULL, 'xyzfd', NULL, NULL, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1735207976.png', NULL, 'public/folders/IT (Information Technology)/BOQ', NULL, 1, NULL, NULL, NULL, '2024-12-26 10:12:56', '2024-12-26 10:56:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `document_audits`
--

CREATE TABLE `document_audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_id` bigint(20) UNSIGNED DEFAULT NULL,
  `main_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `changes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`changes`)),
  `batch_code` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_audits`
--

INSERT INTO `document_audits` (`id`, `user_id`, `role_type_id`, `document_id`, `main_folder_id`, `sub_folder_id`, `operation`, `changes`, `batch_code`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, 1, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 00:22:37', '2024-10-21 00:22:37', NULL),
(2, 1, NULL, 2, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 00:22:40', '2024-10-21 00:22:40', NULL),
(3, 1, NULL, 3, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 00:22:42', '2024-10-21 00:22:42', NULL),
(4, 1, NULL, 7, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 00:23:12', '2024-10-21 00:23:12', NULL),
(5, 1, NULL, 7, 1, 57, 'update', NULL, NULL, 1, '2024-10-21 00:24:36', '2024-10-21 00:24:36', NULL),
(6, 1, NULL, 7, 1, 57, 'update', NULL, NULL, 1, '2024-10-21 00:25:41', '2024-10-21 00:25:41', NULL),
(7, 1, NULL, 7, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 00:54:41', '2024-10-21 00:54:41', NULL),
(8, 1, NULL, 10, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 05:00:47', '2024-10-21 05:00:47', NULL),
(9, 1, NULL, 11, 1, 57, 'delete', NULL, NULL, 1, '2024-10-21 05:01:26', '2024-10-21 05:01:26', NULL),
(10, 1, NULL, 1, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 07:41:07', '2024-10-21 07:41:07', NULL),
(11, 1, NULL, 2, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 07:41:11', '2024-10-21 07:41:11', NULL),
(12, 1, NULL, 1, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 23:11:38', '2024-10-21 23:11:38', NULL),
(13, 1, NULL, 2, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 23:12:00', '2024-10-21 23:12:00', NULL),
(14, 1, NULL, 7, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 23:12:59', '2024-10-21 23:12:59', NULL),
(15, 1, NULL, 8, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 23:13:50', '2024-10-21 23:13:50', NULL),
(16, 1, NULL, 6, 1, 57, 'view', NULL, NULL, 1, '2024-10-21 23:13:55', '2024-10-21 23:13:55', NULL),
(17, 1, NULL, 1, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 01:37:36', '2024-10-22 01:37:36', NULL),
(18, 1, NULL, 1, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 01:41:00', '2024-10-22 01:41:00', NULL),
(19, 1, NULL, 3, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:40:38', '2024-10-22 05:40:38', NULL),
(20, 1, NULL, 10, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:47:31', '2024-10-22 05:47:31', NULL),
(21, 1, NULL, 10, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:48:14', '2024-10-22 05:48:14', NULL),
(22, 1, NULL, 10, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:48:15', '2024-10-22 05:48:15', NULL),
(23, 1, NULL, 10, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:48:39', '2024-10-22 05:48:39', NULL),
(24, 1, NULL, 10, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:49:12', '2024-10-22 05:49:12', NULL),
(25, 1, NULL, 10, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:50:03', '2024-10-22 05:50:03', NULL),
(26, 1, NULL, 11, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:50:28', '2024-10-22 05:50:28', NULL),
(27, 1, NULL, 11, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:51:16', '2024-10-22 05:51:16', NULL),
(28, 1, NULL, 11, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:54:28', '2024-10-22 05:54:28', NULL),
(29, 1, NULL, 11, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:54:40', '2024-10-22 05:54:40', NULL),
(30, 1, NULL, 10, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:56:01', '2024-10-22 05:56:01', NULL),
(31, 1, NULL, 8, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:56:08', '2024-10-22 05:56:08', NULL),
(32, 1, NULL, 8, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:56:22', '2024-10-22 05:56:22', NULL),
(33, 1, NULL, 11, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:56:26', '2024-10-22 05:56:26', NULL),
(34, 1, NULL, 11, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:57:16', '2024-10-22 05:57:16', NULL),
(35, 1, NULL, 11, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:57:23', '2024-10-22 05:57:23', NULL),
(36, 1, NULL, 10, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:57:31', '2024-10-22 05:57:31', NULL),
(37, 1, NULL, 7, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:57:35', '2024-10-22 05:57:35', NULL),
(38, 1, NULL, 7, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 05:58:05', '2024-10-22 05:58:05', NULL),
(39, 1, NULL, 11, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 06:07:02', '2024-10-22 06:07:02', NULL),
(40, 1, NULL, 11, 1, 57, 'view', NULL, NULL, 1, '2024-10-22 23:11:58', '2024-10-22 23:11:58', NULL),
(41, 1, NULL, 7, 1, 57, 'view', NULL, NULL, 1, '2024-10-25 08:04:21', '2024-10-25 08:04:21', NULL),
(42, 1, NULL, 5, 1, 57, 'view', NULL, NULL, 1, '2024-10-28 01:03:12', '2024-10-28 01:03:12', NULL),
(43, 1, NULL, 1, 1, 57, 'delete', NULL, NULL, 1, '2024-10-30 02:33:25', '2024-10-30 02:33:25', NULL),
(44, 1, NULL, 2, 1, 57, 'delete', NULL, NULL, 1, '2024-10-30 02:33:27', '2024-10-30 02:33:27', NULL),
(45, 1, NULL, 3, 1, 57, 'delete', NULL, NULL, 1, '2024-10-30 02:56:16', '2024-10-30 02:56:16', NULL),
(46, 1, NULL, 4, 1, 57, 'delete', NULL, NULL, 1, '2024-10-30 03:08:02', '2024-10-30 03:08:02', NULL),
(47, 1, NULL, 11, 1, 57, 'delete', NULL, NULL, 1, '2024-10-30 03:08:11', '2024-10-30 03:08:11', NULL),
(48, 1, NULL, 5, 1, 57, 'view', NULL, NULL, 1, '2024-10-30 03:09:56', '2024-10-30 03:09:56', NULL),
(49, 1, NULL, 5, 1, 57, 'view', NULL, NULL, 1, '2024-10-30 03:11:09', '2024-10-30 03:11:09', NULL),
(50, 1, NULL, 12, 1, 57, 'view', NULL, NULL, 1, '2024-10-30 06:58:46', '2024-10-30 06:58:46', NULL),
(51, 1, NULL, 12, 1, 57, 'delete', NULL, NULL, 1, '2024-10-30 06:58:57', '2024-10-30 06:58:57', NULL),
(52, 1, NULL, 12, 1, 57, 'view', NULL, NULL, 1, '2024-10-30 07:00:58', '2024-10-30 07:00:58', NULL),
(53, 1, NULL, 12, 1, 57, 'view', NULL, NULL, 1, '2024-10-30 07:02:19', '2024-10-30 07:02:19', NULL),
(54, 1, NULL, 4, 1, 57, 'view', NULL, NULL, 1, '2024-10-30 07:02:35', '2024-10-30 07:02:35', NULL),
(55, 1, NULL, 4, 1, 57, 'view', NULL, NULL, 1, '2024-10-30 07:03:36', '2024-10-30 07:03:36', NULL),
(56, 1, NULL, 12, 1, 57, 'restore', NULL, NULL, 1, '2024-10-30 07:03:43', '2024-10-30 07:03:43', NULL),
(57, 1, NULL, 4, 1, 57, 'restore', NULL, NULL, 1, '2024-10-30 07:06:05', '2024-10-30 07:06:05', NULL),
(58, 1, NULL, 3, 1, 57, 'download', NULL, NULL, 1, '2024-10-30 07:06:11', '2024-10-30 07:06:11', NULL),
(59, 1, NULL, 2, 1, 57, 'restore', NULL, NULL, 1, '2024-10-30 07:06:33', '2024-10-30 07:06:33', NULL),
(60, 1, NULL, 2, 1, 57, 'view', NULL, NULL, 1, '2024-10-30 07:16:08', '2024-10-30 07:16:08', NULL),
(61, 1, NULL, 1, 1, 57, 'view', NULL, NULL, 1, '2024-11-03 23:27:02', '2024-11-03 23:27:02', NULL),
(62, 1, NULL, 1, 1, 57, 'view', NULL, NULL, 1, '2024-11-03 23:38:01', '2024-11-03 23:38:01', NULL),
(63, 1, NULL, 2, 1, 57, 'view', NULL, NULL, 1, '2024-11-03 23:38:11', '2024-11-03 23:38:11', NULL),
(64, 1, NULL, 9, 1, 57, 'view', NULL, NULL, 1, '2024-11-04 00:30:38', '2024-11-04 00:30:38', NULL),
(65, 1, NULL, 1, 1, 57, 'view', NULL, NULL, 1, '2024-11-16 10:21:35', '2024-11-16 10:21:35', NULL),
(66, 1, NULL, 1, 1, 57, 'view', NULL, NULL, 1, '2024-11-16 11:14:30', '2024-11-16 11:14:30', NULL),
(67, 193, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-20 12:35:24', '2024-11-20 12:35:24', NULL),
(68, 1, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-20 12:36:02', '2024-11-20 12:36:02', NULL),
(69, 193, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-20 12:46:27', '2024-11-20 12:46:27', NULL),
(70, 1, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-20 13:10:50', '2024-11-20 13:10:50', NULL),
(71, 1, NULL, 20, 37, 55, 'update', NULL, NULL, 1, '2024-11-20 13:20:01', '2024-11-20 13:20:01', NULL),
(72, 193, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-20 13:20:19', '2024-11-20 13:20:19', NULL),
(73, 193, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-20 13:20:22', '2024-11-20 13:20:22', NULL),
(74, 193, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-20 13:22:27', '2024-11-20 13:22:27', NULL),
(75, 1, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-20 13:22:41', '2024-11-20 13:22:41', NULL),
(76, 1, NULL, 19, 37, 55, 'update', NULL, NULL, 1, '2024-11-20 13:22:51', '2024-11-20 13:22:51', NULL),
(77, 193, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-20 13:22:58', '2024-11-20 13:22:58', NULL),
(78, 193, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-20 13:23:49', '2024-11-20 13:23:49', NULL),
(79, 193, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-20 13:24:07', '2024-11-20 13:24:07', NULL),
(80, 1, NULL, 19, 37, 55, 'update', NULL, NULL, 1, '2024-11-20 13:29:03', '2024-11-20 13:29:03', NULL),
(81, 1, NULL, 19, 37, 55, 'update', NULL, NULL, 1, '2024-11-20 13:36:50', '2024-11-20 13:36:50', NULL),
(82, 193, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-20 13:37:21', '2024-11-20 13:37:21', NULL),
(83, 196, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 04:45:19', '2024-11-21 04:45:19', NULL),
(84, 1, NULL, 19, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 05:28:32', '2024-11-21 05:28:32', NULL),
(85, 1, NULL, 19, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 05:28:55', '2024-11-21 05:28:55', NULL),
(86, 1, NULL, 25, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 05:32:01', '2024-11-21 05:32:01', NULL),
(87, 1, NULL, 25, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 05:38:51', '2024-11-21 05:38:51', NULL),
(88, 1, NULL, 20, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 05:40:43', '2024-11-21 05:40:43', NULL),
(89, 1, NULL, 19, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 05:41:01', '2024-11-21 05:41:01', NULL),
(90, 193, NULL, 21, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 05:56:15', '2024-11-21 05:56:15', NULL),
(91, 196, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 05:56:48', '2024-11-21 05:56:48', NULL),
(92, 201, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 05:58:00', '2024-11-21 05:58:00', NULL),
(93, 209, NULL, 24, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 05:58:30', '2024-11-21 05:58:30', NULL),
(94, 1, NULL, 25, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 07:05:02', '2024-11-21 07:05:02', NULL),
(95, 1, NULL, 25, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 07:05:41', '2024-11-21 07:05:41', NULL),
(96, 193, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 07:10:21', '2024-11-21 07:10:21', NULL),
(97, 193, NULL, 21, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 07:22:13', '2024-11-21 07:22:13', NULL),
(98, 193, NULL, 21, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 07:22:32', '2024-11-21 07:22:32', NULL),
(99, 196, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 07:26:05', '2024-11-21 07:26:05', NULL),
(100, 201, NULL, 23, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 07:27:48', '2024-11-21 07:27:48', NULL),
(101, 196, NULL, 22, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 07:28:02', '2024-11-21 07:28:02', NULL),
(102, 1, NULL, 25, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:12:30', '2024-11-21 08:12:30', NULL),
(103, 1, NULL, 25, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:18:17', '2024-11-21 08:18:17', NULL),
(104, 1, NULL, 25, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:18:53', '2024-11-21 08:18:53', NULL),
(105, 1, NULL, 25, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:19:11', '2024-11-21 08:19:11', NULL),
(106, 1, NULL, 25, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:19:33', '2024-11-21 08:19:33', NULL),
(107, 1, NULL, 25, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:21:20', '2024-11-21 08:21:20', NULL),
(108, 1, NULL, 25, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:21:49', '2024-11-21 08:21:49', NULL),
(109, 1, NULL, 24, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:22:01', '2024-11-21 08:22:01', NULL),
(110, 1, NULL, 25, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:22:27', '2024-11-21 08:22:27', NULL),
(111, 1, NULL, 24, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:22:31', '2024-11-21 08:22:31', NULL),
(112, 193, NULL, 25, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:22:47', '2024-11-21 08:22:47', NULL),
(113, 193, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:23:16', '2024-11-21 08:23:16', NULL),
(114, 193, NULL, 24, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:26:21', '2024-11-21 08:26:21', NULL),
(115, 193, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:26:25', '2024-11-21 08:26:25', NULL),
(116, 193, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:26:42', '2024-11-21 08:26:42', NULL),
(117, 201, NULL, 24, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:26:52', '2024-11-21 08:26:52', NULL),
(118, 193, NULL, 24, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 08:30:55', '2024-11-21 08:30:55', NULL),
(119, 1, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 09:33:55', '2024-11-21 09:33:55', NULL),
(120, 193, NULL, 25, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 09:35:02', '2024-11-21 09:35:02', NULL),
(121, 193, NULL, 24, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 09:35:10', '2024-11-21 09:35:10', NULL),
(122, 196, NULL, 21, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 09:55:20', '2024-11-21 09:55:20', NULL),
(123, 193, NULL, 21, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 09:56:55', '2024-11-21 09:56:55', NULL),
(124, 196, NULL, 21, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 09:57:10', '2024-11-21 09:57:10', NULL),
(125, 193, NULL, 21, 37, 55, 'update', NULL, NULL, 1, '2024-11-21 09:57:39', '2024-11-21 09:57:39', NULL),
(126, 196, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 09:57:49', '2024-11-21 09:57:49', NULL),
(127, 1, NULL, 25, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 11:42:58', '2024-11-21 11:42:58', NULL),
(128, 1, NULL, 24, 37, 55, 'view', NULL, NULL, 1, '2024-11-21 12:12:17', '2024-11-21 12:12:17', NULL),
(129, 1, NULL, 15, 1, 57, 'view', NULL, NULL, 1, '2024-11-22 04:55:19', '2024-11-22 04:55:19', NULL),
(130, 1, NULL, 26, 1, 57, 'view', NULL, NULL, 1, '2024-11-22 04:55:50', '2024-11-22 04:55:50', NULL),
(131, 1, NULL, 26, 1, 57, 'delete', NULL, NULL, 1, '2024-11-22 05:04:31', '2024-11-22 05:04:31', NULL),
(132, 1, NULL, 25, 37, 55, 'delete', NULL, NULL, 1, '2024-11-22 05:19:11', '2024-11-22 05:19:11', NULL),
(133, 1, NULL, 24, 37, 55, 'delete', NULL, NULL, 1, '2024-11-22 05:19:26', '2024-11-22 05:19:26', NULL),
(134, 1, NULL, 24, 37, 55, 'download', NULL, NULL, 1, '2024-11-22 05:42:11', '2024-11-22 05:42:11', NULL),
(135, 193, NULL, 23, 37, 55, 'update', NULL, NULL, 1, '2024-11-22 10:28:20', '2024-11-22 10:28:20', NULL),
(136, 1, NULL, 20, 37, 55, 'update', NULL, NULL, 1, '2024-11-22 10:42:37', '2024-11-22 10:42:37', NULL),
(137, 193, NULL, 20, 37, 55, 'update', NULL, NULL, 1, '2024-11-22 10:44:43', '2024-11-22 10:44:43', NULL),
(138, 193, NULL, 20, 37, 55, 'update', NULL, NULL, 1, '2024-11-22 10:44:46', '2024-11-22 10:44:46', NULL),
(139, 196, NULL, 20, 37, 55, 'view', NULL, NULL, 1, '2024-11-22 10:45:08', '2024-11-22 10:45:08', NULL),
(140, 193, NULL, 18, 1, 57, 'update', NULL, NULL, 1, '2024-11-22 10:54:04', '2024-11-22 10:54:04', NULL),
(141, 197, NULL, 18, 1, 57, 'view', NULL, NULL, 1, '2024-11-22 10:54:49', '2024-11-22 10:54:49', NULL),
(142, 193, NULL, 17, 1, 57, 'update', NULL, NULL, 1, '2024-11-22 11:06:24', '2024-11-22 11:06:24', NULL),
(143, 197, NULL, 18, 1, 57, 'view', NULL, NULL, 1, '2024-11-22 11:11:35', '2024-11-22 11:11:35', NULL),
(144, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-22 13:35:27', '2024-11-22 13:35:27', NULL),
(145, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-22 13:35:31', '2024-11-22 13:35:31', NULL),
(146, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-22 13:35:32', '2024-11-22 13:35:32', NULL),
(147, 193, NULL, 23, 37, 55, 'update', NULL, NULL, 1, '2024-11-23 12:03:26', '2024-11-23 12:03:26', NULL),
(148, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 04:58:22', '2024-11-25 04:58:22', NULL),
(149, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 05:24:16', '2024-11-25 05:24:16', NULL),
(150, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 05:24:18', '2024-11-25 05:24:18', NULL),
(151, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 05:35:49', '2024-11-25 05:35:49', NULL),
(152, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 05:35:50', '2024-11-25 05:35:50', NULL),
(153, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 05:36:10', '2024-11-25 05:36:10', NULL),
(154, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 05:36:11', '2024-11-25 05:36:11', NULL),
(155, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 05:42:24', '2024-11-25 05:42:24', NULL),
(156, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 06:00:00', '2024-11-25 06:00:00', NULL),
(157, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 06:18:03', '2024-11-25 06:18:03', NULL),
(158, 1, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 06:26:28', '2024-11-25 06:26:28', NULL),
(159, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 06:37:52', '2024-11-25 06:37:52', NULL),
(160, 1, NULL, 23, 37, 55, 'download', NULL, NULL, 1, '2024-11-25 06:38:14', '2024-11-25 06:38:14', NULL),
(161, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-25 07:19:06', '2024-11-25 07:19:06', NULL),
(162, 1, NULL, 28, 14, 2, 'view', NULL, NULL, 1, '2024-11-25 08:04:55', '2024-11-25 08:04:55', NULL),
(163, 1, NULL, 24, 37, 55, 'view', NULL, NULL, 1, '2024-11-26 10:24:19', '2024-11-26 10:24:19', NULL),
(164, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-26 10:24:35', '2024-11-26 10:24:35', NULL),
(165, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-26 10:24:49', '2024-11-26 10:24:49', NULL),
(166, 1, NULL, 24, 37, 55, 'view', NULL, NULL, 1, '2024-11-26 10:39:16', '2024-11-26 10:39:16', NULL),
(167, 1, NULL, 24, 37, 55, 'restore', NULL, NULL, 1, '2024-11-26 10:39:25', '2024-11-26 10:39:25', NULL),
(168, 1, NULL, 24, 37, 55, 'view', NULL, NULL, 1, '2024-11-27 06:27:02', '2024-11-27 06:27:02', NULL),
(169, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-11-27 06:27:06', '2024-11-27 06:27:06', NULL),
(170, 1, NULL, 21, 37, 55, 'view', NULL, NULL, 1, '2024-11-27 06:27:10', '2024-11-27 06:27:10', NULL),
(171, 1, NULL, 29, 37, 55, 'view', NULL, NULL, 1, '2024-11-27 06:27:30', '2024-11-27 06:27:30', NULL),
(172, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-27 06:29:32', '2024-11-27 06:29:32', NULL),
(173, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-27 06:30:06', '2024-11-27 06:30:06', NULL),
(174, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-27 06:32:00', '2024-11-27 06:32:00', NULL),
(175, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-27 06:33:36', '2024-11-27 06:33:36', NULL),
(176, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-27 06:36:02', '2024-11-27 06:36:02', NULL),
(177, 1, NULL, 30, 37, 55, 'update', NULL, NULL, 1, '2024-11-28 06:21:33', '2024-11-28 06:21:33', NULL),
(178, 193, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 06:21:39', '2024-11-28 06:21:39', NULL),
(179, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 06:26:16', '2024-11-28 06:26:16', NULL),
(180, 1, NULL, 31, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:15:33', '2024-11-28 07:15:33', NULL),
(181, 1, NULL, 31, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:18:18', '2024-11-28 07:18:18', NULL),
(182, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:18:35', '2024-11-28 07:18:35', NULL),
(183, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:21:11', '2024-11-28 07:21:11', NULL),
(184, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:21:44', '2024-11-28 07:21:44', NULL),
(185, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:23:07', '2024-11-28 07:23:07', NULL),
(186, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:25:06', '2024-11-28 07:25:06', NULL),
(187, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:26:28', '2024-11-28 07:26:28', NULL),
(188, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:26:29', '2024-11-28 07:26:29', NULL),
(189, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:26:36', '2024-11-28 07:26:36', NULL),
(190, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:29:16', '2024-11-28 07:29:16', NULL),
(191, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:29:18', '2024-11-28 07:29:18', NULL),
(192, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:30:20', '2024-11-28 07:30:20', NULL),
(193, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:30:40', '2024-11-28 07:30:40', NULL),
(194, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:30:57', '2024-11-28 07:30:57', NULL),
(195, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:31:02', '2024-11-28 07:31:02', NULL),
(196, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:33:59', '2024-11-28 07:33:59', NULL),
(197, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:34:28', '2024-11-28 07:34:28', NULL),
(198, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:34:52', '2024-11-28 07:34:52', NULL),
(199, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:35:55', '2024-11-28 07:35:55', NULL),
(200, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:36:45', '2024-11-28 07:36:45', NULL),
(201, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:36:52', '2024-11-28 07:36:52', NULL),
(202, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:37:15', '2024-11-28 07:37:15', NULL),
(203, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:37:59', '2024-11-28 07:37:59', NULL),
(204, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:42:14', '2024-11-28 07:42:14', NULL),
(205, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:43:05', '2024-11-28 07:43:05', NULL),
(206, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:54:44', '2024-11-28 07:54:44', NULL),
(207, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:54:48', '2024-11-28 07:54:48', NULL),
(208, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:55:40', '2024-11-28 07:55:40', NULL),
(209, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:56:08', '2024-11-28 07:56:08', NULL),
(210, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:56:25', '2024-11-28 07:56:25', NULL),
(211, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:56:37', '2024-11-28 07:56:37', NULL),
(212, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:56:49', '2024-11-28 07:56:49', NULL),
(213, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:57:20', '2024-11-28 07:57:20', NULL),
(214, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:57:36', '2024-11-28 07:57:36', NULL),
(215, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:57:44', '2024-11-28 07:57:44', NULL),
(216, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:59:12', '2024-11-28 07:59:12', NULL),
(217, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:59:19', '2024-11-28 07:59:19', NULL),
(218, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 07:59:32', '2024-11-28 07:59:32', NULL),
(219, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:00:03', '2024-11-28 08:00:03', NULL),
(220, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:00:16', '2024-11-28 08:00:16', NULL),
(221, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:00:20', '2024-11-28 08:00:20', NULL),
(222, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:01:39', '2024-11-28 08:01:39', NULL),
(223, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:02:27', '2024-11-28 08:02:27', NULL),
(224, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:03:06', '2024-11-28 08:03:06', NULL),
(225, 1, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:04:19', '2024-11-28 08:04:19', NULL),
(226, 1, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:06:18', '2024-11-28 08:06:18', NULL),
(227, 1, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:06:52', '2024-11-28 08:06:52', NULL),
(228, 1, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:06:59', '2024-11-28 08:06:59', NULL),
(229, 1, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:07:09', '2024-11-28 08:07:09', NULL),
(230, 1, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:07:39', '2024-11-28 08:07:39', NULL),
(231, 1, NULL, 19, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:07:48', '2024-11-28 08:07:48', NULL),
(232, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:07:56', '2024-11-28 08:07:56', NULL),
(233, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:08:20', '2024-11-28 08:08:20', NULL),
(234, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:14:41', '2024-11-28 08:14:41', NULL),
(235, 193, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:15:21', '2024-11-28 08:15:21', NULL),
(236, 193, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:16:15', '2024-11-28 08:16:15', NULL),
(237, 193, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:17:03', '2024-11-28 08:17:03', NULL),
(238, 193, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:17:34', '2024-11-28 08:17:34', NULL),
(239, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:17:49', '2024-11-28 08:17:49', NULL),
(240, 193, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:18:09', '2024-11-28 08:18:09', NULL),
(241, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:19:00', '2024-11-28 08:19:00', NULL),
(242, 1, NULL, 32, 37, 55, 'update', NULL, NULL, 1, '2024-11-28 08:19:36', '2024-11-28 08:19:36', NULL),
(243, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:19:56', '2024-11-28 08:19:56', NULL),
(244, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:19:59', '2024-11-28 08:19:59', NULL),
(245, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:20:24', '2024-11-28 08:20:24', NULL),
(246, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:20:52', '2024-11-28 08:20:52', NULL),
(247, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:21:22', '2024-11-28 08:21:22', NULL),
(248, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:22:05', '2024-11-28 08:22:05', NULL),
(249, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:22:19', '2024-11-28 08:22:19', NULL),
(250, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:23:12', '2024-11-28 08:23:12', NULL),
(251, 1, NULL, 15, 1, 57, 'view', NULL, NULL, 1, '2024-11-28 08:24:04', '2024-11-28 08:24:04', NULL),
(252, 1, NULL, 15, 1, 57, 'view', NULL, NULL, 1, '2024-11-28 08:24:10', '2024-11-28 08:24:10', NULL),
(253, 1, NULL, 15, 1, 57, 'view', NULL, NULL, 1, '2024-11-28 08:24:15', '2024-11-28 08:24:15', NULL),
(254, 1, NULL, 15, 1, 57, 'view', NULL, NULL, 1, '2024-11-28 08:24:20', '2024-11-28 08:24:20', NULL),
(255, 1, NULL, 15, 1, 57, 'view', NULL, NULL, 1, '2024-11-28 08:24:24', '2024-11-28 08:24:24', NULL),
(256, 1, NULL, 15, 1, 57, 'view', NULL, NULL, 1, '2024-11-28 08:24:26', '2024-11-28 08:24:26', NULL),
(257, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:24:44', '2024-11-28 08:24:44', NULL),
(258, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:25:01', '2024-11-28 08:25:01', NULL),
(259, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:25:12', '2024-11-28 08:25:12', NULL),
(260, 1, NULL, 32, 37, 55, 'update', NULL, NULL, 1, '2024-11-28 08:28:35', '2024-11-28 08:28:35', NULL),
(261, 1, NULL, 32, 37, 55, 'update', NULL, NULL, 1, '2024-11-28 08:28:39', '2024-11-28 08:28:39', NULL),
(262, 1, NULL, 32, 37, 55, 'update', NULL, NULL, 1, '2024-11-28 08:28:42', '2024-11-28 08:28:42', NULL),
(263, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:30:32', '2024-11-28 08:30:32', NULL),
(264, 1, NULL, 32, 37, 55, 'update', NULL, NULL, 1, '2024-11-28 08:30:59', '2024-11-28 08:30:59', NULL),
(265, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:31:03', '2024-11-28 08:31:03', NULL),
(266, 1, NULL, 32, 37, 55, 'update', NULL, NULL, 1, '2024-11-28 08:31:07', '2024-11-28 08:31:07', NULL),
(267, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:31:08', '2024-11-28 08:31:08', NULL),
(268, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:32:38', '2024-11-28 08:32:38', NULL),
(269, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:33:17', '2024-11-28 08:33:17', NULL),
(270, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:33:19', '2024-11-28 08:33:19', NULL),
(271, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 08:33:22', '2024-11-28 08:33:22', NULL),
(272, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:33:46', '2024-11-28 09:33:46', NULL),
(273, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:35:24', '2024-11-28 09:35:24', NULL),
(274, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:37:19', '2024-11-28 09:37:19', NULL),
(275, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:37:29', '2024-11-28 09:37:29', NULL),
(276, 1, NULL, 32, 37, 55, 'update', NULL, NULL, 1, '2024-11-28 09:37:37', '2024-11-28 09:37:37', NULL),
(277, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:37:40', '2024-11-28 09:37:40', NULL),
(278, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:37:46', '2024-11-28 09:37:46', NULL),
(279, 193, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:38:08', '2024-11-28 09:38:08', NULL),
(280, 1, NULL, 13, 1, 57, 'view', NULL, NULL, 1, '2024-11-28 09:43:51', '2024-11-28 09:43:51', NULL),
(281, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:44:04', '2024-11-28 09:44:04', NULL),
(282, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:44:27', '2024-11-28 09:44:27', NULL),
(283, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:44:38', '2024-11-28 09:44:38', NULL),
(284, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:45:14', '2024-11-28 09:45:14', NULL),
(285, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:47:24', '2024-11-28 09:47:24', NULL),
(286, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:49:35', '2024-11-28 09:49:35', NULL),
(287, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:52:11', '2024-11-28 09:52:11', NULL),
(288, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 09:53:06', '2024-11-28 09:53:06', NULL),
(289, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 10:49:23', '2024-11-28 10:49:23', NULL),
(290, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 10:50:51', '2024-11-28 10:50:51', NULL),
(291, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 10:50:55', '2024-11-28 10:50:55', NULL),
(292, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 10:51:08', '2024-11-28 10:51:08', NULL),
(293, 1, NULL, 30, 37, 55, 'view', NULL, NULL, 1, '2024-11-28 10:51:13', '2024-11-28 10:51:13', NULL),
(294, 1, NULL, 29, 37, 55, 'delete', NULL, NULL, 1, '2024-11-29 05:16:17', '2024-11-29 05:16:17', NULL),
(295, 1, NULL, 24, 37, 55, 'delete', NULL, NULL, 1, '2024-11-29 05:16:20', '2024-11-29 05:16:20', NULL),
(296, 1, NULL, 21, 37, 55, 'delete', NULL, NULL, 1, '2024-11-29 05:16:24', '2024-11-29 05:16:24', NULL),
(297, 1, NULL, 29, 37, 55, 'view', NULL, NULL, 1, '2024-12-02 06:22:59', '2024-12-02 06:22:59', NULL),
(298, 1, NULL, 12, 1, 57, 'view', NULL, NULL, 1, '2024-12-02 06:33:54', '2024-12-02 06:33:54', NULL),
(299, 1, NULL, 29, 37, 55, 'view', NULL, NULL, 1, '2024-12-02 07:23:47', '2024-12-02 07:23:47', NULL),
(300, 1, NULL, 12, 1, 57, 'restore', NULL, NULL, 1, '2024-12-02 11:58:16', '2024-12-02 11:58:16', NULL),
(301, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-12-09 12:18:37', '2024-12-09 12:18:37', NULL),
(302, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-12-09 12:22:21', '2024-12-09 12:22:21', NULL),
(303, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-12-09 12:38:42', '2024-12-09 12:38:42', NULL),
(304, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-12-09 12:39:34', '2024-12-09 12:39:34', NULL),
(305, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-12-09 12:42:09', '2024-12-09 12:42:09', NULL),
(306, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-12-09 12:43:24', '2024-12-09 12:43:24', NULL),
(307, 213, NULL, 18, 1, 57, 'view', NULL, NULL, 1, '2024-12-09 13:34:54', '2024-12-09 13:34:54', NULL),
(308, 213, NULL, 18, 1, 57, 'view', NULL, NULL, 1, '2024-12-09 13:35:04', '2024-12-09 13:35:04', NULL),
(309, 1, NULL, 32, 37, 55, 'view', NULL, NULL, 1, '2024-12-10 04:44:31', '2024-12-10 04:44:31', NULL),
(310, 1, NULL, 28, 14, 2, 'view', NULL, NULL, 1, '2024-12-10 04:44:38', '2024-12-10 04:44:38', NULL),
(311, 1, NULL, 24, 37, 55, 'view', NULL, NULL, 1, '2024-12-10 04:47:58', '2024-12-10 04:47:58', NULL),
(312, 1, NULL, 29, 37, 55, 'view', NULL, NULL, 1, '2024-12-10 04:48:03', '2024-12-10 04:48:03', NULL),
(313, 1, NULL, 36, 2, 87, 'view', NULL, NULL, 1, '2024-12-12 05:26:24', '2024-12-12 05:26:24', NULL),
(314, 1, NULL, 14, 1, 57, 'restore', NULL, NULL, 1, '2024-12-12 05:44:45', '2024-12-12 05:44:45', NULL),
(315, 1, NULL, 31, 37, 55, 'delete', NULL, NULL, 1, '2024-12-12 08:35:13', '2024-12-12 08:35:13', NULL),
(316, 1, NULL, 34, 2, 87, 'delete', NULL, NULL, 1, '2024-12-12 08:35:18', '2024-12-12 08:35:18', NULL),
(317, 1, NULL, 33, 2, 87, 'delete', NULL, NULL, 1, '2024-12-12 09:33:24', '2024-12-12 09:33:24', NULL),
(318, 1, NULL, 32, 37, 55, 'delete', NULL, NULL, 1, '2024-12-12 09:33:27', '2024-12-12 09:33:27', NULL),
(319, 1, NULL, 30, 37, 55, 'delete', NULL, NULL, 1, '2024-12-12 09:42:45', '2024-12-12 09:42:45', NULL),
(320, 1, NULL, 28, 14, 2, 'delete', NULL, NULL, 1, '2024-12-12 09:42:49', '2024-12-12 09:42:49', NULL),
(321, 1, NULL, 36, 2, 87, 'view', NULL, NULL, 1, '2024-12-12 10:09:16', '2024-12-12 10:09:16', NULL),
(322, 1, NULL, 35, 2, 87, 'view', NULL, NULL, 1, '2024-12-12 10:09:21', '2024-12-12 10:09:21', NULL),
(323, 1, NULL, 27, 14, 1, 'view', NULL, NULL, 1, '2024-12-12 10:09:24', '2024-12-12 10:09:24', NULL),
(324, 1, NULL, 23, 37, 55, 'view', NULL, NULL, 1, '2024-12-12 10:09:28', '2024-12-12 10:09:28', NULL),
(325, 1, NULL, 23, 37, 55, 'delete', NULL, NULL, 1, '2024-12-12 10:09:38', '2024-12-12 10:09:38', NULL),
(326, 1, NULL, 37, 37, 55, 'delete', NULL, NULL, 1, '2024-12-12 10:34:00', '2024-12-12 10:34:00', NULL),
(327, 1, NULL, 37, 37, 55, 'restore', NULL, NULL, 1, '2024-12-13 05:45:24', '2024-12-13 05:45:24', NULL),
(328, 1, NULL, 28, 14, 2, 'restore', NULL, NULL, 1, '2024-12-13 05:47:06', '2024-12-13 05:47:06', NULL),
(329, 1, NULL, 31, 37, 55, 'restore', NULL, NULL, 1, '2024-12-13 05:48:07', '2024-12-13 05:48:07', NULL),
(330, 1, NULL, 21, 37, 55, 'restore', NULL, NULL, 1, '2024-12-13 05:49:10', '2024-12-13 05:49:10', NULL),
(331, 1, NULL, 23, 37, 55, 'restore', NULL, NULL, 1, '2024-12-13 05:49:27', '2024-12-13 05:49:27', NULL),
(332, 1, NULL, 27, 14, 1, 'delete', NULL, NULL, 1, '2024-12-13 05:54:18', '2024-12-13 05:54:18', NULL),
(333, 1, NULL, 37, 37, 55, 'delete', NULL, NULL, 1, '2024-12-13 05:54:25', '2024-12-13 05:54:25', NULL),
(334, 1, NULL, 19, 37, 55, 'delete', NULL, NULL, 1, '2024-12-13 05:54:31', '2024-12-13 05:54:31', NULL),
(335, 1, NULL, 23, 37, 55, 'delete', NULL, NULL, 1, '2024-12-13 05:54:37', '2024-12-13 05:54:37', NULL),
(336, 1, NULL, 27, 14, 1, 'restore', NULL, NULL, 1, '2024-12-13 05:54:56', '2024-12-13 05:54:56', NULL),
(337, 1, NULL, 37, 37, 55, 'restore', NULL, NULL, 1, '2024-12-13 05:55:05', '2024-12-13 05:55:05', NULL),
(338, 1, NULL, 23, 37, 55, 'restore', NULL, NULL, 1, '2024-12-13 05:55:12', '2024-12-13 05:55:12', NULL),
(339, 1, NULL, 23, 37, 55, 'delete', NULL, NULL, 1, '2024-12-13 05:55:29', '2024-12-13 05:55:29', NULL),
(340, 1, NULL, 28, 14, 2, 'delete', NULL, NULL, 1, '2024-12-13 05:55:34', '2024-12-13 05:55:34', NULL),
(341, 1, NULL, 21, 37, 55, 'delete', NULL, NULL, 1, '2024-12-13 05:55:39', '2024-12-13 05:55:39', NULL),
(342, 1, NULL, 36, 2, 87, 'view', NULL, NULL, 1, '2024-12-14 06:23:48', '2024-12-14 06:23:48', NULL),
(343, 198, NULL, 18, 1, 57, 'view', NULL, NULL, 1, '2024-12-14 06:44:14', '2024-12-14 06:44:14', NULL),
(344, 198, NULL, 18, 1, 57, 'view', NULL, NULL, 1, '2024-12-14 07:25:43', '2024-12-14 07:25:43', NULL),
(345, 198, NULL, 17, 1, 57, 'view', NULL, NULL, 1, '2024-12-14 07:27:27', '2024-12-14 07:27:27', NULL),
(346, 198, NULL, 18, 1, 57, 'view', NULL, NULL, 1, '2024-12-14 07:27:33', '2024-12-14 07:27:33', NULL),
(347, 1, NULL, 18, 1, 57, 'update', NULL, NULL, 1, '2024-12-14 07:28:00', '2024-12-14 07:28:00', NULL),
(348, 198, NULL, 18, 1, 57, 'view', NULL, NULL, 1, '2024-12-14 07:28:06', '2024-12-14 07:28:06', NULL),
(349, 198, NULL, 18, 1, 57, 'view', NULL, NULL, 1, '2024-12-14 07:29:28', '2024-12-14 07:29:28', NULL),
(350, 1, NULL, 14, 1, 57, 'view', NULL, NULL, 1, '2024-12-14 07:30:43', '2024-12-14 07:30:43', NULL),
(351, 1, NULL, 36, 2, 87, 'view', NULL, NULL, 1, '2024-12-14 07:32:34', '2024-12-14 07:32:34', NULL),
(352, 198, NULL, 18, 1, 57, 'view', NULL, NULL, 1, '2024-12-14 07:38:44', '2024-12-14 07:38:44', NULL),
(353, 198, NULL, 18, 1, 57, 'view', NULL, NULL, 1, '2024-12-14 07:38:58', '2024-12-14 07:38:58', NULL),
(354, 1, NULL, 36, 3, NULL, 'update', NULL, NULL, 1, '2024-12-14 08:24:47', '2024-12-14 08:24:47', NULL),
(355, 1, NULL, 38, 2, 87, 'view', NULL, NULL, 1, '2024-12-14 09:48:41', '2024-12-14 09:48:41', NULL),
(356, 1, NULL, 38, 2, 87, 'view', NULL, NULL, 1, '2024-12-14 09:48:57', '2024-12-14 09:48:57', NULL),
(357, 1, NULL, 38, 2, 87, 'view', NULL, NULL, 1, '2024-12-14 10:40:07', '2024-12-14 10:40:07', NULL),
(358, 1, NULL, 37, 37, 55, 'view', NULL, NULL, 1, '2024-12-14 10:40:12', '2024-12-14 10:40:12', NULL),
(359, 1, NULL, 38, 2, 87, 'view', NULL, NULL, 1, '2024-12-14 10:40:43', '2024-12-14 10:40:43', NULL),
(360, 1, NULL, 39, 2, 92, 'view', NULL, NULL, 1, '2024-12-14 10:40:58', '2024-12-14 10:40:58', NULL),
(361, 1, NULL, 39, 2, 92, 'view', NULL, NULL, 1, '2024-12-17 10:07:45', '2024-12-17 10:07:45', NULL),
(362, 1, NULL, 39, 2, 92, 'view', NULL, NULL, 1, '2024-12-17 10:36:12', '2024-12-17 10:36:12', NULL),
(363, 1, NULL, 39, 2, 92, 'update', NULL, NULL, 1, '2024-12-17 10:48:53', '2024-12-17 10:48:53', NULL),
(364, 193, NULL, 39, 2, 92, 'view', NULL, NULL, 1, '2024-12-17 10:50:09', '2024-12-17 10:50:09', NULL),
(365, 1, NULL, 39, 2, 92, 'view', NULL, NULL, 1, '2024-12-17 10:53:21', '2024-12-17 10:53:21', NULL),
(366, 1, NULL, 38, 2, 87, 'view', NULL, NULL, 1, '2024-12-17 11:04:53', '2024-12-17 11:04:53', NULL),
(367, 1, NULL, 39, 2, 92, 'view', NULL, NULL, 1, '2024-12-17 11:05:49', '2024-12-17 11:05:49', NULL),
(368, 193, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 04:59:45', '2024-12-18 04:59:45', NULL),
(369, 193, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 04:59:47', '2024-12-18 04:59:47', NULL),
(370, 193, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:37:25', '2024-12-18 05:37:25', NULL),
(371, 196, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:38:17', '2024-12-18 05:38:17', NULL),
(372, 1, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:38:48', '2024-12-18 05:38:48', NULL),
(373, 193, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:38:57', '2024-12-18 05:38:57', NULL),
(374, 193, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:39:36', '2024-12-18 05:39:36', NULL),
(375, 193, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:39:40', '2024-12-18 05:39:40', NULL),
(376, 193, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:44:03', '2024-12-18 05:44:03', NULL),
(377, 193, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:44:09', '2024-12-18 05:44:09', NULL),
(378, 1, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:48:25', '2024-12-18 05:48:25', NULL),
(379, 196, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:48:35', '2024-12-18 05:48:35', NULL),
(380, 193, NULL, 22, 37, 55, 'update', NULL, NULL, 1, '2024-12-18 05:54:37', '2024-12-18 05:54:37', NULL),
(381, 199, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:54:43', '2024-12-18 05:54:43', NULL),
(382, 199, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:54:48', '2024-12-18 05:54:48', NULL),
(383, 1, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 05:56:57', '2024-12-18 05:56:57', NULL),
(384, 1, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 06:09:26', '2024-12-18 06:09:26', NULL),
(385, 1, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 06:09:38', '2024-12-18 06:09:38', NULL),
(386, 1, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 06:09:39', '2024-12-18 06:09:39', NULL),
(387, 1, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 06:12:40', '2024-12-18 06:12:40', NULL),
(388, 1, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 06:12:52', '2024-12-18 06:12:52', NULL),
(389, 196, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 06:19:00', '2024-12-18 06:19:00', NULL),
(390, 196, NULL, 22, 37, 55, 'delete', NULL, NULL, 1, '2024-12-18 06:55:06', '2024-12-18 06:55:06', NULL),
(391, 196, NULL, 22, 37, 55, 'delete', NULL, NULL, 1, '2024-12-18 06:58:18', '2024-12-18 06:58:18', NULL),
(392, 196, NULL, 22, 37, 55, 'delete', NULL, NULL, 1, '2024-12-18 06:58:40', '2024-12-18 06:58:40', NULL),
(393, 1, NULL, 22, 37, 55, 'restore', NULL, NULL, 1, '2024-12-18 06:58:52', '2024-12-18 06:58:52', NULL),
(394, 1, NULL, 39, 2, 92, 'view', NULL, NULL, 1, '2024-12-18 06:59:20', '2024-12-18 06:59:20', NULL),
(395, 1, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-18 06:59:35', '2024-12-18 06:59:35', NULL),
(396, 1, NULL, 39, 2, 92, 'update', NULL, NULL, 1, '2024-12-19 06:36:52', '2024-12-19 06:36:52', NULL),
(397, 1, NULL, 39, 2, 92, 'update', NULL, NULL, 1, '2024-12-19 06:39:49', '2024-12-19 06:39:49', NULL),
(398, 1, NULL, 39, 2, 92, 'update', NULL, NULL, 1, '2024-12-19 07:00:12', '2024-12-19 07:00:12', NULL),
(399, 1, NULL, 39, 2, 92, 'update', NULL, NULL, 1, '2024-12-19 07:00:17', '2024-12-19 07:00:17', NULL),
(400, 1, NULL, 39, 2, 92, 'update', NULL, NULL, 1, '2024-12-19 07:01:18', '2024-12-19 07:01:18', NULL),
(401, 1, NULL, 39, 2, 92, 'update', NULL, NULL, 1, '2024-12-19 07:01:28', '2024-12-19 07:01:28', NULL),
(402, 1, NULL, 39, 2, 92, 'update', NULL, NULL, 1, '2024-12-19 07:01:51', '2024-12-19 07:01:51', NULL),
(403, 1, NULL, 39, 2, 92, 'update', NULL, NULL, 1, '2024-12-19 07:17:33', '2024-12-19 07:17:33', NULL),
(404, 1, NULL, 39, 2, 92, 'update', NULL, NULL, 1, '2024-12-19 07:17:48', '2024-12-19 07:17:48', NULL),
(405, 1, NULL, 39, 2, 92, 'update', NULL, NULL, 1, '2024-12-19 07:17:48', '2024-12-19 07:17:48', NULL),
(406, 1, NULL, 39, 2, 92, 'update', NULL, NULL, 1, '2024-12-19 07:42:36', '2024-12-19 07:42:36', NULL),
(407, 1, NULL, 39, 2, 92, NULL, '{\"assigned_users\":{\"old\":[193,195],\"new\":\"[193,195]\"}}', NULL, 1, '2024-12-19 07:54:54', '2024-12-19 07:54:54', NULL),
(408, 1, NULL, 39, 2, 92, NULL, '{\"document_title\":{\"old\":\"No Title\",\"new\":\"No Titledfdf\"},\"assigned_users\":{\"old\":[193,195],\"new\":\"[193,195]\"}}', NULL, 1, '2024-12-19 07:55:35', '2024-12-19 07:55:35', NULL),
(409, 1, NULL, 39, 2, 92, NULL, '{\"assigned_users\":{\"old\":[193,195],\"new\":\"[193,195]\"}}', NULL, 1, '2024-12-19 07:56:29', '2024-12-19 07:56:29', NULL),
(410, 1, NULL, 39, 2, 92, NULL, '[]', NULL, 1, '2024-12-19 07:57:49', '2024-12-19 07:57:49', NULL),
(411, 1, NULL, 37, 37, 55, NULL, '{\"assigned_users\":{\"old\":null,\"new\":[193,197]}}', NULL, 1, '2024-12-19 07:58:04', '2024-12-19 07:58:04', NULL),
(412, 1, NULL, 39, 2, 92, NULL, '[]', NULL, 1, '2024-12-19 07:58:10', '2024-12-19 07:58:10', NULL),
(413, 1, NULL, 37, 12, 3, NULL, '{\"main_folder_id\":{\"old\":37,\"new\":12},\"sub_folder_id\":{\"old\":55,\"new\":\"3\"},\"department_type_id\":{\"old\":37,\"new\":\"12\"}}', NULL, 1, '2024-12-19 07:59:28', '2024-12-19 07:59:28', NULL),
(414, 1, NULL, 31, 12, 5, NULL, '{\"document_title\":{\"old\":null,\"new\":\"sdf\"},\"main_folder_id\":{\"old\":37,\"new\":12},\"sub_folder_id\":{\"old\":55,\"new\":\"5\"},\"department_type_id\":{\"old\":37,\"new\":\"12\"},\"assigned_users\":{\"old\":null,\"new\":[193,195]}}', NULL, 1, '2024-12-19 08:23:10', '2024-12-19 08:23:10', NULL),
(415, 1, NULL, 31, 13, 8, NULL, '{\"document_title\":{\"old\":\"sdf\",\"new\":\"sdfdd\"},\"main_folder_id\":{\"old\":12,\"new\":13},\"sub_folder_id\":{\"old\":5,\"new\":\"8\"},\"department_type_id\":{\"old\":12,\"new\":\"13\"},\"assigned_users\":{\"old\":[193,195],\"new\":[194,195,201]}}', NULL, 1, '2024-12-19 10:24:39', '2024-12-19 10:24:39', NULL),
(416, 1, NULL, 39, 2, 87, NULL, '{\"document_title\":{\"old\":\"No Titledfdf\",\"new\":\"No Titledfdf dgdfg\"},\"sub_folder_id\":{\"old\":92,\"new\":\"87\"},\"assigned_users\":{\"old\":[193,195],\"new\":[193,195,197]}}', NULL, 1, '2024-12-19 11:48:58', '2024-12-19 11:48:58', NULL),
(417, 1, NULL, 39, 1, 57, 'update', '{\"main_folder_id\":{\"old\":2,\"new\":1},\"sub_folder_id\":{\"old\":87,\"new\":\"57\"},\"department_type_id\":{\"old\":2,\"new\":\"1\"},\"assigned_users\":{\"old\":[193,195,197],\"new\":[193,195]}}', NULL, 1, '2024-12-19 11:50:23', '2024-12-19 11:50:23', NULL),
(418, 1, NULL, 39, 1, 57, 'view', NULL, NULL, 1, '2024-12-19 11:50:57', '2024-12-19 11:50:57', NULL),
(419, 1, NULL, 37, 12, 3, 'update', '[]', NULL, 1, '2024-12-19 11:51:42', '2024-12-19 11:51:42', NULL),
(420, 1, NULL, 39, 1, 57, 'update', '{\"document_title\":{\"old\":\"No Titledfdf dgdfg\",\"new\":\"No Titledfdf dgdfgdff\"}}', NULL, 1, '2024-12-19 12:09:04', '2024-12-19 12:09:04', NULL),
(421, 1, NULL, 39, 1, 57, 'update', '{\"document_title\":{\"old\":\"No Titledfdf dgdfgdff\",\"new\":\"No Titledfdf dgdfgdffssd\"}}', NULL, 1, '2024-12-19 12:09:50', '2024-12-19 12:09:50', NULL),
(422, 1, NULL, 37, 12, 3, 'update', '{\"document_title\":{\"old\":\"No Title\",\"new\":\"No Title gdf\"}}', NULL, 1, '2024-12-19 12:10:12', '2024-12-19 12:10:12', NULL),
(423, 1, NULL, 37, 12, 4, 'update', '{\"sub_folder_id\":{\"old\":3,\"new\":\"4\"}}', NULL, 1, '2024-12-20 06:04:27', '2024-12-20 06:04:27', NULL),
(424, 1, NULL, 37, 11, NULL, 'update', '{\"main_folder_id\":{\"old\":12,\"new\":11},\"sub_folder_id\":{\"old\":4,\"new\":null},\"department_type_id\":{\"old\":12,\"new\":\"11\"}}', NULL, 1, '2024-12-20 06:04:33', '2024-12-20 06:04:33', NULL),
(425, 1, NULL, 37, 2, 87, 'update', '{\"main_folder_id\":{\"old\":11,\"new\":2},\"sub_folder_id\":{\"old\":null,\"new\":\"87\"},\"department_type_id\":{\"old\":11,\"new\":\"2\"}}', NULL, 1, '2024-12-20 06:04:49', '2024-12-20 06:04:49', NULL),
(426, 1, NULL, 37, 2, 87, 'view', NULL, NULL, 1, '2024-12-20 08:01:12', '2024-12-20 08:01:12', NULL),
(427, 1, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-20 08:01:19', '2024-12-20 08:01:19', NULL),
(428, 1, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-20 08:01:24', '2024-12-20 08:01:24', NULL),
(429, 1, NULL, 39, 2, NULL, 'update', '{\"main_folder_id\":{\"old\":1,\"new\":2},\"sub_folder_id\":{\"old\":57,\"new\":null},\"department_type_id\":{\"old\":1,\"new\":\"2\"}}', NULL, 1, '2024-12-21 07:16:39', '2024-12-21 07:16:39', NULL),
(430, 1, NULL, 39, 4, NULL, 'update', '{\"main_folder_id\":{\"old\":2,\"new\":4},\"department_type_id\":{\"old\":2,\"new\":\"4\"}}', NULL, 1, '2024-12-21 07:17:02', '2024-12-21 07:17:02', NULL),
(431, 1, NULL, 39, 2, 87, 'update', '{\"main_folder_id\":{\"old\":4,\"new\":2},\"sub_folder_id\":{\"old\":null,\"new\":\"87\"},\"department_type_id\":{\"old\":4,\"new\":\"2\"}}', NULL, 1, '2024-12-21 07:17:28', '2024-12-21 07:17:28', NULL),
(432, 1, NULL, 45, 1, 57, 'view', NULL, NULL, 1, '2024-12-24 08:34:35', '2024-12-24 08:34:35', NULL),
(433, 1, NULL, 44, 1, 57, 'view', NULL, NULL, 1, '2024-12-24 08:34:39', '2024-12-24 08:34:39', NULL),
(434, 1, NULL, 52, 12, 3, 'view', NULL, NULL, 1, '2024-12-24 11:13:25', '2024-12-24 11:13:25', NULL),
(435, 1, NULL, 47, 1, 57, 'view', NULL, NULL, 1, '2024-12-26 07:53:05', '2024-12-26 07:53:05', NULL),
(436, 1, NULL, 47, 1, 57, 'view', NULL, NULL, 1, '2024-12-26 09:41:22', '2024-12-26 09:41:22', NULL),
(437, 1, NULL, 46, 12, 3, 'update', '{\"document_title\":{\"old\":\"ghjghfj\",\"new\":\"testin\"},\"main_folder_id\":{\"old\":2,\"new\":12},\"sub_folder_id\":{\"old\":87,\"new\":\"3\"},\"department_type_id\":{\"old\":2,\"new\":\"12\"}}', NULL, 1, '2024-12-26 10:11:24', '2024-12-26 10:11:24', NULL),
(438, 1, NULL, 54, 1, 57, 'view', NULL, NULL, 1, '2024-12-26 10:13:00', '2024-12-26 10:13:00', NULL),
(439, 1, NULL, 41, 12, 3, 'view', NULL, NULL, 1, '2024-12-26 10:13:32', '2024-12-26 10:13:32', NULL),
(440, 1, NULL, 40, 1, 57, 'view', NULL, NULL, 1, '2024-12-26 10:13:39', '2024-12-26 10:13:39', NULL),
(441, 1, NULL, 36, 3, NULL, 'view', NULL, NULL, 1, '2024-12-26 10:14:02', '2024-12-26 10:14:02', NULL),
(442, 1, NULL, 31, 13, 8, 'view', NULL, NULL, 1, '2024-12-26 10:18:38', '2024-12-26 10:18:38', NULL),
(443, 1, NULL, 31, 13, 8, 'view', NULL, NULL, 1, '2024-12-26 10:18:51', '2024-12-26 10:18:51', NULL),
(444, 1, NULL, 22, 37, 55, 'view', NULL, NULL, 1, '2024-12-26 10:18:55', '2024-12-26 10:18:55', NULL),
(445, 1, NULL, 53, 12, 3, 'view', NULL, NULL, 1, '2024-12-26 10:19:12', '2024-12-26 10:19:12', NULL),
(446, 1, NULL, 54, 1, 57, 'view', NULL, NULL, 1, '2024-12-26 10:21:00', '2024-12-26 10:21:00', NULL),
(447, 1, NULL, 54, 1, 57, 'view', NULL, NULL, 1, '2024-12-26 10:21:11', '2024-12-26 10:21:11', NULL),
(448, 1, NULL, 54, 1, 57, 'view', NULL, NULL, 1, '2024-12-26 10:21:18', '2024-12-26 10:21:18', NULL),
(449, 1, NULL, 54, 1, 57, 'view', NULL, NULL, 1, '2024-12-26 10:21:26', '2024-12-26 10:21:26', NULL),
(450, 1, NULL, 50, 1, 57, 'view', NULL, NULL, 1, '2024-12-26 10:21:31', '2024-12-26 10:21:31', NULL),
(451, 1, 1, 54, 1, 57, 'view', NULL, NULL, 1, '2024-12-26 10:54:39', '2024-12-26 10:54:39', NULL),
(452, 1, NULL, 54, 1, 57, 'update', '{\"document_title\":{\"old\":\"xyz\",\"new\":\"xyzfd\"}}', NULL, 1, '2024-12-26 10:56:17', '2024-12-26 10:56:17', NULL),
(453, 209, 7, 55, 37, 55, 'view', NULL, NULL, 1, '2024-12-26 11:03:10', '2024-12-26 11:03:10', NULL),
(454, 209, NULL, 55, 37, 55, 'update', '{\"document_title\":{\"old\":\"dfdfd\",\"new\":\"dfdfddfdf\"}}', NULL, 1, '2024-12-26 11:03:38', '2024-12-26 11:03:38', NULL),
(455, 209, 7, 55, 37, 55, 'view', NULL, NULL, 1, '2024-12-26 11:09:50', '2024-12-26 11:09:50', NULL),
(456, 209, 7, 55, 37, 55, 'view', NULL, NULL, 1, '2024-12-27 05:00:21', '2024-12-27 05:00:21', NULL),
(457, 209, NULL, 55, 37, 55, 'update', '{\"document_title\":{\"old\":\"dfdfddfdf\",\"new\":\"dfdfddfdf dd\"}}', NULL, 1, '2024-12-27 05:00:32', '2024-12-27 05:00:32', NULL),
(458, 209, 7, 55, 37, 55, 'update', '{\"document_title\":{\"old\":\"dfdfddfdf dd\",\"new\":\"dfdfddfdf\"}}', NULL, 1, '2024-12-27 05:10:35', '2024-12-27 05:10:35', NULL),
(459, 209, 7, 55, 37, 55, 'delete', NULL, NULL, 1, '2024-12-27 05:11:16', '2024-12-27 05:11:16', NULL),
(460, 1, 1, 55, 37, 55, 'restore', NULL, NULL, 1, '2024-12-27 05:11:35', '2024-12-27 05:11:35', NULL),
(461, 209, 7, 55, 37, 55, 'delete', NULL, NULL, 1, '2024-12-27 05:11:59', '2024-12-27 05:11:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `document_comments`
--

CREATE TABLE `document_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `publish_status` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_comments`
--

INSERT INTO `document_comments` (`id`, `task_id`, `document_id`, `user_id`, `parent_id`, `comment`, `publish_status`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 9, 1, NULL, 'test', 1, 1, '2024-09-04 01:58:39', '2024-09-04 01:58:39'),
(2, NULL, 9, 1, NULL, 'sdfsdaf', 1, 1, '2024-09-04 02:14:24', '2024-09-04 02:14:24'),
(3, NULL, 9, 1, 1, 'sdfsdaf', 1, 1, '2024-09-04 02:28:33', '2024-09-04 02:28:33'),
(4, NULL, 9, 1, 1, 'sfsgfdg', 1, 1, '2024-09-04 02:37:57', '2024-09-04 02:37:57'),
(5, NULL, 9, 1, 2, 'safsadf', 1, 1, '2024-09-04 02:48:05', '2024-09-04 02:48:05'),
(6, NULL, 12, 39, NULL, 'hellosss', 1, 1, '2024-09-04 03:00:05', '2024-09-04 03:00:05'),
(7, NULL, 12, 1, 6, 'asfsadf', 1, 1, '2024-09-04 03:00:50', '2024-09-04 03:00:50'),
(8, NULL, 31, 39, NULL, 'sfs', 1, 1, '2024-09-20 04:44:21', '2024-09-20 04:44:21'),
(9, NULL, 20, 1, NULL, 'fgsdg', 1, 1, '2024-09-20 06:49:13', '2024-09-20 06:49:13'),
(10, NULL, 21, 78, NULL, 'dfgdsg', 1, 1, '2024-09-23 07:26:43', '2024-09-23 07:26:43'),
(11, 1, 20, 1, NULL, 'test', 1, 1, '2024-09-23 23:24:12', '2024-09-23 23:24:12'),
(12, NULL, NULL, 1, 11, NULL, 1, 1, '2024-09-23 23:29:14', '2024-09-23 23:29:14'),
(13, NULL, NULL, 1, 11, 'dfdf', 1, 1, '2024-09-23 23:29:34', '2024-09-23 23:29:34'),
(14, 1, 20, 1, NULL, 'dsds', 1, 1, '2024-09-23 23:33:07', '2024-09-23 23:33:07'),
(15, 1, 20, 1, 11, 'hello', 1, 1, '2024-09-23 23:38:16', '2024-09-23 23:38:16'),
(16, 1, 20, 1, NULL, 'abc', 1, 1, '2024-09-23 23:41:53', '2024-09-23 23:41:53'),
(17, 1, 20, 39, 11, 'sfsf', 1, 1, '2024-09-23 23:47:54', '2024-09-23 23:47:54'),
(18, 1, 20, 39, 11, 'safsaf', 1, 1, '2024-09-23 23:48:19', '2024-09-23 23:48:19'),
(19, 1, 20, 39, NULL, 'dgsdfg', 1, 1, '2024-09-23 23:48:30', '2024-09-23 23:48:30'),
(20, 1, 20, 39, 19, 'dgdsfg', 1, 1, '2024-09-23 23:48:44', '2024-09-23 23:48:44'),
(21, 1, 20, 39, 11, 'sdfsdf', 1, 1, '2024-09-23 23:49:46', '2024-09-23 23:49:46'),
(22, 1, 20, 1, 19, 'sdfsfdsf', 1, 1, '2024-09-23 23:50:16', '2024-09-23 23:50:16'),
(23, 1, 20, 39, 14, 'abcd', 1, 1, '2024-09-23 23:51:28', '2024-09-23 23:51:28'),
(24, 1, 20, 39, 11, '123', 1, 1, '2024-09-23 23:52:07', '2024-09-23 23:52:07'),
(25, 5, 20, 40, NULL, 'comment from harsh', 1, 1, '2024-09-23 23:56:58', '2024-09-23 23:56:58'),
(26, 5, 20, 1, 25, 'hi, harsh have done this task?', 1, 1, '2024-09-23 23:57:41', '2024-09-23 23:57:41'),
(27, 5, 20, 40, 25, 'almost done sir. today till evening it will be complely done', 1, 1, '2024-09-23 23:58:30', '2024-09-23 23:58:30'),
(28, 5, 20, 1, 25, 'Good Job!', 1, 1, '2024-09-23 23:58:52', '2024-09-23 23:58:52'),
(29, 5, 20, 1, 25, 'Please mark as done when you completed.', 1, 1, '2024-09-24 00:00:17', '2024-09-24 00:00:17'),
(30, 5, 20, 40, 25, 'Sure sir.', 1, 1, '2024-09-24 00:00:31', '2024-09-24 00:00:31'),
(31, 5, 20, 40, NULL, 'Hello Testing', 1, 1, '2024-09-24 01:02:46', '2024-09-24 01:02:46'),
(32, 1, 20, 39, NULL, 'test', 1, 1, '2024-09-24 01:12:36', '2024-09-24 01:12:36'),
(33, 1, 20, 1, NULL, 'test', 1, 1, '2024-09-24 01:13:12', '2024-09-24 01:13:12'),
(34, 1, 20, 1, 11, 'sdfsadf', 1, 1, '2024-09-24 01:23:39', '2024-09-24 01:23:39'),
(35, 1, 20, 39, 11, 'gxdgdxg', 1, 1, '2024-09-24 01:24:04', '2024-09-24 01:24:04'),
(36, 1, 20, 39, 32, 'gfdgd', 1, 1, '2024-09-24 01:24:30', '2024-09-24 01:24:30'),
(37, 1, 20, 1, 11, 'gdfdfgfds', 1, 1, '2024-09-24 02:01:33', '2024-09-24 02:01:33'),
(38, 5, 20, 40, 25, 'xvc', 1, 1, '2024-09-24 02:01:58', '2024-09-24 02:01:58'),
(39, 5, 20, 40, NULL, 'fdgdg', 1, 1, '2024-09-24 02:02:06', '2024-09-24 02:02:06'),
(40, 10, 35, 39, NULL, 'ddf', 1, 1, '2024-09-24 03:00:14', '2024-09-24 03:00:14'),
(41, 10, 35, 1, 40, 'sfdsafsad', 1, 1, '2024-09-24 03:01:54', '2024-09-24 03:01:54'),
(42, 10, 35, 39, 40, 'hello sire', 1, 1, '2024-09-24 03:02:29', '2024-09-24 03:02:29'),
(43, 10, 35, 1, 40, 'hi akash how are you?', 1, 1, '2024-09-24 03:02:46', '2024-09-24 03:02:46'),
(44, 10, 35, 39, 40, 'i am good sir', 1, 1, '2024-09-24 03:02:57', '2024-09-24 03:02:57'),
(45, 5, 20, 1, NULL, 'test', 1, 1, '2024-09-24 04:43:07', '2024-09-24 04:43:07'),
(46, 5, 20, 1, 25, 'testet', 1, 1, '2024-09-24 04:43:57', '2024-09-24 04:43:57'),
(47, 6, 21, 1, NULL, 'test', 1, 1, '2024-09-24 05:19:35', '2024-09-24 05:19:35'),
(48, 18, 1, 1, NULL, 'ssd', 1, 1, '2024-11-05 04:55:40', '2024-11-05 04:55:40'),
(49, 20, 11, 1, NULL, 'ertete', 1, 1, '2024-11-28 12:18:41', '2024-11-28 12:18:41'),
(50, 20, 11, 1, NULL, 'rdtyhertye', 1, 1, '2024-11-28 12:18:49', '2024-11-28 12:18:49'),
(51, 18, 1, 1, NULL, 'asfasdf', 1, 1, '2024-12-02 06:53:16', '2024-12-02 06:53:16'),
(52, 18, 1, 1, 48, 'sadfasfd', 1, 1, '2024-12-02 06:53:25', '2024-12-02 06:53:25'),
(53, 30, 1, 1, NULL, 'test test', 1, 1, '2024-12-14 11:35:51', '2024-12-17 10:03:16'),
(54, 30, 1, 193, NULL, 'dgs', 1, 1, '2024-12-14 11:40:09', '2024-12-14 11:40:09'),
(55, 30, 1, 1, NULL, 'egdsfgsg', 1, 1, '2024-12-14 11:40:27', '2024-12-14 11:40:27'),
(56, 30, 1, 1, NULL, 'dfdd', 1, 1, '2024-12-17 10:06:13', '2024-12-17 10:12:08'),
(57, 30, 1, 1, NULL, 'df', 1, 1, '2024-12-17 10:10:48', '2024-12-17 10:10:48'),
(58, NULL, 39, 1, NULL, 'SDFSF dffs dfgfdhg fgh', 1, 1, '2024-12-17 10:36:23', '2024-12-17 10:41:22');

-- --------------------------------------------------------

--
-- Table structure for table `document_permissions`
--

CREATE TABLE `document_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_id` int(10) UNSIGNED DEFAULT NULL,
  `read` tinyint(4) DEFAULT NULL,
  `write` tinyint(4) DEFAULT NULL,
  `access_given_by` bigint(20) DEFAULT NULL,
  `download` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_permissions`
--

INSERT INTO `document_permissions` (`id`, `user_id`, `document_id`, `read`, `write`, `access_given_by`, `download`, `created_at`, `updated_at`) VALUES
(251, 68, 16, 0, 1, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(252, 39, 16, 1, 1, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(253, 65, 16, 0, 0, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(254, 42, 16, 0, 0, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(255, 70, 16, 0, 0, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(256, 45, 16, 0, 0, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(257, 40, 16, 1, 1, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(258, 64, 16, 0, 0, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(259, 66, 16, 0, 0, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(260, 67, 16, 0, 0, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(261, 41, 16, 0, 0, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(262, 75, 16, 0, 1, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(263, 46, 16, 0, 0, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(264, 74, 16, 0, 0, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(265, 69, 16, 1, 1, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(266, 73, 16, 0, 0, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(267, 71, 16, 0, 0, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(268, 72, 16, 0, 1, NULL, NULL, '2024-09-13 00:39:55', '2024-09-13 00:39:55'),
(363, 68, 20, 1, 1, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(364, 39, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(365, 77, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(366, 65, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(367, 42, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(368, 70, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(369, 45, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(370, 40, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(371, 64, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(372, 66, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(373, 67, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(374, 41, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(375, 75, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(376, 78, 20, 1, 1, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(377, 46, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(378, 80, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(379, 74, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(380, 79, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(381, 69, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(382, 73, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(383, 71, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(384, 72, 20, 0, 0, NULL, NULL, '2024-09-23 01:13:53', '2024-09-23 01:13:53'),
(385, 68, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(386, 39, 21, 1, 1, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(387, 77, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(388, 65, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(389, 42, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(390, 70, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(391, 45, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(392, 40, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(393, 64, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(394, 66, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(395, 67, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(396, 41, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(397, 75, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(398, 78, 21, 1, 1, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(399, 46, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(400, 80, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(401, 74, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(402, 79, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(403, 69, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(404, 73, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(405, 71, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(406, 72, 21, 0, 0, NULL, NULL, '2024-09-23 06:13:29', '2024-09-23 06:13:29'),
(451, 68, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(452, 39, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(453, 77, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(454, 65, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(455, 42, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(456, 70, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(457, 45, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(458, 40, 15, 1, 1, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(459, 64, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(460, 66, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(461, 67, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(462, 41, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(463, 75, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(464, 78, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(465, 46, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(466, 80, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(467, 74, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(468, 79, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(469, 69, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(470, 73, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(471, 71, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(472, 72, 15, 0, 0, NULL, NULL, '2024-09-25 02:05:43', '2024-09-25 02:05:43'),
(473, 68, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(474, 39, 12, 1, 1, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(475, 77, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(476, 65, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(477, 42, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(478, 70, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(479, 45, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(480, 40, 12, 1, 1, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(481, 64, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(482, 66, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(483, 67, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(484, 41, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(485, 75, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(486, 78, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(487, 46, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(488, 80, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(489, 74, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(490, 79, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(491, 69, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(492, 73, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(493, 71, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(494, 72, 12, 0, 0, NULL, NULL, '2024-09-25 02:05:59', '2024-09-25 02:05:59'),
(508, 68, 44, 0, 0, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(509, 41, 44, 0, 0, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(510, 40, 44, 0, 0, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(511, 65, 44, 0, 0, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(512, 42, 44, 0, 0, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(513, 101, 44, 1, 1, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(514, 45, 44, 0, 0, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(515, 39, 44, 0, 0, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(516, 64, 44, 0, 0, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(517, 66, 44, 0, 0, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(518, 67, 44, 0, 0, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(519, 78, 44, 0, 0, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(520, 46, 44, 0, 0, NULL, NULL, '2024-10-17 07:30:52', '2024-10-17 07:30:52'),
(534, 68, 45, 0, 0, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(535, 41, 45, 0, 0, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(536, 40, 45, 0, 0, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(537, 65, 45, 0, 0, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(538, 42, 45, 0, 0, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(539, 45, 45, 0, 0, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(540, 39, 45, 0, 0, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(541, 64, 45, 0, 0, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(542, 66, 45, 0, 0, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(543, 67, 45, 0, 0, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(544, 78, 45, 0, 0, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(545, 46, 45, 0, 0, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(546, 110, 45, 1, 1, NULL, NULL, '2024-10-18 05:13:38', '2024-10-18 05:13:38'),
(560, 68, 48, 0, 0, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(561, 41, 48, 0, 0, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(562, 40, 48, 0, 0, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(563, 65, 48, 0, 0, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(564, 42, 48, 0, 0, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(565, 45, 48, 0, 0, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(566, 39, 48, 0, 0, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(567, 64, 48, 0, 0, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(568, 66, 48, 0, 0, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(569, 67, 48, 0, 0, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(570, 78, 48, 0, 0, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(571, 46, 48, 0, 0, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(572, 112, 48, 1, 1, NULL, NULL, '2024-10-18 06:48:54', '2024-10-18 06:48:54'),
(587, 68, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(588, 41, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(589, 40, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(590, 65, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(591, 42, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(592, 45, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(593, 39, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(594, 64, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(595, 66, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(596, 67, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(597, 78, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(598, 46, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(599, 116, 49, 0, 0, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(600, 117, 49, 1, 1, NULL, NULL, '2024-10-18 07:12:55', '2024-10-18 07:12:55'),
(614, 68, 50, 0, 0, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(615, 41, 50, 0, 0, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(616, 40, 50, 0, 0, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(617, 65, 50, 0, 0, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(618, 42, 50, 0, 0, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(619, 45, 50, 0, 0, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(620, 39, 50, 0, 0, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(621, 64, 50, 0, 0, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(622, 66, 50, 0, 0, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(623, 67, 50, 0, 0, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(624, 78, 50, 0, 0, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(625, 46, 50, 0, 0, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(626, 118, 50, 1, 1, NULL, NULL, '2024-10-18 07:25:20', '2024-10-18 07:25:20'),
(833, 172, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(834, 173, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(835, 171, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(836, 167, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(837, 177, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(838, 168, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(839, 175, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(840, 169, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(841, 166, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(842, 164, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(843, 170, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(844, 174, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(845, 165, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(846, 176, 1, 0, 0, 1, NULL, '2024-10-29 05:29:12', '2024-10-29 05:29:12'),
(847, 172, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(848, 173, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(849, 171, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(850, 167, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(851, 177, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(852, 168, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(853, 175, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(854, 169, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(855, 166, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(856, 164, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(857, 170, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(858, 174, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(859, 165, 11, 0, 0, 1, NULL, '2024-10-29 05:29:55', '2024-10-29 05:29:55'),
(860, 176, 11, 1, 0, 1, NULL, '2024-10-29 05:29:59', '2024-10-29 05:29:59'),
(953, 197, 1, 0, 0, 1, NULL, '2024-11-18 06:55:12', '2024-11-18 06:55:12'),
(954, 215, 1, 0, 0, 1, NULL, '2024-11-18 06:55:12', '2024-11-18 06:55:12'),
(955, 199, 1, 0, 0, 1, NULL, '2024-11-18 06:55:12', '2024-11-18 06:55:12'),
(956, 194, 1, 0, 0, 1, NULL, '2024-11-18 06:55:12', '2024-11-18 06:55:12'),
(957, 203, 1, 0, 0, 1, NULL, '2024-11-18 06:55:12', '2024-11-18 06:55:12'),
(958, 202, 1, 0, 0, 1, NULL, '2024-11-18 06:55:12', '2024-11-18 06:55:12'),
(959, 200, 1, 0, 0, 1, NULL, '2024-11-18 06:55:12', '2024-11-18 06:55:12'),
(960, 196, 1, 0, 0, 1, NULL, '2024-11-18 06:55:12', '2024-11-18 06:55:12'),
(961, 201, 1, 0, 0, 1, NULL, '2024-11-18 06:55:12', '2024-11-18 06:55:12'),
(962, 193, 1, 1, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(963, 212, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(964, 204, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(965, 210, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(966, 211, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(967, 205, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(968, 214, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(969, 209, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(970, 207, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(971, 206, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(972, 208, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(973, 213, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(974, 198, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(975, 195, 1, 0, 0, 1, NULL, '2024-11-18 06:55:17', '2024-11-18 06:55:17'),
(976, 197, 2, 0, 0, 1, NULL, '2024-11-18 06:56:03', '2024-11-18 06:56:03'),
(977, 215, 2, 0, 0, 1, NULL, '2024-11-18 06:56:03', '2024-11-18 06:56:03'),
(978, 199, 2, 0, 0, 1, NULL, '2024-11-18 06:56:03', '2024-11-18 06:56:03'),
(979, 194, 2, 0, 0, 1, NULL, '2024-11-18 06:56:03', '2024-11-18 06:56:03'),
(980, 203, 2, 0, 0, 1, NULL, '2024-11-18 06:56:03', '2024-11-18 06:56:03'),
(981, 202, 2, 0, 0, 1, NULL, '2024-11-18 06:56:03', '2024-11-18 06:56:03'),
(982, 200, 2, 0, 0, 1, NULL, '2024-11-18 06:56:03', '2024-11-18 06:56:03'),
(983, 196, 2, 0, 0, 1, NULL, '2024-11-18 06:56:03', '2024-11-18 06:56:03'),
(984, 201, 2, 0, 0, 1, NULL, '2024-11-18 06:56:03', '2024-11-18 06:56:03'),
(985, 193, 2, 0, 1, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(986, 212, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(987, 204, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(988, 210, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(989, 211, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(990, 205, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(991, 214, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(992, 209, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(993, 207, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(994, 206, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(995, 208, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(996, 213, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(997, 198, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(998, 195, 2, 0, 0, 1, NULL, '2024-11-18 06:56:08', '2024-11-18 06:56:08'),
(1275, 197, 19, 0, 0, 1, NULL, '2024-11-20 13:37:29', '2024-11-20 13:37:29'),
(1276, 215, 19, 0, 0, 1, NULL, '2024-11-20 13:37:29', '2024-11-20 13:37:29'),
(1277, 199, 19, 0, 0, 1, NULL, '2024-11-20 13:37:29', '2024-11-20 13:37:29'),
(1278, 194, 19, 0, 0, 1, NULL, '2024-11-20 13:37:29', '2024-11-20 13:37:29'),
(1279, 203, 19, 0, 0, 1, NULL, '2024-11-20 13:37:29', '2024-11-20 13:37:29'),
(1280, 202, 19, 0, 0, 1, NULL, '2024-11-20 13:37:30', '2024-11-20 13:37:30'),
(1281, 200, 19, 0, 0, 1, NULL, '2024-11-20 13:37:30', '2024-11-20 13:37:30'),
(1282, 196, 19, 0, 0, 1, NULL, '2024-11-20 13:37:30', '2024-11-20 13:37:30'),
(1283, 201, 19, 0, 0, 1, NULL, '2024-11-20 13:37:30', '2024-11-20 13:37:30'),
(1284, 193, 19, 1, 1, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1285, 212, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1286, 204, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1287, 210, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1288, 211, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1289, 205, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1290, 214, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1291, 209, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1292, 207, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1293, 206, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1294, 208, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1295, 213, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1296, 198, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1297, 195, 19, 0, 0, 1, NULL, '2024-11-20 13:37:33', '2024-11-20 13:37:33'),
(1436, 197, 25, 0, 0, 1, NULL, '2024-11-21 07:29:52', '2024-11-21 07:29:52'),
(1437, 215, 25, 0, 0, 1, NULL, '2024-11-21 07:29:52', '2024-11-21 07:29:52'),
(1438, 199, 25, 0, 0, 1, NULL, '2024-11-21 07:29:52', '2024-11-21 07:29:52'),
(1439, 194, 25, 0, 0, 1, NULL, '2024-11-21 07:29:52', '2024-11-21 07:29:52'),
(1440, 203, 25, 0, 0, 1, NULL, '2024-11-21 07:29:52', '2024-11-21 07:29:52'),
(1441, 202, 25, 0, 0, 1, NULL, '2024-11-21 07:29:52', '2024-11-21 07:29:52'),
(1442, 200, 25, 0, 0, 1, NULL, '2024-11-21 07:29:52', '2024-11-21 07:29:52'),
(1443, 196, 25, 0, 0, 1, NULL, '2024-11-21 07:29:52', '2024-11-21 07:29:52'),
(1444, 201, 25, 0, 0, 1, NULL, '2024-11-21 07:29:52', '2024-11-21 07:29:52'),
(1445, 193, 25, 1, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1446, 212, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1447, 204, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1448, 210, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1449, 211, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1450, 205, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1451, 214, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1452, 209, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1453, 207, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1454, 206, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1455, 208, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1456, 213, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1457, 198, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1458, 195, 25, 0, 0, 1, NULL, '2024-11-21 07:29:56', '2024-11-21 07:29:56'),
(1505, 197, 21, 0, 0, 193, NULL, '2024-11-21 09:58:03', '2024-11-21 09:58:03'),
(1506, 215, 21, 0, 0, 193, NULL, '2024-11-21 09:58:03', '2024-11-21 09:58:03'),
(1507, 199, 21, 0, 0, 193, NULL, '2024-11-21 09:58:03', '2024-11-21 09:58:03'),
(1508, 194, 21, 0, 0, 193, NULL, '2024-11-21 09:58:03', '2024-11-21 09:58:03'),
(1509, 203, 21, 0, 0, 193, NULL, '2024-11-21 09:58:03', '2024-11-21 09:58:03'),
(1510, 202, 21, 0, 0, 193, NULL, '2024-11-21 09:58:03', '2024-11-21 09:58:03'),
(1511, 200, 21, 0, 0, 193, NULL, '2024-11-21 09:58:03', '2024-11-21 09:58:03'),
(1512, 196, 21, 0, 1, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1513, 201, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1514, 193, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1515, 212, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1516, 204, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1517, 210, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1518, 211, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1519, 205, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1520, 214, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1521, 209, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1522, 207, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1523, 206, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1524, 208, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1525, 213, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1526, 198, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1527, 195, 21, 0, 0, 193, NULL, '2024-11-21 09:58:07', '2024-11-21 09:58:07'),
(1528, 197, 23, 0, 0, 193, NULL, '2024-11-22 10:32:35', '2024-11-22 10:32:35'),
(1529, 215, 23, 0, 0, 193, NULL, '2024-11-22 10:32:35', '2024-11-22 10:32:35'),
(1530, 199, 23, 0, 0, 193, NULL, '2024-11-22 10:32:35', '2024-11-22 10:32:35'),
(1531, 194, 23, 0, 0, 193, NULL, '2024-11-22 10:32:35', '2024-11-22 10:32:35'),
(1532, 203, 23, 0, 0, 193, NULL, '2024-11-22 10:32:35', '2024-11-22 10:32:35'),
(1533, 202, 23, 0, 0, 193, NULL, '2024-11-22 10:32:35', '2024-11-22 10:32:35'),
(1534, 200, 23, 0, 0, 193, NULL, '2024-11-22 10:32:35', '2024-11-22 10:32:35'),
(1535, 196, 23, 1, 1, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1536, 201, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1537, 193, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1538, 212, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1539, 204, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1540, 210, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1541, 211, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1542, 205, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1543, 214, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1544, 209, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1545, 207, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1546, 206, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1547, 208, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1548, 213, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1549, 198, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1550, 195, 23, 0, 0, 193, NULL, '2024-11-22 10:32:38', '2024-11-22 10:32:38'),
(1551, 197, 20, 0, 0, 1, NULL, '2024-11-22 10:43:30', '2024-11-22 10:43:30'),
(1552, 215, 20, 0, 0, 1, NULL, '2024-11-22 10:43:30', '2024-11-22 10:43:30'),
(1553, 199, 20, 0, 0, 1, NULL, '2024-11-22 10:43:30', '2024-11-22 10:43:30'),
(1554, 194, 20, 0, 0, 1, NULL, '2024-11-22 10:43:30', '2024-11-22 10:43:30'),
(1555, 203, 20, 0, 0, 1, NULL, '2024-11-22 10:43:30', '2024-11-22 10:43:30'),
(1556, 202, 20, 0, 0, 1, NULL, '2024-11-22 10:43:30', '2024-11-22 10:43:30'),
(1557, 200, 20, 0, 0, 1, NULL, '2024-11-22 10:43:30', '2024-11-22 10:43:30'),
(1558, 196, 20, 0, 0, 1, NULL, '2024-11-22 10:43:30', '2024-11-22 10:43:30'),
(1559, 201, 20, 0, 0, 1, NULL, '2024-11-22 10:43:30', '2024-11-22 10:43:30'),
(1560, 193, 20, 1, 1, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1561, 212, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1562, 204, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1563, 210, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1564, 211, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1565, 205, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1566, 214, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1567, 209, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1568, 207, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1569, 206, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1570, 208, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1571, 213, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1572, 198, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1573, 195, 20, 0, 0, 1, NULL, '2024-11-22 10:43:34', '2024-11-22 10:43:34'),
(1574, 196, 20, 1, 1, 193, NULL, '2024-11-22 10:44:43', '2024-11-22 10:44:43'),
(1577, 215, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1578, 199, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1579, 194, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1580, 203, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1581, 202, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1582, 200, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1583, 196, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1584, 201, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1585, 193, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1586, 212, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1587, 204, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1588, 210, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1589, 211, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1590, 205, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1591, 214, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1592, 209, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1593, 207, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1594, 206, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1595, 208, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1596, 213, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1597, 198, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1598, 195, 18, 0, 0, 193, NULL, '2024-11-22 10:57:29', '2024-11-22 10:57:29'),
(1599, 197, 18, 0, 0, 193, NULL, '2024-11-22 11:05:57', '2024-11-22 11:05:57'),
(1600, 195, 17, 1, 1, 193, NULL, '2024-11-22 11:06:24', '2024-11-22 11:06:24'),
(1601, 196, 17, 1, 1, 193, NULL, '2024-11-22 11:06:24', '2024-11-22 11:06:24'),
(1602, 197, 17, 1, 1, 193, NULL, '2024-11-22 11:06:24', '2024-11-22 11:06:24'),
(1604, 193, 30, 1, 1, 1, NULL, '2024-11-28 08:18:03', '2024-11-28 08:18:03'),
(1607, 193, 32, 1, 0, 1, NULL, '2024-11-28 09:38:05', '2024-11-28 09:38:05'),
(1608, 193, 32, 1, 0, 1, NULL, '2024-11-28 09:38:06', '2024-11-28 09:38:06'),
(1609, 197, 18, 1, 0, 1, NULL, '2024-12-14 07:28:00', '2024-12-14 07:28:00'),
(1610, 198, 18, 1, 0, 1, NULL, '2024-12-14 07:28:00', '2024-12-14 07:28:00'),
(1611, 193, 39, 1, 0, 1, NULL, '2024-12-17 10:48:53', '2024-12-17 10:48:53'),
(1614, 199, 22, 1, 0, 1, NULL, '2024-12-18 06:19:17', '2024-12-18 06:19:17'),
(1615, 195, 39, 1, 0, 1, NULL, '2024-12-19 07:00:12', '2024-12-19 07:00:12'),
(1616, 196, 39, 1, 0, 1, NULL, '2024-12-19 07:00:12', '2024-12-19 07:00:12'),
(1617, 197, 39, 1, 0, 1, NULL, '2024-12-19 07:01:18', '2024-12-19 07:01:18'),
(1618, 193, 37, 1, 0, 1, NULL, '2024-12-19 07:58:04', '2024-12-19 07:58:04'),
(1619, 197, 37, 1, 0, 1, NULL, '2024-12-19 07:58:04', '2024-12-19 07:58:04'),
(1620, 193, 31, 1, 0, 1, NULL, '2024-12-19 08:23:10', '2024-12-19 08:23:10'),
(1621, 195, 31, 1, 0, 1, NULL, '2024-12-19 08:23:10', '2024-12-19 08:23:10'),
(1622, 194, 31, 1, 0, 1, NULL, '2024-12-19 10:24:39', '2024-12-19 10:24:39'),
(1623, 201, 31, 1, 0, 1, NULL, '2024-12-19 10:24:39', '2024-12-19 10:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_upload_permissions`
--

CREATE TABLE `file_upload_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `access_given_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `file_upload_permissions`
--

INSERT INTO `file_upload_permissions` (`id`, `main_folder_id`, `sub_folder_id`, `user_ids`, `user_id`, `access_given_by`, `created_at`, `updated_at`) VALUES
(31, 1, 54, NULL, 39, 1, '2024-09-23 01:21:35', '2024-09-23 01:21:35'),
(32, 1, 54, NULL, 41, 1, '2024-09-23 01:21:35', '2024-09-23 01:21:35'),
(33, 1, 54, NULL, 45, 1, '2024-09-23 01:21:36', '2024-09-23 01:21:36'),
(34, 1, 54, NULL, 78, 1, '2024-09-23 01:21:36', '2024-09-23 01:21:36'),
(35, 48, 62, NULL, 101, 1, '2024-10-17 07:31:52', '2024-10-17 07:31:52'),
(72, 1, 57, NULL, 173, 1, '2024-10-29 07:32:37', '2024-10-29 07:32:37'),
(73, 1, 57, NULL, 174, 1, '2024-10-29 07:32:37', '2024-10-29 07:32:37'),
(74, 1, 57, NULL, 176, 1, '2024-10-29 07:32:41', '2024-10-29 07:32:41'),
(76, 18, 33, NULL, 193, 1, '2024-11-18 06:27:39', '2024-11-18 06:27:39'),
(80, 37, 55, NULL, 199, 196, '2024-11-21 05:15:10', '2024-11-21 05:15:10'),
(81, 37, 55, NULL, 201, 196, '2024-11-21 05:15:14', '2024-11-21 05:15:14'),
(82, 37, 55, NULL, 209, 201, '2024-11-21 05:20:46', '2024-11-21 05:20:46'),
(88, 37, 89, NULL, 193, 1, '2024-11-21 07:00:08', '2024-11-21 07:00:08'),
(89, 37, 89, NULL, 194, 1, '2024-11-21 07:00:08', '2024-11-21 07:00:08'),
(97, 37, 55, NULL, 196, 193, '2024-11-22 10:10:21', '2024-11-22 10:10:21'),
(98, 37, 55, NULL, 198, 193, '2024-11-22 10:10:21', '2024-11-22 10:10:21'),
(101, 2, 87, NULL, 193, 1, '2024-12-14 08:02:44', '2024-12-14 08:02:44'),
(102, 37, 55, NULL, 204, 1, '2024-12-21 11:14:02', '2024-12-21 11:14:02');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `location`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(12, 'Homegrown Hideaway', 'New Delhi', 52, 1, '2024-08-01 01:05:42', '2024-08-01 01:05:42'),
(13, 'Novotel New Delhi Aerocity Hotel', 'New Delhi', 56, 1, '2024-08-03 02:47:37', '2024-08-03 02:47:37'),
(14, 'The Leela Palace New Delhi', 'New Delhi', 57, 1, '2024-08-03 02:49:01', '2024-08-03 02:49:01'),
(15, 'Hyatt Place Gurgaon Udyog Vihar', 'Gurugram, Haryana', 58, 1, '2024-08-03 02:50:03', '2024-08-03 02:50:03'),
(16, 'Hotel Shanti Palace', 'New Delhi', 59, 1, '2024-08-03 02:50:45', '2024-08-03 02:50:45'),
(17, 'Hotel White Rabbit', 'Pushkar, New Delhi', 60, 1, '2024-08-03 02:52:02', '2024-08-03 02:52:02'),
(18, 'Taj Amer, Jaipur', 'Amer, Jaipur, Rajasthan', 61, 1, '2024-08-03 02:52:59', '2024-08-03 02:52:59'),
(19, 'Holiday Inn New Delhi Int\'l Airport', 'New Delhi', 64, 1, '2024-08-03 07:19:36', '2024-09-26 06:07:23'),
(20, 'Crowne Plaza New Delhi Mayur Vihar Noida', 'New Delhi', 65, 1, '2024-08-03 07:20:11', '2024-09-14 04:11:43'),
(21, 'Holiday Inn New Delhi Mayur Vihar Noida', 'Noida', 66, 1, '2024-08-03 07:20:51', '2024-08-03 07:20:51'),
(22, 'RAMBAGH PALACE, JAIPUR', 'Jaipur, Rajasthan', 78, 1, '2024-09-18 04:39:11', '2024-09-18 04:39:11'),
(26, 'test', 'New Delhi', 107, 1, '2024-10-18 02:39:27', '2024-10-18 02:39:27'),
(27, 'Test Unit', 'Delhi', 117, 1, '2024-10-18 07:05:18', '2024-10-18 07:05:18'),
(28, 'test Unit', 'Delhi', 120, 1, '2024-10-18 07:59:04', '2024-10-18 07:59:04');

-- --------------------------------------------------------

--
-- Table structure for table `login_audits`
--

CREATE TABLE `login_audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ip` text DEFAULT NULL,
  `latitude` text DEFAULT NULL,
  `longitude` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_audits`
--

INSERT INTO `login_audits` (`id`, `user_id`, `email`, `ip`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 124, 'sugata@cygnetthotels.com', '::1', NULL, NULL, 1, '2024-10-19 04:30:17', '2024-10-19 04:30:17', NULL),
(2, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-20 23:11:56', '2024-10-20 23:11:56', NULL),
(3, 125, 'koushalsahil@gmail.com', '::1', NULL, NULL, 1, '2024-10-20 23:24:29', '2024-10-20 23:24:29', NULL),
(4, 128, 'hotelitdepartment@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-20 23:26:13', '2024-10-20 23:26:13', NULL),
(5, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-21 04:51:45', '2024-10-21 04:51:45', NULL),
(6, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-21 23:10:54', '2024-10-21 23:10:54', NULL),
(7, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-22 01:37:35', '2024-10-22 01:37:35', NULL),
(8, 128, 'hotelitdepartment@gmail.com', '::1', NULL, NULL, 1, '2024-10-22 05:23:35', '2024-10-22 05:23:35', NULL),
(9, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-22 08:09:30', '2024-10-22 08:09:30', NULL),
(10, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-22 23:11:49', '2024-10-22 23:11:49', NULL),
(11, 125, 'koushalsahil@gmail.com', '::1', NULL, NULL, 1, '2024-10-22 23:28:43', '2024-10-22 23:28:43', NULL),
(12, 129, 'akashoberoi@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-23 01:38:29', '2024-10-23 01:38:29', NULL),
(13, 131, 'hellotesting@gmail.com', '::1', NULL, NULL, 1, '2024-10-23 05:09:27', '2024-10-23 05:09:27', NULL),
(14, 125, 'koushalsahil@gmail.com', '::1', NULL, NULL, 1, '2024-10-23 06:18:17', '2024-10-23 06:18:17', NULL),
(15, 133, 'mytest@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-23 06:52:55', '2024-10-23 06:52:55', NULL),
(16, 135, 'newmanagertest@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-23 06:56:09', '2024-10-23 06:56:09', NULL),
(17, 136, 'jhjhhj@hjh.co', '127.0.0.1', NULL, NULL, 1, '2024-10-23 07:53:19', '2024-10-23 07:53:19', NULL),
(18, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-23 23:08:20', '2024-10-23 23:08:20', NULL),
(19, 137, 'sanjay@gmail.com', '::1', NULL, NULL, 1, '2024-10-23 23:18:51', '2024-10-23 23:18:51', NULL),
(20, 139, 'myusertest@gmail.com', '::1', NULL, NULL, 1, '2024-10-23 23:31:39', '2024-10-23 23:31:39', NULL),
(21, 125, 'koushalsahil@gmail.com', '::1', NULL, NULL, 1, '2024-10-23 23:34:29', '2024-10-23 23:34:29', NULL),
(22, 140, 'managdfdfertest@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-23 23:45:26', '2024-10-23 23:45:26', NULL),
(23, 143, 'test@gmail.com', '::1', NULL, NULL, 1, '2024-10-24 01:57:46', '2024-10-24 01:57:46', NULL),
(24, 147, 'tarunarora@gmail.com', '::1', NULL, NULL, 1, '2024-10-24 02:07:51', '2024-10-24 02:07:51', NULL),
(25, 146, 'rakeshmandal@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-24 02:08:29', '2024-10-24 02:08:29', NULL),
(26, 150, 'sanhilchandra@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-24 02:11:43', '2024-10-24 02:11:43', NULL),
(27, 149, 'itmanager@gmail.com', '::1', NULL, NULL, 1, '2024-10-24 05:48:15', '2024-10-24 05:48:15', NULL),
(28, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-24 23:15:54', '2024-10-24 23:15:54', NULL),
(29, 146, 'rakeshmandal@gmail.com', '::1', NULL, NULL, 1, '2024-10-24 23:28:52', '2024-10-24 23:28:52', NULL),
(30, 150, 'sanhilchandra@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-24 23:36:16', '2024-10-24 23:36:16', NULL),
(31, 148, 'accountmanager@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-25 00:50:36', '2024-10-25 00:50:36', NULL),
(32, 149, 'itmanager@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-25 00:51:25', '2024-10-25 00:51:25', NULL),
(33, 148, 'accountmanager@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 02:31:18', '2024-10-25 02:31:18', NULL),
(34, 148, 'accountmanager@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 02:31:36', '2024-10-25 02:31:36', NULL),
(35, 148, 'accountmanager@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 02:31:49', '2024-10-25 02:31:49', NULL),
(36, 148, 'accountmanager@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 02:36:22', '2024-10-25 02:36:22', NULL),
(37, 148, 'accountmanager@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 02:36:47', '2024-10-25 02:36:47', NULL),
(38, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 02:44:26', '2024-10-25 02:44:26', NULL),
(39, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 04:03:47', '2024-10-25 04:03:47', NULL),
(40, 146, 'rakeshmandal@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 05:40:38', '2024-10-25 05:40:38', NULL),
(41, 159, 'teammembertest@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 07:31:28', '2024-10-25 07:31:28', NULL),
(42, 160, 'newteam@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 07:41:22', '2024-10-25 07:41:22', NULL),
(43, 146, 'rakeshmandal@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 07:47:05', '2024-10-25 07:47:05', NULL),
(44, 148, 'accountmanager@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 07:47:34', '2024-10-25 07:47:34', NULL),
(45, 158, 'tlfrommanager@gmail.com', '::1', NULL, NULL, 1, '2024-10-25 07:48:46', '2024-10-25 07:48:46', NULL),
(46, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-27 23:09:50', '2024-10-27 23:09:50', NULL),
(47, 164, 'koushalanisahil@gmail.com', '::1', NULL, NULL, 1, '2024-10-28 00:39:01', '2024-10-28 00:39:01', NULL),
(48, 169, 'arorarakesh@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-28 00:47:36', '2024-10-28 00:47:36', NULL),
(49, 173, 'padeyabhishek@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-28 02:25:35', '2024-10-28 02:25:35', NULL),
(50, 164, 'koushalanisahil@gmail.com', '::1', NULL, NULL, 1, '2024-10-28 04:43:54', '2024-10-28 04:43:54', NULL),
(51, 176, 'yadavyogesh@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-28 06:24:39', '2024-10-28 06:24:39', NULL),
(52, 175, 'sharmaprashant@gmail.com', '::1', NULL, NULL, 1, '2024-10-28 07:03:20', '2024-10-28 07:03:20', NULL),
(53, 175, 'sharmaprashant@gmail.com', '::1', NULL, NULL, 1, '2024-10-28 07:13:03', '2024-10-28 07:13:03', NULL),
(54, 1, 'anil1.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-28 23:05:36', '2024-10-28 23:05:36', NULL),
(55, 176, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-28 23:27:08', '2024-10-28 23:27:08', NULL),
(56, 176, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-28 23:27:53', '2024-10-28 23:27:53', NULL),
(57, 176, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-29 23:12:34', '2024-10-29 23:12:34', NULL),
(58, 1, 'anil1.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-29 23:12:48', '2024-10-29 23:12:48', NULL),
(59, 1, 'anil1.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-30 06:26:21', '2024-10-30 06:26:21', NULL),
(60, 176, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-10-30 07:18:57', '2024-10-30 07:18:57', NULL),
(61, 174, 'kumarvikash@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-10-30 07:20:33', '2024-10-30 07:20:33', NULL),
(62, 176, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-03 23:25:37', '2024-11-03 23:25:37', NULL),
(63, 1, 'anil1.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-03 23:26:03', '2024-11-03 23:26:03', NULL),
(64, 176, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-04 06:37:43', '2024-11-04 06:37:43', NULL),
(65, 1, 'anil1.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-04 06:37:57', '2024-11-04 06:37:57', NULL),
(66, 1, 'anil1.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-04 23:52:13', '2024-11-04 23:52:13', NULL),
(67, 176, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-06 02:42:34', '2024-11-06 02:42:34', NULL),
(68, 1, 'anil1.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-06 02:42:50', '2024-11-06 02:42:50', NULL),
(69, 176, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-06 02:53:15', '2024-11-06 02:53:15', NULL),
(70, 1, 'anil1.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-06 02:53:34', '2024-11-06 02:53:34', NULL),
(71, 176, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-07 00:26:06', '2024-11-07 00:26:06', NULL),
(72, 1, 'anil1.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-07 00:26:16', '2024-11-07 00:26:16', NULL),
(73, 176, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-07 02:50:26', '2024-11-07 02:50:26', NULL),
(74, 1, 'anil1.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-07 02:50:36', '2024-11-07 02:50:36', NULL),
(75, 164, 'koushalanisahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-07 04:53:10', '2024-11-07 04:53:10', NULL),
(76, 169, 'arorarakesh@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-07 05:14:49', '2024-11-07 05:14:49', NULL),
(77, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-09 02:26:25', '2024-11-09 02:26:25', NULL),
(78, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-09 06:38:27', '2024-11-09 06:38:27', NULL),
(79, 164, 'koushalanisahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-09 06:39:18', '2024-11-09 06:39:18', NULL),
(80, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-13 05:52:20', '2024-11-13 05:52:20', NULL),
(81, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-11-13 05:56:08', '2024-11-13 05:56:08', NULL),
(82, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-13 23:13:02', '2024-11-13 23:13:02', NULL),
(83, 164, 'koushalanisahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-13 23:17:55', '2024-11-13 23:17:55', NULL),
(84, 170, 'singhvickey@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-13 23:30:37', '2024-11-13 23:30:37', NULL),
(85, 164, 'koushalanisahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-14 01:28:35', '2024-11-14 01:28:35', NULL),
(86, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-14 01:58:18', '2024-11-14 01:58:18', NULL),
(87, 196, 'rahul@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-14 02:21:02', '2024-11-14 02:21:02', NULL),
(88, 195, 'yogest@gmail.com', '::1', NULL, NULL, 1, '2024-11-14 06:23:24', '2024-11-14 06:23:24', NULL),
(89, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-14 07:56:22', '2024-11-14 07:56:22', NULL),
(90, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-15 23:10:07', '2024-11-15 23:10:07', NULL),
(91, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-15 23:11:48', '2024-11-15 23:11:48', NULL),
(92, 196, 'rahul@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-15 23:13:05', '2024-11-15 23:13:05', NULL),
(93, 198, 'vikash@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-16 02:09:05', '2024-11-16 02:09:05', NULL),
(94, 213, 'tl1@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-16 02:46:02', '2024-11-16 02:46:02', NULL),
(95, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-16 10:56:38', '2024-11-16 10:56:38', NULL),
(96, 196, 'rahul@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-16 11:01:38', '2024-11-16 11:01:38', NULL),
(97, 199, 'amarjeet@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-16 11:05:14', '2024-11-16 11:05:14', NULL),
(98, 214, 'departmenthed1@gmail.com', '::1', NULL, NULL, 1, '2024-11-16 13:20:16', '2024-11-16 13:20:16', NULL),
(99, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-18 04:39:50', '2024-11-18 04:39:50', NULL),
(100, 193, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-18 05:18:29', '2024-11-18 05:18:29', NULL),
(101, 193, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-19 12:12:07', '2024-11-19 12:12:07', NULL),
(102, 1, 'anil1.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-19 12:12:21', '2024-11-19 12:12:21', NULL),
(103, 193, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-20 04:46:37', '2024-11-20 04:46:37', NULL),
(104, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-20 04:50:20', '2024-11-20 04:50:20', NULL),
(105, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-20 04:51:09', '2024-11-20 04:51:09', NULL),
(106, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-20 11:31:39', '2024-11-20 11:31:39', NULL),
(107, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-20 11:33:14', '2024-11-20 11:33:14', NULL),
(108, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-21 04:38:26', '2024-11-21 04:38:26', NULL),
(109, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-21 04:39:16', '2024-11-21 04:39:16', NULL),
(110, 196, 'rahul@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-21 04:40:16', '2024-11-21 04:40:16', NULL),
(111, 201, 'sachin@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-21 05:09:52', '2024-11-21 05:09:52', NULL),
(112, 209, 'member5@gmail.com', '::1', NULL, NULL, 1, '2024-11-21 05:19:00', '2024-11-21 05:19:00', NULL),
(113, 196, 'rahul@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-21 09:52:19', '2024-11-21 09:52:19', NULL),
(114, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-22 04:38:27', '2024-11-22 04:38:27', NULL),
(115, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-22 10:05:34', '2024-11-22 10:05:34', NULL),
(116, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-22 10:06:01', '2024-11-22 10:06:01', NULL),
(117, 196, 'rahul@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-22 10:22:22', '2024-11-22 10:22:22', NULL),
(118, 197, 'ajay@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-22 10:51:55', '2024-11-22 10:51:55', NULL),
(119, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-23 04:49:02', '2024-11-23 04:49:02', NULL),
(120, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-23 12:01:17', '2024-11-23 12:01:17', NULL),
(121, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-23 12:01:33', '2024-11-23 12:01:33', NULL),
(122, 211, 'member7@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-23 12:02:28', '2024-11-23 12:02:28', NULL),
(123, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-25 04:45:27', '2024-11-25 04:45:27', NULL),
(124, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-25 04:50:15', '2024-11-25 04:50:15', NULL),
(125, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-25 04:56:21', '2024-11-25 04:56:21', NULL),
(126, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-25 07:52:18', '2024-11-25 07:52:18', NULL),
(127, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-25 08:00:59', '2024-11-25 08:00:59', NULL),
(128, 216, 'sanhilchandra@gmail.com', '::1', NULL, NULL, 1, '2024-11-25 08:02:18', '2024-11-25 08:02:18', NULL),
(129, 217, 'sanhilchandra@gmail.com', '::1', NULL, NULL, 1, '2024-11-25 08:17:45', '2024-11-25 08:17:45', NULL),
(130, 219, 'kamal@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-25 08:26:36', '2024-11-25 08:26:36', NULL),
(131, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-26 04:39:10', '2024-11-26 04:39:10', NULL),
(132, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-26 09:39:06', '2024-11-26 09:39:06', NULL),
(133, 224, 'gdffghn@gmail.com', '::1', NULL, NULL, 1, '2024-11-26 13:33:16', '2024-11-26 13:33:16', NULL),
(134, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-27 04:40:24', '2024-11-27 04:40:24', NULL),
(135, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-27 11:16:47', '2024-11-27 11:16:47', NULL),
(136, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-27 13:17:07', '2024-11-27 13:17:07', NULL),
(137, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-27 13:32:11', '2024-11-27 13:32:11', NULL),
(138, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-27 13:33:31', '2024-11-27 13:33:31', NULL),
(139, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 04:55:43', '2024-11-28 04:55:43', NULL),
(140, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:02:03', '2024-11-28 06:02:03', NULL),
(141, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:02:51', '2024-11-28 06:02:51', NULL),
(142, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:03:25', '2024-11-28 06:03:25', NULL),
(143, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:03:52', '2024-11-28 06:03:52', NULL),
(144, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:04:30', '2024-11-28 06:04:30', NULL),
(145, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:05:21', '2024-11-28 06:05:21', NULL),
(146, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:06:12', '2024-11-28 06:06:12', NULL),
(147, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:08:30', '2024-11-28 06:08:30', NULL),
(148, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:08:56', '2024-11-28 06:08:56', NULL),
(149, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:10:02', '2024-11-28 06:10:02', NULL),
(150, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:12:59', '2024-11-28 06:12:59', NULL),
(151, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:13:50', '2024-11-28 06:13:50', NULL),
(152, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:17:14', '2024-11-28 06:17:14', NULL),
(153, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:17:26', '2024-11-28 06:17:26', NULL),
(154, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:19:20', '2024-11-28 06:19:20', NULL),
(155, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 06:21:15', '2024-11-28 06:21:15', NULL),
(156, 1, 'anil.digitaldesign@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-11-28 07:42:06', '2024-11-28 07:42:06', NULL),
(157, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-11-28 08:15:07', '2024-11-28 08:15:07', NULL),
(158, 1, 'anil.digitaldesign@gmail.com', '192.168.1.17', NULL, NULL, 1, '2024-11-28 09:49:14', '2024-11-28 09:49:14', NULL),
(159, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-11-28 12:24:36', '2024-11-28 12:24:36', NULL),
(160, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-11-29 04:46:19', '2024-11-29 04:46:19', NULL),
(161, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-11-29 04:46:31', '2024-11-29 04:46:31', NULL),
(162, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-11-29 12:41:38', '2024-11-29 12:41:38', NULL),
(163, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-12-02 06:19:00', '2024-12-02 06:19:00', NULL),
(164, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-02 06:25:48', '2024-12-02 06:25:48', NULL),
(165, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-12-02 09:43:22', '2024-12-02 09:43:22', NULL),
(166, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-02 10:50:18', '2024-12-02 10:50:18', NULL),
(167, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-12-03 10:51:21', '2024-12-03 10:51:21', NULL),
(168, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-03 10:56:21', '2024-12-03 10:56:21', NULL),
(169, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-12-06 06:54:07', '2024-12-06 06:54:07', NULL),
(170, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-12-07 04:47:22', '2024-12-07 04:47:22', NULL),
(171, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-07 06:38:01', '2024-12-07 06:38:01', NULL),
(172, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-09 12:18:23', '2024-12-09 12:18:23', NULL),
(173, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-12-09 13:14:14', '2024-12-09 13:14:14', NULL),
(174, 213, 'tl1@gmail.com', '::1', NULL, NULL, 1, '2024-12-09 13:32:24', '2024-12-09 13:32:24', NULL),
(175, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-10 04:44:02', '2024-12-10 04:44:02', NULL),
(176, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-12-10 09:35:52', '2024-12-10 09:35:52', NULL),
(177, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-10 10:51:25', '2024-12-10 10:51:25', NULL),
(178, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-12-10 11:05:21', '2024-12-10 11:05:21', NULL),
(179, 222, 'kamal@gmail.com', '::1', NULL, NULL, 1, '2024-12-10 11:24:45', '2024-12-10 11:24:45', NULL),
(180, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-12-11 04:45:39', '2024-12-11 04:45:39', NULL),
(181, 1, 'anil.digitaldesign@gmail.com', '192.168.1.7', NULL, NULL, 1, '2024-12-11 12:26:17', '2024-12-11 12:26:17', NULL),
(182, 1, 'anil.digitaldesign@gmail.com', '192.168.1.20', NULL, NULL, 1, '2024-12-12 05:25:36', '2024-12-12 05:25:36', NULL),
(183, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-12 05:27:15', '2024-12-12 05:27:15', NULL),
(184, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-12 10:32:17', '2024-12-12 10:32:17', NULL),
(185, 1, 'anil.digitaldesign@gmail.com', '192.168.1.20', NULL, NULL, 1, '2024-12-13 04:50:32', '2024-12-13 04:50:32', NULL),
(186, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-13 05:49:13', '2024-12-13 05:49:13', NULL),
(187, 217, 'sanhilchandra@gmail.com', '::1', NULL, NULL, 1, '2024-12-13 07:01:04', '2024-12-13 07:01:04', NULL),
(188, 211, 'member7@gmail.com', '::1', NULL, NULL, 1, '2024-12-13 07:05:51', '2024-12-13 07:05:51', NULL),
(189, 217, 'sanhilchandra@gmail.com', '::1', NULL, NULL, 1, '2024-12-13 07:59:32', '2024-12-13 07:59:32', NULL),
(190, 198, 'vikash@gmail.com', '::1', NULL, NULL, 1, '2024-12-13 11:12:27', '2024-12-13 11:12:27', NULL),
(191, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-14 04:45:32', '2024-12-14 04:45:32', NULL),
(192, 198, 'vikash@gmail.com', '::1', NULL, NULL, 1, '2024-12-14 06:37:33', '2024-12-14 06:37:33', NULL),
(193, 209, 'member5@gmail.com', '::1', NULL, NULL, 1, '2024-12-14 07:46:48', '2024-12-14 07:46:48', NULL),
(194, 213, 'tl1@gmail.com', '::1', NULL, NULL, 1, '2024-12-14 08:04:31', '2024-12-14 08:04:31', NULL),
(195, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-12-14 11:39:57', '2024-12-14 11:39:57', NULL),
(196, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-16 04:39:38', '2024-12-16 04:39:38', NULL),
(197, 201, 'sachin@gmail.com', '::1', NULL, NULL, 1, '2024-12-16 04:48:50', '2024-12-16 04:48:50', NULL),
(198, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-17 09:39:38', '2024-12-17 09:39:38', NULL),
(199, 198, 'vikash@gmail.com', '::1', NULL, NULL, 1, '2024-12-17 09:43:34', '2024-12-17 09:43:34', NULL),
(200, 211, 'member7@gmail.com', '::1', NULL, NULL, 1, '2024-12-17 09:44:09', '2024-12-17 09:44:09', NULL),
(201, 213, 'tl1@gmail.com', '::1', NULL, NULL, 1, '2024-12-17 09:44:32', '2024-12-17 09:44:32', NULL),
(202, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-12-17 10:45:04', '2024-12-17 10:45:04', NULL),
(203, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-18 04:42:42', '2024-12-18 04:42:42', NULL),
(204, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-12-18 04:45:52', '2024-12-18 04:45:52', NULL),
(205, 196, 'rahul@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-12-18 05:38:05', '2024-12-18 05:38:05', NULL),
(206, 199, 'amarjeet@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-12-18 05:49:27', '2024-12-18 05:49:27', NULL),
(207, 209, 'member5@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-12-18 08:01:13', '2024-12-18 08:01:13', NULL),
(208, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-19 05:12:27', '2024-12-19 05:12:27', NULL),
(209, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-19 06:02:53', '2024-12-19 06:02:53', NULL),
(210, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-20 04:36:19', '2024-12-20 04:36:19', NULL),
(211, 196, 'rahul@gmail.com', '::1', NULL, NULL, 1, '2024-12-20 06:48:23', '2024-12-20 06:48:23', NULL),
(212, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-12-20 08:24:03', '2024-12-20 08:24:03', NULL),
(213, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-21 04:44:04', '2024-12-21 04:44:04', NULL),
(214, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-12-21 04:50:29', '2024-12-21 04:50:29', NULL),
(215, 196, 'rahul@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-12-21 04:53:22', '2024-12-21 04:53:22', NULL),
(216, 207, 'testmkljkj@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-12-21 06:47:03', '2024-12-21 06:47:03', NULL),
(217, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-21 06:58:56', '2024-12-21 06:58:56', NULL),
(218, 204, 'fsadfkjl@gmail.com', '::1', NULL, NULL, 1, '2024-12-21 11:13:11', '2024-12-21 11:13:11', NULL),
(219, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-23 04:38:37', '2024-12-23 04:38:37', NULL),
(220, 201, 'sachin@gmail.com', '::1', NULL, NULL, 1, '2024-12-23 05:10:05', '2024-12-23 05:10:05', NULL),
(221, 196, 'rahul@gmail.com', '::1', NULL, NULL, 1, '2024-12-23 05:27:17', '2024-12-23 05:27:17', NULL),
(222, 193, 'sahil@gmail.com', '127.0.0.1', NULL, NULL, 1, '2024-12-23 05:43:11', '2024-12-23 05:43:11', NULL),
(223, 196, 'rahul@gmail.com', '192.168.1.20', NULL, NULL, 1, '2024-12-23 06:28:54', '2024-12-23 06:28:54', NULL),
(224, 1, 'anil.digitaldesign@gmail.com', '192.168.1.20', NULL, NULL, 1, '2024-12-23 06:38:22', '2024-12-23 06:38:22', NULL),
(225, 196, 'rahul@gmail.com', '192.168.1.20', NULL, NULL, 1, '2024-12-23 06:40:55', '2024-12-23 06:40:55', NULL),
(226, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-12-23 10:17:01', '2024-12-23 10:17:01', NULL),
(227, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-24 04:39:19', '2024-12-24 04:39:19', NULL),
(228, 193, 'sahil@gmail.com', '::1', NULL, NULL, 1, '2024-12-24 04:40:38', '2024-12-24 04:40:38', NULL),
(229, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-26 05:08:37', '2024-12-26 05:08:37', NULL),
(230, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-26 05:09:58', '2024-12-26 05:09:58', NULL),
(231, 209, 'member5@gmail.com', '::1', NULL, NULL, 1, '2024-12-26 11:02:47', '2024-12-26 11:02:47', NULL),
(232, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-27 04:54:25', '2024-12-27 04:54:25', NULL),
(233, 209, 'member5@gmail.com', '::1', NULL, NULL, 1, '2024-12-27 04:59:37', '2024-12-27 04:59:37', NULL),
(234, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-30 04:44:09', '2024-12-30 04:44:09', NULL),
(235, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2024-12-31 07:27:05', '2024-12-31 07:27:05', NULL),
(236, 1, 'anil.digitaldesign@gmail.com', '::1', NULL, NULL, 1, '2025-01-07 04:38:42', '2025-01-07 04:38:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `main_categories`
--

CREATE TABLE `main_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_categories`
--

INSERT INTO `main_categories` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Main Cat Testing One', 'Main Cat Testing Onesdds', 1, '2024-06-12 23:45:50', '2024-08-06 02:02:21'),
(2, 'Main Cat Testing  Two', 'Main Cat Testing Two', 1, '2024-06-12 23:46:19', '2024-06-12 23:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `main_folders`
--

CREATE TABLE `main_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_folders`
--

INSERT INTO `main_folders` (`id`, `name`, `department_type_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'IT (Information Technology)', 1, 1, '2024-08-13 11:52:48', '2024-12-17 12:45:26', NULL),
(2, 'Accounts', 2, 0, '2024-08-13 11:52:48', '2024-12-17 13:37:32', NULL),
(3, 'HR (Human Resources)', 3, 0, '2024-08-13 11:53:19', '2024-12-18 05:28:42', NULL),
(4, 'FO (Front Office)', 4, 1, '2024-08-13 11:53:50', '2024-08-13 11:53:50', NULL),
(5, 'F & BS (Food & Beverage Service)', 5, 1, '2024-08-13 11:54:00', '2024-12-17 12:44:59', NULL),
(6, 'HK (House Keeping)', 6, 1, '2024-08-13 11:54:19', '2024-08-13 11:54:19', NULL),
(7, 'F & BP (Food and Beverage Production)', 7, 1, '2024-08-13 11:54:35', '2024-08-13 11:54:35', NULL),
(8, 'Engineering', 8, 1, '2024-08-13 11:54:57', '2024-08-13 11:54:57', NULL),
(9, 'Store Purchase', 9, 1, '2024-08-13 11:55:08', '2024-08-13 11:55:08', NULL),
(10, 'Security', 10, 1, '2024-08-13 11:55:24', '2024-08-13 11:55:24', NULL),
(11, 'Sales', 11, 1, '2024-08-13 11:55:48', '2024-08-13 11:55:48', NULL),
(12, 'Administration', 12, 1, '2024-08-13 11:55:48', '2024-12-18 05:36:55', NULL),
(13, 'Legal', 13, 1, '2024-08-13 11:56:25', '2024-08-13 11:56:25', NULL),
(14, 'MD', 14, 1, '2024-08-13 11:56:42', '2024-08-13 11:56:42', NULL),
(15, 'Owner', 15, 1, '2024-08-13 11:59:20', '2024-12-17 12:45:45', NULL),
(16, 'Cygnett', 16, 1, '2024-08-13 11:59:31', '2024-08-13 11:59:31', NULL),
(17, 'Unit GM', 17, 1, '2024-08-13 11:59:52', '2024-08-13 11:59:52', NULL),
(18, 'Corporate', 18, 1, '2024-08-13 12:00:05', '2024-12-17 12:31:37', NULL),
(19, 'Pre Opening', 19, 1, '2024-08-13 12:00:20', '2024-08-13 12:00:20', NULL),
(20, 'SOP', 20, 1, '2024-08-13 12:00:34', '2024-08-13 12:00:34', NULL),
(21, 'Omfowtech', 21, 1, '2024-08-13 12:00:51', '2024-08-13 12:00:51', NULL),
(37, 'Digital', 37, 1, '2024-09-25 10:55:47', '2024-12-18 06:29:17', NULL),
(38, 'HR (Human Resources)', 38, 1, '2024-09-26 05:46:52', '2024-09-26 05:46:52', NULL),
(39, 'playfield', 39, 1, '2024-09-26 05:49:04', '2024-09-26 05:49:04', NULL),
(66, 'Cygnett Testing', 66, 1, '2024-10-19 04:28:29', '2024-10-27 23:53:45', '2024-10-27 23:53:45'),
(67, 'test', 67, 1, '2024-10-30 00:14:50', '2024-10-30 00:15:09', '2024-10-30 00:15:09'),
(68, 'test', 68, 1, '2024-11-03 23:31:31', '2024-11-03 23:33:09', '2024-11-03 23:33:09'),
(69, 'test', 69, 1, '2024-11-25 07:16:52', '2024-11-25 07:18:13', '2024-11-25 07:18:13'),
(70, 'test', 70, 1, '2024-12-14 07:40:59', '2024-12-14 07:40:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `main_folder_permission_lists`
--

CREATE TABLE `main_folder_permission_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `main_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_folder_permission_lists`
--

INSERT INTO `main_folder_permission_lists` (`id`, `name`, `main_folder_id`, `department_type_id`, `group_name`, `group_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'IT (Information Technology)', 1, NULL, 'IT (Information Technology)', 1, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(2, 'Accounts', 2, NULL, 'Accounts', 2, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(3, 'HR (Human Resources)', 3, NULL, 'HR (Human Resources)', 3, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(4, 'FO (Front Office)', 4, NULL, 'FO (Front Office)', 4, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(5, 'F & BS (Food & Beverage Service)', 5, NULL, 'F & BS (Food & Beverage Service)', 5, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(6, 'HK (House Keeping)', 6, NULL, 'HK (House Keeping)', 6, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(7, 'F & BP (Food and Beverage Production)', 7, NULL, 'F & BP (Food and Beverage Production)', 7, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(8, 'Engineering', 8, NULL, 'Engineering', 8, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(9, 'Store Purchase', 9, NULL, 'Store Purchase', 9, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(10, 'Security', 10, NULL, 'Security', 10, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(11, 'Sales', 11, NULL, 'Sales', 11, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(12, 'Administration', 12, NULL, 'Administration', 12, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(13, 'Legal', 13, NULL, 'Legal', 13, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(14, 'MD', 14, NULL, 'MD', 14, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(15, 'Owner', 15, NULL, 'Owner', 15, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(16, 'Cygnett', 16, NULL, 'Cygnett', 16, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(17, 'Unit GM', 17, NULL, 'Unit GM', 17, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(18, 'Corporate', 18, NULL, 'Corporate', 18, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(19, 'Pre Opening', 19, NULL, 'Pre Opening', 19, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(20, 'SOP', 20, NULL, 'SOP', 20, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(21, 'Omfowtech', 21, NULL, 'Omfowtech', 21, 1, '2024-08-26 05:34:50', '2024-08-26 05:34:50', NULL),
(35, 'Digital', 37, NULL, '24', NULL, 1, '2024-09-25 10:55:47', '2024-09-25 10:55:47', NULL),
(36, 'HR (Human Resources)', 38, NULL, '24', NULL, 1, '2024-09-26 05:46:52', '2024-09-26 05:46:52', NULL),
(37, 'playfield', 39, NULL, '24', NULL, 1, '2024-09-26 05:49:04', '2024-09-26 05:49:04', NULL),
(64, 'Cygnett Testing', 66, NULL, '22', NULL, 1, '2024-10-19 04:28:29', '2024-10-27 23:53:45', '2024-10-27 23:53:45'),
(65, 'test', 67, NULL, '22', NULL, 1, '2024-10-30 00:14:50', '2024-10-30 00:15:09', '2024-10-30 00:15:09'),
(66, 'test', 68, NULL, '22', NULL, 1, '2024-11-03 23:31:31', '2024-11-03 23:33:09', '2024-11-03 23:33:09'),
(67, 'test', 69, NULL, '22', NULL, 1, '2024-11-25 07:16:52', '2024-11-25 07:18:13', '2024-11-25 07:18:13'),
(68, 'test', 70, NULL, '22', NULL, 1, '2024-12-14 07:40:59', '2024-12-14 07:40:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_check_lists`
--

CREATE TABLE `master_check_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `is_checked` tinyint(4) DEFAULT NULL COMMENT '0 = unchecked, 1 = checked',
  `make_model` varchar(255) DEFAULT NULL,
  `make_manufacture` varchar(255) DEFAULT NULL,
  `unit_location` varchar(255) DEFAULT NULL,
  `qty` varchar(255) DEFAULT NULL,
  `item_status` varchar(255) DEFAULT NULL COMMENT '1 = new, 2 = processing, 3 = complete',
  `remark` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL COMMENT 'group by category',
  `order` varchar(255) DEFAULT NULL COMMENT 'order number',
  `status` varchar(255) DEFAULT NULL COMMENT '0 = Inactive, 1 = Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_check_lists`
--

INSERT INTO `master_check_lists` (`id`, `category`, `category_id`, `item_name`, `is_checked`, `make_model`, `make_manufacture`, `unit_location`, `qty`, `item_status`, `remark`, `department_id`, `group_id`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Epabx', 1, 'PRI Line Connection / SIP', 1, 'Tata', '10 Channel', 'Delhi', '6', '1', 'testing', 1, '1', '1', '1', '2024-06-19 08:29:43', '2024-09-06 02:17:06'),
(2, 'Epabx', 1, 'IPBX', 1, 'Tata', 'Alkatel / NEC', 'Delhi', '2', '1', 'testing', 1, '1', '1', '1', '2024-06-19 08:31:10', '2024-09-06 02:17:06'),
(3, 'Epabx', 1, 'Epabx Main Unit Installation', 1, 'Tata', 'Alkatel / NEC', 'Delhi', '10', '1', 'testing', 1, '1', '1', '1', '2024-06-19 08:32:34', '2024-09-06 02:17:06'),
(4, 'Epabx', 1, 'Epabx Main 400 Pair Mdf Installation', 1, 'Crone Box', 'Crone Box', 'Delhi', '8', '1', 'testing', 1, '1', '1', '1', '2024-06-19 11:59:23', '2024-09-06 02:17:06'),
(5, 'Epabx', 1, 'Epabx Extension Testing At Each Floor', 1, 'Crone Box', 'Crone Box', 'Delhi', '5', '1', 'testing', 1, '1', '1', '1', '2024-06-19 11:59:43', '2024-09-06 02:17:06'),
(6, 'Epabx', 1, 'Digital Phones', 1, 'Tata', '6', 'Delhi', '4', '1', 'Reception-2,Gm Office,IRD,HK,MD OFFICE', 1, '1', '1', '1', '2024-06-19 11:59:57', '2024-09-06 02:17:06'),
(7, 'Epabx', 1, 'Guest Room Handsets', 1, 'Tata', '22', 'Delhi', '5', '1', 'DTPN0012 DOLPHY', 1, '1', '1', '1', '2024-06-19 12:00:13', '2024-09-06 02:17:06'),
(8, 'Epabx', 1, 'Guest Bath-Room Handsets', 1, 'Tata', '21', 'Delhi', '4', '1', 'DTPN0012 DOLPHY', 1, '1', '1', '1', '2024-06-19 12:00:28', '2024-09-06 02:17:06'),
(9, 'Epabx', 1, 'Epabx Points', 1, 'Tata', 'Alkatel / NEC', 'Dlhi', '5', '1', 'As per HOD', 1, '1', '1', '1', '2024-06-19 12:00:42', '2024-09-06 02:17:06'),
(10, 'Epabx', 1, 'Office Phone', 1, 'Tata', '10 Channel', 'Delhi', '9', '1', 'As per HOD', 1, '1', '1', '1', '2024-06-19 12:01:00', '2024-09-06 02:17:06'),
(11, 'Epabx', 1, 'Extenssion List And Programing', 1, 'Canon', 'Ip camera Minimum 2,4,5Mega Pixel', 'Delhi', '5', '1', 'testing', 1, '1', '1', '1', '2024-06-19 12:01:19', '2024-09-06 02:17:06'),
(12, 'CCTV', 2, 'Camera Installation', 1, 'Canon', 'Ip camera Minimum 2,4,5Mega Pixel', 'Delhi', '4', '1', 'testing', 1, '2', '2', '1', '2024-06-19 12:15:55', '2024-09-06 02:17:06'),
(13, 'CCTV', 2, 'Camera', 1, 'Canon', 'One 4 MP camera with Recoding system In Reception', 'Delhi', '5', '1', 'Testing', 1, '2', '2', '1', '2024-06-19 12:16:54', '2024-09-06 02:17:06'),
(14, 'CCTV', 2, 'NVR Encoder Installation', 1, 'Canon', 'NVR', 'Delhi', '7', '1', 'Testing', 1, '2', '2', '1', '2024-06-19 12:17:12', '2024-09-06 02:17:06'),
(15, 'CCTV', 2, 'Wiring', 1, 'Canon', 'One 4 MP camera with Recoding system In Reception', 'Delhi', '6', '1', 'Cp Plus / Hikvision', 1, '2', '2', '1', '2024-06-19 12:17:29', '2024-09-06 02:17:06'),
(16, 'CCTV', 2, 'Camera Display Screen', 1, 'Canon', 'As per Camera', 'Delhi', '12', '1', 'Hp/ CISCO', 1, '2', '2', '1', '2024-06-19 12:17:44', '2024-09-06 02:17:06'),
(17, 'CCTV', 2, '24 Port POE Switch', 1, 'Canon', 'As per Camera', 'Delhi', '6', '1', 'Hp/ CISCO', 1, '2', '2', '1', '2024-06-19 12:17:59', '2024-09-06 02:17:06'),
(18, 'CCTV', 2, '8 TB surveillance Hdd', 1, 'Canon', 'As per Camera', 'Delhi', '12', '1', 'Testing', 1, '2', '2', '1', '2024-06-19 12:18:13', '2024-09-06 02:17:06'),
(19, 'Sound System', 3, 'Speaker Installation', 1, 'Sony', '\"6W METAL GRILLE CEILING SPEAKER,BOSLBD0606\"', 'Delhi', '6', '1', 'Testing', 1, '3', '3', '1', '2024-06-19 12:20:01', '2024-09-06 02:17:06'),
(20, 'Sound System', 3, 'Amplifier Installation', 1, 'Sony', '\"PLENA all-in-one 180W Two Zone Mixer Amplifier\"', 'Delhi', '13', '1', 'Testing', 1, '3', '3', '1', '2024-06-19 12:21:17', '2024-09-06 02:17:06'),
(21, 'Sound System', 3, 'Volume Installation', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '19', '1', 'Testing', 1, '3', '3', '1', '2024-06-19 12:21:33', '2024-09-06 02:17:06'),
(22, 'Sound System', 3, 'Pen Drive', 1, 'Hp', 'HP', 'Delhi', '22', '1', 'Testing', 1, '3', '3', '1', '2024-06-19 12:21:51', '2024-09-06 02:17:06'),
(23, 'Sound System', 3, 'Racks', 1, 'Dell', 'Cisco/Dell', 'Delhi', '5', '1', 'Testing', 1, '3', '3', '1', '2024-06-19 12:22:05', '2024-09-06 02:17:06'),
(24, 'IT HARDWARE', 4, 'Laptop', 1, 'HP', 'M8420', 'Delhi', '2', '1', 'Testing', 1, '4', '4', '1', '2024-06-19 12:23:46', '2024-09-06 02:17:06'),
(25, 'IT HARDWARE', 4, 'Desktop', 1, 'Dell', 'Optiplex 3040', 'Delhi', '2', '1', 'Testing', 1, '4', '4', '1', '2024-06-19 12:24:36', '2024-09-06 02:17:06'),
(26, 'IT HARDWARE', 4, 'Colour Printer', 1, 'Canon', 'M44TY', 'Delhi', '5', '1', 'Testing', 1, '4', '4', '1', '2024-06-19 12:24:55', '2024-09-06 02:17:06'),
(27, 'IT HARDWARE', 4, 'Laser Printers All In One', 1, 'HP', 'M44TY', 'delhi', '2', '1', 'Testing', 1, '4', '4', '1', '2024-06-19 12:25:12', '2024-09-06 02:17:06'),
(28, 'IT HARDWARE', 4, 'Online UPS For CCTV,IPBX', 1, 'Hp', 'As per Load', 'Delhi', '5', '1', 'Testing', 1, '4', '4', '1', '2024-06-19 12:25:30', '2024-09-06 02:17:06'),
(29, 'IT HARDWARE', 4, 'Pos Printers', 1, 'Hp', 'As per Load', 'Delhi', '5', '1', 'Testing', 1, '4', '4', '1', '2024-06-19 12:25:44', '2024-09-06 02:17:06'),
(30, 'Networking', 5, 'Network Switches 24ports\n', 1, 'HP', 'Hp/CISCO', 'Delhi', '6', '1', 'Testing', 1, '5', '5', '1', '2024-06-19 12:27:15', '2024-09-06 02:17:06'),
(31, 'Networking', 5, 'Network Rack', 1, 'Cisco', 'Cisco/Dell', 'Delhi', '3', '1', 'Testing', 1, '5', '5', '1', '2024-06-19 12:28:12', '2024-09-06 02:17:06'),
(32, 'Networking', 5, 'Patch Panel', 1, 'Cisco', 'Cisco', 'Delhi', '5', '1', 'Testing', 1, '5', '5', '1', '2024-06-19 12:28:27', '2024-09-06 02:17:06'),
(33, 'Networking', 5, 'Patch Chords', 1, 'D-link', 'D-link', 'Delhi', '5', '1', 'Testing', 1, '5', '5', '1', '2024-06-19 12:28:41', '2024-09-06 02:17:06'),
(34, 'Networking', 5, 'Io Point Termination On Each Floor & Office', 1, 'D-link', 'D-link', 'Delhi', '3', '1', 'Testing', 1, '5', '5', '1', '2024-06-19 12:28:56', '2024-09-06 02:17:06'),
(35, 'Software', 6, 'Hotel Management Cloud Base Software Cygnett Cloud', 1, 'Hotels System', 'Hotels System', 'Delhi', '5', '1', 'Testing', 1, '6', '6', '1', '2024-06-19 12:31:55', '2024-09-06 02:17:06'),
(36, 'Software', 6, 'Cygnett Cloud PMS Installtion', 1, 'Hotels System', 'Hotels System', 'Delhi', '5', '1', 'Testing', 1, '6', '6', '1', '2024-06-19 12:32:30', '2024-09-06 02:17:06'),
(37, 'Software', 6, 'Anti Virus Software As Per user Quick Heal', 1, 'Quick Heal', 'As per System', 'Delhi', '5', '1', 'Testing', 1, '6', '6', '1', '2024-06-19 12:32:47', '2024-09-06 02:17:06'),
(38, 'Software', 6, 'Windows & Ms Office', 1, 'Quick Heal', 'As per System', 'Delhi', '2', '1', 'Testing', 1, '6', '6', '1', '2024-06-19 12:33:00', '2024-09-06 02:17:06'),
(39, 'Lised Line\r\n', 7, 'Lised Line', 1, 'D-link', 'Minimum 30 MBPS', 'Delhi', '6', '1', 'Testng', 1, '7', '7', '1', '2024-06-19 12:34:46', '2024-09-06 02:17:06'),
(40, 'Lised Line\n', 7, 'Wi-fi Hotspot Service Provider', 1, 'D-link', 'HSIA/ 24 Online', 'Delhi', NULL, '1', 'Pms Interface & Coupon Generator', 1, '7', '7', '1', '2024-06-19 12:35:27', '2024-09-06 02:17:06'),
(41, 'Lised Line\n', 7, 'Wi Fi Service Provider', 1, 'D-link', 'Microtek / Airpro', 'Delhi', NULL, '1', 'Testng', 1, '7', '7', '1', '2024-06-19 12:35:46', '2024-09-06 02:17:06'),
(42, 'Broadband', 8, 'Isp For Broadband', 1, 'D-link', '100 MBPS For Backup', 'Delhi', '6', '1', 'Testing', 1, '8', '8', '1', '2024-06-19 12:36:40', '2024-09-06 02:17:06'),
(43, 'Attendance System', 9, 'Wiring For Attendance System', 1, 'E9C ESSL', 'E9C ESSL', 'Delhi', '6', '1', 'E9C ESSL', 1, '9', '9', '1', '2024-06-19 12:37:25', '2024-09-06 02:17:06'),
(44, 'Attendance Systen', 9, 'Attendance System', 1, 'E9C ESSL', 'E9C ESSL', 'Delhi', '6', '1', 'Wi-FI,Fingerprint,RFID,Face', 1, '9', '9', '1', '2024-06-19 12:38:14', '2024-09-06 02:17:06'),
(45, 'Cable TV', 10, 'Setuptop box', 1, 'Tata Sky /Airtel Dish TV', 'Tata Sky /Airtel Dish TV', 'Delhi', '4', '1', 'Testing', 1, '10', '10', '1', '2024-06-19 12:39:28', '2024-09-06 02:17:06'),
(46, 'Cable TV', 10, 'connection in all rooms', 1, 'Airtel Dish TV', 'Airtel Dish TV', 'Delhi', '4', '1', 'Testing', 1, '10', '10', '1', '2024-06-19 12:40:57', '2024-09-06 02:17:06'),
(47, 'PA System', 11, 'Mic Amplifire', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '6', '1', 'Testing', 1, '11', '11', '1', '2024-06-19 12:42:59', '2024-09-06 02:17:06'),
(48, 'PA System', 11, 'Wiring For Hooter', 1, 'BOSCH', 'BOSCH Plena 180W 18IN with USB and 23700 FM+2 Zone', 'Delhi', '12', '1', 'Testing', 1, '11', '11', '1', NULL, '2024-09-06 02:17:06'),
(49, 'E-Mail For All Department', 12, 'G-suite Cygnett Email I\'d as per user', 1, 'Gmail', 'As per User', 'Delhi', '6', '1', 'Testing', 1, '12', '12', '1', '2024-06-19 12:44:32', '2024-09-06 02:17:06'),
(50, 'Computer Security', 13, 'Firwall', 1, 'Cisco / SoPhos', 'Cisco / SoPhos', 'Delhi', '3', '1', 'Testing', 1, '13', '13', '1', '2024-06-19 12:46:34', '2024-09-06 02:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `permission_name` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `controller_name` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `parent_menu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `display_name`, `description`, `url`, `permission_name`, `method`, `controller_name`, `function`, `route_name`, `icon`, `order`, `parent_menu_id`, `group_id`, `group_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'View', 'Dashboard', 'admin/dashboard', 'view_dashboard', 'get', 'DashboardController', 'dashboard', 'dashboard', NULL, 1, NULL, 1, 'Dashboard', 0, '2024-06-12 12:48:30', '2024-06-12 12:48:30'),
(2, 'Main Category ', 'View List', 'Main Category ', 'admin/main-category', 'view_main_category_list', 'get', 'MainCategoryController', 'index', 'backend.main_category.index', NULL, 2, NULL, 2, 'Main Category', 0, '2024-06-12 13:00:18', '2024-06-12 13:00:18'),
(3, 'Main Category Edit', 'Edit', 'Main Category Edit', 'admin/main-category/edit/{id}', 'edit_main_category', 'get', 'MainCategoryController', 'edit', 'backend.main_category.edit', NULL, 3, 2, 2, 'Main Category', 0, '2024-06-12 13:14:18', '2024-06-12 13:14:18'),
(4, 'Main Category Store', 'Store', 'Main Category Store', 'admin/main-category/store', 'store_main_category', 'post', 'MainCategoryController', 'store', 'backend.main_category.store', NULL, 4, 2, 2, 'Main Category', 0, '2024-06-12 13:16:18', '2024-06-12 13:16:18'),
(5, 'Main category Update', 'Update', 'Main category Update', 'admin/main-category/update/{id}', 'update_main_category', 'post', 'MainCategoryController', 'update', 'backend.main_category.update', NULL, 5, 2, 2, 'Main Category', 0, '2024-06-12 13:20:11', '2024-06-12 13:20:11'),
(6, 'Main Category Delete', 'Delete', 'Main Category Delete', 'admin/main-category/delete/{id}', 'delete_main_category', 'get', 'MainCategoryController', 'destroy', 'backend.main_category.delete', NULL, 6, 2, 2, 'Main Category', 0, '2024-06-12 13:21:52', '2024-06-12 13:21:52'),
(7, 'Main Category Change Status', 'Change Status', 'Main Category Change Status', 'admin/main-category/update-status', 'change_main_category_status', 'get', 'MainCategoryController', 'updateStatus', 'backend.main_category.update_status', NULL, 7, 2, 2, 'Main Category', 0, '2024-06-12 13:21:52', '2024-06-12 13:21:52'),
(8, 'Sub Category List', 'View List', 'Sub Category List', 'admin/sub-category', 'View Sub Category List', 'get', 'SubCategoryController', 'index', 'backend.sub_category.index', NULL, NULL, NULL, 3, 'Sub Category', 0, '2024-06-14 01:01:52', '2024-06-14 01:01:52'),
(9, 'Sub Category Edit', 'Edit', 'Sub Category Edit', 'admin/sub-category/edit/{id}', 'Edit Sub Category', 'get', 'SubCategoryController', 'edit', 'backend.sub_category.edit', NULL, NULL, 8, 3, 'Sub Category', 0, '2024-06-14 01:04:17', '2024-06-14 01:04:17'),
(10, 'Sub Category Store', 'Store', 'Sub Category Store', 'admin/sub-category/store', 'store_sub_category', 'post', 'SubCategoryController', 'store', 'backend.sub_category.store', NULL, NULL, 8, 3, 'Sub Category', 0, '2024-06-14 01:09:56', '2024-06-14 01:09:56'),
(11, 'Sub Category Update', 'Update', 'Sub Category Update', 'admin/sub-category/update/{id}', 'update_sub_category', 'post', 'SubCategoryController', 'update', 'backend.sub_category.update', NULL, NULL, 8, 3, 'Sub Category', 0, '2024-06-14 01:10:55', '2024-06-14 01:10:55'),
(12, 'Sub Category Delete', 'Delete', 'Sub Category Delete', 'admin/sub-category/delete', 'delete_sub_category', 'get', 'SubCategoryController', 'destroy', 'backend.sub_category.delete', NULL, NULL, 8, 3, 'Sub Category', 0, '2024-06-14 01:11:47', '2024-06-14 01:11:47'),
(13, 'Sub Category Change Status', 'Change Status', 'Sub Category Change Status', 'admin/sub-category/update-status', 'change_sub_category_status', 'get', 'SubCategoryController', 'updateStatus', 'backend.sub_category.update_status', NULL, NULL, 8, 3, 'Sub Category', 0, '2024-06-14 01:12:47', '2024-06-14 01:12:47'),
(14, 'Document List', 'View All', 'Document List', 'admin/document', 'view_document_list', 'get', NULL, NULL, 'backend.document.index', NULL, NULL, NULL, 4, 'Document', 0, '2024-06-14 01:16:23', '2024-06-14 01:16:23'),
(15, 'Add New Document', 'Create', 'Add New Document', 'admin/document/create', 'create_document', 'get', NULL, NULL, 'backend.document.create', NULL, NULL, 14, 4, 'Document', 0, '2024-06-14 01:17:10', '2024-06-14 01:17:10'),
(17, 'Edit Document', 'Edit', 'Edit Document', 'admin/document/edit/{id}', 'edit_document', 'get', NULL, NULL, 'backend.document.edit', NULL, NULL, 14, 4, 'Document', 0, '2024-06-14 01:18:54', '2024-06-14 01:18:54'),
(20, 'Delete Document', 'Delete', 'Delete Document', 'admin/document/delete/{id}', 'delete_document', 'get', NULL, NULL, 'backend.document.delete', NULL, NULL, 14, 4, 'Document', 0, '2024-06-14 01:22:36', '2024-06-14 01:22:36'),
(21, 'View Document', 'View', 'View one document', 'admin/document/{id}', 'view_document', 'get', NULL, NULL, 'backend.document.view', NULL, NULL, 14, 4, 'Document', 0, '2024-06-14 01:23:20', '2024-06-14 01:23:20'),
(22, 'Comment On Document', 'Comment', 'Comment on document', 'admin/document/comment/{id}', 'comment_on_document', 'post', NULL, NULL, 'backend.document.comment', NULL, NULL, 14, 4, 'Document', 0, '2024-06-14 01:24:59', '2024-06-14 01:24:59'),
(23, 'Download Document', 'Download', 'Download Document', 'admin/document/download', 'download_document', 'get', NULL, NULL, 'backend.document.download', NULL, NULL, 14, 4, 'Document', 0, '2024-06-14 01:25:39', '2024-06-14 01:25:39'),
(38, 'View Department List', 'View All', 'View All Department List', 'admin/department', 'view_department_list', NULL, NULL, NULL, 'backend.department.index', NULL, NULL, NULL, 7, 'Department', 1, '2024-06-14 02:27:13', '2024-06-14 02:27:13'),
(39, 'Create Department', 'Create', 'Create Department', 'admin/department/create', 'create_department', NULL, NULL, NULL, 'backend.department.create', NULL, NULL, NULL, 7, 'Department', 0, '2024-06-14 02:28:29', '2024-06-14 02:28:29'),
(41, 'Edit Department', 'Edit', 'Edit Department', 'admin/department/edit/{id}', 'edit_department', NULL, NULL, NULL, 'backend.department.edit', NULL, NULL, NULL, 7, 'Department', 0, '2024-06-14 02:32:46', '2024-06-14 02:32:46'),
(43, 'Delete Department', 'Delete', 'Delete Department', 'admin/department/delete/{id}', 'delete_department', NULL, NULL, NULL, 'backend.department.delete', NULL, NULL, NULL, 7, 'Department', 0, '2024-06-14 02:34:18', '2024-06-14 02:34:18'),
(52, 'View Master Check List', 'View List', 'View Master Check List', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 'Master Check List', 0, '2024-06-22 01:34:03', '2024-06-22 01:34:03'),
(53, 'Edit Master Check List', 'Edit', 'Edit Master Check List', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 'Master Check List', 0, '2024-06-22 01:39:17', '2024-06-22 01:39:17'),
(54, 'Assign Master Check List', 'Assign', 'Assign Master Check List', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 'Master Check List', 0, '2024-06-22 01:39:27', '2024-06-22 01:39:27'),
(55, 'View Assigned Check List', 'View List', 'View Assigned Check List', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 'Assigned Check List', 0, '2024-06-22 01:46:34', '2024-06-22 01:46:34'),
(56, 'Edit Assigned Check List', 'Edit', 'Edit Assigned Check List', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 'Assigned Check List', 0, '2024-06-22 01:47:58', '2024-06-22 01:47:58'),
(57, 'Update Assigned Check List', 'Update', 'Update Assigned Check List', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 'Assigned Check List', 0, '2024-06-22 01:48:11', '2024-06-22 01:48:11'),
(58, 'Folder View', 'View List', 'Folder View', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 'Folder', NULL, '2024-10-18 11:24:56', '2024-10-18 11:25:00'),
(59, 'Folder Create', 'Create', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 'Folder', 1, '2024-10-18 11:24:46', '2024-10-18 11:24:52'),
(65, 'Folder Create', 'Delete', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 'Folder', 1, '2024-10-18 11:24:37', '2024-10-18 11:24:42');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_29_045621_create_permission_tables', 2),
(7, '2024_06_06_072409_add_column_in_users', 3),
(8, '2024_06_08_045434_create_main_categories_table', 4),
(9, '2024_06_08_100436_create_sub_categories_table', 5),
(11, '2024_06_11_061646_create_role_types_table', 7),
(12, '2024_06_12_062334_add_column_in_users', 8),
(13, '2024_06_12_073852_add_column_in_users', 9),
(14, '2024_06_12_082151_create_hotels_table', 10),
(15, '2024_06_12_110111_create_documents_table', 11),
(16, '2024_06_12_123242_create_menus_table', 12),
(17, '2024_06_12_130519_add_column_in_menus', 13),
(19, '2024_06_13_052326_add_column_in_menus', 14),
(20, '2024_06_13_053759_create_user_permissions_table', 15),
(21, '2024_06_13_115449_remove_column_from_users', 16),
(22, '2024_06_15_052919_addd_column_in_menus', 17),
(23, '2024_06_18_074834_create_departments_table', 18),
(24, '2024_06_19_063002_add_column_in_users', 19),
(25, '2024_06_19_080823_create_master_check_lists_table', 20),
(26, '2024_06_19_082700_add_column_in_master_check_lists', 21),
(27, '2024_06_20_122221_create_check_list_information_table', 22),
(28, '2024_06_20_124841_create_assigned_check_lists_table', 23),
(29, '2024_06_21_070513_add_column_in_check_list_information', 24),
(30, '2024_07_24_110950_create_folders_table', 25),
(31, '2024_07_31_070011_create_department_types_table', 26),
(32, '2024_07_31_071710_rename_column_in_users', 27),
(33, '2024_07_31_081403_create_user_hierarchies_table', 28),
(34, '2024_07_31_121019_rename_column_in_folders', 29),
(35, '2024_08_06_080924_create_folder_permissions_table', 30),
(36, '2024_08_13_113228_create_main_folders_table', 31),
(37, '2024_08_13_114906_create_sub_folders_table', 32),
(38, '2024_08_23_130321_add_column_in_documents', 33),
(39, '2024_08_26_051023_add_column_in_documents', 34),
(40, '2024_08_26_072904_add_column_in_folder_permissions', 35),
(41, '2024_08_26_080700_rename_folder_permissions_to_folder_permission_lists', 36),
(42, '2024_08_26_094209_create_user_folder_permissions_table', 37),
(43, '2024_08_26_104334_create_main_folder_permission_lists_table', 38),
(44, '2024_08_26_110539_create_user_main_folder_permission_lists_table', 39),
(45, '2024_08_26_111002_create_user_main_folder_permissions_table', 40),
(46, '2024_09_03_074042_add_column_in_documents', 41),
(48, '2024_09_04_072722_create_document_comments_table', 42),
(50, '2024_09_12_100638_create_document_permissions_table', 43),
(51, '2024_09_13_063238_add_column_in_documents', 44),
(52, '2024_09_13_083017_create_publicly_shared_documents_table', 45),
(53, '2024_09_14_045038_create_file_upload_permissions_table', 46),
(54, '2024_09_14_051855_add_column_in_file_upload_permissions', 47),
(55, '2024_09_16_064828_add_deleted_at_field_to_documents', 48),
(56, '2024_09_21_100450_add_column_in_user_main_folder_permissions', 49),
(57, '2024_09_21_110652_add_column_in_user_folder_permissions', 50),
(58, '2024_09_23_053447_create_tasks_table', 51),
(59, '2024_09_23_102703_add_column_in_tasks', 52),
(61, '2024_09_24_054047_create_notifications_table', 54),
(62, '2024_09_24_093547_add_column_in_notifications', 55),
(63, '2024_09_24_113234_add_column_in_publicly_shared_documents', 56),
(64, '2024_09_24_122329_create_login_audits_table', 57),
(66, '2024_09_24_132004_create_document_audits_table', 58),
(67, '2024_09_26_074331_add_deleted_at_field_to_department_types', 59),
(68, '2024_09_26_074832_add_deleted_at_field_to_users', 60),
(69, '2024_09_26_121243_add_deleted_at_field_to_sub_folders', 61),
(70, '2024_09_26_121425_add_deleted_at_field_to_main_folders', 62),
(71, '2024_09_26_121638_add_deleted_at_field_to_main_folder_permission_lists', 63),
(72, '2024_09_26_124339_add_deleted_at_field_to_folder_permission_lists', 64),
(73, '2024_10_17_050605_add_column_in_department_types', 65),
(74, '2024_10_18_052936_rename_table_name', 66),
(75, '2024_10_18_061437_rename_table_name', 67),
(77, '2024_10_19_045132_create_units_table', 68),
(78, '2024_10_19_070934_add_column_in_users', 69),
(79, '2024_10_21_101240_add_column_in_documents', 70),
(80, '2024_10_23_104708_add_column_in_users', 71),
(81, '2024_10_24_064855_add_column_in_users', 72),
(82, '2024_10_25_065906_add_column_in_users', 73),
(83, '2024_10_29_093651_add_column_in_document_permissions', 74),
(84, '2024_10_30_055721_create_states_table', 75),
(85, '2024_10_30_055734_create_cities_table', 75),
(86, '2024_10_30_070635_add_column_in_units', 76),
(87, '2024_09_23_125930_add_column_in_document_comments', 77),
(88, '2024_11_16_075414_add_column_in_tasks', 77),
(90, '2024_12_13_155118_add_column_in_units', 78),
(91, '2024_12_17_164300_add_column_in_main_folders', 79),
(92, '2024_12_18_103411_add_column_in_sub_folders', 80),
(93, '2024_12_19_124939_add_column_in_document_audits', 81),
(94, '2024_12_26_155547_add_column_in_document_audits', 82);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `notification` text DEFAULT NULL,
  `notification_for` bigint(20) UNSIGNED DEFAULT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_id` bigint(20) UNSIGNED DEFAULT NULL,
  `url` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `read_status` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `notification`, `notification_for`, `task_id`, `document_id`, `url`, `icon`, `read_status`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(44, 40, 'New Login', 'Chaman Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-09-26 06:16:49', '2024-09-26 06:16:49', NULL),
(45, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-09-26 06:56:32', '2024-09-26 06:56:32', NULL),
(46, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-09-26 23:28:02', '2024-09-26 23:28:02', NULL),
(47, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-09-26 23:34:01', '2024-09-26 23:34:01', NULL),
(48, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-09-27 02:18:39', '2024-09-27 02:18:39', NULL),
(49, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-09-30 04:33:17', '2024-09-30 04:33:17', NULL),
(50, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-02 23:09:11', '2024-10-02 23:09:11', NULL),
(51, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-03 05:58:47', '2024-10-03 05:58:47', NULL),
(52, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-03 23:12:17', '2024-10-03 23:12:17', NULL),
(53, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-04 01:06:36', '2024-10-04 01:06:36', NULL),
(54, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-04 23:45:51', '2024-10-04 23:45:51', NULL),
(55, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-05 06:21:48', '2024-10-05 06:21:48', NULL),
(56, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-05 06:24:13', '2024-10-05 06:24:13', NULL),
(57, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-05 06:36:25', '2024-10-05 06:36:25', NULL),
(58, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-05 06:38:03', '2024-10-05 06:38:03', NULL),
(59, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-05 06:41:52', '2024-10-05 06:41:52', NULL),
(60, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-09 01:16:07', '2024-10-09 01:16:07', NULL),
(61, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-10 01:02:10', '2024-10-10 01:02:10', NULL),
(62, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-13 23:30:22', '2024-10-13 23:30:22', NULL),
(63, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-14 02:23:54', '2024-10-14 02:23:54', NULL),
(64, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-16 23:21:26', '2024-10-16 23:21:26', NULL),
(65, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-16 23:31:42', '2024-10-16 23:31:42', NULL),
(66, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-17 01:04:09', '2024-10-17 01:04:09', NULL),
(67, 92, 'New Login', 'Ankur Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-17 01:11:09', '2024-10-17 01:11:09', NULL),
(68, 92, 'New Login', 'Ankur Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-17 02:14:04', '2024-10-17 02:14:04', NULL),
(69, 100, 'New Login', 'Deepak Sahni Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-17 06:55:48', '2024-10-17 06:55:48', NULL),
(70, 101, 'New Login', 'Deepak Sahni Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-17 07:05:09', '2024-10-17 07:05:09', NULL),
(71, 101, 'New Login', 'Deepak Sahni Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-17 07:09:45', '2024-10-17 07:09:45', NULL),
(72, 102, 'New Login', 'TestDepartmentHead Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-17 07:56:22', '2024-10-17 07:56:22', NULL),
(73, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-17 23:13:04', '2024-10-17 23:13:04', NULL),
(74, 103, 'New Login', 'Test Department Head Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-17 23:16:08', '2024-10-17 23:16:08', NULL),
(75, 104, 'New Login', 'Test Department Head Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 01:09:39', '2024-10-18 01:09:39', NULL),
(76, 106, 'New Login', 'Test Department Head Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 02:16:41', '2024-10-18 02:16:41', NULL),
(77, 108, 'New Login', 'Test Department Head Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 02:53:42', '2024-10-18 02:53:42', NULL),
(78, 109, 'New Login', 'Test Department Head Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 04:21:45', '2024-10-18 04:21:45', NULL),
(79, 42, 'New Login', 'Daniel Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 04:36:12', '2024-10-18 04:36:12', NULL),
(80, 110, 'New Login', 'Test Department Head Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 04:58:12', '2024-10-18 04:58:12', NULL),
(81, 1, 'New Task Assigned', 'New Task Assigned', 110, 14, 45, 'http://localhost/dms/admin/task/view/eyJpdiI6IitaZlgyTlZvMm96OXNvcjZZMmNtVnc9PSIsInZhbHVlIjoiNVU2QmtLY2svOUhiZkNvYzVyNi9rUT09IiwibWFjIjoiZmE2NDYzN2I5OTJkNzFhZTE5MWUxOWRiNjY1NDk4OTBlM2RlZDE1NDA2MWEwMGM1ZTE5ZGFkNjA2ZmYxOTZlNyIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 05:15:51', '2024-10-18 05:15:51', NULL),
(82, 1, 'New Task Assigned', 'New Task Assigned', 110, 15, 46, 'http://localhost/dms/admin/task/view/eyJpdiI6ImphQk8rNXdVT0kzaUVpNGxlZk1BSHc9PSIsInZhbHVlIjoiWEtwMkszV0JiYjFSclZFVThrQ2EwUT09IiwibWFjIjoiMzIxM2I5YjY3MGQyYmNiZjFkZTQzMzVmOTRmMjc0N2IyNmFiOTU0ZjQ3NmE5MWQ2YzE5N2EzN2MxMmJmNWEzYSIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 05:17:00', '2024-10-18 05:17:00', NULL),
(83, 111, 'New Login', 'Test Department Head Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 05:47:54', '2024-10-18 05:47:54', NULL),
(84, 112, 'New Login', 'Test Department Head Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 06:29:46', '2024-10-18 06:29:46', NULL),
(85, 1, 'New Task Assigned', 'New Task Assigned', 112, 16, 48, 'http://localhost/dms/admin/task/view/eyJpdiI6Ilh6SzQ1RzMrVlN1UE4wdlVJSUcwYnc9PSIsInZhbHVlIjoiM0FBRjl6d2xQZExVOVZBbXV4V0tTdz09IiwibWFjIjoiZjdlMzZiYzkzOTM0MWQ4OTM2MGQzN2YyNzQ1Y2M5NGQzMDhhNTYzMzUwNjkyZWQ3ZjY4MGQ1YjM2MTJjZGEwYiIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 06:35:40', '2024-10-18 06:35:40', NULL),
(86, 116, 'New Login', 'Test Department Head Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 07:04:40', '2024-10-18 07:04:40', NULL),
(87, 117, 'New Login', 'Test Unit Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 07:06:04', '2024-10-18 07:06:04', NULL),
(88, 118, 'New Login', 'Test Department Head Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 07:18:46', '2024-10-18 07:18:46', NULL),
(89, 1, 'New Task Assigned', 'New Task Assigned', 118, 17, 50, 'http://localhost/dms/admin/task/view/eyJpdiI6IkVpcHNnVVV1UGlFeVAwc1g2aEY3eHc9PSIsInZhbHVlIjoiOWwwNm54TC9GQStsaTlIUjZuLzk5Zz09IiwibWFjIjoiNGRhMWQ4M2EwOThhZDFhMWIxMWUwNTI2NDJkOTY4NDdkZjIwMTZhZDRmOTYxNTQ2ZDM1MDhiYWYwM2YyYzgwMCIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 07:26:02', '2024-10-18 07:26:02', NULL),
(90, 119, 'New Login', 'Test Department Head Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 07:49:18', '2024-10-18 07:49:18', NULL),
(91, 120, 'New Login', 'test Unit Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 08:03:05', '2024-10-18 08:03:05', NULL),
(92, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 23:10:21', '2024-10-18 23:10:21', NULL),
(93, 119, 'New Login', 'Test Department Head Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-18 23:11:55', '2024-10-18 23:11:55', NULL),
(94, 122, 'New Login', 'vdgdfgdsg Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-19 02:40:21', '2024-10-19 02:40:21', NULL),
(95, 123, 'New Login', 'My Tesgin Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-19 02:42:50', '2024-10-19 02:42:50', NULL),
(96, 122, 'New Login', 'vdgdfgdsg Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-19 04:18:24', '2024-10-19 04:18:24', NULL),
(97, 123, 'New Login', 'My Tesgin Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-19 04:18:53', '2024-10-19 04:18:53', NULL),
(98, 124, 'New Login', 'Sujata De Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-19 04:30:17', '2024-10-19 04:30:17', NULL),
(99, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-20 23:11:56', '2024-10-20 23:11:56', NULL),
(100, 125, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-20 23:24:29', '2024-10-20 23:24:29', NULL),
(101, 128, 'New Login', 'IT Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-20 23:26:13', '2024-10-20 23:26:13', NULL),
(102, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-21 04:51:45', '2024-10-21 04:51:45', NULL),
(103, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-21 23:10:54', '2024-10-21 23:10:54', NULL),
(104, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-22 01:37:35', '2024-10-22 01:37:35', NULL),
(105, 128, 'New Login', 'IT Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-22 05:23:35', '2024-10-22 05:23:35', NULL),
(106, 1, 'New Task Assigned', 'New Task Assigned', 128, 18, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6IjVMRy9iLzc5TFNUNzI3eExlNWRwMnc9PSIsInZhbHVlIjoidGs5SHpONGpJZk1JYnNPbzRlenhsUT09IiwibWFjIjoiYjYzODk3NTFhMDVjZWEwMGY3ZjEzNzdjODNiZDI4YmE3YTRiN2NjZGRmZTZmNDkzYTg5ZWE5MTU3MTQ0YzBjMSIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-22 05:24:52', '2024-10-22 05:24:52', NULL),
(107, 1, 'New Task Assigned', 'New Task Assigned', 128, 19, 11, 'http://localhost/dms/admin/task/view/eyJpdiI6ImNmUkovZWJWWHh0T1RlSktzNXdFWEE9PSIsInZhbHVlIjoiL0YvOG5aZkJveE5JL2xBenFkWUlMdz09IiwibWFjIjoiMWQ4NjQyYzUxZjMxNzQwMmFmOTI2MGRhODM3NjQxNDc4NGM4YjJkNjBhYzcyMTlmZWU2NDg5YzlmNWNhMjNiZSIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-22 06:04:20', '2024-10-22 06:04:20', NULL),
(108, 1, 'New Task Assigned', 'New Task Assigned', 128, 20, 11, 'http://localhost/dms/admin/task/view/eyJpdiI6IkVSTGp0K0lKeldxeDg0ajJ6Q2ZuNHc9PSIsInZhbHVlIjoiSFRlTmd2dUNnQy9OV0NpamxVSW5RUT09IiwibWFjIjoiNjU5ZDgyMDBiZjNjOWY3MzgyNDE3YTNkY2M1Yjg5YjkxOTQwNzNmODc5NDFiYjg2ODJkZWRkODI3MWQxMjFkYiIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-22 06:07:25', '2024-10-22 06:07:25', NULL),
(109, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-22 08:09:30', '2024-10-22 08:09:30', NULL),
(110, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-22 23:11:49', '2024-10-22 23:11:49', NULL),
(111, 125, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-22 23:28:43', '2024-10-22 23:28:43', NULL),
(112, 129, 'New Login', 'Akash Oberoi Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-23 01:38:29', '2024-10-23 01:38:29', NULL),
(113, 131, 'New Login', 'Hello Testing Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-23 05:09:27', '2024-10-23 05:09:27', NULL),
(114, 125, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-23 06:18:17', '2024-10-23 06:18:17', NULL),
(115, 133, 'New Login', 'my testing Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-23 06:52:55', '2024-10-23 06:52:55', NULL),
(116, 135, 'New Login', 'New Manager Test Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-23 06:56:09', '2024-10-23 06:56:09', NULL),
(117, 136, 'New Login', 'klkjjkj Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-23 07:53:19', '2024-10-23 07:53:19', NULL),
(118, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-23 23:08:20', '2024-10-23 23:08:20', NULL),
(119, 137, 'New Login', 'Sanjay Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-23 23:18:51', '2024-10-23 23:18:51', NULL),
(120, 139, 'New Login', 'myusertest Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-23 23:31:39', '2024-10-23 23:31:39', NULL),
(121, 125, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-23 23:34:29', '2024-10-23 23:34:29', NULL),
(122, 140, 'New Login', 'Manger Test Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-23 23:45:26', '2024-10-23 23:45:26', NULL),
(123, 143, 'New Login', 'test Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-24 01:57:46', '2024-10-24 01:57:46', NULL),
(124, 147, 'New Login', 'Tarun Arora Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-24 02:07:51', '2024-10-24 02:07:51', NULL),
(125, 146, 'New Login', 'Rakesh Mandal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-24 02:08:29', '2024-10-24 02:08:29', NULL),
(126, 150, 'New Login', 'Sanhil Chandra Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-24 02:11:43', '2024-10-24 02:11:43', NULL),
(127, 149, 'New Login', 'IT Manager Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-24 05:48:15', '2024-10-24 05:48:15', NULL),
(128, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-24 23:15:54', '2024-10-24 23:15:54', NULL),
(129, 146, 'New Login', 'Rakesh Mandal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-24 23:28:52', '2024-10-24 23:28:52', NULL),
(130, 150, 'New Login', 'Sanhil Chandra Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-24 23:36:16', '2024-10-24 23:36:16', NULL),
(131, 148, 'New Login', 'Account Manager Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 00:50:36', '2024-10-25 00:50:36', NULL),
(132, 149, 'New Login', 'IT Manager Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 00:51:25', '2024-10-25 00:51:25', NULL),
(133, 148, 'New Login', 'Account Manager Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 02:31:18', '2024-10-25 02:31:18', NULL),
(134, 148, 'New Login', 'Account Manager Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 02:31:36', '2024-10-25 02:31:36', NULL),
(135, 148, 'New Login', 'Account Manager Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 02:31:49', '2024-10-25 02:31:49', NULL),
(136, 148, 'New Login', 'Account Manager Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 02:36:22', '2024-10-25 02:36:22', NULL),
(137, 148, 'New Login', 'Account Manager Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 02:36:47', '2024-10-25 02:36:47', NULL),
(138, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 02:44:26', '2024-10-25 02:44:26', NULL),
(139, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 04:03:47', '2024-10-25 04:03:47', NULL),
(140, 146, 'New Login', 'Rakesh Mandal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 05:40:38', '2024-10-25 05:40:38', NULL),
(141, 159, 'New Login', 'Team Member Test Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 07:31:28', '2024-10-25 07:31:28', NULL),
(142, 160, 'New Login', 'New Team Leader Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 07:41:22', '2024-10-25 07:41:22', NULL),
(143, 146, 'New Login', 'Rakesh Mandal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 07:47:05', '2024-10-25 07:47:05', NULL),
(144, 148, 'New Login', 'Account Manager Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 07:47:34', '2024-10-25 07:47:34', NULL),
(145, 158, 'New Login', 'Tl From Manager Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-25 07:48:46', '2024-10-25 07:48:46', NULL),
(146, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-27 23:09:50', '2024-10-27 23:09:50', NULL),
(147, 164, 'New Login', 'Sahil Koushlani Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-28 00:39:01', '2024-10-28 00:39:01', NULL),
(148, 169, 'New Login', 'Rakesh Arora Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-28 00:47:36', '2024-10-28 00:47:36', NULL),
(149, 173, 'New Login', 'Abhishek Pandey Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-28 02:25:35', '2024-10-28 02:25:35', NULL),
(150, 164, 'New Login', 'Sahil Koushlani Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-28 04:43:54', '2024-10-28 04:43:54', NULL),
(151, 176, 'New Login', 'Yogesh Yadav Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-28 06:24:39', '2024-10-28 06:24:39', NULL),
(152, 175, 'New Login', 'Prashant Sharma Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-28 07:03:20', '2024-10-28 07:03:20', NULL),
(153, 175, 'New Login', 'Prashant Sharma Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-28 07:13:03', '2024-10-28 07:13:03', NULL),
(154, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-28 23:05:36', '2024-10-28 23:05:36', NULL),
(155, 176, 'New Login', 'Yogesh Yadav Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-28 23:27:08', '2024-10-28 23:27:08', NULL),
(156, 176, 'New Login', 'Yogesh Yadav Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-28 23:27:53', '2024-10-28 23:27:53', NULL),
(157, 176, 'New Login', 'Yogesh Yadav Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-29 23:12:34', '2024-10-29 23:12:34', NULL),
(158, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-29 23:12:48', '2024-10-29 23:12:48', NULL),
(159, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-30 06:26:21', '2024-10-30 06:26:21', NULL),
(160, 176, 'New Login', 'Yogesh Yadav Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-30 07:18:57', '2024-10-30 07:18:57', NULL),
(161, 174, 'New Login', 'Vikash Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-10-30 07:20:33', '2024-10-30 07:20:33', NULL),
(162, 176, 'New Login', 'Yogesh Yadav Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-03 23:25:37', '2024-11-03 23:25:37', NULL),
(163, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-03 23:26:03', '2024-11-03 23:26:03', NULL),
(164, 176, 'New Login', 'Yogesh Yadav Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-04 06:37:43', '2024-11-04 06:37:43', NULL),
(165, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-04 06:37:57', '2024-11-04 06:37:57', NULL),
(166, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-04 23:52:13', '2024-11-04 23:52:13', NULL),
(167, 1, 'New Comment', 'Anil Kumar Commented', 128, 18, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6IlZUSTFLZ29JMzd6eE4zTDk4YXQrcnc9PSIsInZhbHVlIjoid1FNUFVuTmVONjYrVkZBcXBXa3h3dz09IiwibWFjIjoiZjgxNDJkZWUyNmRiNjNjYjYwMGM3NDFhMjQzYWRlYjRlNjhhYmNmYzUzNTMwODk1OWE3Yjc2ODExZDc1NDVhNCIsInRhZyI6IiJ9', '<i class=\"fa fa-comment\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-05 04:55:40', '2024-11-05 04:55:40', NULL),
(168, 176, 'New Login', 'Yogesh Yadav Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-06 02:42:34', '2024-11-06 02:42:34', NULL),
(169, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-06 02:42:50', '2024-11-06 02:42:50', NULL),
(170, 176, 'New Login', 'Yogesh Yadav Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-06 02:53:15', '2024-11-06 02:53:15', NULL),
(171, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-06 02:53:34', '2024-11-06 02:53:34', NULL),
(172, 176, 'New Login', 'Yogesh Yadav Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-07 00:26:06', '2024-11-07 00:26:06', NULL),
(173, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-07 00:26:16', '2024-11-07 00:26:16', NULL),
(174, 176, 'New Login', 'Yogesh Yadav Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-07 02:50:26', '2024-11-07 02:50:26', NULL),
(175, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-07 02:50:36', '2024-11-07 02:50:36', NULL),
(176, 164, 'New Login', 'Sahil Koushlani Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-07 04:53:10', '2024-11-07 04:53:10', NULL),
(177, 169, 'New Login', 'Rakesh Arora Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-07 05:14:49', '2024-11-07 05:14:49', NULL),
(178, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-09 02:26:25', '2024-11-09 02:26:25', NULL),
(179, 1, 'New Task Assigned', 'New Task Assigned', 164, 21, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6IldYTWZTQk0vbXNEOEVvSWNnUVZmY0E9PSIsInZhbHVlIjoiZW1iWE93eTBkc1hEclBPY1hSTldRdz09IiwibWFjIjoiYzkwMTliZDA2MjA3NzlkNTIzN2MwZWQzODIyYjI1N2Y0NWNiZGViZjM2YjllNGFmMGJkZDdlOGI3Y2Q0NGUwZSIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-09 02:27:17', '2024-11-09 02:27:17', NULL),
(180, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-09 06:38:27', '2024-11-09 06:38:27', NULL),
(181, 164, 'New Login', 'Sahil Koushlani Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-09 06:39:18', '2024-11-09 06:39:18', NULL),
(182, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-13 05:52:20', '2024-11-13 05:52:20', NULL),
(183, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-13 05:56:08', '2024-11-13 05:56:08', NULL),
(184, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-13 23:13:02', '2024-11-13 23:13:02', NULL),
(185, 164, 'New Login', 'Sahil Koushlani Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-13 23:17:55', '2024-11-13 23:17:55', NULL),
(186, 170, 'New Login', 'Vicky Singh Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-13 23:30:36', '2024-11-13 23:30:36', NULL),
(187, 164, 'New Login', 'Sahil Koushlani Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-14 01:28:35', '2024-11-14 01:28:35', NULL),
(188, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-14 01:58:18', '2024-11-14 01:58:18', NULL),
(189, 196, 'New Login', 'Rahul Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-14 02:21:02', '2024-11-14 02:21:02', NULL),
(190, 195, 'New Login', 'Yogesh Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-14 06:23:24', '2024-11-14 06:23:24', NULL),
(191, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-14 07:56:22', '2024-11-14 07:56:22', NULL),
(192, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-15 23:10:07', '2024-11-15 23:10:07', NULL),
(193, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-15 23:11:48', '2024-11-15 23:11:48', NULL),
(194, 196, 'New Login', 'Rahul Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-15 23:13:05', '2024-11-15 23:13:05', NULL),
(195, 198, 'New Login', 'Vikash Sharma Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-16 02:09:05', '2024-11-16 02:09:05', NULL),
(196, 213, 'New Login', 'Test Tl One Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-16 02:46:02', '2024-11-16 02:46:02', NULL),
(197, 1, 'New Task Assigned', 'New Task Assigned', 193, 22, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6ImJDZUh3MW9KakMxZ0liVWJkN3l4dEE9PSIsInZhbHVlIjoibmxnQVFQSXdkQWZXUE02ZXhMTkZMUT09IiwibWFjIjoiYjI2MGFiY2E4NDg1ODY0NGJhYWJkOWZkOTU4YTIwYWFjYTYyMmJkYjk5MWY1Yjk4OGY1NWVjOTAzZDZlNzQwYiIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-16 02:48:51', '2024-11-16 02:48:51', NULL),
(198, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-16 10:56:38', '2024-11-16 10:56:38', NULL),
(199, 196, 'New Login', 'Rahul Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-16 11:01:38', '2024-11-16 11:01:38', NULL),
(200, 199, 'New Login', 'Amarjeet Singh Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-16 11:05:14', '2024-11-16 11:05:14', NULL),
(201, 1, 'New Task Assigned', 'New Task Assigned', 193, 23, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6InRQdnlJcVVCS3V6Lzc3RzlvQ0ZuV0E9PSIsInZhbHVlIjoicnpNQzZTc3d3ZWVWa0VYWHEzZEF1Zz09IiwibWFjIjoiM2NhNzc4YjM3MjU0MTliY2QwMjZhNzlmZjEyODY0YzNhNjc5ODk0ZWU4NjMxNGU1YWYyNjA2NjVhYjU3YjY0NyIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-16 12:29:36', '2024-11-16 12:29:36', NULL),
(202, 196, 'New Task Assigned', 'New Task Assigned', 199, 24, 3, 'http://localhost/dms/admin/task/view/eyJpdiI6Ik9yaFVwdjNoeWV2QnFCUzZKSyttekE9PSIsInZhbHVlIjoibEJDQkZxTjNudVVxREtBOWc3dFJKUT09IiwibWFjIjoiZTRlMmQ5NDM1NDZhNDdkYmQzYTQxNWNkZWI1ODU4OTdlMDg4YWQ0MzUxM2I2ZjRjYmMxZDRlODRjZDc5MDkzYiIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-16 12:31:05', '2024-11-16 12:31:05', NULL),
(203, 214, 'New Login', 'Test Department Head One Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-16 13:20:16', '2024-11-16 13:20:16', NULL),
(204, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-18 04:39:50', '2024-11-18 04:39:50', NULL),
(205, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-18 05:18:29', '2024-11-18 05:18:29', NULL),
(206, 1, 'New Task Assigned', 'New Task Assigned', 193, 25, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6IlNPVTJsOXdBZlpPTXR1czJ1MVF6SkE9PSIsInZhbHVlIjoiNG96eDYrbkxlRnc1OWxCbUdwNWVLUT09IiwibWFjIjoiNGRkYTM1NzlmZmNiNzNiZDc2Yjg3ZTVlN2IwODMwNzhiYTJkYzgzMjNhZWE2NWIxZDRmOGZiMzc0YjViNzM0NCIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-18 05:19:02', '2024-11-18 05:19:02', NULL),
(207, 1, 'New Task Assigned', 'New Task Assigned', 193, 26, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6ImlON2VsRkFqRCs3alQvcUhwMkNhcUE9PSIsInZhbHVlIjoiZXBQWjhlSUxjYWtlNzMvRFBCdU5Bdz09IiwibWFjIjoiNDIxMGRhNWNjMmYyOTAzZWE0ZGUwZDI5ODgwOWRkYjA3Mzg5NWQ4NzQ0MDI4ZjgwNGQwMDViYTQyMzRkOGNiMyIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-18 05:42:37', '2024-11-18 05:42:37', NULL),
(208, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-19 12:12:07', '2024-11-19 12:12:07', NULL),
(209, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-19 12:12:21', '2024-11-19 12:12:21', NULL),
(210, 1, 'New Task Assigned', 'New Task Assigned', 193, 27, 2, 'http://localhost/dms/admin/task/view/eyJpdiI6InQ3eDVkbjlrYTNXRElXOXRKTXdYMVE9PSIsInZhbHVlIjoid2duZHJyNExmdW43aXlFWFVLMm9sZz09IiwibWFjIjoiYjg0YWNmYTNiYjYxMDkxY2E2Mzg1MzZjMjVjNGVlOTEzNGM5ZTJmMjhmM2I0YmIyMjUyYmYyZGEzMjljNTZkNiIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-19 12:12:44', '2024-11-19 12:12:44', NULL),
(211, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-20 04:46:37', '2024-11-20 04:46:37', NULL),
(212, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-20 04:50:20', '2024-11-20 04:50:20', NULL),
(213, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-20 04:51:09', '2024-11-20 04:51:09', NULL),
(214, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-20 11:31:39', '2024-11-20 11:31:39', NULL),
(215, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-20 11:33:14', '2024-11-20 11:33:14', NULL),
(216, 1, 'New Task Assigned', 'New Task Assigned', 193, 28, 20, 'http://localhost/dms/admin/task/view/eyJpdiI6Im5OK0FTRERUUjMxbTNndTNoRzlCeEE9PSIsInZhbHVlIjoiY3lIa3FqcHd2MklYUDJJVkpRTjBLQT09IiwibWFjIjoiZjQyMmVjNWIwM2I5ZjllYWU3MzhkN2VmYTM3MTk3MWYxMDRmOGViYTE4YjJjNDliMWFjYjg1ZjUwZGRmMTAzOCIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-20 12:47:44', '2024-11-20 12:47:44', NULL),
(217, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-21 04:38:26', '2024-11-21 04:38:26', NULL),
(218, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-21 04:39:16', '2024-11-21 04:39:16', NULL),
(219, 196, 'New Login', 'Rahul Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-21 04:40:16', '2024-11-21 04:40:16', NULL),
(220, 201, 'New Login', 'Sachin Negi Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-21 05:09:52', '2024-11-21 05:09:52', NULL),
(221, 209, 'New Login', 'Test Member Five Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-21 05:19:00', '2024-11-21 05:19:00', NULL),
(222, 196, 'New Login', 'Rahul Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-21 09:52:19', '2024-11-21 09:52:19', NULL),
(223, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-22 04:38:27', '2024-11-22 04:38:27', NULL),
(224, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-22 10:05:34', '2024-11-22 10:05:34', NULL),
(225, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-22 10:06:01', '2024-11-22 10:06:01', NULL),
(226, 196, 'New Login', 'Rahul Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-22 10:22:22', '2024-11-22 10:22:22', NULL),
(227, 197, 'New Login', 'Ajay Sigh Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-22 10:51:55', '2024-11-22 10:51:55', NULL),
(228, 1, 'New Task Assigned', 'New Task Assigned', 193, 29, 3, 'http://localhost/dms/admin/task/view/eyJpdiI6IlFqcmtBRWlKbTIxT01uUGxod3FIMnc9PSIsInZhbHVlIjoiVmlvOFk5TFlsbGplaTNGcks2VS9vQT09IiwibWFjIjoiY2M0NTgwN2IzZGQ3NDNkZDdkNjIwOWEzYmQ3NWZiM2VmMGVjNmU4YmMxOGY2YTViMzEzYTgyY2NmNThmZTc3MyIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-22 11:19:38', '2024-11-22 11:19:38', NULL),
(229, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-23 04:49:02', '2024-11-23 04:49:02', NULL),
(230, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-23 12:01:17', '2024-11-23 12:01:17', NULL),
(231, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-23 12:01:33', '2024-11-23 12:01:33', NULL),
(232, 211, 'New Login', 'Team Memebr Seven Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-23 12:02:28', '2024-11-23 12:02:28', NULL),
(233, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-25 04:45:27', '2024-11-25 04:45:27', NULL),
(234, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-25 04:50:15', '2024-11-25 04:50:15', NULL),
(235, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-25 04:56:21', '2024-11-25 04:56:21', NULL),
(236, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-25 07:52:18', '2024-11-25 07:52:18', NULL),
(237, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-25 08:00:59', '2024-11-25 08:00:59', NULL),
(238, 216, 'New Login', 'Sanhil Chandra Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-25 08:02:18', '2024-11-25 08:02:18', NULL),
(239, 217, 'New Login', 'Sanhil Chandra Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-25 08:17:45', '2024-11-25 08:17:45', NULL),
(240, 219, 'New Login', 'Kamal Murjani Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-25 08:26:36', '2024-11-25 08:26:36', NULL),
(241, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-26 04:39:10', '2024-11-26 04:39:10', NULL),
(242, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-26 09:39:06', '2024-11-26 09:39:06', NULL),
(243, 224, 'New Login', 'Test Tedfdf Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-26 13:33:16', '2024-11-26 13:33:16', NULL),
(244, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-27 04:40:24', '2024-11-27 04:40:24', NULL),
(245, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-27 11:16:47', '2024-11-27 11:16:47', NULL),
(246, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-27 13:17:07', '2024-11-27 13:17:07', NULL),
(247, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-27 13:32:11', '2024-11-27 13:32:11', NULL),
(248, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-27 13:33:31', '2024-11-27 13:33:31', NULL),
(249, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 04:55:43', '2024-11-28 04:55:43', NULL),
(250, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:02:03', '2024-11-28 06:02:03', NULL),
(251, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:02:51', '2024-11-28 06:02:51', NULL),
(252, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:03:25', '2024-11-28 06:03:25', NULL),
(253, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:03:52', '2024-11-28 06:03:52', NULL),
(254, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:04:30', '2024-11-28 06:04:30', NULL),
(255, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:05:21', '2024-11-28 06:05:21', NULL),
(256, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:06:12', '2024-11-28 06:06:12', NULL),
(257, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:08:30', '2024-11-28 06:08:30', NULL),
(258, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:08:56', '2024-11-28 06:08:56', NULL),
(259, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:10:02', '2024-11-28 06:10:02', NULL),
(260, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:12:59', '2024-11-28 06:12:59', NULL),
(261, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:13:50', '2024-11-28 06:13:50', NULL),
(262, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:17:14', '2024-11-28 06:17:14', NULL),
(263, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:17:26', '2024-11-28 06:17:26', NULL),
(264, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:19:20', '2024-11-28 06:19:20', NULL),
(265, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 06:21:15', '2024-11-28 06:21:15', NULL),
(266, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 07:42:06', '2024-11-28 07:42:06', NULL),
(267, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 08:15:07', '2024-11-28 08:15:07', NULL),
(268, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 09:49:14', '2024-11-28 09:49:14', NULL),
(269, 1, 'New Comment', 'Anil Kumar Commented', 128, 20, 11, 'http://localhost/dms/admin/task/view/eyJpdiI6IjY3MlNZaTVRc3RwTXA0VzRPNmJLR0E9PSIsInZhbHVlIjoidEFLNUdJNTU2Z2FyUis0ZkV3Qyt0dz09IiwibWFjIjoiYjU2Y2M0MzlmOGNhMDZlZTFkN2I2YWQ4NmNmYzA2Y2ZlNWM5ZTgyNjE2NTE5MzY1NmJmYjgzNGY1Nzg1MzgyNyIsInRhZyI6IiJ9', '<i class=\"fa fa-comment\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 12:18:41', '2024-11-28 12:18:41', NULL),
(270, 1, 'New Comment', 'Anil Kumar Commented', 128, 20, 11, 'http://localhost/dms/admin/task/view/eyJpdiI6IjhIL1pvQXBMMyt3RXlNazZQYy8xdnc9PSIsInZhbHVlIjoiT0pzTHhCRVpMaEl1SFF2ZnNRSUliQT09IiwibWFjIjoiOTZiYjgwYTc3N2JmMjgyYWMwOGU4NTJmMzc1NGQ3YmNiODA1MmM1YTZhYWQzZGUzNDNkNGNhZjllYWQ2MWUzMyIsInRhZyI6IiJ9', '<i class=\"fa fa-comment\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 12:18:49', '2024-11-28 12:18:49', NULL),
(271, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-28 12:24:36', '2024-11-28 12:24:36', NULL),
(272, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-29 04:46:19', '2024-11-29 04:46:19', NULL),
(273, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-29 04:46:31', '2024-11-29 04:46:31', NULL),
(274, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-11-29 12:41:38', '2024-11-29 12:41:38', NULL),
(275, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-02 06:19:00', '2024-12-02 06:19:00', NULL),
(276, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-02 06:25:48', '2024-12-02 06:25:48', NULL),
(277, 1, 'New Comment', 'Anil Kumar Commented', 128, 18, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6IkkrUldEYTUwWEpRQWdKQ3dGcTdRUFE9PSIsInZhbHVlIjoiUWVTbHlUQWdEcU9udm1BVklWK09Ldz09IiwibWFjIjoiY2ExZGYxYmFmYTIxNDA4ZjNhMDhkNzYzNjc5MGZmZWI0MzNiMmY1YzZmOGJmNGRhMTRiMGUxNzY4Y2I5MWU0NCIsInRhZyI6IiJ9', '<i class=\"fa fa-comment\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-02 06:53:16', '2024-12-02 06:53:16', NULL),
(278, 1, 'New Reply', 'Anil Kumar Reply on His Comment', 128, 18, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6IkMwVHRWdTBFeVpwMjc0WGxRNThSRlE9PSIsInZhbHVlIjoiV0ZlOGhrUE5vcjdYdWQ0aEFOaHV6dz09IiwibWFjIjoiZWFlYWRjOWViZjM0NjI2MDljNWI0YjEzZjEzNzQzMTljOTFkNTFkNTUzOTJlZjVhM2Q1NTQ3NjJmM2EzN2IxMiIsInRhZyI6IiJ9', '<i class=\"fa fa-reply\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-02 06:53:25', '2024-12-02 06:53:25', NULL),
(279, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-02 09:43:22', '2024-12-02 09:43:22', NULL),
(280, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-02 10:50:18', '2024-12-02 10:50:18', NULL),
(281, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-03 10:51:21', '2024-12-03 10:51:21', NULL),
(282, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-03 10:56:21', '2024-12-03 10:56:21', NULL),
(283, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-06 06:54:07', '2024-12-06 06:54:07', NULL),
(284, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-07 04:47:22', '2024-12-07 04:47:22', NULL),
(285, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-07 06:38:01', '2024-12-07 06:38:01', NULL),
(286, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-09 12:18:23', '2024-12-09 12:18:23', NULL),
(287, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-09 13:14:14', '2024-12-09 13:14:14', NULL),
(288, 213, 'New Login', 'Test Tl One Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-09 13:32:24', '2024-12-09 13:32:24', NULL),
(289, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-10 04:44:02', '2024-12-10 04:44:02', NULL),
(290, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-10 09:35:52', '2024-12-10 09:35:52', NULL),
(291, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-10 10:51:25', '2024-12-10 10:51:25', NULL),
(292, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-10 11:05:21', '2024-12-10 11:05:21', NULL),
(293, 222, 'New Login', 'Kamal Murjani Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-10 11:24:45', '2024-12-10 11:24:45', NULL),
(294, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-11 04:45:39', '2024-12-11 04:45:39', NULL);
INSERT INTO `notifications` (`id`, `user_id`, `title`, `notification`, `notification_for`, `task_id`, `document_id`, `url`, `icon`, `read_status`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(295, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-11 12:26:17', '2024-12-11 12:26:17', NULL),
(296, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-12 05:25:35', '2024-12-12 05:25:35', NULL),
(297, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-12 05:27:15', '2024-12-12 05:27:15', NULL),
(298, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-12 10:32:17', '2024-12-12 10:32:17', NULL),
(299, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-13 04:50:32', '2024-12-13 04:50:32', NULL),
(300, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-13 05:49:13', '2024-12-13 05:49:13', NULL),
(301, 217, 'New Login', 'Sanhil Chandra Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-13 07:01:04', '2024-12-13 07:01:04', NULL),
(302, 211, 'New Login', 'Team Memebr Seven Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-13 07:05:51', '2024-12-13 07:05:51', NULL),
(303, 217, 'New Login', 'Sanhil Chandra Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-13 07:59:32', '2024-12-13 07:59:32', NULL),
(304, 198, 'New Login', 'Vikash Sharma Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-13 11:12:27', '2024-12-13 11:12:27', NULL),
(305, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-14 04:45:32', '2024-12-14 04:45:32', NULL),
(306, 198, 'New Login', 'Vikash Sharma Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-14 06:37:33', '2024-12-14 06:37:33', NULL),
(307, 209, 'New Login', 'Test Member Five Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-14 07:46:48', '2024-12-14 07:46:48', NULL),
(308, 213, 'New Login', 'Test Tl One Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-14 08:04:31', '2024-12-14 08:04:31', NULL),
(309, 1, 'New Task Assigned', 'New Task Assigned', 193, 30, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6InBiVEpIOXVKM29ocFR5eDZ5cnBpZ1E9PSIsInZhbHVlIjoiZ2ZMaytac0k1MllrbGZseC9vS1d0UT09IiwibWFjIjoiZTU3NGRmZjA2ODY2NTQ4ZjNmZTVmODczMzQzOTc2NGRiNjBkZWVjYWU3Y2UzOTAzYTE4ZDA0YzlhZTYxMDA4YSIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-14 09:50:18', '2024-12-14 09:50:18', NULL),
(310, 1, 'New Comment', 'Anil Kumar Commented', 193, 30, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6Ilp5ald4K3RUSWNBM1hCZFBJSUF3NEE9PSIsInZhbHVlIjoibXpEY1Fsd1gvWHhJRkRVYkluNWNvZz09IiwibWFjIjoiMzRmNzRmNzQ4YmNlOGE5ZTljMDRjZTY1NDZiMmUzYmQ3ODllYWY3NDM0ODkxNjE5MTk1MDJkNDhkYTZlY2E2ZSIsInRhZyI6IiJ9', '<i class=\"fa fa-comment\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-14 11:35:51', '2024-12-14 11:35:51', NULL),
(311, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-14 11:39:57', '2024-12-14 11:39:57', NULL),
(312, 193, 'New Comment', 'Sahil Koushal Commented', 1, 30, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6IjRYU0pPRUlmN2JhUHdKWGVzWlczTEE9PSIsInZhbHVlIjoiME5pcDRhV0VvNHVxOHRMNnBReDJOUT09IiwibWFjIjoiZjMwZTgyNjAyZjk1YWM0MDhmNWU2OTU0MGY1MDBmNjc1NTBiOTBjYTUzMGQ3NzZlNmVjZjQ1ZGM5MjJiNmNhZCIsInRhZyI6IiJ9', '<i class=\"fa fa-comment\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-14 11:40:09', '2024-12-14 11:40:09', NULL),
(313, 1, 'New Comment', 'Anil Kumar Commented', 193, 30, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6Inc0Z0t3TDg1QWhhdWlIdjdxV0VkK3c9PSIsInZhbHVlIjoiaUR0em5iUGM1SHpuNzd0WE9WZFNLQT09IiwibWFjIjoiNGJlZWM1ZGI4MzA2OTkyYTExYzE4NjY0YjBhOGYxZWUyNGJkYzJhZjE4MWJkODlhOTVlNzc4MmJiNzMyNDM5NSIsInRhZyI6IiJ9', '<i class=\"fa fa-comment\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-14 11:40:27', '2024-12-14 11:40:27', NULL),
(314, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-16 04:39:38', '2024-12-16 04:39:38', NULL),
(315, 201, 'New Login', 'Sachin Negi Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-16 04:48:50', '2024-12-16 04:48:50', NULL),
(316, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-17 09:39:38', '2024-12-17 09:39:38', NULL),
(317, 198, 'New Login', 'Vikash Sharma Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-17 09:43:34', '2024-12-17 09:43:34', NULL),
(318, 211, 'New Login', 'Team Memebr Seven Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-17 09:44:09', '2024-12-17 09:44:09', NULL),
(319, 213, 'New Login', 'Test Tl One Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-17 09:44:32', '2024-12-17 09:44:32', NULL),
(320, 1, 'New Comment', 'Anil Kumar Commented', 193, 30, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6IkJSSEJ5ZE0zcWJMWktCaVozbGh6ZHc9PSIsInZhbHVlIjoieURpV0ZVRnp1ZWVZdDB2aU53QklMQT09IiwibWFjIjoiYTU3M2U0YjMxNDZmODhlODZlMjZiZjg5OTE2NjdhOWM1NjViYWRhNjE0OTE4YjNhYzY1ZGFkNGUzOGQyNTM2NiIsInRhZyI6IiJ9', '<i class=\"fa fa-comment\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-17 10:06:13', '2024-12-17 10:06:13', NULL),
(321, 1, 'New Comment', 'Anil Kumar Commented', 193, 30, 1, 'http://localhost/dms/admin/task/view/eyJpdiI6Ii9KSzd1NHUyODVudkVrbnN2U09OZmc9PSIsInZhbHVlIjoieUhxQnhmcmNZSGZzVzhLTXkwaVBtUT09IiwibWFjIjoiNWZlZTk2YzJjZTMzNjZiMjcyMWI5YTkwYzAyMDY5NGNhZmFmY2UzYWVhZjE1ZDJlNWQ5NjdhYmU1YzU0NzdiZCIsInRhZyI6IiJ9', '<i class=\"fa fa-comment\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-17 10:10:48', '2024-12-17 10:10:48', NULL),
(322, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-17 10:45:04', '2024-12-17 10:45:04', NULL),
(323, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-18 04:42:42', '2024-12-18 04:42:42', NULL),
(324, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-18 04:45:52', '2024-12-18 04:45:52', NULL),
(325, 196, 'New Login', 'Rahul Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-18 05:38:05', '2024-12-18 05:38:05', NULL),
(326, 199, 'New Login', 'Amarjeet Singh Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-18 05:49:27', '2024-12-18 05:49:27', NULL),
(327, 1, 'New Task Assigned', 'New Task Assigned', 193, 31, 22, 'http://localhost/dms/admin/task/view/eyJpdiI6Im9USEg0Y3F4REkvRnJGeHZxSWZTV1E9PSIsInZhbHVlIjoiTTlDa2dFWXVnbjV1cGZnZWgwcEpFQT09IiwibWFjIjoiOTk3MDRmN2JkZDgyNjNmZGUxYzU0OTU4MGU0OGY1YmUxNzRkNGJkOWY1M2U1YzU0N2M3MzIwNTMwY2Q3OTRhNCIsInRhZyI6IiJ9', '<i class=\"fa fa-tasks\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-18 07:01:15', '2024-12-18 07:01:15', NULL),
(328, 209, 'New Login', 'Test Role change Member Five Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-18 08:01:13', '2024-12-18 08:01:13', NULL),
(329, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-19 05:12:27', '2024-12-19 05:12:27', NULL),
(330, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-19 06:02:53', '2024-12-19 06:02:53', NULL),
(331, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-20 04:36:19', '2024-12-20 04:36:19', NULL),
(332, 196, 'New Login', 'Rahul Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-20 06:48:23', '2024-12-20 06:48:23', NULL),
(333, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-20 08:24:03', '2024-12-20 08:24:03', NULL),
(334, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-21 04:44:04', '2024-12-21 04:44:04', NULL),
(335, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-21 04:50:29', '2024-12-21 04:50:29', NULL),
(336, 196, 'New Login', 'Rahul Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-21 04:53:22', '2024-12-21 04:53:22', NULL),
(337, 207, 'New Login', 'Testdfdf Member Three Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-21 06:47:03', '2024-12-21 06:47:03', NULL),
(338, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-21 06:58:56', '2024-12-21 06:58:56', NULL),
(339, 204, 'New Login', 'Team Member One Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-21 11:13:11', '2024-12-21 11:13:11', NULL),
(340, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-23 04:38:37', '2024-12-23 04:38:37', NULL),
(341, 201, 'New Login', 'Sachin Negi Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-23 05:10:05', '2024-12-23 05:10:05', NULL),
(342, 196, 'New Login', 'Rahul Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-23 05:27:17', '2024-12-23 05:27:17', NULL),
(343, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-23 05:43:11', '2024-12-23 05:43:11', NULL),
(344, 196, 'New Login', 'Rahul Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-23 06:28:54', '2024-12-23 06:28:54', NULL),
(345, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-23 06:38:22', '2024-12-23 06:38:22', NULL),
(346, 196, 'New Login', 'Rahul Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-23 06:40:55', '2024-12-23 06:40:55', NULL),
(347, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-23 10:17:01', '2024-12-23 10:17:01', NULL),
(348, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-24 04:39:19', '2024-12-24 04:39:19', NULL),
(349, 193, 'New Login', 'Sahil Koushal Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-24 04:40:38', '2024-12-24 04:40:38', NULL),
(350, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-26 05:08:37', '2024-12-26 05:08:37', NULL),
(351, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-26 05:09:58', '2024-12-26 05:09:58', NULL),
(352, 209, 'New Login', 'Test Role change Member Five Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-26 11:02:47', '2024-12-26 11:02:47', NULL),
(353, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-27 04:54:25', '2024-12-27 04:54:25', NULL),
(354, 209, 'New Login', 'Test Role change Member Five Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-27 04:59:37', '2024-12-27 04:59:37', NULL),
(355, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-30 04:44:09', '2024-12-30 04:44:09', NULL),
(356, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2024-12-31 07:27:05', '2024-12-31 07:27:05', NULL),
(357, 1, 'New Login', 'Anil Kumar Login', 1, NULL, NULL, NULL, '<i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i>', 0, 1, '2025-01-07 04:38:42', '2025-01-07 04:38:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('anil.digitaldesign@gmail.com', '$2y$10$8/HMo7iv1mcH1TPXeqqmteb3TDqcA39FIjHlPWV3Nto37voU/Mkxu', '2024-10-25 02:22:13');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'view roll', 'web', '2024-05-29 01:50:45', '2024-05-29 01:50:45'),
(3, 'create roll', 'web', '2024-05-29 01:51:23', '2024-05-29 01:51:23'),
(4, 'edit roll', 'web', '2024-05-29 01:51:26', '2024-05-29 01:51:26'),
(5, 'delete roll', 'web', '2024-05-29 01:51:31', '2024-05-29 01:51:31'),
(6, 'view permission', 'web', '2024-05-29 01:51:37', '2024-05-29 01:51:37'),
(7, 'create permission', 'web', '2024-05-29 01:51:41', '2024-05-29 01:51:41'),
(8, 'edit permission', 'web', '2024-05-29 01:51:49', '2024-05-29 01:51:49'),
(9, 'delete permission', 'web', '2024-05-29 01:51:54', '2024-05-29 01:51:54');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publicly_shared_documents`
--

CREATE TABLE `publicly_shared_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doc_file` varchar(255) DEFAULT NULL,
  `shared_url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `link_valid_until` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publicly_shared_documents`
--

INSERT INTO `publicly_shared_documents` (`id`, `doc_file`, `shared_url`, `email`, `link_valid_until`, `created_at`, `updated_at`) VALUES
(1, '1726129480.webp', NULL, NULL, NULL, '2024-09-13 06:02:49', '2024-09-13 06:02:49'),
(2, '1726129480.webp', NULL, NULL, NULL, '2024-09-13 06:05:05', '2024-09-13 06:05:05'),
(3, '1726129480.webp', NULL, NULL, NULL, '2024-09-13 06:07:17', '2024-09-13 06:07:17'),
(4, '1726129480.webp', NULL, NULL, NULL, '2024-09-13 06:11:03', '2024-09-13 06:11:03'),
(5, '1726129480.webp', NULL, NULL, NULL, '2024-09-13 06:11:37', '2024-09-13 06:11:37'),
(6, '1726129480.webp', NULL, NULL, NULL, '2024-09-13 06:12:56', '2024-09-13 06:12:56'),
(7, '1726134469.docx', NULL, NULL, NULL, '2024-09-20 07:05:23', '2024-09-20 07:05:23'),
(8, '1726134469.docx', 'public/folders/IT (Information Technology)/hgmghm', NULL, NULL, '2024-09-20 07:10:10', '2024-09-20 07:10:10'),
(9, '1726134469.docx', 'public/folders/IT (Information Technology)/hgmghm', NULL, NULL, '2024-09-20 07:11:06', '2024-09-20 07:11:06'),
(10, '1726134469.docx', 'public/folders/IT (Information Technology)/hgmghm', NULL, NULL, '2024-09-20 07:11:51', '2024-09-20 07:11:51'),
(11, '1726134469.docx', 'public/folders/IT (Information Technology)/hgmghm', NULL, NULL, '2024-09-20 07:14:24', '2024-09-20 07:14:24'),
(12, '1726134469.docx', 'public/folders/IT (Information Technology)/hgmghm', NULL, '2024-09-30', '2024-09-24 06:06:26', '2024-09-24 06:06:26'),
(13, '1726134469.docx', 'public/folders/IT (Information Technology)/hgmghm', NULL, NULL, '2024-09-24 06:09:41', '2024-09-24 06:09:41'),
(14, '1726134469.docx', 'public/folders/IT (Information Technology)/hgmghm', NULL, NULL, '2024-09-25 11:20:48', '2024-09-25 11:20:48'),
(15, '1726134469.docx', 'public/folders/IT (Information Technology)/hgmghm', NULL, NULL, '2024-09-25 11:21:21', '2024-09-25 11:21:21'),
(16, '1726134469.docx', 'public/folders/IT (Information Technology)/hgmghm', NULL, NULL, '2024-09-25 12:28:51', '2024-09-25 12:28:51'),
(17, '1727423968.pdf', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-09-27 03:00:27', '2024-09-27 03:00:27'),
(18, '1727354936.pdf', 'public/folders/test/test2', NULL, NULL, '2024-10-03 06:05:11', '2024-10-03 06:05:11'),
(19, '1727354936.pdf', 'public/folders/test/test2', NULL, NULL, '2024-10-03 06:06:01', '2024-10-03 06:06:01'),
(20, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 01:38:02', '2024-10-22 01:38:02'),
(21, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 01:40:50', '2024-10-22 01:40:50'),
(22, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 01:43:41', '2024-10-22 01:43:41'),
(23, '1729582138.xlsx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 01:59:05', '2024-10-22 01:59:05'),
(26, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 02:48:44', '2024-10-22 02:48:44'),
(27, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 02:49:34', '2024-10-22 02:49:34'),
(28, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 02:50:17', '2024-10-22 02:50:17'),
(29, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 02:50:59', '2024-10-22 02:50:59'),
(30, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 02:53:12', '2024-10-22 02:53:12'),
(31, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, '2024-10-21', '2024-10-22 02:54:21', '2024-10-22 02:54:21'),
(32, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, '2024-10-21', '2024-10-22 03:02:05', '2024-10-22 03:02:05'),
(33, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 03:05:18', '2024-10-22 03:05:18'),
(34, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 03:05:40', '2024-10-22 03:05:40'),
(35, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 04:04:28', '2024-10-22 04:04:28'),
(36, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 04:05:14', '2024-10-22 04:05:14'),
(37, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 04:05:57', '2024-10-22 04:05:57'),
(38, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 04:09:30', '2024-10-22 04:09:30'),
(39, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 04:10:48', '2024-10-22 04:10:48'),
(40, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 04:11:28', '2024-10-22 04:11:28'),
(41, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 04:15:17', '2024-10-22 04:15:17'),
(42, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 04:17:09', '2024-10-22 04:17:09'),
(43, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 04:18:23', '2024-10-22 04:18:23'),
(44, '1729511255.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, '2024-10-21', '2024-10-22 04:18:59', '2024-10-22 04:18:59'),
(45, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 04:44:06', '2024-10-22 04:44:06'),
(46, '1729593001.png', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 05:00:09', '2024-10-22 05:00:09'),
(47, '1729593078.pdf', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-10-22 05:01:26', '2024-10-22 05:01:26'),
(48, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-11-18 05:51:51', '2024-11-18 05:51:51'),
(49, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', NULL, NULL, '2024-11-18 05:58:32', '2024-11-18 05:58:32'),
(50, '1732778308.jpg', 'storage/app/folders/Digital/SEO', NULL, '2024-12-11', '2024-12-09 12:19:15', '2024-12-09 12:19:15');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'super admin', 'web', '2024-05-29 01:16:36', '2024-05-29 01:16:36'),
(3, 'admin', 'web', '2024-05-29 01:16:51', '2024-05-29 01:16:51'),
(4, 'user', 'web', '2024-05-29 01:16:55', '2024-05-29 01:16:55'),
(5, 'staff', 'web', '2024-05-29 01:16:58', '2024-05-29 01:16:58'),
(6, 'manager', 'web', '2024-05-29 01:17:01', '2024-05-29 01:17:01');

-- --------------------------------------------------------

--
-- Table structure for table `role_types`
--

CREATE TABLE `role_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_types`
--

INSERT INTO `role_types` (`id`, `name`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', NULL, 1, '2024-06-11 07:29:33', '2024-12-13 11:44:30'),
(2, 'Head Department', NULL, 1, '2024-06-11 07:30:00', '2024-12-13 11:45:30'),
(3, 'Hotel', NULL, 0, '2024-06-19 06:16:42', '2024-06-19 06:16:42'),
(4, 'Hotel Department', NULL, 0, '2024-06-19 06:17:05', '2024-06-19 06:17:05'),
(5, 'Manager', NULL, 1, '2024-06-19 06:17:20', '2024-06-19 06:17:20'),
(6, 'Team Leader', NULL, 1, '2024-06-19 06:17:39', '2024-06-19 06:17:39'),
(7, 'Team Member', NULL, 1, '2024-06-19 06:17:58', '2024-06-19 06:17:58');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ANDHRA PRADESH', 105, 0, '2024-10-30 06:06:08', '2024-12-14 06:13:19'),
(2, 'ASSAM', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(3, 'ARUNACHAL PRADESH', 105, 1, '2024-10-30 06:06:08', '2024-11-27 12:55:57'),
(4, 'BIHAR', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(5, 'GUJARAT', 105, 1, '2024-10-30 06:06:08', '2024-11-27 11:46:01'),
(6, 'HARYANA', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(7, 'HIMACHAL PRADESH', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(8, 'JAMMU & KASHMIR', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(9, 'KARNATAKA', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(10, 'KERALA', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(11, 'MADHYA PRADESH', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(12, 'MAHARASHTRA', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(13, 'MANIPUR', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(14, 'MEGHALAYA', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(15, 'MIZORAM', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(16, 'NAGALAND', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(17, 'ORISSA', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(18, 'PUNJAB', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(19, 'RAJASTHAN', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(20, 'SIKKIM', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(21, 'TAMIL NADU', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(22, 'TRIPURA', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(23, 'UTTAR PRADESH', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(24, 'WEST BENGAL', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(25, 'DELHI', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(26, 'GOA', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(27, 'PONDICHERY', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(28, 'LAKSHDWEEP', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(29, 'DAMAN & DIU', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(30, 'DADRA & NAGAR', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(31, 'CHANDIGARH', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(32, 'ANDAMAN & NICOBAR', 105, 1, '2024-10-30 06:06:08', '2024-12-14 06:11:37'),
(33, 'UTTARANCHAL', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(34, 'JHARKHAND', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08'),
(35, 'CHATTISGARH', 105, 1, '2024-10-30 06:06:08', '2024-10-30 06:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `main_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `description`, `main_category_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sub cat testing one', 'Sub cat testing one', 1, 1, '2024-06-12 23:46:55', '2024-08-06 02:24:11'),
(2, 'Sub cat testing two', 'Sub cat testing two', 2, 1, '2024-06-12 23:47:21', '2024-06-12 23:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `sub_folders`
--

CREATE TABLE `sub_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `main_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_folders`
--

INSERT INTO `sub_folders` (`id`, `name`, `main_folder_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MD-1', 14, 1, '2024-08-13 12:05:42', '2024-08-13 12:05:42', NULL),
(2, 'MD-2', 14, 1, '2024-08-13 12:05:42', '2024-08-13 12:05:42', NULL),
(3, 'ADMIN-1', 12, 1, '2024-08-13 12:05:42', '2024-12-18 05:36:13', NULL),
(4, 'ADMIN-2', 12, 1, '2024-08-13 12:05:42', '2024-08-13 12:05:42', NULL),
(5, 'ADMIN-3', 12, 1, '2024-08-13 12:05:42', '2024-08-13 12:05:42', NULL),
(6, 'OTHER', 12, 1, '2024-08-13 12:05:42', '2024-12-03 11:57:28', '2024-12-03 11:57:28'),
(7, 'LOT', 13, 1, '2024-08-13 12:05:42', '2024-08-13 12:05:42', NULL),
(8, 'HMA', 13, 1, '2024-08-13 12:05:42', '2024-08-13 12:05:42', NULL),
(9, 'COMPANY', 13, 1, '2024-08-13 12:05:42', '2024-08-13 12:05:42', NULL),
(10, 'LICENCE', 13, 1, '2024-08-13 12:05:42', '2024-08-13 12:05:42', NULL),
(11, 'OB CHECKLIST', 15, 1, '2024-08-13 12:18:18', '2024-08-13 12:18:18', NULL),
(12, 'HMA', 15, 1, '2024-08-13 12:18:18', '2024-08-13 12:18:18', NULL),
(13, 'LOI', 15, 1, '2024-08-13 12:18:18', '2024-08-13 12:18:18', NULL),
(14, 'Feasibility Study', 15, 1, '2024-08-13 12:18:18', '2024-08-13 12:18:18', NULL),
(15, 'TECH MANUAL', 16, 1, '2024-08-13 12:18:18', '2024-08-13 12:18:18', NULL),
(16, 'BRAND MANUAL', 16, 1, '2024-08-13 12:18:18', '2024-08-13 12:18:18', NULL),
(17, 'Brand Fact Sheet', 16, 1, '2024-08-13 12:18:18', '2024-08-13 12:18:18', NULL),
(18, 'ID & TECH MANUAL', 16, 1, '2024-08-13 12:18:18', '2024-08-13 12:18:18', NULL),
(19, 'INDUCATION', 17, 1, '2024-08-13 12:18:18', '2024-08-13 12:18:18', NULL),
(20, 'CY-POLLICY', 17, 1, '2024-08-13 12:18:18', '2024-08-13 12:18:18', NULL),
(21, 'CYGNETT STD', 17, 1, '2024-08-13 12:24:10', '2024-08-13 12:24:10', NULL),
(22, 'REPORTS & AUDIT', 17, 1, '2024-08-13 12:24:10', '2024-08-13 12:24:10', NULL),
(23, 'CYGNETT POSTER', 17, 1, '2024-08-13 12:24:10', '2024-08-13 12:24:10', NULL),
(24, 'OTHER', 17, 1, '2024-08-13 12:24:10', '2024-08-13 12:24:10', NULL),
(25, 'DEVELOPMENT', 18, 1, '2024-08-13 12:24:10', '2024-08-13 12:24:10', NULL),
(26, 'L&D', 18, 1, '2024-08-13 12:24:10', '2024-08-13 12:24:10', NULL),
(27, 'HR', 18, 1, '2024-08-13 12:24:10', '2024-08-13 12:24:10', NULL),
(28, 'HK', 18, 1, '2024-08-13 12:24:10', '2024-08-13 12:24:10', NULL),
(29, 'IT', 18, 1, '2024-08-13 12:24:10', '2024-08-13 12:24:10', NULL),
(30, 'FNB', 18, 1, '2024-08-13 12:24:10', '2024-08-13 12:24:10', NULL),
(31, 'FP', 18, 1, '2024-08-13 12:27:53', '2024-08-13 12:27:53', NULL),
(32, 'SECURITY', 18, 1, '2024-08-13 12:27:53', '2024-08-13 12:27:53', NULL),
(33, 'ACCOUNTS & FINANCE', 18, 1, '2024-08-13 12:28:26', '2024-08-13 12:28:26', NULL),
(34, 'OB', 19, 1, '2024-08-13 12:28:26', '2024-08-13 12:28:26', NULL),
(55, 'SEO', 37, 1, '2024-09-25 11:09:09', '2024-12-18 06:57:04', NULL),
(56, 'SEO', 37, 1, '2024-09-25 11:09:17', '2024-11-20 11:32:20', '2024-11-20 11:32:20'),
(57, 'BOQ', 1, 1, '2024-09-25 11:10:03', '2024-09-25 11:10:03', NULL),
(86, '4fgdgdgfffffffffffffffff', 66, 1, '2024-10-25 02:54:59', '2024-10-25 07:29:03', '2024-10-25 07:29:03'),
(87, 'Acc Test', 2, 1, '2024-11-16 10:26:15', '2024-11-16 10:26:15', NULL),
(88, 'SEO', 37, 1, '2024-11-20 11:31:58', '2024-11-20 11:32:14', '2024-11-20 11:32:14'),
(89, 'test', 37, 1, '2024-11-21 06:30:18', '2024-11-21 06:30:18', NULL),
(90, 'test', 37, 1, '2024-11-21 06:45:51', '2024-11-21 06:47:56', '2024-11-21 06:47:56'),
(91, 'test', 37, 1, '2024-11-21 07:57:47', '2024-11-21 07:57:47', NULL),
(92, 'test', 2, 1, '2024-11-21 08:00:08', '2024-11-21 08:00:08', NULL),
(93, 't1', 70, 1, '2024-12-14 07:41:30', '2024-12-14 07:41:30', NULL),
(94, 't2', 70, 1, '2024-12-14 07:41:35', '2024-12-14 07:41:35', NULL),
(95, 't3', 70, 1, '2024-12-14 07:41:40', '2024-12-14 07:41:40', NULL),
(96, 't4', 70, 1, '2024-12-14 07:41:47', '2024-12-14 07:41:47', NULL),
(97, 't5', 70, 1, '2024-12-14 07:41:52', '2024-12-14 07:43:15', '2024-12-14 07:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `sub_folder_permission_lists`
--

CREATE TABLE `sub_folder_permission_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `main_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_folder_permission_lists`
--

INSERT INTO `sub_folder_permission_lists` (`id`, `name`, `folder_id`, `main_folder_id`, `sub_folder_id`, `department_type_id`, `group_name`, `group_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ADMIN-1', NULL, 12, 3, 12, 'Administration', 12, 1, '2024-08-26 02:32:35', '2024-08-26 02:32:35', NULL),
(2, 'ADMIN-2', NULL, 12, 4, 12, 'Administration', 12, 1, '2024-08-26 02:32:35', '2024-08-26 02:32:35', NULL),
(3, 'ADMIN-3', NULL, 12, 5, 12, 'Administration', 12, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(4, 'OTHER', NULL, 12, 6, 12, 'Administration', 12, 1, '2024-08-26 02:32:36', '2024-12-03 11:57:28', '2024-12-03 11:57:28'),
(6, 'LOT', NULL, 13, 7, 13, 'Legal', 13, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(7, 'HMA', NULL, 13, 8, 13, 'Legal', 13, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(8, 'COMPANY', NULL, 13, 9, 13, 'Legal', 13, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(9, 'LICENCE', NULL, 13, 10, 13, 'Legal', 13, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(10, 'MD-1', NULL, 14, 1, 14, 'MD', 14, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(11, 'MD-2', NULL, 14, 2, 14, 'MD', 14, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(12, 'OB CHECKLIST', NULL, 15, 11, 15, 'Owner', 15, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(13, 'HMA', NULL, 15, 12, 15, 'Owner', 15, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(14, 'LOI', NULL, 15, 13, 15, 'Owner', 15, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(15, 'Feasibility Study', NULL, 15, 14, 15, 'Owner', 15, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(16, 'TECH MANUAL', NULL, 16, 15, 16, 'Cygnett', 16, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(17, 'BRAND MANUAL', NULL, 16, 16, 16, 'Cygnett', 16, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(18, 'Brand Fact Sheet', NULL, 16, 17, 16, 'Cygnett', 16, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(19, 'ID & TECH MANUAL', NULL, 16, 18, 16, 'Cygnett', 16, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(20, 'INDUCATION', NULL, 17, 19, 17, 'Unit GM', 17, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(21, 'CY-POLLICY', NULL, 17, 20, 17, 'Unit GM', 17, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(22, 'CYGNETT STD', NULL, 17, 21, 17, 'Unit GM', 17, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(23, 'REPORTS & AUDIT', NULL, 17, 22, 17, 'Unit GM', 17, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(24, 'CYGNETT POSTER', NULL, 17, 23, 17, 'Unit GM', 17, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(25, 'OTHER', NULL, 17, 24, 17, 'Unit GM', 17, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(26, 'DEVELOPMENT', NULL, 18, 25, 18, 'Corporate', 18, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(27, 'L&D', NULL, 18, 26, 18, 'Corporate', 18, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(28, 'HR', NULL, 18, 27, 18, 'Corporate', 18, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(29, 'HK', NULL, 18, 28, 18, 'Corporate', 18, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(30, 'IT', NULL, 18, 29, 18, 'Corporate', 18, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(31, 'FNB', NULL, 18, 30, 18, 'Corporate', 18, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(32, 'FP', NULL, 18, 31, 18, 'Corporate', 18, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(33, 'SECURITY', NULL, 18, 32, 18, 'Corporate', 18, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(34, 'ACCOUNTS & FINANCE', NULL, 18, 33, 18, 'Corporate', 18, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(35, 'OB', NULL, 19, 34, 19, 'Pre Opening', 19, 1, '2024-08-26 02:32:36', '2024-08-26 02:32:36', NULL),
(51, 'SEO', NULL, 37, 55, NULL, 'Digital', 37, 1, '2024-09-25 11:09:09', '2024-09-25 11:09:09', NULL),
(52, 'SEO', NULL, 37, 56, NULL, 'Digital', 37, 1, '2024-09-25 11:09:17', '2024-11-20 11:32:20', '2024-11-20 11:32:20'),
(53, 'BOQ', NULL, 1, 57, NULL, 'IT (Information Technology)', 1, 1, '2024-09-25 11:10:03', '2024-09-25 11:10:03', NULL),
(82, '4fgdgdgfffffffffffffffff', NULL, 66, 86, NULL, 'Cygnett Testing', 66, 1, '2024-10-25 02:54:59', '2024-10-25 07:29:03', '2024-10-25 07:29:03'),
(83, 'Acc Test', NULL, 2, 87, NULL, 'Accounts', 2, 1, '2024-11-16 10:26:15', '2024-11-16 10:26:15', NULL),
(84, 'SEO', NULL, 37, 88, NULL, 'Digital', 37, 1, '2024-11-20 11:31:58', '2024-11-20 11:32:14', '2024-11-20 11:32:14'),
(85, 'test', NULL, 37, 89, NULL, 'Digital', 37, 1, '2024-11-21 06:30:18', '2024-11-21 06:30:18', NULL),
(86, 'test', NULL, 37, 90, NULL, 'Digital', 37, 1, '2024-11-21 06:45:51', '2024-11-21 06:47:56', '2024-11-21 06:47:56'),
(87, 'test', NULL, 37, 91, NULL, 'Digital', 37, 1, '2024-11-21 07:57:47', '2024-11-21 07:57:47', NULL),
(88, 'test', NULL, 2, 92, NULL, 'Accounts', 2, 1, '2024-11-21 08:00:08', '2024-11-21 08:00:08', NULL),
(89, 't1', NULL, 70, 93, NULL, 'test', 70, 1, '2024-12-14 07:41:30', '2024-12-14 07:41:30', NULL),
(90, 't2', NULL, 70, 94, NULL, 'test', 70, 1, '2024-12-14 07:41:35', '2024-12-14 07:41:35', NULL),
(91, 't3', NULL, 70, 95, NULL, 'test', 70, 1, '2024-12-14 07:41:40', '2024-12-14 07:41:40', NULL),
(92, 't4', NULL, 70, 96, NULL, 'test', 70, 1, '2024-12-14 07:41:47', '2024-12-14 07:41:47', NULL),
(93, 't5', NULL, 70, 97, NULL, 'test', 70, 1, '2024-12-14 07:41:52', '2024-12-14 07:43:15', '2024-12-14 07:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `assign_date` datetime DEFAULT NULL,
  `doc_uploaded_by` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_by` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_to` bigint(20) UNSIGNED DEFAULT NULL,
  `main_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `ducument_url` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `current_status` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `document_id`, `title`, `description`, `assign_date`, `doc_uploaded_by`, `assigned_by`, `assigned_to`, `main_folder_id`, `sub_folder_id`, `document_name`, `ducument_url`, `start_date`, `start_time`, `end_date`, `end_time`, `deleted_by`, `status`, `current_status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(18, 1, NULL, NULL, '2024-10-22 10:54:52', 1, 1, 128, 1, 57, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', '2024-10-22', NULL, '2024-10-24', NULL, NULL, NULL, 'pending', NULL, '2024-10-22 05:24:52', '2024-10-22 05:24:52'),
(20, 11, NULL, NULL, '2024-10-22 11:37:25', 1, 1, 128, 1, 57, '1729593078.pdf', 'public/folders/IT (Information Technology)/BOQ', '2024-10-14', NULL, '2024-10-21', NULL, NULL, NULL, 'pending', NULL, '2024-10-22 06:07:25', '2024-10-22 06:07:25'),
(21, 1, NULL, NULL, '2024-11-09 07:57:17', 1, 1, 164, 1, 57, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', '2024-11-08', NULL, '2024-11-12', NULL, NULL, NULL, 'pending', NULL, '2024-11-09 02:27:17', '2024-11-09 02:27:17'),
(22, 1, NULL, 'sdfsadf', '2024-11-16 08:18:50', 1, 1, 193, 1, 57, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', '2024-11-17', NULL, '2024-11-28', NULL, NULL, NULL, 'pending', NULL, '2024-11-16 02:48:50', '2024-11-16 02:48:50'),
(23, 1, NULL, 'testing', '2024-11-16 17:59:36', 1, 1, 193, 1, 57, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', '2024-11-08', NULL, '2024-11-27', NULL, NULL, NULL, 'pending', NULL, '2024-11-16 12:29:36', '2024-11-16 12:29:36'),
(24, 3, NULL, 'test', '2024-11-16 18:01:05', 1, 196, 199, 1, 57, '1729509904.docx', 'public/folders/IT (Information Technology)/BOQ', '2024-11-20', NULL, '2024-11-27', NULL, NULL, NULL, 'pending', NULL, '2024-11-16 12:31:05', '2024-11-16 12:31:05'),
(25, 1, NULL, 'test', '2024-11-18 10:49:02', 1, 1, 193, 1, 57, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', '2024-11-19', NULL, '2024-11-28', NULL, NULL, NULL, 'pending', NULL, '2024-11-18 05:19:02', '2024-11-18 05:19:02'),
(26, 1, NULL, 'test', '2024-11-18 11:12:37', 1, 1, 193, 1, 57, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', '2024-11-20', NULL, '2024-11-27', NULL, NULL, NULL, 'pending', NULL, '2024-11-18 05:42:37', '2024-11-18 05:42:37'),
(27, 2, NULL, 'testing descriition', '2024-11-19 17:42:44', 1, 1, 193, 1, 57, '1729509706.docx', 'public/folders/IT (Information Technology)/BOQ', '2024-11-20', NULL, '2024-11-30', NULL, NULL, NULL, 'pending', NULL, '2024-11-19 12:12:44', '2024-11-19 12:12:44'),
(28, 20, NULL, NULL, '2024-11-20 18:17:44', 1, 1, 193, 37, 55, '1732104217.jpg', 'public/folders/Digital/SEO', '2024-11-08', NULL, '2024-12-01', NULL, NULL, NULL, 'pending', NULL, '2024-11-20 12:47:44', '2024-11-20 12:47:44'),
(29, 3, NULL, 'test desription', '2024-11-22 16:49:38', 1, 1, 193, 1, 57, '1729509904.docx', 'public/folders/IT (Information Technology)/BOQ', '2024-11-16', NULL, '2024-11-30', NULL, NULL, NULL, 'pending', NULL, '2024-11-22 11:19:38', '2024-11-22 11:19:38'),
(30, 1, NULL, '<script>alert(\'test\')</script>', '2024-12-14 15:20:18', 1, 1, 193, 1, 57, '1729509646.docx', 'public/folders/IT (Information Technology)/BOQ', '2024-12-14', NULL, '2024-12-28', NULL, NULL, NULL, 'pending', NULL, '2024-12-14 09:50:18', '2024-12-14 09:50:18'),
(31, 22, NULL, 'sahil test task from admin on rahul file', '2024-12-18 12:31:15', 196, 1, 193, 37, 55, '1732164315.jpg', 'public/folders/Digital/SEO', '2024-12-18', NULL, '2024-12-24', NULL, NULL, NULL, 'new', NULL, '2024-12-18 07:01:15', '2024-12-19 11:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'under which department user (user_id)',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `email`, `phone`, `location`, `state`, `city`, `created_by`, `department_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, 'Novotel', NULL, NULL, 'Delhi Aerocity', NULL, NULL, 1, NULL, 1, '2024-10-24 01:09:57', '2024-12-20 06:22:31', NULL),
(13, 'Radisson Blu Hotel', NULL, NULL, 'New Delhi Dwarka', NULL, NULL, 1, NULL, 1, '2024-10-24 01:10:43', '2024-12-20 06:22:29', NULL),
(14, 'Hotel International Inn', NULL, NULL, 'Near Delhi Airport', NULL, NULL, 1, NULL, 1, '2024-10-24 01:11:13', '2024-12-20 06:22:25', NULL),
(15, 'Hyatt Regency', NULL, NULL, 'New Delhi', NULL, NULL, 1, NULL, 1, '2024-10-24 01:11:33', '2024-12-20 06:22:23', NULL),
(16, 'The Metropolitan Hotel & Spa', NULL, NULL, 'New Delhi', NULL, NULL, 1, NULL, 1, '2024-10-24 01:12:06', '2024-12-13 10:52:48', NULL),
(17, 'Crowne Plaza', NULL, NULL, 'New Delhi', NULL, NULL, 1, NULL, 1, '2024-10-24 01:12:24', '2024-11-07 04:41:12', '2024-11-07 04:41:12'),
(19, 'Test Hotel', NULL, NULL, 'Test Location', NULL, NULL, 1, NULL, 1, '2024-10-24 01:14:55', '2024-10-24 01:14:59', '2024-10-24 01:14:59'),
(20, 'Crowne  Plaza', NULL, NULL, 'New Delhi', NULL, NULL, 1, NULL, 1, '2024-10-29 07:55:24', '2024-10-29 07:55:24', NULL),
(21, 'Test Unit', NULL, NULL, 'Janakpuri', '25', 'Central Delhi', 1, NULL, 1, '2024-10-30 01:45:16', '2024-10-30 02:00:39', '2024-10-30 02:00:39'),
(22, 'Test2', NULL, NULL, 'Sanganer', 'RAJASTHAN', 'Jaipur', 1, NULL, 1, '2024-10-30 01:48:33', '2024-10-30 02:00:29', NULL),
(23, 'Test2', NULL, NULL, 'Sanganer', 'RAJASTHAN', 'Jaipur', 1, NULL, 1, '2024-11-05 06:44:01', '2024-11-07 04:40:31', '2024-11-07 04:40:31'),
(24, 'Hotel Radisson', NULL, NULL, 'Dadra Haweli', 'DAMAN & DIU', 'Diu', 1, NULL, 1, '2024-11-07 00:44:03', '2024-11-07 04:40:40', '2024-11-07 04:40:40'),
(25, 'Hotel Radisson', NULL, NULL, 'Dadra Haweli', 'DAMAN & DIU', 'Diu', 1, NULL, 1, '2024-11-07 00:44:25', '2024-11-07 04:40:45', '2024-11-07 04:40:45'),
(26, 'Hotel Radisson', NULL, NULL, 'Sanganers', 'RAJASTHAN', 'Jaipur', 1, NULL, 1, '2024-11-07 00:45:28', '2024-11-07 04:41:03', '2024-11-07 04:41:03'),
(27, 'Test', NULL, NULL, 'dfdsg', 'RAJASTHAN', 'Jaipur', 1, NULL, 1, '2024-11-07 04:44:01', '2024-11-07 04:44:27', '2024-11-07 04:44:27'),
(28, 'Test', NULL, NULL, 'fghh', 'RAJASTHAN', 'Ajmer', 1, NULL, 1, '2024-11-07 04:44:43', '2024-12-14 05:16:27', NULL),
(29, 'Test', NULL, NULL, 'fsdfd', 'ANDHRA PRADESH', 'Adilabad', 1, NULL, 1, '2024-11-16 02:16:56', '2024-11-16 02:16:56', NULL),
(30, 'dsfsf', NULL, NULL, 'dfdf', 'ASSAM', 'Darrang', 1, NULL, 1, '2024-11-23 04:56:46', '2024-12-20 06:22:18', NULL),
(31, 'sdfsdaf', NULL, NULL, 'fg', 'ANDHRA PRADESH', 'Chittoor', 1, NULL, 1, '2024-11-23 04:59:54', '2024-12-20 06:22:17', NULL),
(32, 'testd', NULL, NULL, 'dfd', 'ANDHRA PRADESH', 'Adilabad', 1, NULL, 1, '2024-11-23 05:00:35', '2024-12-13 10:53:58', NULL),
(33, 'testdf', NULL, NULL, 'fddf', 'ANDHRA PRADESH', 'Adilabad', 1, NULL, 1, '2024-11-23 05:00:54', '2024-12-13 10:12:28', '2024-12-13 10:12:28'),
(34, 'testddf', NULL, NULL, 'dfd', 'ANDHRA PRADESH', 'Adilabad', 1, NULL, 1, '2024-11-23 05:01:28', '2024-12-13 10:12:20', '2024-12-13 10:12:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `role_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `head_department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `manager_id` bigint(20) UNSIGNED DEFAULT NULL,
  `team_leader_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'department has multiple units' CHECK (json_valid(`unit_ids`)),
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `name`, `email`, `phone`, `profile_image`, `email_verified_at`, `password`, `remember_token`, `role_type_id`, `department_type_id`, `head_department_id`, `manager_id`, `team_leader_id`, `unit_id`, `unit_ids`, `created_by`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Anil', 'Kumar', 'Anil Kumar', 'anil.digitaldesign@gmail.com', 9928265512, NULL, NULL, '$2y$10$6M.VsRUrvV.SZSeEPNhxwujCmsWAqhnCs5cVRVMyIlrmUeeA.2juC', 'nYv7v0qC9EckDJFbEiIiFFnGI0KrPqe4qRKNyRxUMjK5FShxOCAUJx3sgSXp', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-06-12 23:43:22', '2024-12-26 05:22:08', NULL),
(193, 'Sahil', 'Koushal', 'Sahil Koushal', 'sahil@gmail.com', 9878330983, NULL, NULL, '$2y$10$bbG4QXsDfZZih6nqFjEUvO7J0kXOBO9G/DiFI4XJJY4QZmkvqwlM6', NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-11-14 01:55:40', '2024-11-20 04:50:57', NULL),
(194, 'Amit', 'Kumar', 'Amit Kumar', 'amit@gmail.com', 9830303999, NULL, NULL, '$2y$10$srgiQ8ELVpLO1R33ODeGnufcHuEm8AO5yUZbMOi42UzOjWMipFwCG', NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-11-14 01:56:10', '2024-11-16 00:15:23', NULL),
(195, 'Yogesh', 'Kumar', 'Yogesh Kumar', 'yogest@gmail.com', 8898787837, NULL, NULL, '$2y$10$/SLgdWvXmxZyLHmtOkQqweGdWefT2P2Ut93/CgClxs3AnlOiJJ9SO', NULL, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-11-14 01:56:48', '2024-11-14 01:56:48', NULL),
(196, 'Rahul', 'Kumar', 'Rahul Kumar', 'rahul@gmail.com', 8997797787, NULL, NULL, '$2y$10$wnITMphFoaXasgASKMtws.NRWq1CKcEIBlQvLPMR9wjWrLh6YVVK.', NULL, 5, 1, 193, NULL, NULL, 12, NULL, NULL, 1, '2024-11-14 02:10:31', '2024-11-20 04:50:57', NULL),
(197, 'Ajay', 'Sigh', 'Ajay Sigh', 'ajay@gmail.com', 9998858585, NULL, NULL, '$2y$10$XO3OSbipdRMz69mY2lr.qOVWrTmGgF50cvoLrJCpZzAFQ4bEL3lGK', NULL, 5, 2, 194, NULL, NULL, 13, NULL, NULL, 1, '2024-11-14 02:11:02', '2024-11-22 10:51:50', NULL),
(198, 'Vikash', 'Sharma', 'Vikash Sharma', 'vikash@gmail.com', 8948548585, NULL, NULL, '$2y$10$tif7KECXu0z8hM7fT0WMk.Dy5YqOJRkgWHjcJmd2Z5G1vvy2YkrKS', NULL, 5, 1, 193, NULL, NULL, 13, NULL, NULL, 1, '2024-11-14 02:13:00', '2024-11-20 04:50:57', NULL),
(199, 'Amarjeet', 'Singh', 'Amarjeet Singh', 'amarjeet@gmail.com', 9884848484, NULL, NULL, '$2y$10$w7KEyLV7yMKzWbsSkYjWiuvGykxUMjo2jwMT8LXVYmI1blK3yHEpq', NULL, 6, 1, 193, NULL, NULL, 16, NULL, NULL, 1, '2024-11-14 02:45:04', '2024-12-20 05:36:00', NULL),
(200, 'Nitish', 'Kumar', 'Nitish Kumar', 'nitish@gmail.com', 9848775555, NULL, NULL, '$2y$10$VPDV5gRCcnz7ltGxJIqCuuMRYxowfj3SfS3tabyoS1B/fp9u4JPUG', NULL, 6, 2, 194, NULL, NULL, 13, NULL, NULL, 1, '2024-11-14 02:45:42', '2024-11-16 00:19:03', NULL),
(201, 'Sachin', 'Negi', 'Sachin Negi', 'sachin@gmail.com', 6666555565, NULL, NULL, '$2y$10$dLbFEPZDE0bJbPDg5a/zQOSiyd/NB.KhGMwMjmnsWPKhWhGmn9NwG', NULL, 6, 1, 193, 196, 208, 12, NULL, 193, 1, '2024-11-14 02:58:06', '2024-12-20 08:23:07', NULL),
(202, 'Neeraj', 'Singh', 'Neeraj Singh', 'neeraj@gmail.com', 9898334343, NULL, NULL, '$2y$10$842tqku.DvqFhhk0NkFRDuuXgHhMNIZoeOftzDOJofYLSdVHT5R6y', NULL, 6, 2, 194, 197, NULL, 12, NULL, 193, 0, '2024-11-14 02:59:06', '2024-11-27 05:43:34', '2024-11-27 05:43:34'),
(203, 'Kartik', 'Sharma', 'Kartik Sharma', 'kartik@gmail.com', 8484884488, NULL, NULL, '$2y$10$V5IWb6vmyMN9SEhymrUlV.0AdRdU4M.DHFk6ViLlXjjUV7HFa1SBS', NULL, 6, 2, 194, NULL, NULL, 13, NULL, NULL, 0, '2024-11-14 04:11:30', '2024-11-27 05:42:38', '2024-11-27 05:42:38'),
(204, 'Team', 'Member One', 'Team Member One', 'fsadfkjl@gmail.com', 3443434343, NULL, NULL, '$2y$10$2b2Rypc6eIk1FuAq0EqdSObtXuq1uLaNkilNF58WpwVOYoU9pXE3e', NULL, 7, 1, 193, 196, 201, 12, NULL, NULL, 1, '2024-11-14 04:43:23', '2024-12-21 08:31:59', NULL),
(205, 'Tesam', 'Member Two', 'Tesam Member Two', 'sdfklk@gmail.com', 4545454545, NULL, NULL, '$2y$10$gdrQIIMSJMp1yiVtxkkxEe.jqol/XbaRGYwnN04osETCSlSdhflfS', NULL, 5, 1, 193, 198, 213, 13, NULL, NULL, 1, '2024-11-14 04:44:04', '2024-12-21 08:30:06', NULL),
(206, 'Test', 'Member Two', 'Test Member Two', 'test@gmail.com', 4544654646, NULL, NULL, '$2y$10$YpQcHCIzpHlqgzz7ytUpOOUodtsp4M/ngsGO5YcTHOSSLbOTcwKc6', NULL, 7, 2, 194, 197, 202, 12, NULL, 193, 1, '2024-11-14 05:22:12', '2024-11-16 01:48:53', NULL),
(207, 'My Test', 'Member Three', 'My Test Member Three', 'testmkljkj@gmail.com', 5665655656, NULL, NULL, '$2y$10$WO9B7cwfowCX1pYAKkfEXuh7y02Q06kX8oCjEJhVYEkHVkgYzi0Lm', NULL, 7, 1, 193, NULL, NULL, 13, NULL, 193, 1, '2024-11-14 05:23:28', '2024-12-24 08:13:36', NULL),
(208, 'Test', 'Memeber Forth', 'Test Memeber Forth', 'member4@gmail.com', 9494949494, NULL, NULL, '$2y$10$aGhlrDTTKKB1vHCfTZmwmey63ud2n43icd785z54PI4qHD4e/evve', NULL, 2, 1, 193, 196, 225, 12, NULL, 196, 1, '2024-11-14 06:05:55', '2024-12-23 10:08:05', NULL),
(209, 'Test Role change', 'Member Five', 'Test Role change Member Five', 'member5@gmail.com', 9949494949, NULL, NULL, '$2y$10$ARbnDBTiNA8i/RIk.C3ofeus7RSGM138Y6Xo/iM1JlWVnD8rMtmLK', NULL, 7, 1, 193, 209, NULL, 20, NULL, 196, 1, '2024-11-14 06:06:30', '2024-12-24 06:39:51', NULL),
(210, 'Team', 'Member Six', 'Team Member Six', 'member6@gmail.com', 8787877878, NULL, NULL, '$2y$10$YlN6jzT8p2pMIuDtr1iis.EP5GA8hacs9SnG7jmm.6DOEE3HAKlTa', NULL, 7, 4, 195, NULL, NULL, 13, NULL, 1, 1, '2024-11-14 06:22:05', '2024-12-21 09:34:36', NULL),
(211, 'Team', 'Memebr Seven', 'Team Memebr Seven', 'member7@gmail.com', 7878787878, NULL, NULL, '$2y$10$0.KoaExk0uJZ6fQSgfqol.3.LCKXv2G6WdV/p46A1cUPxmgOFjhnC', NULL, 2, 2, 193, 196, 201, 12, NULL, 1, 1, '2024-11-14 06:56:54', '2024-12-21 08:08:08', NULL),
(212, 'Team', 'Member One', 'Team Member One', 'member1@gmail.com', 8484545458, NULL, NULL, '$2y$10$Yx1W6gJIcODHCoqyxmUkgeRLUvVX0Gb6mZPfE1pzOtmmnmoXymetS', NULL, 5, 1, 193, 198, 199, 13, NULL, 1, 1, '2024-11-14 07:05:40', '2024-12-24 07:36:09', NULL),
(213, 'Test', 'Tl One', 'Test Tl One', 'tl1@gmail.com', 4849594854, NULL, NULL, '$2y$10$BWUQZ3g/edqN/W2DNNhwzuKIIYRyKeRULPKD/6oyXIGG2tb2hmTP2', NULL, 6, 1, 193, 196, 201, 12, NULL, 1, 1, '2024-11-14 07:07:04', '2024-12-24 06:39:08', NULL),
(214, 'Test', 'Department Head One', 'Test Department Head One', 'departmenthed1@gmail.com', 9533668985, NULL, NULL, '$2y$10$BqZ8GAsC/1eFLZtlRX1zO.4jZohqepYGmX.IkM0sJ4ldW9qefkZaO', NULL, 2, 20, NULL, NULL, NULL, NULL, NULL, 1, 1, '2024-11-16 13:19:47', '2024-11-27 04:53:27', NULL),
(215, 'Akash', 'Oberoi', 'Akash Oberoi', 'akash@gmail.com', 9564128535, NULL, NULL, '$2y$10$2w42PCL65/KBlA/TOSHQPOVzUezfZu1EJbQR4cMJWyfrbSnCpBpZa', NULL, 2, 17, NULL, NULL, NULL, NULL, NULL, 1, 1, '2024-11-18 05:06:42', '2024-11-26 13:39:38', NULL),
(217, 'Sanhil', 'Chandra', 'Sanhil Chandra', 'sanhilchandra@gmail.com', 9568564857, NULL, NULL, '$2y$10$eKSHbQtyE0EpdqymxLYohO3zc8hJIyOhOapJowB8FhaFep3JRE95.', NULL, 2, 14, NULL, NULL, NULL, NULL, NULL, 1, 1, '2024-11-25 08:16:45', '2024-12-13 07:00:59', NULL),
(222, 'Kamal', 'Murjani', 'Kamal Murjani', 'kamal@gmail.com', 6582154875, NULL, NULL, '$2y$10$B7nUndAIQVex9s95H1iejO4l25Ozf9XicpZdO4x8nJ1abL8zIpxuK', NULL, 6, 1, 193, 196, NULL, 12, NULL, 1, 1, '2024-11-25 08:31:28', '2024-12-24 06:39:37', NULL),
(223, 'Fasdff', 'Sdfgdsfg', 'Fasdff Sdfgdsfg', 'sdfgsdfg@gmail.com', 9562514785, NULL, NULL, '$2y$10$IcG2GTP1UUZgei1F6YZp4uANLeeq9MD6bOhHIqpD6THj1H21ZEho.', NULL, 2, 14, 217, NULL, NULL, 20, NULL, 217, 1, '2024-11-25 09:35:16', '2024-12-24 08:13:25', NULL),
(224, 'Test', 'Tedfdf', 'Test Tedfdf', 'gdffghn@gmail.com', 5656565656, NULL, NULL, '$2y$10$Ue.6vwTYYRtV5SzhsudPZe1AsmUqpOdf7iEvFlsiFPtsZOC8W25SS', NULL, 2, 13, NULL, NULL, NULL, NULL, NULL, 1, 1, '2024-11-26 13:29:31', '2024-12-21 09:39:52', NULL),
(225, 'Test', 'Leader', 'Test Leader', 'testleader@gmail.com', 3565656565, NULL, NULL, '$2y$10$lU4xwdQhmpOJbUEkNzm/R.hBakVu19Pqiu1f1ESMWkNtBzcxNuwOC', NULL, 7, 1, 193, NULL, NULL, 15, NULL, 196, 1, '2024-12-20 07:56:35', '2024-12-24 06:38:54', NULL),
(226, 'Tmemberdfdsfg', 'Test', 'Tmemberdfdsfg Test', 'tmembertest@gmail.com', 5656566564, NULL, NULL, '$2y$10$P/qgRWy8xVRDuO2.aR2gYOhaOVRIQFZ4uUtJeoiEKZgo2mNkfxIV6', NULL, 2, 2, 194, 196, NULL, 12, NULL, 193, 1, '2024-12-21 06:17:18', '2024-12-24 11:08:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_hierarchies`
--

CREATE TABLE `user_hierarchies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `head_department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hotel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hoted_department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `manager_id` bigint(20) UNSIGNED DEFAULT NULL,
  `team_leader_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_hierarchies`
--

INSERT INTO `user_hierarchies` (`id`, `user_id`, `head_department_id`, `hotel_id`, `hoted_department_id`, `manager_id`, `team_leader_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 126, 124, 8, NULL, NULL, NULL, 1, '2024-10-19 04:44:08', '2024-10-19 04:44:08'),
(2, 127, 124, 10, NULL, NULL, NULL, 1, '2024-10-19 04:44:44', '2024-10-19 04:44:44'),
(3, 128, 125, 9, NULL, NULL, NULL, 1, '2024-10-20 23:25:30', '2024-10-20 23:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_main_folder_permissions`
--

CREATE TABLE `user_main_folder_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `access_given_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_main_folder_permissions`
--

INSERT INTO `user_main_folder_permissions` (`id`, `main_folder_id`, `user_id`, `access_given_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 66, 1, NULL, 1, '2024-10-19 04:28:29', '2024-10-19 04:28:29'),
(2, 66, 124, 1, 1, '2024-10-19 04:29:28', '2024-10-19 04:29:28'),
(3, 66, 125, 1, 1, '2024-10-19 04:35:25', '2024-10-19 04:35:25'),
(5, 3, 129, 1, 1, '2024-10-23 01:36:21', '2024-10-23 01:36:21'),
(10, 1, 164, NULL, 1, '2024-10-28 05:15:12', '2024-10-28 05:15:12'),
(11, 1, 175, NULL, 1, '2024-10-28 06:26:05', '2024-10-28 06:26:05'),
(100, 67, 1, NULL, 1, '2024-10-30 00:14:50', '2024-10-30 00:14:50'),
(103, 68, 1, NULL, 1, '2024-11-03 23:31:31', '2024-11-03 23:31:31'),
(109, 20, 214, 1, 1, '2024-11-16 13:19:47', '2024-11-16 13:19:47'),
(110, 17, 215, 1, 1, '2024-11-18 05:06:42', '2024-11-18 05:06:42'),
(135, 2, 196, 193, 1, '2024-11-21 04:44:01', '2024-11-21 04:44:01'),
(136, 13, 196, 193, 1, '2024-11-21 04:44:01', '2024-11-21 04:44:01'),
(138, 1, 201, 196, 1, '2024-11-21 05:10:59', '2024-11-21 05:10:59'),
(139, 2, 201, 196, 1, '2024-11-21 05:11:00', '2024-11-21 05:11:00'),
(140, 13, 201, 196, 1, '2024-11-21 05:11:00', '2024-11-21 05:11:00'),
(141, 37, 201, 196, 1, '2024-11-21 05:11:00', '2024-11-21 05:11:00'),
(142, 1, 209, 201, 1, '2024-11-21 05:19:20', '2024-11-21 05:19:20'),
(143, 2, 209, 201, 1, '2024-11-21 05:19:20', '2024-11-21 05:19:20'),
(144, 13, 209, 201, 1, '2024-11-21 05:19:20', '2024-11-21 05:19:20'),
(145, 37, 209, 201, 1, '2024-11-21 05:19:20', '2024-11-21 05:19:20'),
(172, 1, 196, 193, 1, '2024-11-22 10:52:21', '2024-11-22 10:52:21'),
(173, 1, 197, 193, 1, '2024-11-22 10:52:25', '2024-11-22 10:52:25'),
(174, 37, 194, 193, 1, '2024-11-23 12:02:50', '2024-11-23 12:02:50'),
(175, 37, 196, 193, 1, '2024-11-23 12:02:50', '2024-11-23 12:02:50'),
(176, 37, 204, 193, 1, '2024-11-23 12:02:50', '2024-11-23 12:02:50'),
(177, 37, 211, 193, 1, '2024-11-23 12:02:56', '2024-11-23 12:02:56'),
(178, 69, 1, NULL, 1, '2024-11-25 07:16:52', '2024-11-25 07:16:52'),
(179, 14, 216, 1, 1, '2024-11-25 08:01:37', '2024-11-25 08:01:37'),
(180, 14, 217, 1, 1, '2024-11-25 08:16:45', '2024-11-25 08:16:45'),
(181, 14, 219, 1, 1, '2024-11-25 08:25:42', '2024-11-25 08:25:42'),
(182, 1, 222, 1, 1, '2024-11-25 08:31:28', '2024-11-25 08:31:28'),
(183, 14, 223, 217, 1, '2024-11-25 09:35:16', '2024-11-25 09:35:16'),
(184, 12, 224, 1, 1, '2024-11-26 13:29:31', '2024-11-26 13:29:31'),
(213, 70, 1, NULL, 1, '2024-12-14 07:40:59', '2024-12-14 07:40:59'),
(214, 1, 198, 1, 1, '2024-12-14 07:42:03', '2024-12-14 07:42:03'),
(216, 37, 198, 1, 1, '2024-12-14 07:42:03', '2024-12-14 07:42:03'),
(217, 70, 198, 1, 1, '2024-12-14 07:42:03', '2024-12-14 07:42:03'),
(221, 2, 198, 1, 1, '2024-12-14 09:57:36', '2024-12-14 09:57:36'),
(226, 1, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(227, 2, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(228, 12, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(229, 13, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(230, 37, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(231, 37, 199, 1, 1, '2024-12-18 05:50:20', '2024-12-18 05:50:20'),
(232, 1, 225, 196, 1, '2024-12-20 07:56:35', '2024-12-20 07:56:35'),
(233, 1, 226, 193, 1, '2024-12-21 06:17:18', '2024-12-21 06:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `menu_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(338, 1, 46, 1, '2024-07-01 04:41:55', '2024-07-01 04:41:55'),
(339, 24, 46, 1, '2024-07-01 04:41:55', '2024-07-01 04:41:55'),
(340, 25, 46, 1, '2024-07-01 04:41:55', '2024-07-01 04:41:55'),
(341, 26, 46, 1, '2024-07-01 04:41:55', '2024-07-01 04:41:55'),
(342, 27, 46, 1, '2024-07-01 04:41:55', '2024-07-01 04:41:55'),
(343, 28, 46, 1, '2024-07-01 04:41:55', '2024-07-01 04:41:55'),
(344, 29, 46, 1, '2024-07-01 04:41:55', '2024-07-01 04:41:55'),
(345, 30, 46, 1, '2024-07-01 04:41:55', '2024-07-01 04:41:55'),
(346, 1, 49, 1, '2024-07-31 05:54:48', '2024-07-31 05:54:48'),
(347, 1, 53, 1, '2024-08-01 01:46:18', '2024-08-01 01:46:18'),
(348, 1, 62, 1, '2024-08-03 06:28:34', '2024-08-03 06:28:34'),
(412, 1, 67, 1, '2024-08-06 01:15:49', '2024-08-06 01:15:49'),
(476, 1, 42, 1, '2024-08-06 01:24:39', '2024-08-06 01:24:39'),
(831, 1, 74, 1, '2024-09-03 00:07:03', '2024-09-03 00:07:03'),
(1028, 1, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1029, 14, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1030, 15, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1031, 17, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1032, 21, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1033, 38, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1034, 39, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1035, 41, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1036, 43, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1037, 52, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1038, 53, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1039, 54, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1040, 55, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1041, 56, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1042, 57, 69, 1, '2024-09-04 05:47:25', '2024-09-04 05:47:25'),
(1043, 1, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1044, 14, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1045, 15, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1046, 17, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1047, 21, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1048, 38, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1049, 39, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1050, 41, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1051, 43, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1052, 52, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1053, 53, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1054, 54, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1055, 55, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1056, 56, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1057, 57, 1, 1, '2024-09-05 23:34:28', '2024-09-05 23:34:28'),
(1068, 1, 40, 1, '2024-09-14 00:33:52', '2024-09-14 00:33:52'),
(1069, 14, 40, 1, '2024-09-14 00:33:52', '2024-09-14 00:33:52'),
(1070, 15, 40, 1, '2024-09-14 00:33:52', '2024-09-14 00:33:52'),
(1111, 1, 64, 1, '2024-09-19 23:54:23', '2024-09-19 23:54:23'),
(1112, 1, 71, 1, '2024-09-20 01:16:52', '2024-09-20 01:16:52'),
(1113, 1, 75, 1, '2024-09-20 02:05:23', '2024-09-20 02:05:23'),
(1116, 1, 39, 1, '2024-09-20 02:22:50', '2024-09-20 02:22:50'),
(1117, 14, 39, 1, '2024-09-20 02:22:50', '2024-09-20 02:22:50'),
(1118, 15, 39, 1, '2024-09-20 02:22:50', '2024-09-20 02:22:50'),
(1119, 14, 78, 1, '2024-09-23 01:22:05', '2024-09-23 01:22:05'),
(1120, 1, 92, 1, '2024-10-17 01:13:43', '2024-10-17 01:13:43'),
(1121, 14, 92, 1, '2024-10-17 01:13:43', '2024-10-17 01:13:43'),
(1122, 15, 92, 1, '2024-10-17 01:13:43', '2024-10-17 01:13:43'),
(1123, 17, 92, 1, '2024-10-17 01:13:43', '2024-10-17 01:13:43'),
(1124, 38, 92, 1, '2024-10-17 01:13:43', '2024-10-17 01:13:43'),
(1125, 14, 101, 1, '2024-10-17 07:27:34', '2024-10-17 07:27:34'),
(1144, 38, 111, 1, '2024-10-18 06:26:18', '2024-10-18 06:26:18'),
(1145, 59, 111, 1, '2024-10-18 06:26:18', '2024-10-18 06:26:18'),
(1146, 65, 111, 1, '2024-10-18 06:26:18', '2024-10-18 06:26:18'),
(1147, 59, 112, 1, '2024-10-18 06:30:35', '2024-10-18 06:30:35'),
(1148, 59, 116, 1, '2024-10-18 07:07:35', '2024-10-18 07:07:35'),
(1149, 59, 118, 1, '2024-10-18 07:20:01', '2024-10-18 07:20:01'),
(1153, 65, 213, 1, '2024-12-09 13:33:42', '2024-12-09 13:33:42'),
(1154, 65, 198, 1, '2024-12-14 07:42:52', '2024-12-14 07:42:52'),
(1159, 65, 209, 1, '2024-12-14 08:02:57', '2024-12-14 08:02:57'),
(1160, 38, 193, 1, '2024-12-17 10:48:25', '2024-12-17 10:48:25'),
(1161, 59, 193, 1, '2024-12-17 10:48:25', '2024-12-17 10:48:25'),
(1162, 65, 193, 1, '2024-12-17 10:48:25', '2024-12-17 10:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_folder_permissions`
--

CREATE TABLE `user_sub_folder_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `access_given_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_sub_folder_permissions`
--

INSERT INTO `user_sub_folder_permissions` (`id`, `sub_folder_id`, `user_id`, `access_given_by`, `status`, `created_at`, `updated_at`) VALUES
(2, 86, 1, NULL, 1, '2024-10-25 02:54:59', '2024-10-25 02:54:59'),
(7, 57, 164, NULL, 1, '2024-10-28 05:15:12', '2024-10-28 05:15:12'),
(8, 57, 175, NULL, 1, '2024-10-28 06:26:05', '2024-10-28 06:26:05'),
(108, 87, 1, NULL, 1, '2024-11-16 10:26:15', '2024-11-16 10:26:15'),
(127, 88, 1, NULL, 1, '2024-11-20 11:31:58', '2024-11-20 11:31:58'),
(145, 87, 196, 193, 1, '2024-11-21 04:44:01', '2024-11-21 04:44:01'),
(146, 7, 196, 193, 1, '2024-11-21 04:44:01', '2024-11-21 04:44:01'),
(147, 8, 196, 193, 1, '2024-11-21 04:44:01', '2024-11-21 04:44:01'),
(148, 9, 196, 193, 1, '2024-11-21 04:44:01', '2024-11-21 04:44:01'),
(149, 10, 196, 193, 1, '2024-11-21 04:44:01', '2024-11-21 04:44:01'),
(151, 57, 201, 196, 1, '2024-11-21 05:11:00', '2024-11-21 05:11:00'),
(152, 87, 201, 196, 1, '2024-11-21 05:11:00', '2024-11-21 05:11:00'),
(153, 7, 201, 196, 1, '2024-11-21 05:11:00', '2024-11-21 05:11:00'),
(154, 8, 201, 196, 1, '2024-11-21 05:11:00', '2024-11-21 05:11:00'),
(155, 9, 201, 196, 1, '2024-11-21 05:11:00', '2024-11-21 05:11:00'),
(156, 10, 201, 196, 1, '2024-11-21 05:11:00', '2024-11-21 05:11:00'),
(157, 55, 201, 196, 1, '2024-11-21 05:11:00', '2024-11-21 05:11:00'),
(158, 57, 209, 201, 1, '2024-11-21 05:19:20', '2024-11-21 05:19:20'),
(159, 87, 209, 201, 1, '2024-11-21 05:19:20', '2024-11-21 05:19:20'),
(160, 7, 209, 201, 1, '2024-11-21 05:19:20', '2024-11-21 05:19:20'),
(161, 8, 209, 201, 1, '2024-11-21 05:19:20', '2024-11-21 05:19:20'),
(162, 9, 209, 201, 1, '2024-11-21 05:19:20', '2024-11-21 05:19:20'),
(163, 10, 209, 201, 1, '2024-11-21 05:19:20', '2024-11-21 05:19:20'),
(164, 55, 209, 201, 1, '2024-11-21 05:19:20', '2024-11-21 05:19:20'),
(165, 89, 1, NULL, 1, '2024-11-21 06:30:18', '2024-11-21 06:30:18'),
(174, 90, 1, NULL, 1, '2024-11-21 06:45:51', '2024-11-21 06:45:51'),
(176, 91, 1, NULL, 1, '2024-11-21 07:57:47', '2024-11-21 07:57:47'),
(178, 92, 1, NULL, 1, '2024-11-21 08:00:08', '2024-11-21 08:00:08'),
(202, 57, 196, 193, 1, '2024-11-22 10:52:21', '2024-11-22 10:52:21'),
(203, 57, 197, 193, 1, '2024-11-22 10:52:25', '2024-11-22 10:52:25'),
(204, 55, 194, 193, 1, '2024-11-23 12:02:50', '2024-11-23 12:02:50'),
(205, 55, 196, 193, 1, '2024-11-23 12:02:50', '2024-11-23 12:02:50'),
(206, 55, 204, 193, 1, '2024-11-23 12:02:50', '2024-11-23 12:02:50'),
(207, 55, 211, 193, 1, '2024-11-23 12:02:56', '2024-11-23 12:02:56'),
(208, 1, 217, 1, 1, '2024-11-25 08:16:45', '2024-11-25 08:16:45'),
(209, 2, 217, 1, 1, '2024-11-25 08:16:45', '2024-11-25 08:16:45'),
(210, 3, 224, 1, 1, '2024-11-26 13:29:31', '2024-11-26 13:29:31'),
(211, 4, 224, 1, 1, '2024-11-26 13:29:31', '2024-11-26 13:29:31'),
(212, 5, 224, 1, 1, '2024-11-26 13:29:31', '2024-11-26 13:29:31'),
(213, 6, 224, 1, 1, '2024-11-26 13:29:31', '2024-11-26 13:29:31'),
(249, 93, 1, NULL, 1, '2024-12-14 07:41:30', '2024-12-14 07:41:30'),
(250, 94, 1, NULL, 1, '2024-12-14 07:41:35', '2024-12-14 07:41:35'),
(251, 95, 1, NULL, 1, '2024-12-14 07:41:40', '2024-12-14 07:41:40'),
(252, 96, 1, NULL, 1, '2024-12-14 07:41:47', '2024-12-14 07:41:47'),
(253, 97, 1, NULL, 1, '2024-12-14 07:41:52', '2024-12-14 07:41:52'),
(254, 57, 198, 1, 1, '2024-12-14 07:42:03', '2024-12-14 07:42:03'),
(257, 55, 198, 1, 1, '2024-12-14 07:42:03', '2024-12-14 07:42:03'),
(258, 89, 198, 1, 1, '2024-12-14 07:42:03', '2024-12-14 07:42:03'),
(259, 91, 198, 1, 1, '2024-12-14 07:42:03', '2024-12-14 07:42:03'),
(260, 93, 198, 1, 1, '2024-12-14 07:42:03', '2024-12-14 07:42:03'),
(261, 94, 198, 1, 1, '2024-12-14 07:42:03', '2024-12-14 07:42:03'),
(262, 95, 198, 1, 1, '2024-12-14 07:42:03', '2024-12-14 07:42:03'),
(263, 96, 198, 1, 1, '2024-12-14 07:42:03', '2024-12-14 07:42:03'),
(264, 97, 198, 1, 1, '2024-12-14 07:42:03', '2024-12-14 07:42:03'),
(267, 87, 198, 1, 1, '2024-12-14 09:55:23', '2024-12-14 09:55:23'),
(268, 87, 213, 1, 1, '2024-12-14 09:56:58', '2024-12-14 09:56:58'),
(270, 92, 198, 1, 1, '2024-12-14 09:57:36', '2024-12-14 09:57:36'),
(281, 57, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(282, 87, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(283, 92, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(284, 3, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(285, 4, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(286, 5, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(287, 7, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(288, 8, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(289, 9, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(290, 10, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(291, 55, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(292, 89, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(293, 91, 193, 1, 1, '2024-12-17 13:38:12', '2024-12-17 13:38:12'),
(294, 55, 199, 1, 1, '2024-12-18 05:50:20', '2024-12-18 05:50:20'),
(295, 89, 199, 1, 1, '2024-12-18 05:50:20', '2024-12-18 05:50:20'),
(296, 91, 199, 1, 1, '2024-12-18 05:50:20', '2024-12-18 05:50:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigned_check_lists`
--
ALTER TABLE `assigned_check_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `check_list_information`
--
ALTER TABLE `check_list_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department_types`
--
ALTER TABLE `department_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_audits`
--
ALTER TABLE `document_audits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_comments`
--
ALTER TABLE `document_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_permissions`
--
ALTER TABLE `document_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file_upload_permissions`
--
ALTER TABLE `file_upload_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_audits`
--
ALTER TABLE `login_audits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_categories`
--
ALTER TABLE `main_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_folders`
--
ALTER TABLE `main_folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_folder_permission_lists`
--
ALTER TABLE `main_folder_permission_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_check_lists`
--
ALTER TABLE `master_check_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `publicly_shared_documents`
--
ALTER TABLE `publicly_shared_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_types`
--
ALTER TABLE `role_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_folders`
--
ALTER TABLE `sub_folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_folder_permission_lists`
--
ALTER TABLE `sub_folder_permission_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_hierarchies`
--
ALTER TABLE `user_hierarchies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_main_folder_permissions`
--
ALTER TABLE `user_main_folder_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_folder_permissions`
--
ALTER TABLE `user_sub_folder_permissions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assigned_check_lists`
--
ALTER TABLE `assigned_check_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=561;

--
-- AUTO_INCREMENT for table `check_list_information`
--
ALTER TABLE `check_list_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=605;

--
-- AUTO_INCREMENT for table `department_types`
--
ALTER TABLE `department_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `document_audits`
--
ALTER TABLE `document_audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=462;

--
-- AUTO_INCREMENT for table `document_comments`
--
ALTER TABLE `document_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `document_permissions`
--
ALTER TABLE `document_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1624;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_upload_permissions`
--
ALTER TABLE `file_upload_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `login_audits`
--
ALTER TABLE `login_audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `main_categories`
--
ALTER TABLE `main_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `main_folders`
--
ALTER TABLE `main_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `main_folder_permission_lists`
--
ALTER TABLE `main_folder_permission_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `master_check_lists`
--
ALTER TABLE `master_check_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publicly_shared_documents`
--
ALTER TABLE `publicly_shared_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role_types`
--
ALTER TABLE `role_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_folders`
--
ALTER TABLE `sub_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `sub_folder_permission_lists`
--
ALTER TABLE `sub_folder_permission_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `user_hierarchies`
--
ALTER TABLE `user_hierarchies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_main_folder_permissions`
--
ALTER TABLE `user_main_folder_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1163;

--
-- AUTO_INCREMENT for table `user_sub_folder_permissions`
--
ALTER TABLE `user_sub_folder_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
