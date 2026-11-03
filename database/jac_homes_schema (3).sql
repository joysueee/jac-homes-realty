-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2026 at 05:56 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jac_homes`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounting_officer`
--

CREATE TABLE `accounting_officer` (
  `accounting_officer_id` int(11) NOT NULL COMMENT 'Unique identifier of the accounting officer profile.',
  `user_id` int(11) NOT NULL COMMENT 'Login account linked to the accounting officer profile.',
  `employee_number` varchar(20) NOT NULL COMMENT 'Company employee number.',
  `date_hired` date NOT NULL COMMENT 'Date the officer was hired.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounting_officer`
--

INSERT INTO `accounting_officer` (`accounting_officer_id`, `user_id`, `employee_number`, `date_hired`) VALUES
(1, 2, 'EMP-0002', '2026-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL COMMENT 'Unique identifier of the admin profile.',
  `user_id` int(11) NOT NULL COMMENT 'Login account linked to the admin profile.',
  `prc_license_number` varchar(30) DEFAULT NULL COMMENT 'PRC license number of the admin or broker.',
  `date_appointed` date NOT NULL COMMENT 'Date the admin was appointed.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `user_id`, `prc_license_number`, `date_appointed`) VALUES
(1, 1, '0012345', '2026-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `agent_id` int(11) NOT NULL COMMENT 'Unique identifier of the agent.',
  `agent_code` varchar(20) DEFAULT NULL COMMENT 'Agent code assigned by the brokerage after approval. Blank until assigned.',
  `user_id` int(11) NOT NULL COMMENT 'Login account of the agent. Name, contact number and email are kept on the user account.',
  `team_id` int(11) DEFAULT NULL COMMENT 'Team the agent belongs to.',
  `birth_date` date NOT NULL COMMENT 'Agent''s date of birth.',
  `address` varchar(150) NOT NULL COMMENT 'Agent''s home address.',
  `date_joined` date NOT NULL COMMENT 'Date the agent joined the brokerage.',
  `is_encoder` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'True if the admin has given the agent authority to encode records, recruit agents and do accounting tasks such as recording collections. Default is false.',
  `status` varchar(15) NOT NULL COMMENT 'Agent status: Pending, Active, Inactive or Disapproved.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`agent_id`, `agent_code`, `user_id`, `team_id`, `birth_date`, `address`, `date_joined`, `is_encoder`, `status`) VALUES
(1, 'AG-0001', 3, 1, '1988-03-14', 'Blk 5 Lot 12 Sampaguita St., Poblacion, Sample City', '2026-01-10', 1, 'Active'),
(2, 'AG-0002', 4, 1, '1993-07-21', '22 Mabini St., Poblacion, Sample City', '2026-02-01', 0, 'Active'),
(3, 'AG-0003', 5, 2, '1990-11-02', '8 Rizal Ave., Poblacion, Sample City', '2026-02-15', 0, 'Active'),
(4, 'AG-0004', 6, 2, '1996-05-30', '15 Luna St., Poblacion, Sample City', '2026-03-10', 0, 'Pending'),
(5, 'AG-0005', 7, 1, '1999-01-23', '115 Roxas St., Brgy. Bagumbayan, Sample City', '2026-03-20', 0, 'Active'),
(6, 'AG-0006', 8, 1, '1994-08-18', '60 Burgos St., Brgy. San Jose, Sample City', '2026-04-05', 0, 'Active'),
(7, 'AG-0007', 9, 2, '1996-11-07', '78 Laurel St., Brgy. Santo Nino, Sample City', '2026-04-20', 0, 'Active'),
(8, 'AG-0008', 10, 3, '2001-12-12', '23 Narra St., Brgy. Carmen, Sample City', '2026-05-04', 0, 'Active'),
(9, 'AG-0009', 11, 3, '1985-09-08', '4 Gumamela St., Brgy. San Jose, Sample City', '2026-05-18', 0, 'Active'),
(10, 'AG-0010', 12, 3, '1996-03-17', '144 Osmena St., Brgy. Del Pilar, Sample City', '2026-05-28', 0, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `agent_accreditation`
--

CREATE TABLE `agent_accreditation` (
  `accreditation_id` int(11) NOT NULL COMMENT 'Unique identifier of the accreditation record.',
  `agent_id` int(11) NOT NULL COMMENT 'Agent the accreditation belongs to.',
  `accreditation_status` varchar(10) NOT NULL COMMENT 'Status of the accreditation.',
  `prc_license_number` varchar(30) DEFAULT NULL COMMENT 'PRC license number of the agent.',
  `dhsud_accreditation_number` varchar(30) DEFAULT NULL COMMENT 'DHSUD accreditation number of the agent.',
  `accreditation_expiry_date` date DEFAULT NULL COMMENT 'Date the accreditation expires.',
  `issue_date` date DEFAULT NULL COMMENT 'Date the accreditation was issued.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_accreditation`
--

INSERT INTO `agent_accreditation` (`accreditation_id`, `agent_id`, `accreditation_status`, `prc_license_number`, `dhsud_accreditation_number`, `accreditation_expiry_date`, `issue_date`) VALUES
(1, 1, 'Valid', '0101234', 'DHSUD-2026-0001', '2027-01-31', '2026-01-31'),
(2, 2, 'Valid', '0101235', 'DHSUD-2026-0002', '2027-02-28', '2026-02-28'),
(3, 3, 'Expired', '0101236', NULL, '2026-05-31', '2025-05-31'),
(4, 5, 'Valid', '0102005', 'DHSUD-2026-0005', '2027-04-10', '2026-04-10'),
(5, 6, 'Valid', '0102006', 'DHSUD-2026-0006', '2027-04-26', '2026-04-26'),
(6, 7, 'Valid', '0102007', 'DHSUD-2026-0007', '2027-05-11', '2026-05-11'),
(7, 8, 'Valid', '0102008', 'DHSUD-2026-0008', '2027-05-25', '2026-05-25'),
(8, 9, 'Valid', '0102009', 'DHSUD-2026-0009', '2027-06-08', '2026-06-08'),
(9, 10, 'Valid', '0102010', 'DHSUD-2026-0010', '2027-06-18', '2026-06-18');

-- --------------------------------------------------------

--
-- Table structure for table `agent_position`
--

CREATE TABLE `agent_position` (
  `position_id` int(11) NOT NULL COMMENT 'Unique identifier of the agent position.',
  `position_code` varchar(20) NOT NULL COMMENT 'Short code of the agent position.',
  `position_name` varchar(100) NOT NULL COMMENT 'Name of the agent position.',
  `base_commission_rate` decimal(5,2) NOT NULL COMMENT 'Base commission rate of the position.',
  `hierarchy_level` int(11) NOT NULL COMMENT 'Level of the position in the agent hierarchy.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_position`
--

INSERT INTO `agent_position` (`position_id`, `position_code`, `position_name`, `base_commission_rate`, `hierarchy_level`) VALUES
(1, 'JR-PS', 'JR Property Specialist', 2.50, 1),
(2, 'ASS', 'Area Sales Supervisor', 3.00, 2),
(3, 'ASM', 'Area Sales Manager', 3.25, 3),
(4, 'ASD', 'Area Sales Director', 3.50, 4),
(5, 'AB', 'Associate Broker', 4.00, 5),
(6, 'MLB', 'Managing Lead Broker', 5.00, 6);

-- --------------------------------------------------------

--
-- Table structure for table `agent_position_history`
--

CREATE TABLE `agent_position_history` (
  `position_history_id` int(11) NOT NULL COMMENT 'Unique identifier of the history record.',
  `agent_id` int(11) NOT NULL COMMENT 'Agent concerned.',
  `position_id` int(11) NOT NULL COMMENT 'Agent position held by the agent.',
  `commission_rate` decimal(5,2) NOT NULL COMMENT 'Commission rate that applied to the agent in this position.',
  `promotion_date` date NOT NULL COMMENT 'Date the agent started in this position.',
  `user_id` int(11) NOT NULL COMMENT 'User who assigned or recorded the position.',
  `end_date` date DEFAULT NULL COMMENT 'Date the agent left this position. Blank if it is the current position.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_position_history`
--

INSERT INTO `agent_position_history` (`position_history_id`, `agent_id`, `position_id`, `commission_rate`, `promotion_date`, `user_id`, `end_date`) VALUES
(1, 1, 3, 3.25, '2026-01-12', 1, NULL),
(2, 2, 1, 2.50, '2026-02-03', 3, NULL),
(3, 3, 1, 2.50, '2026-02-16', 1, '2026-05-31'),
(4, 3, 2, 3.00, '2026-06-01', 1, NULL),
(5, 5, 1, 2.50, '2026-03-22', 1, '2026-07-31'),
(6, 5, 2, 3.00, '2026-08-01', 1, NULL),
(7, 6, 1, 2.50, '2026-04-07', 1, NULL),
(8, 7, 1, 2.50, '2026-04-22', 1, NULL),
(9, 8, 2, 3.00, '2026-05-06', 1, NULL),
(10, 9, 1, 2.50, '2026-05-20', 1, '2026-07-31'),
(11, 9, 2, 3.00, '2026-08-01', 1, NULL),
(12, 10, 1, 2.50, '2026-05-30', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agent_ranking`
--

CREATE TABLE `agent_ranking` (
  `ranking_id` int(11) NOT NULL COMMENT 'Unique identifier of the ranking record.',
  `ranking_period_id` int(11) NOT NULL COMMENT 'Period ranked.',
  `agent_id` int(11) NOT NULL COMMENT 'Agent ranked.',
  `total_sales_amount` decimal(11,2) NOT NULL COMMENT 'Agent''s total sales in the period.',
  `rank_position` int(11) NOT NULL COMMENT 'Agent''s rank in the period (1 = highest).',
  `created_at` date NOT NULL COMMENT 'Date the record was created.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_ranking`
--

INSERT INTO `agent_ranking` (`ranking_id`, `ranking_period_id`, `agent_id`, `total_sales_amount`, `rank_position`, `created_at`) VALUES
(1, 1, 1, 36850000.00, 1, '2026-08-01'),
(2, 1, 8, 7610000.00, 2, '2026-08-01'),
(3, 1, 5, 7250000.00, 3, '2026-08-01'),
(4, 1, 2, 4730000.00, 4, '2026-08-01'),
(5, 1, 10, 3310000.00, 5, '2026-08-01'),
(6, 2, 5, 31830000.00, 1, '2026-09-01'),
(7, 2, 6, 19800000.00, 2, '2026-09-01'),
(8, 2, 7, 5160000.00, 3, '2026-09-01'),
(9, 2, 1, 3700000.00, 4, '2026-09-01'),
(10, 2, 8, 2980000.00, 5, '2026-09-01'),
(11, 3, 9, 15740000.00, 1, '2026-10-01'),
(12, 3, 1, 0.00, 2, '2026-10-01'),
(13, 3, 2, 0.00, 3, '2026-10-01'),
(14, 3, 5, 0.00, 4, '2026-10-01'),
(15, 3, 6, 0.00, 5, '2026-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `building_detail`
--

CREATE TABLE `building_detail` (
  `detail_id` int(11) NOT NULL COMMENT 'Unique identifier of the detail record.',
  `property_id` int(11) NOT NULL COMMENT 'Property described by the detail record.',
  `building_name` varchar(100) NOT NULL COMMENT 'Name of the building.',
  `building_use` varchar(50) NOT NULL COMMENT 'Use of the building (e.g., commercial, office).',
  `number_of_floors` int(11) NOT NULL COMMENT 'Number of floors.',
  `total_floor_area_sqm` decimal(7,2) NOT NULL COMMENT 'Total floor area in square meters.',
  `year_built` int(11) DEFAULT NULL COMMENT 'Year the building was built.',
  `parking_slots` int(11) NOT NULL COMMENT 'Number of parking slots.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `building_detail`
--

INSERT INTO `building_detail` (`detail_id`, `property_id`, `building_name`, `building_use`, `number_of_floors`, `total_floor_area_sqm`, `year_built`, `parking_slots`) VALUES
(1, 3, 'Mercado Warehouse Building', 'Warehouse', 3, 990.00, 2009, 28),
(2, 8, 'Cabrera Mixed-Use Building', 'Mixed-Use', 1, 840.00, 2015, 6),
(3, 16, 'Enriquez Mixed-Use Building', 'Mixed-Use', 3, 460.00, 2014, 25),
(4, 21, 'Lim Mixed-Use Building', 'Mixed-Use', 4, 540.00, 2004, 19),
(5, 27, 'Torres Commercial Building', 'Commercial', 2, 1180.00, 2018, 9),
(6, 46, 'Sy Mixed-Use Building', 'Mixed-Use', 1, 1150.00, 2009, 14);

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `buyer_id` int(11) NOT NULL COMMENT 'Unique identifier of the buyer.',
  `first_name` varchar(50) NOT NULL COMMENT 'Buyer''s first name.',
  `middle_name` varchar(50) DEFAULT NULL COMMENT 'Buyer''s middle name.',
  `last_name` varchar(50) NOT NULL COMMENT 'Buyer''s last name.',
  `contact_number` varchar(15) NOT NULL COMMENT 'Buyer''s contact number.',
  `email` varchar(100) DEFAULT NULL COMMENT 'Buyer''s email address.',
  `address` varchar(150) NOT NULL COMMENT 'Buyer''s address.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`buyer_id`, `first_name`, `middle_name`, `last_name`, `contact_number`, `email`, `address`) VALUES
(1, 'Francis', 'Navarro', 'Lopez', '09972981506', 'francis.lopez@mail.example', '19 Jacinto St., Brgy. Villa Verde, Sample City'),
(2, 'Ryan', 'Delos Santos', 'Flores', '09198391454', 'ryan.flores@mail.example', '145 Ilang-Ilang St., Brgy. Pag-asa, Sample City'),
(3, 'Faith', NULL, 'Mendoza', '09090161033', NULL, '151 Sampaguita St., Brgy. Santa Cruz, Sample City'),
(4, 'Cristina', 'Mendoza', 'Hernandez', '09668484751', 'cristina.hernandez@mail.example', '54 Rosal St., Brgy. Bagong Silang, Sample City'),
(5, 'Maria', 'Valdez', 'Salvador', '09561159714', NULL, '56 Jasmine St., Brgy. San Antonio, Sample City'),
(6, 'Carlito', 'Aquino', 'Perez', '09834335141', 'carlito.perez@mail.example', '193 Narra St., Brgy. San Isidro, Sample City'),
(7, 'Kenneth', 'Mercado', 'Gonzales', '09259435189', 'kenneth.gonzales@mail.example', '149 Jasmine St., Brgy. San Isidro, Sample City'),
(8, 'Ana', 'Ocampo', 'Navarro', '09100457721', 'ana.navarro@mail.example', '129 Gumamela St., Brgy. San Antonio, Sample City'),
(9, 'Zenaida', 'Villanueva', 'Enriquez', '09541894232', 'zenaida.enriquez@mail.example', '140 Dahlia St., Brgy. Poblacion, Sample City'),
(10, 'Henry', NULL, 'Hernandez', '09324682034', NULL, '17 Molave St., Brgy. Maligaya, Sample City'),
(11, 'Darwin', NULL, 'Dizon', '09706524706', 'darwin.dizon@mail.example', '147 Rizal St., Brgy. Poblacion, Sample City'),
(12, 'Felix', 'Domingo', 'Flores', '09696291370', 'felix.flores@mail.example', '46 Mahogany St., Brgy. Bagong Silang, Sample City'),
(13, 'Samuel', 'Mercado', 'Hernandez', '09773658943', 'samuel.hernandez@mail.example', '13 Bonifacio St., Brgy. San Antonio, Sample City'),
(14, 'Marvin', 'Rivera', 'Ramos', '09444852791', 'marvin.ramos@mail.example', '32 Jasmine St., Brgy. San Roque, Sample City'),
(15, 'John Paul', 'Magno', 'Villanueva', '09076568280', 'john.villanueva@mail.example', '135 Bonifacio St., Brgy. San Antonio, Sample City'),
(16, 'Katrina', 'Flores', 'Domingo', '09917366625', NULL, '113 Luna St., Brgy. Santo Nino, Sample City'),
(17, 'Christian', 'Torres', 'Torres', '09443680387', 'christian.torres@mail.example', '149 Rizal St., Brgy. Poblacion, Sample City'),
(18, 'Gilbert', 'Salvador', 'Navarro', '09283449472', NULL, '140 Burgos St., Brgy. Maligaya, Sample City'),
(19, 'Angelica', NULL, 'Uy', '09341019084', 'angelica.uy@mail.example', '173 Gumamela St., Brgy. Bagumbayan, Sample City'),
(20, 'Joseph', 'Pascual', 'Ocampo', '09685850177', 'joseph.ocampo@mail.example', '90 Laurel St., Brgy. San Roque, Sample City'),
(21, 'Gemma', NULL, 'De Guzman', '09638049837', 'gemma.deguzman@mail.example', '154 Mahogany St., Brgy. Del Pilar, Sample City'),
(22, 'Ian', 'Maglaya', 'Perez', '09358069665', 'ian.perez@mail.example', '160 Orchid St., Brgy. Bagumbayan, Sample City'),
(23, 'Miguel', 'Lacson', 'De Guzman', '09406264219', NULL, '3 Burgos St., Brgy. Pag-asa, Sample City'),
(24, 'Pia', 'Dizon', 'Hernandez', '09727804819', 'pia.hernandez@mail.example', '109 Bonifacio St., Brgy. Bagong Silang, Sample City'),
(25, 'Shiela', 'Ramos', 'Reyes', '09164943833', 'shiela.reyes@mail.example', '86 Roxas St., Brgy. San Isidro, Sample City'),
(26, 'Charmaine', 'Go', 'Enriquez', '09024845936', 'charmaine.enriquez@mail.example', '144 Jacinto St., Brgy. Santa Cruz, Sample City'),
(27, 'Erica', 'Estrada', 'Estrada', '09309656343', 'erica.estrada@mail.example', '19 Rosal St., Brgy. Bagumbayan, Sample City'),
(28, 'Jenny', NULL, 'Tolentino', '09294782227', 'jenny.tolentino@mail.example', '93 Laurel St., Brgy. San Antonio, Sample City'),
(29, 'Angelica', 'Ocampo', 'Tan', '09136571200', 'angelica.tan@mail.example', '153 Rizal St., Brgy. Pag-asa, Sample City'),
(30, 'Carlo', NULL, 'De Guzman', '09975419213', NULL, '103 Magsaysay St., Brgy. Maligaya, Sample City'),
(31, 'Cristina', 'Padilla', 'Gonzales', '09963745791', 'cristina.gonzales@mail.example', '55 Bonifacio St., Brgy. Poblacion, Sample City'),
(32, 'Maria', 'Velasco', 'Del Rosario', '09436220062', 'maria.delrosario@mail.example', '171 Ilang-Ilang St., Brgy. Poblacion, Sample City'),
(33, 'Francis', 'Pascual', 'Flores', '09008082041', 'francis.flores@mail.example', '111 Bonifacio St., Brgy. San Jose, Sample City'),
(34, 'Patricia', NULL, 'Go', '09376544330', 'patricia.go@mail.example', '151 Orchid St., Brgy. Santa Cruz, Sample City'),
(35, 'Rochelle', 'Bautista', 'Perez', '09586838614', 'rochelle.perez@mail.example', '191 Jasmine St., Brgy. Bagumbayan, Sample City'),
(36, 'Miguel', 'Bautista', 'Dizon', '09360018785', 'miguel.dizon@mail.example', '26 Del Pilar St., Brgy. Poblacion, Sample City'),
(37, 'Liza', NULL, 'Tolentino', '09708414514', NULL, '9 Jacinto St., Brgy. Poblacion, Sample City'),
(38, 'Jericho', 'Torres', 'Go', '09416388355', 'jericho.go@mail.example', '131 Jacinto St., Brgy. Pag-asa, Sample City'),
(39, 'Rafael', 'Padilla', 'Flores', '09988042356', NULL, '134 Del Pilar St., Brgy. San Isidro, Sample City'),
(40, 'Patricia', 'Lacson', 'Magno', '09856455458', 'patricia.magno@mail.example', '129 Rizal St., Brgy. San Roque, Sample City'),
(41, 'Irene', 'Ocampo', 'Lim', '09747756190', 'irene.lim@mail.example', '35 Mabini St., Brgy. San Roque, Sample City'),
(42, 'Erica', 'Lopez', 'Navarro', '09564795882', NULL, '8 Luna St., Brgy. Mabuhay, Sample City'),
(43, 'Emmanuel', 'Aguilar', 'Flores', '09901841341', NULL, '162 Orchid St., Brgy. San Roque, Sample City'),
(44, 'Miguel', 'Morales', 'Rivera', '09095743397', 'miguel.rivera@mail.example', '61 Sampaguita St., Brgy. Maligaya, Sample City'),
(45, 'Carlito', 'Dizon', 'Castillo', '09630868716', NULL, '158 Mahogany St., Brgy. San Antonio, Sample City'),
(46, 'Ramon', NULL, 'Cruz', '09034081485', 'ramon.cruz@mail.example', '199 Ilang-Ilang St., Brgy. Carmen, Sample City'),
(47, 'Darwin', 'Maglaya', 'Salvador', '09699474287', 'darwin.salvador@mail.example', '151 Luna St., Brgy. San Roque, Sample City'),
(48, 'Kevin', NULL, 'Dizon', '09905664011', 'kevin.dizon@mail.example', '2 Jacinto St., Brgy. Mabuhay, Sample City'),
(49, 'Lorraine', 'Soriano', 'Abad', '09671752620', NULL, '45 Roxas St., Brgy. Bagong Silang, Sample City'),
(50, 'Felix', 'Panganiban', 'Salvador', '09464657376', NULL, '184 Sampaguita St., Brgy. San Isidro, Sample City'),
(51, 'Bea', 'Dizon', 'Villanueva', '09271620169', 'bea.villanueva@mail.example', '14 Ilang-Ilang St., Brgy. San Jose, Sample City'),
(52, 'Leo', NULL, 'Bautista', '09186144270', NULL, '55 Molave St., Brgy. Carmen, Sample City'),
(53, 'Marites', 'Panganiban', 'Torres', '09761971269', NULL, '180 Osmena St., Brgy. Santa Cruz, Sample City');

-- --------------------------------------------------------

--
-- Table structure for table `commission_collection`
--

CREATE TABLE `commission_collection` (
  `collection_id` int(11) NOT NULL COMMENT 'Unique identifier of the collection.',
  `collection_no` varchar(20) NOT NULL COMMENT 'Collection reference number.',
  `or_number` varchar(20) DEFAULT NULL COMMENT 'Official receipt number.',
  `sale_id` int(11) NOT NULL COMMENT 'Sale being paid.',
  `payment_method_id` int(11) NOT NULL COMMENT 'Method of payment.',
  `user_id` int(11) NOT NULL COMMENT 'User who recorded the collection.',
  `collection_date` date NOT NULL COMMENT 'Date the payment was collected.',
  `gross_amount` decimal(11,2) NOT NULL COMMENT 'Amount collected before taxes and deductions.',
  `vat_amount` decimal(11,2) NOT NULL COMMENT 'VAT portion of the amount.',
  `withholding_tax` decimal(11,2) NOT NULL COMMENT 'Withholding tax amount.',
  `deduction_amount` decimal(11,2) NOT NULL COMMENT 'Other deductions.',
  `net_amount` decimal(11,2) NOT NULL COMMENT 'Amount remaining after taxes and deductions.',
  `check_number` varchar(20) DEFAULT NULL COMMENT 'Check number, for check payments.',
  `bank_name` varchar(100) DEFAULT NULL COMMENT 'Bank name, for check or bank payments.',
  `bank_account_number` varchar(30) DEFAULT NULL COMMENT 'Bank account number, for bank transfer payments.',
  `reference_number` varchar(20) DEFAULT NULL COMMENT 'Bank or transaction reference number.',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'Additional notes.',
  `status` varchar(10) NOT NULL COMMENT 'Collection status.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commission_collection`
--

INSERT INTO `commission_collection` (`collection_id`, `collection_no`, `or_number`, `sale_id`, `payment_method_id`, `user_id`, `collection_date`, `gross_amount`, `vat_amount`, `withholding_tax`, `deduction_amount`, `net_amount`, `check_number`, `bank_name`, `bank_account_number`, `reference_number`, `remarks`, `status`) VALUES
(1, 'COL-2026-0001', 'OR-000001', 1, 1, 2, '2026-07-09', 150750.00, 16151.79, 2691.96, 0.00, 148058.04, NULL, NULL, NULL, NULL, 'Commission remitted by the developer', 'Active'),
(2, 'COL-2026-0002', 'OR-000002', 2, 3, 2, '2026-08-03', 3525.00, 377.68, 0.00, 0.00, 3525.00, NULL, 'Sample National Bank', '3210301134', 'TRX-932000', 'Lease commission - company share remitted by the agent', 'Active'),
(3, 'COL-2026-0003', 'OR-000003', 3, 3, 2, '2026-08-05', 261000.00, 27964.29, 0.00, 0.00, 261000.00, NULL, 'Sample National Bank', '0435557966', 'TRX-857691', 'Company share remitted by the agent', 'Active'),
(4, 'COL-2026-0004', 'OR-000004', 4, 1, 3, '2026-08-11', 287650.00, 30819.64, 5136.61, 0.00, 282513.39, NULL, NULL, NULL, NULL, 'Commission remitted by the developer', 'Active'),
(5, 'COL-2026-0005', 'OR-000005', 5, 3, 2, '2026-08-04', 181200.00, 19414.29, 3235.71, 0.00, 177964.29, NULL, 'Sample National Bank', '7416285712', 'TRX-390751', 'Commission remitted by the developer', 'Active'),
(6, 'COL-2026-0006', 'OR-000006', 6, 1, 2, '2026-08-03', 126450.00, 13548.21, 2258.04, 0.00, 124191.96, NULL, NULL, NULL, NULL, 'Commission remitted by the developer', 'Active'),
(7, 'COL-2026-0007', 'OR-000007', 7, 3, 3, '2026-08-25', 212850.00, 22805.36, 3800.89, 0.00, 209049.11, NULL, 'Sample National Bank', '1498889867', 'TRX-339155', 'Commission remitted by the developer', 'Active'),
(8, 'COL-2026-0008', 'OR-000008', 8, 3, 2, '2026-09-16', 165825.00, 17766.96, 0.00, 0.00, 165825.00, NULL, 'Island Savings Bank', '9035780057', 'TRX-273017', 'Company share remitted by the agent', 'Active'),
(9, 'COL-2026-0009', 'OR-000009', 9, 3, 2, '2026-08-15', 6675.00, 715.18, 0.00, 0.00, 6675.00, NULL, 'Island Savings Bank', '9495917561', 'TRX-796548', 'Lease commission - company share remitted by the agent', 'Active'),
(10, 'COL-2026-0010', 'OR-000010', 10, 1, 2, '2026-08-12', 132400.00, 14185.71, 2364.29, 0.00, 130035.71, NULL, NULL, NULL, NULL, 'Commission remitted by the developer', 'Active'),
(11, 'COL-2026-0011', 'OR-000011', 11, 3, 2, '2026-09-16', 32625.00, 3495.54, 0.00, 0.00, 32625.00, NULL, 'Sample National Bank', '2516589367', 'TRX-438337', 'Company share remitted by the agent', 'Active'),
(12, 'COL-2026-0012', 'OR-000012', 12, 3, 2, '2026-10-01', 153000.00, 16392.86, 2732.14, 0.00, 150267.86, NULL, 'Metro Sample Bank', '3110887975', 'TRX-865911', 'Commission remitted by the developer', 'Active'),
(13, 'COL-2026-0013', 'OR-000013', 14, 3, 3, '2026-10-08', 77000.00, 8250.00, 1375.00, 0.00, 75625.00, NULL, 'Island Savings Bank', '2270595297', 'TRX-304715', 'Commission remitted by the developer', 'Active'),
(14, 'COL-2026-0014', 'OR-000014', 16, 3, 2, '2026-09-01', 89100.00, 9546.43, 0.00, 0.00, 89100.00, NULL, 'Island Savings Bank', '8677884289', 'TRX-345632', 'Company share remitted by the agent', 'Active'),
(15, 'COL-2026-0015', 'OR-000015', 17, 2, 2, '2026-09-30', 163900.00, 17560.71, 2926.79, 0.00, 160973.21, '1108020', 'Sample National Bank', NULL, NULL, 'Commission remitted by the developer', 'Active'),
(16, 'COL-2026-0016', 'OR-000016', 19, 3, 3, '2026-09-30', 5100.00, 546.43, 0.00, 0.00, 5100.00, NULL, 'First Sample Bank', '2778909397', 'TRX-516456', 'Lease commission - company share remitted by the agent', 'Active'),
(17, 'COL-2026-0017', 'OR-000017', 20, 3, 2, '2026-09-21', 203500.00, 21803.57, 3633.93, 0.00, 199866.07, NULL, 'Sample National Bank', '9420801837', 'TRX-982793', 'Commission remitted by the developer', 'Active'),
(18, 'COL-2026-0018', 'OR-000018', 21, 2, 2, '2026-10-07', 196875.00, 21093.75, 0.00, 0.00, 196875.00, '9481315', 'First Sample Bank', NULL, NULL, 'Company share remitted by the agent', 'Active'),
(19, 'COL-2026-0019', 'OR-000019', 23, 3, 2, '2026-09-22', 8925.00, 956.25, 0.00, 0.00, 8925.00, NULL, 'Sample National Bank', '3337211607', 'TRX-740696', 'Lease commission - company share remitted by the agent', 'Active'),
(20, 'COL-2026-0020', 'OR-000020', 24, 3, 3, '2026-09-30', 283800.00, 30407.14, 5067.86, 1000.00, 277732.14, NULL, 'Metro Sample Bank', '7744965421', 'TRX-506353', 'Commission remitted by the developer', 'Active'),
(21, 'COL-2026-0021', 'OR-000021', 25, 1, 2, '2026-10-18', 194150.00, 20801.79, 3466.96, 0.00, 190683.04, NULL, NULL, NULL, NULL, 'Commission remitted by the developer', 'Active'),
(22, 'COL-2026-0022', 'OR-000022', 27, 3, 2, '2026-10-08', 100500.00, 10767.86, 0.00, 0.00, 100500.00, NULL, 'First Sample Bank', '2065993319', 'TRX-802359', 'Lease commission - company share remitted by the agent', 'Active'),
(23, 'COL-2026-0023', 'OR-000023', 28, 3, 2, '2026-10-13', 15375.00, 1647.32, 0.00, 0.00, 15375.00, NULL, 'Island Savings Bank', '6051621825', 'TRX-200394', 'Company share remitted by the agent', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `commission_rate_history`
--

CREATE TABLE `commission_rate_history` (
  `rate_id` int(11) NOT NULL COMMENT 'Unique identifier of the rate record.',
  `rule_id` int(11) NOT NULL COMMENT 'Rule the rate belongs to.',
  `commission_percentage` decimal(5,2) NOT NULL COMMENT 'Commission percentage. For rental rules, the percentage of one month''s rent.',
  `effective_date` date NOT NULL COMMENT 'Date the rate takes effect.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commission_rate_history`
--

INSERT INTO `commission_rate_history` (`rate_id`, `rule_id`, `commission_percentage`, `effective_date`) VALUES
(1, 2, 5.00, '2026-01-01'),
(2, 2, 5.50, '2026-04-01'),
(3, 1, 4.00, '2026-01-01'),
(4, 3, 3.00, '2026-01-01'),
(5, 4, 5.00, '2026-01-01'),
(6, 5, 100.00, '2026-01-01'),
(7, 6, 4.50, '2026-01-01'),
(8, 6, 5.00, '2026-08-01');

-- --------------------------------------------------------

--
-- Table structure for table `commission_rule`
--

CREATE TABLE `commission_rule` (
  `rule_id` int(11) NOT NULL COMMENT 'Unique identifier of the rule.',
  `owner_id` int(11) DEFAULT NULL COMMENT 'Owner the rule belongs to. Blank for the default rule that applies to all non-developer owners.',
  `project_id` int(11) DEFAULT NULL COMMENT 'Project the rule is limited to.',
  `category_id` int(11) DEFAULT NULL COMMENT 'Property category the rule is limited to.',
  `status` varchar(10) NOT NULL COMMENT 'Rule status.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commission_rule`
--

INSERT INTO `commission_rule` (`rule_id`, `owner_id`, `project_id`, `category_id`, `status`) VALUES
(1, 1, NULL, NULL, 'Active'),
(2, 1, 1, 1, 'Active'),
(3, 2, NULL, NULL, 'Active'),
(4, NULL, NULL, NULL, 'Active'),
(5, NULL, NULL, 2, 'Active'),
(6, 3, NULL, NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `commission_share`
--

CREATE TABLE `commission_share` (
  `share_id` int(11) NOT NULL COMMENT 'Unique identifier of the share.',
  `sale_id` int(11) NOT NULL COMMENT 'Sale the share belongs to.',
  `agent_id` int(11) DEFAULT NULL COMMENT 'Agent receiving the share. Blank if the share is not assigned to a specific agent.',
  `share_type` varchar(20) NOT NULL COMMENT 'Kind of commission share.',
  `share_percent` decimal(5,2) NOT NULL COMMENT 'Percentage of the commission.',
  `share_amount` decimal(11,2) NOT NULL COMMENT 'Amount of the share.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commission_share`
--

INSERT INTO `commission_share` (`share_id`, `sale_id`, `agent_id`, `share_type`, `share_percent`, `share_amount`) VALUES
(1, 1, 5, 'Agent', 60.00, 90450.00),
(2, 1, 1, 'Team Leader', 10.00, 15075.00),
(3, 1, NULL, 'Company', 30.00, 45225.00),
(4, 2, 7, 'Agent', 85.00, 19975.00),
(5, 2, NULL, 'Company', 15.00, 3525.00),
(6, 3, 1, 'Agent', 85.00, 1479000.00),
(7, 3, NULL, 'Company', 15.00, 261000.00),
(8, 4, 9, 'Agent', 60.00, 172590.00),
(9, 4, 8, 'Team Leader', 10.00, 28765.00),
(10, 4, NULL, 'Company', 30.00, 86295.00),
(11, 5, 1, 'Agent', 65.00, 117780.00),
(12, 5, NULL, 'Company', 35.00, 63420.00),
(13, 6, 8, 'Agent', 65.00, 82192.50),
(14, 6, NULL, 'Company', 35.00, 44257.50),
(15, 7, 2, 'Agent', 60.00, 127710.00),
(16, 7, 1, 'Team Leader', 10.00, 21285.00),
(17, 7, NULL, 'Company', 30.00, 63855.00),
(18, 8, 1, 'Agent', 85.00, 939675.00),
(19, 8, NULL, 'Company', 15.00, 165825.00),
(20, 9, 9, 'Agent', 85.00, 37825.00),
(21, 9, NULL, 'Company', 15.00, 6675.00),
(22, 10, 10, 'Agent', 60.00, 79440.00),
(23, 10, 8, 'Team Leader', 10.00, 13240.00),
(24, 10, NULL, 'Company', 30.00, 39720.00),
(25, 11, 5, 'Agent', 85.00, 184875.00),
(26, 11, NULL, 'Company', 15.00, 32625.00),
(27, 12, 8, 'Agent', 65.00, 99450.00),
(28, 12, NULL, 'Company', 35.00, 53550.00),
(29, 14, 8, 'Agent', 65.00, 50050.00),
(30, 14, NULL, 'Company', 35.00, 26950.00),
(31, 16, 6, 'Agent', 85.00, 504900.00),
(32, 16, NULL, 'Company', 15.00, 89100.00),
(33, 17, 8, 'Agent', 65.00, 106535.00),
(34, 17, NULL, 'Company', 35.00, 57365.00),
(35, 19, 1, 'Agent', 85.00, 28900.00),
(36, 19, NULL, 'Company', 15.00, 5100.00),
(37, 20, 1, 'Agent', 65.00, 132275.00),
(38, 20, NULL, 'Company', 35.00, 71225.00),
(39, 21, 5, 'Agent', 85.00, 1115625.00),
(40, 21, NULL, 'Company', 15.00, 196875.00),
(41, 23, 8, 'Agent', 85.00, 50575.00),
(42, 23, NULL, 'Company', 15.00, 8925.00),
(43, 24, 7, 'Agent', 60.00, 170280.00),
(44, 24, 3, 'Team Leader', 10.00, 28380.00),
(45, 24, NULL, 'Company', 30.00, 85140.00),
(46, 25, 5, 'Agent', 60.00, 116490.00),
(47, 25, 1, 'Team Leader', 10.00, 19415.00),
(48, 25, NULL, 'Company', 30.00, 58245.00),
(49, 27, 6, 'Agent', 85.00, 569500.00),
(50, 27, NULL, 'Company', 15.00, 100500.00),
(51, 28, 5, 'Agent', 85.00, 87125.00),
(52, 28, NULL, 'Company', 15.00, 15375.00),
(53, 30, 9, 'Agent', 85.00, 103785.00),
(54, 30, NULL, 'Company', 15.00, 18315.00),
(55, 32, 9, 'Agent', 60.00, 182490.00),
(56, 32, 8, 'Team Leader', 10.00, 30415.00),
(57, 32, NULL, 'Company', 30.00, 91245.00),
(58, 33, 9, 'Agent', 60.00, 120780.00),
(59, 33, 8, 'Team Leader', 10.00, 20130.00),
(60, 33, NULL, 'Company', 30.00, 60390.00),
(61, 34, 5, 'Agent', 60.00, 94200.00),
(62, 34, 1, 'Team Leader', 10.00, 15700.00),
(63, 34, NULL, 'Company', 30.00, 47100.00),
(64, 36, 1, 'Agent', 65.00, 119080.00),
(65, 36, NULL, 'Company', 35.00, 64120.00),
(66, 38, 9, 'Agent', 60.00, 74400.00),
(67, 38, 8, 'Team Leader', 10.00, 12400.00),
(68, 38, NULL, 'Company', 30.00, 37200.00),
(69, 39, 5, 'Agent', 60.00, 122430.00),
(70, 39, 1, 'Team Leader', 10.00, 20405.00),
(71, 39, NULL, 'Company', 30.00, 61215.00),
(72, 40, 6, 'Agent', 60.00, 94500.00),
(73, 40, 1, 'Team Leader', 10.00, 15750.00),
(74, 40, NULL, 'Company', 30.00, 47250.00),
(75, 41, 6, 'Agent', 85.00, 70125.00),
(76, 41, NULL, 'Company', 15.00, 12375.00),
(77, 42, 7, 'Agent', 85.00, 152575.00),
(78, 42, NULL, 'Company', 15.00, 26925.00),
(79, 43, 2, 'Agent', 60.00, 163920.00),
(80, 43, 1, 'Team Leader', 10.00, 27320.00),
(81, 43, NULL, 'Company', 30.00, 81960.00),
(82, 44, 5, 'Agent', 85.00, 376125.00),
(83, 44, NULL, 'Company', 15.00, 66375.00),
(84, 46, 5, 'Agent', 85.00, 476850.00),
(85, 46, NULL, 'Company', 15.00, 84150.00),
(86, 47, 7, 'Agent', 85.00, 28050.00),
(87, 47, NULL, 'Company', 15.00, 4950.00),
(88, 49, 9, 'Agent', 60.00, 178200.00),
(89, 49, 8, 'Team Leader', 10.00, 29700.00),
(90, 49, NULL, 'Company', 30.00, 89100.00),
(91, 50, 7, 'Agent', 60.00, 172920.00),
(92, 50, 3, 'Team Leader', 10.00, 28820.00),
(93, 50, NULL, 'Company', 30.00, 86460.00),
(94, 51, 8, 'Agent', 85.00, 17000.00),
(95, 51, NULL, 'Company', 15.00, 3000.00),
(96, 52, 8, 'Agent', 65.00, 46832.50),
(97, 52, NULL, 'Company', 35.00, 25217.50),
(98, 53, 5, 'Agent', 60.00, 119130.00),
(99, 53, 1, 'Team Leader', 10.00, 19855.00),
(100, 53, NULL, 'Company', 30.00, 59565.00);

-- --------------------------------------------------------

--
-- Table structure for table `commission_voucher`
--

CREATE TABLE `commission_voucher` (
  `voucher_id` int(11) NOT NULL COMMENT 'Unique identifier of the voucher.',
  `voucher_no` varchar(20) NOT NULL COMMENT 'Voucher number.',
  `agent_id` int(11) NOT NULL COMMENT 'Agent receiving the commission.',
  `payment_method_id` int(11) NOT NULL COMMENT 'Method used to release the payment.',
  `user_id` int(11) NOT NULL COMMENT 'User who prepared the voucher.',
  `voucher_date` date NOT NULL COMMENT 'Date the voucher was prepared.',
  `released_date` date DEFAULT NULL COMMENT 'Date the commission was released. Blank until released.',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'Additional notes.',
  `bank_name` varchar(100) DEFAULT NULL COMMENT 'Bank name, for check or bank releases.',
  `bank_account_number` varchar(30) DEFAULT NULL COMMENT 'Bank account number the commission was sent to, for bank releases.',
  `check_number` varchar(20) DEFAULT NULL COMMENT 'Check number, for check releases.',
  `reference_number` varchar(20) DEFAULT NULL COMMENT 'Bank or transaction reference number of the release.',
  `status` varchar(10) NOT NULL COMMENT 'Voucher status.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commission_voucher`
--

INSERT INTO `commission_voucher` (`voucher_id`, `voucher_no`, `agent_id`, `payment_method_id`, `user_id`, `voucher_date`, `released_date`, `remarks`, `bank_name`, `bank_account_number`, `check_number`, `reference_number`, `status`) VALUES
(1, 'CV-2026-0001', 5, 3, 2, '2026-07-13', '2026-07-16', 'Commission for SL-2026-0001', 'Sample National Bank', '8123324105', NULL, 'REL-29175', 'Active'),
(2, 'CV-2026-0002', 1, 2, 2, '2026-07-14', '2026-07-16', 'Commission for SL-2026-0001', 'Island Savings Bank', NULL, '1978300', NULL, 'Active'),
(3, 'CV-2026-0003', 9, 3, 2, '2026-08-15', '2026-08-17', 'Commission for SL-2026-0004', 'Metro Sample Bank', '6484556755', NULL, 'REL-51404', 'Active'),
(4, 'CV-2026-0004', 8, 3, 2, '2026-08-16', '2026-08-17', 'Commission for SL-2026-0004', 'Island Savings Bank', '9282272221', NULL, 'REL-90221', 'Active'),
(5, 'CV-2026-0005', 1, 3, 2, '2026-08-06', '2026-08-08', 'Commission for SL-2026-0005', 'Metro Sample Bank', '3558585512', NULL, 'REL-59210', 'Active'),
(6, 'CV-2026-0006', 8, 3, 2, '2026-08-05', '2026-08-07', 'Commission for SL-2026-0006', 'First Sample Bank', '3503490312', NULL, 'REL-39197', 'Active'),
(7, 'CV-2026-0007', 2, 2, 2, '2026-08-28', '2026-08-31', 'Commission for SL-2026-0007', 'Island Savings Bank', NULL, '4442959', NULL, 'Active'),
(8, 'CV-2026-0008', 1, 3, 2, '2026-08-28', '2026-08-30', 'Commission for SL-2026-0007', 'First Sample Bank', '5205193317', NULL, 'REL-94387', 'Active'),
(9, 'CV-2026-0009', 10, 3, 2, '2026-08-14', '2026-08-16', 'Commission for SL-2026-0010', 'Island Savings Bank', '4476042401', NULL, 'REL-66549', 'Active'),
(10, 'CV-2026-0010', 8, 2, 2, '2026-08-18', '2026-08-20', 'Commission for SL-2026-0010', 'First Sample Bank', NULL, '5719507', NULL, 'Active'),
(11, 'CV-2026-0011', 8, 3, 2, '2026-10-07', '2026-10-11', 'Commission for SL-2026-0012', 'First Sample Bank', '2995055738', NULL, 'REL-49793', 'Active'),
(12, 'CV-2026-0012', 8, 3, 2, '2026-10-10', '2026-10-12', 'Commission for SL-2026-0014', 'First Sample Bank', '2836715422', NULL, 'REL-53246', 'Active'),
(13, 'CV-2026-0013', 8, 3, 2, '2026-10-02', '2026-10-06', 'Commission for SL-2026-0017', 'Sample National Bank', '9778753011', NULL, 'REL-22753', 'Active'),
(14, 'CV-2026-0014', 1, 3, 2, '2026-09-26', '2026-09-29', 'Commission for SL-2026-0020', 'Metro Sample Bank', '7467581268', NULL, 'REL-65994', 'Active'),
(15, 'CV-2026-0015', 7, 3, 2, '2026-10-03', '2026-10-07', 'Commission for SL-2026-0024', 'Metro Sample Bank', '8557859589', NULL, 'REL-70632', 'Active'),
(16, 'CV-2026-0016', 3, 3, 2, '2026-10-05', '2026-10-07', 'Commission for SL-2026-0024', 'Sample National Bank', '0590560555', NULL, 'REL-88675', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `commission_voucher_detail`
--

CREATE TABLE `commission_voucher_detail` (
  `voucher_detail_id` int(11) NOT NULL COMMENT 'Unique identifier of the voucher line.',
  `voucher_id` int(11) NOT NULL COMMENT 'Voucher the line belongs to.',
  `collection_id` int(11) NOT NULL COMMENT 'Collection that funds this line.',
  `gross_amount` decimal(11,2) NOT NULL COMMENT 'Commission amount before taxes and deductions.',
  `vat_amount` decimal(11,2) NOT NULL COMMENT 'VAT portion of the amount.',
  `withholding_tax` decimal(11,2) NOT NULL COMMENT 'Withholding tax amount.',
  `deduction_amount` decimal(11,2) NOT NULL COMMENT 'Other deductions.',
  `percentage_tax` decimal(11,2) NOT NULL COMMENT 'Percentage tax amount.',
  `net_amount` decimal(11,2) NOT NULL COMMENT 'Net commission released for this line.',
  `share_id` int(11) NOT NULL COMMENT 'Commission share paid through this line.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commission_voucher_detail`
--

INSERT INTO `commission_voucher_detail` (`voucher_detail_id`, `voucher_id`, `collection_id`, `gross_amount`, `vat_amount`, `withholding_tax`, `deduction_amount`, `percentage_tax`, `net_amount`, `share_id`) VALUES
(1, 1, 1, 90450.00, 0.00, 4522.50, 0.00, 2713.50, 83214.00, 1),
(2, 2, 1, 15075.00, 0.00, 753.75, 0.00, 452.25, 13869.00, 2),
(3, 3, 4, 172590.00, 0.00, 8629.50, 0.00, 5177.70, 158782.80, 8),
(4, 4, 4, 28765.00, 0.00, 1438.25, 0.00, 862.95, 26463.80, 9),
(5, 5, 5, 117780.00, 0.00, 5889.00, 0.00, 3533.40, 108357.60, 11),
(6, 6, 6, 82192.50, 0.00, 4109.63, 0.00, 2465.78, 75617.09, 13),
(7, 7, 7, 127710.00, 0.00, 6385.50, 0.00, 3831.30, 117493.20, 15),
(8, 8, 7, 21285.00, 0.00, 1064.25, 0.00, 638.55, 19582.20, 16),
(9, 9, 10, 79440.00, 0.00, 3972.00, 0.00, 2383.20, 73084.80, 22),
(10, 10, 10, 13240.00, 0.00, 662.00, 0.00, 397.20, 12180.80, 23),
(11, 11, 12, 99450.00, 0.00, 4972.50, 0.00, 2983.50, 91494.00, 27),
(12, 12, 13, 50050.00, 0.00, 2502.50, 0.00, 1501.50, 46046.00, 29),
(13, 13, 15, 106535.00, 0.00, 5326.75, 0.00, 3196.05, 98012.20, 33),
(14, 14, 17, 132275.00, 0.00, 6613.75, 0.00, 3968.25, 121693.00, 37),
(15, 15, 20, 170280.00, 0.00, 8514.00, 0.00, 5108.40, 156657.60, 43),
(16, 16, 20, 28380.00, 0.00, 1419.00, 0.00, 851.40, 26109.60, 44);

-- --------------------------------------------------------

--
-- Table structure for table `condominium_detail`
--

CREATE TABLE `condominium_detail` (
  `detail_id` int(11) NOT NULL COMMENT 'Unique identifier of the detail record.',
  `property_id` int(11) NOT NULL COMMENT 'Property described by the detail record.',
  `building_name` varchar(100) NOT NULL COMMENT 'Name of the condominium building.',
  `unit_number` varchar(20) NOT NULL COMMENT 'Unit number.',
  `floor_number` int(11) NOT NULL COMMENT 'Floor where the unit is located.',
  `unit_area_sqm` decimal(7,2) NOT NULL COMMENT 'Unit area in square meters.',
  `bedrooms` int(11) NOT NULL COMMENT 'Number of bedrooms.',
  `bathrooms` int(11) NOT NULL COMMENT 'Number of bathrooms.',
  `parking_slots` int(11) NOT NULL COMMENT 'Number of parking slots.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `condominium_detail`
--

INSERT INTO `condominium_detail` (`detail_id`, `property_id`, `building_name`, `unit_number`, `floor_number`, `unit_area_sqm`, `bedrooms`, `bathrooms`, `parking_slots`) VALUES
(1, 2, 'Sunrise Heights Tower 1', '30C', 30, 28.00, 0, 1, 0),
(2, 5, 'Sunrise Heights Tower 2', '9E', 9, 40.00, 1, 1, 0),
(3, 9, 'Sunrise Heights Tower 1', '11H', 11, 58.00, 2, 2, 1),
(4, 10, 'Sunrise Heights Tower 1', '29G', 29, 28.00, 0, 1, 0),
(5, 15, 'Sunrise Heights Tower 1', '22H', 22, 58.00, 2, 2, 1),
(6, 22, 'Sunrise Heights Tower 2', '17E', 17, 28.00, 0, 1, 0),
(7, 29, 'Sunrise Heights Tower 2', '10H', 10, 62.00, 2, 2, 1),
(8, 35, 'Sunrise Heights Tower 1', '12A', 12, 62.00, 2, 2, 1),
(9, 36, 'Sunrise Heights Tower 2', '12E', 12, 40.00, 1, 1, 0),
(10, 37, 'Sunrise Heights Tower 1', '24C', 24, 28.00, 0, 1, 0),
(11, 43, 'Sunrise Heights Tower 1', '28F', 28, 62.00, 2, 2, 1),
(12, 47, 'Sunrise Heights Tower 2', '21F', 21, 40.00, 1, 1, 0),
(13, 51, 'Sunrise Heights Tower 2', '18D', 18, 24.00, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `house_detail`
--

CREATE TABLE `house_detail` (
  `detail_id` int(11) NOT NULL COMMENT 'Unique identifier of the detail record.',
  `property_id` int(11) NOT NULL COMMENT 'Property described by the detail record.',
  `floor_area_sqm` decimal(7,2) NOT NULL COMMENT 'Floor area in square meters.',
  `bedrooms` int(11) NOT NULL COMMENT 'Number of bedrooms.',
  `bathrooms` int(11) NOT NULL COMMENT 'Number of bathrooms.',
  `floors` int(11) NOT NULL COMMENT 'Number of floors.',
  `parking_slots` int(11) NOT NULL COMMENT 'Number of parking slots.',
  `year_built` int(11) DEFAULT NULL COMMENT 'Year the house was built.',
  `lot_area_sqm` decimal(7,2) DEFAULT NULL COMMENT 'Lot area in square meters.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `house_detail`
--

INSERT INTO `house_detail` (`detail_id`, `property_id`, `floor_area_sqm`, `bedrooms`, `bathrooms`, `floors`, `parking_slots`, `year_built`, `lot_area_sqm`) VALUES
(1, 1, 45.00, 2, 1, 1, 1, 2025, 80.00),
(2, 4, 78.00, 3, 2, 2, 1, 2025, 120.00),
(3, 7, 68.00, 3, 2, 2, 1, 2026, 100.00),
(4, 11, 157.00, 3, 3, 2, 2, 2024, 100.00),
(5, 12, 45.00, 2, 1, 1, 1, 2025, 80.00),
(6, 13, 52.00, 2, 1, 1, 1, 2026, 90.00),
(7, 18, 78.00, 3, 2, 2, 1, 2025, 120.00),
(8, 19, 100.00, 2, 2, 2, 1, 2000, 310.00),
(9, 20, 52.00, 2, 1, 1, 1, 2025, 90.00),
(10, 23, 149.00, 3, 2, 2, 2, 2002, 280.00),
(11, 24, 78.00, 3, 2, 2, 1, 2025, 120.00),
(12, 26, 185.00, 4, 3, 1, 0, 2004, 260.00),
(13, 30, 122.00, 2, 2, 1, 1, 2014, 310.00),
(14, 31, 45.00, 2, 1, 1, 1, 2025, 80.00),
(15, 32, 78.00, 3, 2, 2, 1, 2026, 120.00),
(16, 34, 45.00, 2, 1, 1, 1, 2025, 80.00),
(17, 39, 52.00, 2, 1, 1, 1, 2025, 90.00),
(18, 40, 45.00, 2, 1, 1, 1, 2025, 80.00),
(19, 44, 180.00, 4, 4, 2, 3, 2014, 310.00),
(20, 48, 78.00, 3, 2, 2, 1, 2025, 120.00),
(21, 49, 78.00, 3, 2, 2, 1, 2026, 120.00),
(22, 50, 78.00, 3, 2, 2, 1, 2026, 120.00),
(23, 53, 52.00, 2, 1, 1, 1, 2026, 90.00);

-- --------------------------------------------------------

--
-- Table structure for table `incentive`
--

CREATE TABLE `incentive` (
  `incentive_id` int(11) NOT NULL COMMENT 'Unique identifier of the incentive.',
  `agent_id` int(11) NOT NULL COMMENT 'Agent receiving the incentive.',
  `sale_id` int(11) DEFAULT NULL COMMENT 'Sale that triggered the incentive. Blank if not tied to a sale.',
  `user_id` int(11) DEFAULT NULL COMMENT 'User who approved the incentive. Blank until approved.',
  `incentive_type` varchar(50) NOT NULL COMMENT 'Kind of incentive.',
  `description` varchar(255) DEFAULT NULL COMMENT 'Details of the incentive.',
  `amount` decimal(11,2) NOT NULL COMMENT 'Value of the incentive.',
  `status` varchar(10) NOT NULL COMMENT 'Status of the incentive.',
  `incentive_date` date NOT NULL COMMENT 'Date the incentive was granted.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `incentive`
--

INSERT INTO `incentive` (`incentive_id`, `agent_id`, `sale_id`, `user_id`, `incentive_type`, `description`, `amount`, `status`, `incentive_date`) VALUES
(1, 1, 8, 1, 'Top Seller Bonus', 'Top seller for July 2026', 5000.00, 'Released', '2026-08-05'),
(2, 5, 21, 1, 'Top Seller Bonus', 'Top seller for August 2026', 5000.00, 'Released', '2026-09-05'),
(3, 9, 32, NULL, 'Top Seller Bonus', 'Top seller for September 2026', 5000.00, 'Pending', '2026-10-05'),
(4, 1, 8, 1, 'Sales Bonus', 'Highest-value sale of the quarter', 3000.00, 'Released', '2026-08-31'),
(5, 1, NULL, 1, 'Recruitment Bonus', 'Recruited two new agents', 2000.00, 'Released', '2026-06-20'),
(6, 8, NULL, NULL, 'Recruitment Bonus', NULL, 2000.00, 'Pending', '2026-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `lot_detail`
--

CREATE TABLE `lot_detail` (
  `detail_id` int(11) NOT NULL COMMENT 'Unique identifier of the detail record.',
  `property_id` int(11) NOT NULL COMMENT 'Property described by the detail record.',
  `lot_area_sqm` decimal(7,2) NOT NULL COMMENT 'Lot area in square meters.',
  `subdivision_name` varchar(100) DEFAULT NULL COMMENT 'Name of the subdivision.',
  `block_number` varchar(20) DEFAULT NULL COMMENT 'Block number.',
  `lot_number` varchar(20) NOT NULL COMMENT 'Lot number.',
  `title_number` varchar(30) DEFAULT NULL COMMENT 'Land title number.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lot_detail`
--

INSERT INTO `lot_detail` (`detail_id`, `property_id`, `lot_area_sqm`, `subdivision_name`, `block_number`, `lot_number`, `title_number`) VALUES
(1, 6, 185.00, 'Greenfields Residences', '1', '17', 'TCT-T-217662'),
(2, 14, 115.00, 'Sunrise Meadows', '10', '14', 'TCT-T-476170'),
(3, 17, 255.00, 'Sunrise Meadows', '5', '5', 'TCT-T-494391'),
(4, 25, 270.00, 'Sunrise Meadows', '9', '3', 'TCT-T-991205'),
(5, 28, 135.00, NULL, NULL, '52-A', 'TCT-T-671470'),
(6, 33, 285.00, 'Sunrise Meadows', '12', '11', 'TCT-T-725085'),
(7, 38, 185.00, 'Greenfields Residences', '12', '16', 'TCT-T-637026'),
(8, 41, 110.00, NULL, NULL, '11-B', 'TCT-T-901858'),
(9, 42, 215.00, NULL, NULL, '21-B', 'TCT-T-290317'),
(10, 45, 170.00, 'Greenfields Residences', '9', '15', 'TCT-T-599121'),
(11, 52, 115.00, 'Sunrise Meadows', '2', '7', 'TCT-T-164799');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `owner_id` int(11) NOT NULL COMMENT 'Unique identifier of the owner.',
  `owner_name` varchar(100) NOT NULL COMMENT 'Name of the owner or developer company.',
  `is_developer` tinyint(1) NOT NULL COMMENT 'True if the owner is a developer.',
  `contact_person` varchar(100) DEFAULT NULL COMMENT 'Person to contact for this owner.',
  `contact_number` varchar(15) NOT NULL COMMENT 'Contact number of the owner.',
  `email` varchar(100) DEFAULT NULL COMMENT 'Email address of the owner.',
  `address` varchar(150) DEFAULT NULL COMMENT 'Address of the owner.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`owner_id`, `owner_name`, `is_developer`, `contact_person`, `contact_number`, `email`, `address`) VALUES
(1, 'Sunrise Land Developers Inc.', 1, 'Elena Navarro', '09170001111', 'sales@sunriseland.example', 'Business Park, Sample City'),
(2, 'Pedro A. Mercado', 0, NULL, '09182223333', NULL, NULL),
(3, 'Greenfields Realty Development Corp.', 1, 'Marissa Dela Cruz', '09170003333', 'sales@greenfields.example', 'Greenfields Corporate Center, Sample City'),
(4, 'Teresita C. Gonzales', 0, NULL, '09840110704', 'tess.gonzales@mail.example', '64 Roxas St., Brgy. San Isidro, Sample City'),
(5, 'Ramon and Lourdes Bautista', 0, 'Lourdes Bautista', '09925412248', NULL, '44 Molave St., Brgy. Mabuhay, Sample City');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `payment_method_id` int(11) NOT NULL COMMENT 'Unique identifier of the payment method.',
  `method_name` varchar(100) NOT NULL COMMENT 'Name of the method (e.g., Cash, Check, Bank Transfer).',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the method.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_method_id`, `method_name`, `description`) VALUES
(1, 'Cash', 'Cash payment'),
(2, 'Check', 'Check payment'),
(3, 'Bank Transfer', 'Online or over-the-counter bank transfer');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_id` int(11) NOT NULL COMMENT 'Unique identifier of the project.',
  `owner_id` int(11) NOT NULL COMMENT 'Owner or developer of the project.',
  `project_name` varchar(100) NOT NULL COMMENT 'Name of the project.',
  `location` varchar(150) NOT NULL COMMENT 'Location of the project.',
  `coordinator_name` varchar(100) DEFAULT NULL COMMENT 'Name of the project coordinator.',
  `coordinator_contact` varchar(15) DEFAULT NULL COMMENT 'Contact number of the project coordinator.',
  `status` varchar(10) NOT NULL COMMENT 'Project status.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `owner_id`, `project_name`, `location`, `coordinator_name`, `coordinator_contact`, `status`) VALUES
(1, 1, 'Sunrise Meadows', 'Brgy. San Isidro, Sample City', NULL, NULL, 'Active'),
(2, 1, 'Sunrise Heights Condominium', 'Downtown, Sample City', NULL, NULL, 'Active'),
(3, 3, 'Greenfields Residences', 'Brgy. Carmen, Sample City', NULL, NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `property_id` int(11) NOT NULL COMMENT 'Unique identifier of the property.',
  `owner_id` int(11) NOT NULL COMMENT 'Owner of the property.',
  `project_id` int(11) DEFAULT NULL COMMENT 'Project the property belongs to. Blank for stand-alone properties.',
  `model_id` int(11) DEFAULT NULL COMMENT 'Model the property is built as.',
  `category_id` int(11) NOT NULL COMMENT 'Category of the property.',
  `property_type_id` int(11) NOT NULL COMMENT 'Type of the property.',
  `status` varchar(10) NOT NULL COMMENT 'Availability status of the property.',
  `user_id` int(11) NOT NULL COMMENT 'User who encoded the property.',
  `title` varchar(100) NOT NULL COMMENT 'Listing title.',
  `unit_name` varchar(100) DEFAULT NULL COMMENT 'Unit name or number within a project.',
  `list_price` decimal(11,2) NOT NULL COMMENT 'Listed selling price. For rental listings, the monthly rent.',
  `address` varchar(150) NOT NULL COMMENT 'Address or location of the property.',
  `date_listed` date NOT NULL COMMENT 'Date the property was listed.',
  `agent_id` int(11) DEFAULT NULL COMMENT 'Agent who sourced the listing. Required when the owner is not a developer.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `owner_id`, `project_id`, `model_id`, `category_id`, `property_type_id`, `status`, `user_id`, `title`, `unit_name`, `list_price`, `address`, `date_listed`, `agent_id`) VALUES
(1, 3, 3, 3, 1, 1, 'Sold', 1, 'Aurora Model House, Block 12 Lot 19', 'B12 L19', 3350000.00, 'Greenfields Residences, Brgy. Carmen, Sample City', '2026-05-21', NULL),
(2, 5, NULL, NULL, 2, 3, 'Rented', 1, 'For Rent - Studio Condominium Unit 30C', NULL, 23500.00, 'Sunrise Heights Tower 1, Downtown, Sample City', '2026-05-15', 6),
(3, 5, NULL, NULL, 1, 4, 'Sold', 3, 'Three-Storey Warehouse Building', NULL, 34800000.00, '100 Rizal St., Brgy. Santo Nino, Sample City', '2026-05-29', 7),
(4, 1, 1, 2, 1, 1, 'Sold', 1, 'Bianca Model House, Block 1 Lot 4', 'B1 L4', 5230000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-05-15', NULL),
(5, 1, 2, NULL, 1, 3, 'Sold', 1, '1BR Unit 9E', '9E', 4530000.00, 'Sunrise Heights Condominium, Downtown, Sample City', '2026-05-15', NULL),
(6, 3, 3, NULL, 1, 2, 'Sold', 3, 'Residential Lot, Block 1 Lot 17', 'B1 L17', 2810000.00, 'Greenfields Residences, Brgy. Carmen, Sample City', '2026-05-27', NULL),
(7, 3, 3, 4, 1, 1, 'Sold', 1, 'Celeste Model House, Block 10 Lot 14', 'B10 L14', 4730000.00, 'Greenfields Residences, Brgy. Carmen, Sample City', '2026-07-05', NULL),
(8, 2, NULL, NULL, 1, 4, 'Sold', 3, 'One-Storey Mixed-Use Building', NULL, 36850000.00, '68 Roxas St., Brgy. Mabuhay, Sample City', '2026-07-01', 9),
(9, 5, NULL, NULL, 2, 3, 'Rented', 3, 'For Rent - 2BR Condominium Unit 11H', NULL, 44500.00, 'Sunrise Heights Tower 1, Downtown, Sample City', '2026-05-22', 8),
(10, 1, 2, NULL, 1, 3, 'Sold', 1, 'Studio Unit 29G', '29G', 3310000.00, 'Sunrise Heights Condominium, Downtown, Sample City', '2026-05-21', NULL),
(11, 2, NULL, NULL, 1, 1, 'Sold', 1, '3BR House in Brgy. Santa Cruz', NULL, 7250000.00, '154 Molave St., Brgy. Del Pilar, Sample City', '2026-05-26', 8),
(12, 3, 3, 3, 1, 1, 'Sold', 3, 'Aurora Model House, Block 13 Lot 2', 'B13 L2', 3400000.00, 'Greenfields Residences, Brgy. Carmen, Sample City', '2026-06-02', NULL),
(13, 1, 1, 1, 1, 1, 'Available', 3, 'Camille Model House, Block 13 Lot 20', 'B13 L20', 3490000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-05-30', NULL),
(14, 1, 1, NULL, 1, 2, 'Sold', 1, 'Residential Lot, Block 10 Lot 14', 'B10 L14', 1400000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-06-11', NULL),
(15, 4, NULL, NULL, 2, 3, 'Available', 3, 'For Rent - 2BR Condominium Unit 22H', NULL, 50500.00, 'Sunrise Heights Tower 1, Downtown, Sample City', '2026-06-17', 2),
(16, 2, NULL, NULL, 1, 4, 'Sold', 3, 'Three-Storey Mixed-Use Building', NULL, 19800000.00, '101 Molave St., Brgy. San Isidro, Sample City', '2026-07-07', 6),
(17, 1, 1, NULL, 1, 2, 'Sold', 3, 'Residential Lot, Block 5 Lot 5', 'B5 L5', 2980000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-07-25', NULL),
(18, 1, 1, 2, 1, 1, 'Available', 3, 'Bianca Model House, Block 3 Lot 5', 'B3 L5', 5600000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-07-02', NULL),
(19, 5, NULL, NULL, 2, 1, 'Rented', 1, 'For Rent - 2BR House in Brgy. Del Pilar', NULL, 34000.00, '20 Gumamela St., Brgy. San Roque, Sample City', '2026-06-14', 6),
(20, 1, 1, 1, 1, 1, 'Sold', 3, 'Camille Model House, Block 4 Lot 13', 'B4 L13', 3700000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-07-04', NULL),
(21, 5, NULL, NULL, 1, 4, 'Sold', 3, 'Four-Storey Mixed-Use Building', NULL, 26250000.00, '22 Jasmine St., Brgy. Poblacion, Sample City', '2026-07-22', 1),
(22, 2, NULL, NULL, 2, 3, 'Available', 3, 'For Rent - Studio Condominium Unit 17E', NULL, 25000.00, 'Sunrise Heights Tower 2, Downtown, Sample City', '2026-06-23', 9),
(23, 2, NULL, NULL, 2, 1, 'Rented', 1, 'For Rent - 3BR House in Brgy. Mabuhay', NULL, 59500.00, '4 Luna St., Brgy. Santa Cruz, Sample City', '2026-07-25', 7),
(24, 1, 1, 2, 1, 1, 'Sold', 1, 'Bianca Model House, Block 7 Lot 23', 'B7 L23', 5160000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-08-07', NULL),
(25, 1, 1, NULL, 1, 2, 'Sold', 1, 'Residential Lot, Block 9 Lot 3', 'B9 L3', 3530000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-07-11', NULL),
(26, 4, NULL, NULL, 2, 1, 'Available', 3, 'For Rent - 4BR House in Brgy. Bagong Silang', NULL, 66000.00, '54 Kamagong St., Brgy. Maligaya, Sample City', '2026-07-10', 5),
(27, 2, NULL, NULL, 2, 4, 'Rented', 1, 'For Rent - Two-Storey Commercial Building', NULL, 670000.00, '56 Rosal St., Brgy. Santa Cruz, Sample City', '2026-08-23', 8),
(28, 5, NULL, NULL, 1, 2, 'Sold', 1, 'Residential Lot 52-A, Brgy. Bagumbayan', NULL, 2050000.00, '97 Molave St., Brgy. Maligaya, Sample City', '2026-08-11', 1),
(29, 1, 2, NULL, 1, 3, 'Available', 1, '2BR Unit 10H', '10H', 6580000.00, 'Sunrise Heights Condominium, Downtown, Sample City', '2026-08-17', NULL),
(30, 2, NULL, NULL, 1, 1, 'Sold', 1, '2BR House in Brgy. Pag-asa', NULL, 4070000.00, '109 Narra St., Brgy. San Jose, Sample City', '2026-08-19', 8),
(31, 3, 3, 3, 1, 1, 'Available', 1, 'Aurora Model House, Block 6 Lot 2', 'B6 L2', 3270000.00, 'Greenfields Residences, Brgy. Carmen, Sample City', '2026-08-02', NULL),
(32, 1, 1, 2, 1, 1, 'Sold', 3, 'Bianca Model House, Block 13 Lot 17', 'B13 L17', 5530000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-08-20', NULL),
(33, 1, 1, NULL, 1, 2, 'Sold', 3, 'Residential Lot, Block 12 Lot 11', 'B12 L11', 3660000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-08-19', NULL),
(34, 3, 3, 3, 1, 1, 'Reserved', 3, 'Aurora Model House, Block 10 Lot 19', 'B10 L19', 3140000.00, 'Greenfields Residences, Brgy. Carmen, Sample City', '2026-08-22', NULL),
(35, 1, 2, NULL, 1, 3, 'Available', 1, '2BR Unit 12A', '12A', 7420000.00, 'Sunrise Heights Condominium, Downtown, Sample City', '2026-09-15', NULL),
(36, 1, 2, NULL, 1, 3, 'Reserved', 3, '1BR Unit 12E', '12E', 4580000.00, 'Sunrise Heights Condominium, Downtown, Sample City', '2026-08-31', NULL),
(37, 1, 2, NULL, 1, 3, 'Available', 3, 'Studio Unit 24C', '24C', 3340000.00, 'Sunrise Heights Condominium, Downtown, Sample City', '2026-08-03', NULL),
(38, 3, 3, NULL, 1, 2, 'Sold', 3, 'Residential Lot, Block 12 Lot 16', 'B12 L16', 2480000.00, 'Greenfields Residences, Brgy. Carmen, Sample City', '2026-09-11', NULL),
(39, 1, 1, 1, 1, 1, 'Reserved', 3, 'Camille Model House, Block 1 Lot 15', 'B1 L15', 3710000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-09-10', NULL),
(40, 3, 3, 3, 1, 1, 'Sold', 3, 'Aurora Model House, Block 2 Lot 19', 'B2 L19', 3150000.00, 'Greenfields Residences, Brgy. Carmen, Sample City', '2026-08-03', NULL),
(41, 5, NULL, NULL, 1, 2, 'Sold', 1, 'Residential Lot 11-B, Brgy. Maligaya', NULL, 1650000.00, '11 Rizal St., Brgy. San Jose, Sample City', '2026-10-01', 1),
(42, 4, NULL, NULL, 1, 2, 'Reserved', 1, 'Residential Lot 21-B, Brgy. San Roque', NULL, 3590000.00, '19 Osmena St., Brgy. Santo Nino, Sample City', '2026-09-17', 10),
(43, 1, 2, NULL, 1, 3, 'Reserved', 3, '2BR Unit 28F', '28F', 6830000.00, 'Sunrise Heights Condominium, Downtown, Sample City', '2026-10-01', NULL),
(44, 5, NULL, NULL, 1, 1, 'Reserved', 3, '4BR House in Brgy. Santo Nino', NULL, 8850000.00, '78 Orchid St., Brgy. San Antonio, Sample City', '2026-08-17', 10),
(45, 3, 3, NULL, 1, 2, 'Available', 3, 'Residential Lot, Block 9 Lot 15', 'B9 L15', 2340000.00, 'Greenfields Residences, Brgy. Carmen, Sample City', '2026-08-07', NULL),
(46, 5, NULL, NULL, 2, 4, 'Reserved', 3, 'For Rent - One-Storey Mixed-Use Building', NULL, 561000.00, '95 Mabini St., Brgy. Villa Verde, Sample City', '2026-09-28', 8),
(47, 5, NULL, NULL, 2, 3, 'Reserved', 3, 'For Rent - 1BR Condominium Unit 21F', NULL, 33000.00, 'Sunrise Heights Tower 2, Downtown, Sample City', '2026-08-15', 2),
(48, 1, 1, 2, 1, 1, 'Available', 1, 'Bianca Model House, Block 9 Lot 15', 'B9 L15', 5510000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-09-20', NULL),
(49, 1, 1, 2, 1, 1, 'Sold', 1, 'Bianca Model House, Block 7 Lot 7', 'B7 L7', 5400000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-09-24', NULL),
(50, 1, 1, 2, 1, 1, 'Reserved', 3, 'Bianca Model House, Block 7 Lot 18', 'B7 L18', 5240000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-10-01', NULL),
(51, 4, NULL, NULL, 2, 3, 'Reserved', 1, 'For Rent - Studio Condominium Unit 18D', NULL, 20000.00, 'Sunrise Heights Tower 2, Downtown, Sample City', '2026-08-24', 2),
(52, 1, 1, NULL, 1, 2, 'Reserved', 1, 'Residential Lot, Block 2 Lot 7', 'B2 L7', 1310000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-09-24', NULL),
(53, 1, 1, 1, 1, 1, 'Reserved', 3, 'Camille Model House, Block 10 Lot 1', 'B10 L1', 3610000.00, 'Sunrise Meadows, Brgy. San Isidro, Sample City', '2026-09-21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_category`
--

CREATE TABLE `property_category` (
  `category_id` int(11) NOT NULL COMMENT 'Unique identifier of the category.',
  `category_name` varchar(100) NOT NULL COMMENT 'Name of the category.',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the category.',
  `status` varchar(10) NOT NULL COMMENT 'Category status.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_category`
--

INSERT INTO `property_category` (`category_id`, `category_name`, `description`, `status`) VALUES
(1, 'Sales Booking', 'Property offered for sale.', 'Active'),
(2, 'Rental', 'Property offered for rent.', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `property_type`
--

CREATE TABLE `property_type` (
  `property_type_id` int(11) NOT NULL COMMENT 'Unique identifier of the property type.',
  `type_name` varchar(100) NOT NULL COMMENT 'Name of the type (e.g., House, Lot, Condominium, Building).',
  `status` varchar(10) NOT NULL COMMENT 'Property type status.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_type`
--

INSERT INTO `property_type` (`property_type_id`, `type_name`, `status`) VALUES
(1, 'House', 'Active'),
(2, 'Lot', 'Active'),
(3, 'Condominium', 'Active'),
(4, 'Building', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `ranking_period`
--

CREATE TABLE `ranking_period` (
  `ranking_period_id` int(11) NOT NULL COMMENT 'Unique identifier of the ranking period.',
  `period_type` varchar(10) NOT NULL COMMENT 'Kind of ranking period.',
  `period_start` date NOT NULL COMMENT 'First day of the period.',
  `period_end` date NOT NULL COMMENT 'Last day of the period.',
  `generated_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Date and time the ranking was generated.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ranking_period`
--

INSERT INTO `ranking_period` (`ranking_period_id`, `period_type`, `period_start`, `period_end`, `generated_date`) VALUES
(1, 'Monthly', '2026-07-01', '2026-07-31', '2026-08-01 08:00:00'),
(2, 'Monthly', '2026-08-01', '2026-08-31', '2026-09-01 08:00:00'),
(3, 'Monthly', '2026-09-01', '2026-09-30', '2026-10-01 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL COMMENT 'Unique identifier of the role.',
  `role_name` varchar(100) NOT NULL COMMENT 'Name of the role (e.g., Admin, Agent, Accounting Officer).',
  `description` varchar(255) DEFAULT NULL COMMENT 'What the role is for and what it can access.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `description`) VALUES
(1, 'Admin', 'Broker and system administrator'),
(2, 'Agent', 'Sales agent'),
(3, 'Accounting Officer', 'Handles collections and commission vouchers');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `sale_id` int(11) NOT NULL COMMENT 'Unique identifier of the sale.',
  `sale_no` varchar(20) NOT NULL COMMENT 'Sale reference number.',
  `property_id` int(11) NOT NULL COMMENT 'Property sold or reserved.',
  `agent_id` int(11) NOT NULL COMMENT 'Agent who facilitated the sale.',
  `buyer_id` int(11) NOT NULL COMMENT 'Buyer of the property.',
  `status` varchar(15) NOT NULL COMMENT 'Sale status: Pending, Approved, Disapproved or Cancelled.',
  `contract_type` varchar(25) DEFAULT NULL COMMENT 'Contract used: Deed of Absolute Sale (full payment), Contract to Sell (installment) or Lease Contract (rental). Blank until decided.',
  `rate_id` int(11) NOT NULL COMMENT 'Commission rate that applied to the sale.',
  `user_id` int(11) NOT NULL COMMENT 'User who encoded the sale.',
  `total_contract_price` decimal(11,2) NOT NULL COMMENT 'Total contract price of the property. For rentals, the total rent over the lease term.',
  `monthly_rent` decimal(11,2) DEFAULT NULL COMMENT 'Monthly rent, for rentals. Blank for sales.',
  `lease_term_months` int(11) DEFAULT NULL COMMENT 'Length of the lease in months, for rentals. Blank for sales.',
  `commission_amount` decimal(11,2) NOT NULL COMMENT 'Total commission earned on the sale. For rentals, based on one month''s rent.',
  `reservation_fee` decimal(11,2) NOT NULL COMMENT 'Reservation fee paid by the buyer.',
  `reservation_date` date NOT NULL COMMENT 'Date the property was reserved.',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'Additional notes on the sale.',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Date and time the sale record was created.',
  `active_property_id` int(11) GENERATED ALWAYS AS (if(`status` in ('Pending','Approved'),`property_id`,NULL)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`sale_id`, `sale_no`, `property_id`, `agent_id`, `buyer_id`, `status`, `contract_type`, `rate_id`, `user_id`, `total_contract_price`, `monthly_rent`, `lease_term_months`, `commission_amount`, `reservation_fee`, `reservation_date`, `remarks`, `created_at`) VALUES
(1, 'SL-2026-0001', 1, 5, 6, 'Approved', 'Contract to Sell', 7, 3, 3350000.00, NULL, NULL, 150750.00, 20000.00, '2026-06-04', NULL, '2026-06-04 10:41:48'),
(2, 'SL-2026-0002', 2, 7, 50, 'Approved', 'Lease Contract', 6, 1, 846000.00, 23500.00, 36, 23500.00, 23500.00, '2026-06-07', '12-month lease with 2 months advance', '2026-06-07 17:11:43'),
(3, 'SL-2026-0003', 3, 1, 39, 'Approved', 'Contract to Sell', 5, 3, 34800000.00, NULL, NULL, 1740000.00, 100000.00, '2026-06-13', 'Pag-IBIG financing', '2026-06-13 12:43:40'),
(4, 'SL-2026-0004', 4, 9, 15, 'Approved', 'Contract to Sell', 2, 1, 5230000.00, NULL, NULL, 287650.00, 30000.00, '2026-06-25', 'Pag-IBIG financing', '2026-06-25 17:02:22'),
(5, 'SL-2026-0005', 5, 1, 10, 'Approved', 'Deed of Absolute Sale', 3, 1, 4530000.00, NULL, NULL, 181200.00, 25000.00, '2026-06-29', 'Cash purchase', '2026-06-29 13:59:46'),
(6, 'SL-2026-0006', 6, 8, 3, 'Approved', 'Contract to Sell', 7, 3, 2810000.00, NULL, NULL, 126450.00, 15000.00, '2026-07-12', NULL, '2026-07-12 10:38:59'),
(7, 'SL-2026-0007', 7, 2, 42, 'Approved', 'Contract to Sell', 7, 1, 4730000.00, NULL, NULL, 212850.00, 30000.00, '2026-07-13', 'In-house financing', '2026-07-13 16:08:03'),
(8, 'SL-2026-0008', 8, 1, 36, 'Approved', 'Contract to Sell', 4, 3, 36850000.00, NULL, NULL, 1105500.00, 100000.00, '2026-07-17', 'In-house financing', '2026-07-17 09:41:34'),
(9, 'SL-2026-0009', 9, 9, 12, 'Approved', 'Lease Contract', 6, 3, 534000.00, 44500.00, 12, 44500.00, 44500.00, '2026-07-18', NULL, '2026-07-18 11:30:53'),
(10, 'SL-2026-0010', 10, 10, 11, 'Approved', 'Contract to Sell', 3, 3, 3310000.00, NULL, NULL, 132400.00, 20000.00, '2026-07-19', 'Pag-IBIG financing', '2026-07-19 12:18:42'),
(11, 'SL-2026-0011', 11, 5, 13, 'Approved', 'Deed of Absolute Sale', 4, 3, 7250000.00, NULL, NULL, 217500.00, 45000.00, '2026-07-20', 'Cash purchase', '2026-07-20 08:06:30'),
(12, 'SL-2026-0012', 12, 8, 26, 'Approved', 'Contract to Sell', 7, 3, 3400000.00, NULL, NULL, 153000.00, 20000.00, '2026-07-20', 'Bank financing', '2026-07-20 12:50:36'),
(13, 'SL-2026-0013', 13, 1, 33, 'Cancelled', NULL, 2, 3, 3490000.00, NULL, NULL, 191950.00, 20000.00, '2026-07-24', 'Buyer withdrew reservation', '2026-07-24 13:27:56'),
(14, 'SL-2026-0014', 14, 8, 16, 'Approved', 'Deed of Absolute Sale', 2, 1, 1400000.00, NULL, NULL, 77000.00, 10000.00, '2026-07-26', 'Cash purchase', '2026-07-26 11:40:39'),
(15, 'SL-2026-0015', 15, 1, 21, 'Cancelled', NULL, 6, 3, 1212000.00, 50500.00, 24, 50500.00, 50500.00, '2026-08-02', 'Buyer withdrew reservation', '2026-08-02 15:57:13'),
(16, 'SL-2026-0016', 16, 6, 51, 'Approved', 'Contract to Sell', 4, 3, 19800000.00, NULL, NULL, 594000.00, 100000.00, '2026-08-04', NULL, '2026-08-04 11:27:28'),
(17, 'SL-2026-0017', 17, 8, 30, 'Approved', 'Contract to Sell', 2, 3, 2980000.00, NULL, NULL, 163900.00, 20000.00, '2026-08-04', NULL, '2026-08-04 09:11:29'),
(18, 'SL-2026-0018', 18, 1, 2, 'Disapproved', NULL, 2, 1, 5600000.00, NULL, NULL, 308000.00, 35000.00, '2026-08-06', 'Buyer did not pass credit evaluation', '2026-08-06 11:34:44'),
(19, 'SL-2026-0019', 19, 1, 37, 'Approved', 'Lease Contract', 6, 3, 408000.00, 34000.00, 12, 34000.00, 34000.00, '2026-08-07', 'Lease with 1 month deposit', '2026-08-07 11:50:02'),
(20, 'SL-2026-0020', 20, 1, 25, 'Approved', 'Contract to Sell', 2, 1, 3700000.00, NULL, NULL, 203500.00, 20000.00, '2026-08-08', 'Bank financing', '2026-08-08 16:06:41'),
(21, 'SL-2026-0021', 21, 5, 46, 'Approved', 'Contract to Sell', 5, 3, 26250000.00, NULL, NULL, 1312500.00, 100000.00, '2026-08-09', 'Bank financing', '2026-08-09 15:32:51'),
(22, 'SL-2026-0022', 22, 5, 28, 'Disapproved', NULL, 6, 3, 300000.00, 25000.00, 12, 25000.00, 25000.00, '2026-08-09', 'Incomplete requirements', '2026-08-09 17:05:46'),
(23, 'SL-2026-0023', 23, 8, 24, 'Approved', 'Lease Contract', 6, 3, 1428000.00, 59500.00, 24, 59500.00, 59500.00, '2026-08-13', NULL, '2026-08-13 11:34:27'),
(24, 'SL-2026-0024', 24, 7, 5, 'Approved', 'Contract to Sell', 2, 3, 5160000.00, NULL, NULL, 283800.00, 30000.00, '2026-08-18', 'Bank financing', '2026-08-18 14:24:26'),
(25, 'SL-2026-0025', 25, 5, 44, 'Approved', 'Contract to Sell', 2, 1, 3530000.00, NULL, NULL, 194150.00, 20000.00, '2026-08-21', NULL, '2026-08-21 14:22:47'),
(26, 'SL-2026-0026', 26, 7, 31, 'Cancelled', NULL, 6, 3, 396000.00, 66000.00, 6, 66000.00, 66000.00, '2026-08-27', 'Financing not approved', '2026-08-27 13:48:28'),
(27, 'SL-2026-0027', 27, 6, 38, 'Approved', 'Lease Contract', 6, 3, 8040000.00, 670000.00, 12, 670000.00, 670000.00, '2026-08-29', '12-month lease with 2 months advance', '2026-08-29 11:52:24'),
(28, 'SL-2026-0028', 28, 5, 53, 'Approved', 'Contract to Sell', 5, 3, 2050000.00, NULL, NULL, 102500.00, 10000.00, '2026-08-30', NULL, '2026-08-30 10:42:42'),
(29, 'SL-2026-0029', 29, 1, 9, 'Cancelled', NULL, 3, 3, 6580000.00, NULL, NULL, 263200.00, 40000.00, '2026-09-06', 'Financing not approved', '2026-09-06 08:29:48'),
(30, 'SL-2026-0030', 30, 9, 52, 'Approved', 'Deed of Absolute Sale', 4, 3, 4070000.00, NULL, NULL, 122100.00, 25000.00, '2026-09-16', 'Cash purchase', '2026-09-16 16:23:12'),
(31, 'SL-2026-0031', 31, 9, 8, 'Cancelled', NULL, 8, 3, 3270000.00, NULL, NULL, 163500.00, 20000.00, '2026-09-16', 'Buyer failed to pay downpayment', '2026-09-16 15:02:37'),
(32, 'SL-2026-0032', 32, 9, 43, 'Approved', 'Deed of Absolute Sale', 2, 1, 5530000.00, NULL, NULL, 304150.00, 35000.00, '2026-09-17', 'Cash purchase', '2026-09-17 08:35:58'),
(33, 'SL-2026-0033', 33, 9, 20, 'Approved', 'Contract to Sell', 2, 3, 3660000.00, NULL, NULL, 201300.00, 20000.00, '2026-09-18', 'In-house financing', '2026-09-18 09:55:38'),
(34, 'SL-2026-0034', 34, 5, 29, 'Pending', NULL, 8, 3, 3140000.00, NULL, NULL, 157000.00, 20000.00, '2026-09-19', 'Awaiting buyer documents', '2026-09-19 16:02:40'),
(35, 'SL-2026-0035', 35, 5, 45, 'Disapproved', NULL, 3, 3, 7420000.00, NULL, NULL, 296800.00, 45000.00, '2026-09-22', 'Incomplete requirements', '2026-09-22 17:09:37'),
(36, 'SL-2026-0036', 36, 1, 4, 'Pending', NULL, 3, 3, 4580000.00, NULL, NULL, 183200.00, 25000.00, '2026-09-23', NULL, '2026-09-23 12:48:25'),
(37, 'SL-2026-0037', 37, 5, 18, 'Disapproved', NULL, 3, 1, 3340000.00, NULL, NULL, 133600.00, 20000.00, '2026-09-25', 'Incomplete requirements', '2026-09-25 12:35:46'),
(38, 'SL-2026-0038', 38, 9, 23, 'Approved', 'Contract to Sell', 8, 3, 2480000.00, NULL, NULL, 124000.00, 15000.00, '2026-09-27', 'Pag-IBIG financing', '2026-09-27 16:04:35'),
(39, 'SL-2026-0039', 39, 5, 1, 'Pending', NULL, 2, 1, 3710000.00, NULL, NULL, 204050.00, 20000.00, '2026-10-01', NULL, '2026-10-01 16:02:45'),
(40, 'SL-2026-0040', 40, 6, 7, 'Approved', 'Contract to Sell', 8, 1, 3150000.00, NULL, NULL, 157500.00, 20000.00, '2026-10-02', 'Bank financing', '2026-10-02 13:29:21'),
(41, 'SL-2026-0041', 41, 6, 47, 'Approved', 'Contract to Sell', 5, 3, 1650000.00, NULL, NULL, 82500.00, 10000.00, '2026-10-04', 'Pag-IBIG financing', '2026-10-04 08:33:12'),
(42, 'SL-2026-0042', 42, 7, 22, 'Pending', NULL, 5, 3, 3590000.00, NULL, NULL, 179500.00, 20000.00, '2026-10-05', 'For bank evaluation', '2026-10-05 17:30:23'),
(43, 'SL-2026-0043', 43, 2, 40, 'Pending', NULL, 3, 3, 6830000.00, NULL, NULL, 273200.00, 40000.00, '2026-10-05', 'For bank evaluation', '2026-10-05 17:36:42'),
(44, 'SL-2026-0044', 44, 5, 14, 'Pending', NULL, 5, 3, 8850000.00, NULL, NULL, 442500.00, 55000.00, '2026-10-06', NULL, '2026-10-06 17:48:02'),
(45, 'SL-2026-0045', 45, 8, 49, 'Cancelled', NULL, 8, 1, 2340000.00, NULL, NULL, 117000.00, 15000.00, '2026-10-06', 'Financing not approved', '2026-10-06 10:24:55'),
(46, 'SL-2026-0046', 46, 5, 41, 'Pending', NULL, 6, 1, 13464000.00, 561000.00, 24, 561000.00, 561000.00, '2026-10-08', NULL, '2026-10-08 11:45:05'),
(47, 'SL-2026-0047', 47, 7, 32, 'Pending', NULL, 6, 3, 1188000.00, 33000.00, 36, 33000.00, 33000.00, '2026-10-09', NULL, '2026-10-09 16:47:36'),
(48, 'SL-2026-0048', 48, 5, 19, 'Cancelled', NULL, 2, 3, 5510000.00, NULL, NULL, 303050.00, 35000.00, '2026-10-11', 'Buyer withdrew reservation', '2026-10-11 17:02:39'),
(49, 'SL-2026-0049', 49, 9, 35, 'Approved', 'Contract to Sell', 2, 3, 5400000.00, NULL, NULL, 297000.00, 30000.00, '2026-10-11', 'Bank financing', '2026-10-11 12:28:31'),
(50, 'SL-2026-0050', 50, 7, 48, 'Pending', NULL, 2, 1, 5240000.00, NULL, NULL, 288200.00, 30000.00, '2026-10-13', 'Awaiting buyer documents', '2026-10-13 16:42:17'),
(51, 'SL-2026-0051', 51, 8, 27, 'Pending', NULL, 6, 1, 120000.00, 20000.00, 6, 20000.00, 20000.00, '2026-10-14', NULL, '2026-10-14 17:32:32'),
(52, 'SL-2026-0052', 52, 8, 17, 'Pending', NULL, 2, 3, 1310000.00, NULL, NULL, 72050.00, 10000.00, '2026-10-15', NULL, '2026-10-15 09:03:00'),
(53, 'SL-2026-0053', 53, 5, 34, 'Pending', NULL, 2, 1, 3610000.00, NULL, NULL, 198550.00, 20000.00, '2026-10-15', 'Awaiting buyer documents', '2026-10-15 11:11:13');

-- --------------------------------------------------------

--
-- Table structure for table `sales_report`
--

CREATE TABLE `sales_report` (
  `report_id` int(11) NOT NULL COMMENT 'Unique identifier of the report.',
  `user_id` int(11) NOT NULL COMMENT 'User who generated the report.',
  `period_start` date NOT NULL COMMENT 'First day covered by the report.',
  `period_end` date NOT NULL COMMENT 'Last day covered by the report.',
  `generated_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Date and time the report was generated.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_report`
--

INSERT INTO `sales_report` (`report_id`, `user_id`, `period_start`, `period_end`, `generated_date`) VALUES
(1, 1, '2026-06-01', '2026-08-31', '2026-09-02 09:00:00'),
(2, 1, '2026-09-01', '2026-09-30', '2026-10-01 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sales_report_detail`
--

CREATE TABLE `sales_report_detail` (
  `report_detail_id` int(11) NOT NULL COMMENT 'Unique identifier of the report line.',
  `report_id` int(11) NOT NULL COMMENT 'Report the line belongs to.',
  `agent_id` int(11) NOT NULL COMMENT 'Agent summarized.',
  `total_sales_value` decimal(11,2) NOT NULL COMMENT 'Agent''s total sales value in the report period.',
  `sale_count` int(11) NOT NULL COMMENT 'Number of sales made by the agent in the report period.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_report_detail`
--

INSERT INTO `sales_report_detail` (`report_detail_id`, `report_id`, `agent_id`, `total_sales_value`, `sale_count`) VALUES
(1, 1, 1, 79880000.00, 4),
(2, 1, 5, 42430000.00, 5),
(3, 1, 6, 19800000.00, 1),
(4, 1, 8, 10590000.00, 4),
(5, 1, 9, 5230000.00, 1),
(6, 2, 9, 15740000.00, 4);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_id` int(11) NOT NULL COMMENT 'Unique identifier of the team.',
  `team_name` varchar(100) NOT NULL COMMENT 'Name of the team.',
  `description` varchar(255) DEFAULT NULL COMMENT 'Notes about the team.',
  `leader_agent_id` int(11) DEFAULT NULL COMMENT 'Agent who leads the team. Blank if no leader is assigned.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `team_name`, `description`, `leader_agent_id`) VALUES
(1, 'Team Alpha', 'Residential sales team', 1),
(2, 'Team Bravo', 'Condominium and commercial sales team', 3),
(3, 'Team Charlie', 'Lot and rental sales team', 8);

-- --------------------------------------------------------

--
-- Table structure for table `team_ranking`
--

CREATE TABLE `team_ranking` (
  `team_ranking_id` int(11) NOT NULL,
  `ranking_period_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `total_sales_amount` decimal(11,2) NOT NULL,
  `rank_position` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_ranking`
--

INSERT INTO `team_ranking` (`team_ranking_id`, `ranking_period_id`, `team_id`, `total_sales_amount`, `rank_position`, `created_at`) VALUES
(1, 1, 1, 48830000.00, 1, '2026-08-01'),
(2, 1, 3, 10920000.00, 2, '2026-08-01'),
(3, 1, 2, 0.00, 3, '2026-08-01'),
(4, 2, 1, 55330000.00, 1, '2026-09-01'),
(5, 2, 2, 5160000.00, 2, '2026-09-01'),
(6, 2, 3, 2980000.00, 3, '2026-09-01'),
(7, 3, 3, 15740000.00, 1, '2026-10-01'),
(8, 3, 1, 0.00, 2, '2026-10-01'),
(9, 3, 2, 0.00, 3, '2026-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `unit_model`
--

CREATE TABLE `unit_model` (
  `model_id` int(11) NOT NULL COMMENT 'Unique identifier of the model.',
  `project_id` int(11) NOT NULL COMMENT 'Project offering the model.',
  `model_name` varchar(100) NOT NULL COMMENT 'Name of the model.',
  `floor_area_sqm` decimal(7,2) NOT NULL COMMENT 'Floor area in square meters.',
  `lot_area_sqm` decimal(7,2) DEFAULT NULL COMMENT 'Lot area in square meters.',
  `bedrooms` int(11) NOT NULL COMMENT 'Number of bedrooms.',
  `bathrooms` int(11) NOT NULL COMMENT 'Number of bathrooms.',
  `floors` int(11) NOT NULL COMMENT 'Number of floors.',
  `parking_slots` int(11) NOT NULL COMMENT 'Number of parking slots.',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the model.',
  `property_type_id` int(11) NOT NULL COMMENT 'Type of property the model is built as.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unit_model`
--

INSERT INTO `unit_model` (`model_id`, `project_id`, `model_name`, `floor_area_sqm`, `lot_area_sqm`, `bedrooms`, `bathrooms`, `floors`, `parking_slots`, `description`, `property_type_id`) VALUES
(1, 1, 'Camille', 52.00, 90.00, 2, 1, 1, 1, 'Single-storey starter home', 1),
(2, 1, 'Bianca', 78.00, 120.00, 3, 2, 2, 1, 'Two-storey family home', 1),
(3, 3, 'Aurora', 45.00, 80.00, 2, 1, 1, 1, 'Compact single-storey home', 1),
(4, 3, 'Celeste', 68.00, 100.00, 3, 2, 2, 1, 'Two-storey family home', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `user_id` int(11) NOT NULL COMMENT 'Unique identifier of the user account.',
  `role_id` int(11) NOT NULL COMMENT 'Role assigned to the account.',
  `username` varchar(30) NOT NULL COMMENT 'Login username.',
  `password` varchar(255) NOT NULL COMMENT 'Hashed login password. The plain password is never stored.',
  `email` varchar(100) NOT NULL COMMENT 'Email address of the account holder.',
  `contact_number` varchar(15) DEFAULT NULL COMMENT 'Mobile or phone number of the account holder.',
  `status` varchar(10) NOT NULL COMMENT 'Account status.',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Date and time the account was created.',
  `first_name` varchar(50) NOT NULL COMMENT 'First name of the account holder.',
  `middle_name` varchar(50) DEFAULT NULL COMMENT 'Middle name of the account holder.',
  `last_name` varchar(50) NOT NULL COMMENT 'Last name of the account holder.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`user_id`, `role_id`, `username`, `password`, `email`, `contact_number`, `status`, `created_at`, `first_name`, `middle_name`, `last_name`) VALUES
(1, 1, 'admin.santos', '$2y$10$SampleHashOnlyNotARealPasswordHash0000000000000000000000', 'roberto.santos@jachomes.example', '09171234567', 'Active', '2026-01-05 09:00:00', 'Roberto', 'Mercado', 'Santos'),
(2, 3, 'acct.delacruz', '$2y$10$SampleHashOnlyNotARealPasswordHash0000000000000000000000', 'maria.delacruz@jachomes.example', '09179876543', 'Active', '2026-01-05 09:10:00', 'Maria', 'Lopez', 'Dela Cruz'),
(3, 2, 'jose.reyes', '$2y$10$SampleHashOnlyNotARealPasswordHash0000000000000000000000', 'jose.reyes@jachomes.example', '09175551234', 'Active', '2026-01-12 10:30:00', 'Jose', 'Perez', 'Reyes'),
(4, 2, 'ana.garcia', '$2y$10$SampleHashOnlyNotARealPasswordHash0000000000000000000000', 'ana.garcia@jachomes.example', '09176667788', 'Active', '2026-02-01 09:00:00', 'Ana', 'Lim', 'Garcia'),
(5, 2, 'mark.villanueva', '$2y$10$SampleHashOnlyNotARealPasswordHash0000000000000000000000', 'mark.villanueva@jachomes.example', '09178889900', 'Active', '2026-02-15 09:00:00', 'Mark', 'Tan', 'Villanueva'),
(6, 2, 'liza.ocampo', '$2y$10$SampleHashOnlyNotARealPasswordHash0000000000000000000000', 'liza.ocampo@jachomes.example', '09179990011', 'Inactive', '2026-03-10 09:00:00', 'Liza Mae', NULL, 'Ocampo'),
(7, 2, 'carmela.dizon', '$2y$10$SampleHashOnlyNotARealPasswordHash0000000000000000000000', 'carmela.dizon@jachomes.example', '09177763170', 'Active', '2026-03-20 09:57:00', 'Carmela', 'Morales', 'Dizon'),
(8, 2, 'felix.mendoza', '$2y$10$SampleHashOnlyNotARealPasswordHash0000000000000000000000', 'felix.mendoza@jachomes.example', '09500080636', 'Active', '2026-04-05 09:46:00', 'Felix', 'Gonzales', 'Mendoza'),
(9, 2, 'tomas.salvador', '$2y$10$SampleHashOnlyNotARealPasswordHash0000000000000000000000', 'tomas.salvador@jachomes.example', '09068124158', 'Active', '2026-04-20 09:59:00', 'Tomas', NULL, 'Salvador'),
(10, 2, 'wilfredo.panganiban', '$2y$10$SampleHashOnlyNotARealPasswordHash0000000000000000000000', 'wilfredo.panganiban@jachomes.example', '09690736625', 'Active', '2026-05-04 09:35:00', 'Wilfredo', NULL, 'Panganiban'),
(11, 2, 'kevin.maglaya', '$2y$10$SampleHashOnlyNotARealPasswordHash0000000000000000000000', 'kevin.maglaya@jachomes.example', '09657070499', 'Active', '2026-05-18 09:37:00', 'Kevin', 'Ramos', 'Maglaya'),
(12, 2, 'darwin.gonzales', '$2y$10$SampleHashOnlyNotARealPasswordHash0000000000000000000000', 'darwin.gonzales@jachomes.example', '09685957489', 'Active', '2026-05-28 09:46:00', 'Darwin', 'Go', 'Gonzales');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounting_officer`
--
ALTER TABLE `accounting_officer`
  ADD PRIMARY KEY (`accounting_officer_id`),
  ADD UNIQUE KEY `uq_accounting_officer_user_id` (`user_id`),
  ADD UNIQUE KEY `uq_accounting_officer_employee_number` (`employee_number`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `uq_admin_user_id` (`user_id`);

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`agent_id`),
  ADD UNIQUE KEY `uq_agent_user_id` (`user_id`),
  ADD UNIQUE KEY `uq_agent_agent_code` (`agent_code`),
  ADD KEY `fk_agent_team_id` (`team_id`);

--
-- Indexes for table `agent_accreditation`
--
ALTER TABLE `agent_accreditation`
  ADD PRIMARY KEY (`accreditation_id`),
  ADD KEY `fk_agent_accreditation_agent_id` (`agent_id`);

--
-- Indexes for table `agent_position`
--
ALTER TABLE `agent_position`
  ADD PRIMARY KEY (`position_id`),
  ADD UNIQUE KEY `uq_agent_position_position_code` (`position_code`);

--
-- Indexes for table `agent_position_history`
--
ALTER TABLE `agent_position_history`
  ADD PRIMARY KEY (`position_history_id`),
  ADD KEY `fk_agent_position_history_agent_id` (`agent_id`),
  ADD KEY `fk_agent_position_history_position_id` (`position_id`),
  ADD KEY `fk_agent_position_history_user_id` (`user_id`);

--
-- Indexes for table `agent_ranking`
--
ALTER TABLE `agent_ranking`
  ADD PRIMARY KEY (`ranking_id`),
  ADD KEY `fk_agent_ranking_ranking_period_id` (`ranking_period_id`),
  ADD KEY `fk_agent_ranking_agent_id` (`agent_id`);

--
-- Indexes for table `building_detail`
--
ALTER TABLE `building_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD UNIQUE KEY `uq_building_detail_property_id` (`property_id`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `commission_collection`
--
ALTER TABLE `commission_collection`
  ADD PRIMARY KEY (`collection_id`),
  ADD UNIQUE KEY `uq_commission_collection_collection_no` (`collection_no`),
  ADD UNIQUE KEY `uq_commission_collection_or_number` (`or_number`),
  ADD KEY `fk_commission_collection_sale_id` (`sale_id`),
  ADD KEY `fk_commission_collection_payment_method_id` (`payment_method_id`),
  ADD KEY `fk_commission_collection_user_id` (`user_id`);

--
-- Indexes for table `commission_rate_history`
--
ALTER TABLE `commission_rate_history`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `fk_commission_rate_history_rule_id` (`rule_id`);

--
-- Indexes for table `commission_rule`
--
ALTER TABLE `commission_rule`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `fk_commission_rule_owner_id` (`owner_id`),
  ADD KEY `fk_commission_rule_project_id` (`project_id`),
  ADD KEY `fk_commission_rule_category_id` (`category_id`);

--
-- Indexes for table `commission_share`
--
ALTER TABLE `commission_share`
  ADD PRIMARY KEY (`share_id`),
  ADD KEY `fk_commission_share_sale_id` (`sale_id`),
  ADD KEY `fk_commission_share_agent_id` (`agent_id`);

--
-- Indexes for table `commission_voucher`
--
ALTER TABLE `commission_voucher`
  ADD PRIMARY KEY (`voucher_id`),
  ADD UNIQUE KEY `uq_commission_voucher_voucher_no` (`voucher_no`),
  ADD KEY `fk_commission_voucher_agent_id` (`agent_id`),
  ADD KEY `fk_commission_voucher_payment_method_id` (`payment_method_id`),
  ADD KEY `fk_commission_voucher_user_id` (`user_id`);

--
-- Indexes for table `commission_voucher_detail`
--
ALTER TABLE `commission_voucher_detail`
  ADD PRIMARY KEY (`voucher_detail_id`),
  ADD KEY `fk_commission_voucher_detail_voucher_id` (`voucher_id`),
  ADD KEY `fk_commission_voucher_detail_collection_id` (`collection_id`),
  ADD KEY `fk_commission_voucher_detail_share_id` (`share_id`);

--
-- Indexes for table `condominium_detail`
--
ALTER TABLE `condominium_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD UNIQUE KEY `uq_condominium_detail_property_id` (`property_id`);

--
-- Indexes for table `house_detail`
--
ALTER TABLE `house_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD UNIQUE KEY `uq_house_detail_property_id` (`property_id`);

--
-- Indexes for table `incentive`
--
ALTER TABLE `incentive`
  ADD PRIMARY KEY (`incentive_id`),
  ADD KEY `fk_incentive_agent_id` (`agent_id`),
  ADD KEY `fk_incentive_sale_id` (`sale_id`),
  ADD KEY `fk_incentive_user_id` (`user_id`);

--
-- Indexes for table `lot_detail`
--
ALTER TABLE `lot_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD UNIQUE KEY `uq_lot_detail_property_id` (`property_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`payment_method_id`),
  ADD UNIQUE KEY `uq_payment_method_method_name` (`method_name`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `fk_project_owner_id` (`owner_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`property_id`),
  ADD KEY `fk_property_owner_id` (`owner_id`),
  ADD KEY `fk_property_project_id` (`project_id`),
  ADD KEY `fk_property_model_id` (`model_id`),
  ADD KEY `fk_property_category_id` (`category_id`),
  ADD KEY `fk_property_property_type_id` (`property_type_id`),
  ADD KEY `fk_property_user_id` (`user_id`),
  ADD KEY `fk_property_agent_id` (`agent_id`);

--
-- Indexes for table `property_category`
--
ALTER TABLE `property_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `uq_property_category_category_name` (`category_name`);

--
-- Indexes for table `property_type`
--
ALTER TABLE `property_type`
  ADD PRIMARY KEY (`property_type_id`),
  ADD UNIQUE KEY `uq_property_type_type_name` (`type_name`);

--
-- Indexes for table `ranking_period`
--
ALTER TABLE `ranking_period`
  ADD PRIMARY KEY (`ranking_period_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `uq_role_role_name` (`role_name`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_id`),
  ADD UNIQUE KEY `uq_sale_sale_no` (`sale_no`),
  ADD UNIQUE KEY `uq_sale_active_property` (`active_property_id`),
  ADD KEY `fk_sale_property_id` (`property_id`),
  ADD KEY `fk_sale_agent_id` (`agent_id`),
  ADD KEY `fk_sale_buyer_id` (`buyer_id`),
  ADD KEY `fk_sale_rate_id` (`rate_id`),
  ADD KEY `fk_sale_user_id` (`user_id`);

--
-- Indexes for table `sales_report`
--
ALTER TABLE `sales_report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `fk_sales_report_user_id` (`user_id`);

--
-- Indexes for table `sales_report_detail`
--
ALTER TABLE `sales_report_detail`
  ADD PRIMARY KEY (`report_detail_id`),
  ADD KEY `fk_sales_report_detail_report_id` (`report_id`),
  ADD KEY `fk_sales_report_detail_agent_id` (`agent_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `uq_team_team_name` (`team_name`),
  ADD KEY `fk_team_leader_agent_id` (`leader_agent_id`);

--
-- Indexes for table `team_ranking`
--
ALTER TABLE `team_ranking`
  ADD PRIMARY KEY (`team_ranking_id`),
  ADD UNIQUE KEY `uq_team_period` (`ranking_period_id`,`team_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `unit_model`
--
ALTER TABLE `unit_model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `fk_unit_model_project_id` (`project_id`),
  ADD KEY `fk_unit_model_property_type_id` (`property_type_id`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uq_user_account_username` (`username`),
  ADD UNIQUE KEY `uq_user_account_email` (`email`),
  ADD KEY `fk_user_account_role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounting_officer`
--
ALTER TABLE `accounting_officer`
  MODIFY `accounting_officer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the accounting officer profile.', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the admin profile.', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `agent_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the agent.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `agent_accreditation`
--
ALTER TABLE `agent_accreditation`
  MODIFY `accreditation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the accreditation record.', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `agent_position`
--
ALTER TABLE `agent_position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the agent position.', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `agent_position_history`
--
ALTER TABLE `agent_position_history`
  MODIFY `position_history_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the history record.', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `agent_ranking`
--
ALTER TABLE `agent_ranking`
  MODIFY `ranking_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the ranking record.', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `building_detail`
--
ALTER TABLE `building_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the detail record.', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `buyer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the buyer.', AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `commission_collection`
--
ALTER TABLE `commission_collection`
  MODIFY `collection_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the collection.', AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `commission_rate_history`
--
ALTER TABLE `commission_rate_history`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the rate record.', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `commission_rule`
--
ALTER TABLE `commission_rule`
  MODIFY `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the rule.', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `commission_share`
--
ALTER TABLE `commission_share`
  MODIFY `share_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the share.', AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `commission_voucher`
--
ALTER TABLE `commission_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the voucher.', AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `commission_voucher_detail`
--
ALTER TABLE `commission_voucher_detail`
  MODIFY `voucher_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the voucher line.', AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `condominium_detail`
--
ALTER TABLE `condominium_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the detail record.', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `house_detail`
--
ALTER TABLE `house_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the detail record.', AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `incentive`
--
ALTER TABLE `incentive`
  MODIFY `incentive_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the incentive.', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lot_detail`
--
ALTER TABLE `lot_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the detail record.', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `owner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the owner.', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the payment method.', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the project.', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the property.', AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `property_category`
--
ALTER TABLE `property_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the category.', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `property_type`
--
ALTER TABLE `property_type`
  MODIFY `property_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the property type.', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ranking_period`
--
ALTER TABLE `ranking_period`
  MODIFY `ranking_period_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the ranking period.', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the role.', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the sale.', AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `sales_report`
--
ALTER TABLE `sales_report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the report.', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_report_detail`
--
ALTER TABLE `sales_report_detail`
  MODIFY `report_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the report line.', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the team.', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `team_ranking`
--
ALTER TABLE `team_ranking`
  MODIFY `team_ranking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `unit_model`
--
ALTER TABLE `unit_model`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the model.', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the user account.', AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounting_officer`
--
ALTER TABLE `accounting_officer`
  ADD CONSTRAINT `fk_accounting_officer_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- Constraints for table `agent`
--
ALTER TABLE `agent`
  ADD CONSTRAINT `fk_agent_team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  ADD CONSTRAINT `fk_agent_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- Constraints for table `agent_accreditation`
--
ALTER TABLE `agent_accreditation`
  ADD CONSTRAINT `fk_agent_accreditation_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`);

--
-- Constraints for table `agent_position_history`
--
ALTER TABLE `agent_position_history`
  ADD CONSTRAINT `fk_agent_position_history_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  ADD CONSTRAINT `fk_agent_position_history_position_id` FOREIGN KEY (`position_id`) REFERENCES `agent_position` (`position_id`),
  ADD CONSTRAINT `fk_agent_position_history_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- Constraints for table `agent_ranking`
--
ALTER TABLE `agent_ranking`
  ADD CONSTRAINT `fk_agent_ranking_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  ADD CONSTRAINT `fk_agent_ranking_ranking_period_id` FOREIGN KEY (`ranking_period_id`) REFERENCES `ranking_period` (`ranking_period_id`);

--
-- Constraints for table `building_detail`
--
ALTER TABLE `building_detail`
  ADD CONSTRAINT `fk_building_detail_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `commission_collection`
--
ALTER TABLE `commission_collection`
  ADD CONSTRAINT `fk_commission_collection_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`),
  ADD CONSTRAINT `fk_commission_collection_sale_id` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`sale_id`),
  ADD CONSTRAINT `fk_commission_collection_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- Constraints for table `commission_rate_history`
--
ALTER TABLE `commission_rate_history`
  ADD CONSTRAINT `fk_commission_rate_history_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `commission_rule` (`rule_id`);

--
-- Constraints for table `commission_rule`
--
ALTER TABLE `commission_rule`
  ADD CONSTRAINT `fk_commission_rule_category_id` FOREIGN KEY (`category_id`) REFERENCES `property_category` (`category_id`),
  ADD CONSTRAINT `fk_commission_rule_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`),
  ADD CONSTRAINT `fk_commission_rule_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`);

--
-- Constraints for table `commission_share`
--
ALTER TABLE `commission_share`
  ADD CONSTRAINT `fk_commission_share_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  ADD CONSTRAINT `fk_commission_share_sale_id` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`sale_id`);

--
-- Constraints for table `commission_voucher`
--
ALTER TABLE `commission_voucher`
  ADD CONSTRAINT `fk_commission_voucher_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  ADD CONSTRAINT `fk_commission_voucher_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`),
  ADD CONSTRAINT `fk_commission_voucher_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- Constraints for table `commission_voucher_detail`
--
ALTER TABLE `commission_voucher_detail`
  ADD CONSTRAINT `fk_commission_voucher_detail_collection_id` FOREIGN KEY (`collection_id`) REFERENCES `commission_collection` (`collection_id`),
  ADD CONSTRAINT `fk_commission_voucher_detail_share_id` FOREIGN KEY (`share_id`) REFERENCES `commission_share` (`share_id`),
  ADD CONSTRAINT `fk_commission_voucher_detail_voucher_id` FOREIGN KEY (`voucher_id`) REFERENCES `commission_voucher` (`voucher_id`);

--
-- Constraints for table `condominium_detail`
--
ALTER TABLE `condominium_detail`
  ADD CONSTRAINT `fk_condominium_detail_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `house_detail`
--
ALTER TABLE `house_detail`
  ADD CONSTRAINT `fk_house_detail_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `incentive`
--
ALTER TABLE `incentive`
  ADD CONSTRAINT `fk_incentive_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  ADD CONSTRAINT `fk_incentive_sale_id` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`sale_id`),
  ADD CONSTRAINT `fk_incentive_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- Constraints for table `lot_detail`
--
ALTER TABLE `lot_detail`
  ADD CONSTRAINT `fk_lot_detail_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `fk_project_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`);

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `fk_property_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  ADD CONSTRAINT `fk_property_category_id` FOREIGN KEY (`category_id`) REFERENCES `property_category` (`category_id`),
  ADD CONSTRAINT `fk_property_model_id` FOREIGN KEY (`model_id`) REFERENCES `unit_model` (`model_id`),
  ADD CONSTRAINT `fk_property_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`),
  ADD CONSTRAINT `fk_property_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  ADD CONSTRAINT `fk_property_property_type_id` FOREIGN KEY (`property_type_id`) REFERENCES `property_type` (`property_type_id`),
  ADD CONSTRAINT `fk_property_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `fk_sale_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  ADD CONSTRAINT `fk_sale_buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`),
  ADD CONSTRAINT `fk_sale_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`),
  ADD CONSTRAINT `fk_sale_rate_id` FOREIGN KEY (`rate_id`) REFERENCES `commission_rate_history` (`rate_id`),
  ADD CONSTRAINT `fk_sale_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- Constraints for table `sales_report`
--
ALTER TABLE `sales_report`
  ADD CONSTRAINT `fk_sales_report_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);

--
-- Constraints for table `sales_report_detail`
--
ALTER TABLE `sales_report_detail`
  ADD CONSTRAINT `fk_sales_report_detail_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  ADD CONSTRAINT `fk_sales_report_detail_report_id` FOREIGN KEY (`report_id`) REFERENCES `sales_report` (`report_id`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `fk_team_leader_agent_id` FOREIGN KEY (`leader_agent_id`) REFERENCES `agent` (`agent_id`);

--
-- Constraints for table `team_ranking`
--
ALTER TABLE `team_ranking`
  ADD CONSTRAINT `team_ranking_ibfk_1` FOREIGN KEY (`ranking_period_id`) REFERENCES `ranking_period` (`ranking_period_id`),
  ADD CONSTRAINT `team_ranking_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`);

--
-- Constraints for table `unit_model`
--
ALTER TABLE `unit_model`
  ADD CONSTRAINT `fk_unit_model_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  ADD CONSTRAINT `fk_unit_model_property_type_id` FOREIGN KEY (`property_type_id`) REFERENCES `property_type` (`property_type_id`);

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `fk_user_account_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
