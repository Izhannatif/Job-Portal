-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 12, 2022 at 02:47 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_company`
--

CREATE TABLE `accounts_company` (
  `id` bigint(20) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `companyName` varchar(50) DEFAULT NULL,
  `contactNo` bigint(20) DEFAULT NULL,
  `companyAddress` varchar(255) NOT NULL,
  `companyInfo` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `usertype` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_company`
--

INSERT INTO `accounts_company` (`id`, `username`, `password`, `email`, `companyName`, `contactNo`, `companyAddress`, `companyInfo`, `status`, `usertype`, `user_id`) VALUES
(2, 'baxapowape', '1234', 'mejawewogy@mailinator.com', 'Garner Walter Traders', 31, 'Sit officiis minim v', 'Richard and Christensen Inc', 'Verified', 'Company', 20);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_employee`
--

CREATE TABLE `accounts_employee` (
  `id` bigint(20) NOT NULL,
  `usertype` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `fname` varchar(10) NOT NULL,
  `lname` varchar(10) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phoneNo` bigint(20) DEFAULT NULL,
  `Degree` varchar(20) NOT NULL,
  `Majors` varchar(20) NOT NULL,
  `yearOfGraduation` date DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_employee`
--

INSERT INTO `accounts_employee` (`id`, `usertype`, `username`, `password`, `fname`, `lname`, `age`, `gender`, `address`, `phoneNo`, `Degree`, `Majors`, `yearOfGraduation`, `skills`, `user_id`, `email`) VALUES
(1, 'Employee', 'fuqed', '1234', 'Germane', 'Sellers', 51, 'male', 'Deserunt ea non Nam ', NULL, 'In iste vel rem exce', 'Sed aliqua Autem do', '2022-05-30', 'Fugiat animi qui pr', 3, 'hoherige@mailinator.com'),
(2, 'Employee', 'roxuqyhi', '1234', 'Branden', 'Booker', 84, 'Emale', 'Voluptate quia dolor', 132, 'Ipsum quo eum est n', 'Voluptatem enim earu', '2004-07-06', 'Quibusdam voluptatem', 4, 'senizora@mailinator.com'),
(3, 'Employee', 'mamixexeq', '1234', 'Andrew', 'Johnston', 7, 'Emale', 'Maxime voluptatem Q', 836, 'Quis laudantium sin', 'Ut earum ab est sapi', '1986-11-07', 'Eos ullamco aut cons', 5, 'remoro@mailinator.com'),
(4, 'Employee', 'xezebab', '1234', 'Christine', 'Quinn', 89, 'male', 'Mollit nulla maxime ', NULL, 'Molestiae rem ea sin', 'In quo vero incididu', '2022-06-23', 'Sit eaque est omnis', 6, 'qypug@mailinator.com'),
(5, 'Employee', 'izhan', '1234', 'Gary', 'Stevenson', 62, 'male', '+1 (573) 794-1981', NULL, 'Lynn', 'Mosley', '2020-09-23', 'Nostrud itaque susci', 7, 'hazezujeqe@mailinator.com'),
(6, 'Employee', 'sofujykeby', '1234', 'Daphne', 'Pollard', 16, 'female', 'Morin Nelson Traders', 786, 'Alford Espinoz', 'Duncan Wells Plc', '2012-02-25', 'Rosario and Hammond LLC', 11, 'puvev@mailinator.com'),
(7, 'Employee', 'myweh', '1234', 'Nolan', 'Horne', 44, 'female', 'Dickerson Whitney Plc', 144, 'Farley and Joyce ', 'Montgomery and ', '2009-03-27', 'Crawford Hardy Co', 22, 'havonejis@mailinator.com');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_jobapplication`
--

CREATE TABLE `accounts_jobapplication` (
  `id` bigint(20) NOT NULL,
  `company` varchar(200) NOT NULL,
  `resume` varchar(100) NOT NULL,
  `apply_date` date NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `jobData_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_jobapplication`
--

INSERT INTO `accounts_jobapplication` (`id`, `company`, `resume`, `apply_date`, `employee_id`, `jobData_id`) VALUES
(3, 'Garner Walter Traders,baxapowape, Verified', '06F937B1-9803-4956-96C8-1F381BC3299F.JPEG', '2022-06-05', 7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_jobdata`
--

CREATE TABLE `accounts_jobdata` (
  `id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `title` varchar(200) NOT NULL,
  `salary` double NOT NULL,
  `description` longtext NOT NULL,
  `experience` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `skills` varchar(200) NOT NULL,
  `creation_date` date NOT NULL,
  `company_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_jobdata`
--

INSERT INTO `accounts_jobdata` (`id`, `start_date`, `end_date`, `title`, `salary`, `description`, `experience`, `location`, `skills`, `creation_date`, `company_id`) VALUES
(5, '0000-00-00', '1899-12-31', 'Developer', 50000, 'Python, Django', '2', 'Karachi', 'Python', '2022-06-05', 2),
(6, '1972-11-06', '1982-11-16', 'Dolorem exercitation', 999, 'Nam enim temporibus ', 'Rerum voluptatum ame', 'Enim officiis eligen', 'Labore adipisicing m', '2022-06-06', 2),
(7, '1981-02-08', '2006-03-26', 'Ex magna qui dicta o', 696, 'Natus aut est dolore', 'Cillum aliquam aut d', 'Quae cum quam simili', 'Vel eaque sunt dolor', '2022-06-06', 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add employee', 7, 'add_employee'),
(26, 'Can change employee', 7, 'change_employee'),
(27, 'Can delete employee', 7, 'delete_employee'),
(28, 'Can view employee', 7, 'view_employee'),
(29, 'Can add company', 8, 'add_company'),
(30, 'Can change company', 8, 'change_company'),
(31, 'Can delete company', 8, 'delete_company'),
(32, 'Can view company', 8, 'view_company'),
(33, 'Can add job data', 9, 'add_jobdata'),
(34, 'Can change job data', 9, 'change_jobdata'),
(35, 'Can delete job data', 9, 'delete_jobdata'),
(36, 'Can view job data', 9, 'view_jobdata'),
(37, 'Can add job application', 10, 'add_jobapplication'),
(38, 'Can change job application', 10, 'change_jobapplication'),
(39, 'Can delete job application', 10, 'delete_jobapplication'),
(40, 'Can view job application', 10, 'view_jobapplication');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$mM2w33WapaAzCYaMqobk5i$6CHo3qE9kbOdrTyOo9Ly3c/IlyX3JQyFpTNSx6nJKyk=', '2022-06-02 08:05:32.188686', 0, 'company', 'Company', '', 'company@company.com', 0, 1, '2022-06-01 19:22:32.885929'),
(2, 'pbkdf2_sha256$320000$kG3aZKpHvVoWGnKRxecUQr$pXBdgpsqqodtxa8NInRcu78tNDyFqWvfRT1C0BBIz7U=', '2022-06-04 22:32:13.412473', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2022-06-01 19:23:03.649711'),
(3, 'pbkdf2_sha256$320000$Tk5wzZViXoLva8rYwi1uSY$Dpb0tNPTxWxoL9f+038PIq8zn6xfal3gKTeguuaQZwM=', '2022-06-05 17:59:05.036060', 0, 'fuqed', 'Izhan', 'Sellers', 'hoherige@mailinator.com', 0, 1, '2022-06-01 20:01:44.896572'),
(4, 'pbkdf2_sha256$320000$k6YJm3CSp8AnBTe2yL43LG$2GK6Il8d87YK130To3MrJWps2vkzyreZkw5ygu8lu8s=', NULL, 0, 'roxuqyhi', 'Branden', 'Booker', 'senizora@mailinator.com', 0, 1, '2022-06-01 20:01:52.527492'),
(5, 'pbkdf2_sha256$320000$EHsOECAyC2x3Dno6K6GJvk$1lCXb64yPJKcKmOMqvXlcw1pHFY50Cbg8egDymWTsiA=', NULL, 0, 'mamixexeq', 'Andrew', 'Johnston', 'remoro@mailinator.com', 0, 1, '2022-06-01 20:01:58.760236'),
(6, '1234', '2022-06-02 22:44:03.537094', 0, 'xezebab', 'Izhan', 'Quinn', 'qypug@mailinator.com', 0, 1, '2022-06-01 20:02:05.690735'),
(7, '1234', '2022-06-02 22:20:27.743013', 0, 'izhan', 'Indira', 'Waller', 'xicemimive@mailinator.com', 0, 1, '2022-06-01 22:13:17.732944'),
(8, 'pbkdf2_sha256$320000$PNWSMH0pNcWlCHZ5RnkIXt$6v6tp3VZN5bOrS561Pr8M/34YMNpGbntiNlw8xCwYJk=', NULL, 0, 'Sarim', 'Sarim', 'Khan', 'pegamoxa@mailinator.com', 0, 1, '2022-06-02 21:58:27.646799'),
(9, 'pbkdf2_sha256$320000$lhFkt2K1EReGQ6ekvLEOyx$/a0rdbc9BKOIVJdcXwQnLj003m30x+2T/tnvhTh7Avo=', NULL, 0, 'hejehecof', 'Ivana', 'Johns', 'dovywuk@mailinator.com', 0, 1, '2022-06-02 22:12:52.357260'),
(10, 'pbkdf2_sha256$320000$sW4onTt1KqQgXgUwmk09VQ$zjVkPZNDGRZx+zl8mA7KtUtqigGS0XKO1y68fsBNzI4=', NULL, 0, 'rebiq', 'Quintessa', 'Anthony', 'hyjelute@mailinator.com', 0, 1, '2022-06-02 22:15:48.778694'),
(11, 'pbkdf2_sha256$320000$uoslFxCCCTu8JasnDdxpZx$rjjXSg0JpDi9REe8mmUEboZOXG8cUAnRdIqpX8/Ydys=', NULL, 0, 'sofujykeby', 'Daphne', 'Pollard', 'puvev@mailinator.com', 0, 1, '2022-06-02 22:18:14.527667'),
(16, 'pbkdf2_sha256$320000$m7fbrs5O2pdFX90lYjxfxu$CZPI7TjTCB1nk/esF3H1Kx8zfo7IMBB6FbtG9S3TJTE=', NULL, 0, 'poop', 'Valentine and Leonard Trading', '', 'qegyz@mailinator.com', 0, 1, '2022-06-04 22:29:56.884326'),
(18, 'pbkdf2_sha256$320000$S4JgPjZwZVGU5RoNTq4qnL$qSzy2XtecJeNKfAIQSf8ohLxLrpb10GCyyWhfCV3lRA=', NULL, 0, 'pooop', 'Valentine and Leonard Trading', '', 'qegyz@mailinator.com', 0, 1, '2022-06-04 22:30:15.808678'),
(19, 'pbkdf2_sha256$320000$wcltk3fTLABbxVJrEaE7nL$AS9ubQVEZ4/BrzoKEygq2t+1qdIWFgSriZO+hXxXJG4=', NULL, 0, 'company2', 'Valentine and Leonard Trading', '', 'qegyz@mailinator.com', 0, 1, '2022-06-04 22:30:44.479607'),
(20, 'pbkdf2_sha256$320000$aSfmgLTCbadSA0415ZDdMY$fsomqZIWGuB4ASedU5P0PC2AG3CKxzNuhCZhbjGiUsI=', '2022-06-05 23:48:36.169200', 0, 'baxapowape', 'Garner Walter Traders', '', 'mejawewogy@mailinator.com', 0, 1, '2022-06-04 22:31:50.526927'),
(21, 'pbkdf2_sha256$320000$e5csY6d6Yp2FzLdxi6mial$lElw0SntQDSz3Utrga0xzKICFiUJwpDcWEfjl3f8yKo=', NULL, 0, 'sinorijof', 'Aphrodite', 'Duran', 'mibahu@mailinator.com', 0, 1, '2022-06-04 22:35:56.991801'),
(22, 'pbkdf2_sha256$320000$0M8oyVtCmunEMmSFkJo1qk$Sc5H9qFmoKqJGu5Q9oKhn8JtvV+RVbxVdTHsPyplA6E=', '2022-06-04 22:36:34.426435', 0, 'myweh', 'Nolan', 'Horne', 'havonejis@mailinator.com', 0, 1, '2022-06-04 22:36:23.762149');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-06-01 19:23:22.646778', '1', 'Company,company, Verified', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 8, 2),
(2, '2022-06-04 22:33:07.383020', '2', 'Garner Walter Traders,baxapowape, Verified', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'accounts', 'company'),
(7, 'accounts', 'employee'),
(10, 'accounts', 'jobapplication'),
(9, 'accounts', 'jobdata'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-20 11:12:04.096386'),
(2, 'auth', '0001_initial', '2022-05-20 11:12:04.816020'),
(3, 'admin', '0001_initial', '2022-05-20 11:12:05.015747'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-20 11:12:05.029437'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-20 11:12:05.045428'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-20 11:12:05.155811'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-20 11:12:05.236231'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-20 11:12:05.273185'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-20 11:12:05.291189'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-20 11:12:05.458819'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-20 11:12:05.463615'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-20 11:12:05.482605'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-20 11:12:05.509585'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-20 11:12:05.541585'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-20 11:12:05.573501'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-20 11:12:05.594489'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-20 11:12:05.632481'),
(18, 'sessions', '0001_initial', '2022-05-20 11:12:05.693432'),
(20, 'accounts', '0002_wanguser', '2022-05-20 15:44:18.759425'),
(21, 'accounts', '0003_companyregistration_employeeregisteration_and_more', '2022-05-23 09:39:38.404200'),
(22, 'accounts', '0004_alter_employeeregisteration_age', '2022-05-24 07:48:31.623270'),
(23, 'accounts', '0005_alter_employeeregisteration_phoneno', '2022-05-24 07:49:17.124711'),
(24, 'accounts', '0006_alter_employeeregisteration_yearofgraduation', '2022-05-24 07:49:58.657381'),
(25, 'accounts', '0007_rename_fname_employeeregisteration_fname_and_more', '2022-05-24 08:04:46.494091'),
(26, 'accounts', '0008_alter_employeeregisteration_skills', '2022-05-24 08:09:27.553124'),
(27, 'accounts', '0009_alter_companyregistration_companyaddress_and_more', '2022-05-24 20:14:48.222668'),
(28, 'accounts', '0010_remove_employeeregisteration_email_and_more', '2022-05-27 14:10:05.394681'),
(29, 'accounts', '0011_rename_type_employee_usertype', '2022-05-27 14:57:42.053325'),
(30, 'accounts', '0012_employee_password_employee_username', '2022-05-27 17:29:51.072637'),
(31, 'accounts', '0013_company', '2022-05-28 08:57:54.247646'),
(32, 'accounts', '0014_alter_company_companyname_alter_company_email', '2022-05-28 09:44:02.600596'),
(33, 'accounts', '0015_jobdata', '2022-05-28 09:52:26.657986'),
(34, 'accounts', '0001_initial', '2022-05-29 18:27:00.842695'),
(35, 'accounts', '0002_alter_company_status', '2022-05-29 21:19:03.882896'),
(36, 'accounts', '0003_alter_jobapplication_resume', '2022-05-30 09:02:52.258064'),
(37, 'accounts', '0004_employee_email', '2022-05-31 22:26:27.690034'),
(38, 'accounts', '0005_alter_company_companyname', '2022-06-01 13:33:04.892070');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('fgmgu5euf7q4922cmvstsowepy7zuzgs', '.eJxVjDsOwjAQRO_iGln-xmtKes5grb0LDiBHipMKcXcSKQV0o3lv5i0SrktNa-c5jSTOwihx-i0zlie3ndAD232SZWrLPGa5K_KgXV4n4tflcP8OKva6rVE7HXIMtwxOWQhkvEXj2bJSXKwnMwDqLYMDkx2XggN6AzFyIc4sPl_v6Dgq:1nxzz2:FY-NxrPxJl9fBPVsqiu4g1sT5Ll8XDZuriBIo8yDy_Y', '2022-06-19 23:48:36.172479');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_company`
--
ALTER TABLE `accounts_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `accounts_company_user_id_27c0a1d7_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `accounts_employee`
--
ALTER TABLE `accounts_employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `accounts_employee_user_id_593173d8_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `accounts_jobapplication`
--
ALTER TABLE `accounts_jobapplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_jobapplicat_employee_id_c2493e09_fk_accounts_` (`employee_id`),
  ADD KEY `accounts_jobapplicat_jobData_id_4d762c63_fk_accounts_` (`jobData_id`);

--
-- Indexes for table `accounts_jobdata`
--
ALTER TABLE `accounts_jobdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_jobdata_company_id_1224d42e_fk_accounts_company_id` (`company_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_company`
--
ALTER TABLE `accounts_company`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `accounts_employee`
--
ALTER TABLE `accounts_employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `accounts_jobapplication`
--
ALTER TABLE `accounts_jobapplication`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `accounts_jobdata`
--
ALTER TABLE `accounts_jobdata`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_company`
--
ALTER TABLE `accounts_company`
  ADD CONSTRAINT `accounts_company_user_id_27c0a1d7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_employee`
--
ALTER TABLE `accounts_employee`
  ADD CONSTRAINT `accounts_employee_user_id_593173d8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_jobapplication`
--
ALTER TABLE `accounts_jobapplication`
  ADD CONSTRAINT `accounts_jobapplicat_employee_id_c2493e09_fk_accounts_` FOREIGN KEY (`employee_id`) REFERENCES `accounts_employee` (`id`),
  ADD CONSTRAINT `accounts_jobapplicat_jobData_id_4d762c63_fk_accounts_` FOREIGN KEY (`jobData_id`) REFERENCES `accounts_jobdata` (`id`);

--
-- Constraints for table `accounts_jobdata`
--
ALTER TABLE `accounts_jobdata`
  ADD CONSTRAINT `accounts_jobdata_company_id_1224d42e_fk_accounts_company_id` FOREIGN KEY (`company_id`) REFERENCES `accounts_company` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
