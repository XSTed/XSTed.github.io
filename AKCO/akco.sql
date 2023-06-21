-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2023-06-16 11:37:51
-- 伺服器版本: 5.7.17-log
-- PHP 版本： 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `akco`
--

-- --------------------------------------------------------

--
-- 資料表結構 `addbook`
--

CREATE TABLE `addbook` (
  `addressid` int(10) NOT NULL COMMENT '地址ID',
  `setdefault` tinyint(1) NOT NULL DEFAULT '0' COMMENT '預設收件人',
  `MemberID` int(10) NOT NULL COMMENT '會員編號',
  `Username` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件者姓名',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件者電話',
  `myzip` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '郵遞區號',
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件地址',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `addbook`
--

INSERT INTO `addbook` (`addressid`, `setdefault`, `MemberID`, `Username`, `mobile`, `myzip`, `address`, `create_date`) VALUES
(1, 0, 1, 'test01', '0912345678', '427', '工業區一路101號', '2023-06-01 01:39:24'),
(3, 1, 9, '林小強', '0912345678', '407', '工業區一路100號', '2021-04-22 02:39:50'),
(4, 0, 10, '李小明', '0934567891', '105', '中正路1號', '2021-04-22 02:41:48'),
(8, 0, 10, '陳小信', '0934567891', '223', '中正路1號', '2021-04-22 02:41:48'),
(9, 0, 10, '曹小成', '0934567891', '290', '中正路1號', '2021-04-22 02:41:48'),
(10, 1, 10, '張山山', '0934567891', '407', '工業區一路100號', '2021-04-23 12:00:59'),
(17, 1, 2, 'test02', '0912345678', '427', '工業區一路101號', '2023-06-01 05:35:09'),
(18, 1, 3, 'test03', '0912345678', '427', '工業區一路100號', '2023-06-02 08:10:49'),
(19, 0, 1, 'test', '0912345678', '427', '工業區一路100號', '2023-06-09 06:33:35'),
(20, 1, 1, 'test11', '0912345678', '427', '工業區一路101號', '2023-06-09 06:40:48');

-- --------------------------------------------------------

--
-- 資料表結構 `carousel`
--

CREATE TABLE `carousel` (
  `caro_id` int(3) NOT NULL COMMENT '輪播編號',
  `caro_title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '輪播標題',
  `caro_content` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '輪播內容介紹',
  `caro_online` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上下架',
  `caro_sort` int(3) NOT NULL COMMENT '輪播排序',
  `caro_pic` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '輪播圖檔名稱',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `carousel`
--

INSERT INTO `carousel` (`caro_id`, `caro_title`, `caro_content`, `caro_online`, `caro_sort`, `caro_pic`, `p_id`, `create_date`) VALUES
(1, 'McLaren Charlotte', 'McLaren GT', 1, 1, 'carousel2_0.png', 34, '2023-05-24 03:54:55'),
(2, 'Toyota-Suzuki', 'Partnership', 1, 2, 'carousel2_1.png', 35, '2023-05-24 03:56:31'),
(3, 'Porsche Vision', 'Gran Turismo', 1, 3, 'carousel2_2.png', 29, '2023-05-24 04:00:11'),
(4, 'McLaren Artura V6 Hybrid', 'McLaren Artura V6 Hybrid\r\n', 0, 4, 'McLaren Artura V6 Hybrid.jpeg', 33, '2023-05-24 04:01:40');

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `cartid` int(10) NOT NULL COMMENT '購物車編號',
  `MemberID` int(10) DEFAULT NULL COMMENT '會員編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `p_spec` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(3) NOT NULL COMMENT '產品數量',
  `orderid` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '訂單編號',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '訂單處理狀態',
  `ip` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '訂購者的IP',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入購物車時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `cart`
--

INSERT INTO `cart` (`cartid`, `MemberID`, `p_id`, `p_spec`, `qty`, `orderid`, `status`, `ip`, `create_date`) VALUES
(66, 10, 42, '', 3, '1619161669175448', 1, '::1', '2021-04-23 07:06:48'),
(67, 10, 43, '', 3, '1619161669175448', 1, '::1', '2021-04-23 07:06:54'),
(68, 10, 15, '', 13, '1619161669175448', 1, '::1', '2021-04-23 07:07:03'),
(69, 10, 27, '', 2, '1619161669175448', 1, '::1', '2021-04-23 07:07:15'),
(70, 10, 51, '', 1, '1619161734581887', 1, '::1', '2021-04-23 07:08:16'),
(71, 10, 47, '', 1, '1619161734581887', 1, '::1', '2021-04-23 07:08:20'),
(72, 10, 46, '', 1, '1619161734581887', 1, '::1', '2021-04-23 07:08:24'),
(74, 10, 27, '', 1, '1619181180278775', 1, '::1', '2021-04-23 07:22:31'),
(76, 10, 26, '', 1, '1619181180278775', 1, '::1', '2021-04-23 07:22:38'),
(78, 10, 51, '', 1, '1619260500232495', 1, '::1', '2021-04-23 12:39:53'),
(79, 10, 28, '', 2, '1619260500232495', 1, '::1', '2021-04-23 12:39:56'),
(80, 10, 25, '', 3, '1619260500232495', 1, '::1', '2021-04-23 12:39:59'),
(81, 10, 21, '', 1, '1619260500232495', 1, '::1', '2021-04-23 12:40:03'),
(82, 10, 48, '', 1, '1619261102143533', 1, '::1', '2021-04-24 10:43:59'),
(83, 10, 47, '', 1, '1619261102143533', 1, '::1', '2021-04-24 10:44:02'),
(84, 10, 46, '', 1, '1619261102143533', 1, '::1', '2021-04-24 10:44:04'),
(86, 10, 45, '', 1, '1619261102143533', 1, '::1', '2021-04-24 10:44:12'),
(87, 10, 20, '', 1, '1619261102143533', 1, '::1', '2021-04-24 10:44:20'),
(88, 10, 19, '', 1, '1619261102143533', 1, '::1', '2021-04-24 10:44:25'),
(89, 10, 50, '', 1, '1619261151557635', 1, '::1', '2021-04-24 10:45:29'),
(90, 1, 1, 'V8', 1, '1686183488387319', 1, '::1', '2023-06-06 07:12:51'),
(91, 1, 1, 'V8', 1, '1686183488387319', 1, '::1', '2023-06-06 07:54:35'),
(92, 1, 1, 'V8', 1, '1686193148497924', 1, '::1', '2023-06-08 02:58:53'),
(101, 1, 1, 'V8', 2, '1686292861596362', 1, '::1', '2023-06-09 06:27:57');

-- --------------------------------------------------------

--
-- 資料表結構 `city`
--

CREATE TABLE `city` (
  `AutoNo` int(10) NOT NULL COMMENT '城市編號',
  `Name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT '城市名稱',
  `cityOrder` tinyint(2) NOT NULL COMMENT '標記',
  `State` smallint(6) NOT NULL COMMENT '狀態'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `city`
--

INSERT INTO `city` (`AutoNo`, `Name`, `cityOrder`, `State`) VALUES
(1, '臺北市', 0, 0),
(2, '基隆市', 0, 0),
(3, '新北市', 0, 0),
(4, '宜蘭縣', 0, 0),
(5, '新竹市', 0, 0),
(6, '新竹縣', 0, 0),
(7, '桃園市', 0, 0),
(8, '苗栗縣', 0, 0),
(9, '台中市', 0, 0),
(10, '彰化縣', 0, 0),
(11, '南投縣', 0, 0),
(12, '雲林縣', 0, 0),
(13, '嘉義市', 0, 0),
(14, '嘉義縣', 0, 0),
(15, '台南市', 0, 0),
(16, '高雄市', 0, 0),
(17, '南海諸島', 0, 0),
(18, '澎湖縣', 0, 0),
(19, '屏東縣', 0, 0),
(20, '台東縣', 0, 0),
(21, '花蓮縣', 0, 0),
(22, '金門縣', 0, 0),
(23, '連江縣', 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `hot`
--

CREATE TABLE `hot` (
  `h_id` int(3) NOT NULL COMMENT '熱銷商品流水號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `h_sort` int(3) DEFAULT NULL COMMENT '熱銷商品排名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `hot`
--

INSERT INTO `hot` (`h_id`, `p_id`, `h_sort`) VALUES
(1, 13, 1),
(2, 14, 2),
(3, 15, 3);

-- --------------------------------------------------------

--
-- 資料表結構 `items`
--

CREATE TABLE `items` (
  `ItemID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Brand` varchar(64) NOT NULL,
  `Description` varchar(512) NOT NULL,
  `Category` int(11) NOT NULL,
  `SellingPrice` float NOT NULL,
  `QuantityInStock` int(11) NOT NULL,
  `Image` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `items`
--

INSERT INTO `items` (`ItemID`, `Name`, `Brand`, `Description`, `Category`, `SellingPrice`, `QuantityInStock`, `Image`) VALUES
(3, 'RTX 3070 PC - Best price to performance PC (16GB Ram 1TB SSD)', 'Mixed', 'CPU: INTEL CORE i5-10400F,\r\nCooler: CRYORIG H7 QUAD LUMI,\r\nMOBO: ASUS TUF Gaming B460-PRO WIFI, \r\nRAM: G.SKILL TRIDENT Z ROYAL 2X8GB CL18 DDR4 3600MHZ,\r\nGPU: EVGA GeForce RTX 3070 XC3 ULTRAGAMING 2x8GB GDDR6,\r\nPSU: GIGABYTE P650B 80+ BRONZE NON-MODULAR,\r\nCase: ANTEC NX410 BLACK, \r\nSSD: CORSAIR Force Series MP510 1TB M.2 NVMe, \r\nHDD: Western Digital WD BLUE 1TB SATA,\r\nFREE Lamptron Flexlight Multi Programmable ARGB LED Strip                                               ', 0, 6950, 29, '3070 pc.jpg'),
(4, 'OGTECH EPIC All-Rounder RTX 3060TI PC (16GB Ram 1TB SSD)', 'Mixed', 'CPU: INTEL i5-10400F MOBO: GIGABYE B450M DS3H V2, \r\nRAM: G.SKILL AEGIS Series 8GB DDR4 3200MHz x2,\r\nGPU: GIGABYTE GeForce RTX 3060TI EAGLE OC 8G DDR6,\r\nPSU: ANTEC NE550C V2 80+ BRONZE,\r\nCASE: ANTEC NX410 BLACK\r\nSSD: GIGABYTE 1TB SATA,\r\nWIFI: ASUS PCE-AX3000 WIFI6 PCIE,\r\nFREE Lamptron Flexlight Multi Programmable ARGB LED Strip                                                ', 0, 5991, 15, '3060 ti pc.jpg'),
(5, 'Nvidia Geforce RTX 3080 PC King Value (16 GB Ram)', 'Mixed', 'CPU: AMD RYZEN 7 3700X, \r\nCooler: CRYORIG H7 MOBO: GIGABYTE B450 AORUS PRO WIFI,\r\nRAM: G.SKILL TRIDENT Z NEO 2X8GB CL16 DDR4 3200MHZ, \r\nGPU: GIGABYTE GeForce RTX 3080 GAMING OC 10GB GDDR6X,\r\nPSU: ANTEC HCG Gold Series 850W 80+ GOLD FULLY MODULAR,\r\nCase: ANTEC DF700 FLUX, \r\nSSD: CORSAIR Force Series MP510 480GB M.2 NVMe,\r\nFREE Cablemod Premium Sleeved Cables,\r\nFREE Lamptron Flexlight Multi Programmable ARGB LED Strip                                ', 0, 8668, 20, '3080 pc.jpg'),
(6, 'OGTech Best Value AMD RTX™ 3060 PC (16GB Ram)', 'Mixed', 'Graphic Card : GIGABYTE GeForce RTX™ 3060 12GB EAGLE OC,\r\nProcessor : AMD Ryzen 5 3600,\r\nMotherboard : MSI B450M-A Pro Max,\r\nRAM : GSKILL AEGIS DDR4 3200Mhz (2x8gb),\r\nSSD: GIGABYTE NVMe SSD 256GB,\r\nPower Supply :ANTEC CSK550 Bronze,\r\nCasing : ANTEC NX410 Black or White                ', 0, 4599, 35, 'pc-rtx3060.jpg'),
(7, 'OGTECH STREAMER PC NVIDIA GTX1660 SUPER w 32GB RAM', 'Mixed', 'CPU: INTEL i5 10400F MOBO: GIGABYTE B460M DS3H AC RAM: G.SKILL TridentZ RGB 2x16GB DDR4 3200MHz GPU: GIGABYTE GeForce GTX1660 SUPER WF OC PSU: ANTEC CSK550 GB 80+ BRONZE CASE: ZALMAN K1 ATX RGB CASE SSD: XPG SX8200 PRO M.2 1TB SSD HDD: WESTERN DIGITAL 2TB CAVIAR BLUE', 0, 3899, 5, 'RM4761_SE580E-scaled.jpg'),
(8, 'Asus VG258QR (24.5\')', 'Asus', '                                    Panel size 24.5″. IPS Panel. Non-glare display surface. 16:9 aspect ratio. 1920 x 1080 resolution. Refresh rate 165hz, 0.5ms reponse time. Anti-Flicker.                                ', 1, 888, 25, 'asus_monitor.jpg'),
(9, 'OGTECH GEFORCE ESPORTS PC GTX1050Ti', 'Mixed', 'Processor : INTEL  Core I3-10105F Graphic Card : AFOX GEFORCE GTX1050TI 4GB Motherboard :GIGABYTE B460M DS3H V2 RAM : GSKILL AEGIS DDR4 3200Mhz (1 x8gb) SSD: GIGABYTE NVMe SSD 256GB Power Supply: ANTEC CSK550 Bronze Casing : ANTEC DP301M (x2 fans included)', 0, 2399, 5, 'pc-1050ti.png'),
(10, 'OGTech Entry RTX™ PC NVIDIA® GeForce RTX™ 3050', 'Mixed', 'Graphic Card :Nvidia Geforce RTX™ 3050 8GB Processor : INTEL Core I3-10105F Motherboard : GIGABYTE B460M DS3H V2 RAM : GSKILL AEGIS 8GB DDR4 3200Mhz SSD: GIGABYTE NVMe SSD 256GB Power Supply :ANTEC CSK550 Bronze Casing : ANTEC NX270 RGB', 0, 3299, 50, 'pc-rtx3050.jpg'),
(11, 'Viewsonic XG2401 (24\')', 'Viewsonic', '1ms response time. AMD FreeSync™ technology. SmartSync technology. Black stabilisation. 144Hz Refresh Rate', 1, 799.99, 10, 'view monitor.png'),
(12, 'ACER Predator Aethon 500 keyboard', 'Acer', 'Blue switch mechanical keys.  70 million keystroke-rated. Rgb controlled software. ', 2, 399, 2, 'acer keyboard.png'),
(13, 'ACER basic speakers', 'Acer', '                  Sufficient for daily use. Stylish design.                 ', 1, 39.99, 15, 'acer speaker.jpg'),
(14, 'ASUS ROG Strix Magnus Mic @ Studio grade mic', 'Asus', 'ROG Strix Magnus USB condenser gaming microphone with AURA RGB lighting and environmental noise cancellation (ENC) for gaming/streaming  Three studio-grade condenser capsules for enhanced clarity and sensitivity Designed for live streamers with compact form factor and environmental noise cancellation (ENC) Stylish and customizable Aura RGB lighting effects Auxiliary port for recording audio from musical instruments and mobile devices Comes with external USB hub for connecting additional devices', 2, 699, 2, 'asus mic.jpg'),
(15, 'CORSAIR VIRTUOSO RGB WIRELESS headset', 'Corsair', '                  A matched pair of precisely tuned 50mm high-density neodymium drivers boast a frequency range of 20Hz-40,000Hz – double what you’d get from most gaming headsets. Premium memory foam.  Made from aluminium for light weight. Wired option available.                ', 1, 737, 15, 'corsair headset.png'),
(16, 'CORSAIR rgb mouse', 'Corsair', '                                                      Premium comfort mouse. Outstanding corsair rgb logo on lit. Rubber grip for more comfort.                                                ', 2, 50, 15, 'corsair mouse.jpg'),
(17, 'HYPERX cloud stinger headset', 'HyperX', '                  Outstanding mic and audio quality. Made from premium hard plastic for light weight. Comfortability is a must.                ', 1, 299, 15, 'hyper headset.jpg'),
(18, 'HyperX Quadcast RGB mic', 'HyperX', '                  Built-in headphone jack. Internal pop filter. Convenient gain control adjustment. Four selectable polar patterns. Tap-to-Mute sensor with LED indicator. Dynamic RGB lighting effects customizable with HyperX NGENUITY Software. Anti-Vibration shock mount.                 ', 2, 599, 18, 'hyper mic.jpg'),
(19, 'LOGITECH G550 RGB Headset', 'Logitech', '                  More ear room for maximum comfort. Made from light weight plastic for comfort. Premium mic and audio quality. RGB is pog.                ', 1, 399, 15, 'logi headset.jfif'),
(20, 'Logitech G850 Wireless RGB Tournament Keyboard', 'Logitech', '                                    Premium blue keycaps made from overseas. Customizable RGB with software. 87 keys for more mouse room. Made from premium aluminium.                                ', 2, 899, 15, 'logi keyboard.png'),
(21, 'LOGITECH entry desktop mic', 'Logitech', '                  Good audio quality. Anti vibration pad. Adjustable mic.                 ', 2, 39.99, 10, 'logi mic.jpg'),
(22, 'LOGITECH Z250 RGB Speakers', 'Logitech', '                  Simple yet stylish speakers. RGB makes listening music more fun. RGB can sync along music with logitech software.                ', 1, 299.99, 15, 'logi speaker.png'),
(23, 'MSI DS502 gaming headset', 'MSI', 'Enhanced Virtual 7.1 Surround Sound. Intelligent Vibration System. Smart Audio Controller. Enhanced 40mm High Quality Drivers. Cool LED Light. Light weight & Self-adjusting Headband Design.', 1, 249.99, 20, 'msi headset.png'),
(24, 'MSI Optix MPG341CQR Smart RGB Curved Gaming Monitor (34\')', 'MSI', '                  34 inch 3440x1440 Frameless design – Ultimate gameplay experience. 178° wide view angle. HDR 400 - Stunning Visuals with the Most Criterion Format. 1ms response time - eliminate screen tearing and choppy frame rates. 144Hz Refresh Rate – The real smooth gaming. Curved Gaming display (1800R) – The best gameplay immersion. UWQHD High Resolution - Game titles will even look better, displaying more details due to the UWQHD resolution.                ', 1, 2888, 15, 'msi monitor 2.jpg'),
(25, 'RAZER Kraken V2 Pro Headset', 'Razer', 'Custom-tuned 50 mm Drivers. Cooling Gel-Infused Cushions. Retractable Unidirectional Microphone. Clear & Powerful Sound Thicker Headband Padding Play Comfortably for Hours', 1, 399.99, 20, 'razer headset 2.jpg'),
(26, 'RAZER Blackwidow Keyboard Green Switch 2019', 'Razer', '                                    Razer Green Mechanical Switches designed for gaming 80 million keystroke lifespan Razer Chroma customizable backlighting with 16.8 million color options Hybrid On-Board Memory and Cloud Storage – up to 5 profiles Razer Synapse 3 enabled Cable routingoptions N-key roll-over with built-in anti-ghosting Fully programmable keys with on-the-fly macro recording Gaming mode option 1000 Hz Ultrapolling Instant Trigger Technology                                ', 2, 269.99, 15, 'razer keyboard.jfif'),
(27, 'RAZER Seirēn X - Black', 'Razer', 'Ultra-Precise Pickup Pattern Shock Resistant Compact Form Factor', 2, 319.99, 10, 'razer mic.jfif'),
(28, 'RAZER RAPTOR 27 1440P 165 HZ', 'Razer', 'VESA COMPATIBLE and cable management. WORLD’S FIRST THX® CERTIFIED GAMING MONITOR. 165HZ HIGH SPEED. QHD HIGH RESOLUTION. Gsync and Freesync compatible. ', 1, 3199.99, 2, 'razer monitor.jpg'),
(29, 'RAZER BASILISK V3', 'Razer', '                  PERFECTING SCROLLING. FULL SPECTRUM CUSTOMIZABILITY. 10+1 PROGRAMMABLE BUTTONS. Profile switching.                 ', 2, 259, 15, 'razer mouse.jfif'),
(30, 'RAZER Nommo Pro', 'Razer', 'SOLID, UNRESTRICTED BASS. THX CERTIFIED PREMIUM AUDIO. Top notch Studio grade quality audio. POWERFUL CINEMATIC IMMERSION dolby audio certified.', 1, 3098, 2, 'razer speaker.jfif'),
(32, 'Viewsonic Elite XG350R-C 35” Curved ', 'Viewsonic', '                  100Hz refresh rate. ClearMotion backlight strobing technology. 3440 X 1440 Ultra Wide QHD resolution. ELITE RGB Alliance. Adaptive Sync & AMD FreeSync™ technology.                 ', 1, 2077, 15, 'viewsonic monitor.png'),
(33, 'Logitech G102 RGB mouse', 'Logitech', '                  8,000 DPI. LIGHTSYNC RGB featuring color wave effects customizable across ~16.8 million colors.                ', 2, 69.99, 30, 'logi mouse.jpg'),
(34, 'LOGITECH G502 Gaming Mouse', 'Logitech', 'The best selling mouse in the world, featuring customizable weight. 5 programmable buttons with rgb logo. Durable materials and comfortable engineered grip. 70 millions clicks life span.', 2, 159, 50, 'g502.jpg'),
(35, 'ACER Nitro VG270 27\" 75hz', 'Acer', '1920x1080p IPS Freesync 1ms with virtual response boost up to 0.5ms', 1, 719.99, 28, 'acer monitor.jfif'),
(36, 'Acer Aopen 24CV1Y Monitor (23.8\")', 'Acer', 'Full HD, VA Panel, 5ms(GTG) Respond Time, 75Hz Refresh Rate', 1, 499, 30, 'acer budget monitor.jfif'),
(37, 'Steelseries QCK EDGE L - 450mm x 400mm x 2mm ', 'Steelseries', '                  One of the best selling Cloth Gaming Mouse Pad in the world. Extremely smooth yet durable.                ', 2, 60, 30, 'steelseries l.png'),
(38, 'Steelseries QCK EDGE - XL 900mm x 300mm x 2mm', 'Steelseries', 'One of the best selling mouse mat in the world. Made from premium woven and rubber. Anti slip back and smooth surface.', 2, 119, 50, 'steelseries xl.jfif'),
(39, 'OGTECH OFFICE PC COMPACT', 'Mixed', 'Processor : AMD Ryzen 5 PRO 4650G Motherboard : ASROCK B550M ITX/AC (Wifi) RAM : GSKILL AEGIS DDR4 3200Mhz (1 x8gb) SSD: GIGABYTE NVMe SSD 256GB Casing : ANTEC ISK310-150 Mini-ITX CASE with psu', 0, 2099, 10, 'compact pc.png');

-- --------------------------------------------------------

--
-- 資料表結構 `members`
--

CREATE TABLE `members` (
  `MemberID` int(11) NOT NULL,
  `Username` varchar(64) NOT NULL,
  `Password` varchar(512) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `PrivilegeLevel` int(11) NOT NULL DEFAULT '0',
  `Attempt` int(1) DEFAULT NULL,
  `RegisteredDate` date DEFAULT NULL,
  `Authcode` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `State` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `members`
--

INSERT INTO `members` (`MemberID`, `Username`, `Password`, `Email`, `PrivilegeLevel`, `Attempt`, `RegisteredDate`, `Authcode`, `State`) VALUES
(1, 'test01', '$2y$10$r3.7soFspp0Xg0uJLZ3vCOMsyb8WB7q88t/9aNU2LLutblaD6dLmS', 'test01@gmail.com', 0, 3, '2023-05-31', '56ab9f31', '1'),
(2, 'test02', '$2y$10$.eimsQJmKJkXTezjNHD5Je6Cz3tBzDioe6TC/9H0LSowDhwf3QwnG', 'test02@gmail.com', 0, 3, '2023-06-01', 'bb99d8c4', '1'),
(3, 'test03', '$2y$10$FD4EjQj5qhehcJJnAgmjQ.Y2gI0T53z6YajSM7YUhAsRjQHNCDjcK', 't03@gmail.com', 0, 3, '2023-06-02', 'a45437ba', '1');

-- --------------------------------------------------------

--
-- 資料表結構 `orderitems`
--

CREATE TABLE `orderitems` (
  `OrderItemID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Price` float NOT NULL,
  `Quantity` int(11) NOT NULL,
  `AddedDatetime` datetime NOT NULL,
  `Feedback` varchar(512) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `RatingDateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `orderitems`
--

INSERT INTO `orderitems` (`OrderItemID`, `OrderID`, `ItemID`, `Price`, `Quantity`, `AddedDatetime`, `Feedback`, `Rating`, `RatingDateTime`) VALUES
(37, 24, 3, 6950, 1, '2022-03-13 00:43:58', 'Best PC that i ever purchased. Thanks OGTECH for your service.', 5, '2022-03-13 19:36:36'),
(56, 28, 3, 6950, 1, '2022-03-13 23:49:08', 'The PC is good as its name, best price to performance PC. The GPU is TOP 10 currently for best price to performance. Anyways, good service must buy from this shop.', 5, '2022-03-14 00:35:25'),
(57, 28, 5, 8668, 1, '2022-03-13 23:49:39', 'EZ KATKA. GOOD SERVICE. BEST VALUE. KING OF PC. THANKS OGTECH', 5, '2022-03-14 00:35:51'),
(58, 28, 6, 4599, 1, '2022-03-13 23:49:45', 'Best value PC ever. Thanks OGTECH for the good service and good parts and good prices. Everything works fine.', 5, '2022-03-14 00:36:24'),
(59, 28, 10, 3299, 1, '2022-03-13 23:52:19', 'Best entry PC. 3050 basically can run cyberpunk is max settings 1080p 60fps lol. Thanks OGTECH', 5, '2022-03-14 00:37:06'),
(60, 28, 35, 719.99, 2, '2022-03-13 23:53:25', 'No deadpixel or dead color. Good service and fast delivery. Thanks OGTECH', 5, '2022-03-14 00:37:51'),
(61, 29, 3, 6950, 1, '2022-03-14 11:07:27', 'Shipping is a bit late due to Chinese New Year. Minus one star for that, while everything else is okay. Thanks OGTECH', 4, '2022-03-14 11:08:40');

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL,
  `CartFlag` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `orders`
--

INSERT INTO `orders` (`OrderID`, `MemberID`, `CartFlag`) VALUES
(24, 5, b'1'),
(27, 2, b'1'),
(28, 5, b'1'),
(29, 5, b'1'),
(30, 5, b'1'),
(31, 22, b'1'),
(32, 23, b'1'),
(33, 24, b'1'),
(34, 25, b'1'),
(35, 26, b'1'),
(36, 27, b'1'),
(37, 28, b'1'),
(38, 29, b'1'),
(39, 30, b'1'),
(40, 31, b'1'),
(41, 32, b'1'),
(42, 33, b'1'),
(43, 34, b'1'),
(44, 35, b'1'),
(45, 36, b'1'),
(46, 37, b'1'),
(47, 38, b'1'),
(48, 39, b'1'),
(49, 40, b'1'),
(50, 41, b'1'),
(51, 42, b'1'),
(52, 43, b'1'),
(53, 44, b'1'),
(54, 45, b'1'),
(55, 46, b'1'),
(56, 47, b'1'),
(57, 48, b'1'),
(58, 49, b'1'),
(59, 50, b'1'),
(60, 51, b'1'),
(61, 52, b'1'),
(62, 53, b'1'),
(63, 54, b'1'),
(64, 55, b'1'),
(65, 56, b'1'),
(66, 57, b'1'),
(67, 58, b'1'),
(68, 59, b'1'),
(69, 60, b'1'),
(70, 61, b'1'),
(71, 66, b'1'),
(72, 67, b'1'),
(73, 68, b'1'),
(74, 69, b'1'),
(75, 70, b'1'),
(76, 71, b'1'),
(77, 72, b'1'),
(78, 73, b'1'),
(79, 74, b'1'),
(80, 75, b'1'),
(81, 76, b'1'),
(82, 77, b'1'),
(83, 78, b'1'),
(84, 79, b'1'),
(85, 2, b'1'),
(86, 3, b'1');

-- --------------------------------------------------------

--
-- 資料表結構 `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `PaymentDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `payment`
--

INSERT INTO `payment` (`PaymentID`, `OrderID`, `PaymentDate`) VALUES
(6, 24, '2022-03-13'),
(7, 28, '2022-03-14'),
(8, 29, '2022-03-14');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `p_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '產品名稱',
  `p_spec` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `p_intro` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '產品簡介',
  `p_price` int(11) DEFAULT NULL COMMENT '產品單價',
  `p_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上架',
  `p_content` text COLLATE utf8_unicode_ci COMMENT '產品詳細規格',
  `p_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '產品輸入日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `product`
--

INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_spec`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES
(1, 21, 'Ferrari 458 Italia', 'V8', '全新設計的4.5升V8引擎具備缸內直噴技術、壓縮比高達12.5：1，再加上最高可達9000rpm的賽車式高轉化設定，最大馬力來到驚人的570hp，比起前代車款最終版本F430 Scuderia的510hp還足足多出60hp，同時容積效率也一口氣提升到127hp/ltr。除了換上全新引擎。\r\n', 1379, 1, '<div class=\"Intro__text__2JBv1kY9\"><p>Inarrestabile il successo della Ferrari 458 Italia che continua ad ottenere importanti riconoscimenti a livello internazionale.</p><p>Il suo già nutrito palmares vanta anche titoli quali “Miglior motore prestazionale” e “Miglior motore con cilindrata superiore ai 4 litri” sempre per il propulsore della berlinetta di Maranello.</p><p>Il successo di critica e di pubblico della 458 Italia non conosce frontiere.</p></div>', '2023-05-05 06:54:08'),
(2, 22, 'Ferrari 296 GTS V6 Hybrid', '', 'Ferrari 296 GTS這台全新躍馬雙座Berlinetta敞篷跑車採用後中置引擎配置，並承襲296 GTB的美形設計與尖端造車科技，不論在賽道上極限操駕或是日常駕駛均可帶來純粹的駕馭激情。', 1822, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"Touch in SOL光之瀅 蜂蜜保濕隔離凝露32g，除了Touch in SOL等推薦品牌，屈臣氏提供多種熱銷隔離乳/霜商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品 預計出貨日2-5天</p><p>&nbsp;<img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/200147/20201207154239003560.jpg\"></p></div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">高保濕乾性肌膚推薦 蜂蜜般絲滑質地打底同時護理肌膚 滋潤肌膚體驗從肌膚深處散發出的緊緻光彩</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">Touch in SOL</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">32g</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">有效期限</td><td class=\"td2\">3年</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>南韓</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 06:57:53'),
(3, 22, 'Ferrari 296 GTB V6 Hybrid', '', 'Ferrari雙座Berlinetta車型家族最新力作 — 296 GTB，為躍馬品牌旗下首款搭載V6插電式混合動力系統的公路跑車，集強悍動力與非凡性能於一身，無論是極限操控或是日常駕駛均帶來純粹的駕馭激情。', 1688, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"DHC 維他命B群(90日份)，除了DHC等推薦品牌，屈臣氏提供多種熱銷基礎營養其他商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>DHC維他命B群是以均衡比例添加維他命B1、B2、B6、B12、葉酸、泛酸、菸鹼酸、生物素、肌醇等9種營養素有助於維持能量正常代謝增進肌膚、神經系統、黏膜及消化系統的健康每日攝取可常保充沛活力讓您天天神采奕奕。</p><br><br><p>維他命B群是協助胺基酸等營養素代謝的必要成分每種營養素都分別具有不同的特性及功能彼此間的作用相輔相成缺一不可因此建議最好能均衡攝取。</p><br><br><p>需特別留意的是維他命B群屬於人體無法自行合成的水溶性維他命不僅無法儲存在體內也容易隨著汗水或尿液而流失所以需要每天積極補充。</p><br><br><p>食物來源</p><br><br><p>五榖雜糧、瘦肉、肝臟、蛋黃、乳酪、牛奶等。</p><br><br><p>各營養素的主要生理功能</p><br><br><p>維他命B1-----能幫助維持肌膚、心臟及神經系統的正常功能</p><br><br><p>維他命B2-----有助於維持能量正常代謝及維持肌膚健康</p><br><br><p>維他命B6-----可維持胺基酸正常代謝及維持紅血球正常型態</p><br><br><p>維他命B12---有助於紅血球的形成及增進神經系統的健康</p><br><br><p>葉酸-----------有助於核酸、核蛋白及紅血球的形成是維持胎兒正常生長發育的必備營養素</p><br><br><p>泛酸-----------有助於體脂肪、膽固醇的合成及胺基酸的代謝</p><br><br><p>菸鹼素--------可增進肌膚、神經系統、黏膜及消化系統的健康</p><br><br><p>生物素--------有助於脂肪與肝醣的合成增進皮膚和黏膜健康</p><br></div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">常保充沛活力天天神采奕奕</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">DHC</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">90日份180粒</td></tr><tr><td class=\"td1\">原產地</td><td class=\"td2\">台灣</td></tr><tr><td class=\"td1\">深、寬、高</td><td class=\"td2\">1x12x17cm</td></tr><tr><td class=\"td1\">淨重</td><td class=\"td2\">44.1 g</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">Y</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">內容物名稱</td><td class=\"td2\">菸鹼醯胺、預糊化澱粉、維生素B6</td></tr><tr><td class=\"td1\">食品添加物名稱</td><td class=\"td2\">微結晶纖維素、肌醇、泛酸鈣、維生素B1 、維生素B2、葉酸維生素B12</td></tr><tr><td class=\"td1\">營養成份</td><td class=\"td2\">依照產品說明</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">依外包裝顯示</td></tr><tr><td class=\"td1\">有效日期</td><td class=\"td2\">3年</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">90日份</td></tr><tr><td class=\"td1\">內容量</td><td class=\"td2\">180粒</td></tr><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">第17AML0000693號</td></tr><tr><td class=\"td1\">注意事項</td><td class=\"td2\">請依照每日建議量食用多食無益。請置於陰涼乾燥處避免陽光直射。</td></tr><tr><td class=\"td1\">其他</td><td class=\"td2\">每日2粒早晚搭配開水分次食用</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">A-189403744-00000-7</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>TW</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>17</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>12</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 07:18:44'),
(4, 25, 'Lamborghini Huracan Tecnica V10', '', 'Lamborghini Huracan Tecnica承襲蠻牛車系超凡性能靈魂，以純粹後驅V10 自然進氣引擎之姿，全方位滿足極盡賽道熱血與舒適日常行駛所需。Tecnica的命名忠實呈現Huracan車系技術實力的絕佳成就，嶄新外觀融合先端科技與優化的空氣動力學設計，提供迅速敏捷的駕駛回應及操控感受，能適應各色路況，完美演繹超級跑車暢遊公路與賽道的多功能性，釋放無盡樂趣。', 1368, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"【GNC健安喜】孕養調理 葉酸800食品錠 100錠，除了GNC 健安喜等推薦品牌，屈臣氏提供多種熱銷女性保健其他商品選擇，全面符合您的需求。\">\r\n				<p><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"360\" src=\"https://www.youtube.com/embed/ewrClgkTwQM?enablejsapi=1&amp;origin=https%3A%2F%2Fwww.watsons.com.tw\" width=\"640\" data-gtm-yt-inspected-1471862_269=\"true\" id=\"384096915\" style=\"width: 958px;\" data-gtm-yt-inspected-1_25=\"true\"></iframe></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品 預計出貨日2-5天</p><p><strong><span style=\"color:#EE82EE\">產品特色及說明</span></strong></p><br><br><p>-為水溶性維他命B群中的成員之一。<br><br>-每顆含有800微克的葉酸成分。<br><br>-參與紅血球的形成也參與核酸及核蛋白的形成。<br><br>-為輔酶組成成分之一。<br><br>-適合準媽媽的營養需求有助胎兒的正常發育與生長也讓寶寶更聰明健康。<br><br>-適合一般成年男女維持好氣色。<br><br>-顆粒小易於食用沒有吞嚥問題。</p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/182175/20200722104443592402.jpg\" style=\"height:379px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/182175/20200722104528252403.jpg\" style=\"height:406px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/182175/20200722104543639404.jpg\" style=\"height:488px; width:650px\"></p><br></div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">孕媽咪養胎必備</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">GNC 健安喜</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">100錠/瓶</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">已投保</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">依商品外包裝標示為主</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">100錠/瓶</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">A-127952240-00000-9</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">新加坡商傲旎開發股份</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>US</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 07:41:33'),
(5, 25, 'Lamborghini Huracan STO V10', '', '蘊含Lamborghini Huracan賽車的動態科技與性能基因，並傳承蟬聯三屆Daytona 24小時耐久賽與兩度勇奪Sebring 12小時耐久賽GTD級別桂冠的獨特成就，由內而外完美演繹極勁非凡的賽場神髓，Huracan STO化為公路傳奇姿態，續寫賽道榮耀。', 1990, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"burner倍熱夜孅胺基酸EX PLUS 40顆入，除了船井生醫等推薦品牌，屈臣氏提供多種熱銷基礎代謝商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091216869036.jpg\" style=\"height:310px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091226280037.jpg\" style=\"height:310px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091234380038.jpg\" style=\"height:825px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091254580039.jpg\" style=\"height:940px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091303890040.jpg\" style=\"height:1100px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091312906041.jpg\" style=\"height:360px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091321074043.jpg\" style=\"height:280px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091329973044.jpg\" style=\"height:380px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091338603045.jpg\" style=\"height:450px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091348386046.jpg\" style=\"height:675px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091358078047.jpg\" style=\"height:825px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091406230048.jpg\" style=\"height:380px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091420298049.jpg\" style=\"height:410px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091432530050.jpg\" style=\"height:930px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091442631051.jpg\" style=\"height:510px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091454096053.jpg\" style=\"height:580px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091506315054.jpg\" style=\"height:1375px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091519681055.jpg\" style=\"height:765px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091530623056.jpg\" style=\"height:205px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/197782/20200306091543324057.jpg\" style=\"height:700px; width:650px\"></p><br></div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">1.促進基礎代謝2.三效舒眠成分超激代謝配方</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">船井生醫</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">40顆入/盒</td></tr><tr><td class=\"td1\">原產地</td><td class=\"td2\">台灣</td></tr><tr><td class=\"td1\">深、寬、高</td><td class=\"td2\">9.5x3.5x14.5cm</td></tr><tr><td class=\"td1\">淨重</td><td class=\"td2\">20 g</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">Y</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">投保富邦產品責任險新台幣5000萬元整</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">如外盒標示保存期限為3年</td></tr><tr><td class=\"td1\">注意事項</td><td class=\"td2\">1.不建議孕婦、授乳者及嬰幼兒食用。  2.全素可食。</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">40顆/盒</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">F-180457830-00000-8</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">船井生醫股份有限公司</td></tr><tr><td class=\"td1\">製造商電話</td><td class=\"td2\">04-22526600</td></tr><tr><td class=\"td1\">製造商地址</td><td class=\"td2\">台中市西屯區市政北一路號樓之</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>TW</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>14.5</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>3.5</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>9.5</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 07:41:33'),
(6, 25, 'Lamborghini Huracan EVO Coupe V10', '', 'Lamborghini小改款Huracan EVO 承襲了蠻牛車系的超凡性能，並融合先進的車身動態整合系統與空氣力學設計，回應最迅速敏捷的駕駛體驗和操控感受，無懼各類路況挑戰，以革新的駕馭體驗向未來邁進。', 1509, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"【赫而司】婦淨康益生菌(60顆/罐)(女性私密乳酸菌五益菌強化配方+果寡糖素食膠囊)，除了Golden Health 赫而司等推薦品牌，屈臣氏提供多種熱銷基礎營養其他商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品 預計出貨日2-5天</p><p><img alt=\"\" src=\"https://pii.tradevan.com.tw/APIIP/mspPic//163/163058//202103/20210308173445968930.jpg\"><img alt=\"\" src=\"https://pii.tradevan.com.tw/APIIP/mspPic//163/163058//202103/20210308173509269932.jpg\"><img alt=\"\" src=\"https://pii.tradevan.com.tw/APIIP/mspPic//163/163058//202103/20210308173515514933.jpg\"><img alt=\"\" src=\"https://pii.tradevan.com.tw/APIIP/mspPic//163/163058//202103/20210308173524929935.jpg\"><img alt=\"\" src=\"https://pii.tradevan.com.tw/APIIP/mspPic//163/163058//202103/20210308173531002936.jpg\"></p> </div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">調整體質改變細菌叢生態捍衛女性私密健康衛生全程冷藏配送</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">Golden Health 赫而司</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">60顆/罐</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">冷藏</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">華南產品責任險保單號碼1400-032050074</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">有效日期以消費者收受日起算至少距有效日期一年以上</td></tr><tr><td class=\"td1\">注意事項</td><td class=\"td2\">詳見產品介紹內容標示。</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">60顆/罐(植物膠囊) 奶素食品</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">A-116305859-00000-5</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">台灣赫而司有限公司</td></tr><tr><td class=\"td1\">製造商電話</td><td class=\"td2\">26333810</td></tr><tr><td class=\"td1\">製造商地址</td><td class=\"td2\">台北市內湖區成功路五段460號15樓</td></tr><tr><td class=\"td1\">製造商服務專線</td><td class=\"td2\">02-2633-6117</td></tr><tr><td class=\"td1\">製造商服務時間</td><td class=\"td2\">週一~週五上午9點到晚上6點</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>10</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>5</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>5</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 07:41:33'),
(7, 26, 'Lamborghini Urus Performante', '', 'Lamborghini Urus全新家族成員Urus Performante，獨樹一幟的運動性能以及造型設計彰顯其內藏的超跑性能基因及征服多元地形的實力，突破既有成就框架，再造Super SUV之峰。', 1380, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"Suntory 三得利 蜂王乳 芝麻明E 30日份 120錠，除了SUNTORY等推薦品牌，屈臣氏提供多種熱銷維他命D/維他命E商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品 預計出貨日2-5天</p><p>商品注意事項<br><br>請參考每日建議攝取量食用。一日請勿超過4錠。<br><br>請配合開水一同食用無需咀嚼多食無益。<br><br>請置於乾燥及避免高溫、陽光直射處。 開封後請確實密封置於涼爽陰暗處。<br><br>食用前請先確認原料如擔心產生食物過敏症狀請避免食用。 依個人體質或身體狀況不同如食用後產生不適例發癢、起疹、腸胃不適等請立即停止食用。<br><br>懷孕、哺乳期間以及兒童請避免食用。<br><br>服用藥物或正在接受診療的患者食用前請先洽詢醫師。 如有氣喘病史的消費者請勿食用。&nbsp;<br><br>本產品含有牛奶、蛋。<br><br>飲食生活請以主食、主菜、副菜為基礎請注意飲食均衡。</p><br><br><p><br><br>購買注意事項<br><br>1、顏色因電腦螢幕設定差異會略有不同以實際商品顏色為準。<br><br>2、此為私人消耗品除商品本身有瑕疵方可辦理退換貨。<br><br>3、商品一經拆封使用或損毀將影響退貨權限退貨必須保留紙箱及商品組合之齊全及完整性。勿因消費者個人不當拆卸使用之人為因素造成商品之故障、毀損、磨損、包裝破損不完整。若商品經拆封使用恕無法退換貨。</p><br></div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">Suntory 三得利 蜂王乳 芝麻明E 30日份 120錠</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">SUNTORY</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">30日份120錠</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">依商品外包裝標示為主</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">依商品外包裝標示為主</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">1</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">A-124738556-00000-8</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">萬物達國際有限公司</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>JP</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>10</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>6</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>5</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 07:41:33'),
(8, 111, 'Model S Plaid', '', 'Model S 為全球首部豪華純電動房車，且為全球最快的四門車輛。堅固的車身結構、近乎50/50重量平衡分佈及卓越的低重心設計、媲美頂級跑車的速度及靈敏度，以及無可比擬的續航表現和安全性，打造豪華性能房車的駕駛新體驗。', 336, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"NOW健而婷 高效能鋅配方 (100顆/瓶)，除了NOW 健而婷等推薦品牌，屈臣氏提供多種熱銷運動補給品商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品， 預計出貨日2-5天</p><p><span style=\"font-size:16px\"><span style=\"font-family:arial，helvetica，sans-serif\"><span style=\"color:#FF0000\"><strong>鋅(Zn)</strong></span><br>是人體必需微量元素，<strong>有助於能量代謝外，亦有助維持生殖機能等作用</strong>。美國營養學期刊證實「鋅」是維持男性健康不可或缺的營養成份。然而，因為「鋅」在體內吸收率很低，且易受茶、纖維質的影響而降低吸收率，大多數的人都有缺鋅的問題。根據統計，全世界有三分之一的男性缺乏「鋅」！<br><br><span style=\"color:#008000\"><strong>很多男性朋友皆透過下列方式補充鋅的不足：</strong></span><br>1、吃生蠔、蚵仔。但現今海洋污染嚴重，補充時需注意到其安全性，並且每日需補充蚵仔52顆、生蠔10顆，才足夠一天所需。<br>2、購買蠔蜆精、蠔蜆錠來補充。但內含鈉及普林成份，長期攝取恐引起負擔。<br>3、透過一般的綜合維他命補充。但是內含鋅劑量太低，根本達不到每日建議所需的量。<br>4、世界吸收率第一的「專利高效能鋅」，是世界唯一胺基酸螯合專利鋅(單甲硫胺酸鋅)，並唯一經美國FDA安全認證，高吸收、高安全，市售最高單位，一天一粒，省錢有力，是最聰明的選擇。</span></span></p><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/955535/20161124152933175380.jpg\" style=\"height:1206px; width:650px\"></p><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/955535/20161124152941221381.jpg\" style=\"height:828px; width:650px\"></p><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/955535/20161124152949085382.jpg\" style=\"height:1276px; width:650px\"></p><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/955535/20161124152955218438.jpg\" style=\"height:596px; width:650px\"></p><p>&nbsp;</p><p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"font-family:arial，helvetica，sans-serif\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/955535/20190313155717682799.jpg\" style=\"height:680px; width:650px\"></span></span></p><p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"font-family:arial，helvetica，sans-serif\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/955535/20180910141530031748.jpg\" style=\"height:943px; width:650px\"></span></span></p><p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"font-family:arial，helvetica，sans-serif\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/955535/20190313155730161800.jpg\" style=\"height:925px; width:650px\"></span></span></p><p>商品名稱：高效能鋅配方植物膠囊食品&nbsp;<br>內容量：100顆(植物硬膠囊)&nbsp;<br>主成份：每次用量(1顆)含-鋅-30 毫克、銅-300 微克 。<br>食品添加物：如商品標示所示。<br>用法用量：1次1顆、1天1次、餐後以開水食用。1日請勿超過1粒 ，多食無益。&nbsp;<br>保存方式：開封後，請將瓶蓋押緊，避免日光直射、高溫及潮濕。&nbsp;</p><p>原產地：美國<br>有效年限：3年6個月(以消費者收受日起算，至少距有效日期前334日以上)<br>負責廠商：台灣健而婷生化科技(股)公司<br>負責廠商電話：04-23113199<br>負責廠商地址：40743台中市西屯區甘肅路二段25號2樓<br>食品業者登錄字號：B-180466009-00000-2</p><p>注意事項<br>．本品來源天然，顆粒色澤會有深淺不同之自然變化，請安心食用。&nbsp;<br>．本公司產品，一律投保1000萬產品責任險。<br>&nbsp;</p></div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">世界專利胺基酸螯合鋅★全台最高單位30毫克★添加銅，加強滋補</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">NOW 健而婷</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">100顆/瓶</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">1403第082050001號</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">依包裝標示為主</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">100顆/瓶</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">B-180466009-00000-2</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">美國NOW FOODS</td></tr><tr><td class=\"td1\">製造商電話</td><td class=\"td2\">1-888-669-3663</td></tr><tr><td class=\"td1\">製造商地址</td><td class=\"td2\">396S.Glen Ellyn Rd，Bloomungdale，IL60108，USA.</td></tr><tr><td class=\"td1\">製造商服務專線</td><td class=\"td2\">04-23113199</td></tr><tr><td class=\"td1\">製造商服務時間</td><td class=\"td2\">9:00~18:00</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>美國</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>10.6</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>4.6</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>4.6</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 07:53:45'),
(9, 112, 'Tesla Model X Plaid', '', 'Model X為Tesla當家的純電動運動休旅車，配備全時四輪驅動且乘坐空間寬敞，最多可容納7名成人及其隨身行李！', 349, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"Sundown日落恩賜 高單位葉酸800mcg錠(100錠/瓶)，除了Sundown 日落恩賜等推薦品牌，屈臣氏提供多種熱銷基礎營養其他商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品 預計出貨日2-5天</p><p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"font-size:16px\">孕前3個月補充純葉酸</span></span></p>  <p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"font-size:16px\">高純度單方葉酸800微克</span></span></p>  <p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"font-size:16px\">每日只需一粒、經濟實惠</span></span></p>  <p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"font-size:16px\">三個月食用量、不浪費</span></span></p>  <p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"font-size:16px\">維持胎兒的正常生長與發育</span></span></p>  <p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/133021/20200206172650025321.jpg\" style=\"height:1294px; width:650px\"></p>  <p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/133021/20180425120945682278.jpg\" style=\"height:641px; width:650px\"></p>  <p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/133021/20180425120953192279.jpg\" style=\"height:641px; width:650px\"></p>  <p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/133021/20181126150734245812.jpg\" style=\"height:1681px; width:650px\"></p>  <p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/133021/20200206172727435322.jpg\" style=\"height:641px; width:650px\"></p> </div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">孕前3個月補充純葉酸</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">Sundown 日落恩賜</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">100錠/瓶</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">華南產物保險(1403第082050275號)</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">瓶身標示為有效日期 / 保存期限4年</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">100錠/瓶</td></tr><tr><td class=\"td1\">其他</td><td class=\"td2\">圖片為美國提供之商品形象圖</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">B-153304397-00000-3</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">cGMP美國Rexall Sundown INC.</td></tr><tr><td class=\"td1\">製造商電話</td><td class=\"td2\">1-888-848-2435</td></tr><tr><td class=\"td1\">製造商地址</td><td class=\"td2\">901 Broken Sound Parkway NW Boca Raton FL 33487 USA.</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>美國</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 07:59:42'),
(10, 113, 'Tesla Model Y Long Range', '', 'Model Y國內引進有Performance、Long Range二種車規，Performance與Long Range都是前後雙馬達的四輪驅動設定，Performance的0-100km/h加速為3.7 秒，極速可達250km/h，續航里程為514km，Long Range的0-100km/h加速為 5.0秒，極速可達217km/h，續航里程是542km，以上的續航里程都是WLTP的預估值。', 212, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"【GNC健安喜】經典熱銷 鎂250食品錠 90錠，除了GNC 健安喜等推薦品牌，屈臣氏提供多種熱銷維他命D/維他命E商品選擇，全面符合您的需求。\">\r\n				<p><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"360\" src=\"https://www.youtube.com/embed/ewrClgkTwQM?enablejsapi=1&amp;origin=https%3A%2F%2Fwww.watsons.com.tw\" width=\"640\" data-gtm-yt-inspected-1_25=\"true\" id=\"133445343\" data-gtm-yt-inspected-1471862_269=\"true\" style=\"width: 958px;\"></iframe></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品 預計出貨日2-5天</p><p><strong><span style=\"color:#EE82EE\">產品特色及說明</span></strong></p>  <p>-每顆含有250毫克鎂補足每日所需<br> -喚醒體內原本代謝力加速擺脫沉重的負擔<br> -舒緩因繁忙造成的緊繃約束讓自己休息時間達到最佳休眠狀態<br> -顆粒小好吞嚥<br> -素食者可以食用</p>  <p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/182147/20200722104928228409.jpg\" style=\"height:379px; width:650px\"></p> </div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">喚醒代謝力 緩和深層約束</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">GNC 健安喜</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">90錠/瓶</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">已投保</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">依商品外包裝標示為主</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">90錠/瓶</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">A-127952240-00000-9</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">新加坡商傲旎開發股份</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>美國</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 07:59:42'),
(11, 113, 'Tesla Model Y Performance', '', 'Model Y開放選配最先進的自動輔助駕駛科技（Full Self-Driving, FSD），採五人座配置的Model Y除了擁有休旅車寬敞舒適的車室環境，無橫樑的全景玻璃車頂亦提供絕佳的廣闊視野，掀背式的電動尾門搭配可一鍵傾倒的後排座椅，使其最大儲物空間高達2,158公升。此外，車輛配備可防禦生化武器的HEPA過濾系統。', 239, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"Boiron金盞花全效乳膏30g，除了BOIRON金盞花等推薦品牌，屈臣氏提供多種熱銷基礎營養其他商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>法國版的小護士</p>  <p>家庭必備的萬用皮膚護理品</p>  <p>天然不刺激溫和呵護全家人肌膚</p> </div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">舒緩因敏感刺激、表淺傷口、昆蟲叮咬造成的肌膚不適</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">BOIRON金盞花</td></tr><tr><td class=\"td1\">原產地</td><td class=\"td2\">法國</td></tr><tr><td class=\"td1\">深、寬、高</td><td class=\"td2\">15.7x3.4x3.1cm</td></tr><tr><td class=\"td1\">淨重</td><td class=\"td2\">30 g</td></tr><tr><td class=\"td1\">容量</td><td class=\"td2\">30 ml</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">Y</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>法國</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>3.1</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>3.4</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>15.7</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 07:59:42'),
(12, 115, 'Porsche Panamera V6', '', 'Panamera Turbo S 最大動力為 630hp，最大扭力為83.6kgm ，在Sport Plus模式中0-100 km/h加速為 3.1 秒。此具在魏薩（Weissach）研發。', 524, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"Sundown日落恩賜 緩釋型超級B群+C錠(B12加強配方)(100錠/瓶)，除了Sundown 日落恩賜等推薦品牌，屈臣氏提供多種熱銷基礎營養其他商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品 預計出貨日2-5天</p><p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"font-size:16px\">原裝進口、第二代強效新配方</span></span></p><br><br><p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"font-size:16px\">完整綜合B群+維生素C</span></span></p><br><br><p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"font-size:16px\">B12有效劑量調高至250微克</span></span></p><br><br><p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"font-size:16px\">長效Time-Release製程、不浪費</span></span></p><br><br><p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"font-size:16px\">國際級實驗室檢測8小時有效吸收</span></span></p><br><br><p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"font-size:16px\">亞洲市場專屬最佳配方比例 </span></span></p><br><br><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/102662/20201104144602416801.jpg\" style=\"height:641px; width:650px\"></p><br><br><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/102662/20201104144640719802.jpg\"></p><br><br><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/102662/20201104144649598803.jpg\" style=\"height:641px; width:650px\"></p><br><br><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/102662/20201104144659818804.jpg\" style=\"height:641px; width:650px\"></p><br><br><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/102662/20201104144806662807.jpg\" style=\"height:641px; width:650px\"></p><br><br><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/102662/20201104144815067808.jpg\" style=\"height:641px; width:650px\"></p><br><br><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/102662/20201104144825770810.jpg\" style=\"height:641px; width:650px\"></p><br><br><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/102662/20201104144834639811.jpg\" style=\"height:641px; width:650px\"></p><br><br><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/102662/20181119165406511986.jpg\" style=\"height:1681px; width:650px\"></p><br><br><p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/102662/20201104144850684812.jpg\" style=\"height:641px; width:650px\"></p><br></div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">完整9大必需營養素 增強體力</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">Sundown 日落恩賜</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">100錠/瓶</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">華南產物保險(1403第092050266號)</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">瓶身標示為有效日期 EXP-月底/年(西元) / 保存期限3年</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">100錠/瓶</td></tr><tr><td class=\"td1\">其他</td><td class=\"td2\">圖片為美國提供之商品形象圖</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">B-153304397-00000-3</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">cGMP美國Rexall Sundown INC.</td></tr><tr><td class=\"td1\">製造商電話</td><td class=\"td2\">1-888-848-2435</td></tr><tr><td class=\"td1\">製造商地址</td><td class=\"td2\">901 Broken Sound Parkway NW Boca Raton FL 33487 USA.</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>US</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 08:08:59'),
(13, 115, 'Porsche Panamera Sport Turismo 4', '', 'Panamera Sport Turismo修長的頂部線條直接延伸至一組先進的主動式車頂擾流板之中 — 也是PAA（Porsche Active Aerodynamics）主動空力套件的核心元件，其本體採用高光澤黑色塗裝烤漆，這套主動式車頂擾流板會根據不同的行駛狀態與車輛設定。', 573, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"Jarrow賈羅公式 非活性維生素D3軟膠囊(100粒/瓶)，除了Jarrow 賈羅公式等推薦品牌，屈臣氏提供多種熱銷低卡代餐商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品 預計出貨日2-5天</p><p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"color:rgb(0 0 0)\"><span style=\"font-size:16px\">高純度非活性D3</span></span></span></p>  <p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"color:rgb(0 0 0)\"><span style=\"font-size:16px\">快速補充陽光維生素</span></span></span></p>  <p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"color:rgb(0 0 0)\"><span style=\"font-size:16px\">原裝進口每粒含D3 400 I.U.</span></span></span></p>  <p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"color:rgb(0 0 0)\"><span style=\"font-size:16px\">嚴選配方添加頂級橄欖油</span></span></span></p>  <p style=\"text-align:center\"><span style=\"font-family:verdanagenevasans-serif\"><span style=\"color:rgb(0 0 0)\"><span style=\"font-size:16px\">室內工作族、成年女性必備品 </span></span></span></p>  <p style=\"text-align:center\"><span style=\"color:rgb(0 0 0)\"><span style=\"font-size:16px\"><span style=\"font-family:arialhelveticasans-serif\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/163053/20180807162057208547.jpg\" style=\"height:1949px; width:650px\"></span></span></span></p>  <p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/163053/20200116110957864375.jpg\"></p>  <p style=\"text-align:center\"><span style=\"color:rgb(0 0 0)\"><span style=\"font-size:16px\"><span style=\"font-family:arialhelveticasans-serif\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/163053/20180807162124120549.jpg\" style=\"height:641px; width:650px\"></span></span></span></p> </div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">少曬太陽、室內工作族、成年女性必備品</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">Jarrow 賈羅公式</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">100粒/瓶</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">華南產物保險(1403第082050352號)</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">瓶身標示為有效日期 / 保存期限2年</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">100粒/瓶</td></tr><tr><td class=\"td1\">其他</td><td class=\"td2\">圖片為美國提供之商品形象圖</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">B-124605866-00000-6</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">JARROW INDUSTRIES INC.</td></tr><tr><td class=\"td1\">製造商電話</td><td class=\"td2\">04-22370215</td></tr><tr><td class=\"td1\">製造商地址</td><td class=\"td2\">12246 HAWKINS STREET SANTA FE SPRINGS CA 90670</td></tr><tr><td class=\"td1\">製造商服務專線</td><td class=\"td2\">04-22370215(0800-370215)</td></tr><tr><td class=\"td1\">製造商服務時間</td><td class=\"td2\">9:00~18:00</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>美國</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 08:08:59'),
(19, 118, 'Porsche 911 Carrera 4 Coupe', '', '第八代Porsche 911車系的動力精髓：水平對臥6缸雙渦輪增壓引擎亦隨之進化，除了為遵循最新碳排放量標準而使用微粒子過濾器，有效提升性能及油耗表現，體積增加的渦輪增壓器以對稱方式呈現，並擁有電子控制廢氣閥門、450hp馬力，平均每公升排氣量輸出功率高達151hp，透過八速PDK雙離合器自手排變速系統，造就911 Carrera 4S的安全極速達306km/h。', 729, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"【GNC健安喜】型男保健 美佳男複方維他命食品錠 90錠，除了GNC 健安喜等推薦品牌，屈臣氏提供多種熱銷綜合維他命商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品 預計出貨日2-5天</p><p><span style=\"color:#DDA0DD\"><strong>產品特色及說明</strong></span></p><br><br><p>-GNC銷售第一名的男性綜合維他命。<br><br>-專為男性設計強化鋅、維他命B群等男性所需的綜合營養素。<br><br>-添加南瓜子油、蕃茄紅素等天然防護精華滿足成年男性營養需求。<br><br>-天然蔬果複合精華滿足現代人營養需求。<br><br>-緩效型錠劑補足您一整天的營養活力。</p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/182149/20200722102008465230.jpg\" style=\"height:1093px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/182149/20200722102025368231.jpg\" style=\"height:379px; width:650px\"></p><br></div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">型男必備 活力滿格</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">GNC 健安喜</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">90錠/瓶</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">已投保</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">依商品外包裝標示為主</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">90錠/瓶</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">A-127952240-00000-9</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">新加坡商傲旎開發股份</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>US</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 08:18:50');
INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_spec`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES
(20, 118, 'Porsche 911 Carrera Coupe', '', '嶄新外觀設計融合歷代911車款的經典元素，新911車身更寬、線條更俐落且科技更進化。。\r\n', 686, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"都會新貴嚴選-苦瓜胜肽膠囊60粒/盒，除了citynoble都會新貴等推薦品牌，屈臣氏提供多種熱銷基礎營養其他商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/201359/20200529095218162901.jpg\" style=\"height:650px; width:650px\"></p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/201359/20200529095249244904.jpg\" style=\"height:1000px; width:1000px\"></p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/201359/20200529095259462905.jpg\" style=\"height:650px; width:650px\"></p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/201359/20200529095309731906.jpg\" style=\"height:743px; width:650px\"></p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/201359/20200529095320337907.jpg\" style=\"height:921px; width:650px\"></p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/201359/20200529095328553908.jpg\" style=\"height:650px; width:650px\"></p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/201359/20200529095343132909.jpg\" style=\"height:777px; width:650px\"></p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/201359/20200529095353181910.jpg\" style=\"height:514px; width:650px\"></p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/201359/20200529095405386911.jpg\" style=\"height:742px; width:650px\"></p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/201359/20200529095414658913.jpg\" style=\"height:650px; width:650px\"></p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/201359/20200529095422923914.jpg\" style=\"height:556px; width:650px\"></p><br><br><p>&nbsp;</p><br></div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">專利定序苦瓜萃取(含胜肽)幫助健康維持</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">citynoble都會新貴</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">570mg</td></tr><tr><td class=\"td1\">原產地</td><td class=\"td2\">台灣</td></tr><tr><td class=\"td1\">深、寬、高</td><td class=\"td2\">5.1x10x14.5cm</td></tr><tr><td class=\"td1\">淨重</td><td class=\"td2\">570 g</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">Y</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">已投保產品責任險</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">如包裝所示</td></tr><tr><td class=\"td1\">注意事項</td><td class=\"td2\">勿讓孩童誤食</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">60粒/盒</td></tr><tr><td class=\"td1\">其他</td><td class=\"td2\">無</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">A152621655-00000-0</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">祥閎股份有限公司</td></tr><tr><td class=\"td1\">製造商電話</td><td class=\"td2\">06-2980000 </td></tr><tr><td class=\"td1\">製造商地址</td><td class=\"td2\">臺南市安平區健康三街482巷15號2樓</td></tr><tr><td class=\"td1\">製造商服務專線</td><td class=\"td2\">06-2980000 </td></tr><tr><td class=\"td1\">製造商服務時間</td><td class=\"td2\">1000-1800</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>TW</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>14.5</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>10</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>5.1</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 08:18:50'),
(21, 118, 'Porsche 911 Dakar 3.0', '', '保時捷 911 Dakar最引人注目之處就在於底盤離地高度，較搭載跑車化懸吊的 911 Carrera 增加 50 mm，標配的前後軸抬升系統可讓前、後軸高度額外增加30 mm，在「高」底盤模式下，可允許車輛在時速高達170 km/h進行激烈的越野活動。\r\n', 1208, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"Sundown日落恩賜 超級蔓越莓plus維生素D3軟膠囊(150粒x3盒)組，除了Sundown 日落恩賜等推薦品牌，屈臣氏提供多種熱銷基礎營養其他商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品 預計出貨日2-5天</p><p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"color:rgb(0 0 0)\"><span style=\"font-family:arialhelveticasans-serif\">Super蔓越莓50倍濃縮萃取</span></span></span></p>  <p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"color:rgb(0 0 0)\"><span style=\"font-family:arialhelveticasans-serif\">改變細菌叢生態、調整體質</span></span></span></p>  <p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"color:rgb(0 0 0)\"><span style=\"font-family:arialhelveticasans-serif\">高單位陽光維生素D3 500 IU</span></span></span></p>  <p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"color:rgb(0 0 0)\"><span style=\"font-family:arialhelveticasans-serif\">針對上班族、缺少日曬的女性</span></span></span></p>  <p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/140031/20200811170355231293.jpg\" style=\"height:1949px; width:650px\"></p>  <p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/140031/20181214121758544700.jpg\" style=\"height:1681px; width:650px\"></p>  <p style=\"text-align:center\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/140031/20210112154551571946.jpg\" style=\"height:641px; width:650px\"></p> </div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">上班族與缺少日曬的女性必備</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">Sundown 日落恩賜</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">150粒x3盒</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">華南產物保險(1403第092050266號)</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">瓶身標示為有效日期 EXP-月底/年(西元) / 保存期限2年</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">150粒x3盒</td></tr><tr><td class=\"td1\">其他</td><td class=\"td2\">圖片為美國提供之商品形象圖</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">B-153304397-00000-3</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">cGMP美國Rexall Sundown INC.</td></tr><tr><td class=\"td1\">製造商電話</td><td class=\"td2\">1-888-848-2435</td></tr><tr><td class=\"td1\">製造商地址</td><td class=\"td2\">901 Broken Sound Parkway NW Boca Raton FL 33487 USA.</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>美國</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 08:25:33'),
(22, 118, 'Porsche 911 GT3 4.0', '', '992世代的911 GT3是與保時捷賽車運動部門共同開發，這部第七代全新車款擁有最純正的賽車科技，提供更純粹的性能表現。源自同樣性能卓越的保時捷GT賽車911 RSR，911 GT3前軸搭載雙A臂獨立懸吊系統，透過擾流尾翼搭配倒勾式 (Swan Neck) ；基於911 GT3 R動力傳動系統設計的510hp 4.0升六缸水平對臥引擎則早已通過耐力賽測試。\r\n', 1028, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"【GNC健安喜】型男保健 南瓜籽油膠囊食品1000mg 100顆，除了GNC 健安喜等推薦品牌，屈臣氏提供多種熱銷銀髮保健其他商品選擇，全面符合您的需求。\">\r\n				<p><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"360\" src=\"https://www.youtube.com/embed/ewrClgkTwQM?enablejsapi=1&amp;origin=https%3A%2F%2Fwww.watsons.com.tw\" width=\"640\" style=\"width: 958px;\" data-gtm-yt-inspected-1_25=\"true\" id=\"507600513\" data-gtm-yt-inspected-1471862_269=\"true\"></iframe></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品 預計出貨日2-5天</p><p><strong><span style=\"color:#EE82EE\">產品特色及說明</span></strong></p><br><br><p>-每顆提供1000mg的南瓜籽油<br><br>-保養中年男子的私密問題、調節男性生理機能。-鋅維持生殖機能<br><br>-富含多元不飽和脂肪酸維護循環健康<br><br>-南瓜子氨酸解決私密困擾<br><br>-植物固醇調整體質<br><br>-維生素 B群提高代謝力<br><br>-維生素 E調節生理機能</p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/182159/20200923103652830328.jpg\" style=\"height:445px; width:650px\"></p><br><br><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/182159/20190710164620729239.jpg\" style=\"float:left; height:975px; width:650px\"></p><br></div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">守護前線 告別男言之隱</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">GNC 健安喜</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">100顆/瓶</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">已投保</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">依商品外包裝標示為主</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">100顆/瓶</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">A-127952240-00000-9</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">新加坡商傲旎開發股份</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>TW</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 08:25:33'),
(23, 118, 'Porsche 911 Sport Classic 3.7', '', '911 Sport Classic 是保時捷由 Heritage Design 產品策略所推出四款收藏車型系列中的第二款，由 Porsche Exclusive Manufaktur 保時捷個人化訂製部門重現 1960 年代和 1970 年代初期風格，僅限量打造1,250輛。\r\n', 1472, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"【美國BestVite】必賜力天然高濃縮蜂王乳膠囊1瓶 (60顆)，除了Bestvite 必賜力等推薦品牌，屈臣氏提供多種熱銷基礎營養其他商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>此為廠商直送商品 預計出貨日2-5天</p><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/104258/20171026123122443428.jpg\" style=\"height:591px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/104258/20171026123143862429.jpg\" style=\"height:434px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/104258/20171026123157618430.jpg\" style=\"height:556px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/104258/20171026123205009431.jpg\" style=\"height:351px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/104258/20171026123211633432.jpg\" style=\"height:578px; width:650px\"><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/104258/20171026123217471433.jpg\" style=\"height:501px; width:650px\"></p>  <table align=\"center\" border=\"1\" cellpadding=\"3\" cellspacing=\"5\" id=\"yui_3_12_0_1_1416969815722_177\" style=\"width:622px\"> 	<tbody> 		<tr> 			<td style=\"border:1px solid gray;height:30px;line-height:30px\"> 			<table align=\"center\" border=\"1\" cellpadding=\"3\" cellspacing=\"5\" id=\"yui_3_12_0_1_1416969815722_177\" style=\"width:622px\"> 				<tbody> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">品名</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">【美國Bestvite】必賜力天然高濃縮蜂王乳膠囊1瓶</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">內容物成份</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">新鮮3:1濃縮蜂王乳500毫克 (相當於新鮮蜂王乳1500毫克)</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\" colspan=\"2\">營養標示</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">內容量</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">每份0.6公克本包裝含60份</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">熱量</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">每份含2.4大卡</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">每份營養成份</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">新鮮3:1濃縮蜂王乳500毫克 (相當於新鮮蜂王乳1500毫克)</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">食品添加物名稱</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">明膠</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">食用方式</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">每天1至2顆飯後以開水食用</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">保存方式</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">置於陰涼乾燥處保存避免日光直射</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">產地</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">美國原裝進口</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">進口商名稱</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">特德寶有限公司</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">進口商電話號碼</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">03-3116516</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">進口商地址</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">桃園市蘆竹區安中街1號</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">保存期限</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">3年</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">製造 / 有效日期</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">如瓶身所示</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">投保責任險</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">國泰產物產品責任險新台幣4000萬元保障</td> 					</tr> 					<tr> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">注意事項</td> 						<td style=\"border:1px solid gray;height:30px;line-height:30px\">對蜜蜂製品過敏或氣喘者請勿食用</td> 					</tr> 				</tbody> 			</table> 			</td> 		</tr> 	</tbody> </table> </div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">3倍濃縮=新鮮蜂王漿1500毫克每顆含6天然珍貴成分王漿酸10-HDA美國原廠原裝進口</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">Bestvite 必賜力</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">60顆*1 PC</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">N</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">國泰產物產品責任險新台幣4000萬元</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">如瓶身所示</td></tr><tr><td class=\"td1\">注意事項</td><td class=\"td2\">對蜜蜂製品過敏或氣喘者請勿食用懷孕及哺乳期婦女請向醫師諮詢</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">本包裝共含60份</td></tr><tr><td class=\"td1\">其他</td><td class=\"td2\">置於陰涼乾燥處保存並遠離孩童</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">A-124772076-00000-3</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">Bestvite</td></tr><tr><td class=\"td1\">製造商電話</td><td class=\"td2\"> (818) 767-5700</td></tr><tr><td class=\"td1\">製造商地址</td><td class=\"td2\">Inc. 8010 Wheatland Ave. Ste. #I Sun Valley CA 91352</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>美國</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>11</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>17</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>26</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-05 08:25:33'),
(24, 118, 'Porsche 911 Targa 4S', '', '繼Coupe與Cabriolet車型後，全新世代911最新車型 – 全時四驅911 Targa 4S正式入列 。具備獨特個性的911 Targa 4S車型仍強調創新進化，延續自1965年問世以來的經典設計，包括全自動車頂系統與防滾桿，搭配大片環繞後擋風玻璃的配置，911 Targa 4S車頂蓬僅需19秒即可完成開、關蓬。\r\n', 889, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"華陀扶元堂古傳滴雞精7入裝，除了HUATUO 華陀扶元堂等推薦品牌，屈臣氏提供多種熱銷基礎營養其他商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p><img alt=\"\" src=\"https://img.watsons.com.tw/ecftp/171339/20200610143614410992.jpg\" style=\"height:451px; width:650px\"></p><br></div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">華陀扶元堂古傳滴雞精7入裝</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">HUATUO 華陀扶元堂</td></tr><tr><td class=\"td1\">原產地</td><td class=\"td2\">台灣</td></tr><tr><td class=\"td1\">深、寬、高</td><td class=\"td2\">4.5x29x18.5cm</td></tr><tr><td class=\"td1\">淨重</td><td class=\"td2\">680 g</td></tr><tr><td class=\"td1\">容量</td><td class=\"td2\">455 ml</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">Y</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">明台產物產品責任保險0804第09PDT00040號</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">2019/11/01</td></tr><tr><td class=\"td1\">注意事項</td><td class=\"td2\">保存期限2年</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">65ML*7入</td></tr><tr><td class=\"td1\">其他</td><td class=\"td2\">有尿酸症或腎功能不全患者飲用前請諮詢醫師</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">E-170412201-00000-9</td></tr></tbody></table><p class=\"ecTitle\">廠商資訊</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">製造商名稱</td><td class=\"td2\">華陀養生殿股份有限公司食品廠</td></tr><tr><td class=\"td1\">製造商電話</td><td class=\"td2\">07-6196685</td></tr><tr><td class=\"td1\">製造商地址</td><td class=\"td2\">高雄市彌陀區產業路156-2號</td></tr><tr><td class=\"td1\">製造商服務專線</td><td class=\"td2\">0800093689</td></tr><tr><td class=\"td1\">製造商服務時間</td><td class=\"td2\">周一到週五 早上9點到晚上6點</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>TW</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>18.5</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>29</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>4.5</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2023-05-09 00:32:52'),
(25, 118, 'Porsche 911 Turbo Coupe', '', '全新世代保時捷 911 Turbo S Coupe與Cabriolet兩款車型同步登場，展現前所未有的強大動力、駕駛動態與舒適性。911 Turbo S搭載配備兩具VTG 渦輪增壓器的3.8升水平對臥引擎，可輸出650hp、81.6kgm強大動力，Coupe 0-100 km/h加速僅需2.7秒，Cabriolet 0-100 km/h加速僅2.8秒，極速同為330 km/h。\r\n', 1128, 1, NULL, '2023-05-09 00:39:37'),
(26, 116, 'Porsche Cayenne Coupe V6', '', '第三代Cayenne以全新進化的面貌問世，並結合更多經典的保時捷性能與優異的日常實用性。強大的渦輪引擎、最新的八速Tiptronic S 變速箱、全新底盤系統、創新的顯示系統與控制邏輯將其運動性與舒適性推上另一高峰。\r\n', 348, 1, NULL, '2023-05-09 03:19:10'),
(27, 116, 'Porsche Cayenne V6', '', 'Cayenne入門款配備可輸出340hp馬力的3.0升渦輪引擎。Cayenne S的2.9升V6雙渦輪引擎則可達到265km/h的極速，最大馬力提升至440匹。若選配跑車計時套件，Cayenne S可在短短5秒之內從靜止起步加速至100km/h。\r\n', 388, 1, NULL, '2023-05-09 03:19:10'),
(28, 116, 'Porsche Cayman 2.0', '', '718 Cayman擁有更引人注目、更具跑格的外觀，718 Cayman搭載與718 Boxster相同的全新四缸水平對臥渦輪增壓引擎，雙座硬頂及敞篷車型首度擁有相同的引擎馬力輸出。入門的2.0升排氣量引擎車型可產生300匹最大馬力；S 車型則可從2.5升的排氣量輸出350匹的最大馬力。\r\n', 347, 1, NULL, '2023-05-09 03:19:10'),
(29, 117, 'Porsche Taycan Cross Turismo 4', '', '全新登場的Taycan Cross Turismo除了結合強大性能、頂尖科技，更標配了『Gravel (碎石) 行駛模式』，是全球首款具備輕越野能力電動跑車，將為車主帶來嶄新的駕馭體驗，踏上更自在、不受限的旅程。\r\n', 431, 1, NULL, '2023-05-09 03:19:10'),
(30, 117, 'Porsche Taycan', '', '作為品牌旗下首款純電跑車，Taycan為保時捷開拓電動車產品陣線寫下嶄新起點；Taycan 以其四門跑房車的設定，具備保時捷不容錯認的運動化、互聯性及完善的日常使用性等多重特質。無論是車款本身與配備，甚至生產線的製造過程，Taycan都賦予永續性與數位化全新的定義。\r\n', 402, 1, NULL, '2023-05-09 03:19:10'),
(31, 119, 'Porsche Boxster 2.0', '', '718 Boxster擁有更快的起步加速度，搭配PDK及跑車計時套件，可在短短4.7秒之內從靜止加速至100km/h；搭載相同配備的718 Boxster S更可在4.2秒之內完成此動作。718 Boxster的極速可達275km/h，718 Boxster S 的極速高達285km/h。\r\n', 352, 1, NULL, '2023-05-09 03:55:36'),
(32, 120, 'Porsche Macan 2.0T', '', '性能更卓越、設計更犀利，以及搭載創新操作概念，小改款Macan共推出三款車型，動力表現皆較之前更加強悍。這款高人氣保時捷休旅獲得全面升級，包括更強勁的引擎、更優化的底盤，使得性能再提升。也配備了更吸引人的外觀與內裝設計，展現更犀利的跑格風格，尤其是具備觸控面板設計的全新中控台。\r\n', 313, 1, NULL, '2023-05-09 03:55:36'),
(33, 122, 'McLaren Artura V6 Hybrid', '', '集結 McLaren 過去所有造車經驗和科技結晶，Artura 就此矚目而生。作為品牌劃世代高性能油電混合超跑，Artura 完美進階性能及動態表現，達成無與倫比的人車互動，更帶來電能駕馭的優勢與優雅。Artura 的誕生不僅豎立嶄新標竿，對於品牌及超跑車壇掀起科技與感官的強烈震撼。\r\n', 1328, 1, NULL, '2023-05-09 05:14:57'),
(34, 123, 'McLaren GT V8', '', 'McLaren英國原廠首席設計師 Esteban Palazzo 表示：「McLaren GT完整體現了所有McLaren不凡的設計語彙、象徵著全新的里程碑，將我們拓展至GT市場；McLaren GT擁有優異的性能與速度、具奢華感與長程旅途的舒適性，卻不失McLaren獨有的動態操駕感受。我們渴望挑戰極限及顛覆傳統，改寫既有GT跑車的規章。」\r\n', 1260, 1, NULL, '2023-05-09 05:14:57'),
(35, 124, 'Toyota-Suzuki', 'sportsCar', 'Toyota-Suzuki', 1222, 1, 'Toyota-Suzuki Partnership', '2023-05-24 03:58:12');

-- --------------------------------------------------------

--
-- 資料表結構 `product_img`
--

CREATE TABLE `product_img` (
  `img_id` int(11) NOT NULL COMMENT '圖檔編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `img_file` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖檔名稱',
  `sort` int(2) NOT NULL COMMENT '圖片順序',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `product_img`
--

INSERT INTO `product_img` (`img_id`, `p_id`, `img_file`, `sort`, `create_date`) VALUES
(1, 1, 'Ferrari 458 Italia.jpg', 1, '2023-05-05 07:00:59'),
(2, 1, 'Ferrari 458 Italia01.jpg', 2, '2023-05-05 07:01:55'),
(3, 1, 'Ferrari 458 Italia02.jpg', 3, '2023-05-05 07:02:31'),
(4, 2, 'Ferrari 296 GTS V6 Hybrid.jpeg', 1, '2023-05-05 07:23:43'),
(5, 3, 'Ferrari 296 GTB V6 Hybrid.jpeg', 1, '2023-05-05 07:32:31'),
(6, 4, 'Lamborghini Huracan Tecnica V10.jpeg', 1, '2023-05-05 07:43:11'),
(7, 5, 'Lamborghini Huracan STO V10.jpeg', 1, '2023-05-05 07:45:57'),
(8, 6, 'Lamborghini Huracan EVO Coupe V10.jpeg', 1, '2023-05-05 07:45:57'),
(9, 7, 'Lamborghini Urus Performante.jpeg', 1, '2023-05-05 07:45:57'),
(10, 8, 'Tesla Model S Plaid.jpeg', 1, '2021-03-10 07:20:07'),
(11, 9, 'Tesla Model X Plaid.jpeg', 1, '2023-05-05 08:02:35'),
(12, 10, 'Tesla Model Y Long Range.jpeg', 1, '2023-05-05 08:02:35'),
(13, 11, 'Tesla Model Y Performance.jpeg', 1, '2023-05-05 08:02:35'),
(14, 12, 'Porsche Panamera V6.jpeg', 1, '2023-05-05 08:11:19'),
(15, 13, 'Porsche Panamera Sport Turismo 4.jpeg', 1, '2023-05-05 08:11:19'),
(20, 19, 'Porsche 911 Carrera 4 Coupe.jpeg', 1, '2023-05-05 08:28:28'),
(21, 20, 'Porsche 911 Carrera Coupe.jpeg', 1, '2023-05-05 08:28:28'),
(22, 21, 'Porsche 911 Dakar 3.0.jpeg', 1, '2023-05-05 08:28:28'),
(23, 22, 'Porsche 911 GT3 4.0 with Touring Package.jpeg', 1, '2023-05-05 08:28:28'),
(24, 23, 'Porsche 911 Sport Classic 3.7.jpeg', 1, '2023-05-05 08:28:28'),
(25, 24, 'Porsche 911 Targa 4S.jpeg', 1, '2023-05-09 00:33:54'),
(26, 25, 'Porsche 911 Turbo Coupe.jpeg', 1, '2023-05-09 00:40:48'),
(27, 26, 'Porsche Cayenne Coupe V6.jpeg', 1, '2023-05-09 03:25:04'),
(28, 27, 'Porsche Cayenne V6.jpg', 1, '2023-05-09 03:25:04'),
(29, 28, 'Porsche Cayman 2.0.jpg', 1, '2023-05-09 03:25:04'),
(30, 29, 'Porsche Taycan Cross Turismo 4.jpeg', 1, '2023-05-09 03:43:27'),
(31, 30, 'Porsche Taycan.jpeg', 1, '2023-05-09 03:43:27'),
(32, 31, 'Porsche Boxster 2.0.jpg', 1, '2023-05-09 03:52:52'),
(33, 32, 'Porsche Macan 2.0T.jpeg', 1, '2023-05-09 03:59:14'),
(34, 33, 'McLaren Artura V6 Hybrid.jpeg', 1, '2023-05-09 05:08:02'),
(35, 34, 'McLaren GT V8.jpeg', 1, '2023-05-09 05:09:04'),
(36, 1, 'Ferrari 458 Italia03.jpg', 4, '2023-05-11 02:12:15');

-- --------------------------------------------------------

--
-- 資料表結構 `pyclass`
--

CREATE TABLE `pyclass` (
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `level` int(2) NOT NULL COMMENT '所在層級',
  `fonticon` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '字型圖示',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '類別名稱',
  `sort` int(3) NOT NULL COMMENT '列表排序',
  `uplink` int(3) NOT NULL COMMENT '上層連結',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '建立時間與更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 資料表的匯出資料 `pyclass`
--

INSERT INTO `pyclass` (`classid`, `level`, `fonticon`, `cname`, `sort`, `uplink`, `create_date`) VALUES
(1, 1, 'fa-car', 'Ferrari', 1, 0, '2023-05-10 00:54:26'),
(2, 1, 'fa-car', 'Lamborghini', 2, 0, '2023-05-10 00:54:26'),
(3, 1, 'fa-car', 'Tesla', 3, 0, '2023-05-10 00:54:26'),
(4, 1, 'fa-car', 'Porsche', 4, 0, '2023-05-10 00:54:26'),
(5, 1, 'fa-car', 'McLaren', 5, 0, '2023-05-10 00:54:26'),
(21, 2, 'fa-car', 'Ferrari 458 Italia', 1, 1, '2023-05-29 05:56:58'),
(22, 2, 'fa-car', 'Ferrari 296', 2, 1, '2023-05-10 00:54:26'),
(25, 2, 'fa-car', 'Lamborghini Huracan', 1, 2, '2023-05-10 00:54:26'),
(26, 2, 'fa-car', 'Lamborghini Urus ', 2, 2, '2023-05-10 00:54:26'),
(111, 2, 'fa-car', 'Tesla Model S', 1, 3, '2023-05-10 00:54:26'),
(112, 2, 'fa-car', 'Tesla Model X', 2, 3, '2023-05-10 00:54:26'),
(113, 2, 'fa-car', 'Tesla Model Y', 3, 3, '2023-05-10 00:54:26'),
(114, 2, 'fa-car', 'Tesla Truck', 4, 3, '2023-05-10 00:54:26'),
(115, 2, 'fa-car', 'Porsche Panamera', 1, 4, '2023-05-10 00:54:26'),
(116, 2, 'fa-car', 'Porsche Cayenne', 2, 4, '2023-05-10 00:54:26'),
(117, 2, 'fa-car', 'Porsche Taycan', 3, 4, '2023-05-10 00:54:26'),
(118, 2, 'fa-car', 'Porsche 911', 4, 4, '2023-05-10 00:54:26'),
(119, 2, 'fa-car', 'Porsche Boxster', 5, 4, '2023-05-10 00:54:26'),
(120, 2, 'fa-car', 'Porsche Macan', 6, 4, '2023-05-10 00:54:26'),
(122, 2, 'fa-car', 'McLaren Artura', 1, 5, '2023-05-10 00:54:26'),
(123, 2, 'fa-car', 'McLaren GT', 2, 5, '2023-05-10 00:54:26');

-- --------------------------------------------------------

--
-- 資料表結構 `town`
--

CREATE TABLE `town` (
  `townNo` bigint(20) NOT NULL COMMENT '鄕鎮市編號',
  `Name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT '鄕鎮市名稱',
  `Post` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '郵遞區號',
  `State` smallint(6) NOT NULL COMMENT '狀態',
  `AutoNo` int(10) NOT NULL COMMENT '上層城市編號連結'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `town`
--

INSERT INTO `town` (`townNo`, `Name`, `Post`, `State`, `AutoNo`) VALUES
(1, '中正區', '100', 0, 1),
(2, '大同區', '103', 0, 1),
(3, '中山區', '104', 0, 1),
(4, '松山區', '105', 0, 1),
(5, '大安區', '106', 0, 1),
(6, '萬華區', '108', 0, 1),
(7, '信義區', '110', 0, 1),
(8, '士林區', '111', 0, 1),
(9, '北投區', '112', 0, 1),
(10, '內湖區', '114', 0, 1),
(11, '南港區', '115', 0, 1),
(12, '文山區', '116', 0, 1),
(13, '仁愛區', '200', 0, 2),
(14, '信義區', '201', 0, 2),
(15, '中正區', '202', 0, 2),
(16, '中山區', '203', 0, 2),
(17, '安樂區', '204', 0, 2),
(18, '暖暖區', '205', 0, 2),
(19, '七堵區', '206', 0, 2),
(20, '萬里區', '207', 0, 3),
(21, '金山區', '208', 0, 3),
(22, '板橋區', '220', 0, 3),
(23, '汐止區', '221', 0, 3),
(24, '深坑區', '222', 0, 3),
(25, '石碇區', '223', 0, 3),
(26, '瑞芳區', '224', 0, 3),
(27, '平溪區', '226', 0, 3),
(28, '雙溪區', '227', 0, 3),
(29, '貢寮區', '228', 0, 3),
(30, '新店區', '231', 0, 3),
(31, '坪林區', '232', 0, 3),
(32, '烏來區', '233', 0, 3),
(33, '永和區', '234', 0, 3),
(34, '中和區', '235', 0, 3),
(35, '土城區', '236', 0, 3),
(36, '三峽區', '237', 0, 3),
(37, '樹林區', '238', 0, 3),
(38, '鶯歌區', '239', 0, 3),
(39, '三重區', '241', 0, 3),
(40, '新莊區', '242', 0, 3),
(41, '泰山區', '243', 0, 3),
(42, '林口區', '244', 0, 3),
(43, '蘆洲區', '247', 0, 3),
(44, '五股區', '248', 0, 3),
(45, '八里區', '249', 0, 3),
(46, '淡水區', '251', 0, 3),
(47, '三芝區', '252', 0, 3),
(48, '石門區', '253', 0, 3),
(49, '宜蘭市', '260', 0, 4),
(50, '頭城鎮', '261', 0, 4),
(51, '礁溪鄉', '262', 0, 4),
(52, '壯圍鄉', '263', 0, 4),
(53, '員山鄉', '264', 0, 4),
(54, '羅東鎮', '265', 0, 4),
(55, '三星鄉', '266', 0, 4),
(56, '大同鄉', '267', 0, 4),
(57, '五結鄉', '268', 0, 4),
(58, '冬山鄉', '269', 0, 4),
(59, '蘇澳鎮', '270', 0, 4),
(60, '南澳鄉', '272', 0, 4),
(61, '釣魚台列嶼', '290', 0, 4),
(62, '新竹市(東區)', '300', 0, 5),
(63, '竹北市', '302', 0, 6),
(64, '湖口鄉', '303', 0, 6),
(65, '新豐鄉', '304', 0, 6),
(66, '新埔鎮', '305', 0, 6),
(67, '關西鎮', '306', 0, 6),
(68, '芎林鄉', '307', 0, 6),
(69, '寶山鄉', '308', 0, 6),
(70, '竹東鎮', '310', 0, 6),
(71, '五峰鄉', '311', 0, 6),
(72, '橫山鄉', '312', 0, 6),
(73, '尖石鄉', '313', 0, 6),
(74, '北埔鄉', '314', 0, 6),
(75, '峨眉鄉', '315', 0, 6),
(76, '中壢區', '320', 0, 7),
(77, '平鎮區', '324', 0, 7),
(78, '龍潭區', '325', 0, 7),
(79, '楊梅區', '326', 0, 7),
(80, '新屋區', '327', 0, 7),
(81, '觀音區', '328', 0, 7),
(82, '桃園區', '330', 0, 7),
(83, '龜山區', '333', 0, 7),
(84, '八德區', '334', 0, 7),
(85, '大溪區', '335', 0, 7),
(86, '復興區', '336', 0, 7),
(87, '大園區', '337', 0, 7),
(88, '蘆竹區', '338', 0, 7),
(89, '竹南鎮', '350', 0, 8),
(90, '頭份市', '351', 0, 8),
(91, '三灣鄉', '352', 0, 8),
(92, '南庄鄉', '353', 0, 8),
(93, '獅潭鄉', '354', 0, 8),
(94, '後龍鎮', '356', 0, 8),
(95, '通霄鎮', '357', 0, 8),
(96, '苑裡鎮', '358', 0, 8),
(97, '苗栗市', '360', 0, 8),
(98, '造橋鄉', '361', 0, 8),
(99, '頭屋鄉', '362', 0, 8),
(100, '公館鄉', '363', 0, 8),
(101, '大湖鄉', '364', 0, 8),
(102, '泰安鄉', '365', 0, 8),
(103, '銅鑼鄉', '366', 0, 8),
(104, '三義鄉', '367', 0, 8),
(105, '西湖鄉', '368', 0, 8),
(106, '卓蘭鎮', '369', 0, 8),
(107, '中區', '400', 0, 9),
(108, '東區', '401', 0, 9),
(109, '南區', '402', 0, 9),
(110, '西區', '403', 0, 9),
(111, '北區', '404', 0, 9),
(112, '北屯區', '406', 0, 9),
(113, '西屯區', '407', 0, 9),
(114, '南屯區', '408', 0, 9),
(115, '太平區', '411', 0, 9),
(116, '大里區', '412', 0, 9),
(117, '霧峰區', '413', 0, 9),
(118, '烏日區', '414', 0, 9),
(119, '豐原區', '420', 0, 9),
(120, '后里區', '421', 0, 9),
(121, '石岡區', '422', 0, 9),
(122, '東勢區', '423', 0, 9),
(123, '和平區', '424', 0, 9),
(124, '新社區', '426', 0, 9),
(125, '潭子區', '427', 0, 9),
(126, '大雅區', '428', 0, 9),
(127, '神岡區', '429', 0, 9),
(128, '大肚區', '432', 0, 9),
(129, '沙鹿區', '433', 0, 9),
(130, '龍井區', '434', 0, 9),
(131, '梧棲區', '435', 0, 9),
(132, '清水區', '436', 0, 9),
(133, '大甲區', '437', 0, 9),
(134, '外埔區', '438', 0, 9),
(135, '大安區', '439', 0, 9),
(136, '彰化市', '500', 0, 10),
(137, '芬園鄉', '502', 0, 10),
(138, '花壇鄉', '503', 0, 10),
(139, '秀水鄉', '504', 0, 10),
(140, '鹿港鎮', '505', 0, 10),
(141, '福興鄉', '506', 0, 10),
(142, '線西鄉', '507', 0, 10),
(143, '和美鎮', '508', 0, 10),
(144, '伸港鄉', '509', 0, 10),
(145, '員林市', '510', 0, 10),
(146, '社頭鄉', '511', 0, 10),
(147, '永靖鄉', '512', 0, 10),
(148, '埔心鄉', '513', 0, 10),
(149, '溪湖鎮', '514', 0, 10),
(150, '大村鄉', '515', 0, 10),
(151, '埔鹽鄉', '516', 0, 10),
(152, '田中鎮', '520', 0, 10),
(153, '北斗鎮', '521', 0, 10),
(154, '田尾鄉', '522', 0, 10),
(155, '埤頭鄉', '523', 0, 10),
(156, '溪州鄉', '524', 0, 10),
(157, '竹塘鄉', '525', 0, 10),
(158, '二林鎮', '526', 0, 10),
(159, '大城鄉', '527', 0, 10),
(160, '芳苑鄉', '528', 0, 10),
(161, '二水鄉', '530', 0, 10),
(162, '南投市', '540', 0, 11),
(163, '中寮鄉', '541', 0, 11),
(164, '草屯鎮', '542', 0, 11),
(165, '國姓鄉', '544', 0, 11),
(166, '埔里鎮', '545', 0, 11),
(167, '仁愛鄉', '546', 0, 11),
(168, '名間鄉', '551', 0, 11),
(169, '集集鎮', '552', 0, 11),
(170, '水里鄉', '553', 0, 11),
(171, '魚池鄉', '555', 0, 11),
(172, '信義鄉', '556', 0, 11),
(173, '竹山鎮', '557', 0, 11),
(174, '鹿谷鄉', '558', 0, 11),
(175, '斗南鎮', '630', 0, 12),
(176, '大埤鄉', '631', 0, 12),
(177, '虎尾鎮', '632', 0, 12),
(178, '土庫鎮', '633', 0, 12),
(179, '褒忠鄉', '634', 0, 12),
(180, '東勢鄉', '635', 0, 12),
(181, '臺西鄉', '636', 0, 12),
(182, '崙背鄉', '637', 0, 12),
(183, '麥寮鄉', '638', 0, 12),
(184, '斗六市', '640', 0, 12),
(185, '林內鄉', '643', 0, 12),
(186, '古坑鄉', '646', 0, 12),
(187, '莿桐鄉', '647', 0, 12),
(188, '西螺鎮', '648', 0, 12),
(189, '二崙鄉', '649', 0, 12),
(190, '北港鎮', '651', 0, 12),
(191, '水林鄉', '652', 0, 12),
(192, '口湖鄉', '653', 0, 12),
(193, '四湖鄉', '654', 0, 12),
(194, '元長鄉', '655', 0, 12),
(195, '嘉義市(東區)', '600', 0, 13),
(196, '番路鄉', '602', 0, 14),
(197, '梅山鄉', '603', 0, 14),
(198, '竹崎鄉', '604', 0, 14),
(199, '阿里山鄉', '605', 0, 14),
(200, '中埔鄉', '606', 0, 14),
(201, '大埔鄉', '607', 0, 14),
(202, '水上鄉', '608', 0, 14),
(203, '鹿草鄉', '611', 0, 14),
(204, '太保市', '612', 0, 14),
(205, '朴子市', '613', 0, 14),
(206, '東石鄉', '614', 0, 14),
(207, '六腳鄉', '615', 0, 14),
(208, '新港鄉', '616', 0, 14),
(209, '民雄鄉', '621', 0, 14),
(210, '大林鎮', '622', 0, 14),
(211, '溪口鄉', '623', 0, 14),
(212, '義竹鄉', '624', 0, 14),
(213, '布袋鎮', '625', 0, 14),
(214, '中西區', '700', 0, 15),
(215, '東區', '701', 0, 15),
(216, '南區', '702', 0, 15),
(217, '北區', '704', 0, 15),
(218, '安平區', '708', 0, 15),
(219, '安南區', '709', 0, 15),
(220, '永康區', '710', 0, 15),
(221, '歸仁區', '711', 0, 15),
(222, '新化區', '712', 0, 15),
(223, '左鎮區', '713', 0, 15),
(224, '玉井區', '714', 0, 15),
(225, '楠西區', '715', 0, 15),
(226, '南化區', '716', 0, 15),
(227, '仁德區', '717', 0, 15),
(228, '關廟區', '718', 0, 15),
(229, '龍崎區', '719', 0, 15),
(230, '官田區', '720', 0, 15),
(231, '麻豆區', '721', 0, 15),
(232, '佳里區', '722', 0, 15),
(233, '西港區', '723', 0, 15),
(234, '七股區', '724', 0, 15),
(235, '將軍區', '725', 0, 15),
(236, '學甲區', '726', 0, 15),
(237, '北門區', '727', 0, 15),
(238, '新營區', '730', 0, 15),
(239, '後壁區', '731', 0, 15),
(240, '白河區', '732', 0, 15),
(241, '東山區', '733', 0, 15),
(242, '六甲區', '734', 0, 15),
(243, '下營區', '735', 0, 15),
(244, '柳營區', '736', 0, 15),
(245, '鹽水區', '737', 0, 15),
(246, '善化區', '741', 0, 15),
(247, '大內區', '742', 0, 15),
(248, '山上區', '743', 0, 15),
(249, '新市區', '744', 0, 15),
(250, '安定區', '745', 0, 15),
(251, '新興區', '800', 0, 16),
(252, '前金區', '801', 0, 16),
(253, '苓雅區', '802', 0, 16),
(254, '鹽埕區', '803', 0, 16),
(255, '鼓山區', '804', 0, 16),
(256, '旗津區', '805', 0, 16),
(257, '前鎮區', '806', 0, 16),
(258, '三民區', '807', 0, 16),
(259, '楠梓區', '811', 0, 16),
(260, '小港區', '812', 0, 16),
(261, '左營區', '813', 0, 16),
(262, '仁武區', '814', 0, 16),
(263, '大社區', '815', 0, 16),
(264, '岡山區', '820', 0, 16),
(265, '路竹區', '821', 0, 16),
(266, '阿蓮區', '822', 0, 16),
(267, '田寮區', '823', 0, 16),
(268, '燕巢區', '824', 0, 16),
(269, '橋頭區', '825', 0, 16),
(270, '梓官區', '826', 0, 16),
(271, '彌陀區', '827', 0, 16),
(272, '永安區', '828', 0, 16),
(273, '湖內區', '829', 0, 16),
(274, '鳳山區', '830', 0, 16),
(275, '大寮區', '831', 0, 16),
(276, '林園區', '832', 0, 16),
(277, '鳥松區', '833', 0, 16),
(278, '大樹區', '840', 0, 16),
(279, '旗山區', '842', 0, 16),
(280, '美濃區', '843', 0, 16),
(281, '六龜區', '844', 0, 16),
(282, '內門區', '845', 0, 16),
(283, '杉林區', '846', 0, 16),
(284, '甲仙區', '847', 0, 16),
(285, '桃源區', '848', 0, 16),
(286, '那瑪夏區', '849', 0, 16),
(287, '茂林區', '851', 0, 16),
(288, '茄萣區', '852', 0, 16),
(289, '東沙', '817', 0, 17),
(290, '南沙', '819', 0, 17),
(291, '馬公市', '880', 0, 18),
(292, '西嶼鄉', '881', 0, 18),
(293, '望安鄉', '882', 0, 18),
(294, '七美鄉', '883', 0, 18),
(295, '白沙鄉', '884', 0, 18),
(296, '湖西鄉', '885', 0, 18),
(297, '屏東市', '900', 0, 19),
(298, '三地門鄉', '901', 0, 19),
(299, '霧臺鄉', '902', 0, 19),
(300, '瑪家鄉', '903', 0, 19),
(301, '九如鄉', '904', 0, 19),
(302, '里港鄉', '905', 0, 19),
(303, '高樹鄉', '906', 0, 19),
(304, '鹽埔鄉', '907', 0, 19),
(305, '長治鄉', '908', 0, 19),
(306, '麟洛鄉', '909', 0, 19),
(307, '竹田鄉', '911', 0, 19),
(308, '內埔鄉', '912', 0, 19),
(309, '萬丹鄉', '913', 0, 19),
(310, '潮州鎮', '920', 0, 19),
(311, '泰武鄉', '921', 0, 19),
(312, '來義鄉', '922', 0, 19),
(313, '萬巒鄉', '923', 0, 19),
(314, '崁頂鄉', '924', 0, 19),
(315, '新埤鄉', '925', 0, 19),
(316, '南州鄉', '926', 0, 19),
(317, '林邊鄉', '927', 0, 19),
(318, '東港鄉', '928', 0, 19),
(319, '琉球鄉', '929', 0, 19),
(320, '佳冬鄉', '931', 0, 19),
(321, '新園鄉', '932', 0, 19),
(322, '枋寮鄉', '940', 0, 19),
(323, '枋山鄉', '941', 0, 19),
(324, '春日鄉', '942', 0, 19),
(325, '獅子鄉', '943', 0, 19),
(326, '車城鄉', '944', 0, 19),
(327, '牡丹鄉', '945', 0, 19),
(328, '恆春鎮', '946', 0, 19),
(329, '滿州鄉', '947', 0, 19),
(330, '臺東市', '950', 0, 20),
(331, '綠島鄉', '951', 0, 20),
(332, '蘭嶼鄉', '952', 0, 20),
(333, '延平鄉', '953', 0, 20),
(334, '卑南鄉', '954', 0, 20),
(335, '鹿野鄉', '955', 0, 20),
(336, '關山鎮', '956', 0, 20),
(337, '海端鄉', '957', 0, 20),
(338, '池上鄉', '958', 0, 20),
(339, '東河鄉', '959', 0, 20),
(340, '成功鎮', '961', 0, 20),
(341, '長濱鄉', '962', 0, 20),
(342, '太麻里鄉', '963', 0, 20),
(343, '金峰鄉', '964', 0, 20),
(344, '大武鄉', '965', 0, 20),
(345, '達仁鄉', '966', 0, 20),
(346, '花蓮市', '970', 0, 21),
(347, '新城鄉', '971', 0, 21),
(348, '秀林鄉', '972', 0, 21),
(349, '吉安鄉', '973', 0, 21),
(350, '壽豐鄉', '974', 0, 21),
(351, '鳳林鎮', '975', 0, 21),
(352, '光復鄉', '976', 0, 21),
(353, '豐濱鄉', '977', 0, 21),
(354, '瑞穗鄉', '978', 0, 21),
(355, '萬榮鄉', '979', 0, 21),
(356, '玉里鎮', '981', 0, 21),
(357, '卓溪鄉', '982', 0, 21),
(358, '富里鄉', '983', 0, 21),
(359, '金沙鎮', '890', 0, 22),
(360, '金湖鎮', '891', 0, 22),
(361, '金寧鄉', '892', 0, 22),
(362, '金城鎮', '893', 0, 22),
(363, '烈嶼鄉', '894', 0, 22),
(364, '烏坵鄉', '896', 0, 22),
(365, '南竿鄉', '209', 0, 23),
(366, '北竿鄉', '210', 0, 23),
(367, '莒光鄉', '211', 0, 23),
(368, '東引鄉', '212', 0, 23),
(371, '新竹市(北區)', '300', 0, 5),
(372, '新竹市(香山區)', '300', 0, 5),
(373, '嘉義市(西區)', '600', 0, 13);

-- --------------------------------------------------------

--
-- 資料表結構 `uorder`
--

CREATE TABLE `uorder` (
  `orderid` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '訂單編號',
  `MemberID` int(10) NOT NULL COMMENT '會員編號',
  `addressid` int(10) NOT NULL COMMENT '收件人編號',
  `howpay` tinyint(4) NOT NULL DEFAULT '1' COMMENT '如何付款',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '訂單處理狀態',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '備註',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '訂單時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 資料表的匯出資料 `uorder`
--

INSERT INTO `uorder` (`orderid`, `MemberID`, `addressid`, `howpay`, `status`, `remark`, `create_date`) VALUES
('1619161669175448', 10, 4, 1, 1, NULL, '2021-04-23 07:07:49'),
('1619161734581887', 10, 4, 1, 1, NULL, '2021-04-23 07:08:54'),
('1619181180278775', 10, 9, 1, 1, NULL, '2021-04-23 12:33:00'),
('1619260500232495', 10, 4, 1, 1, NULL, '2021-04-24 10:35:00'),
('1619261102143533', 10, 4, 1, 1, NULL, '2021-04-24 10:45:02'),
('1619261151557635', 10, 10, 1, 1, NULL, '2021-04-24 10:45:51'),
('1685597575542364', 1, 1, 1, 1, NULL, '2023-06-01 05:32:56'),
('1685597785384545', 2, 17, 1, 1, NULL, '2023-06-01 05:36:25'),
('1685693613392730', 3, 18, 1, 1, NULL, '2023-06-02 08:13:33'),
('1686183488387319', 1, 1, 1, 1, NULL, '2023-06-08 00:18:08'),
('1686193148497924', 1, 1, 1, 1, NULL, '2023-06-08 02:59:08'),
('1686292861596362', 1, 20, 1, 1, NULL, '2023-06-09 06:41:01');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `addbook`
--
ALTER TABLE `addbook`
  ADD PRIMARY KEY (`addressid`);

--
-- 資料表索引 `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`caro_id`);

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`);

--
-- 資料表索引 `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`AutoNo`);

--
-- 資料表索引 `hot`
--
ALTER TABLE `hot`
  ADD PRIMARY KEY (`h_id`);

--
-- 資料表索引 `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ItemID`);

--
-- 資料表索引 `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`MemberID`);

--
-- 資料表索引 `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`OrderItemID`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- 資料表索引 `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`);

--
-- 資料表索引 `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`img_id`);

--
-- 資料表索引 `pyclass`
--
ALTER TABLE `pyclass`
  ADD PRIMARY KEY (`classid`);

--
-- 資料表索引 `town`
--
ALTER TABLE `town`
  ADD PRIMARY KEY (`townNo`);

--
-- 資料表索引 `uorder`
--
ALTER TABLE `uorder`
  ADD PRIMARY KEY (`orderid`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `addbook`
--
ALTER TABLE `addbook`
  MODIFY `addressid` int(10) NOT NULL AUTO_INCREMENT COMMENT '地址ID', AUTO_INCREMENT=21;
--
-- 使用資料表 AUTO_INCREMENT `carousel`
--
ALTER TABLE `carousel`
  MODIFY `caro_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '輪播編號', AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(10) NOT NULL AUTO_INCREMENT COMMENT '購物車編號', AUTO_INCREMENT=102;
--
-- 使用資料表 AUTO_INCREMENT `city`
--
ALTER TABLE `city`
  MODIFY `AutoNo` int(10) NOT NULL AUTO_INCREMENT COMMENT '城市編號', AUTO_INCREMENT=24;
--
-- 使用資料表 AUTO_INCREMENT `hot`
--
ALTER TABLE `hot`
  MODIFY `h_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '熱銷商品流水號', AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `items`
--
ALTER TABLE `items`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- 使用資料表 AUTO_INCREMENT `members`
--
ALTER TABLE `members`
  MODIFY `MemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `OrderItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- 使用資料表 AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- 使用資料表 AUTO_INCREMENT `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用資料表 AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '產品編號', AUTO_INCREMENT=36;
--
-- 使用資料表 AUTO_INCREMENT `product_img`
--
ALTER TABLE `product_img`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '圖檔編號', AUTO_INCREMENT=37;
--
-- 使用資料表 AUTO_INCREMENT `town`
--
ALTER TABLE `town`
  MODIFY `townNo` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '鄕鎮市編號', AUTO_INCREMENT=374;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
