-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 21, 2024 at 01:23 AM
-- Server version: 10.11.7-MariaDB-2ubuntu2
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ilcis`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_appointments`
--

CREATE TABLE `tbl_appointments` (
  `appointment_id` int(11) NOT NULL,
  `appointment_contact_person` varchar(256) NOT NULL,
  `appointment_position` varchar(256) NOT NULL,
  `appointment_company_name` varchar(256) NOT NULL,
  `appointment_company_address` text NOT NULL,
  `appointment_phone_number` varchar(200) NOT NULL,
  `appointment_email` varchar(256) NOT NULL,
  `appointment_status` enum('Pending','Approved','Cancelled','Did not attend','Postponed') NOT NULL DEFAULT 'Pending',
  `appointment_date_time` datetime NOT NULL,
  `appointment_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chats`
--

CREATE TABLE `tbl_chats` (
  `chat_id` int(11) NOT NULL,
  `chat_from` int(11) NOT NULL,
  `chat_to` int(11) NOT NULL,
  `chat_message` text NOT NULL,
  `chat_attachments` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_chats`
--

INSERT INTO `tbl_chats` (`chat_id`, `chat_from`, `chat_to`, `chat_message`, `chat_attachments`) VALUES
(1, 9, 11, 'test', NULL),
(2, 9, 11, 'test', NULL),
(3, 9, 11, 'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest', NULL),
(4, 9, 11, 'test', NULL),
(5, 9, 11, 'tetest', NULL),
(6, 10, 9, 'test', NULL),
(7, 9, 10, 'hi', NULL),
(8, 11, 10, 'hi admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_confidential_documents`
--

CREATE TABLE `tbl_confidential_documents` (
  `document_id` int(11) NOT NULL,
  `document_type` varchar(200) NOT NULL,
  `document_file` text NOT NULL,
  `document_status` enum('Processing','Approved','Denied') NOT NULL DEFAULT 'Processing',
  `document_company` varchar(200) NOT NULL,
  `document_uploaded_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_confidential_documents`
--

INSERT INTO `tbl_confidential_documents` (`document_id`, `document_type`, `document_file`, `document_status`, `document_company`, `document_uploaded_by`) VALUES
(1, 'test', 'uploads/files/664b42b2ca474.pdf', 'Approved', 'test', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content`
--

CREATE TABLE `tbl_content` (
  `content_id` int(11) NOT NULL,
  `content_author` text NOT NULL,
  `content_title` text NOT NULL,
  `content_content` text NOT NULL,
  `content_date` datetime NOT NULL,
  `content_type` enum('announcement','event','news') NOT NULL,
  `content_status` enum('published','unpublished','for approval') NOT NULL,
  `content_photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_content`
--

INSERT INTO `tbl_content` (`content_id`, `content_author`, `content_title`, `content_content`, `content_date`, `content_type`, `content_status`, `content_photo`) VALUES
(3, 'Kumatech Developers', 'test', '<p><strong>test</strong></p>', '2024-05-10 00:00:00', 'announcement', 'published', 'uploads/announcement/663e0b9422748.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_experts`
--

CREATE TABLE `tbl_experts` (
  `expert_id` int(11) NOT NULL,
  `expert_name` varchar(256) NOT NULL,
  `expert_department` varchar(256) NOT NULL,
  `expert_position` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_experts`
--

INSERT INTO `tbl_experts` (`expert_id`, `expert_name`, `expert_department`, `expert_position`) VALUES
(2, 'test', 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_forgot_password`
--

CREATE TABLE `tbl_forgot_password` (
  `forgot_id` int(11) NOT NULL,
  `email` varchar(256) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inquiry`
--

CREATE TABLE `tbl_inquiry` (
  `inquiry_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `inquiry_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_inquiry`
--

INSERT INTO `tbl_inquiry` (`inquiry_id`, `user_id`, `inquiry_message`) VALUES
(1, 9, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_institutional_membership`
--

CREATE TABLE `tbl_institutional_membership` (
  `institutional_membership_id` int(11) NOT NULL,
  `institutional_membership_name` varchar(256) NOT NULL,
  `institutional_membership_photo` text NOT NULL,
  `institutional_membership_link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_linkages`
--

CREATE TABLE `tbl_linkages` (
  `linkage_id` int(11) NOT NULL,
  `linkage_name` varchar(256) NOT NULL,
  `linkage_photo` text NOT NULL,
  `linkage_link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ojt_partners`
--

CREATE TABLE `tbl_ojt_partners` (
  `ojt_id` int(11) NOT NULL,
  `ojt_name` varchar(256) NOT NULL,
  `ojt_photo` text NOT NULL,
  `ojt_link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_partners`
--

CREATE TABLE `tbl_partners` (
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `partner_name` varchar(256) NOT NULL,
  `partner_address` text NOT NULL,
  `partner_contact` varchar(256) DEFAULT NULL,
  `partner_position` varchar(256) DEFAULT NULL,
  `partner_telephone` varchar(256) NOT NULL,
  `partner_photo` text NOT NULL DEFAULT '/public/assets/images/user.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_partners`
--

INSERT INTO `tbl_partners` (`partner_id`, `user_id`, `partner_name`, `partner_address`, `partner_contact`, `partner_position`, `partner_telephone`, `partner_photo`) VALUES
(5, 9, 'Kumatech Developers', 'General Trias, Cavite', '09972234988', 'Developer', '666-666-6666', '/public/assets/images/user.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_students`
--

CREATE TABLE `tbl_students` (
  `student_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `student_fname` varchar(256) NOT NULL,
  `student_lname` varchar(256) NOT NULL,
  `student_number` varchar(256) NOT NULL,
  `student_birthday` date NOT NULL,
  `student_gender` enum('Male','Female') NOT NULL,
  `student_course` enum('BS in Information Technology','BS Business Management Major in Marketing','BS Hospitality Management','BS Psychology','Bachelor of Science in Office Administration','Bachelor of Secondary Education Major in English') NOT NULL,
  `student_photo` text NOT NULL DEFAULT '/public/assets/images/user.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_students`
--

INSERT INTO `tbl_students` (`student_id`, `user_id`, `student_fname`, `student_lname`, `student_number`, `student_birthday`, `student_gender`, `student_course`, `student_photo`) VALUES
(5, 11, 'Lance Kenji', 'Parce', '1234567890', '2024-05-01', 'Male', 'BS in Information Technology', '/public/assets/images/user.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_role` enum('admin','student','partner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_email`, `user_password`, `user_role`) VALUES
(9, 'lancekenjiparce@gmail.com1', '$2y$10$sHIU9ISgOTW.nqlQjc09eOEu9zzJc9wz/ysLJomHKBIzhNgchRZbq', 'partner'),
(10, 'admin@admin.com', '$2a$12$evIU2480aqVI4FHFU9U1SuxkoudbwBkgB0ldavletfV315O7WRAhO', 'admin'),
(11, 'lancekenjiparce@gmail.com', '$2y$10$ivGw8llmEcrOPtkTZjtn6eAclziqiQsNRBebuA/HfCkDXQN17bjeO', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_appointments`
--
ALTER TABLE `tbl_appointments`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `tbl_chats`
--
ALTER TABLE `tbl_chats`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `tbl_confidential_documents`
--
ALTER TABLE `tbl_confidential_documents`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `tbl_content`
--
ALTER TABLE `tbl_content`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `tbl_experts`
--
ALTER TABLE `tbl_experts`
  ADD PRIMARY KEY (`expert_id`);

--
-- Indexes for table `tbl_forgot_password`
--
ALTER TABLE `tbl_forgot_password`
  ADD PRIMARY KEY (`forgot_id`);

--
-- Indexes for table `tbl_inquiry`
--
ALTER TABLE `tbl_inquiry`
  ADD PRIMARY KEY (`inquiry_id`),
  ADD KEY `FK_tbl_inquiry` (`user_id`);

--
-- Indexes for table `tbl_institutional_membership`
--
ALTER TABLE `tbl_institutional_membership`
  ADD PRIMARY KEY (`institutional_membership_id`);

--
-- Indexes for table `tbl_linkages`
--
ALTER TABLE `tbl_linkages`
  ADD PRIMARY KEY (`linkage_id`);

--
-- Indexes for table `tbl_ojt_partners`
--
ALTER TABLE `tbl_ojt_partners`
  ADD PRIMARY KEY (`ojt_id`);

--
-- Indexes for table `tbl_partners`
--
ALTER TABLE `tbl_partners`
  ADD PRIMARY KEY (`partner_id`),
  ADD KEY `FK_tbl_partners_1` (`user_id`);

--
-- Indexes for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `FK_tbl_students_1` (`user_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_appointments`
--
ALTER TABLE `tbl_appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_chats`
--
ALTER TABLE `tbl_chats`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_confidential_documents`
--
ALTER TABLE `tbl_confidential_documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_content`
--
ALTER TABLE `tbl_content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_experts`
--
ALTER TABLE `tbl_experts`
  MODIFY `expert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_forgot_password`
--
ALTER TABLE `tbl_forgot_password`
  MODIFY `forgot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_inquiry`
--
ALTER TABLE `tbl_inquiry`
  MODIFY `inquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_institutional_membership`
--
ALTER TABLE `tbl_institutional_membership`
  MODIFY `institutional_membership_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_linkages`
--
ALTER TABLE `tbl_linkages`
  MODIFY `linkage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_ojt_partners`
--
ALTER TABLE `tbl_ojt_partners`
  MODIFY `ojt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_partners`
--
ALTER TABLE `tbl_partners`
  MODIFY `partner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_students`
--
ALTER TABLE `tbl_students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_inquiry`
--
ALTER TABLE `tbl_inquiry`
  ADD CONSTRAINT `FK_tbl_inquiry` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_partners`
--
ALTER TABLE `tbl_partners`
  ADD CONSTRAINT `FK_tbl_partners_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD CONSTRAINT `FK_tbl_students_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
