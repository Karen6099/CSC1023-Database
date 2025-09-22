-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 28, 2022 at 10:20 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `INTO`
--

-- --------------------------------------------------------

--
-- Table structure for table `Activity`
--

CREATE TABLE `Activity` (
  `AcID` bigint(20) NOT NULL,
  `Title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CaID` int(11) DEFAULT NULL,
  `BuID` bigint(20) DEFAULT NULL,
  `Status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Started` date NOT NULL,
  `Ended` date DEFAULT NULL,
  `Internal` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Allocation`
--

CREATE TABLE `Allocation` (
  `StaffID` bigint(20) NOT NULL,
  `AcID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Budget`
--

CREATE TABLE `Budget` (
  `BuID` bigint(20) NOT NULL,
  `Amount` bigint(20) DEFAULT NULL,
  `Approver` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Payee` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Campus`
--

CREATE TABLE `Campus` (
  `CaID` int(11) NOT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GmName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Classroom`
--

CREATE TABLE `Classroom` (
  `RmID` bigint(20) NOT NULL,
  `Capacity` bigint(20) DEFAULT NULL,
  `CaID` int(11) DEFAULT NULL,
  `Location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `DeptID` bigint(20) NOT NULL,
  `DeptName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Faculty` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HODName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Enrolment`
--

CREATE TABLE `Enrolment` (
  `EID` bigint(20) NOT NULL,
  `StudentID` bigint(20) NOT NULL,
  `MoudleID` bigint(20) NOT NULL,
  `Score` int(11) NOT NULL,
  `Semester` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Year` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Moudle`
--

CREATE TABLE `Moudle` (
  `MoudleID` bigint(20) NOT NULL,
  `MoudleName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DeptID` bigint(20) NOT NULL,
  `Programme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Date_of_Firstoffer` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SpaceAssign`
--

CREATE TABLE `SpaceAssign` (
  `SpaID` bigint(20) NOT NULL,
  `RmID` bigint(20) NOT NULL,
  `TID` bigint(20) NOT NULL,
  `Manager` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Approved` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `StaffID` bigint(20) NOT NULL,
  `Title` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FirstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DeptID` bigint(20) NOT NULL,
  `CaID` int(11) DEFAULT NULL,
  `Joined` date DEFAULT NULL,
  `LeftD` date DEFAULT NULL,
  `Current` tinyint(1) NOT NULL,
  `Salary` bigint(20) NOT NULL,
  `ContractType` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `SupervisorID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `StudentID` bigint(20) NOT NULL,
  `StudentName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DoB` date NOT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `StudyType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Date_of_Start` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Teach`
--

CREATE TABLE `Teach` (
  `TID` bigint(20) NOT NULL,
  `MoudleID` bigint(20) NOT NULL,
  `StaffID` bigint(20) NOT NULL,
  `SpaID` bigint(20) NOT NULL,
  `Semester` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Year` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Activity`
--
ALTER TABLE `Activity`
  ADD PRIMARY KEY (`AcID`),
  ADD UNIQUE KEY `AcID` (`AcID`),
  ADD KEY `CaID` (`CaID`),
  ADD KEY `BuID` (`BuID`),
  ADD KEY `AcID_2` (`AcID`),
  ADD KEY `Title` (`Title`);

--
-- Indexes for table `Allocation`
--
ALTER TABLE `Allocation`
  ADD PRIMARY KEY (`StaffID`,`AcID`),
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `AcID` (`AcID`);

--
-- Indexes for table `Budget`
--
ALTER TABLE `Budget`
  ADD PRIMARY KEY (`BuID`),
  ADD UNIQUE KEY `BuID` (`BuID`),
  ADD KEY `BuID_2` (`BuID`);

--
-- Indexes for table `Campus`
--
ALTER TABLE `Campus`
  ADD PRIMARY KEY (`CaID`),
  ADD UNIQUE KEY `CAID` (`CaID`),
  ADD KEY `CAID_2` (`CaID`);

--
-- Indexes for table `Classroom`
--
ALTER TABLE `Classroom`
  ADD PRIMARY KEY (`RmID`),
  ADD UNIQUE KEY `RmID` (`RmID`),
  ADD KEY `CaID` (`CaID`),
  ADD KEY `RmID_2` (`RmID`);

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`DeptID`),
  ADD UNIQUE KEY `DeptID` (`DeptID`),
  ADD UNIQUE KEY `HODName` (`HODName`),
  ADD UNIQUE KEY `Address` (`Address`),
  ADD KEY `DeptID_2` (`DeptID`);

--
-- Indexes for table `Enrolment`
--
ALTER TABLE `Enrolment`
  ADD PRIMARY KEY (`EID`),
  ADD UNIQUE KEY `EID` (`EID`),
  ADD KEY `EID_2` (`EID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `MoudleID` (`MoudleID`),
  ADD KEY `Semester` (`Semester`),
  ADD KEY `Year` (`Year`);

--
-- Indexes for table `Moudle`
--
ALTER TABLE `Moudle`
  ADD PRIMARY KEY (`MoudleID`),
  ADD UNIQUE KEY `MoudleID` (`MoudleID`),
  ADD KEY `MoudleID_2` (`MoudleID`),
  ADD KEY `MoudleName` (`MoudleName`),
  ADD KEY `DeptID` (`DeptID`);

--
-- Indexes for table `SpaceAssign`
--
ALTER TABLE `SpaceAssign`
  ADD PRIMARY KEY (`SpaID`),
  ADD UNIQUE KEY `SpaID` (`SpaID`),
  ADD KEY `RmID` (`RmID`),
  ADD KEY `TID` (`TID`);

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD UNIQUE KEY `StaffID` (`StaffID`),
  ADD KEY `CaID` (`CaID`),
  ADD KEY `StaffID_2` (`StaffID`),
  ADD KEY `FirstName` (`FirstName`),
  ADD KEY `LastName` (`LastName`),
  ADD KEY `DeptID` (`DeptID`),
  ADD KEY `Current` (`Current`),
  ADD KEY `SupervisorID` (`SupervisorID`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`StudentID`),
  ADD UNIQUE KEY `StudentID` (`StudentID`),
  ADD KEY `StudentID_2` (`StudentID`);

--
-- Indexes for table `Teach`
--
ALTER TABLE `Teach`
  ADD PRIMARY KEY (`TID`),
  ADD UNIQUE KEY `TID` (`TID`),
  ADD KEY `TID_2` (`TID`),
  ADD KEY `MoudleID` (`MoudleID`),
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `Semester` (`Semester`),
  ADD KEY `Year` (`Year`),
  ADD KEY `SpaID` (`SpaID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Activity`
--
ALTER TABLE `Activity`
  MODIFY `AcID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Budget`
--
ALTER TABLE `Budget`
  MODIFY `BuID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Campus`
--
ALTER TABLE `Campus`
  MODIFY `CaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Classroom`
--
ALTER TABLE `Classroom`
  MODIFY `RmID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Department`
--
ALTER TABLE `Department`
  MODIFY `DeptID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Enrolment`
--
ALTER TABLE `Enrolment`
  MODIFY `EID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `Moudle`
--
ALTER TABLE `Moudle`
  MODIFY `MoudleID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `SpaceAssign`
--
ALTER TABLE `SpaceAssign`
  MODIFY `SpaID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Staff`
--
ALTER TABLE `Staff`
  MODIFY `StaffID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `Student`
--
ALTER TABLE `Student`
  MODIFY `StudentID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `Teach`
--
ALTER TABLE `Teach`
  MODIFY `TID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Activity`
--
ALTER TABLE `Activity`
  ADD CONSTRAINT `Activity_ibfk_1` FOREIGN KEY (`CaID`) REFERENCES `Campus` (`CAID`),
  ADD CONSTRAINT `Activity_ibfk_2` FOREIGN KEY (`BuID`) REFERENCES `Budget` (`BuID`);

--
-- Constraints for table `Allocation`
--
ALTER TABLE `Allocation`
  ADD CONSTRAINT `Allocation_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`),
  ADD CONSTRAINT `Allocation_ibfk_2` FOREIGN KEY (`AcID`) REFERENCES `Activity` (`AcID`);

--
-- Constraints for table `Classroom`
--
ALTER TABLE `Classroom`
  ADD CONSTRAINT `Classroom_ibfk_1` FOREIGN KEY (`CaID`) REFERENCES `Campus` (`CAID`);

--
-- Constraints for table `Enrolment`
--
ALTER TABLE `Enrolment`
  ADD CONSTRAINT `Enrolment_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`),
  ADD CONSTRAINT `Enrolment_ibfk_2` FOREIGN KEY (`MoudleID`) REFERENCES `Moudle` (`MoudleID`);

--
-- Constraints for table `Moudle`
--
ALTER TABLE `Moudle`
  ADD CONSTRAINT `Moudle_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `Department` (`DeptID`);

--
-- Constraints for table `SpaceAssign`
--
ALTER TABLE `SpaceAssign`
  ADD CONSTRAINT `SpaceAssign_ibfk_1` FOREIGN KEY (`RmID`) REFERENCES `Classroom` (`RmID`),
  ADD CONSTRAINT `SpaceAssign_ibfk_2` FOREIGN KEY (`TID`) REFERENCES `Teach` (`TID`);

--
-- Constraints for table `Staff`
--
ALTER TABLE `Staff`
  ADD CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `Department` (`DeptID`),
  ADD CONSTRAINT `Staff_ibfk_2` FOREIGN KEY (`CaID`) REFERENCES `Campus` (`CAID`);

--
-- Constraints for table `Teach`
--
ALTER TABLE `Teach`
  ADD CONSTRAINT `Teach_ibfk_1` FOREIGN KEY (`MoudleID`) REFERENCES `Moudle` (`MoudleID`),
  ADD CONSTRAINT `Teach_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`),
  ADD CONSTRAINT `Teach_ibfk_3` FOREIGN KEY (`SpaID`) REFERENCES `SpaceAssign` (`SpaID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
