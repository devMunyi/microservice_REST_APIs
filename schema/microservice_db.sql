-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2022 at 02:26 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `microservice_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

CREATE TABLE `tbl_logs` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `logged_date` datetime NOT NULL DEFAULT current_timestamp(),
  `service_id` int(10) NOT NULL COMMENT 'Referencing table tbl_services column id',
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`id`, `text`, `logged_date`, `service_id`, `status`) VALUES
(1, 'Today\'s Date is => 2022-02-14<br>Substring of today\'s date => 14<br>Substring of today\'s month => 02<br>The time is => 22:38<br>Today is on => 14<br>Today is on => Mon<br>This is the month of => 02<br>This is the month of => Feb<br>This is the year => 2022Time testing =>1644867490', '2022-02-14 22:38:10', 13, 0),
(2, 'Today\'s Date is => 2022-02-14<br>Substring of today\'s date => 14<br>Substring of today\'s month => 02<br>The time is => 22:42<br>Today is on => 14<br>Today is on => Mon<br>This is the month of => 02<br>This is the month of => Feb<br>This is the year => 2022Time testing =>1644867728', '2022-02-14 22:42:08', 13, 1),
(3, '', '2022-02-14 22:42:47', 5, 1),
(4, 'Today\'s Date is => 2022-02-14<br>Substring of today\'s date => 14<br>Substring of today\'s month => 02<br>The time is => 22:47<br>Today is on => 14<br>Today is on => Mon<br>This is the month of => 02<br>This is the month of => Feb<br>This is the year => 2022Time testing =>1644868028', '2022-02-14 22:47:08', 13, 1),
(5, '', '2022-02-14 22:47:19', 5, 1),
(6, '<!doctype html>\n<html>\n<head>\n    <title>Example Domain</title>\n\n    <meta charset=\"utf-8\" />\n    <meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\n    <style type=\"text/css\">\n    body {\n        background-color: #f0f0f2;\n        margin: 0;\n        padding: 0;\n        font-family: -apple-system, system-ui, BlinkMacSystemFont, \"Segoe UI\", \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\n        \n    }\n    div {\n        width: 600px;\n        margin: 5em auto;\n        padding: 2em;\n        background-color: #fdfdff;\n        border-radius: 0.5em;\n        box-shadow: 2px 3px 7px 2px rgba(0,0,0,0.02);\n    }\n    a:link, a:visited {\n        color: #38488f;\n        text-decoration: none;\n    }\n    @media (max-width: 700px) {\n        div {\n            margin: 0 auto;\n            width: auto;\n        }\n    }\n    </style>    \n</head>\n\n<body>\n<div>\n    <h1>Example Domain</h1>\n    <p>This domain is for use in illustrative examples in documents. You may use this\n    domain in literature without prior coordination or asking for permission.</p>\n    <p><a href=\"https://www.iana.org/domains/example\">More information...</a></p>\n</div>\n</body>\n</html>\n', '2022-02-19 18:26:09', 2, 1),
(7, '<!doctype html>\n<html>\n<head>\n    <title>Example Domain</title>\n\n    <meta charset=\"utf-8\" />\n    <meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\n    <style type=\"text/css\">\n    body {\n        background-color: #f0f0f2;\n        margin: 0;\n        padding: 0;\n        font-family: -apple-system, system-ui, BlinkMacSystemFont, \"Segoe UI\", \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\n        \n    }\n    div {\n        width: 600px;\n        margin: 5em auto;\n        padding: 2em;\n        background-color: #fdfdff;\n        border-radius: 0.5em;\n        box-shadow: 2px 3px 7px 2px rgba(0,0,0,0.02);\n    }\n    a:link, a:visited {\n        color: #38488f;\n        text-decoration: none;\n    }\n    @media (max-width: 700px) {\n        div {\n            margin: 0 auto;\n            width: auto;\n        }\n    }\n    </style>    \n</head>\n\n<body>\n<div>\n    <h1>Example Domain</h1>\n    <p>This domain is for use in illustrative examples in documents. You may use this\n    domain in literature without prior coordination or asking for permission.</p>\n    <p><a href=\"https://www.iana.org/domains/example\">More information...</a></p>\n</div>\n</body>\n</html>\n', '2022-02-19 18:28:06', 2, 1),
(8, '<!doctype html>\n<html>\n<head>\n    <title>Example Domain</title>\n\n    <meta charset=\"utf-8\" />\n    <meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\n    <style type=\"text/css\">\n    body {\n        background-color: #f0f0f2;\n        margin: 0;\n        padding: 0;\n        font-family: -apple-system, system-ui, BlinkMacSystemFont, \"Segoe UI\", \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\n        \n    }\n    div {\n        width: 600px;\n        margin: 5em auto;\n        padding: 2em;\n        background-color: #fdfdff;\n        border-radius: 0.5em;\n        box-shadow: 2px 3px 7px 2px rgba(0,0,0,0.02);\n    }\n    a:link, a:visited {\n        color: #38488f;\n        text-decoration: none;\n    }\n    @media (max-width: 700px) {\n        div {\n            margin: 0 auto;\n            width: auto;\n        }\n    }\n    </style>    \n</head>\n\n<body>\n<div>\n    <h1>Example Domain</h1>\n    <p>This domain is for use in illustrative examples in documents. You may use this\n    domain in literature without prior coordination or asking for permission.</p>\n    <p><a href=\"https://www.iana.org/domains/example\">More information...</a></p>\n</div>\n</body>\n</html>\n', '2022-02-19 18:29:24', 2, 1),
(9, '<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML 2.0//EN\">\n<html><head>\n<title>404 Not Found</title>\n</head><body>\n<h1>Not Found</h1>\n<p>The requested URL was not found on this server.</p>\n<hr>\n<address>Apache/2.4.51 (Win64) OpenSSL/1.1.1l PHP/8.0.13 Server at localhost Port 80</address>\n</body></html>\n', '2022-02-19 18:38:20', 13, 1),
(10, 'Today\'s Date is => 2022-02-19<br>Substring of today\'s date => 19<br>Substring of today\'s month => 02<br>The time is => 18:44<br>Today is on => 19<br>Today is on => Sat<br>This is the month of => 02<br>This is the month of => Feb<br>This is the year => 2022<br>Time testing =>1645285459<br>Current secs =>19<br><br>Yes it true<br>Current full date is =>2022-02-19 18:44:19<br>Current full date plus 1 month is =>2022-03-19 18:44:19', '2022-02-19 18:44:19', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_services`
--

CREATE TABLE `tbl_services` (
  `id` int(10) NOT NULL,
  `service_address` varchar(250) NOT NULL,
  `r_timestamp` datetime NOT NULL,
  `unit` char(20) NOT NULL,
  `frequency` char(3) NOT NULL,
  `is_executed` char(3) NOT NULL DEFAULT 'No',
  `added_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_services`
--

INSERT INTO `tbl_services` (`id`, `service_address`, `r_timestamp`, `unit`, `frequency`, `is_executed`, `added_at`, `updated_at`, `status`) VALUES
(1, 'https://example.com/notification_sms.php', '2022-02-19 18:30:00', 'MINUTES', '5', 'No', '2022-02-19 16:44:54', '2022-02-19 17:10:18', 1),
(2, 'https://example.com/notification_sms.php', '2022-02-19 18:39:00', 'MINUTES', '10', 'No', '2022-02-19 17:01:16', '2022-02-19 18:29:24', 1),
(3, 'https://example.com/notification_sms.php', '2022-02-19 18:30:00', 'HOURS', '1', 'No', '2022-02-19 17:13:06', '2022-02-19 17:13:06', 1),
(4, 'https://example.com/notification_sms.php', '2022-02-19 18:30:00', 'HOURS', '2', 'No', '2022-02-19 17:13:29', '2022-02-19 17:13:29', 1),
(5, 'https://example.com/notification_sms.php', '2022-02-19 18:30:00', 'DAYS', '1', 'No', '2022-02-19 17:14:21', '2022-02-19 17:14:21', 1),
(6, 'https://example.com/notification_sms.php', '2022-02-19 18:30:00', 'DAYS', '2', 'No', '2022-02-19 17:15:29', '2022-02-19 17:15:29', 1),
(7, 'https://example.com/notification_sms.php', '2022-02-19 18:30:00', 'WEEKS', '1', 'No', '2022-02-19 17:16:01', '2022-02-19 17:16:01', 1),
(8, 'https://example.com/notification_sms.php', '2022-02-19 18:30:00', 'WEEKS', '2', 'No', '2022-02-19 17:16:10', '2022-02-19 17:16:10', 1),
(9, 'https://example.com/notification_sms.php', '2022-02-19 18:30:00', 'MONTHS', '1', 'No', '2022-02-19 17:16:36', '2022-02-19 17:16:36', 1),
(10, 'https://example.com/notification_sms.php', '2022-02-19 18:30:00', 'MONTHS', '2', 'No', '2022-02-19 17:16:43', '2022-02-19 17:16:43', 1),
(11, 'https://example.com/notification_sms.php', '2022-02-19 18:30:00', 'YEARS', '1', 'No', '2022-02-19 17:16:57', '2022-02-19 17:16:57', 1),
(12, 'https://example.com/notification_sms.php', '2022-02-19 18:30:00', 'YEARS', '2', 'No', '2022-02-19 17:17:06', '2022-02-19 17:17:06', 1),
(13, 'http://localhost/microservice/dates.php', '2022-02-19 18:44:00', 'DAYS', '0', 'Yes', '2022-02-19 18:37:47', '2022-02-19 18:47:52', 0),
(14, 'http://localhost/dates.php', '2022-02-19 18:38:00', 'DAYS', '0', 'No', '2022-02-20 16:15:53', '2022-02-20 16:17:30', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_services`
--
ALTER TABLE `tbl_services`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_services`
--
ALTER TABLE `tbl_services`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
