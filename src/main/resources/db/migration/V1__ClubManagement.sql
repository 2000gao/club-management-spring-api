CREATE TABLE `Administrator` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `schoolID` int DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `schoolID` (`schoolID`),
  CONSTRAINT `Administrator_ibfk_1` FOREIGN KEY (`schoolID`) REFERENCES `School` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Announcement` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `message` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  `officerID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `officerID` (`officerID`),
  CONSTRAINT `Announcement_ibfk_1` FOREIGN KEY (`officerID`) REFERENCES `Officer` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Attendance` (
  `memberID` int NOT NULL,
  `meetingID` int NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`memberID`,`meetingID`),
  KEY `meetingID` (`meetingID`),
  CONSTRAINT `Attendance_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `Member` (`ID`),
  CONSTRAINT `Attendance_ibfk_2` FOREIGN KEY (`meetingID`) REFERENCES `Meeting` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Club` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `foundingdate` date DEFAULT NULL,
  `schoolID` int DEFAULT NULL,
  `organizationID` int DEFAULT NULL,
  `administratorID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `schoolID` (`schoolID`),
  KEY `organizationID` (`organizationID`),
  KEY `administratorID` (`administratorID`),
  CONSTRAINT `Club_ibfk_1` FOREIGN KEY (`schoolID`) REFERENCES `School` (`ID`),
  CONSTRAINT `Club_ibfk_2` FOREIGN KEY (`organizationID`) REFERENCES `Organization` (`ID`),
  CONSTRAINT `Club_ibfk_3` FOREIGN KEY (`administratorID`) REFERENCES `Administrator` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Comment` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `threadID` int DEFAULT NULL,
  `message` text,
  `date` date DEFAULT NULL,
  `lastedited` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `threadID` (`threadID`),
  CONSTRAINT `Comment_ibfk_1` FOREIGN KEY (`threadID`) REFERENCES `Thread` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Election` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `position` varchar(100) NOT NULL,
  `anonymous` tinyint(1) DEFAULT NULL,
  `votingsystem` varchar(100) NOT NULL,
  `clubID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `clubID` (`clubID`),
  CONSTRAINT `Election_ibfk_1` FOREIGN KEY (`clubID`) REFERENCES `Club` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Meeting` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `clubID` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `clubID` (`clubID`),
  CONSTRAINT `Meeting_ibfk_1` FOREIGN KEY (`clubID`) REFERENCES `Club` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Member` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `studentID` int DEFAULT NULL,
  `clubID` int DEFAULT NULL,
  `joindate` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `studentID` (`studentID`),
  KEY `clubID` (`clubID`),
  CONSTRAINT `Member_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `Student` (`ID`),
  CONSTRAINT `Member_ibfk_2` FOREIGN KEY (`clubID`) REFERENCES `Club` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Officer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `studentID` int DEFAULT NULL,
  `clubID` int DEFAULT NULL,
  `position` varchar(100) NOT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `studentID` (`studentID`),
  KEY `clubID` (`clubID`),
  CONSTRAINT `Officer_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `Student` (`ID`),
  CONSTRAINT `Officer_ibfk_2` FOREIGN KEY (`clubID`) REFERENCES `Club` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Organization` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `School` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Sponsor` (
  `teacherID` int NOT NULL,
  `clubID` int NOT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`teacherID`,`clubID`),
  KEY `clubID` (`clubID`),
  CONSTRAINT `Sponsor_ibfk_1` FOREIGN KEY (`teacherID`) REFERENCES `Teacher` (`ID`),
  CONSTRAINT `Sponsor_ibfk_2` FOREIGN KEY (`clubID`) REFERENCES `Club` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Student` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `studentid` varchar(100) NOT NULL,
  `year` char(4) NOT NULL,
  `school` varchar(100) NOT NULL,
  `major` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `schoolID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `schoolID` (`schoolID`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`schoolID`) REFERENCES `School` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Teacher` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `employmentstatus` tinyint(1) DEFAULT NULL,
  `schoolID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `schoolID` (`schoolID`),
  CONSTRAINT `Teacher_ibfk_1` FOREIGN KEY (`schoolID`) REFERENCES `School` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Thread` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `memberID` int DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `memberID` (`memberID`),
  CONSTRAINT `Thread_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `Member` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Vote` (
  `memberID` int NOT NULL,
  `electionID` int NOT NULL,
  `vote` varchar(100) NOT NULL,
  PRIMARY KEY (`memberID`,`electionID`),
  KEY `electionID` (`electionID`),
  CONSTRAINT `Vote_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `Member` (`ID`),
  CONSTRAINT `Vote_ibfk_2` FOREIGN KEY (`electionID`) REFERENCES `Election` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
