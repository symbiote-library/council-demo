-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 15, 2012 at 01:29 PM
-- Server version: 5.5.9
-- PHP Version: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `council-ss3`
--

-- --------------------------------------------------------

--
-- Table structure for table `AssignUsersToWorkflowAction`
--

CREATE TABLE `AssignUsersToWorkflowAction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AssignInitiator` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `AssignUsersToWorkflowAction`
--


-- --------------------------------------------------------

--
-- Table structure for table `AssignUsersToWorkflowAction_Groups`
--

CREATE TABLE `AssignUsersToWorkflowAction_Groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AssignUsersToWorkflowActionID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `AssignUsersToWorkflowActionID` (`AssignUsersToWorkflowActionID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `AssignUsersToWorkflowAction_Groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `AssignUsersToWorkflowAction_Users`
--

CREATE TABLE `AssignUsersToWorkflowAction_Users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AssignUsersToWorkflowActionID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `AssignUsersToWorkflowActionID` (`AssignUsersToWorkflowActionID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `AssignUsersToWorkflowAction_Users`
--


-- --------------------------------------------------------

--
-- Table structure for table `Calendar`
--

CREATE TABLE `Calendar` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DefaultDateHeader` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OtherDatesCount` int(11) NOT NULL DEFAULT '0',
  `RSSTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `DefaultFutureMonths` int(11) NOT NULL DEFAULT '0',
  `EventsPerPage` int(11) NOT NULL DEFAULT '0',
  `DefaultView` enum('today','week','','month','weekend','upcoming') CHARACTER SET utf8 DEFAULT 'upcoming',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `Calendar`
--

INSERT INTO `Calendar` VALUES(65, NULL, 5, 'Events', 3, 10, 'upcoming');

-- --------------------------------------------------------

--
-- Table structure for table `CalendarAnnouncement`
--

CREATE TABLE `CalendarAnnouncement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `CalendarID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CalendarID` (`CalendarID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `CalendarAnnouncement`
--


-- --------------------------------------------------------

--
-- Table structure for table `CalendarDateTime`
--

CREATE TABLE `CalendarDateTime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('CalendarDateTime','CalendarAnnouncement') CHARACTER SET utf8 DEFAULT 'CalendarDateTime',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `AllDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventID` (`EventID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `CalendarDateTime`
--

INSERT INTO `CalendarDateTime` VALUES(1, 'CalendarDateTime', '2012-10-10 12:34:59', '2012-10-10 12:34:59', '2012-10-31', '19:00:00', '2012-10-31', '20:00:00', 0, 66);
INSERT INTO `CalendarDateTime` VALUES(2, 'CalendarDateTime', '2012-10-10 12:45:47', '2012-10-10 12:45:47', '2012-11-10', NULL, '2012-10-10', NULL, 1, 66);

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEvent`
--

CREATE TABLE `CalendarEvent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Recursion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CustomRecursionType` int(11) NOT NULL DEFAULT '0',
  `DailyInterval` int(11) NOT NULL DEFAULT '0',
  `WeeklyInterval` int(11) NOT NULL DEFAULT '0',
  `MonthlyInterval` int(11) NOT NULL DEFAULT '0',
  `MonthlyRecursionType1` int(11) NOT NULL DEFAULT '0',
  `MonthlyRecursionType2` int(11) NOT NULL DEFAULT '0',
  `MonthlyIndex` int(11) NOT NULL DEFAULT '0',
  `MonthlyDayOfWeek` int(11) NOT NULL DEFAULT '0',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `DesiredPublishDate` datetime DEFAULT NULL,
  `DesiredUnPublishDate` datetime DEFAULT NULL,
  `PublishOnDate` datetime DEFAULT NULL,
  `UnPublishOnDate` datetime DEFAULT NULL,
  `PublishJobID` int(11) NOT NULL DEFAULT '0',
  `UnPublishJobID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `PublishJobID` (`PublishJobID`),
  KEY `UnPublishJobID` (`UnPublishJobID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `CalendarEvent`
--

INSERT INTO `CalendarEvent` VALUES(66, 0, 0, 1, 1, 1, 0, 0, 0, 0, 13, NULL, NULL, NULL, '2012-10-11 17:00:00', 0, 124);

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEvent_Live`
--

CREATE TABLE `CalendarEvent_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Recursion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CustomRecursionType` int(11) NOT NULL DEFAULT '0',
  `DailyInterval` int(11) NOT NULL DEFAULT '0',
  `WeeklyInterval` int(11) NOT NULL DEFAULT '0',
  `MonthlyInterval` int(11) NOT NULL DEFAULT '0',
  `MonthlyRecursionType1` int(11) NOT NULL DEFAULT '0',
  `MonthlyRecursionType2` int(11) NOT NULL DEFAULT '0',
  `MonthlyIndex` int(11) NOT NULL DEFAULT '0',
  `MonthlyDayOfWeek` int(11) NOT NULL DEFAULT '0',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `DesiredPublishDate` datetime DEFAULT NULL,
  `DesiredUnPublishDate` datetime DEFAULT NULL,
  `PublishOnDate` datetime DEFAULT NULL,
  `UnPublishOnDate` datetime DEFAULT NULL,
  `PublishJobID` int(11) NOT NULL DEFAULT '0',
  `UnPublishJobID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `PublishJobID` (`PublishJobID`),
  KEY `UnPublishJobID` (`UnPublishJobID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `CalendarEvent_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `CalendarEvent_RecurringDaysOfMonth`
--

CREATE TABLE `CalendarEvent_RecurringDaysOfMonth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CalendarEventID` int(11) NOT NULL DEFAULT '0',
  `RecurringDayOfMonthID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CalendarEventID` (`CalendarEventID`),
  KEY `RecurringDayOfMonthID` (`RecurringDayOfMonthID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `CalendarEvent_RecurringDaysOfMonth`
--


-- --------------------------------------------------------

--
-- Table structure for table `CalendarEvent_RecurringDaysOfWeek`
--

CREATE TABLE `CalendarEvent_RecurringDaysOfWeek` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CalendarEventID` int(11) NOT NULL DEFAULT '0',
  `RecurringDayOfWeekID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CalendarEventID` (`CalendarEventID`),
  KEY `RecurringDayOfWeekID` (`RecurringDayOfWeekID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `CalendarEvent_RecurringDaysOfWeek`
--


-- --------------------------------------------------------

--
-- Table structure for table `CalendarEvent_versions`
--

CREATE TABLE `CalendarEvent_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Recursion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CustomRecursionType` int(11) NOT NULL DEFAULT '0',
  `DailyInterval` int(11) NOT NULL DEFAULT '0',
  `WeeklyInterval` int(11) NOT NULL DEFAULT '0',
  `MonthlyInterval` int(11) NOT NULL DEFAULT '0',
  `MonthlyRecursionType1` int(11) NOT NULL DEFAULT '0',
  `MonthlyRecursionType2` int(11) NOT NULL DEFAULT '0',
  `MonthlyIndex` int(11) NOT NULL DEFAULT '0',
  `MonthlyDayOfWeek` int(11) NOT NULL DEFAULT '0',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `DesiredPublishDate` datetime DEFAULT NULL,
  `DesiredUnPublishDate` datetime DEFAULT NULL,
  `PublishOnDate` datetime DEFAULT NULL,
  `UnPublishOnDate` datetime DEFAULT NULL,
  `PublishJobID` int(11) NOT NULL DEFAULT '0',
  `UnPublishJobID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `ImageID` (`ImageID`),
  KEY `PublishJobID` (`PublishJobID`),
  KEY `UnPublishJobID` (`UnPublishJobID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `CalendarEvent_versions`
--

INSERT INTO `CalendarEvent_versions` VALUES(1, 66, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `CalendarEvent_versions` VALUES(2, 66, 2, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `CalendarEvent_versions` VALUES(3, 66, 3, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `CalendarEvent_versions` VALUES(4, 66, 4, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `CalendarEvent_versions` VALUES(5, 66, 5, 0, 0, 1, 1, 1, 0, 0, 0, 0, 13, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `CalendarEvent_versions` VALUES(6, 66, 6, 0, 0, 1, 1, 1, 0, 0, 0, 0, 13, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `CalendarEvent_versions` VALUES(7, 66, 7, 0, 0, 1, 1, 1, 0, 0, 0, 0, 13, NULL, NULL, NULL, '2012-10-11 17:00:00', 0, 124);

-- --------------------------------------------------------

--
-- Table structure for table `Calendar_Live`
--

CREATE TABLE `Calendar_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DefaultDateHeader` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OtherDatesCount` int(11) NOT NULL DEFAULT '0',
  `RSSTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `DefaultFutureMonths` int(11) NOT NULL DEFAULT '0',
  `EventsPerPage` int(11) NOT NULL DEFAULT '0',
  `DefaultView` enum('today','week','','month','weekend','upcoming') CHARACTER SET utf8 DEFAULT 'upcoming',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `Calendar_Live`
--

INSERT INTO `Calendar_Live` VALUES(65, NULL, 5, 'Events', 3, 10, 'upcoming');

-- --------------------------------------------------------

--
-- Table structure for table `Calendar_NestedCalendars`
--

CREATE TABLE `Calendar_NestedCalendars` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CalendarID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CalendarID` (`CalendarID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Calendar_NestedCalendars`
--


-- --------------------------------------------------------

--
-- Table structure for table `Calendar_versions`
--

CREATE TABLE `Calendar_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `DefaultDateHeader` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OtherDatesCount` int(11) NOT NULL DEFAULT '0',
  `RSSTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `DefaultFutureMonths` int(11) NOT NULL DEFAULT '0',
  `EventsPerPage` int(11) NOT NULL DEFAULT '0',
  `DefaultView` enum('today','week','','month','weekend','upcoming') CHARACTER SET utf8 DEFAULT 'upcoming',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Calendar_versions`
--

INSERT INTO `Calendar_versions` VALUES(1, 65, 2, NULL, 0, 'Events', 0, 0, 'upcoming');
INSERT INTO `Calendar_versions` VALUES(2, 65, 3, NULL, 0, 'Events', 0, 0, 'upcoming');
INSERT INTO `Calendar_versions` VALUES(3, 65, 4, NULL, 0, 'Events', 0, 0, 'upcoming');
INSERT INTO `Calendar_versions` VALUES(4, 65, 5, NULL, 5, 'Events', 3, 10, 'upcoming');

-- --------------------------------------------------------

--
-- Table structure for table `ComposedPdf`
--

CREATE TABLE `ComposedPdf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ComposedPdf') CHARACTER SET utf8 DEFAULT 'ComposedPdf',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(125) DEFAULT NULL,
  `Description` text,
  `TableOfContents` tinyint(1) NOT NULL DEFAULT '0',
  `Template` varchar(50) DEFAULT NULL,
  `PageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ComposedPdf`
--


-- --------------------------------------------------------

--
-- Table structure for table `ComposedPdfFile`
--

CREATE TABLE `ComposedPdfFile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SourceID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ComposedPdfFile`
--


-- --------------------------------------------------------

--
-- Table structure for table `DashboardGoogleAnalyticsPanel`
--

CREATE TABLE `DashboardGoogleAnalyticsPanel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountEmail` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `AccountPassword` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ProfileID` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `DateFormat` enum('mdy','dmy') CHARACTER SET utf8 DEFAULT 'dmy',
  `DateRange` enum('day','week','month','year') CHARACTER SET utf8 DEFAULT 'month',
  `PathType` enum('none','list','custom') CHARACTER SET utf8 DEFAULT 'none',
  `CustomPath` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `SubjectPageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SubjectPageID` (`SubjectPageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `DashboardGoogleAnalyticsPanel`
--

INSERT INTO `DashboardGoogleAnalyticsPanel` VALUES(19, 'shea@livesource.co.nz', '4lement11#', '59027670', 'dmy', 'month', 'none', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `DashboardGridFieldPanel`
--

CREATE TABLE `DashboardGridFieldPanel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Count` int(11) NOT NULL DEFAULT '0',
  `GridFieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `SubjectPageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SubjectPageID` (`SubjectPageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DashboardGridFieldPanel`
--


-- --------------------------------------------------------

--
-- Table structure for table `DashboardModelAdminPanel`
--

CREATE TABLE `DashboardModelAdminPanel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Count` int(11) NOT NULL DEFAULT '0',
  `ModelAdminClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ModelAdminModel` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `DashboardModelAdminPanel`
--

INSERT INTO `DashboardModelAdminPanel` VALUES(7, 10, 'QueuedJobsAdmin', 'QueuedJobDescriptor');
INSERT INTO `DashboardModelAdminPanel` VALUES(9, 10, 'QueuedJobsAdmin', 'QueuedJobDescriptor');
INSERT INTO `DashboardModelAdminPanel` VALUES(12, 10, 'QueuedJobsAdmin', 'QueuedJobDescriptor');

-- --------------------------------------------------------

--
-- Table structure for table `DashboardPanel`
--

CREATE TABLE `DashboardPanel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('DashboardRSSFeedPanel','DashboardRecentEditsPanel','DashboardRecentFilesPanel','DashboardModelAdminPanel','DashboardPanel','DashboardGoogleAnalyticsPanel','DashboardGridFieldPanel','DashboardQuickLinksPanel','DashboardSectionEditorPanel','DashboardWeatherPanel') CHARACTER SET utf8 DEFAULT 'DashboardRSSFeedPanel',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PanelSize` enum('small','normal','large') CHARACTER SET utf8 DEFAULT 'normal',
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `DashboardPanel`
--

INSERT INTO `DashboardPanel` VALUES(1, 'DashboardRSSFeedPanel', '2012-10-09 17:06:16', '2012-10-09 17:08:08', 'RSS Feed', 'normal', 3, 2, 0);
INSERT INTO `DashboardPanel` VALUES(2, 'DashboardRecentEditsPanel', '2012-10-09 17:07:10', '2012-10-09 17:07:56', 'Recent Edits', 'normal', 1, 2, 0);
INSERT INTO `DashboardPanel` VALUES(3, 'DashboardRecentFilesPanel', '2012-10-09 17:07:52', '2012-10-09 17:07:56', 'Recent Files', 'normal', 2, 2, 0);
INSERT INTO `DashboardPanel` VALUES(4, 'DashboardRecentEditsPanel', '2012-10-12 11:58:34', '2012-10-15 11:19:24', 'Recently edited', 'small', 3, 4, 0);
INSERT INTO `DashboardPanel` VALUES(5, 'DashboardRecentFilesPanel', '2012-10-12 11:59:12', '2012-10-15 11:19:24', 'Recent Files', 'small', 2, 4, 0);
INSERT INTO `DashboardPanel` VALUES(7, 'DashboardModelAdminPanel', '2012-10-12 12:20:19', '2012-10-15 11:19:24', 'Scheduled Job Queue', 'normal', 1, 4, 0);
INSERT INTO `DashboardPanel` VALUES(9, 'DashboardModelAdminPanel', '2012-10-12 12:34:41', '2012-10-12 12:34:41', 'Scheduled Job Queue', 'normal', 1, 0, 1);
INSERT INTO `DashboardPanel` VALUES(10, 'DashboardRecentFilesPanel', '2012-10-12 12:34:41', '2012-10-12 12:34:41', 'Recent Files', 'small', 2, 0, 1);
INSERT INTO `DashboardPanel` VALUES(11, 'DashboardRecentEditsPanel', '2012-10-12 12:34:41', '2012-10-12 12:34:41', 'Recently edited', 'small', 3, 0, 1);
INSERT INTO `DashboardPanel` VALUES(12, 'DashboardModelAdminPanel', '2012-10-12 12:34:44', '2012-10-12 12:34:44', 'Scheduled Job Queue', 'normal', 1, 1, 0);
INSERT INTO `DashboardPanel` VALUES(13, 'DashboardRecentFilesPanel', '2012-10-12 12:34:44', '2012-10-12 12:34:44', 'Recent Files', 'small', 2, 1, 0);
INSERT INTO `DashboardPanel` VALUES(14, 'DashboardRecentEditsPanel', '2012-10-12 12:34:44', '2012-10-12 12:34:44', 'Recently edited', 'small', 3, 1, 0);
INSERT INTO `DashboardPanel` VALUES(19, 'DashboardGoogleAnalyticsPanel', '2012-10-15 11:19:21', '2012-10-15 11:19:38', 'Google Analytics', NULL, 0, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `DashboardPanelDataObject`
--

CREATE TABLE `DashboardPanelDataObject` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('DashboardPanelDataObject','DashboardQuickLink') CHARACTER SET utf8 DEFAULT 'DashboardPanelDataObject',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `DashboardPanelID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `DashboardPanelID` (`DashboardPanelID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DashboardPanelDataObject`
--


-- --------------------------------------------------------

--
-- Table structure for table `DashboardQuickLink`
--

CREATE TABLE `DashboardQuickLink` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Link` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Text` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `NewWindow` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DashboardQuickLink`
--


-- --------------------------------------------------------

--
-- Table structure for table `DashboardRecentEditsPanel`
--

CREATE TABLE `DashboardRecentEditsPanel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `DashboardRecentEditsPanel`
--

INSERT INTO `DashboardRecentEditsPanel` VALUES(2, 10);
INSERT INTO `DashboardRecentEditsPanel` VALUES(4, 10);
INSERT INTO `DashboardRecentEditsPanel` VALUES(11, 10);
INSERT INTO `DashboardRecentEditsPanel` VALUES(14, 10);

-- --------------------------------------------------------

--
-- Table structure for table `DashboardRecentFilesPanel`
--

CREATE TABLE `DashboardRecentFilesPanel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `DashboardRecentFilesPanel`
--

INSERT INTO `DashboardRecentFilesPanel` VALUES(3, 10);
INSERT INTO `DashboardRecentFilesPanel` VALUES(5, 10);
INSERT INTO `DashboardRecentFilesPanel` VALUES(10, 10);
INSERT INTO `DashboardRecentFilesPanel` VALUES(13, 10);

-- --------------------------------------------------------

--
-- Table structure for table `DashboardRSSFeedPanel`
--

CREATE TABLE `DashboardRSSFeedPanel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FeedURL` mediumtext CHARACTER SET utf8,
  `Count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `DashboardRSSFeedPanel`
--

INSERT INTO `DashboardRSSFeedPanel` VALUES(1, 'http://www.silverstripe.org/blog/rss', 10);

-- --------------------------------------------------------

--
-- Table structure for table `DashboardSectionEditorPanel`
--

CREATE TABLE `DashboardSectionEditorPanel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `Subject` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DashboardSectionEditorPanel`
--


-- --------------------------------------------------------

--
-- Table structure for table `DashboardWeatherPanel`
--

CREATE TABLE `DashboardWeatherPanel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Units` enum('c','f') CHARACTER SET utf8 DEFAULT 'c',
  `WeatherHTML` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DashboardWeatherPanel`
--


-- --------------------------------------------------------

--
-- Table structure for table `DataList`
--

CREATE TABLE `DataList` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('DataList') CHARACTER SET utf8 DEFAULT 'DataList',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DataList`
--


-- --------------------------------------------------------

--
-- Table structure for table `DataListItem`
--

CREATE TABLE `DataListItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('DataListItem') CHARACTER SET utf8 DEFAULT 'DataListItem',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(128) DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `ListID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DataListItem`
--


-- --------------------------------------------------------

--
-- Table structure for table `DPSPayment`
--

CREATE TABLE `DPSPayment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TxnRef` text,
  `TxnType` enum('Purchase','Auth','Complete','Refund','Validate') CHARACTER SET utf8 DEFAULT 'Purchase',
  `AuthCode` varchar(22) DEFAULT NULL,
  `MerchantReference` varchar(64) DEFAULT NULL,
  `DPSHostedRedirectURL` text,
  `SettlementDate` text,
  `ResponseXML` text,
  `AuthPaymentID` int(11) NOT NULL DEFAULT '0',
  `RefundedForID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DPSPayment`
--


-- --------------------------------------------------------

--
-- Table structure for table `DPSRecurringPayment`
--

CREATE TABLE `DPSRecurringPayment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TxnRef` text,
  `AuthCode` varchar(22) DEFAULT NULL,
  `MerchantReference` varchar(64) DEFAULT NULL,
  `DPSHostedRedirectURL` text,
  `DPSBillingID` varchar(16) DEFAULT NULL,
  `AuthAmount` decimal(10,0) NOT NULL DEFAULT '0',
  `ResponseXML` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DPSRecurringPayment`
--


-- --------------------------------------------------------

--
-- Table structure for table `DynamicList`
--

CREATE TABLE `DynamicList` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('DynamicList') CHARACTER SET utf8 DEFAULT 'DynamicList',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DynamicList`
--


-- --------------------------------------------------------

--
-- Table structure for table `DynamicListItem`
--

CREATE TABLE `DynamicListItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('DynamicListItem') CHARACTER SET utf8 DEFAULT 'DynamicListItem',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `ListID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ListID` (`ListID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `DynamicListItem`
--


-- --------------------------------------------------------

--
-- Table structure for table `EditableFormField`
--

CREATE TABLE `EditableFormField` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EditableTextField','EditableEmailField','EditableDropdown','EditableCheckboxGroupField','EditableRadioField','EditableFormField','EditableCheckbox','EditableDateField','EditableFileField','EditableFormHeading','EditableLiteralField','EditableMemberListField','EditableMultipleOptionField','EditableDependentDynamicListField','EditableDynamicListField') CHARACTER SET utf8 DEFAULT 'EditableTextField',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Default` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `Required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CanDelete` tinyint(1) NOT NULL DEFAULT '0',
  `CustomErrorMessage` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CustomRules` mediumtext CHARACTER SET utf8,
  `CustomSettings` mediumtext CHARACTER SET utf8,
  `CustomParameter` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `EditableFormField`
--

INSERT INTO `EditableFormField` VALUES(1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 14:08:06', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 23, 59);
INSERT INTO `EditableFormField` VALUES(3, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 14:08:06', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 21, 59);
INSERT INTO `EditableFormField` VALUES(6, 'EditableDropdown', '2012-02-06 12:39:42', '2012-02-06 14:08:06', 'EditableDropdown6', 'How often do you bike', NULL, 6, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 10, 59);
INSERT INTO `EditableFormField` VALUES(8, 'EditableCheckboxGroupField', '2012-02-06 12:42:32', '2012-02-06 14:08:06', 'EditableCheckboxGroupField8', 'Why do you ride', NULL, 8, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 8, 59);
INSERT INTO `EditableFormField` VALUES(9, 'EditableRadioField', '2012-02-06 12:49:33', '2012-02-06 14:08:06', 'EditableRadioField9', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 9, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 5, 59);
INSERT INTO `EditableFormField` VALUES(10, 'EditableTextField', '2012-02-06 12:52:51', '2012-02-06 14:08:06', 'EditableTextField10', 'Comments', NULL, 10, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 4, 59);
INSERT INTO `EditableFormField` VALUES(11, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-12 11:19:38', 'EditableTextField11', 'Name', NULL, 1, 1, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:1:"1";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 11, 67);
INSERT INTO `EditableFormField` VALUES(12, 'EditableEmailField', '2012-10-10 15:13:22', '2012-10-12 11:19:38', 'EditableEmailField12', 'Email', NULL, 2, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 10, 67);
INSERT INTO `EditableFormField` VALUES(13, 'EditableDropdown', '2012-10-10 15:13:46', '2012-10-12 11:19:38', 'EditableDropdown13', 'How often do you bike?', NULL, 3, 1, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 10, 67);
INSERT INTO `EditableFormField` VALUES(14, 'EditableCheckboxGroupField', '2012-10-10 15:15:56', '2012-10-12 11:19:38', 'EditableCheckboxGroupField14', 'Why do you ride?', NULL, 4, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 10, 67);
INSERT INTO `EditableFormField` VALUES(15, 'EditableRadioField', '2012-10-10 15:17:17', '2012-10-12 11:19:38', 'EditableRadioField15', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 5, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 9, 67);
INSERT INTO `EditableFormField` VALUES(17, 'EditableTextField', '2012-10-10 15:18:11', '2012-10-12 11:19:38', 'EditableTextField17', 'Comments', NULL, 7, 0, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:2:"10";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 9, 67);

-- --------------------------------------------------------

--
-- Table structure for table `EditableFormField_Live`
--

CREATE TABLE `EditableFormField_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EditableTextField','EditableEmailField','EditableDropdown','EditableCheckboxGroupField','EditableRadioField','EditableFormField','EditableCheckbox','EditableDateField','EditableFileField','EditableFormHeading','EditableLiteralField','EditableMemberListField','EditableMultipleOptionField','EditableDependentDynamicListField','EditableDynamicListField') CHARACTER SET utf8 DEFAULT 'EditableTextField',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Default` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `Required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CanDelete` tinyint(1) NOT NULL DEFAULT '0',
  `CustomErrorMessage` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CustomRules` mediumtext CHARACTER SET utf8,
  `CustomSettings` mediumtext CHARACTER SET utf8,
  `CustomParameter` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `EditableFormField_Live`
--

INSERT INTO `EditableFormField_Live` VALUES(1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 14:08:06', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 23, 59);
INSERT INTO `EditableFormField_Live` VALUES(3, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 14:08:06', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 21, 59);
INSERT INTO `EditableFormField_Live` VALUES(6, 'EditableDropdown', '2012-02-06 12:39:42', '2012-02-06 14:08:06', 'EditableDropdown6', 'How often do you bike', NULL, 6, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 10, 59);
INSERT INTO `EditableFormField_Live` VALUES(8, 'EditableCheckboxGroupField', '2012-02-06 12:42:32', '2012-02-06 14:08:06', 'EditableCheckboxGroupField8', 'Why do you ride', NULL, 8, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 8, 59);
INSERT INTO `EditableFormField_Live` VALUES(9, 'EditableRadioField', '2012-02-06 12:49:33', '2012-02-06 14:08:06', 'EditableRadioField9', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 9, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 5, 59);
INSERT INTO `EditableFormField_Live` VALUES(10, 'EditableTextField', '2012-02-06 12:52:51', '2012-02-06 14:08:06', 'EditableTextField10', 'Comments', NULL, 10, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 4, 59);
INSERT INTO `EditableFormField_Live` VALUES(11, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-12 11:34:02', 'EditableTextField11', 'Name', NULL, 1, 1, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:1:"1";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 11, 67);
INSERT INTO `EditableFormField_Live` VALUES(12, 'EditableEmailField', '2012-10-10 15:13:22', '2012-10-12 11:34:02', 'EditableEmailField12', 'Email', NULL, 2, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 10, 67);
INSERT INTO `EditableFormField_Live` VALUES(13, 'EditableDropdown', '2012-10-10 15:13:46', '2012-10-12 11:34:02', 'EditableDropdown13', 'How often do you bike?', NULL, 3, 1, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 10, 67);
INSERT INTO `EditableFormField_Live` VALUES(14, 'EditableCheckboxGroupField', '2012-10-10 15:15:56', '2012-10-12 11:34:02', 'EditableCheckboxGroupField14', 'Why do you ride?', NULL, 4, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 10, 67);
INSERT INTO `EditableFormField_Live` VALUES(15, 'EditableRadioField', '2012-10-10 15:17:17', '2012-10-12 11:34:02', 'EditableRadioField15', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 5, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 9, 67);
INSERT INTO `EditableFormField_Live` VALUES(17, 'EditableTextField', '2012-10-10 15:18:11', '2012-10-12 11:34:02', 'EditableTextField17', 'Comments', NULL, 7, 0, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:2:"10";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 9, 67);

-- --------------------------------------------------------

--
-- Table structure for table `EditableFormField_versions`
--

CREATE TABLE `EditableFormField_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('EditableTextField','EditableEmailField','EditableDropdown','EditableCheckboxGroupField','EditableRadioField','EditableFormField','EditableCheckbox','EditableDateField','EditableFileField','EditableFormHeading','EditableLiteralField','EditableMemberListField','EditableMultipleOptionField','EditableDependentDynamicListField','EditableDynamicListField') CHARACTER SET utf8 DEFAULT 'EditableTextField',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Default` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `Required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CanDelete` tinyint(1) NOT NULL DEFAULT '0',
  `CustomErrorMessage` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CustomRules` mediumtext CHARACTER SET utf8,
  `CustomSettings` mediumtext CHARACTER SET utf8,
  `CustomParameter` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`),
  KEY `RecordID_Version` (`RecordID`,`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=159 ;

--
-- Dumping data for table `EditableFormField_versions`
--

INSERT INTO `EditableFormField_versions` VALUES(1, 1, 1, 0, 1, 0, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 11:41:38', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(2, 1, 2, 0, 1, 0, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 11:41:38', 'EditableTextField1', NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(3, 2, 1, 0, 1, 0, 'EditableTextField', '2012-02-06 11:41:46', '2012-02-06 11:41:46', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(4, 2, 2, 0, 1, 0, 'EditableTextField', '2012-02-06 11:41:46', '2012-02-06 11:41:46', 'EditableTextField2', NULL, NULL, 2, 0, 1, NULL, NULL, NULL, NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(5, 1, 3, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 11:42:13', 'EditableTextField1', NULL, NULL, 1, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(6, 2, 3, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:46', '2012-02-06 11:42:13', 'EditableTextField2', NULL, NULL, 2, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(7, 1, 4, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 11:42:31', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(8, 2, 4, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:46', '2012-02-06 11:42:31', 'EditableTextField2', NULL, NULL, 2, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(9, 3, 1, 0, 1, 0, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 11:42:42', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(10, 3, 2, 0, 1, 0, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 11:42:42', 'EditableEmailField3', NULL, NULL, 3, 0, 1, NULL, NULL, NULL, NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(11, 4, 1, 0, 1, 0, 'EditableLiteralField', '2012-02-06 11:43:34', '2012-02-06 11:43:34', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(12, 4, 2, 0, 1, 0, 'EditableLiteralField', '2012-02-06 11:43:34', '2012-02-06 11:43:34', 'EditableLiteralField4', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(13, 1, 5, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 11:43:56', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(14, 3, 3, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 11:43:56', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(15, 4, 3, 1, 1, 1, 'EditableLiteralField', '2012-02-06 11:43:34', '2012-02-06 11:43:56', 'EditableLiteralField4', 'Coments', NULL, 4, 0, 1, NULL, 'a:0:{}', 'a:2:{s:7:Content;s:0:;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(16, 1, 6, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 11:50:04', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(17, 3, 4, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 11:50:04', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(18, 4, 4, 1, 1, 1, 'EditableLiteralField', '2012-02-06 11:43:34', '2012-02-06 11:50:04', 'EditableLiteralField4', 'Coments', NULL, 4, 0, 1, NULL, 'a:0:{}', 'a:2:{s:7:Content;s:0:;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(19, 1, 7, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 11:51:06', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(20, 3, 5, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 11:51:06', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(21, 4, 5, 1, 1, 1, 'EditableLiteralField', '2012-02-06 11:43:34', '2012-02-06 11:51:06', 'EditableLiteralField4', 'Coments', NULL, 4, 0, 1, NULL, 'a:0:{}', 'a:2:{s:7:Content;s:33:<script> alert(''here''); </script>;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(22, 1, 8, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 11:52:49', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(23, 3, 6, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 11:52:49', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(24, 4, 6, 1, 1, 1, 'EditableLiteralField', '2012-02-06 11:43:34', '2012-02-06 11:52:49', 'EditableLiteralField4', 'Coments', NULL, 4, 0, 1, NULL, 'a:0:{}', 'a:2:{s:7:Content;s:0:;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(25, 5, 1, 0, 1, 0, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 11:54:40', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(26, 5, 2, 0, 1, 0, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 11:54:40', 'EditableTextField5', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(27, 1, 9, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 11:55:00', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(28, 3, 7, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 11:55:00', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(29, 5, 3, 1, 1, 1, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 11:55:00', 'EditableTextField5', 'Comments', NULL, 5, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(30, 1, 10, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 11:59:59', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(31, 3, 8, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 11:59:59', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(32, 5, 4, 1, 1, 1, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 11:59:59', 'EditableTextField5', 'Comments', NULL, 5, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(33, 1, 11, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 12:05:48', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(34, 3, 9, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 12:05:48', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(35, 5, 5, 1, 1, 1, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 12:05:48', 'EditableTextField5', 'Comments', NULL, 5, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(36, 1, 12, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 12:30:03', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(37, 3, 10, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 12:30:03', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(38, 5, 6, 1, 1, 1, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 12:30:03', 'EditableTextField5', 'Comments', NULL, 5, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(39, 1, 13, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 12:35:33', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(40, 3, 11, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 12:35:33', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(41, 5, 7, 1, 1, 1, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 12:35:33', 'EditableTextField5', 'Comments', NULL, 5, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(42, 1, 14, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 12:36:03', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(43, 3, 12, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 12:36:03', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(44, 5, 8, 1, 1, 1, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 12:36:03', 'EditableTextField5', 'Comments', NULL, 5, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(45, 1, 15, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 12:38:30', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(46, 3, 13, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 12:38:30', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(47, 5, 9, 1, 1, 1, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 12:38:30', 'EditableTextField5', 'Comments', NULL, 5, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(48, 6, 1, 0, 1, 0, 'EditableDropdown', '2012-02-06 12:39:42', '2012-02-06 12:39:42', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(49, 6, 2, 0, 1, 0, 'EditableDropdown', '2012-02-06 12:39:42', '2012-02-06 12:39:42', 'EditableDropdown6', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(50, 1, 16, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 12:40:59', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(51, 3, 14, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 12:40:59', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(52, 5, 10, 1, 1, 1, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 12:40:59', 'EditableTextField5', 'Comments', NULL, 5, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(53, 6, 3, 1, 1, 1, 'EditableDropdown', '2012-02-06 12:39:42', '2012-02-06 12:40:59', 'EditableDropdown6', 'How often do you bike', NULL, 6, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(54, 1, 17, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 12:41:19', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(55, 3, 15, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 12:41:19', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(56, 5, 11, 1, 1, 1, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 12:41:19', 'EditableTextField5', 'Comments', NULL, 5, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(57, 6, 4, 1, 1, 1, 'EditableDropdown', '2012-02-06 12:39:42', '2012-02-06 12:41:19', 'EditableDropdown6', 'How often do you bike', NULL, 6, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(58, 7, 1, 0, 1, 0, 'EditableRadioField', '2012-02-06 12:42:09', '2012-02-06 12:42:09', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(59, 7, 2, 0, 1, 0, 'EditableRadioField', '2012-02-06 12:42:09', '2012-02-06 12:42:09', 'EditableRadioField7', NULL, NULL, 7, 0, 1, NULL, NULL, NULL, NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(60, 8, 1, 0, 1, 0, 'EditableCheckboxGroupField', '2012-02-06 12:42:32', '2012-02-06 12:42:32', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(61, 8, 2, 0, 1, 0, 'EditableCheckboxGroupField', '2012-02-06 12:42:32', '2012-02-06 12:42:32', 'EditableCheckboxGroupField8', NULL, NULL, 8, 0, 1, NULL, NULL, NULL, NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(62, 1, 18, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 12:44:05', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(63, 3, 16, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 12:44:05', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(64, 5, 12, 1, 1, 1, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 12:44:05', 'EditableTextField5', 'Comments', NULL, 5, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(65, 6, 5, 1, 1, 1, 'EditableDropdown', '2012-02-06 12:39:42', '2012-02-06 12:44:05', 'EditableDropdown6', 'How often do you bike', NULL, 6, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(66, 8, 3, 1, 1, 1, 'EditableCheckboxGroupField', '2012-02-06 12:42:32', '2012-02-06 12:44:05', 'EditableCheckboxGroupField8', 'Why do you ride', NULL, 8, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(67, 1, 19, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 12:44:11', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(68, 3, 17, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 12:44:11', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(69, 5, 13, 1, 1, 1, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 12:44:11', 'EditableTextField5', 'Comments', NULL, 5, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(70, 6, 6, 1, 1, 1, 'EditableDropdown', '2012-02-06 12:39:42', '2012-02-06 12:44:11', 'EditableDropdown6', 'How often do you bike', NULL, 6, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(71, 8, 4, 1, 1, 1, 'EditableCheckboxGroupField', '2012-02-06 12:42:32', '2012-02-06 12:44:11', 'EditableCheckboxGroupField8', 'Why do you ride', NULL, 8, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(72, 1, 20, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 12:48:58', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(73, 3, 18, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 12:48:58', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(74, 5, 14, 1, 1, 1, 'EditableTextField', '2012-02-06 11:54:40', '2012-02-06 12:48:58', 'EditableTextField5', 'Comments', NULL, 5, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(75, 6, 7, 1, 1, 1, 'EditableDropdown', '2012-02-06 12:39:42', '2012-02-06 12:48:58', 'EditableDropdown6', 'How often do you bike', NULL, 6, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(76, 8, 5, 1, 1, 1, 'EditableCheckboxGroupField', '2012-02-06 12:42:32', '2012-02-06 12:48:58', 'EditableCheckboxGroupField8', 'Why do you ride', NULL, 8, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(77, 9, 1, 0, 1, 0, 'EditableRadioField', '2012-02-06 12:49:33', '2012-02-06 12:49:33', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(78, 9, 2, 0, 1, 0, 'EditableRadioField', '2012-02-06 12:49:33', '2012-02-06 12:49:33', 'EditableRadioField9', NULL, NULL, 9, 0, 1, NULL, NULL, NULL, NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(79, 1, 21, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 12:52:41', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(80, 3, 19, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 12:52:41', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(81, 6, 8, 1, 1, 1, 'EditableDropdown', '2012-02-06 12:39:42', '2012-02-06 12:52:41', 'EditableDropdown6', 'How often do you bike', NULL, 6, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(82, 8, 6, 1, 1, 1, 'EditableCheckboxGroupField', '2012-02-06 12:42:32', '2012-02-06 12:52:41', 'EditableCheckboxGroupField8', 'Why do you ride', NULL, 8, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(83, 9, 3, 1, 1, 1, 'EditableRadioField', '2012-02-06 12:49:33', '2012-02-06 12:52:41', 'EditableRadioField9', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 9, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(84, 10, 1, 0, 1, 0, 'EditableTextField', '2012-02-06 12:52:51', '2012-02-06 12:52:51', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(85, 10, 2, 0, 1, 0, 'EditableTextField', '2012-02-06 12:52:51', '2012-02-06 12:52:51', 'EditableTextField10', NULL, NULL, 10, 0, 1, NULL, NULL, NULL, NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(86, 1, 22, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 12:53:10', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(87, 3, 20, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 12:53:10', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(88, 6, 9, 1, 1, 1, 'EditableDropdown', '2012-02-06 12:39:42', '2012-02-06 12:53:10', 'EditableDropdown6', 'How often do you bike', NULL, 6, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(89, 8, 7, 1, 1, 1, 'EditableCheckboxGroupField', '2012-02-06 12:42:32', '2012-02-06 12:53:10', 'EditableCheckboxGroupField8', 'Why do you ride', NULL, 8, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(90, 9, 4, 1, 1, 1, 'EditableRadioField', '2012-02-06 12:49:33', '2012-02-06 12:53:10', 'EditableRadioField9', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 9, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(91, 10, 3, 1, 1, 1, 'EditableTextField', '2012-02-06 12:52:51', '2012-02-06 12:53:10', 'EditableTextField10', 'Comments', NULL, 10, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(92, 1, 23, 1, 1, 1, 'EditableTextField', '2012-02-06 11:41:38', '2012-02-06 14:08:06', 'EditableTextField1', 'Name', NULL, 1, 1, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:1;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(93, 3, 21, 1, 1, 1, 'EditableEmailField', '2012-02-06 11:42:42', '2012-02-06 14:08:06', 'EditableEmailField3', 'Email', NULL, 3, 0, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(94, 6, 10, 1, 1, 1, 'EditableDropdown', '2012-02-06 12:39:42', '2012-02-06 14:08:06', 'EditableDropdown6', 'How often do you bike', NULL, 6, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(95, 8, 8, 1, 1, 1, 'EditableCheckboxGroupField', '2012-02-06 12:42:32', '2012-02-06 14:08:06', 'EditableCheckboxGroupField8', 'Why do you ride', NULL, 8, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(96, 9, 5, 1, 1, 1, 'EditableRadioField', '2012-02-06 12:49:33', '2012-02-06 14:08:06', 'EditableRadioField9', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 9, 1, 1, NULL, 'a:0:{}', 'a:1:{s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(97, 10, 4, 1, 1, 1, 'EditableTextField', '2012-02-06 12:52:51', '2012-02-06 14:08:06', 'EditableTextField10', 'Comments', NULL, 10, 0, 1, NULL, 'a:0:{}', 'a:4:{s:9:MinLength;s:0:;s:9:MaxLength;s:0:;s:4:Rows;s:1:5;s:10:ShowOnLoad;s:4:Show;}', NULL, 59);
INSERT INTO `EditableFormField_versions` VALUES(98, 11, 1, 0, 4, 0, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-10 15:12:01', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(99, 11, 2, 0, 4, 0, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-10 15:12:01', 'EditableTextField11', NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(100, 11, 3, 1, 4, 4, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-10 15:12:47', 'EditableTextField11', 'Name', NULL, 1, 1, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:1:"1";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(101, 12, 1, 0, 4, 0, 'EditableEmailField', '2012-10-10 15:13:22', '2012-10-10 15:13:22', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(102, 12, 2, 0, 4, 0, 'EditableEmailField', '2012-10-10 15:13:22', '2012-10-10 15:13:22', 'EditableEmailField12', NULL, NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(103, 13, 1, 0, 4, 0, 'EditableDropdown', '2012-10-10 15:13:46', '2012-10-10 15:13:46', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(104, 13, 2, 0, 4, 0, 'EditableDropdown', '2012-10-10 15:13:46', '2012-10-10 15:13:46', 'EditableDropdown13', NULL, NULL, 3, 0, 0, NULL, NULL, NULL, NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(105, 14, 1, 0, 4, 0, 'EditableCheckboxGroupField', '2012-10-10 15:15:56', '2012-10-10 15:15:56', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(106, 14, 2, 0, 4, 0, 'EditableCheckboxGroupField', '2012-10-10 15:15:56', '2012-10-10 15:15:56', 'EditableCheckboxGroupField14', NULL, NULL, 4, 0, 0, NULL, NULL, NULL, NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(107, 11, 4, 1, 4, 4, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-10 15:16:56', 'EditableTextField11', 'Name', NULL, 1, 1, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:1:"1";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(108, 12, 3, 1, 4, 4, 'EditableEmailField', '2012-10-10 15:13:22', '2012-10-10 15:16:56', 'EditableEmailField12', 'Email', NULL, 2, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(109, 13, 3, 1, 4, 4, 'EditableDropdown', '2012-10-10 15:13:46', '2012-10-10 15:16:56', 'EditableDropdown13', 'How often do you bike?', NULL, 3, 1, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(110, 14, 3, 1, 4, 4, 'EditableCheckboxGroupField', '2012-10-10 15:15:56', '2012-10-10 15:16:56', 'EditableCheckboxGroupField14', 'Why do you ride?', NULL, 4, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(111, 15, 1, 0, 4, 0, 'EditableRadioField', '2012-10-10 15:17:17', '2012-10-10 15:17:17', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(112, 15, 2, 0, 4, 0, 'EditableRadioField', '2012-10-10 15:17:17', '2012-10-10 15:17:17', 'EditableRadioField15', NULL, NULL, 5, 0, 0, NULL, NULL, NULL, NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(113, 16, 1, 0, 4, 0, 'EditableRadioField', '2012-10-10 15:18:04', '2012-10-10 15:18:04', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(114, 16, 2, 0, 4, 0, 'EditableRadioField', '2012-10-10 15:18:04', '2012-10-10 15:18:04', 'EditableRadioField16', NULL, NULL, 6, 0, 0, NULL, NULL, NULL, NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(115, 17, 1, 0, 4, 0, 'EditableTextField', '2012-10-10 15:18:11', '2012-10-10 15:18:11', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `EditableFormField_versions` VALUES(116, 17, 2, 0, 4, 0, 'EditableTextField', '2012-10-10 15:18:11', '2012-10-10 15:18:11', 'EditableTextField17', NULL, NULL, 7, 0, 0, NULL, NULL, NULL, NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(117, 11, 5, 1, 4, 4, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-10 15:18:27', 'EditableTextField11', 'Name', NULL, 1, 1, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:1:"1";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(118, 12, 4, 1, 4, 4, 'EditableEmailField', '2012-10-10 15:13:22', '2012-10-10 15:18:27', 'EditableEmailField12', 'Email', NULL, 2, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(119, 13, 4, 1, 4, 4, 'EditableDropdown', '2012-10-10 15:13:46', '2012-10-10 15:18:27', 'EditableDropdown13', 'How often do you bike?', NULL, 3, 1, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(120, 14, 4, 1, 4, 4, 'EditableCheckboxGroupField', '2012-10-10 15:15:56', '2012-10-10 15:18:27', 'EditableCheckboxGroupField14', 'Why do you ride?', NULL, 4, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(121, 15, 3, 1, 4, 4, 'EditableRadioField', '2012-10-10 15:17:17', '2012-10-10 15:18:27', 'EditableRadioField15', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 5, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(122, 17, 3, 1, 4, 4, 'EditableTextField', '2012-10-10 15:18:11', '2012-10-10 15:18:27', 'EditableTextField17', 'Comments', NULL, 7, 0, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:2:"10";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(123, 11, 6, 1, 4, 4, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-10 15:18:47', 'EditableTextField11', 'Name', NULL, 1, 1, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:1:"1";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(124, 12, 5, 1, 4, 4, 'EditableEmailField', '2012-10-10 15:13:22', '2012-10-10 15:18:47', 'EditableEmailField12', 'Email', NULL, 2, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(125, 13, 5, 1, 4, 4, 'EditableDropdown', '2012-10-10 15:13:46', '2012-10-10 15:18:47', 'EditableDropdown13', 'How often do you bike?', NULL, 3, 1, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(126, 14, 5, 1, 4, 4, 'EditableCheckboxGroupField', '2012-10-10 15:15:56', '2012-10-10 15:18:47', 'EditableCheckboxGroupField14', 'Why do you ride?', NULL, 4, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(127, 15, 4, 1, 4, 4, 'EditableRadioField', '2012-10-10 15:17:17', '2012-10-10 15:18:47', 'EditableRadioField15', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 5, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(128, 17, 4, 1, 4, 4, 'EditableTextField', '2012-10-10 15:18:11', '2012-10-10 15:18:47', 'EditableTextField17', 'Comments', NULL, 7, 0, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:2:"10";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(129, 11, 7, 1, 4, 4, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-10 15:22:17', 'EditableTextField11', 'Name', NULL, 1, 1, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:1:"1";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(130, 12, 6, 1, 4, 4, 'EditableEmailField', '2012-10-10 15:13:22', '2012-10-10 15:22:17', 'EditableEmailField12', 'Email', NULL, 2, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(131, 13, 6, 1, 4, 4, 'EditableDropdown', '2012-10-10 15:13:46', '2012-10-10 15:22:17', 'EditableDropdown13', 'How often do you bike?', NULL, 3, 1, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(132, 14, 6, 1, 4, 4, 'EditableCheckboxGroupField', '2012-10-10 15:15:56', '2012-10-10 15:22:17', 'EditableCheckboxGroupField14', 'Why do you ride?', NULL, 4, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(133, 15, 5, 1, 4, 4, 'EditableRadioField', '2012-10-10 15:17:17', '2012-10-10 15:22:17', 'EditableRadioField15', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 5, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(134, 17, 5, 1, 4, 4, 'EditableTextField', '2012-10-10 15:18:11', '2012-10-10 15:22:18', 'EditableTextField17', 'Comments', NULL, 7, 0, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:2:"10";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(135, 11, 8, 1, 4, 4, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-10 15:22:49', 'EditableTextField11', 'Name', NULL, 1, 1, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:1:"1";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(136, 12, 7, 1, 4, 4, 'EditableEmailField', '2012-10-10 15:13:22', '2012-10-10 15:22:49', 'EditableEmailField12', 'Email', NULL, 2, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(137, 13, 7, 1, 4, 4, 'EditableDropdown', '2012-10-10 15:13:46', '2012-10-10 15:22:49', 'EditableDropdown13', 'How often do you bike?', NULL, 3, 1, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(138, 14, 7, 1, 4, 4, 'EditableCheckboxGroupField', '2012-10-10 15:15:56', '2012-10-10 15:22:49', 'EditableCheckboxGroupField14', 'Why do you ride?', NULL, 4, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(139, 15, 6, 1, 4, 4, 'EditableRadioField', '2012-10-10 15:17:17', '2012-10-10 15:22:49', 'EditableRadioField15', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 5, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(140, 17, 6, 1, 4, 4, 'EditableTextField', '2012-10-10 15:18:11', '2012-10-10 15:22:49', 'EditableTextField17', 'Comments', NULL, 7, 0, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:2:"10";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(141, 11, 9, 1, 4, 4, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-10 15:26:27', 'EditableTextField11', 'Name', NULL, 1, 1, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:1:"1";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(142, 12, 8, 1, 4, 4, 'EditableEmailField', '2012-10-10 15:13:22', '2012-10-10 15:26:27', 'EditableEmailField12', 'Email', NULL, 2, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(143, 13, 8, 1, 4, 4, 'EditableDropdown', '2012-10-10 15:13:46', '2012-10-10 15:26:27', 'EditableDropdown13', 'How often do you bike?', NULL, 3, 1, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(144, 14, 8, 1, 4, 4, 'EditableCheckboxGroupField', '2012-10-10 15:15:56', '2012-10-10 15:26:27', 'EditableCheckboxGroupField14', 'Why do you ride?', NULL, 4, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(145, 15, 7, 1, 4, 4, 'EditableRadioField', '2012-10-10 15:17:17', '2012-10-10 15:26:27', 'EditableRadioField15', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 5, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(146, 17, 7, 1, 4, 4, 'EditableTextField', '2012-10-10 15:18:11', '2012-10-10 15:26:27', 'EditableTextField17', 'Comments', NULL, 7, 0, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:2:"10";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(147, 11, 10, 1, 4, 4, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-10 16:11:31', 'EditableTextField11', 'Name', NULL, 1, 1, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:1:"1";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(148, 12, 9, 1, 4, 4, 'EditableEmailField', '2012-10-10 15:13:22', '2012-10-10 16:11:31', 'EditableEmailField12', 'Email', NULL, 2, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(149, 13, 9, 1, 4, 4, 'EditableDropdown', '2012-10-10 15:13:46', '2012-10-10 16:11:31', 'EditableDropdown13', 'How often do you bike?', NULL, 3, 1, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(150, 14, 9, 1, 4, 4, 'EditableCheckboxGroupField', '2012-10-10 15:15:56', '2012-10-10 16:11:31', 'EditableCheckboxGroupField14', 'Why do you ride?', NULL, 4, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(151, 15, 8, 1, 4, 4, 'EditableRadioField', '2012-10-10 15:17:17', '2012-10-10 16:11:31', 'EditableRadioField15', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 5, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(152, 17, 8, 1, 4, 4, 'EditableTextField', '2012-10-10 15:18:11', '2012-10-10 16:11:31', 'EditableTextField17', 'Comments', NULL, 7, 0, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:2:"10";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(153, 11, 11, 1, 4, 4, 'EditableTextField', '2012-10-10 15:12:01', '2012-10-12 11:19:38', 'EditableTextField11', 'Name', NULL, 1, 1, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:1:"1";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(154, 12, 10, 1, 4, 4, 'EditableEmailField', '2012-10-10 15:13:22', '2012-10-12 11:19:38', 'EditableEmailField12', 'Email', NULL, 2, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(155, 13, 10, 1, 4, 4, 'EditableDropdown', '2012-10-10 15:13:46', '2012-10-12 11:19:38', 'EditableDropdown13', 'How often do you bike?', NULL, 3, 1, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(156, 14, 10, 1, 4, 4, 'EditableCheckboxGroupField', '2012-10-10 15:15:56', '2012-10-12 11:19:38', 'EditableCheckboxGroupField14', 'Why do you ride?', NULL, 4, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(157, 15, 9, 1, 4, 4, 'EditableRadioField', '2012-10-10 15:17:17', '2012-10-12 11:19:38', 'EditableRadioField15', 'How do you feel about Demoville''s cycle lanes and paths', NULL, 5, 0, 0, NULL, 'a:0:{}', 'a:3:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);
INSERT INTO `EditableFormField_versions` VALUES(158, 17, 9, 1, 4, 4, 'EditableTextField', '2012-10-10 15:18:11', '2012-10-12 11:19:38', 'EditableTextField17', 'Comments', NULL, 7, 0, 0, NULL, 'a:0:{}', 'a:6:{s:10:"ExtraClass";s:0:"";s:10:"RightTitle";s:0:"";s:9:"MinLength";s:0:"";s:9:"MaxLength";s:0:"";s:4:"Rows";s:2:"10";s:10:"ShowOnLoad";s:4:"Show";}', NULL, 67);

-- --------------------------------------------------------

--
-- Table structure for table `EditableOption`
--

CREATE TABLE `EditableOption` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EditableOption') CHARACTER SET utf8 DEFAULT 'EditableOption',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `EditableOption`
--

INSERT INTO `EditableOption` VALUES(1, 'EditableOption', '2012-02-06 12:40:07', '2012-02-06 14:08:06', 'option1', 'Every day', 0, 1, 10, 6);
INSERT INTO `EditableOption` VALUES(2, 'EditableOption', '2012-02-06 12:40:12', '2012-02-06 14:08:06', 'option2', 'Every other day', 0, 2, 10, 6);
INSERT INTO `EditableOption` VALUES(3, 'EditableOption', '2012-02-06 12:40:18', '2012-02-06 14:08:06', 'option3', 'Once a week', 0, 3, 10, 6);
INSERT INTO `EditableOption` VALUES(4, 'EditableOption', '2012-02-06 12:40:24', '2012-02-06 14:08:06', 'option4', 'Once a month', 0, 4, 10, 6);
INSERT INTO `EditableOption` VALUES(6, 'EditableOption', '2012-02-06 12:42:51', '2012-02-06 14:08:06', 'option6', 'Commuting', 0, 1, 8, 8);
INSERT INTO `EditableOption` VALUES(7, 'EditableOption', '2012-02-06 12:43:16', '2012-02-06 14:08:06', 'option7', 'Leisure', 0, 2, 8, 8);
INSERT INTO `EditableOption` VALUES(8, 'EditableOption', '2012-02-06 12:43:39', '2012-02-06 14:08:06', 'option8', 'Training', 0, 3, 8, 8);
INSERT INTO `EditableOption` VALUES(9, 'EditableOption', '2012-02-06 12:50:34', '2012-02-06 14:08:06', 'option9', 'Not sufficient', 0, 1, 5, 9);
INSERT INTO `EditableOption` VALUES(10, 'EditableOption', '2012-02-06 12:50:41', '2012-02-06 14:08:06', 'option10', 'Adequate', 0, 2, 5, 9);
INSERT INTO `EditableOption` VALUES(11, 'EditableOption', '2012-02-06 12:51:09', '2012-02-06 14:08:06', 'option11', 'Very good', 0, 3, 5, 9);
INSERT INTO `EditableOption` VALUES(12, 'EditableOption', '2012-10-10 15:14:01', '2012-10-12 11:19:38', 'option12', 'Every day', 0, 1, 10, 13);
INSERT INTO `EditableOption` VALUES(13, 'EditableOption', '2012-10-10 15:14:16', '2012-10-12 11:19:38', 'option13', 'Every other day', 0, 2, 10, 13);
INSERT INTO `EditableOption` VALUES(14, 'EditableOption', '2012-10-10 15:14:21', '2012-10-12 11:19:38', 'option14', 'Once a week', 0, 3, 10, 13);
INSERT INTO `EditableOption` VALUES(15, 'EditableOption', '2012-10-10 15:14:26', '2012-10-12 11:19:38', 'option15', 'Once a month', 0, 4, 10, 13);
INSERT INTO `EditableOption` VALUES(17, 'EditableOption', '2012-10-10 15:16:05', '2012-10-12 11:19:38', 'option17', 'Commuting', 0, 1, 10, 14);
INSERT INTO `EditableOption` VALUES(18, 'EditableOption', '2012-10-10 15:16:12', '2012-10-12 11:19:38', 'option18', 'Leisure', 0, 2, 10, 14);
INSERT INTO `EditableOption` VALUES(19, 'EditableOption', '2012-10-10 15:16:17', '2012-10-12 11:19:38', 'option19', 'Training', 0, 3, 10, 14);
INSERT INTO `EditableOption` VALUES(21, 'EditableOption', '2012-10-10 15:17:21', '2012-10-12 11:19:38', 'option21', 'Not sufficient', 0, 1, 9, 15);
INSERT INTO `EditableOption` VALUES(22, 'EditableOption', '2012-10-10 15:17:30', '2012-10-12 11:19:38', 'option22', 'Adequate', 0, 2, 9, 15);
INSERT INTO `EditableOption` VALUES(23, 'EditableOption', '2012-10-10 15:17:43', '2012-10-12 11:19:38', 'option23', 'Very good', 0, 3, 9, 15);

-- --------------------------------------------------------

--
-- Table structure for table `EditableOption_Live`
--

CREATE TABLE `EditableOption_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EditableOption') CHARACTER SET utf8 DEFAULT 'EditableOption',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `EditableOption_Live`
--

INSERT INTO `EditableOption_Live` VALUES(1, 'EditableOption', '2012-02-06 12:40:07', '2012-02-06 14:08:06', 'option1', 'Every day', 0, 1, 10, 6);
INSERT INTO `EditableOption_Live` VALUES(2, 'EditableOption', '2012-02-06 12:40:12', '2012-02-06 14:08:06', 'option2', 'Every other day', 0, 2, 10, 6);
INSERT INTO `EditableOption_Live` VALUES(3, 'EditableOption', '2012-02-06 12:40:18', '2012-02-06 14:08:06', 'option3', 'Once a week', 0, 3, 10, 6);
INSERT INTO `EditableOption_Live` VALUES(4, 'EditableOption', '2012-02-06 12:40:24', '2012-02-06 14:08:06', 'option4', 'Once a month', 0, 4, 10, 6);
INSERT INTO `EditableOption_Live` VALUES(6, 'EditableOption', '2012-02-06 12:42:51', '2012-02-06 14:08:06', 'option6', 'Commuting', 0, 1, 8, 8);
INSERT INTO `EditableOption_Live` VALUES(7, 'EditableOption', '2012-02-06 12:43:16', '2012-02-06 14:08:06', 'option7', 'Leisure', 0, 2, 8, 8);
INSERT INTO `EditableOption_Live` VALUES(8, 'EditableOption', '2012-02-06 12:43:39', '2012-02-06 14:08:06', 'option8', 'Training', 0, 3, 8, 8);
INSERT INTO `EditableOption_Live` VALUES(9, 'EditableOption', '2012-02-06 12:50:34', '2012-02-06 14:08:06', 'option9', 'Not sufficient', 0, 1, 5, 9);
INSERT INTO `EditableOption_Live` VALUES(10, 'EditableOption', '2012-02-06 12:50:41', '2012-02-06 14:08:06', 'option10', 'Adequate', 0, 2, 5, 9);
INSERT INTO `EditableOption_Live` VALUES(11, 'EditableOption', '2012-02-06 12:51:09', '2012-02-06 14:08:06', 'option11', 'Very good', 0, 3, 5, 9);
INSERT INTO `EditableOption_Live` VALUES(12, 'EditableOption', '2012-10-10 15:14:01', '2012-10-12 11:34:02', 'option12', 'Every day', 0, 1, 10, 13);
INSERT INTO `EditableOption_Live` VALUES(13, 'EditableOption', '2012-10-10 15:14:16', '2012-10-12 11:34:02', 'option13', 'Every other day', 0, 2, 10, 13);
INSERT INTO `EditableOption_Live` VALUES(14, 'EditableOption', '2012-10-10 15:14:21', '2012-10-12 11:34:02', 'option14', 'Once a week', 0, 3, 10, 13);
INSERT INTO `EditableOption_Live` VALUES(15, 'EditableOption', '2012-10-10 15:14:26', '2012-10-12 11:34:02', 'option15', 'Once a month', 0, 4, 10, 13);
INSERT INTO `EditableOption_Live` VALUES(17, 'EditableOption', '2012-10-10 15:16:05', '2012-10-12 11:34:02', 'option17', 'Commuting', 0, 1, 10, 14);
INSERT INTO `EditableOption_Live` VALUES(18, 'EditableOption', '2012-10-10 15:16:12', '2012-10-12 11:34:02', 'option18', 'Leisure', 0, 2, 10, 14);
INSERT INTO `EditableOption_Live` VALUES(19, 'EditableOption', '2012-10-10 15:16:17', '2012-10-12 11:34:02', 'option19', 'Training', 0, 3, 10, 14);
INSERT INTO `EditableOption_Live` VALUES(21, 'EditableOption', '2012-10-10 15:17:21', '2012-10-12 11:34:02', 'option21', 'Not sufficient', 0, 1, 9, 15);
INSERT INTO `EditableOption_Live` VALUES(22, 'EditableOption', '2012-10-10 15:17:30', '2012-10-12 11:34:02', 'option22', 'Adequate', 0, 2, 9, 15);
INSERT INTO `EditableOption_Live` VALUES(23, 'EditableOption', '2012-10-10 15:17:43', '2012-10-12 11:34:02', 'option23', 'Very good', 0, 3, 9, 15);

-- --------------------------------------------------------

--
-- Table structure for table `EditableOption_versions`
--

CREATE TABLE `EditableOption_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('EditableOption') CHARACTER SET utf8 DEFAULT 'EditableOption',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`),
  KEY `RecordID_Version` (`RecordID`,`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=184 ;

--
-- Dumping data for table `EditableOption_versions`
--

INSERT INTO `EditableOption_versions` VALUES(1, 1, 1, 0, 1, 0, 'EditableOption', '2012-02-06 12:40:07', '2012-02-06 12:40:07', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(2, 1, 2, 0, 1, 0, 'EditableOption', '2012-02-06 12:40:07', '2012-02-06 12:40:07', 'option1', NULL, 0, 1, 6);
INSERT INTO `EditableOption_versions` VALUES(3, 2, 1, 0, 1, 0, 'EditableOption', '2012-02-06 12:40:12', '2012-02-06 12:40:12', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(4, 2, 2, 0, 1, 0, 'EditableOption', '2012-02-06 12:40:12', '2012-02-06 12:40:12', 'option2', NULL, 0, 2, 6);
INSERT INTO `EditableOption_versions` VALUES(5, 3, 1, 0, 1, 0, 'EditableOption', '2012-02-06 12:40:18', '2012-02-06 12:40:18', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(6, 3, 2, 0, 1, 0, 'EditableOption', '2012-02-06 12:40:18', '2012-02-06 12:40:18', 'option3', NULL, 0, 3, 6);
INSERT INTO `EditableOption_versions` VALUES(7, 4, 1, 0, 1, 0, 'EditableOption', '2012-02-06 12:40:24', '2012-02-06 12:40:24', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(8, 4, 2, 0, 1, 0, 'EditableOption', '2012-02-06 12:40:24', '2012-02-06 12:40:24', 'option4', NULL, 0, 4, 6);
INSERT INTO `EditableOption_versions` VALUES(9, 5, 1, 0, 1, 0, 'EditableOption', '2012-02-06 12:40:39', '2012-02-06 12:40:39', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(10, 5, 2, 0, 1, 0, 'EditableOption', '2012-02-06 12:40:39', '2012-02-06 12:40:39', 'option5', NULL, 0, 5, 6);
INSERT INTO `EditableOption_versions` VALUES(11, 1, 3, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:07', '2012-02-06 12:40:59', 'option1', 'Every day', 0, 1, 6);
INSERT INTO `EditableOption_versions` VALUES(12, 2, 3, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:12', '2012-02-06 12:40:59', 'option2', 'Every other day', 0, 2, 6);
INSERT INTO `EditableOption_versions` VALUES(13, 3, 3, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:18', '2012-02-06 12:40:59', 'option3', 'Once a week', 0, 3, 6);
INSERT INTO `EditableOption_versions` VALUES(14, 4, 3, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:24', '2012-02-06 12:40:59', 'option4', 'Once a month', 0, 4, 6);
INSERT INTO `EditableOption_versions` VALUES(15, 5, 3, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:39', '2012-02-06 12:40:59', 'option5', NULL, 0, 5, 6);
INSERT INTO `EditableOption_versions` VALUES(16, 1, 4, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:07', '2012-02-06 12:41:19', 'option1', 'Every day', 0, 1, 6);
INSERT INTO `EditableOption_versions` VALUES(17, 2, 4, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:12', '2012-02-06 12:41:19', 'option2', 'Every other day', 0, 2, 6);
INSERT INTO `EditableOption_versions` VALUES(18, 3, 4, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:18', '2012-02-06 12:41:19', 'option3', 'Once a week', 0, 3, 6);
INSERT INTO `EditableOption_versions` VALUES(19, 4, 4, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:24', '2012-02-06 12:41:19', 'option4', 'Once a month', 0, 4, 6);
INSERT INTO `EditableOption_versions` VALUES(20, 6, 1, 0, 1, 0, 'EditableOption', '2012-02-06 12:42:51', '2012-02-06 12:42:51', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(21, 6, 2, 0, 1, 0, 'EditableOption', '2012-02-06 12:42:51', '2012-02-06 12:42:51', 'option6', NULL, 0, 1, 8);
INSERT INTO `EditableOption_versions` VALUES(22, 7, 1, 0, 1, 0, 'EditableOption', '2012-02-06 12:43:16', '2012-02-06 12:43:16', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(23, 7, 2, 0, 1, 0, 'EditableOption', '2012-02-06 12:43:16', '2012-02-06 12:43:16', 'option7', NULL, 0, 2, 8);
INSERT INTO `EditableOption_versions` VALUES(24, 8, 1, 0, 1, 0, 'EditableOption', '2012-02-06 12:43:39', '2012-02-06 12:43:39', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(25, 8, 2, 0, 1, 0, 'EditableOption', '2012-02-06 12:43:39', '2012-02-06 12:43:39', 'option8', NULL, 0, 3, 8);
INSERT INTO `EditableOption_versions` VALUES(26, 1, 5, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:07', '2012-02-06 12:44:05', 'option1', 'Every day', 0, 1, 6);
INSERT INTO `EditableOption_versions` VALUES(27, 2, 5, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:12', '2012-02-06 12:44:05', 'option2', 'Every other day', 0, 2, 6);
INSERT INTO `EditableOption_versions` VALUES(28, 3, 5, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:18', '2012-02-06 12:44:05', 'option3', 'Once a week', 0, 3, 6);
INSERT INTO `EditableOption_versions` VALUES(29, 4, 5, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:24', '2012-02-06 12:44:05', 'option4', 'Once a month', 0, 4, 6);
INSERT INTO `EditableOption_versions` VALUES(30, 6, 3, 1, 1, 1, 'EditableOption', '2012-02-06 12:42:51', '2012-02-06 12:44:05', 'option6', 'Commuting', 0, 1, 8);
INSERT INTO `EditableOption_versions` VALUES(31, 7, 3, 1, 1, 1, 'EditableOption', '2012-02-06 12:43:16', '2012-02-06 12:44:05', 'option7', 'Leisure', 0, 2, 8);
INSERT INTO `EditableOption_versions` VALUES(32, 8, 3, 1, 1, 1, 'EditableOption', '2012-02-06 12:43:39', '2012-02-06 12:44:05', 'option8', 'Training', 0, 3, 8);
INSERT INTO `EditableOption_versions` VALUES(33, 1, 6, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:07', '2012-02-06 12:44:11', 'option1', 'Every day', 0, 1, 6);
INSERT INTO `EditableOption_versions` VALUES(34, 2, 6, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:12', '2012-02-06 12:44:11', 'option2', 'Every other day', 0, 2, 6);
INSERT INTO `EditableOption_versions` VALUES(35, 3, 6, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:18', '2012-02-06 12:44:11', 'option3', 'Once a week', 0, 3, 6);
INSERT INTO `EditableOption_versions` VALUES(36, 4, 6, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:24', '2012-02-06 12:44:11', 'option4', 'Once a month', 0, 4, 6);
INSERT INTO `EditableOption_versions` VALUES(37, 6, 4, 1, 1, 1, 'EditableOption', '2012-02-06 12:42:51', '2012-02-06 12:44:11', 'option6', 'Commuting', 0, 1, 8);
INSERT INTO `EditableOption_versions` VALUES(38, 7, 4, 1, 1, 1, 'EditableOption', '2012-02-06 12:43:16', '2012-02-06 12:44:11', 'option7', 'Leisure', 0, 2, 8);
INSERT INTO `EditableOption_versions` VALUES(39, 8, 4, 1, 1, 1, 'EditableOption', '2012-02-06 12:43:39', '2012-02-06 12:44:11', 'option8', 'Training', 0, 3, 8);
INSERT INTO `EditableOption_versions` VALUES(40, 1, 7, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:07', '2012-02-06 12:48:58', 'option1', 'Every day', 0, 1, 6);
INSERT INTO `EditableOption_versions` VALUES(41, 2, 7, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:12', '2012-02-06 12:48:58', 'option2', 'Every other day', 0, 2, 6);
INSERT INTO `EditableOption_versions` VALUES(42, 3, 7, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:18', '2012-02-06 12:48:58', 'option3', 'Once a week', 0, 3, 6);
INSERT INTO `EditableOption_versions` VALUES(43, 4, 7, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:24', '2012-02-06 12:48:58', 'option4', 'Once a month', 0, 4, 6);
INSERT INTO `EditableOption_versions` VALUES(44, 6, 5, 1, 1, 1, 'EditableOption', '2012-02-06 12:42:51', '2012-02-06 12:48:58', 'option6', 'Commuting', 0, 1, 8);
INSERT INTO `EditableOption_versions` VALUES(45, 7, 5, 1, 1, 1, 'EditableOption', '2012-02-06 12:43:16', '2012-02-06 12:48:58', 'option7', 'Leisure', 0, 2, 8);
INSERT INTO `EditableOption_versions` VALUES(46, 8, 5, 1, 1, 1, 'EditableOption', '2012-02-06 12:43:39', '2012-02-06 12:48:58', 'option8', 'Training', 0, 3, 8);
INSERT INTO `EditableOption_versions` VALUES(47, 9, 1, 0, 1, 0, 'EditableOption', '2012-02-06 12:50:34', '2012-02-06 12:50:34', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(48, 9, 2, 0, 1, 0, 'EditableOption', '2012-02-06 12:50:34', '2012-02-06 12:50:34', 'option9', NULL, 0, 1, 9);
INSERT INTO `EditableOption_versions` VALUES(49, 10, 1, 0, 1, 0, 'EditableOption', '2012-02-06 12:50:41', '2012-02-06 12:50:41', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(50, 10, 2, 0, 1, 0, 'EditableOption', '2012-02-06 12:50:41', '2012-02-06 12:50:41', 'option10', NULL, 0, 2, 9);
INSERT INTO `EditableOption_versions` VALUES(51, 11, 1, 0, 1, 0, 'EditableOption', '2012-02-06 12:51:09', '2012-02-06 12:51:09', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(52, 11, 2, 0, 1, 0, 'EditableOption', '2012-02-06 12:51:09', '2012-02-06 12:51:09', 'option11', NULL, 0, 3, 9);
INSERT INTO `EditableOption_versions` VALUES(53, 1, 8, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:07', '2012-02-06 12:52:41', 'option1', 'Every day', 0, 1, 6);
INSERT INTO `EditableOption_versions` VALUES(54, 2, 8, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:12', '2012-02-06 12:52:41', 'option2', 'Every other day', 0, 2, 6);
INSERT INTO `EditableOption_versions` VALUES(55, 3, 8, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:18', '2012-02-06 12:52:41', 'option3', 'Once a week', 0, 3, 6);
INSERT INTO `EditableOption_versions` VALUES(56, 4, 8, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:24', '2012-02-06 12:52:41', 'option4', 'Once a month', 0, 4, 6);
INSERT INTO `EditableOption_versions` VALUES(57, 6, 6, 1, 1, 1, 'EditableOption', '2012-02-06 12:42:51', '2012-02-06 12:52:41', 'option6', 'Commuting', 0, 1, 8);
INSERT INTO `EditableOption_versions` VALUES(58, 7, 6, 1, 1, 1, 'EditableOption', '2012-02-06 12:43:16', '2012-02-06 12:52:41', 'option7', 'Leisure', 0, 2, 8);
INSERT INTO `EditableOption_versions` VALUES(59, 8, 6, 1, 1, 1, 'EditableOption', '2012-02-06 12:43:39', '2012-02-06 12:52:41', 'option8', 'Training', 0, 3, 8);
INSERT INTO `EditableOption_versions` VALUES(60, 9, 3, 1, 1, 1, 'EditableOption', '2012-02-06 12:50:34', '2012-02-06 12:52:41', 'option9', 'Not sufficient', 0, 1, 9);
INSERT INTO `EditableOption_versions` VALUES(61, 10, 3, 1, 1, 1, 'EditableOption', '2012-02-06 12:50:41', '2012-02-06 12:52:41', 'option10', 'Adequate', 0, 2, 9);
INSERT INTO `EditableOption_versions` VALUES(62, 11, 3, 1, 1, 1, 'EditableOption', '2012-02-06 12:51:09', '2012-02-06 12:52:41', 'option11', 'Very good', 0, 3, 9);
INSERT INTO `EditableOption_versions` VALUES(63, 1, 9, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:07', '2012-02-06 12:53:10', 'option1', 'Every day', 0, 1, 6);
INSERT INTO `EditableOption_versions` VALUES(64, 2, 9, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:12', '2012-02-06 12:53:10', 'option2', 'Every other day', 0, 2, 6);
INSERT INTO `EditableOption_versions` VALUES(65, 3, 9, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:18', '2012-02-06 12:53:10', 'option3', 'Once a week', 0, 3, 6);
INSERT INTO `EditableOption_versions` VALUES(66, 4, 9, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:24', '2012-02-06 12:53:10', 'option4', 'Once a month', 0, 4, 6);
INSERT INTO `EditableOption_versions` VALUES(67, 6, 7, 1, 1, 1, 'EditableOption', '2012-02-06 12:42:51', '2012-02-06 12:53:10', 'option6', 'Commuting', 0, 1, 8);
INSERT INTO `EditableOption_versions` VALUES(68, 7, 7, 1, 1, 1, 'EditableOption', '2012-02-06 12:43:16', '2012-02-06 12:53:10', 'option7', 'Leisure', 0, 2, 8);
INSERT INTO `EditableOption_versions` VALUES(69, 8, 7, 1, 1, 1, 'EditableOption', '2012-02-06 12:43:39', '2012-02-06 12:53:10', 'option8', 'Training', 0, 3, 8);
INSERT INTO `EditableOption_versions` VALUES(70, 9, 4, 1, 1, 1, 'EditableOption', '2012-02-06 12:50:34', '2012-02-06 12:53:10', 'option9', 'Not sufficient', 0, 1, 9);
INSERT INTO `EditableOption_versions` VALUES(71, 10, 4, 1, 1, 1, 'EditableOption', '2012-02-06 12:50:41', '2012-02-06 12:53:10', 'option10', 'Adequate', 0, 2, 9);
INSERT INTO `EditableOption_versions` VALUES(72, 11, 4, 1, 1, 1, 'EditableOption', '2012-02-06 12:51:09', '2012-02-06 12:53:10', 'option11', 'Very good', 0, 3, 9);
INSERT INTO `EditableOption_versions` VALUES(73, 1, 10, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:07', '2012-02-06 14:08:06', 'option1', 'Every day', 0, 1, 6);
INSERT INTO `EditableOption_versions` VALUES(74, 2, 10, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:12', '2012-02-06 14:08:06', 'option2', 'Every other day', 0, 2, 6);
INSERT INTO `EditableOption_versions` VALUES(75, 3, 10, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:18', '2012-02-06 14:08:06', 'option3', 'Once a week', 0, 3, 6);
INSERT INTO `EditableOption_versions` VALUES(76, 4, 10, 1, 1, 1, 'EditableOption', '2012-02-06 12:40:24', '2012-02-06 14:08:06', 'option4', 'Once a month', 0, 4, 6);
INSERT INTO `EditableOption_versions` VALUES(77, 6, 8, 1, 1, 1, 'EditableOption', '2012-02-06 12:42:51', '2012-02-06 14:08:06', 'option6', 'Commuting', 0, 1, 8);
INSERT INTO `EditableOption_versions` VALUES(78, 7, 8, 1, 1, 1, 'EditableOption', '2012-02-06 12:43:16', '2012-02-06 14:08:06', 'option7', 'Leisure', 0, 2, 8);
INSERT INTO `EditableOption_versions` VALUES(79, 8, 8, 1, 1, 1, 'EditableOption', '2012-02-06 12:43:39', '2012-02-06 14:08:06', 'option8', 'Training', 0, 3, 8);
INSERT INTO `EditableOption_versions` VALUES(80, 9, 5, 1, 1, 1, 'EditableOption', '2012-02-06 12:50:34', '2012-02-06 14:08:06', 'option9', 'Not sufficient', 0, 1, 9);
INSERT INTO `EditableOption_versions` VALUES(81, 10, 5, 1, 1, 1, 'EditableOption', '2012-02-06 12:50:41', '2012-02-06 14:08:06', 'option10', 'Adequate', 0, 2, 9);
INSERT INTO `EditableOption_versions` VALUES(82, 11, 5, 1, 1, 1, 'EditableOption', '2012-02-06 12:51:09', '2012-02-06 14:08:06', 'option11', 'Very good', 0, 3, 9);
INSERT INTO `EditableOption_versions` VALUES(83, 12, 1, 0, 4, 0, 'EditableOption', '2012-10-10 15:14:01', '2012-10-10 15:14:01', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(84, 12, 2, 0, 4, 0, 'EditableOption', '2012-10-10 15:14:01', '2012-10-10 15:14:01', 'option12', NULL, 0, 1, 13);
INSERT INTO `EditableOption_versions` VALUES(85, 13, 1, 0, 4, 0, 'EditableOption', '2012-10-10 15:14:16', '2012-10-10 15:14:16', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(86, 13, 2, 0, 4, 0, 'EditableOption', '2012-10-10 15:14:16', '2012-10-10 15:14:16', 'option13', NULL, 0, 2, 13);
INSERT INTO `EditableOption_versions` VALUES(87, 14, 1, 0, 4, 0, 'EditableOption', '2012-10-10 15:14:21', '2012-10-10 15:14:21', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(88, 14, 2, 0, 4, 0, 'EditableOption', '2012-10-10 15:14:21', '2012-10-10 15:14:21', 'option14', NULL, 0, 3, 13);
INSERT INTO `EditableOption_versions` VALUES(89, 15, 1, 0, 4, 0, 'EditableOption', '2012-10-10 15:14:26', '2012-10-10 15:14:26', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(90, 15, 2, 0, 4, 0, 'EditableOption', '2012-10-10 15:14:26', '2012-10-10 15:14:26', 'option15', NULL, 0, 4, 13);
INSERT INTO `EditableOption_versions` VALUES(91, 16, 1, 0, 4, 0, 'EditableOption', '2012-10-10 15:14:32', '2012-10-10 15:14:32', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(92, 16, 2, 0, 4, 0, 'EditableOption', '2012-10-10 15:14:32', '2012-10-10 15:14:32', 'option16', NULL, 0, 5, 13);
INSERT INTO `EditableOption_versions` VALUES(93, 17, 1, 0, 4, 0, 'EditableOption', '2012-10-10 15:16:05', '2012-10-10 15:16:05', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(94, 17, 2, 0, 4, 0, 'EditableOption', '2012-10-10 15:16:05', '2012-10-10 15:16:05', 'option17', NULL, 0, 1, 14);
INSERT INTO `EditableOption_versions` VALUES(95, 18, 1, 0, 4, 0, 'EditableOption', '2012-10-10 15:16:12', '2012-10-10 15:16:12', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(96, 18, 2, 0, 4, 0, 'EditableOption', '2012-10-10 15:16:12', '2012-10-10 15:16:12', 'option18', NULL, 0, 2, 14);
INSERT INTO `EditableOption_versions` VALUES(97, 19, 1, 0, 4, 0, 'EditableOption', '2012-10-10 15:16:17', '2012-10-10 15:16:17', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(98, 19, 2, 0, 4, 0, 'EditableOption', '2012-10-10 15:16:17', '2012-10-10 15:16:17', 'option19', NULL, 0, 3, 14);
INSERT INTO `EditableOption_versions` VALUES(99, 20, 1, 0, 4, 0, 'EditableOption', '2012-10-10 15:16:36', '2012-10-10 15:16:36', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(100, 20, 2, 0, 4, 0, 'EditableOption', '2012-10-10 15:16:36', '2012-10-10 15:16:36', 'option20', NULL, 0, 4, 14);
INSERT INTO `EditableOption_versions` VALUES(101, 12, 3, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:01', '2012-10-10 15:16:56', 'option12', 'Every day', 0, 1, 13);
INSERT INTO `EditableOption_versions` VALUES(102, 13, 3, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:16', '2012-10-10 15:16:56', 'option13', 'Every other day', 0, 2, 13);
INSERT INTO `EditableOption_versions` VALUES(103, 14, 3, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:21', '2012-10-10 15:16:56', 'option14', 'Once a week', 0, 3, 13);
INSERT INTO `EditableOption_versions` VALUES(104, 15, 3, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:26', '2012-10-10 15:16:56', 'option15', 'Once a month', 0, 4, 13);
INSERT INTO `EditableOption_versions` VALUES(105, 17, 3, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:05', '2012-10-10 15:16:56', 'option17', 'Commuting', 0, 1, 14);
INSERT INTO `EditableOption_versions` VALUES(106, 18, 3, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:12', '2012-10-10 15:16:56', 'option18', 'Leisure', 0, 2, 14);
INSERT INTO `EditableOption_versions` VALUES(107, 19, 3, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:17', '2012-10-10 15:16:56', 'option19', 'Training', 0, 3, 14);
INSERT INTO `EditableOption_versions` VALUES(108, 21, 1, 0, 4, 0, 'EditableOption', '2012-10-10 15:17:21', '2012-10-10 15:17:21', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(109, 21, 2, 0, 4, 0, 'EditableOption', '2012-10-10 15:17:21', '2012-10-10 15:17:21', 'option21', NULL, 0, 1, 15);
INSERT INTO `EditableOption_versions` VALUES(110, 22, 1, 0, 4, 0, 'EditableOption', '2012-10-10 15:17:30', '2012-10-10 15:17:30', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(111, 22, 2, 0, 4, 0, 'EditableOption', '2012-10-10 15:17:30', '2012-10-10 15:17:30', 'option22', NULL, 0, 2, 15);
INSERT INTO `EditableOption_versions` VALUES(112, 23, 1, 0, 4, 0, 'EditableOption', '2012-10-10 15:17:43', '2012-10-10 15:17:43', NULL, NULL, 0, 0, 0);
INSERT INTO `EditableOption_versions` VALUES(113, 23, 2, 0, 4, 0, 'EditableOption', '2012-10-10 15:17:43', '2012-10-10 15:17:43', 'option23', NULL, 0, 3, 15);
INSERT INTO `EditableOption_versions` VALUES(114, 12, 4, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:01', '2012-10-10 15:18:27', 'option12', 'Every day', 0, 1, 13);
INSERT INTO `EditableOption_versions` VALUES(115, 13, 4, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:16', '2012-10-10 15:18:27', 'option13', 'Every other day', 0, 2, 13);
INSERT INTO `EditableOption_versions` VALUES(116, 14, 4, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:21', '2012-10-10 15:18:27', 'option14', 'Once a week', 0, 3, 13);
INSERT INTO `EditableOption_versions` VALUES(117, 15, 4, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:26', '2012-10-10 15:18:27', 'option15', 'Once a month', 0, 4, 13);
INSERT INTO `EditableOption_versions` VALUES(118, 17, 4, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:05', '2012-10-10 15:18:27', 'option17', 'Commuting', 0, 1, 14);
INSERT INTO `EditableOption_versions` VALUES(119, 18, 4, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:12', '2012-10-10 15:18:27', 'option18', 'Leisure', 0, 2, 14);
INSERT INTO `EditableOption_versions` VALUES(120, 19, 4, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:17', '2012-10-10 15:18:27', 'option19', 'Training', 0, 3, 14);
INSERT INTO `EditableOption_versions` VALUES(121, 21, 3, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:21', '2012-10-10 15:18:27', 'option21', 'Not sufficient', 0, 1, 15);
INSERT INTO `EditableOption_versions` VALUES(122, 22, 3, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:30', '2012-10-10 15:18:27', 'option22', 'Adequate', 0, 2, 15);
INSERT INTO `EditableOption_versions` VALUES(123, 23, 3, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:43', '2012-10-10 15:18:27', 'option23', 'Very good', 0, 3, 15);
INSERT INTO `EditableOption_versions` VALUES(124, 12, 5, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:01', '2012-10-10 15:18:47', 'option12', 'Every day', 0, 1, 13);
INSERT INTO `EditableOption_versions` VALUES(125, 13, 5, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:16', '2012-10-10 15:18:47', 'option13', 'Every other day', 0, 2, 13);
INSERT INTO `EditableOption_versions` VALUES(126, 14, 5, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:21', '2012-10-10 15:18:47', 'option14', 'Once a week', 0, 3, 13);
INSERT INTO `EditableOption_versions` VALUES(127, 15, 5, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:26', '2012-10-10 15:18:47', 'option15', 'Once a month', 0, 4, 13);
INSERT INTO `EditableOption_versions` VALUES(128, 17, 5, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:05', '2012-10-10 15:18:47', 'option17', 'Commuting', 0, 1, 14);
INSERT INTO `EditableOption_versions` VALUES(129, 18, 5, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:12', '2012-10-10 15:18:47', 'option18', 'Leisure', 0, 2, 14);
INSERT INTO `EditableOption_versions` VALUES(130, 19, 5, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:17', '2012-10-10 15:18:47', 'option19', 'Training', 0, 3, 14);
INSERT INTO `EditableOption_versions` VALUES(131, 21, 4, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:21', '2012-10-10 15:18:47', 'option21', 'Not sufficient', 0, 1, 15);
INSERT INTO `EditableOption_versions` VALUES(132, 22, 4, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:30', '2012-10-10 15:18:47', 'option22', 'Adequate', 0, 2, 15);
INSERT INTO `EditableOption_versions` VALUES(133, 23, 4, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:43', '2012-10-10 15:18:47', 'option23', 'Very good', 0, 3, 15);
INSERT INTO `EditableOption_versions` VALUES(134, 12, 6, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:01', '2012-10-10 15:22:17', 'option12', 'Every day', 0, 1, 13);
INSERT INTO `EditableOption_versions` VALUES(135, 13, 6, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:16', '2012-10-10 15:22:17', 'option13', 'Every other day', 0, 2, 13);
INSERT INTO `EditableOption_versions` VALUES(136, 14, 6, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:21', '2012-10-10 15:22:17', 'option14', 'Once a week', 0, 3, 13);
INSERT INTO `EditableOption_versions` VALUES(137, 15, 6, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:26', '2012-10-10 15:22:17', 'option15', 'Once a month', 0, 4, 13);
INSERT INTO `EditableOption_versions` VALUES(138, 17, 6, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:05', '2012-10-10 15:22:17', 'option17', 'Commuting', 0, 1, 14);
INSERT INTO `EditableOption_versions` VALUES(139, 18, 6, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:12', '2012-10-10 15:22:17', 'option18', 'Leisure', 0, 2, 14);
INSERT INTO `EditableOption_versions` VALUES(140, 19, 6, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:17', '2012-10-10 15:22:17', 'option19', 'Training', 0, 3, 14);
INSERT INTO `EditableOption_versions` VALUES(141, 21, 5, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:21', '2012-10-10 15:22:18', 'option21', 'Not sufficient', 0, 1, 15);
INSERT INTO `EditableOption_versions` VALUES(142, 22, 5, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:30', '2012-10-10 15:22:18', 'option22', 'Adequate', 0, 2, 15);
INSERT INTO `EditableOption_versions` VALUES(143, 23, 5, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:43', '2012-10-10 15:22:18', 'option23', 'Very good', 0, 3, 15);
INSERT INTO `EditableOption_versions` VALUES(144, 12, 7, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:01', '2012-10-10 15:22:49', 'option12', 'Every day', 0, 1, 13);
INSERT INTO `EditableOption_versions` VALUES(145, 13, 7, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:16', '2012-10-10 15:22:49', 'option13', 'Every other day', 0, 2, 13);
INSERT INTO `EditableOption_versions` VALUES(146, 14, 7, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:21', '2012-10-10 15:22:49', 'option14', 'Once a week', 0, 3, 13);
INSERT INTO `EditableOption_versions` VALUES(147, 15, 7, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:26', '2012-10-10 15:22:49', 'option15', 'Once a month', 0, 4, 13);
INSERT INTO `EditableOption_versions` VALUES(148, 17, 7, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:05', '2012-10-10 15:22:49', 'option17', 'Commuting', 0, 1, 14);
INSERT INTO `EditableOption_versions` VALUES(149, 18, 7, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:12', '2012-10-10 15:22:49', 'option18', 'Leisure', 0, 2, 14);
INSERT INTO `EditableOption_versions` VALUES(150, 19, 7, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:17', '2012-10-10 15:22:49', 'option19', 'Training', 0, 3, 14);
INSERT INTO `EditableOption_versions` VALUES(151, 21, 6, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:21', '2012-10-10 15:22:49', 'option21', 'Not sufficient', 0, 1, 15);
INSERT INTO `EditableOption_versions` VALUES(152, 22, 6, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:30', '2012-10-10 15:22:49', 'option22', 'Adequate', 0, 2, 15);
INSERT INTO `EditableOption_versions` VALUES(153, 23, 6, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:43', '2012-10-10 15:22:49', 'option23', 'Very good', 0, 3, 15);
INSERT INTO `EditableOption_versions` VALUES(154, 12, 8, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:01', '2012-10-10 15:26:27', 'option12', 'Every day', 0, 1, 13);
INSERT INTO `EditableOption_versions` VALUES(155, 13, 8, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:16', '2012-10-10 15:26:27', 'option13', 'Every other day', 0, 2, 13);
INSERT INTO `EditableOption_versions` VALUES(156, 14, 8, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:21', '2012-10-10 15:26:27', 'option14', 'Once a week', 0, 3, 13);
INSERT INTO `EditableOption_versions` VALUES(157, 15, 8, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:26', '2012-10-10 15:26:27', 'option15', 'Once a month', 0, 4, 13);
INSERT INTO `EditableOption_versions` VALUES(158, 17, 8, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:05', '2012-10-10 15:26:27', 'option17', 'Commuting', 0, 1, 14);
INSERT INTO `EditableOption_versions` VALUES(159, 18, 8, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:12', '2012-10-10 15:26:27', 'option18', 'Leisure', 0, 2, 14);
INSERT INTO `EditableOption_versions` VALUES(160, 19, 8, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:17', '2012-10-10 15:26:27', 'option19', 'Training', 0, 3, 14);
INSERT INTO `EditableOption_versions` VALUES(161, 21, 7, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:21', '2012-10-10 15:26:27', 'option21', 'Not sufficient', 0, 1, 15);
INSERT INTO `EditableOption_versions` VALUES(162, 22, 7, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:30', '2012-10-10 15:26:27', 'option22', 'Adequate', 0, 2, 15);
INSERT INTO `EditableOption_versions` VALUES(163, 23, 7, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:43', '2012-10-10 15:26:27', 'option23', 'Very good', 0, 3, 15);
INSERT INTO `EditableOption_versions` VALUES(164, 12, 9, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:01', '2012-10-10 16:11:31', 'option12', 'Every day', 0, 1, 13);
INSERT INTO `EditableOption_versions` VALUES(165, 13, 9, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:16', '2012-10-10 16:11:31', 'option13', 'Every other day', 0, 2, 13);
INSERT INTO `EditableOption_versions` VALUES(166, 14, 9, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:21', '2012-10-10 16:11:31', 'option14', 'Once a week', 0, 3, 13);
INSERT INTO `EditableOption_versions` VALUES(167, 15, 9, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:26', '2012-10-10 16:11:31', 'option15', 'Once a month', 0, 4, 13);
INSERT INTO `EditableOption_versions` VALUES(168, 17, 9, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:05', '2012-10-10 16:11:31', 'option17', 'Commuting', 0, 1, 14);
INSERT INTO `EditableOption_versions` VALUES(169, 18, 9, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:12', '2012-10-10 16:11:31', 'option18', 'Leisure', 0, 2, 14);
INSERT INTO `EditableOption_versions` VALUES(170, 19, 9, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:17', '2012-10-10 16:11:31', 'option19', 'Training', 0, 3, 14);
INSERT INTO `EditableOption_versions` VALUES(171, 21, 8, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:21', '2012-10-10 16:11:31', 'option21', 'Not sufficient', 0, 1, 15);
INSERT INTO `EditableOption_versions` VALUES(172, 22, 8, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:30', '2012-10-10 16:11:31', 'option22', 'Adequate', 0, 2, 15);
INSERT INTO `EditableOption_versions` VALUES(173, 23, 8, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:43', '2012-10-10 16:11:31', 'option23', 'Very good', 0, 3, 15);
INSERT INTO `EditableOption_versions` VALUES(174, 12, 10, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:01', '2012-10-12 11:19:38', 'option12', 'Every day', 0, 1, 13);
INSERT INTO `EditableOption_versions` VALUES(175, 13, 10, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:16', '2012-10-12 11:19:38', 'option13', 'Every other day', 0, 2, 13);
INSERT INTO `EditableOption_versions` VALUES(176, 14, 10, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:21', '2012-10-12 11:19:38', 'option14', 'Once a week', 0, 3, 13);
INSERT INTO `EditableOption_versions` VALUES(177, 15, 10, 1, 4, 4, 'EditableOption', '2012-10-10 15:14:26', '2012-10-12 11:19:38', 'option15', 'Once a month', 0, 4, 13);
INSERT INTO `EditableOption_versions` VALUES(178, 17, 10, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:05', '2012-10-12 11:19:38', 'option17', 'Commuting', 0, 1, 14);
INSERT INTO `EditableOption_versions` VALUES(179, 18, 10, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:12', '2012-10-12 11:19:38', 'option18', 'Leisure', 0, 2, 14);
INSERT INTO `EditableOption_versions` VALUES(180, 19, 10, 1, 4, 4, 'EditableOption', '2012-10-10 15:16:17', '2012-10-12 11:19:38', 'option19', 'Training', 0, 3, 14);
INSERT INTO `EditableOption_versions` VALUES(181, 21, 9, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:21', '2012-10-12 11:19:38', 'option21', 'Not sufficient', 0, 1, 15);
INSERT INTO `EditableOption_versions` VALUES(182, 22, 9, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:30', '2012-10-12 11:19:38', 'option22', 'Adequate', 0, 2, 15);
INSERT INTO `EditableOption_versions` VALUES(183, 23, 9, 1, 4, 4, 'EditableOption', '2012-10-10 15:17:43', '2012-10-12 11:19:38', 'option23', 'Very good', 0, 3, 15);

-- --------------------------------------------------------

--
-- Table structure for table `Email_BounceRecord`
--

CREATE TABLE `Email_BounceRecord` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Email_BounceRecord') CHARACTER SET utf8 DEFAULT 'Email_BounceRecord',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `BounceEmail` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `BounceTime` datetime DEFAULT NULL,
  `BounceMessage` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Email_BounceRecord`
--


-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage`
--

CREATE TABLE `ErrorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage`
--

INSERT INTO `ErrorPage` VALUES(4, 404);
INSERT INTO `ErrorPage` VALUES(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_Live`
--

CREATE TABLE `ErrorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage_Live`
--

INSERT INTO `ErrorPage_Live` VALUES(4, 404);
INSERT INTO `ErrorPage_Live` VALUES(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_versions`
--

CREATE TABLE `ErrorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ErrorPage_versions`
--

INSERT INTO `ErrorPage_versions` VALUES(3, 4, 2, 404);
INSERT INTO `ErrorPage_versions` VALUES(4, 5, 2, 500);

-- --------------------------------------------------------

--
-- Table structure for table `File`
--

CREATE TABLE `File` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Image','Folder','File','Image_Cached') CHARACTER SET utf8 DEFAULT 'Image',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Filename` mediumtext CHARACTER SET utf8,
  `Content` mediumtext CHARACTER SET utf8,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  `Secured` tinyint(1) NOT NULL DEFAULT '0',
  `CurrentVersionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `CurrentVersionID` (`CurrentVersionID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `File`
--

INSERT INTO `File` VALUES(1, 'Image', '2011-12-15 14:48:31', '2012-01-10 13:15:19', 'shea.jpeg', 'shea.jpeg', 'assets/shea.jpeg', NULL, 0, 1, 0, 1, 0, 0);
INSERT INTO `File` VALUES(2, 'Folder', '2011-12-16 13:07:54', '2011-12-19 12:03:19', 'Downloads', 'Downloads', 'assets/Downloads/', NULL, 0, 1, 0, 0, 1, 0);
INSERT INTO `File` VALUES(3, 'File', '2011-12-16 13:08:57', '2011-12-16 13:21:38', 'php-cheat-sheet-v2.pdf', 'PHP cheat sheet', 'assets/Downloads/php-cheat-sheet-v2.pdf', NULL, 0, 1, 2, 1, 0, 0);
INSERT INTO `File` VALUES(4, 'File', '2011-12-16 13:08:57', '2011-12-16 13:21:26', 'mysql-cheat-sheet-v1.pdf', 'MySQL cheat sheet', 'assets/Downloads/mysql-cheat-sheet-v1.pdf', NULL, 0, 1, 2, 1, 0, 0);
INSERT INTO `File` VALUES(5, 'File', '2011-12-16 13:08:57', '2011-12-16 13:22:03', 'search-engine-optimization-starter-guide.pdf', 'Search Engine Optimization guide', 'assets/Downloads/search-engine-optimization-starter-guide.pdf', NULL, 0, 1, 2, 1, 0, 0);
INSERT INTO `File` VALUES(6, 'Image', '2011-12-16 13:32:34', '2011-12-21 14:23:07', 'Viva-La-Nature-5-15.jpg', 'Viva-La-Nature-5-15.jpg', 'assets/Viva-La-Nature-5-15.jpg', NULL, 0, 1, 0, 1, 0, 0);
INSERT INTO `File` VALUES(7, 'Image', '2011-12-16 13:36:26', '2011-12-16 13:36:26', 'Untitled.jpg', 'Untitled', 'assets/Downloads/Untitled.jpg', NULL, 0, 1, 2, 0, 0, 0);
INSERT INTO `File` VALUES(8, 'Folder', '2011-12-16 15:22:38', '2011-12-16 15:22:38', 'news-articles', 'news-articles', 'assets/news-articles/', NULL, 0, 1, 0, 0, 0, 0);
INSERT INTO `File` VALUES(9, 'Folder', '2011-12-16 15:22:38', '2011-12-16 15:22:38', 'thumbnails', 'thumbnails', 'assets/news-articles/thumbnails/', NULL, 0, 1, 8, 0, 0, 0);
INSERT INTO `File` VALUES(10, 'Image', '2011-12-16 15:22:38', '2011-12-16 15:22:38', 'DocklandsHero.jpg', 'DocklandsHero', 'assets/news-articles/thumbnails/DocklandsHero.jpg', NULL, 0, 1, 9, 1, 0, 0);
INSERT INTO `File` VALUES(11, 'Image', '2011-12-20 09:48:44', '2011-12-20 09:48:44', 'Viva-La-Nature-5-7.jpg', 'Viva La Nature 5 7', 'assets/news-articles/thumbnails/Viva-La-Nature-5-7.jpg', NULL, 0, 1, 9, 1, 0, 0);
INSERT INTO `File` VALUES(12, 'Folder', '2011-12-22 13:42:09', '2011-12-22 13:42:09', 'event-images', 'event-images', 'assets/event-images/', NULL, 0, 1, 0, 0, 0, 0);
INSERT INTO `File` VALUES(13, 'Image', '2011-12-22 13:42:09', '2011-12-22 13:42:09', 'citp.jpg', 'citp', 'assets/event-images/citp.jpg', NULL, 0, 1, 12, 1, 0, 0);
INSERT INTO `File` VALUES(14, 'Image', '2011-12-22 14:06:02', '2011-12-22 14:06:02', 'renewEaster2011.jpg', 'renewEaster2011', 'assets/event-images/renewEaster2011.jpg', NULL, 0, 1, 12, 1, 0, 0);
INSERT INTO `File` VALUES(15, 'Folder', '2012-02-06 12:05:46', '2012-02-06 12:05:46', 'survey-page-images', 'survey-page-images', 'assets/survey-page-images/', NULL, 0, 1, 0, 0, 0, 0);
INSERT INTO `File` VALUES(16, 'Image', '2012-02-06 12:05:46', '2012-02-06 12:05:46', 'cyclists.jpg', 'cyclists', 'assets/survey-page-images/cyclists.jpg', NULL, 0, 1, 15, 1, 0, 0);
INSERT INTO `File` VALUES(17, 'Image', '2012-02-06 15:48:59', '2012-02-06 15:48:59', 'PerthCityPanorama-943x345.jpg', 'PerthCityPanorama-943x345.jpg', 'assets/PerthCityPanorama-943x345.jpg', NULL, 0, 1, 0, 1, 0, 0);
INSERT INTO `File` VALUES(18, 'Image', '2012-02-06 15:53:17', '2012-02-17 14:19:55', 'PBNintegration.jpg', 'PBNintegration.jpg', 'assets/PBNintegration.jpg', NULL, 0, 1, 0, 1, 0, 0);
INSERT INTO `File` VALUES(19, 'Image', '2012-02-17 10:35:34', '2012-02-17 10:35:34', 'test.jpg', 'test', 'assets/Downloads/test.jpg', NULL, 0, 1, 2, 0, 0, 0);
INSERT INTO `File` VALUES(20, 'Image', '2012-02-17 14:02:22', '2012-02-17 14:07:57', 'shea.jpeg', 'shea.jpeg', 'assets/news-articles/shea.jpeg', NULL, 0, 1, 8, 1, 0, 0);
INSERT INTO `File` VALUES(21, 'Image', '2012-02-17 14:05:26', '2012-02-17 14:05:26', 'Test-Image.jpg', 'Test Image', 'assets/news-articles/Test-Image.jpg', NULL, 0, 1, 8, 0, 0, 0);
INSERT INTO `File` VALUES(22, 'Folder', '2012-10-10 13:49:06', '2012-10-10 13:49:06', 'assets', 'assets', 'assets/assets/', NULL, 0, 1, 0, 4, 0, 0);
INSERT INTO `File` VALUES(23, 'Image', '2012-10-10 13:49:06', '2012-10-10 13:49:06', 'placeholder.gif', 'placeholder', 'assets/assets/placeholder.gif', NULL, 0, 1, 22, 4, 0, 1);
INSERT INTO `File` VALUES(24, 'Folder', '2012-10-10 15:29:28', '2012-10-10 15:29:28', 'form-page-images', 'form-page-images', 'assets/form-page-images/', NULL, 0, 1, 0, 4, 0, 0);
INSERT INTO `File` VALUES(26, 'Folder', '2012-10-10 15:41:32', '2012-10-10 15:41:32', 'Uploads', 'Uploads', 'assets/Uploads/', NULL, 0, 1, 0, 4, 0, 0);
INSERT INTO `File` VALUES(29, 'Folder', '2012-10-10 17:48:05', '2012-10-11 17:10:15', 'zen-galleries', 'zen-galleries', 'assets/assets/zen-galleries/', NULL, 0, 1, 22, 4, 0, 0);
INSERT INTO `File` VALUES(30, 'Folder', '2012-10-10 17:48:05', '2012-10-11 17:10:41', 'zen-gallery-68', 'zen-gallery-68', 'assets/assets/zen-galleries/zen-gallery-68/', NULL, 0, 1, 29, 4, 0, 0);
INSERT INTO `File` VALUES(31, 'Image', '2012-10-10 17:48:05', '2012-10-11 17:10:41', '469x264.jpg', '469x264', 'assets/assets/zen-galleries/zen-gallery-68/469x264.jpg', NULL, 0, 1, 30, 4, 0, 3);
INSERT INTO `File` VALUES(32, 'Image', '2012-10-10 17:48:06', '2012-10-11 17:10:41', 'i-header-1.jpg', 'i header 1', 'assets/assets/zen-galleries/zen-gallery-68/i-header-1.jpg', NULL, 0, 1, 30, 4, 0, 4);
INSERT INTO `File` VALUES(33, 'Image', '2012-10-10 17:48:07', '2012-10-11 17:10:41', 'beautiful-city-of-melbourne.jpg', 'beautiful city of melbourne', 'assets/assets/zen-galleries/zen-gallery-68/beautiful-city-of-melbourne.jpg', NULL, 0, 1, 30, 4, 0, 5);
INSERT INTO `File` VALUES(34, 'Image', '2012-10-10 17:48:07', '2012-10-11 17:10:41', 'melbourne-1.jpg', 'melbourne 1', 'assets/assets/zen-galleries/zen-gallery-68/melbourne-1.jpg', NULL, 0, 1, 30, 4, 0, 6);
INSERT INTO `File` VALUES(35, 'Image', '2012-10-10 17:48:08', '2012-10-11 17:10:41', 'Melbourne-Skyline.16380852-std.jpg', 'Melbourne Skyline.16380852 std', 'assets/assets/zen-galleries/zen-gallery-68/Melbourne-Skyline.16380852-std.jpg', NULL, 0, 1, 30, 4, 0, 7);
INSERT INTO `File` VALUES(36, 'Image', '2012-10-10 17:48:09', '2012-10-11 17:10:41', 'melbourne-tram.jpg', 'melbourne tram', 'assets/assets/zen-galleries/zen-gallery-68/melbourne-tram.jpg', NULL, 0, 1, 30, 4, 0, 8);
INSERT INTO `File` VALUES(37, 'Image', '2012-10-10 17:48:10', '2012-10-11 17:10:41', 'melbourne-2.jpg', 'melbourne 2', 'assets/assets/zen-galleries/zen-gallery-68/melbourne-2.jpg', NULL, 0, 1, 30, 4, 0, 9);
INSERT INTO `File` VALUES(38, 'Image', '2012-10-10 17:48:10', '2012-10-11 17:10:41', 'melbourne-beach.jpg', 'melbourne beach', 'assets/assets/zen-galleries/zen-gallery-68/melbourne-beach.jpg', NULL, 0, 1, 30, 4, 0, 10);
INSERT INTO `File` VALUES(39, 'Image', '2012-10-10 17:48:11', '2012-10-11 17:10:41', 'melbourne.jpg', 'melbourne', 'assets/assets/zen-galleries/zen-gallery-68/melbourne.jpg', NULL, 0, 1, 30, 4, 0, 14);
INSERT INTO `File` VALUES(40, 'Image', '2012-10-10 17:48:12', '2012-10-11 17:10:41', 'photo-park.jpg', 'photo park', 'assets/assets/zen-galleries/zen-gallery-68/photo-park.jpg', NULL, 0, 1, 30, 4, 0, 12);
INSERT INTO `File` VALUES(41, 'Image', '2012-10-10 17:48:12', '2012-10-11 17:10:41', 'Sorry-Grandma-Melbourne-CBD-Melbourne-original.jpg', 'Sorry Grandma Melbourne CBD Melbourne original', 'assets/assets/zen-galleries/zen-gallery-68/Sorry-Grandma-Melbourne-CBD-Melbourne-original.jpg', NULL, 0, 1, 30, 4, 0, 13);
INSERT INTO `File` VALUES(43, 'Folder', '2012-10-11 10:29:51', '2012-10-11 17:11:09', 'zen-gallery-69', 'zen-gallery-69', 'assets/assets/zen-galleries/zen-gallery-69/', NULL, 0, 1, 29, 4, 0, 0);
INSERT INTO `File` VALUES(45, 'Folder', '2012-10-11 10:44:13', '2012-10-11 17:10:59', 'zen-gallery-70', 'zen-gallery-70', 'assets/assets/zen-galleries/zen-gallery-70/', NULL, 0, 1, 29, 4, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `FileVersion`
--

CREATE TABLE `FileVersion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('FileVersion') CHARACTER SET utf8 DEFAULT 'FileVersion',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `VersionNumber` int(11) NOT NULL DEFAULT '0',
  `Filename` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CreatorID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CreatorID` (`CreatorID`),
  KEY `FileID` (`FileID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `FileVersion`
--

INSERT INTO `FileVersion` VALUES(1, 'FileVersion', '2012-10-10 13:49:06', '2012-10-10 13:49:06', 1, '/assets/assets/_versions/23/placeholder.1.gif', 4, 23);
INSERT INTO `FileVersion` VALUES(3, 'FileVersion', '2012-10-10 17:48:05', '2012-10-11 17:10:41', 1, '/assets/assets/zen-galleries/zen-gallery-68/_versions/31/469x264.1.jpg', 4, 31);
INSERT INTO `FileVersion` VALUES(4, 'FileVersion', '2012-10-10 17:48:06', '2012-10-11 17:10:41', 1, '/assets/assets/zen-galleries/zen-gallery-68/_versions/32/i-header-1.1.jpg', 4, 32);
INSERT INTO `FileVersion` VALUES(5, 'FileVersion', '2012-10-10 17:48:07', '2012-10-11 17:10:41', 1, '/assets/assets/zen-galleries/zen-gallery-68/_versions/33/beautiful-city-of-melbourne.1.jpg', 4, 33);
INSERT INTO `FileVersion` VALUES(6, 'FileVersion', '2012-10-10 17:48:07', '2012-10-11 17:10:41', 1, '/assets/assets/zen-galleries/zen-gallery-68/_versions/34/melbourne-1.1.jpg', 4, 34);
INSERT INTO `FileVersion` VALUES(7, 'FileVersion', '2012-10-10 17:48:08', '2012-10-11 17:10:41', 1, '/assets/assets/zen-galleries/zen-gallery-68/_versions/35/Melbourne-Skyline.16380852-std.1.jpg', 4, 35);
INSERT INTO `FileVersion` VALUES(8, 'FileVersion', '2012-10-10 17:48:09', '2012-10-11 17:10:41', 1, '/assets/assets/zen-galleries/zen-gallery-68/_versions/36/melbourne-tram.1.jpg', 4, 36);
INSERT INTO `FileVersion` VALUES(9, 'FileVersion', '2012-10-10 17:48:10', '2012-10-11 17:10:41', 1, '/assets/assets/zen-galleries/zen-gallery-68/_versions/37/melbourne-2.1.jpg', 4, 37);
INSERT INTO `FileVersion` VALUES(10, 'FileVersion', '2012-10-10 17:48:10', '2012-10-11 17:10:41', 1, '/assets/assets/zen-galleries/zen-gallery-68/_versions/38/melbourne-beach.1.jpg', 4, 38);
INSERT INTO `FileVersion` VALUES(11, 'FileVersion', '2012-10-10 17:48:11', '2012-10-11 17:10:41', 1, '/assets/assets/zen-galleries/zen-gallery-68/_versions/39/melbourne.1.jpg', 4, 39);
INSERT INTO `FileVersion` VALUES(12, 'FileVersion', '2012-10-10 17:48:12', '2012-10-11 17:10:41', 1, '/assets/assets/zen-galleries/zen-gallery-68/_versions/40/photo-park.1.jpg', 4, 40);
INSERT INTO `FileVersion` VALUES(13, 'FileVersion', '2012-10-10 17:48:12', '2012-10-11 17:10:41', 1, '/assets/assets/zen-galleries/zen-gallery-68/_versions/41/Sorry-Grandma-Melbourne-CBD-Melbourne-original.1.jpg', 4, 41);
INSERT INTO `FileVersion` VALUES(14, 'FileVersion', '2012-10-11 17:08:55', '2012-10-11 17:10:41', 2, '/assets/assets/zen-galleries/zen-gallery-68/_versions/39/melbourne.2.jpg', 4, 39);

-- --------------------------------------------------------

--
-- Table structure for table `File_GroupPermissions`
--

CREATE TABLE `File_GroupPermissions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FileID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `File_GroupPermissions`
--

INSERT INTO `File_GroupPermissions` VALUES(1, 2, 1);
INSERT INTO `File_GroupPermissions` VALUES(2, 2, 3);
INSERT INTO `File_GroupPermissions` VALUES(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Group`
--

CREATE TABLE `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Group') CHARACTER SET utf8 DEFAULT 'Group',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `IPRestrictions` text,
  `HtmlEditorConfig` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Group`
--

INSERT INTO `Group` VALUES(1, 'Group', '2011-12-15 04:04:19', '2011-12-15 04:04:19', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, NULL, 0);
INSERT INTO `Group` VALUES(2, 'Group', '2011-12-15 04:04:19', '2012-02-17 14:17:37', 'Administrators', NULL, 'administrators', 0, 0, NULL, NULL, 0);
INSERT INTO `Group` VALUES(3, 'Group', '2011-12-19 10:33:33', '2011-12-19 10:33:57', 'Registered Users', NULL, 'registered-users', 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Members`
--

CREATE TABLE `Group_Members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Group_Members`
--

INSERT INTO `Group_Members` VALUES(2, 1, 2);
INSERT INTO `Group_Members` VALUES(3, 3, 3);
INSERT INTO `Group_Members` VALUES(4, 1, 1);
INSERT INTO `Group_Members` VALUES(5, 3, 1);
INSERT INTO `Group_Members` VALUES(6, 2, 1);
INSERT INTO `Group_Members` VALUES(7, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Roles`
--

CREATE TABLE `Group_Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Group_Roles`
--


-- --------------------------------------------------------

--
-- Table structure for table `ICSFeed`
--

CREATE TABLE `ICSFeed` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ICSFeed') CHARACTER SET utf8 DEFAULT 'ICSFeed',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CalendarID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CalendarID` (`CalendarID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ICSFeed`
--


-- --------------------------------------------------------

--
-- Table structure for table `ListingPage`
--

CREATE TABLE `ListingPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PerPage` int(11) NOT NULL DEFAULT '0',
  `Style` enum('Standard','A to Z') CHARACTER SET utf8 DEFAULT 'Standard',
  `SortBy` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `CustomSort` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `SortDir` enum('Ascending','Descending') CHARACTER SET utf8 DEFAULT 'Ascending',
  `ListType` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `ListingSourceID` int(11) NOT NULL DEFAULT '0',
  `Depth` int(11) NOT NULL DEFAULT '0',
  `ClearSource` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `StrictType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ContentType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CustomContentType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ListingTemplateID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ListingTemplateID` (`ListingTemplateID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `ListingPage`
--

INSERT INTO `ListingPage` VALUES(15, 10, NULL, 'Title', NULL, 'Ascending', 'File', 2, 1, 0, 1, NULL, NULL, 1);
INSERT INTO `ListingPage` VALUES(21, 3, 'Standard', 'Title', NULL, 'Ascending', 'LocalBusinessPage', 21, 1, 0, 0, NULL, NULL, 2);
INSERT INTO `ListingPage` VALUES(58, 10, 'Standard', 'CanEditType', NULL, 'Ascending', 'UserDefinedForm', 58, 1, 0, 1, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ListingPage_Live`
--

CREATE TABLE `ListingPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PerPage` int(11) NOT NULL DEFAULT '0',
  `Style` enum('Standard','A to Z') CHARACTER SET utf8 DEFAULT 'Standard',
  `SortBy` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `CustomSort` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `SortDir` enum('Ascending','Descending') CHARACTER SET utf8 DEFAULT 'Ascending',
  `ListType` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `ListingSourceID` int(11) NOT NULL DEFAULT '0',
  `Depth` int(11) NOT NULL DEFAULT '0',
  `ClearSource` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `StrictType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ContentType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CustomContentType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ListingTemplateID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ListingTemplateID` (`ListingTemplateID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `ListingPage_Live`
--

INSERT INTO `ListingPage_Live` VALUES(15, 10, NULL, 'Title', NULL, 'Ascending', 'File', 2, 1, 0, 1, NULL, NULL, 1);
INSERT INTO `ListingPage_Live` VALUES(21, 3, 'Standard', 'Title', NULL, 'Ascending', 'LocalBusinessPage', 21, 1, 0, 0, NULL, NULL, 2);
INSERT INTO `ListingPage_Live` VALUES(58, 10, 'Standard', 'CanEditType', NULL, 'Ascending', 'UserDefinedForm', 58, 1, 0, 1, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ListingPage_versions`
--

CREATE TABLE `ListingPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `PerPage` int(11) NOT NULL DEFAULT '0',
  `Style` enum('Standard','A to Z') CHARACTER SET utf8 DEFAULT 'Standard',
  `SortBy` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `CustomSort` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `SortDir` enum('Ascending','Descending') CHARACTER SET utf8 DEFAULT 'Ascending',
  `ListType` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `ListingSourceID` int(11) NOT NULL DEFAULT '0',
  `Depth` int(11) NOT NULL DEFAULT '0',
  `ClearSource` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `StrictType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ContentType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CustomContentType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ListingTemplateID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `ListingTemplateID` (`ListingTemplateID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `ListingPage_versions`
--

INSERT INTO `ListingPage_versions` VALUES(19, 21, 10, 10, 'Standard', 'Title', NULL, 'Ascending', 'LocalBusinessPage', 21, 1, 0, 0, NULL, NULL, 2);
INSERT INTO `ListingPage_versions` VALUES(20, 21, 11, 10, 'Standard', 'Title', NULL, 'Ascending', 'LocalBusinessPage', 21, 1, 0, 0, NULL, NULL, 2);
INSERT INTO `ListingPage_versions` VALUES(21, 21, 12, 3, 'Standard', 'Title', NULL, 'Ascending', 'LocalBusinessPage', 21, 1, 0, 0, NULL, NULL, 2);
INSERT INTO `ListingPage_versions` VALUES(22, 58, 1, 0, 'Standard', NULL, NULL, 'Ascending', NULL, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `ListingPage_versions` VALUES(23, 58, 2, 0, 'Standard', 'CanEditType', NULL, 'Ascending', 'AssignUsersToWorkflowAction', 0, 1, 0, 0, NULL, NULL, 0);
INSERT INTO `ListingPage_versions` VALUES(24, 58, 3, 0, 'Standard', 'AllowEditing', NULL, 'Ascending', 'UserDefinedForm', 0, 1, 0, 1, NULL, NULL, 3);
INSERT INTO `ListingPage_versions` VALUES(25, 58, 4, 0, 'Standard', 'CanEditType', NULL, 'Ascending', 'UserDefinedForm', 58, 1, 0, 1, NULL, NULL, 3);
INSERT INTO `ListingPage_versions` VALUES(26, 58, 5, 10, 'Standard', 'CanEditType', NULL, 'Ascending', 'UserDefinedForm', 58, 1, 0, 1, NULL, NULL, 3);
INSERT INTO `ListingPage_versions` VALUES(27, 58, 6, 10, 'Standard', 'CanEditType', NULL, 'Ascending', 'UserDefinedForm', 58, 1, 0, 1, NULL, NULL, 3);
INSERT INTO `ListingPage_versions` VALUES(28, 58, 7, 10, 'Standard', 'CanEditType', NULL, 'Ascending', 'UserDefinedForm', 58, 1, 0, 1, NULL, NULL, 3);
INSERT INTO `ListingPage_versions` VALUES(29, 21, 13, 3, 'Standard', 'Title', NULL, 'Ascending', 'LocalBusinessPage', 21, 1, 0, 0, NULL, NULL, 2);
INSERT INTO `ListingPage_versions` VALUES(30, 15, 14, 10, NULL, 'Title', NULL, 'Ascending', 'File', 2, 1, 0, 1, NULL, NULL, 1);
INSERT INTO `ListingPage_versions` VALUES(31, 58, 8, 10, 'Standard', 'CanEditType', NULL, 'Ascending', 'UserDefinedForm', 58, 1, 0, 1, NULL, NULL, 3);
INSERT INTO `ListingPage_versions` VALUES(32, 58, 9, 10, 'Standard', 'CanEditType', NULL, 'Ascending', 'UserDefinedForm', 58, 1, 0, 1, NULL, NULL, 3);
INSERT INTO `ListingPage_versions` VALUES(33, 58, 10, 10, 'Standard', 'CanEditType', NULL, 'Ascending', 'UserDefinedForm', 58, 1, 0, 1, NULL, NULL, 3);
INSERT INTO `ListingPage_versions` VALUES(34, 21, 14, 3, 'Standard', 'Title', NULL, 'Ascending', 'LocalBusinessPage', 21, 1, 0, 0, NULL, NULL, 2);
INSERT INTO `ListingPage_versions` VALUES(35, 21, 15, 3, 'Standard', 'Title', NULL, 'Ascending', 'LocalBusinessPage', 21, 1, 0, 0, NULL, NULL, 2);
INSERT INTO `ListingPage_versions` VALUES(36, 21, 16, 3, 'Standard', 'Title', NULL, 'Ascending', 'LocalBusinessPage', 21, 1, 0, 0, NULL, NULL, 2);
INSERT INTO `ListingPage_versions` VALUES(37, 21, 17, 3, 'Standard', 'Title', NULL, 'Ascending', 'LocalBusinessPage', 21, 1, 0, 0, NULL, NULL, 2);
INSERT INTO `ListingPage_versions` VALUES(38, 58, 11, 10, 'Standard', 'CanEditType', NULL, 'Ascending', 'UserDefinedForm', 58, 1, 0, 1, NULL, NULL, 3);
INSERT INTO `ListingPage_versions` VALUES(39, 58, 12, 10, 'Standard', 'CanEditType', NULL, 'Ascending', 'UserDefinedForm', 58, 1, 0, 1, NULL, NULL, 3);
INSERT INTO `ListingPage_versions` VALUES(40, 21, 18, 3, 'Standard', 'Title', NULL, 'Ascending', 'LocalBusinessPage', 21, 1, 0, 0, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ListingTemplate`
--

CREATE TABLE `ListingTemplate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ListingTemplate') CHARACTER SET utf8 DEFAULT 'ListingTemplate',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(127) CHARACTER SET utf8 DEFAULT NULL,
  `ItemTemplate` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ListingTemplate`
--

INSERT INTO `ListingTemplate` VALUES(1, 'ListingTemplate', '2011-12-16 13:14:32', '2011-12-16 13:29:05', 'Downloads', '<ul>\n<% control Items %>\n<li>\n<h4>$Title</h4>\n<p><a href=''$Link''>$Name</a> ($Size)</p>\n</li>\n<% end_control %>\n</ul>');
INSERT INTO `ListingTemplate` VALUES(2, 'ListingTemplate', '2011-12-16 17:35:20', '2012-02-06 14:23:53', 'Local Businesses', '<ul>\n<% control Items %>\n<li>\n<h3><a href=$Link>$TItle</a></h3>\n<div>$Content</div>\n<p><% if WebsiteURL %><a class=''more'' href=$WebsiteURL target=_blank>Visit Website</a> &nbsp;&nbsp;<% end_if %><a class=''more'' href=$Link>Read More</a></p>\n<div class=''hr''></div>\n</li>\n<% end_control %>\n</ul>\n\n<% if Items.MoreThanOnePage %>\n<div id=PageNumbers>\n<% if Items.NotLastPage %>\n<a class=next href=$Items.NextLink title=View the next page>Next</a>\n<% end_if %>\n<% if Items.NotFirstPage %>\n<a class=prev href=$Items.PrevLink title=View the previous page>Prev</a>\n<% end_if %>\n<span>\n<% control Items.PaginationSummary(5) %>\n<% if CurrentBool %>\n$PageNum\n<% else %>\n<a href=$Link title=View page number $PageNum>$PageNum</a>\n<% end_if %>\n<% end_control %>\n</span>\n\n</div>\n<% end_if %>');
INSERT INTO `ListingTemplate` VALUES(3, 'ListingTemplate', '2012-02-06 12:55:00', '2012-10-10 16:22:59', 'Have your say', '<% control Items %>\r\n<div>\r\n<h3><a href=''$Link''>$Title</a></h3>\r\n<p>\r\n<a href=''$Link''>\r\n<% with FormImage.SetWidth(160) %>\r\n<img class=''left''  src=''$Filename'' alt=''$Title'' />\r\n<% end_with %> \r\n</a>\r\n$Summary <br><a class=''more'' href=''$Link''>Read More</a></p>\r\n</div>\r\n<% end_control %>');

-- --------------------------------------------------------

--
-- Table structure for table `LocalBusiness`
--

CREATE TABLE `LocalBusiness` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LocalBusiness') CHARACTER SET utf8 DEFAULT 'LocalBusiness',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Description` text,
  `WebsiteURL` varchar(50) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Suburb` varchar(64) DEFAULT NULL,
  `State` varchar(64) DEFAULT NULL,
  `Postcode` int(11) NOT NULL DEFAULT '0',
  `Country` varchar(2) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Content` text,
  `WorkflowDefinitionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `LocalBusiness`
--

INSERT INTO `LocalBusiness` VALUES(1, 'LocalBusiness', '2011-12-16 16:49:13', '2011-12-16 17:58:08', 'You know, the one with all the well meaning rules that don''t work out in real life, uh, Christianity. He didn''t give you gay, did he? Did he?! I''ll be back. You can''t keep the Democrats out of the White House forever, and when they get in, I''m back on the streets, with all my criminal buddies. Shoplifting is a victimless crime. Like punching someone in the dark.', 'http://www.demobusiness.com', '23 Demo St', 'Demoslie', 'Demoera', 9283, 'AU', 'Demo Butchers', 'Books are useless! I only ever read one book, To Kill A Mockingbird, and it gave me absolutely no insight on how to kill mockingbirds! Sure it taught me not to judge a man by the color of his skin…but what good does *that* do me? I hope I didn''t brain my damage. Shoplifting is a victimless crime. Like punching someone in the dark.', 1);
INSERT INTO `LocalBusiness` VALUES(2, 'LocalBusiness', '2011-12-16 16:52:01', '2011-12-16 17:58:29', 'When will I learn? The answers to life''s problems aren''t at the bottom of a bottle, they''re on TV! Whoa, slow down there, maestro.', 'http://www.demosupplies.com', '82 Elm St', 'Northcote', 'Victoria', 3070, 'AU', 'Demo Supplies', 'here is the content!', 0);
INSERT INTO `LocalBusiness` VALUES(3, 'LocalBusiness', '2011-12-16 18:06:47', '2011-12-16 18:06:49', NULL, 'http://www.demonursery.com', NULL, NULL, NULL, 0, 'AF', 'Demo Nursery', 'No! Don''t jump! When the lights go out, it''s nobody''s business what goes on between two consenting adults. Now that the, uh, garbage ball is in space, Doctor, perhaps you can help me with my sexual inhibitions? You don''t know how to do any of those.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `LocalBusinessPage`
--

CREATE TABLE `LocalBusinessPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WebsiteURL` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Suburb` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `State` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `Postcode` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `Country` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `Lat` float NOT NULL DEFAULT '0',
  `Lng` float NOT NULL DEFAULT '0',
  `CreatedInFrontend` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `LocalBusinessPage`
--

INSERT INTO `LocalBusinessPage` VALUES(22, 'http://www.stuff.co.nz', '82 Elm St', 'Northcote', 'Victoria', '3070', 'AU', 0, 0, 0);
INSERT INTO `LocalBusinessPage` VALUES(23, 'http://www.silverstripe.com', NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage` VALUES(26, 'http://www.appliances.com', '97-99 Courtenay Place', 'Wellington', NULL, '6011', 'NZ', -41.2929, 174.779, 0);
INSERT INTO `LocalBusinessPage` VALUES(29, 'http://www.demovillewreckers.com.au', '222 Victoria Street', 'North Melbourne', 'Victoria', '0', 'AU', -37.8061, 144.959, 0);
INSERT INTO `LocalBusinessPage` VALUES(47, 'http://www.demoyum.com', '56 Elm St', 'Northcote', 'Victoria', '3070', 'AU', -37.7676, 144.995, 0);
INSERT INTO `LocalBusinessPage` VALUES(55, 'Testing workflow', 'Testing workflow', 'Testing workflow', 'Testing workflow', '234', 'NZ', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `LocalBusinessPage_Live`
--

CREATE TABLE `LocalBusinessPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WebsiteURL` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Suburb` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `State` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `Postcode` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `Country` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `Lat` float NOT NULL DEFAULT '0',
  `Lng` float NOT NULL DEFAULT '0',
  `CreatedInFrontend` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `LocalBusinessPage_Live`
--

INSERT INTO `LocalBusinessPage_Live` VALUES(22, 'http://www.stuff.co.nz', '82 Elm St', 'Northcote', 'Victoria', '3070', 'AU', -37.7675, 144.994, 0);
INSERT INTO `LocalBusinessPage_Live` VALUES(23, 'http://www.silverstripe.com', NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_Live` VALUES(26, 'http://www.appliances.com', '97-99 Courtenay Place', 'Wellington', NULL, '6011', 'NZ', -41.2929, 174.779, 0);
INSERT INTO `LocalBusinessPage_Live` VALUES(29, 'http://www.demovillewreckers.com.au', '222 Victoria Street', 'North Melbourne', 'Victoria', '0', 'AU', -37.8061, 144.959, 0);
INSERT INTO `LocalBusinessPage_Live` VALUES(47, 'http://www.demoyum.com', '56 Elm St', 'Northcote', 'Victoria', '3070', 'AU', -37.7676, 144.995, 0);
INSERT INTO `LocalBusinessPage_Live` VALUES(55, 'Testing workflow', 'Testing workflow', 'Testing workflow', 'Testing workflow', '234', 'NZ', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `LocalBusinessPage_versions`
--

CREATE TABLE `LocalBusinessPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WebsiteURL` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Suburb` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `State` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `Postcode` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `Country` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `Lat` float NOT NULL DEFAULT '0',
  `Lng` float NOT NULL DEFAULT '0',
  `CreatedInFrontend` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `LocalBusinessPage_versions`
--

INSERT INTO `LocalBusinessPage_versions` VALUES(8, 22, 6, 'http://www.stuff.co.nz', '82 Elm St', 'Northcote', 'Victoria', '3070', 'AU', 0, 0, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(9, 23, 3, 'http://www.silverstripe.com', NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(10, 26, 1, NULL, NULL, NULL, NULL, '0', NULL, 0, 0, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(11, 26, 2, 'www.appliances.com', '97-99 Courtenay Place', 'Wellington', NULL, '6011', 'NZ', -41.2929, 174.779, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(12, 26, 3, 'www.appliances.com', '97-99 Courtenay Place', 'Wellington', NULL, '6011', 'NZ', -41.2929, 174.779, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(13, 26, 4, 'http://www.appliances.com', '97-99 Courtenay Place', 'Wellington', NULL, '6011', 'NZ', -41.2929, 174.779, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(14, 28, 1, 'http://www.demovillewreckers.com.au', '222 Victoria Street', 'North Melbourne', 'Victoria', '0', 'AU', -37.8061, 144.959, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(15, 29, 1, 'http://www.demovillewreckers.com.au', '222 Victoria Street', 'North Melbourne', 'Victoria', '0', 'AU', -37.8061, 144.959, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(16, 30, 1, '123', '123', '123', NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(17, 31, 1, '123', '123', '123', NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(18, 33, 1, 'Shea', 'Shea', NULL, NULL, '0', 'AF', 0, 0, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(19, 34, 1, NULL, NULL, NULL, NULL, '0', NULL, 0, 0, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(20, 34, 2, NULL, NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(21, 35, 1, 'workflow please', NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 1);
INSERT INTO `LocalBusinessPage_versions` VALUES(22, 36, 1, 'workflow nice', NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(23, 37, 1, NULL, NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(24, 38, 1, NULL, NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(25, 39, 1, NULL, NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(26, 40, 1, NULL, NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(27, 41, 1, NULL, NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(28, 42, 1, NULL, NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(29, 29, 2, 'http://www.demovillewreckers.com.au', '222 Victoria Street', 'North Melbourne', 'Victoria', '0', 'AU', -37.8061, 144.959, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(30, 43, 1, NULL, NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(31, 44, 1, 'www.this.com', NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(32, 45, 1, NULL, NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(33, 46, 1, NULL, NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(34, 47, 1, 'http://www.demoyum.com', '56 Elm St', 'Northcote', 'Victoria', '3070', 'AU', -37.7676, 144.995, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(35, 22, 7, 'http://www.stuff.co.nz', '82 Elm St', 'Northcote', 'Victoria', '3070', 'AU', 0, 0, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(36, 23, 4, 'http://www.silverstripe.com', NULL, NULL, NULL, '0', 'AF', 14.4855, 121.04, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(37, 26, 5, 'http://www.appliances.com', '97-99 Courtenay Place', 'Wellington', NULL, '6011', 'NZ', -41.2929, 174.779, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(38, 29, 3, 'http://www.demovillewreckers.com.au', '222 Victoria Street', 'North Melbourne', 'Victoria', '0', 'AU', -37.8061, 144.959, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(39, 47, 2, 'http://www.demoyum.com', '56 Elm St', 'Northcote', 'Victoria', '3070', 'AU', -37.7676, 144.995, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(40, 55, 1, 'Testing workflow', 'Testing workflow', 'Testing workflow', 'Testing workflow', '234', 'NZ', 0, 0, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(41, 55, 2, 'Testing workflow', 'Testing workflow', 'Testing workflow', 'Testing workflow', '234', 'NZ', 0, 0, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(42, 71, 1, 'http://silverstripe.org', '680 Victoria St', 'North Melbourne', 'Victoria', '3051', 'AU', -37.8045, 144.943, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(43, 72, 1, NULL, '680 Victoria St, North Melbourne', 'Melbourne', 'VIC', '3051', 'US', -37.847, 144.98, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(44, 73, 1, NULL, NULL, NULL, NULL, NULL, 'US', 39.2323, -94.4145, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(45, 74, 1, NULL, NULL, NULL, NULL, NULL, 'US', 39.2323, -94.4145, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(46, 75, 1, NULL, NULL, NULL, NULL, NULL, 'US', 39.2323, -94.4145, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(47, 76, 1, NULL, NULL, NULL, NULL, NULL, 'US', 39.2323, -94.4145, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(48, 77, 1, NULL, NULL, NULL, NULL, NULL, 'US', 39.2323, -94.4145, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(49, 78, 1, NULL, NULL, NULL, NULL, NULL, 'US', 39.2323, -94.4145, 0);
INSERT INTO `LocalBusinessPage_versions` VALUES(50, 79, 1, NULL, NULL, NULL, NULL, NULL, 'US', 39.2323, -94.4145, 0);

-- --------------------------------------------------------

--
-- Table structure for table `LoginAttempt`
--

CREATE TABLE `LoginAttempt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LoginAttempt') CHARACTER SET utf8 DEFAULT 'LoginAttempt',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Status` enum('Success','Failure') CHARACTER SET utf8 DEFAULT 'Success',
  `IP` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LoginAttempt`
--


-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

CREATE TABLE `Member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Member') CHARACTER SET utf8 DEFAULT 'Member',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Surname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `RememberLoginToken` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `Bounced` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AutoLoginHash` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `TimeFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `ValidationKey` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `NeedsValidation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `PublicFieldsRaw` mediumtext CHARACTER SET utf8,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `ProfilePageID` int(11) NOT NULL DEFAULT '0',
  `BlacklistedEmail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NewsletterTrackingToken` varchar(32) DEFAULT NULL,
  `NeedsApproval` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Token` varchar(32) DEFAULT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '0',
  `HasConfiguredDashboard` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ProfilePageID` (`ProfilePageID`),
  KEY `Email` (`Email`(255)),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` VALUES(1, 'Member', '2011-12-15 04:04:19', '2012-10-11 14:12:18', 'Shea', 'Dawson', 'shea@livesource.co.nz', 'ec8ab46c2462a29409db02c4aa1c075d5b86a98f', NULL, 26, '2012-10-11 15:29:11', 0, NULL, '2012-02-15 00:00:00', 'sha1_v2.4', '8469396c4266336af38c2e44f4bdf3e98d8e64fa', NULL, NULL, 'en_US', 0, 'MM/dd/yyyy', 'hh:mm a', NULL, 0, 'a:3:{i:0;b:0;i:1;s:9:"FirstName";i:2;s:9:"FirstName";}', 0, 0, 0, 'fb9a8a9416df4de20fdb7bfb401c2398', 0, NULL, 0, 1);
INSERT INTO `Member` VALUES(2, 'Member', '2011-12-15 15:09:49', '2012-10-10 10:43:03', 'Jerry', 'James', 'shea+jerry@symbiote.com.au', 'e960ff3a4b19986bd16c859b9df1b82b105f2588', NULL, 3, '2012-10-10 10:43:03', 0, NULL, NULL, 'sha1_v2.4', '598532398da7a872b4ab7a774111744d6055b5d0', NULL, NULL, 'en_US', 0, NULL, NULL, '10df9b846d6497ecc1844be847836b65435815c2', 0, NULL, 0, 0, 0, NULL, 0, NULL, 0, 0);
INSERT INTO `Member` VALUES(3, 'Member', '2011-12-19 11:55:00', '2011-12-21 09:59:05', 'Registered', 'User', 'shea+3@livesource.co.nz', '8b9b87185101c5164a59495e66ec98229c2aedbe', NULL, 2, '2011-12-21 09:59:05', 0, NULL, NULL, 'sha1_v2.4', 'fa2cfb5e208092dd4d0461d6d152699fef010f1e', NULL, NULL, 'en_US', 0, NULL, NULL, 'd3fd88b183527cf56903405edcc0c8983f92a815', 0, 'a:3:{i:0;b:0;i:1;s:9:FirstName;i:2;s:7:Surname;}', 0, 13, 0, NULL, 0, NULL, 0, 0);
INSERT INTO `Member` VALUES(4, 'Member', '2012-02-17 14:18:19', '2012-10-15 11:12:44', 'Admin', NULL, 'admin', '71315de00efcb617c63c7f37f45586d2d5838efc', NULL, 30, '2012-10-15 13:24:52', 0, NULL, NULL, 'sha1_v2.4', 'bc425911db3e002ecee563978fba162e33ccc540', NULL, NULL, 'en_US', 0, 'MMM d, y', 'h:mm:ss a', '3313c3307a7634b531346bfaf1545784d323faec', 0, NULL, 0, 0, 0, '2c69bfbe7389a1edac84376b0af23bf4', 0, '82efae65d49982de1f937a9acd833972', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `MemberPassword`
--

CREATE TABLE `MemberPassword` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberPassword') CHARACTER SET utf8 DEFAULT 'MemberPassword',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `MemberPassword`
--

INSERT INTO `MemberPassword` VALUES(1, 'MemberPassword', '2011-12-15 15:09:49', '2011-12-15 15:09:49', 'e960ff3a4b19986bd16c859b9df1b82b105f2588', '598532398da7a872b4ab7a774111744d6055b5d0', 'sha1_v2.4', 2);
INSERT INTO `MemberPassword` VALUES(2, 'MemberPassword', '2011-12-19 11:55:00', '2011-12-19 11:55:00', '8b9b87185101c5164a59495e66ec98229c2aedbe', 'fa2cfb5e208092dd4d0461d6d152699fef010f1e', 'sha1_v2.4', 3);
INSERT INTO `MemberPassword` VALUES(3, 'MemberPassword', '2012-02-13 10:56:29', '2012-02-13 10:56:29', 'ec8ab46c2462a29409db02c4aa1c075d5b86a98f', '8469396c4266336af38c2e44f4bdf3e98d8e64fa', 'sha1_v2.4', 1);
INSERT INTO `MemberPassword` VALUES(4, 'MemberPassword', '2012-02-17 14:18:19', '2012-02-17 14:18:19', '80b3da8891248a809a96917339d526c17c34fed5', 'bc425911db3e002ecee563978fba162e33ccc540', 'sha1_v2.4', 4);
INSERT INTO `MemberPassword` VALUES(5, 'MemberPassword', '2012-10-12 11:45:48', '2012-10-12 11:45:48', '71315de00efcb617c63c7f37f45586d2d5838efc', 'bc425911db3e002ecee563978fba162e33ccc540', 'sha1_v2.4', 4);

-- --------------------------------------------------------

--
-- Table structure for table `MemberProfileField`
--

CREATE TABLE `MemberProfileField` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberProfileField') CHARACTER SET utf8 DEFAULT 'MemberProfileField',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `ProfileVisibility` enum('Edit','Readonly','Hidden') CHARACTER SET utf8 DEFAULT 'Hidden',
  `RegistrationVisibility` enum('Edit','Readonly','Hidden') CHARACTER SET utf8 DEFAULT 'Hidden',
  `MemberListVisible` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `PublicVisibility` enum('Display','MemberChoice','Hidden') CHARACTER SET utf8 DEFAULT 'Hidden',
  `PublicVisibilityDefault` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `MemberField` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `CustomTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `DefaultValue` mediumtext CHARACTER SET utf8,
  `Note` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CustomError` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Unique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `ProfilePageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ProfilePageID` (`ProfilePageID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `MemberProfileField`
--

INSERT INTO `MemberProfileField` VALUES(1, 'MemberProfileField', '2011-12-15 17:31:11', '2011-12-15 17:31:11', 'Edit', 'Edit', 1, 'Display', 0, 'FirstName', NULL, NULL, NULL, NULL, 0, 0, 1, 13);
INSERT INTO `MemberProfileField` VALUES(2, 'MemberProfileField', '2011-12-15 17:31:11', '2011-12-15 17:31:11', 'Edit', 'Edit', 1, 'MemberChoice', 1, 'Surname', NULL, NULL, NULL, NULL, 0, 0, 2, 13);
INSERT INTO `MemberProfileField` VALUES(3, 'MemberProfileField', '2011-12-15 17:31:11', '2011-12-15 17:31:11', 'Edit', 'Edit', 0, 'MemberChoice', 0, 'Email', NULL, NULL, NULL, NULL, 0, 0, 3, 13);
INSERT INTO `MemberProfileField` VALUES(4, 'MemberProfileField', '2011-12-15 17:31:11', '2011-12-15 17:31:11', 'Edit', 'Edit', 0, 'Hidden', 0, 'Password', NULL, NULL, NULL, NULL, 0, 0, 4, 13);
INSERT INTO `MemberProfileField` VALUES(5, 'MemberProfileField', '2011-12-15 17:31:11', '2011-12-15 17:31:11', 'Hidden', 'Hidden', 0, 'Hidden', 0, 'Locale', NULL, NULL, NULL, NULL, 0, 0, 5, 13);
INSERT INTO `MemberProfileField` VALUES(6, 'MemberProfileField', '2011-12-15 17:31:11', '2011-12-15 17:31:11', 'Hidden', 'Hidden', 0, 'Hidden', 0, 'DateFormat', NULL, NULL, NULL, NULL, 0, 0, 6, 13);
INSERT INTO `MemberProfileField` VALUES(7, 'MemberProfileField', '2011-12-15 17:31:11', '2011-12-15 17:31:11', 'Hidden', 'Hidden', 0, 'Hidden', 0, 'TimeFormat', NULL, NULL, NULL, NULL, 0, 0, 7, 13);
INSERT INTO `MemberProfileField` VALUES(8, 'MemberProfileField', '2011-12-15 17:31:11', '2012-02-16 14:20:04', 'Hidden', 'Hidden', 0, 'Hidden', 0, 'PublicFieldsRaw', NULL, NULL, NULL, NULL, 0, 0, 8, 0);
INSERT INTO `MemberProfileField` VALUES(10, 'MemberProfileField', '2011-12-15 17:31:11', '2011-12-15 17:31:11', 'Hidden', 'Hidden', 0, 'Hidden', 0, 'Groups', NULL, NULL, NULL, NULL, 0, 0, 10, 13);
INSERT INTO `MemberProfileField` VALUES(13, 'MemberProfileField', '2012-10-11 13:14:57', '2012-10-11 13:14:57', 'Hidden', 'Hidden', 0, 'Hidden', 0, 'HasConfiguredDashboard', NULL, NULL, NULL, NULL, 0, 0, 0, 13);

-- --------------------------------------------------------

--
-- Table structure for table `MemberProfilePage`
--

CREATE TABLE `MemberProfilePage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProfileTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `RegistrationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterRegistrationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ProfileContent` mediumtext CHARACTER SET utf8,
  `RegistrationContent` mediumtext CHARACTER SET utf8,
  `AfterRegistrationContent` mediumtext CHARACTER SET utf8,
  `AllowRegistration` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowProfileViewing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowProfileEditing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowAdding` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RegistrationRedirect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmailType` enum('Validation','Confirmation','None') CHARACTER SET utf8 DEFAULT 'None',
  `EmailFrom` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailSubject` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailTemplate` mediumtext CHARACTER SET utf8,
  `ConfirmationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ConfirmationContent` mediumtext CHARACTER SET utf8,
  `PostRegistrationTargetID` int(11) NOT NULL DEFAULT '0',
  `RequireApproval` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PostRegistrationTargetID` (`PostRegistrationTargetID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `MemberProfilePage`
--

INSERT INTO `MemberProfilePage` VALUES(13, 'Edit Profile', 'Register / Log In', 'Registration Successful', NULL, NULL, '<p>Thank you for registering!</p>', 1, 1, 1, 0, 0, 'Confirmation', 'no-reply@demoville.com', '$SiteName Member Activation', '<p>\n	Dear $Member.Email,\n</p>\n\n<p>\n	Thank you for registering at $SiteName! In order to use your account you must first confirm your\n	email address by clicking on the link below. Until you do this you will not be able to log in.\n</p>\n\n<h3>Account Confirmation</h3>\n\n<p>\n	Please <a href=$ConfirmLink>confirm your email</a>, or copy and paste the following URL into\n	your browser to confirm this is your real email address:\n</p>\n\n<pre>$ConfirmLink</pre>\n\n<p>\n	If you were not the person who signed up using this email address, please ignore this email. The\n	user account will not become active.\n</p>\n\n<h3>Log-In Details</h3>\n\n<p>\n	Once your account has been activated you will automatically be logged in. You can also log in\n	<a href=$LoginLink>here</a>. If you have lost your password you can generate a new one\n	on the <a href=$LostPasswordLink>lost password</a> page.\n</p>\n', 'Account Confirmed', '<p>Your account is now active, and you have been logged in. Thankyou!</p>', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `MemberProfilePage_ApprovalGroups`
--

CREATE TABLE `MemberProfilePage_ApprovalGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberProfilePageID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberProfilePageID` (`MemberProfilePageID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MemberProfilePage_ApprovalGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `MemberProfilePage_Groups`
--

CREATE TABLE `MemberProfilePage_Groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberProfilePageID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberProfilePageID` (`MemberProfilePageID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `MemberProfilePage_Groups`
--

INSERT INTO `MemberProfilePage_Groups` VALUES(1, 13, 3);

-- --------------------------------------------------------

--
-- Table structure for table `MemberProfilePage_Live`
--

CREATE TABLE `MemberProfilePage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProfileTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `RegistrationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterRegistrationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ProfileContent` mediumtext CHARACTER SET utf8,
  `RegistrationContent` mediumtext CHARACTER SET utf8,
  `AfterRegistrationContent` mediumtext CHARACTER SET utf8,
  `AllowRegistration` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowProfileViewing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowProfileEditing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowAdding` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RegistrationRedirect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmailType` enum('Validation','Confirmation','None') CHARACTER SET utf8 DEFAULT 'None',
  `EmailFrom` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailSubject` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailTemplate` mediumtext CHARACTER SET utf8,
  `ConfirmationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ConfirmationContent` mediumtext CHARACTER SET utf8,
  `PostRegistrationTargetID` int(11) NOT NULL DEFAULT '0',
  `RequireApproval` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PostRegistrationTargetID` (`PostRegistrationTargetID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `MemberProfilePage_Live`
--

INSERT INTO `MemberProfilePage_Live` VALUES(13, 'Edit Profile', 'Register / Log In', 'Registration Successful', NULL, NULL, '<p>Thank you for registering!</p>', 1, 1, 1, 0, 0, 'Confirmation', 'no-reply@demoville.com', '$SiteName Member Activation', '<p>\n	Dear $Member.Email,\n</p>\n\n<p>\n	Thank you for registering at $SiteName! In order to use your account you must first confirm your\n	email address by clicking on the link below. Until you do this you will not be able to log in.\n</p>\n\n<h3>Account Confirmation</h3>\n\n<p>\n	Please <a href=$ConfirmLink>confirm your email</a>, or copy and paste the following URL into\n	your browser to confirm this is your real email address:\n</p>\n\n<pre>$ConfirmLink</pre>\n\n<p>\n	If you were not the person who signed up using this email address, please ignore this email. The\n	user account will not become active.\n</p>\n\n<h3>Log-In Details</h3>\n\n<p>\n	Once your account has been activated you will automatically be logged in. You can also log in\n	<a href=$LoginLink>here</a>. If you have lost your password you can generate a new one\n	on the <a href=$LostPasswordLink>lost password</a> page.\n</p>\n', 'Account Confirmed', '<p>Your account is now active, and you have been logged in. Thankyou!</p>', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `MemberProfilePage_SelectableGroups`
--

CREATE TABLE `MemberProfilePage_SelectableGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberProfilePageID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberProfilePageID` (`MemberProfilePageID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MemberProfilePage_SelectableGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `MemberProfilePage_versions`
--

CREATE TABLE `MemberProfilePage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ProfileTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `RegistrationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterRegistrationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ProfileContent` mediumtext CHARACTER SET utf8,
  `RegistrationContent` mediumtext CHARACTER SET utf8,
  `AfterRegistrationContent` mediumtext CHARACTER SET utf8,
  `AllowRegistration` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowProfileViewing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowProfileEditing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowAdding` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RegistrationRedirect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmailType` enum('Validation','Confirmation','None') CHARACTER SET utf8 DEFAULT 'None',
  `EmailFrom` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailSubject` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailTemplate` mediumtext CHARACTER SET utf8,
  `ConfirmationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ConfirmationContent` mediumtext CHARACTER SET utf8,
  `PostRegistrationTargetID` int(11) NOT NULL DEFAULT '0',
  `RequireApproval` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `PostRegistrationTargetID` (`PostRegistrationTargetID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `MemberProfilePage_versions`
--

INSERT INTO `MemberProfilePage_versions` VALUES(4, 13, 4, 'Edit Profile', 'Register / Log In', 'Registration Successful', NULL, NULL, '<p>Thank you for registering!</p>', 1, 1, 1, 0, 0, 'Confirmation', 'no-reply@demoville.com', '$SiteName Member Activation', '<p>\n	Dear $Member.Email,\n</p>\n\n<p>\n	Thank you for registering at $SiteName! In order to use your account you must first confirm your\n	email address by clicking on the link below. Until you do this you will not be able to log in.\n</p>\n\n<h3>Account Confirmation</h3>\n\n<p>\n	Please <a href=$ConfirmLink>confirm your email</a>, or copy and paste the following URL into\n	your browser to confirm this is your real email address:\n</p>\n\n<pre>$ConfirmLink</pre>\n\n<p>\n	If you were not the person who signed up using this email address, please ignore this email. The\n	user account will not become active.\n</p>\n\n<h3>Log-In Details</h3>\n\n<p>\n	Once your account has been activated you will automatically be logged in. You can also log in\n	<a href=$LoginLink>here</a>. If you have lost your password you can generate a new one\n	on the <a href=$LostPasswordLink>lost password</a> page.\n</p>\n', 'Account Confirmed', '<p>Your account is now active, and you have been logged in. Thankyou!</p>', 0, 0);
INSERT INTO `MemberProfilePage_versions` VALUES(5, 13, 5, 'Edit Profile', 'Register / Log In', 'Registration Successful', NULL, NULL, '<p>Thank you for registering!</p>', 1, 1, 1, 0, 0, 'Confirmation', 'no-reply@demoville.com', '$SiteName Member Activation', '<p>\n	Dear $Member.Email,\n</p>\n\n<p>\n	Thank you for registering at $SiteName! In order to use your account you must first confirm your\n	email address by clicking on the link below. Until you do this you will not be able to log in.\n</p>\n\n<h3>Account Confirmation</h3>\n\n<p>\n	Please <a href=$ConfirmLink>confirm your email</a>, or copy and paste the following URL into\n	your browser to confirm this is your real email address:\n</p>\n\n<pre>$ConfirmLink</pre>\n\n<p>\n	If you were not the person who signed up using this email address, please ignore this email. The\n	user account will not become active.\n</p>\n\n<h3>Log-In Details</h3>\n\n<p>\n	Once your account has been activated you will automatically be logged in. You can also log in\n	<a href=$LoginLink>here</a>. If you have lost your password you can generate a new one\n	on the <a href=$LostPasswordLink>lost password</a> page.\n</p>\n', 'Account Confirmed', '<p>Your account is now active, and you have been logged in. Thankyou!</p>', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `MemberProfileSection`
--

CREATE TABLE `MemberProfileSection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberProfileFieldsSection','MemberProfileSection') CHARACTER SET utf8 DEFAULT 'MemberProfileFieldsSection',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `CustomTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `MemberProfileSection`
--

INSERT INTO `MemberProfileSection` VALUES(1, 'MemberProfileFieldsSection', '2011-12-15 17:31:11', '2011-12-15 17:31:11', NULL, 0, 13);

-- --------------------------------------------------------

--
-- Table structure for table `MetadataDateField`
--

CREATE TABLE `MetadataDateField` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` enum('datetime','date','time') CHARACTER SET utf8 DEFAULT 'datetime',
  `DefaultType` enum('specific','created') CHARACTER SET utf8 DEFAULT 'specific',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MetadataDateField`
--


-- --------------------------------------------------------

--
-- Table structure for table `MetadataField`
--

CREATE TABLE `MetadataField` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MetadataField','MetadataCheckboxField','MetadataDateField','MetadataRelationField','MetadataSelectField','MetadataTextField','MetadataHtmlField') CHARACTER SET utf8 DEFAULT 'MetadataField',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Required` tinyint(1) NOT NULL DEFAULT '0',
  `Cascade` tinyint(1) NOT NULL DEFAULT '0',
  `Default` text,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `SchemaID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MetadataField`
--


-- --------------------------------------------------------

--
-- Table structure for table `MetadataRelationField`
--

CREATE TABLE `MetadataRelationField` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectClass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MetadataRelationField`
--


-- --------------------------------------------------------

--
-- Table structure for table `MetadataSchema`
--

CREATE TABLE `MetadataSchema` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MetadataSchema') CHARACTER SET utf8 DEFAULT 'MetadataSchema',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MetadataSchema`
--


-- --------------------------------------------------------

--
-- Table structure for table `MetadataSchemaLink`
--

CREATE TABLE `MetadataSchemaLink` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MetadataSchemaLink') CHARACTER SET utf8 DEFAULT 'MetadataSchemaLink',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `ParentClass` varchar(100) DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `SchemaID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MetadataSchemaLink`
--


-- --------------------------------------------------------

--
-- Table structure for table `MetadataSelectField`
--

CREATE TABLE `MetadataSelectField` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` enum('dropdown','optionset','checkboxset') CHARACTER SET utf8 DEFAULT 'dropdown',
  `EmptyMode` enum('none','blank','text') CHARACTER SET utf8 DEFAULT 'none',
  `EmptyText` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MetadataSelectField`
--


-- --------------------------------------------------------

--
-- Table structure for table `MetadataSelectFieldOption`
--

CREATE TABLE `MetadataSelectFieldOption` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MetadataSelectFieldOption') CHARACTER SET utf8 DEFAULT 'MetadataSelectFieldOption',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Key` varchar(100) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MetadataSelectFieldOption`
--


-- --------------------------------------------------------

--
-- Table structure for table `MetadataTextField`
--

CREATE TABLE `MetadataTextField` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Rows` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MetadataTextField`
--


-- --------------------------------------------------------

--
-- Table structure for table `MultiFormSession`
--

CREATE TABLE `MultiFormSession` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MultiFormSession','EventRegisterFormSession') CHARACTER SET utf8 DEFAULT 'MultiFormSession',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Hash` varchar(40) DEFAULT NULL,
  `IsComplete` tinyint(1) NOT NULL DEFAULT '0',
  `SubmitterID` int(11) NOT NULL DEFAULT '0',
  `CurrentStepID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MultiFormSession`
--


-- --------------------------------------------------------

--
-- Table structure for table `MultiFormStep`
--

CREATE TABLE `MultiFormStep` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MultiFormStep','EventRegisterFreeConfirmationStep','EventRegisterPaymentStep','EventRegisterTicketsStep') CHARACTER SET utf8 DEFAULT 'MultiFormStep',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Data` text,
  `SessionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MultiFormStep`
--


-- --------------------------------------------------------

--
-- Table structure for table `NewsArticle`
--

CREATE TABLE `NewsArticle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Summary` mediumtext CHARACTER SET utf8,
  `Author` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `OriginalPublishedDate` date DEFAULT NULL,
  `ExternalURL` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Source` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `InternalFileID` int(11) NOT NULL DEFAULT '0',
  `NewsSectionID` int(11) NOT NULL DEFAULT '0',
  `ThumbnailID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `InternalFileID` (`InternalFileID`),
  KEY `NewsSectionID` (`NewsSectionID`),
  KEY `ThumbnailID` (`ThumbnailID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `NewsArticle`
--

INSERT INTO `NewsArticle` VALUES(10, '<p>The City of Melbourne manages over 500 hectares of open space. This represents almost 15 percent of the total area of the City of Melbourne.</p>', 'Jerry James', '2011-12-15', NULL, NULL, 0, 7, 11);
INSERT INTO `NewsArticle` VALUES(11, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla in leo tristique orci sagittis mattis. </p>', NULL, '2011-12-15', NULL, NULL, 0, 7, 11);
INSERT INTO `NewsArticle` VALUES(12, 'And maybe some additional details too...<br/>', NULL, '2011-12-15', NULL, NULL, 0, 7, 10);
INSERT INTO `NewsArticle` VALUES(20, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its  next decade with the unveiling of a new civic place which is set to  breathe fresh life into Victoria Harbour.</p>', 'Jerry James', '2011-12-16', NULL, NULL, 0, 7, 10);

-- --------------------------------------------------------

--
-- Table structure for table `NewsArticle_Live`
--

CREATE TABLE `NewsArticle_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Summary` mediumtext CHARACTER SET utf8,
  `Author` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `OriginalPublishedDate` date DEFAULT NULL,
  `ExternalURL` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Source` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `InternalFileID` int(11) NOT NULL DEFAULT '0',
  `NewsSectionID` int(11) NOT NULL DEFAULT '0',
  `ThumbnailID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `InternalFileID` (`InternalFileID`),
  KEY `NewsSectionID` (`NewsSectionID`),
  KEY `ThumbnailID` (`ThumbnailID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `NewsArticle_Live`
--

INSERT INTO `NewsArticle_Live` VALUES(10, '<p>The City of Melbourne manages over 500 hectares of open space. This represents almost 15 percent of the total area of the City of Melbourne.</p>', 'Jerry James', '2011-12-15', NULL, NULL, 0, 7, 11);
INSERT INTO `NewsArticle_Live` VALUES(11, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla in leo tristique orci sagittis mattis. </p>', NULL, '2011-12-15', NULL, NULL, 0, 7, 11);
INSERT INTO `NewsArticle_Live` VALUES(12, 'And maybe some additional details too...<br/>', NULL, '2011-12-15', NULL, NULL, 0, 7, 10);
INSERT INTO `NewsArticle_Live` VALUES(20, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its  next decade with the unveiling of a new civic place which is set to  breathe fresh life into Victoria Harbour.</p>', 'Jerry James', '2011-12-16', NULL, NULL, 0, 7, 10);

-- --------------------------------------------------------

--
-- Table structure for table `NewsArticle_versions`
--

CREATE TABLE `NewsArticle_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Summary` mediumtext CHARACTER SET utf8,
  `Author` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `OriginalPublishedDate` date DEFAULT NULL,
  `ExternalURL` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Source` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `InternalFileID` int(11) NOT NULL DEFAULT '0',
  `NewsSectionID` int(11) NOT NULL DEFAULT '0',
  `ThumbnailID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `InternalFileID` (`InternalFileID`),
  KEY `NewsSectionID` (`NewsSectionID`),
  KEY `ThumbnailID` (`ThumbnailID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `NewsArticle_versions`
--

INSERT INTO `NewsArticle_versions` VALUES(9, 20, 4, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its  next decade with the unveiling of a new civic place which is set to  breathe fresh life into Victoria Harbour.</p>', 'Jerry James', '2011-12-16', NULL, NULL, 0, 7, 10);
INSERT INTO `NewsArticle_versions` VALUES(10, 20, 5, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its  next decade with the unveiling of a new civic place which is set to  breathe fresh life into Victoria Harbour.</p>', 'Jerry James', '2011-12-16', NULL, NULL, 0, 7, 10);
INSERT INTO `NewsArticle_versions` VALUES(11, 12, 2, NULL, NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(12, 11, 2, NULL, NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(13, 10, 4, '<p>The City of Melbourne manages over 500 hectares of open space. This represents almost 15 percent of the total area of the City of Melbourne.</p>', 'Jerry James', '2011-12-15', NULL, NULL, 0, 7, 11);
INSERT INTO `NewsArticle_versions` VALUES(14, 10, 5, '<p>The City of Melbourne manages over 500 hectares of open space. This represents almost 15 percent of the total area of the City of Melbourne.</p>', 'Jerry James', '2011-12-15', NULL, NULL, 0, 7, 11);
INSERT INTO `NewsArticle_versions` VALUES(15, 20, 6, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its  next decade with the unveiling of a new civic place which is set to  breathe fresh life into Victoria Harbour.</p>', 'Jerry James', '2011-12-16', NULL, NULL, 0, 7, 10);
INSERT INTO `NewsArticle_versions` VALUES(16, 12, 3, NULL, NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(17, 12, 4, NULL, NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(18, 11, 3, NULL, NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(19, 10, 6, '<p>The City of Melbourne manages over 500 hectares of open space. This represents almost 15 percent of the total area of the City of Melbourne.</p>', 'Jerry James', '2011-12-15', NULL, NULL, 0, 7, 11);
INSERT INTO `NewsArticle_versions` VALUES(20, 20, 7, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its  next decade with the unveiling of a new civic place which is set to  breathe fresh life into Victoria Harbour.</p>', 'Jerry James', '2011-12-16', NULL, NULL, 0, 7, 10);
INSERT INTO `NewsArticle_versions` VALUES(21, 12, 5, NULL, NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(22, 11, 4, NULL, NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(23, 10, 7, '<p>The City of Melbourne manages over 500 hectares of open space. This represents almost 15 percent of the total area of the City of Melbourne.</p>', 'Jerry James', '2011-12-15', NULL, NULL, 0, 7, 11);
INSERT INTO `NewsArticle_versions` VALUES(24, 20, 8, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its  next decade with the unveiling of a new civic place which is set to  breathe fresh life into Victoria Harbour.</p>', 'Jerry James', '2011-12-16', NULL, NULL, 0, 7, 10);
INSERT INTO `NewsArticle_versions` VALUES(25, 20, 9, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its  next decade with the unveiling of a new civic place which is set to  breathe fresh life into Victoria Harbour.</p>', 'Jerry James', '2011-12-16', NULL, NULL, 0, 7, 10);
INSERT INTO `NewsArticle_versions` VALUES(26, 12, 6, NULL, NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(27, 12, 7, NULL, NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(28, 11, 5, NULL, NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(29, 10, 8, '<p>The City of Melbourne manages over 500 hectares of open space. This represents almost 15 percent of the total area of the City of Melbourne.</p>', 'Jerry James', '2011-12-15', NULL, NULL, 0, 7, 11);
INSERT INTO `NewsArticle_versions` VALUES(30, 12, 8, 'And maybe some additional details too...<br/>', NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(31, 20, 10, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its  next decade with the unveiling of a new civic place which is set to  breathe fresh life into Victoria Harbour.</p>', 'Jerry James', '2011-12-16', NULL, NULL, 0, 7, 10);
INSERT INTO `NewsArticle_versions` VALUES(32, 20, 11, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its  next decade with the unveiling of a new civic place which is set to  breathe fresh life into Victoria Harbour.</p>', 'Jerry James', '2011-12-16', NULL, NULL, 0, 7, 10);
INSERT INTO `NewsArticle_versions` VALUES(33, 12, 9, 'And maybe some additional details too...<br/>', NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(34, 12, 10, 'And maybe some additional details too...<br/>', NULL, '2011-12-15', NULL, NULL, 0, 7, 0);
INSERT INTO `NewsArticle_versions` VALUES(35, 12, 11, 'And maybe some additional details too...<br/>', NULL, '2011-12-15', NULL, NULL, 0, 7, 10);
INSERT INTO `NewsArticle_versions` VALUES(36, 11, 6, NULL, NULL, '2011-12-15', NULL, NULL, 0, 7, 11);
INSERT INTO `NewsArticle_versions` VALUES(37, 11, 7, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla in leo tristique orci sagittis mattis. </p>', NULL, '2011-12-15', NULL, NULL, 0, 7, 11);

-- --------------------------------------------------------

--
-- Table structure for table `NewsHolder`
--

CREATE TABLE `NewsHolder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AutoFiling` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `FilingMode` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `FileBy` enum('Published','Created') CHARACTER SET utf8 DEFAULT 'Created',
  `PrimaryNewsSection` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `NewsHolder`
--

INSERT INTO `NewsHolder` VALUES(7, 0, 'month', 'Created', 1);
INSERT INTO `NewsHolder` VALUES(8, 0, NULL, 'Created', 0);
INSERT INTO `NewsHolder` VALUES(9, 0, NULL, 'Created', 0);

-- --------------------------------------------------------

--
-- Table structure for table `NewsHolder_Live`
--

CREATE TABLE `NewsHolder_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AutoFiling` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `FilingMode` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `FileBy` enum('Published','Created') CHARACTER SET utf8 DEFAULT 'Created',
  `PrimaryNewsSection` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `NewsHolder_Live`
--

INSERT INTO `NewsHolder_Live` VALUES(7, 0, 'month', 'Created', 1);
INSERT INTO `NewsHolder_Live` VALUES(8, 0, NULL, 'Created', 0);
INSERT INTO `NewsHolder_Live` VALUES(9, 0, NULL, 'Created', 0);

-- --------------------------------------------------------

--
-- Table structure for table `NewsHolder_versions`
--

CREATE TABLE `NewsHolder_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `AutoFiling` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `FilingMode` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `FileBy` enum('Published','Created') CHARACTER SET utf8 DEFAULT 'Created',
  `PrimaryNewsSection` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `NewsHolder_versions`
--

INSERT INTO `NewsHolder_versions` VALUES(1, 8, 3, 0, NULL, 'Created', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Newsletter`
--

CREATE TABLE `Newsletter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Newsletter') CHARACTER SET utf8 DEFAULT 'Newsletter',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Status` enum('Draft','Send') CHARACTER SET utf8 DEFAULT 'Draft',
  `Content` mediumtext CHARACTER SET utf8,
  `Subject` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SentDate` datetime DEFAULT NULL,
  `ContentSource` enum('content','page') CHARACTER SET utf8 DEFAULT 'content',
  `IsScheduled` tinyint(1) NOT NULL DEFAULT '0',
  `ScheduledTime` datetime DEFAULT NULL,
  `Token` varchar(32) DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `WorkflowDefinitionID` int(11) NOT NULL DEFAULT '0',
  `SourcePageID` int(11) NOT NULL DEFAULT '0',
  `SendJobID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Newsletter`
--

INSERT INTO `Newsletter` VALUES(1, 'Newsletter', '2012-02-03 12:43:10', '2012-02-03 15:06:56', 'Send', '<p>Hey this is the content</p>', 'Test Newsletter', '2012-02-03 15:06:56', 'content', 0, NULL, 'c7114253dc802c8470adb70907d214e2', 1, 0, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `NewsletterEmailBlacklist`
--

CREATE TABLE `NewsletterEmailBlacklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('NewsletterEmailBlacklist') CHARACTER SET utf8 DEFAULT 'NewsletterEmailBlacklist',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `BlockedEmail` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `NewsletterEmailBlacklist`
--


-- --------------------------------------------------------

--
-- Table structure for table `NewsletterLinkView`
--

CREATE TABLE `NewsletterLinkView` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('NewsletterLinkView') CHARACTER SET utf8 DEFAULT 'NewsletterLinkView',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `IP` varchar(39) DEFAULT NULL,
  `LinkID` int(11) NOT NULL DEFAULT '0',
  `NewsletterID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `NewsletterLinkView`
--


-- --------------------------------------------------------

--
-- Table structure for table `NewsletterType`
--

CREATE TABLE `NewsletterType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('NewsletterType') CHARACTER SET utf8 DEFAULT 'NewsletterType',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Template` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `FromEmail` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Sent` datetime DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `GroupID` (`GroupID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `NewsletterType`
--

INSERT INTO `NewsletterType` VALUES(1, 'NewsletterType', '2012-02-03 12:41:39', '2012-02-03 12:42:08', 'Newsletter', NULL, 'shea@livesource.co.nz', NULL, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `NewsletterView`
--

CREATE TABLE `NewsletterView` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('NewsletterView') CHARACTER SET utf8 DEFAULT 'NewsletterView',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `IP` varchar(39) DEFAULT NULL,
  `NewsletterID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `NewsletterView`
--

INSERT INTO `NewsletterView` VALUES(1, 'NewsletterView', '2012-02-03 15:06:29', '2012-02-03 15:06:29', '127.0.0.1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Newsletter_Recipient`
--

CREATE TABLE `Newsletter_Recipient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Newsletter_Recipient') CHARACTER SET utf8 DEFAULT 'Newsletter_Recipient',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Newsletter_Recipient`
--


-- --------------------------------------------------------

--
-- Table structure for table `Newsletter_SentRecipient`
--

CREATE TABLE `Newsletter_SentRecipient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Newsletter_SentRecipient') CHARACTER SET utf8 DEFAULT 'Newsletter_SentRecipient',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Result` enum('Sent','Failed','Bounced','BlackListed') CHARACTER SET utf8 DEFAULT 'Sent',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Newsletter_SentRecipient`
--

INSERT INTO `Newsletter_SentRecipient` VALUES(1, 'Newsletter_SentRecipient', '2012-02-03 15:06:56', '2012-02-03 15:06:56', 'shea@livesource.co.nz', 'Failed', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Newsletter_TrackedLink`
--

CREATE TABLE `Newsletter_TrackedLink` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Newsletter_TrackedLink') CHARACTER SET utf8 DEFAULT 'Newsletter_TrackedLink',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Original` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Hash` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Visits` int(11) NOT NULL DEFAULT '0',
  `NewsletterID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `NewsletterID` (`NewsletterID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Newsletter_TrackedLink`
--


-- --------------------------------------------------------

--
-- Table structure for table `Newsletter_TrackedLink_ViewedMembers`
--

CREATE TABLE `Newsletter_TrackedLink_ViewedMembers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Newsletter_TrackedLinkID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Newsletter_TrackedLink_ViewedMembers`
--


-- --------------------------------------------------------

--
-- Table structure for table `NotifyUsersWorkflowAction`
--

CREATE TABLE `NotifyUsersWorkflowAction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailSubject` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `EmailFrom` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `EmailTemplate` mediumtext CHARACTER SET utf8,
  `ListingTemplateID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `NotifyUsersWorkflowAction`
--

INSERT INTO `NotifyUsersWorkflowAction` VALUES(2, 'New content approval request', 'shea@symbiote.com.au', '<p>Hello, a new item has been submitted for publishing.</p>\n\n<p>\nTitle: $Context.Title<br />\nAuthor: $Member.Name<br />\nAuthor Email: $Member.Email<br />\n</p>\n\nYou can view, reject or approve this submission <a href=''$Context.CMSEditLink''>here</a>.', 0);
INSERT INTO `NotifyUsersWorkflowAction` VALUES(5, 'Approval Rejected', 'shea@livesource.co.nz', '<p>This is an automated email from Demoville Council. Approval for the following item has been declined.</p>\n<p>\nItem: $Context.Title<br />\nSubmitted by: $Member.Name<br />\n</p>', 0);
INSERT INTO `NotifyUsersWorkflowAction` VALUES(6, 'Approval Accepted', 'shea@livesource.co.nz', '<p>This is an automated email from Demoville Council. The submission of the following item has been approved and published.</p>\n<p>\nItem: $Context.Title<br />\nSubmitted by: $Member.Name<br />\n</p>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ObjectCreatorPage`
--

CREATE TABLE `ObjectCreatorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CreateType` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `CreateLocationID` int(11) NOT NULL DEFAULT '0',
  `RestrictCreationTo` int(11) NOT NULL DEFAULT '0',
  `AllowUserSelection` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CreateButtonText` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PublishOnCreate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowCmsLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SuccessMessage` mediumtext CHARACTER SET utf8,
  `WhenObjectExists` enum('Rename','Replace','Error') CHARACTER SET utf8 DEFAULT 'Rename',
  `AllowUserWhenObjectExists` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `ObjectCreatorPage`
--

INSERT INTO `ObjectCreatorPage` VALUES(27, 'LocalBusinessPage', 21, 0, 0, 'Submit', 0, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href="$Link">here</a></p>', 'Rename', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ObjectCreatorPage_Live`
--

CREATE TABLE `ObjectCreatorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CreateType` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `CreateLocationID` int(11) NOT NULL DEFAULT '0',
  `RestrictCreationTo` int(11) NOT NULL DEFAULT '0',
  `AllowUserSelection` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CreateButtonText` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PublishOnCreate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowCmsLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SuccessMessage` mediumtext CHARACTER SET utf8,
  `WhenObjectExists` enum('Rename','Replace','Error') CHARACTER SET utf8 DEFAULT 'Rename',
  `AllowUserWhenObjectExists` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `ObjectCreatorPage_Live`
--

INSERT INTO `ObjectCreatorPage_Live` VALUES(27, 'LocalBusinessPage', 21, 0, 0, 'Submit', 0, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href="$Link">here</a></p>', 'Rename', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ObjectCreatorPage_versions`
--

CREATE TABLE `ObjectCreatorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `CreateType` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `CreateLocationID` int(11) NOT NULL DEFAULT '0',
  `RestrictCreationTo` int(11) NOT NULL DEFAULT '0',
  `AllowUserSelection` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CreateButtonText` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PublishOnCreate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowCmsLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SuccessMessage` mediumtext CHARACTER SET utf8,
  `WhenObjectExists` enum('Rename','Replace','Error') CHARACTER SET utf8 DEFAULT 'Rename',
  `AllowUserWhenObjectExists` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `ObjectCreatorPage_versions`
--

INSERT INTO `ObjectCreatorPage_versions` VALUES(1, 27, 1, NULL, 0, 0, 0, 'Create', 1, 0, NULL, 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(2, 27, 2, 'Page', 0, 0, 0, 'Submit', 0, 0, NULL, 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(3, 27, 3, 'Page', 25, 0, 0, 'Submit', 0, 0, NULL, 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(4, 27, 4, 'Page', 25, 0, 0, 'Submit', 0, 0, NULL, 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(5, 27, 5, 'LocalBusinessPage', 25, 0, 0, 'Submit', 0, 0, NULL, 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(6, 27, 6, 'LocalBusinessPage', 25, 0, 0, 'Submit', 0, 0, NULL, 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(7, 27, 7, 'LocalBusinessPage', 25, 0, 0, 'Submit', 0, 0, NULL, 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(8, 27, 8, 'LocalBusinessPage', 21, 0, 0, 'Submit', 0, 0, NULL, 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(9, 27, 9, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, NULL, 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(10, 27, 10, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. Check it out <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(11, 27, 11, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(12, 27, 12, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(13, 27, 13, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(14, 27, 14, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(15, 27, 15, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(16, 27, 16, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(17, 27, 17, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(18, 27, 18, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(19, 27, 19, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(20, 27, 20, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(21, 27, 21, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(22, 27, 22, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(23, 27, 23, 'LocalBusinessPage', 21, 0, 0, 'Submit', 1, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(24, 27, 24, 'LocalBusinessPage', 21, 0, 0, 'Submit', 0, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(25, 27, 25, 'LocalBusinessPage', 21, 0, 0, 'Submit', 0, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href=$Link>here</a></p>', 'Rename', 0);
INSERT INTO `ObjectCreatorPage_versions` VALUES(26, 27, 26, 'LocalBusinessPage', 21, 0, 0, 'Submit', 0, 0, '<p>Thanks for your submission of $Title. This item will need to be approved by the website administrator before it is published. This will be done within 2 days, at which time you will be sent you the approval status via email. Preview your submission <a href="$Link">here</a></p>', 'Rename', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageComment`
--

CREATE TABLE `PageComment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PageComment') CHARACTER SET utf8 DEFAULT 'PageComment',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Comment` text,
  `IsSpam` tinyint(1) NOT NULL DEFAULT '0',
  `NeedsModeration` tinyint(1) NOT NULL DEFAULT '0',
  `CommenterURL` varchar(255) DEFAULT NULL,
  `SessionID` varchar(255) DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PageComment`
--


-- --------------------------------------------------------

--
-- Table structure for table `PageCreatorPage`
--

CREATE TABLE `PageCreatorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CreateType` varchar(32) DEFAULT NULL,
  `CreateLocationID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PageCreatorPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `PageCreatorPage_Live`
--

CREATE TABLE `PageCreatorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CreateType` varchar(32) DEFAULT NULL,
  `CreateLocationID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PageCreatorPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `PageCreatorPage_versions`
--

CREATE TABLE `PageCreatorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `CreateType` varchar(32) DEFAULT NULL,
  `CreateLocationID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PageCreatorPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

CREATE TABLE `Payment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Payment','ChequePayment','DPSPayment','EwayXMLPayment','PayPalPayment','PaystationHostedPayment','PaystationPayment','WorldpayPayment') CHARACTER SET utf8 DEFAULT 'Payment',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Status` enum('Incomplete','Success','Failure','Pending') CHARACTER SET utf8 DEFAULT 'Incomplete',
  `Message` text,
  `IP` varchar(50) DEFAULT NULL,
  `ProxyIP` varchar(50) DEFAULT NULL,
  `PaidForID` int(11) NOT NULL DEFAULT '0',
  `PaidForClass` varchar(50) DEFAULT NULL,
  `PaymentDate` text,
  `ExceptionError` text,
  `AmountCurrency` varchar(3) DEFAULT NULL,
  `AmountAmount` decimal(10,0) NOT NULL DEFAULT '0',
  `RecurringPaymentID` int(11) NOT NULL DEFAULT '0',
  `PaidByID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Payment`
--


-- --------------------------------------------------------

--
-- Table structure for table `PayPalPayment`
--

CREATE TABLE `PayPalPayment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AuthorisationCode` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PayPalPayment`
--


-- --------------------------------------------------------

--
-- Table structure for table `PaystationPayment`
--

CREATE TABLE `PaystationPayment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TxnNo` varchar(50) DEFAULT NULL,
  `ReceiptNo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PaystationPayment`
--


-- --------------------------------------------------------

--
-- Table structure for table `Permission`
--

CREATE TABLE `Permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Permission') CHARACTER SET utf8 DEFAULT 'Permission',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `Permission`
--

INSERT INTO `Permission` VALUES(1, 'Permission', '2011-12-15 04:04:19', '2011-12-15 04:04:19', 'CMS_ACCESS_CMSMain', 0, 1, 1);
INSERT INTO `Permission` VALUES(2, 'Permission', '2011-12-15 04:04:19', '2011-12-15 04:04:19', 'CMS_ACCESS_AssetAdmin', 0, 1, 1);
INSERT INTO `Permission` VALUES(3, 'Permission', '2011-12-15 04:04:19', '2011-12-15 04:04:19', 'CMS_ACCESS_CommentAdmin', 0, 1, 1);
INSERT INTO `Permission` VALUES(4, 'Permission', '2011-12-15 04:04:19', '2011-12-15 04:04:19', 'CMS_ACCESS_ReportAdmin', 0, 1, 1);
INSERT INTO `Permission` VALUES(5, 'Permission', '2011-12-15 04:04:19', '2011-12-15 04:04:19', 'SITETREE_REORGANISE', 0, 1, 1);
INSERT INTO `Permission` VALUES(7, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'ADMIN', 0, 1, 2);
INSERT INTO `Permission` VALUES(8, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'APPLY_WORKFLOW', 0, 1, 2);
INSERT INTO `Permission` VALUES(9, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'REASSIGN_ACTIVE_WORKFLOWS', 0, 1, 2);
INSERT INTO `Permission` VALUES(10, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'VIEW_ACTIVE_WORKFLOWS', 0, 1, 2);
INSERT INTO `Permission` VALUES(11, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_LeftAndMain', 0, 1, 2);
INSERT INTO `Permission` VALUES(12, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_CommentAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(13, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_DataListAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(14, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_EventLocationAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(15, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_EventResourceAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(16, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_AssetAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(17, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_QueuedJobsAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(18, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_ListingAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(19, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_LocalBusinessAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(20, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_MetadataAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(21, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_NewsletterAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(22, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_PdfAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(23, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_CMSMain', 0, 1, 2);
INSERT INTO `Permission` VALUES(24, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_ReportAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(25, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_SecurityAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(26, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_SolrAdminController', 0, 1, 2);
INSERT INTO `Permission` VALUES(27, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CMS_ACCESS_AdvancedWorkflowAdmin', 0, 1, 2);
INSERT INTO `Permission` VALUES(28, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'SITETREE_VIEW_ALL', 0, 1, 2);
INSERT INTO `Permission` VALUES(29, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'SITETREE_EDIT_ALL', 0, 1, 2);
INSERT INTO `Permission` VALUES(30, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'SITETREE_REORGANISE', 0, 1, 2);
INSERT INTO `Permission` VALUES(31, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'VIEW_DRAFT_CONTENT', 0, 1, 2);
INSERT INTO `Permission` VALUES(32, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'CREATE_OTHER_USERS', 0, 1, 2);
INSERT INTO `Permission` VALUES(33, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'SECURE_FILE_ACCESS', 0, 1, 2);
INSERT INTO `Permission` VALUES(34, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'SECURE_FILE_SETTINGS', 0, 1, 2);
INSERT INTO `Permission` VALUES(35, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'APPLY_ROLES', 0, 1, 2);
INSERT INTO `Permission` VALUES(36, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'EDIT_PERMISSIONS', 0, 1, 2);
INSERT INTO `Permission` VALUES(37, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'SITETREE_GRANT_ACCESS', 0, 1, 2);
INSERT INTO `Permission` VALUES(38, 'Permission', '2012-02-17 14:17:37', '2012-02-17 14:17:37', 'EDIT_SITECONFIG', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRole`
--

CREATE TABLE `PermissionRole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRole') CHARACTER SET utf8 DEFAULT 'PermissionRole',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PermissionRole`
--


-- --------------------------------------------------------

--
-- Table structure for table `PermissionRoleCode`
--

CREATE TABLE `PermissionRoleCode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRoleCode') CHARACTER SET utf8 DEFAULT 'PermissionRoleCode',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PermissionRoleCode`
--


-- --------------------------------------------------------

--
-- Table structure for table `PublishItemWorkflowAction`
--

CREATE TABLE `PublishItemWorkflowAction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PublishDelay` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `PublishItemWorkflowAction`
--

INSERT INTO `PublishItemWorkflowAction` VALUES(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `QueuedEmail`
--

CREATE TABLE `QueuedEmail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('QueuedEmail') CHARACTER SET utf8 DEFAULT 'QueuedEmail',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Send` datetime DEFAULT NULL,
  `Subject` varchar(50) DEFAULT NULL,
  `From` varchar(50) DEFAULT NULL,
  `Content` text,
  `ToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `QueuedEmail`
--


-- --------------------------------------------------------

--
-- Table structure for table `QueuedJobDescriptor`
--

CREATE TABLE `QueuedJobDescriptor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('QueuedJobDescriptor') CHARACTER SET utf8 DEFAULT 'QueuedJobDescriptor',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `JobTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Signature` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `Implementation` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `StartAfter` datetime DEFAULT NULL,
  `JobStarted` datetime DEFAULT NULL,
  `JobRestarted` datetime DEFAULT NULL,
  `JobFinished` datetime DEFAULT NULL,
  `TotalSteps` int(11) NOT NULL DEFAULT '0',
  `StepsProcessed` int(11) NOT NULL DEFAULT '0',
  `LastProcessedCount` int(11) NOT NULL DEFAULT '0',
  `ResumeCounts` int(11) NOT NULL DEFAULT '0',
  `SavedJobData` mediumtext CHARACTER SET utf8,
  `SavedJobMessages` mediumtext CHARACTER SET utf8,
  `JobStatus` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `JobType` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `RunAsID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RunAsID` (`RunAsID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=141 ;

--
-- Dumping data for table `QueuedJobDescriptor`
--

INSERT INTO `QueuedJobDescriptor` VALUES(1, 'QueuedJobDescriptor', '2012-02-16 14:19:44', '2012-10-11 17:02:47', 'Indexing Page not found in stage Stage', '025cec847a288e1fefba0e51f7b1d93d', 'SolrIndexItemJob', NULL, '2012-02-16 14:19:44', NULL, '2012-02-16 14:19:44', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:9:ErrorPage;s:6:itemID;i:4;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(2, 'QueuedJobDescriptor', '2012-02-16 14:19:49', '2012-10-11 17:02:47', 'Indexing Privacy Policy in stage Stage', 'b589c09f7bc6d3f67e609bea8caadd0d', 'SolrIndexItemJob', NULL, '2012-02-16 14:19:49', NULL, '2012-02-16 14:19:49', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:4:Page;s:6:itemID;i:24;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(3, 'QueuedJobDescriptor', '2012-02-16 14:19:57', '2012-10-11 17:02:47', 'Indexing Search in stage Stage', '965786ad2deddfdd94b6e772fab0eac6', 'SolrIndexItemJob', NULL, '2012-02-16 14:19:57', NULL, '2012-02-16 14:19:57', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:14:SolrSearchPage;s:6:itemID;i:14;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(4, 'QueuedJobDescriptor', '2012-02-16 14:20:10', '2012-10-11 17:02:47', 'Indexing Server error in stage Stage', '962f03638398e013a29f67b503f60589', 'SolrIndexItemJob', NULL, '2012-02-16 14:20:10', NULL, '2012-02-16 14:20:10', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:9:ErrorPage;s:6:itemID;i:5;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(5, 'QueuedJobDescriptor', '2012-02-16 14:20:32', '2012-10-11 17:02:47', 'Indexing Events in stage Stage', '7fc1f2da3b1c3c1e3f32727cee56b89b', 'SolrIndexItemJob', NULL, '2012-02-16 14:20:32', NULL, '2012-02-16 14:20:32', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:8:Calendar;s:6:itemID;i:49;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(6, 'QueuedJobDescriptor', '2012-02-16 14:22:38', '2012-10-11 17:02:47', 'Indexing Contact Us in stage Stage', '748366a050a4a8de90faf639ef7e6600', 'SolrIndexItemJob', NULL, '2012-02-16 14:22:38', NULL, '2012-02-16 14:22:38', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:ContactPage;s:6:itemID;i:3;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(7, 'QueuedJobDescriptor', '2012-02-16 14:22:39', '2012-10-11 17:02:47', 'Indexing Contact Us in stage Stage', '748366a050a4a8de90faf639ef7e6600', 'SolrIndexItemJob', NULL, '2012-02-16 14:22:39', NULL, '2012-02-16 14:22:39', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:ContactPage;s:6:itemID;i:3;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(8, 'QueuedJobDescriptor', '2012-02-16 14:24:49', '2012-10-11 17:02:47', 'Indexing Contact Us in stage Stage', '748366a050a4a8de90faf639ef7e6600', 'SolrIndexItemJob', NULL, '2012-02-16 14:24:49', NULL, '2012-02-16 14:24:49', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:ContactPage;s:6:itemID;i:3;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(9, 'QueuedJobDescriptor', '2012-02-16 14:24:49', '2012-10-11 17:02:47', 'Indexing Contact Us in stage Live', 'b428d3ff5ddb74e29010e02dd193c243', 'SolrIndexItemJob', NULL, '2012-02-16 14:24:49', NULL, '2012-02-16 14:24:49', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:ContactPage;s:6:itemID;i:3;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(10, 'QueuedJobDescriptor', '2012-02-16 14:25:08', '2012-10-11 17:02:47', 'Indexing Business in stage Stage', '09fae235667a2d2f72b198c797980610', 'SolrIndexItemJob', NULL, '2012-02-16 14:25:08', NULL, '2012-02-16 14:25:08', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:4:Page;s:6:itemID;i:25;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(11, 'QueuedJobDescriptor', '2012-02-16 14:25:13', '2012-10-11 17:02:47', 'Indexing Contact Us in stage Stage', '748366a050a4a8de90faf639ef7e6600', 'SolrIndexItemJob', NULL, '2012-02-16 14:25:13', NULL, '2012-02-16 14:25:13', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:ContactPage;s:6:itemID;i:3;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(12, 'QueuedJobDescriptor', '2012-02-16 14:25:13', '2012-10-11 17:02:47', 'Indexing Contact Us in stage Live', 'b428d3ff5ddb74e29010e02dd193c243', 'SolrIndexItemJob', NULL, '2012-02-16 14:25:13', NULL, '2012-02-16 14:25:13', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:ContactPage;s:6:itemID;i:3;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(13, 'QueuedJobDescriptor', '2012-02-17 10:37:14', '2012-10-11 17:02:47', 'Indexing Contact Us in stage Stage', '748366a050a4a8de90faf639ef7e6600', 'SolrIndexItemJob', NULL, '2012-02-17 10:37:14', NULL, '2012-02-17 10:37:14', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:ContactPage;s:6:itemID;i:3;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(14, 'QueuedJobDescriptor', '2012-02-17 10:37:14', '2012-10-11 17:02:47', 'Indexing Contact Us in stage Live', 'b428d3ff5ddb74e29010e02dd193c243', 'SolrIndexItemJob', NULL, '2012-02-17 10:37:14', NULL, '2012-02-17 10:37:14', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:ContactPage;s:6:itemID;i:3;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(15, 'QueuedJobDescriptor', '2012-02-17 12:28:37', '2012-10-11 17:02:47', 'Indexing Subscribe to our Newsletter in stage Stage', '37d07bcd179253974450dc5254624ac5', 'SolrIndexItemJob', NULL, '2012-02-17 12:28:38', NULL, '2012-02-17 12:28:38', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:16:SubscriptionPage;s:6:itemID;i:57;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(16, 'QueuedJobDescriptor', '2012-02-17 12:28:38', '2012-10-11 17:02:47', 'Indexing Subscribe to our Newsletter in stage Live', 'b7e39ebed6e70428582b624e1affb3d3', 'SolrIndexItemJob', NULL, '2012-02-17 12:28:38', NULL, '2012-02-17 12:28:38', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:16:SubscriptionPage;s:6:itemID;i:57;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(17, 'QueuedJobDescriptor', '2012-02-17 14:05:51', '2012-10-11 17:02:47', 'Indexing Subscribe to our Newsletter in stage Stage', '37d07bcd179253974450dc5254624ac5', 'SolrIndexItemJob', NULL, '2012-02-17 14:05:52', NULL, '2012-02-17 14:05:52', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:16:SubscriptionPage;s:6:itemID;i:57;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(18, 'QueuedJobDescriptor', '2012-02-17 14:05:52', '2012-10-11 17:02:47', 'Indexing Subscribe to our Newsletter in stage Live', 'b7e39ebed6e70428582b624e1affb3d3', 'SolrIndexItemJob', NULL, '2012-02-17 14:05:52', NULL, '2012-02-17 14:05:52', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:16:SubscriptionPage;s:6:itemID;i:57;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(19, 'QueuedJobDescriptor', '2012-02-17 14:06:39', '2012-10-11 17:02:47', 'Indexing Subscribe to our Newsletter in stage Stage', '37d07bcd179253974450dc5254624ac5', 'SolrIndexItemJob', NULL, '2012-02-17 14:06:40', NULL, '2012-02-17 14:06:40', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:16:SubscriptionPage;s:6:itemID;i:57;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(20, 'QueuedJobDescriptor', '2012-02-17 14:06:39', '2012-10-11 17:02:47', 'Indexing Subscribe to our Newsletter in stage Live', 'b7e39ebed6e70428582b624e1affb3d3', 'SolrIndexItemJob', NULL, '2012-02-17 14:06:40', NULL, '2012-02-17 14:06:40', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:16:SubscriptionPage;s:6:itemID;i:57;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(21, 'QueuedJobDescriptor', '2012-02-17 14:07:12', '2012-10-11 17:02:47', 'Indexing Subscribe to our Newsletter in stage Stage', '37d07bcd179253974450dc5254624ac5', 'SolrIndexItemJob', NULL, '2012-02-17 14:07:12', NULL, '2012-02-17 14:07:12', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:16:SubscriptionPage;s:6:itemID;i:57;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(22, 'QueuedJobDescriptor', '2012-02-17 14:07:12', '2012-10-11 17:02:47', 'Indexing Subscribe to our Newsletter in stage Live', 'b7e39ebed6e70428582b624e1affb3d3', 'SolrIndexItemJob', NULL, '2012-02-17 14:07:12', NULL, '2012-02-17 14:07:12', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:16:SubscriptionPage;s:6:itemID;i:57;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(23, 'QueuedJobDescriptor', '2012-05-16 11:30:00', '2012-10-11 17:02:47', 'Indexing New RegisterableEvent in stage Stage', 'd744020431514443be00ed93ae05b7ba', 'SolrIndexItemJob', NULL, '2012-05-16 11:30:00', NULL, '2012-05-16 11:30:00', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:17:RegisterableEvent;s:6:itemID;i:60;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(24, 'QueuedJobDescriptor', '2012-05-16 11:30:08', '2012-10-11 17:02:47', 'Indexing Partay in stage Stage', 'd744020431514443be00ed93ae05b7ba', 'SolrIndexItemJob', NULL, '2012-05-16 11:30:09', NULL, '2012-05-16 11:30:09', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:17:RegisterableEvent;s:6:itemID;i:60;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(25, 'QueuedJobDescriptor', '2012-05-16 11:30:08', '2012-10-11 17:02:47', 'Indexing Partay in stage Live', '8a0e3b6b6dd5c3a55f0a105ea9a75972', 'SolrIndexItemJob', NULL, '2012-05-16 11:30:09', NULL, '2012-05-16 11:30:09', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:17:RegisterableEvent;s:6:itemID;i:60;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(26, 'QueuedJobDescriptor', '2012-05-29 17:58:06', '2012-10-11 17:02:47', 'Indexing My new event in stage Stage', '4d3c658955a6c0bf22c3bc32f7173618', 'SolrIndexItemJob', NULL, '2012-05-29 17:58:06', NULL, '2012-05-29 17:58:06', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:13:CalendarEvent;s:6:itemID;i:61;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(27, 'QueuedJobDescriptor', '2012-05-29 17:58:50', '2012-10-11 17:02:47', 'Indexing My new event in stage Stage', 'b1f689117eeff436c4ff26fa4442d625', 'SolrIndexItemJob', NULL, '2012-05-29 17:58:50', NULL, '2012-05-29 17:58:50', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:13:CalendarEvent;s:6:itemID;i:62;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(28, 'QueuedJobDescriptor', '2012-05-29 17:58:50', '2012-10-11 17:02:47', 'Indexing My new event in stage Live', '45bfa2fd2171ed2224767f25559d54e4', 'SolrIndexItemJob', NULL, '2012-05-29 17:58:50', NULL, '2012-05-29 17:58:50', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:13:CalendarEvent;s:6:itemID;i:62;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(29, 'QueuedJobDescriptor', '2012-05-29 18:07:36', '2012-10-11 17:02:47', 'Indexing My new event in stage Stage', 'fe9e9703f15b5b602247f30b65d61344', 'SolrIndexItemJob', NULL, '2012-05-29 18:07:37', NULL, '2012-05-29 18:07:37', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:13:CalendarEvent;s:6:itemID;i:63;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(30, 'QueuedJobDescriptor', '2012-05-29 18:07:37', '2012-10-11 17:02:47', 'Indexing My new event in stage Live', 'd1531feed6539d8a4be41918d9867ba9', 'SolrIndexItemJob', NULL, '2012-05-29 18:07:37', NULL, '2012-05-29 18:07:37', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:13:CalendarEvent;s:6:itemID;i:63;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(31, 'QueuedJobDescriptor', '2012-05-30 10:37:56', '2012-10-11 17:02:47', 'Indexing My new event in stage Stage', 'a7cb2b23075e40b727f89b53f9adc4b9', 'SolrIndexItemJob', NULL, '2012-05-30 10:37:56', NULL, '2012-05-30 10:37:56', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:13:CalendarEvent;s:6:itemID;i:64;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(32, 'QueuedJobDescriptor', '2012-05-30 10:37:56', '2012-10-11 17:02:47', 'Indexing My new event in stage Live', 'fff44e9ef6b55e1744c4a0067e49d983', 'SolrIndexItemJob', NULL, '2012-05-30 10:37:56', NULL, '2012-05-30 10:37:56', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:13:CalendarEvent;s:6:itemID;i:64;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(33, 'QueuedJobDescriptor', '2012-07-31 17:34:23', '2012-10-11 17:02:47', 'Indexing Demo Square - a community landmark in stage Stage', 'e379e0132d64345db0bcf33afde695c9', 'SolrIndexItemJob', NULL, '2012-07-31 17:34:24', NULL, '2012-07-31 17:34:24', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:20;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(34, 'QueuedJobDescriptor', '2012-07-31 17:34:23', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Stage', '1e396b32d7e3c8ab4a90b38c0681f14c', 'SolrIndexItemJob', NULL, '2012-07-31 17:34:24', NULL, '2012-07-31 17:34:24', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:12;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(35, 'QueuedJobDescriptor', '2012-07-31 17:34:23', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Stage', '5111bea669367e2360205de2ad9a4346', 'SolrIndexItemJob', NULL, '2012-07-31 17:34:24', NULL, '2012-07-31 17:34:24', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:11;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(36, 'QueuedJobDescriptor', '2012-07-31 17:34:24', '2012-10-11 17:02:47', 'Indexing Open Space Strategy in stage Stage', '05a929699d6163fe81036cd398ea73b1', 'SolrIndexItemJob', NULL, '2012-07-31 17:34:24', NULL, '2012-07-31 17:34:24', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:10;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(37, 'QueuedJobDescriptor', '2012-07-31 17:34:39', '2012-10-11 17:02:47', 'Indexing Demo Square - a community landmark in stage Stage', 'e379e0132d64345db0bcf33afde695c9', 'SolrIndexItemJob', NULL, '2012-07-31 17:34:40', NULL, '2012-07-31 17:34:40', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:20;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(38, 'QueuedJobDescriptor', '2012-07-31 17:34:39', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Stage', '1e396b32d7e3c8ab4a90b38c0681f14c', 'SolrIndexItemJob', NULL, '2012-07-31 17:34:40', NULL, '2012-07-31 17:34:40', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:12;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(39, 'QueuedJobDescriptor', '2012-07-31 17:34:40', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Stage', '5111bea669367e2360205de2ad9a4346', 'SolrIndexItemJob', NULL, '2012-07-31 17:34:40', NULL, '2012-07-31 17:34:40', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:11;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(40, 'QueuedJobDescriptor', '2012-07-31 17:34:40', '2012-10-11 17:02:47', 'Indexing Open Space Strategy in stage Stage', '05a929699d6163fe81036cd398ea73b1', 'SolrIndexItemJob', NULL, '2012-07-31 17:34:40', NULL, '2012-07-31 17:34:40', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:10;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(41, 'QueuedJobDescriptor', '2012-07-31 17:35:28', '2012-10-11 17:02:47', 'Indexing Demo Square - a community landmark in stage Stage', 'e379e0132d64345db0bcf33afde695c9', 'SolrIndexItemJob', NULL, '2012-07-31 17:35:28', NULL, '2012-07-31 17:35:28', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:20;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(42, 'QueuedJobDescriptor', '2012-07-31 17:35:28', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Stage', '1e396b32d7e3c8ab4a90b38c0681f14c', 'SolrIndexItemJob', NULL, '2012-07-31 17:35:28', NULL, '2012-07-31 17:35:28', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:12;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(43, 'QueuedJobDescriptor', '2012-07-31 17:35:28', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Stage', '5111bea669367e2360205de2ad9a4346', 'SolrIndexItemJob', NULL, '2012-07-31 17:35:28', NULL, '2012-07-31 17:35:28', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:11;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(44, 'QueuedJobDescriptor', '2012-07-31 17:35:28', '2012-10-11 17:02:47', 'Indexing Open Space Strategy in stage Stage', '05a929699d6163fe81036cd398ea73b1', 'SolrIndexItemJob', NULL, '2012-07-31 17:35:28', NULL, '2012-07-31 17:35:28', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:10;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(45, 'QueuedJobDescriptor', '2012-07-31 17:35:42', '2012-10-11 17:02:47', 'Indexing City Square - a community landmark in stage Stage', 'e379e0132d64345db0bcf33afde695c9', 'SolrIndexItemJob', NULL, '2012-07-31 17:35:42', NULL, '2012-07-31 17:35:42', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:20;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(46, 'QueuedJobDescriptor', '2012-07-31 17:35:44', '2012-10-11 17:02:47', 'Indexing City Square - a community landmark in stage Live', '8749b712ad1f53f0bad0e3be8860adfd', 'SolrIndexItemJob', NULL, '2012-07-31 17:35:45', NULL, '2012-07-31 17:35:45', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:20;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(47, 'QueuedJobDescriptor', '2012-07-31 17:35:45', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Stage', '1e396b32d7e3c8ab4a90b38c0681f14c', 'SolrIndexItemJob', NULL, '2012-07-31 17:35:45', NULL, '2012-07-31 17:35:45', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:12;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(48, 'QueuedJobDescriptor', '2012-07-31 17:35:45', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Live', '872e1df6c526d59524c915a158b5963f', 'SolrIndexItemJob', NULL, '2012-07-31 17:35:45', NULL, '2012-07-31 17:35:45', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:12;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(49, 'QueuedJobDescriptor', '2012-07-31 17:35:45', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Stage', '5111bea669367e2360205de2ad9a4346', 'SolrIndexItemJob', NULL, '2012-07-31 17:35:45', NULL, '2012-07-31 17:35:45', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:11;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(50, 'QueuedJobDescriptor', '2012-07-31 17:35:45', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Live', 'f21c0df0e599b15b2861441072319aab', 'SolrIndexItemJob', NULL, '2012-07-31 17:35:45', NULL, '2012-07-31 17:35:45', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:11;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(51, 'QueuedJobDescriptor', '2012-07-31 17:35:45', '2012-10-11 17:02:47', 'Indexing Open Space Strategy in stage Live', '2aa4c100b35a462ba93443b6dfeb90e0', 'SolrIndexItemJob', NULL, '2012-07-31 17:35:45', NULL, '2012-07-31 17:35:45', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:10;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(52, 'QueuedJobDescriptor', '2012-07-31 17:36:03', '2012-10-11 17:02:47', 'Indexing City Square - a community landmark in stage Stage', 'e379e0132d64345db0bcf33afde695c9', 'SolrIndexItemJob', NULL, '2012-07-31 17:36:04', NULL, '2012-07-31 17:36:04', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:20;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(53, 'QueuedJobDescriptor', '2012-07-31 17:36:04', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Stage', '1e396b32d7e3c8ab4a90b38c0681f14c', 'SolrIndexItemJob', NULL, '2012-07-31 17:36:04', NULL, '2012-07-31 17:36:04', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:12;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(54, 'QueuedJobDescriptor', '2012-07-31 17:36:04', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Stage', '5111bea669367e2360205de2ad9a4346', 'SolrIndexItemJob', NULL, '2012-07-31 17:36:04', NULL, '2012-07-31 17:36:04', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:11;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(55, 'QueuedJobDescriptor', '2012-07-31 17:36:04', '2012-10-11 17:02:47', 'Indexing Open Space Strategy in stage Stage', '05a929699d6163fe81036cd398ea73b1', 'SolrIndexItemJob', NULL, '2012-07-31 17:36:04', NULL, '2012-07-31 17:36:04', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:10;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(56, 'QueuedJobDescriptor', '2012-07-31 17:36:29', '2012-10-11 17:02:47', 'Indexing Missing the full article content here<br> in stage Stage', '1e396b32d7e3c8ab4a90b38c0681f14c', 'SolrIndexItemJob', NULL, '2012-07-31 17:36:29', NULL, '2012-07-31 17:36:29', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:12;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(57, 'QueuedJobDescriptor', '2012-07-31 17:36:30', '2012-10-11 17:02:47', 'Indexing City Square - a community landmark in stage Live', '8749b712ad1f53f0bad0e3be8860adfd', 'SolrIndexItemJob', NULL, '2012-07-31 17:36:31', NULL, '2012-07-31 17:36:31', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:20;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(58, 'QueuedJobDescriptor', '2012-07-31 17:36:30', '2012-10-11 17:02:47', 'Indexing Missing the full article content here<br> in stage Live', '872e1df6c526d59524c915a158b5963f', 'SolrIndexItemJob', NULL, '2012-07-31 17:36:31', NULL, '2012-07-31 17:36:31', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:12;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(59, 'QueuedJobDescriptor', '2012-07-31 17:36:30', '2012-10-11 17:02:47', 'Indexing New NewsArticle in stage Live', 'f21c0df0e599b15b2861441072319aab', 'SolrIndexItemJob', NULL, '2012-07-31 17:36:31', NULL, '2012-07-31 17:36:31', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:11;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(60, 'QueuedJobDescriptor', '2012-07-31 17:36:31', '2012-10-11 17:02:47', 'Indexing Open Space Strategy in stage Live', '2aa4c100b35a462ba93443b6dfeb90e0', 'SolrIndexItemJob', NULL, '2012-07-31 17:36:31', NULL, '2012-07-31 17:36:31', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:10;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(61, 'QueuedJobDescriptor', '2012-07-31 17:37:17', '2012-10-11 17:02:47', 'Indexing City Square - a community landmark in stage Stage', 'e379e0132d64345db0bcf33afde695c9', 'SolrIndexItemJob', NULL, '2012-07-31 17:37:17', NULL, '2012-07-31 17:37:17', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:20;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(62, 'QueuedJobDescriptor', '2012-07-31 17:37:36', '2012-10-11 17:02:47', 'Indexing My city Square - a community landmark in stage Stage', 'e379e0132d64345db0bcf33afde695c9', 'SolrIndexItemJob', NULL, '2012-07-31 17:37:36', NULL, '2012-07-31 17:37:36', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:20;s:5:stage;s:5:Stage;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(63, 'QueuedJobDescriptor', '2012-07-31 17:37:39', '2012-10-11 17:02:47', 'Indexing My city Square - a community landmark in stage Live', '8749b712ad1f53f0bad0e3be8860adfd', 'SolrIndexItemJob', NULL, '2012-07-31 17:37:39', NULL, '2012-07-31 17:37:39', 1, 1, 1, 0, 'O:8:stdClass:4:{s:8:itemType;s:11:NewsArticle;s:6:itemID;i:20;s:5:stage;s:4:Live;s:4:mode;s:5:index;}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(65, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:02:47', 'Reindex Page content in Solr', 'e610159cc5e1eb3a828a3c7b7d6e5ee0', 'SolrReindexJob', NULL, '2012-10-11 17:02:47', NULL, '2012-10-11 17:02:47', 0, 0, 0, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:4:"Page";s:13:"lastIndexedID";i:0;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(66, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:02:54', 'Reindex Calendar content in Solr', 'd1cd992944c5e757041b502f47c9760d', 'SolrReindexJob', NULL, '2012-10-11 17:02:53', NULL, '2012-10-11 17:02:53', 0, 1, 1, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:8:"Calendar";s:13:"lastIndexedID";i:65;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(67, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:02:55', 'Reindex CalendarEvent content in Solr', '625da1915a295c172b5e00f594650386', 'SolrReindexJob', NULL, '2012-10-11 17:02:54', NULL, '2012-10-11 17:02:54', 0, 1, 1, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:13:"CalendarEvent";s:13:"lastIndexedID";i:66;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(68, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:02:56', 'Reindex MemberProfilePage content in Solr', '3d281f621041355ba6359736582c042b', 'SolrReindexJob', NULL, '2012-10-11 17:02:55', NULL, '2012-10-11 17:02:55', 0, 1, 1, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:17:"MemberProfilePage";s:13:"lastIndexedID";i:13;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(69, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:02:56', 'Reindex ErrorPage content in Solr', '49ce7464ed58533ae6ac6c2aa9a94452', 'SolrReindexJob', NULL, '2012-10-11 17:02:56', NULL, '2012-10-11 17:02:56', 0, 2, 2, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:9:"ErrorPage";s:13:"lastIndexedID";i:5;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(70, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:02:57', 'Reindex RedirectorPage content in Solr', '66d4303b6b069dd0b68f0ad53d44f81b', 'SolrReindexJob', NULL, '2012-10-11 17:02:56', NULL, '2012-10-11 17:02:56', 0, 1, 1, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:14:"RedirectorPage";s:13:"lastIndexedID";i:16;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(71, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:02:57', 'Reindex VirtualPage content in Solr', 'afe034f012a9da205645a12085e098d6', 'SolrReindexJob', NULL, '2012-10-11 17:02:57', NULL, '2012-10-11 17:02:57', 0, 0, 0, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:11:"VirtualPage";s:13:"lastIndexedID";i:0;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(72, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:02:59', 'Reindex ObjectCreatorPage content in Solr', '78a5605c23937d938a6a6b42edf0ef17', 'SolrReindexJob', NULL, '2012-10-11 17:02:58', NULL, '2012-10-11 17:02:58', 0, 1, 1, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:17:"ObjectCreatorPage";s:13:"lastIndexedID";i:27;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(73, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:02:59', 'Reindex ContactPage content in Solr', 'e8d10d580895b37472b156387fcda536', 'SolrReindexJob', NULL, '2012-10-11 17:02:59', NULL, '2012-10-11 17:02:59', 0, 0, 0, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:11:"ContactPage";s:13:"lastIndexedID";i:0;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(74, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:03:00', 'Reindex HomePage content in Solr', '2a7066223e2c29ca575d34e92362576f', 'SolrReindexJob', NULL, '2012-10-11 17:03:00', NULL, '2012-10-11 17:03:00', 0, 0, 0, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:8:"HomePage";s:13:"lastIndexedID";i:0;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(75, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:03:04', 'Reindex LocalBusinessPage content in Solr', '7b01c55ade0b064aae6d10ddbd88c360', 'SolrReindexJob', NULL, '2012-10-11 17:03:02', NULL, '2012-10-11 17:03:03', 0, 15, 15, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:17:"LocalBusinessPage";s:13:"lastIndexedID";i:79;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(76, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:03:05', 'Reindex NewsArticle content in Solr', '7606721e3ea6033b599ef7e8120b946d', 'SolrReindexJob', NULL, '2012-10-11 17:03:04', NULL, '2012-10-11 17:03:04', 0, 4, 4, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:11:"NewsArticle";s:13:"lastIndexedID";i:20;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(77, 'QueuedJobDescriptor', '2012-10-10 11:23:43', '2012-10-11 17:03:06', 'Reindex NewsHolder content in Solr', '82a0bf2cb69e33605f55c1582ee6302f', 'SolrReindexJob', NULL, '2012-10-11 17:03:05', NULL, '2012-10-11 17:03:05', 0, 3, 3, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:10:"NewsHolder";s:13:"lastIndexedID";i:9;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(78, 'QueuedJobDescriptor', '2012-10-10 11:23:44', '2012-10-11 17:03:07', 'Reindex SolrSearchPage content in Solr', '89a35d92debc6c9da63fb1b52365884a', 'SolrReindexJob', NULL, '2012-10-11 17:03:06', NULL, '2012-10-11 17:03:06', 0, 1, 1, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:14:"SolrSearchPage";s:13:"lastIndexedID";i:14;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(79, 'QueuedJobDescriptor', '2012-10-10 11:23:44', '2012-10-11 17:03:07', 'Reindex UserDefinedForm content in Solr', '360e1e0137c39f27d758dc01f1030915', 'SolrReindexJob', NULL, '2012-10-11 17:03:07', NULL, '2012-10-11 17:03:07', 0, 1, 1, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:15:"UserDefinedForm";s:13:"lastIndexedID";i:67;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(80, 'QueuedJobDescriptor', '2012-10-10 11:23:44', '2012-10-11 17:03:08', 'Reindex SurveyPage content in Solr', '27c44d4cf4a152f157bbf35c9d826403', 'SolrReindexJob', NULL, '2012-10-11 17:03:07', NULL, NULL, 0, 0, 0, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:10:"SurveyPage";s:13:"lastIndexedID";i:0;}', 'a:2:{i:0;s:179:"[2012-10-11 17:03:08][ERROR] Job caused exception Class SurveyPage does not exist in /Users/sheadawson/htdocs/demos/council-ss3/framework/control/injector/Injector.php at line 819";i:1;s:61:"[2012-10-11 17:03:08][INFO] Job paused at 2012-10-11 17:03:08";}', 'Broken', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(81, 'QueuedJobDescriptor', '2012-10-10 11:23:44', '2012-10-11 17:03:09', 'Reindex ZenGalleryPage content in Solr', '80ac7f4895849cdb71c8780eec373cf8', 'SolrReindexJob', NULL, '2012-10-11 17:03:08', NULL, '2012-10-11 17:03:08', 0, 3, 3, 0, 'O:8:"stdClass":2:{s:11:"reindexType";s:14:"ZenGalleryPage";s:13:"lastIndexedID";i:70;}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(82, 'QueuedJobDescriptor', '2012-10-10 11:44:25', '2012-10-10 11:44:25', 'Indexing "New Calendar" in stage Stage', '5ad464afcc4bf5218ee640feb7b7cbe1', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:8:"Calendar";s:6:"itemID";i:65;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(83, 'QueuedJobDescriptor', '2012-10-10 11:55:20', '2012-10-10 11:55:20', 'Indexing "Events" in stage Live', '1004c0aa429cec240d4c6a25e57e0768', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:8:"Calendar";s:6:"itemID";i:65;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(84, 'QueuedJobDescriptor', '2012-10-10 12:28:27', '2012-10-10 12:28:27', 'Indexing "New Calendar Event" in stage Stage', 'f32eddf56fdc6343f0af036b629acb3a', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:13:"CalendarEvent";s:6:"itemID";i:66;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(85, 'QueuedJobDescriptor', '2012-10-10 12:31:08', '2012-10-10 12:31:08', 'Indexing "Demo Event" in stage Live', '476e732041b16e4907882c28eeca023f', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:13:"CalendarEvent";s:6:"itemID";i:66;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(86, 'QueuedJobDescriptor', '2012-10-10 14:52:07', '2012-10-10 14:52:07', 'Indexing "Have your say" in stage Live', '8b6dbb69ea20c9a5c57af6de684b77e4', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:11:"ListingPage";s:6:"itemID";i:58;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(87, 'QueuedJobDescriptor', '2012-10-10 14:54:44', '2012-10-10 14:54:44', 'Indexing "New Survey Page" in stage Stage', '4d963c4a7f1d51b0e0c7b8850b82659f', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:10:"SurveyPage";s:6:"itemID";i:67;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(88, 'QueuedJobDescriptor', '2012-10-10 15:08:54', '2012-10-10 15:08:54', 'Indexing "New Survey Page" in stage Stage', '5f295d722a43ca8d8d59452420174fab', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:8:"SiteTree";s:6:"itemID";i:67;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(89, 'QueuedJobDescriptor', '2012-10-10 15:08:54', '2012-10-10 15:08:54', 'Indexing "New Survey Page" in stage Live', '7baf6ff64127b3be48eb5c71ec3c1378', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:8:"SiteTree";s:6:"itemID";i:67;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(90, 'QueuedJobDescriptor', '2012-10-10 15:09:52', '2012-10-10 15:09:52', 'Indexing "Cyclists - Have your say" in stage Stage', 'bbe594f64ba2b90844de0e5991302caa', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:15:"UserDefinedForm";s:6:"itemID";i:67;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(91, 'QueuedJobDescriptor', '2012-10-10 15:09:52', '2012-10-10 15:09:52', 'Indexing "Cyclists - Have your say" in stage Live', 'a910995ca789989c6d86e3b780889a8f', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:15:"UserDefinedForm";s:6:"itemID";i:67;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(92, 'QueuedJobDescriptor', '2012-10-10 15:58:13', '2012-10-10 15:58:13', 'Indexing "Contact Us" in stage Stage', '748366a050a4a8de90faf639ef7e6600', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:11:"ContactPage";s:6:"itemID";i:3;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(93, 'QueuedJobDescriptor', '2012-10-10 15:58:13', '2012-10-10 15:58:13', 'Indexing "Contact Us" in stage Live', 'b428d3ff5ddb74e29010e02dd193c243', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:11:"ContactPage";s:6:"itemID";i:3;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(94, 'QueuedJobDescriptor', '2012-10-10 16:17:55', '2012-10-10 16:17:55', 'Indexing "Have your say" in stage Stage', '3877adcf4836c2ea29ec1c5d6015e062', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:11:"ListingPage";s:6:"itemID";i:58;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(95, 'QueuedJobDescriptor', '2012-10-10 16:51:28', '2012-10-10 16:51:28', 'Indexing "Missing the full article content here" in stage Stage', '1e396b32d7e3c8ab4a90b38c0681f14c', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:11:"NewsArticle";s:6:"itemID";i:12;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(96, 'QueuedJobDescriptor', '2012-10-10 16:51:29', '2012-10-10 16:51:29', 'Indexing "Dec" in stage Live', 'b91cdbf18a121f42c5d2e4f6db7b6b96', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:10:"NewsHolder";s:6:"itemID";i:9;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(97, 'QueuedJobDescriptor', '2012-10-10 16:51:29', '2012-10-11 17:02:47', 'Indexing "2011" in stage Live', 'b43bdbf59a4862224d5cfb8e9d31459e', 'SolrIndexItemJob', NULL, '2012-10-11 16:59:41', NULL, '2012-10-11 16:59:41', 1, 1, 1, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:10:"NewsHolder";s:6:"itemID";i:8;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'Complete', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(98, 'QueuedJobDescriptor', '2012-10-10 16:51:29', '2012-10-10 16:51:29', 'Indexing "News" in stage Live', 'dc2b9de36d72e68e88270f0929d78e55', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:10:"NewsHolder";s:6:"itemID";i:7;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(99, 'QueuedJobDescriptor', '2012-10-10 16:51:29', '2012-10-10 16:51:29', 'Indexing "Missing the full article content here" in stage Live', '872e1df6c526d59524c915a158b5963f', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:11:"NewsArticle";s:6:"itemID";i:12;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(100, 'QueuedJobDescriptor', '2012-10-10 17:07:25', '2012-10-10 17:07:25', 'Indexing "New NewsArticle" in stage Stage', '5111bea669367e2360205de2ad9a4346', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:11:"NewsArticle";s:6:"itemID";i:11;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(101, 'QueuedJobDescriptor', '2012-10-10 17:07:28', '2012-10-10 17:07:28', 'Indexing "New NewsArticle" in stage Live', 'f21c0df0e599b15b2861441072319aab', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:11:"NewsArticle";s:6:"itemID";i:11;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(102, 'QueuedJobDescriptor', '2012-10-10 17:43:45', '2012-10-10 17:43:45', 'Indexing "New Zen Gallery Page" in stage Stage', '41505a18562b59b046439d79d3ee6506', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:14:"ZenGalleryPage";s:6:"itemID";i:68;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(103, 'QueuedJobDescriptor', '2012-10-10 17:48:23', '2012-10-10 17:48:23', 'Indexing "Image Gallery" in stage Live', 'db25a6723dfdfeaff221bd3b6a6fee7d', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:14:"ZenGalleryPage";s:6:"itemID";i:68;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(104, 'QueuedJobDescriptor', '2012-10-11 10:29:20', '2012-10-11 10:29:20', 'Indexing "New Zen Gallery Page" in stage Stage', '25773b16d53a679d3c6cdb090f3c314a', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:14:"ZenGalleryPage";s:6:"itemID";i:69;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(105, 'QueuedJobDescriptor', '2012-10-11 10:29:41', '2012-10-11 10:29:41', 'Indexing "Sub Gallery" in stage Live', 'aec2ca42ae295929ff087d82ccc5b9de', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:14:"ZenGalleryPage";s:6:"itemID";i:69;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(106, 'QueuedJobDescriptor', '2012-10-11 10:44:03', '2012-10-11 10:44:03', 'Indexing "New Zen Gallery Page" in stage Stage', '59e2ec5f250385ea119f825af584045a', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:14:"ZenGalleryPage";s:6:"itemID";i:70;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(107, 'QueuedJobDescriptor', '2012-10-11 10:45:07', '2012-10-11 10:45:07', 'Indexing "Sub Gallery 2" in stage Live', '0fa198ac966643ecec89f47262300994', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:14:"ZenGalleryPage";s:6:"itemID";i:70;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(108, 'QueuedJobDescriptor', '2012-10-11 14:33:18', '2012-10-11 14:33:18', 'Indexing "List your business" in stage Stage', '996bcb41c4d6556e24af98da8f6466c5', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"ObjectCreatorPage";s:6:"itemID";i:27;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(109, 'QueuedJobDescriptor', '2012-10-11 14:33:18', '2012-10-11 14:33:18', 'Indexing "Local Businesses" in stage Stage', 'a5b7886485307c93dc4267fb06704073', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:11:"ListingPage";s:6:"itemID";i:21;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(110, 'QueuedJobDescriptor', '2012-10-11 14:33:18', '2012-10-11 14:33:18', 'Indexing "List your business" in stage Live', 'c92c3b516c5c88286760634551a00806', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"ObjectCreatorPage";s:6:"itemID";i:27;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(111, 'QueuedJobDescriptor', '2012-10-11 14:42:46', '2012-10-11 14:42:46', 'Indexing "SS3" in stage Stage', 'c405e4481563359dce74685aaba40290', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:71;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(112, 'QueuedJobDescriptor', '2012-10-11 14:42:46', '2012-10-11 14:42:46', 'Indexing "SS3" in stage Live', '47eed3fba7da34be89187f1a530fede2', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:71;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(113, 'QueuedJobDescriptor', '2012-10-11 15:29:03', '2012-10-11 15:29:03', 'Indexing "Testing workflow" in stage Stage', '1f41795d431e327e81c0ce1247c46711', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:72;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(114, 'QueuedJobDescriptor', '2012-10-11 15:29:03', '2012-10-11 15:29:03', 'Indexing "Testing workflow" in stage Live', '3e3d89eaa3bd5f9e7ac3370f68e98274', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:72;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 1);
INSERT INTO `QueuedJobDescriptor` VALUES(115, 'QueuedJobDescriptor', '2012-10-11 16:03:27', '2012-10-11 16:03:27', 'Indexing "Workflow integrated" in stage Stage', '2a05951c4ecf2f4d65b1cfee82e66159', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:73;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(116, 'QueuedJobDescriptor', '2012-10-11 16:03:27', '2012-10-11 16:03:27', 'Indexing "Workflow integrated" in stage Live', '32189c3a4e250f9ff4501989a9374ef5', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:73;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(117, 'QueuedJobDescriptor', '2012-10-11 16:06:44', '2012-10-11 16:06:44', 'Indexing "One" in stage Stage', 'f1e3c0be251bd2631c1c5076ee733dca', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:74;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(118, 'QueuedJobDescriptor', '2012-10-11 16:07:02', '2012-10-11 16:07:02', 'Indexing "Two" in stage Stage', 'dbbfed1c4226f80ef2147ad548435a90', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:75;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(119, 'QueuedJobDescriptor', '2012-10-11 16:18:06', '2012-10-11 16:18:06', 'Indexing "Three" in stage Stage', '3dc43fdaa91b254bbe9759021197ffbc', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:76;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(120, 'QueuedJobDescriptor', '2012-10-11 16:37:55', '2012-10-11 16:37:55', 'Indexing "Four" in stage Stage', '9863a7581879647fdd46e12335bfa2ed', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:77;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(121, 'QueuedJobDescriptor', '2012-10-11 16:39:03', '2012-10-11 16:39:03', 'Indexing "Five" in stage Stage', '55fdc6230e31b02ba38a80da38ee71e5', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:78;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(122, 'QueuedJobDescriptor', '2012-10-11 16:47:18', '2012-10-11 16:47:18', 'Indexing "Six" in stage Stage', 'c6987b9bbb2beca09b73b422e05d19df', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:79;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(123, 'QueuedJobDescriptor', '2012-10-11 16:50:11', '2012-10-11 16:50:11', 'Indexing "Six" in stage Live', '241e59a152d9bd0a016fe3d05d9fe95d', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:79;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(124, 'QueuedJobDescriptor', '2012-10-11 16:58:47', '2012-10-11 17:03:10', 'Scheduled unpublish of Demo Event', '570b616ef5bfdf27ac5ff82dbe23d8fe', 'WorkflowPublishTargetJob', '2012-10-11 17:00:00', '2012-10-11 17:03:09', NULL, '2012-10-11 17:03:09', 1, 1, 1, 0, 'O:8:"stdClass":3:{s:8:"ObjectID";i:66;s:10:"ObjectType";s:13:"CalendarEvent";s:11:"publishType";s:9:"unpublish";}', 'a:0:{}', 'Complete', '2', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(125, 'QueuedJobDescriptor', '2012-10-11 17:03:09', '2012-10-11 17:03:09', 'Unindexing "item #66" in stage Stage', '4c220115142a80d594cba4572817a1d4', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:13:"CalendarEvent";s:6:"itemID";i:66;s:5:"stage";N;s:4:"mode";s:7:"unindex";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(126, 'QueuedJobDescriptor', '2012-10-12 11:34:34', '2012-10-12 11:34:34', 'Indexing "Cycle Tracks" in stage Stage', 'e2697f212302788a7cb4ff31d71f8272', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:4:"Page";s:6:"itemID";i:53;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(127, 'QueuedJobDescriptor', '2012-10-12 11:34:34', '2012-10-12 11:34:34', 'Indexing "Cycle Tracks" in stage Live', 'b3470aa86206c366d51e1924bda0fa1f', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:4:"Page";s:6:"itemID";i:53;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(128, 'QueuedJobDescriptor', '2012-10-12 11:34:45', '2012-10-12 11:34:45', 'Indexing "Central City Map" in stage Stage', 'e5869227d1b76df1ebc9cfc8db224524', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:4:"Page";s:6:"itemID";i:54;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(129, 'QueuedJobDescriptor', '2012-10-12 11:34:45', '2012-10-12 11:34:45', 'Indexing "Central City Map" in stage Live', 'ce856d29373bdb27040d1db71924dd94', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:4:"Page";s:6:"itemID";i:54;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(130, 'QueuedJobDescriptor', '2012-10-12 11:36:26', '2012-10-12 11:36:26', 'Indexing "2011" in stage Stage', 'e15f690ba2c0fea3f2b5ceb93814bdd9', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:10:"NewsHolder";s:6:"itemID";i:8;s:5:"stage";s:5:"Stage";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(131, 'QueuedJobDescriptor', '2012-10-12 11:36:26', '2012-10-12 11:36:26', 'Indexing "2011" in stage Live', 'b43bdbf59a4862224d5cfb8e9d31459e', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:10:"NewsHolder";s:6:"itemID";i:8;s:5:"stage";s:4:"Live";s:4:"mode";s:5:"index";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(132, 'QueuedJobDescriptor', '2012-10-12 11:37:40', '2012-10-12 11:37:40', 'Unindexing "item #71" in stage Stage', '8553978061a5188abcfd19c2bd0d581a', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:71;s:5:"stage";N;s:4:"mode";s:7:"unindex";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(133, 'QueuedJobDescriptor', '2012-10-12 11:37:51', '2012-10-12 11:37:51', 'Unindexing "item #72" in stage Stage', 'edd14883518fb7174e60b467be482035', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:72;s:5:"stage";N;s:4:"mode";s:7:"unindex";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(134, 'QueuedJobDescriptor', '2012-10-12 11:38:01', '2012-10-12 11:38:01', 'Unindexing "item #73" in stage Stage', '3da5faa1fc95d617166014d3162f7b9c', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:73;s:5:"stage";N;s:4:"mode";s:7:"unindex";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(135, 'QueuedJobDescriptor', '2012-10-12 11:38:13', '2012-10-12 11:38:13', 'Unindexing "item #74" in stage Stage', 'de1e8e8d9b1579e07f13ebf385ae03c3', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:74;s:5:"stage";N;s:4:"mode";s:7:"unindex";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(136, 'QueuedJobDescriptor', '2012-10-12 11:38:21', '2012-10-12 11:38:21', 'Unindexing "item #75" in stage Stage', '6bc74c8fccfffa2138f159749988e6e7', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:75;s:5:"stage";N;s:4:"mode";s:7:"unindex";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(137, 'QueuedJobDescriptor', '2012-10-12 11:38:28', '2012-10-12 11:38:28', 'Unindexing "item #76" in stage Stage', '614b8a2feb00bd2cacbe40dc9249519a', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:76;s:5:"stage";N;s:4:"mode";s:7:"unindex";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(138, 'QueuedJobDescriptor', '2012-10-12 11:38:36', '2012-10-12 11:38:36', 'Unindexing "item #77" in stage Stage', '39656751d3e50ec856db9ae412603a8a', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:77;s:5:"stage";N;s:4:"mode";s:7:"unindex";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(139, 'QueuedJobDescriptor', '2012-10-12 11:38:44', '2012-10-12 11:38:44', 'Unindexing "item #78" in stage Stage', '2e57cad826774f427d0afd6c0f8cbf45', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:78;s:5:"stage";N;s:4:"mode";s:7:"unindex";}', 'a:0:{}', 'New', '1', 4);
INSERT INTO `QueuedJobDescriptor` VALUES(140, 'QueuedJobDescriptor', '2012-10-12 11:38:52', '2012-10-12 11:38:52', 'Unindexing "item #79" in stage Stage', 'b8697a17d8416516472a2a46ee96abbd', 'SolrIndexItemJob', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'O:8:"stdClass":4:{s:8:"itemType";s:17:"LocalBusinessPage";s:6:"itemID";i:79;s:5:"stage";N;s:4:"mode";s:7:"unindex";}', 'a:0:{}', 'New', '1', 4);

-- --------------------------------------------------------

--
-- Table structure for table `RecurringDayOfMonth`
--

CREATE TABLE `RecurringDayOfMonth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('RecurringDayOfMonth') CHARACTER SET utf8 DEFAULT 'RecurringDayOfMonth',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `RecurringDayOfMonth`
--

INSERT INTO `RecurringDayOfMonth` VALUES(1, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 1);
INSERT INTO `RecurringDayOfMonth` VALUES(2, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 2);
INSERT INTO `RecurringDayOfMonth` VALUES(3, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 3);
INSERT INTO `RecurringDayOfMonth` VALUES(4, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 4);
INSERT INTO `RecurringDayOfMonth` VALUES(5, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 5);
INSERT INTO `RecurringDayOfMonth` VALUES(6, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 6);
INSERT INTO `RecurringDayOfMonth` VALUES(7, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 7);
INSERT INTO `RecurringDayOfMonth` VALUES(8, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 8);
INSERT INTO `RecurringDayOfMonth` VALUES(9, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 9);
INSERT INTO `RecurringDayOfMonth` VALUES(10, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 10);
INSERT INTO `RecurringDayOfMonth` VALUES(11, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 11);
INSERT INTO `RecurringDayOfMonth` VALUES(12, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 12);
INSERT INTO `RecurringDayOfMonth` VALUES(13, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 13);
INSERT INTO `RecurringDayOfMonth` VALUES(14, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 14);
INSERT INTO `RecurringDayOfMonth` VALUES(15, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 15);
INSERT INTO `RecurringDayOfMonth` VALUES(16, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 16);
INSERT INTO `RecurringDayOfMonth` VALUES(17, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 17);
INSERT INTO `RecurringDayOfMonth` VALUES(18, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 18);
INSERT INTO `RecurringDayOfMonth` VALUES(19, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 19);
INSERT INTO `RecurringDayOfMonth` VALUES(20, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 20);
INSERT INTO `RecurringDayOfMonth` VALUES(21, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 21);
INSERT INTO `RecurringDayOfMonth` VALUES(22, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 22);
INSERT INTO `RecurringDayOfMonth` VALUES(23, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 23);
INSERT INTO `RecurringDayOfMonth` VALUES(24, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 24);
INSERT INTO `RecurringDayOfMonth` VALUES(25, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 25);
INSERT INTO `RecurringDayOfMonth` VALUES(26, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 26);
INSERT INTO `RecurringDayOfMonth` VALUES(27, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 27);
INSERT INTO `RecurringDayOfMonth` VALUES(28, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 28);
INSERT INTO `RecurringDayOfMonth` VALUES(29, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 29);
INSERT INTO `RecurringDayOfMonth` VALUES(30, 'RecurringDayOfMonth', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 30);

-- --------------------------------------------------------

--
-- Table structure for table `RecurringDayOfWeek`
--

CREATE TABLE `RecurringDayOfWeek` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('RecurringDayOfWeek') CHARACTER SET utf8 DEFAULT 'RecurringDayOfWeek',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Value` int(11) NOT NULL DEFAULT '0',
  `Skey` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `RecurringDayOfWeek`
--

INSERT INTO `RecurringDayOfWeek` VALUES(1, 'RecurringDayOfWeek', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 0, 'S');
INSERT INTO `RecurringDayOfWeek` VALUES(2, 'RecurringDayOfWeek', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 1, 'M');
INSERT INTO `RecurringDayOfWeek` VALUES(3, 'RecurringDayOfWeek', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 2, 'T');
INSERT INTO `RecurringDayOfWeek` VALUES(4, 'RecurringDayOfWeek', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 3, 'W');
INSERT INTO `RecurringDayOfWeek` VALUES(5, 'RecurringDayOfWeek', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 4, 'T');
INSERT INTO `RecurringDayOfWeek` VALUES(6, 'RecurringDayOfWeek', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 5, 'F');
INSERT INTO `RecurringDayOfWeek` VALUES(7, 'RecurringDayOfWeek', '2011-12-22 01:22:15', '2011-12-22 01:22:15', 6, 'S');

-- --------------------------------------------------------

--
-- Table structure for table `RecurringException`
--

CREATE TABLE `RecurringException` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('RecurringException') CHARACTER SET utf8 DEFAULT 'RecurringException',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `ExceptionDate` date DEFAULT NULL,
  `CalendarEventID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CalendarEventID` (`CalendarEventID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `RecurringException`
--


-- --------------------------------------------------------

--
-- Table structure for table `RecurringPayment`
--

CREATE TABLE `RecurringPayment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('RecurringPayment','DPSRecurringPayment') CHARACTER SET utf8 DEFAULT 'RecurringPayment',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Status` enum('Incomplete','Success','Failure','Pending') CHARACTER SET utf8 DEFAULT 'Incomplete',
  `Message` text,
  `IP` varchar(50) DEFAULT NULL,
  `ProxyIP` varchar(50) DEFAULT NULL,
  `PaidForID` int(11) NOT NULL DEFAULT '0',
  `PaidForClass` varchar(50) DEFAULT NULL,
  `Frequency` enum('Weekly','Monthly','Yearly') CHARACTER SET utf8 DEFAULT 'Monthly',
  `StartingDate` text,
  `Times` int(11) NOT NULL DEFAULT '0',
  `ExceptionError` text,
  `AmountCurrency` varchar(3) DEFAULT NULL,
  `AmountAmount` decimal(10,0) NOT NULL DEFAULT '0',
  `PaidByID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `RecurringPayment`
--


-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage`
--

CREATE TABLE `RedirectorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `RedirectorPage`
--

INSERT INTO `RedirectorPage` VALUES(16, 'Internal', NULL, 15);

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_Live`
--

CREATE TABLE `RedirectorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `RedirectorPage_Live`
--

INSERT INTO `RedirectorPage_Live` VALUES(16, 'Internal', NULL, 15);

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_versions`
--

CREATE TABLE `RedirectorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `RedirectorPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig`
--

CREATE TABLE `SiteConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteConfig') CHARACTER SET utf8 DEFAULT 'SiteConfig',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Tagline` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Theme` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'LoggedInUsers',
  `Phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `FacebookURL` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TwitterURL` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `FlickrURL` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Suburb` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `State` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `Postcode` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `Country` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `Fax` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Lat` float NOT NULL DEFAULT '0',
  `Lng` float NOT NULL DEFAULT '0',
  `YoutubeURL` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `QuickLinks` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `SiteConfig`
--

INSERT INTO `SiteConfig` VALUES(1, 'SiteConfig', '2011-12-15 04:04:19', '2012-10-11 11:44:06', 'Demoville Council', NULL, 'demoplate', 'Anyone', 'LoggedInUsers', 'LoggedInUsers', '1234512345', 'demo@demoville.com.au', 'http://www.facebook.com', 'http://www.twitter.com', NULL, 'Unit 9 680 Victoria St', 'North Melbourne', 'Victoria', '3051', 'AU', '5432154321', -37.8043, 144.944, 'http://www.youtube.com', '<ul class="list3"><li><a href="[sitetree_link" id="13]">Your Account</a></li>\n<li><a href="[sitetree_link" id="7]">Item two</a></li>\n<li><a href="[sitetree_link" id="7]">Item three</a></li>\n<li><a href="[sitetree_link" id="7]">Item four</a></li>\n<li><a href="[sitetree_link" id="7]">Item five</a></li>\n<li><a href="[sitetree_link" id="7]">Item six</a></li>\n</ul>');

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_CreateTopLevelGroups`
--

CREATE TABLE `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteConfig_CreateTopLevelGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_EditorGroups`
--

CREATE TABLE `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteConfig_EditorGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_ViewerGroups`
--

CREATE TABLE `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteConfig_ViewerGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteTree`
--

CREATE TABLE `SiteTree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('HomePage','Page','ContactPage','ErrorPage','NewsHolder','NewsArticle','MemberProfilePage','SolrSearchPage','ListingPage','RedirectorPage','LocalBusinessPage','ObjectCreatorPage','Calendar','CalendarEvent','SubscriptionPage','RegisterableEvent','UserDefinedForm','ZenGalleryPage','SiteTree','VirtualPage') CHARACTER SET utf8 DEFAULT 'HomePage',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `MetaKeywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HomepageForDomain` varchar(100) DEFAULT NULL,
  `ProvideComments` tinyint(1) NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Status` varchar(50) DEFAULT NULL,
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `ToDo` text,
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `WorkflowDefinitionID` int(11) NOT NULL DEFAULT '0',
  `ResultBoost` int(11) NOT NULL DEFAULT '0',
  `DesiredPublishDate` datetime DEFAULT NULL,
  `DesiredUnPublishDate` datetime DEFAULT NULL,
  `PublishOnDate` datetime DEFAULT NULL,
  `UnPublishOnDate` datetime DEFAULT NULL,
  `PublishJobID` int(11) NOT NULL DEFAULT '0',
  `UnPublishJobID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`),
  KEY `WorkflowDefinitionID` (`WorkflowDefinitionID`),
  KEY `PublishJobID` (`PublishJobID`),
  KEY `UnPublishJobID` (`UnPublishJobID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `SiteTree`
--

INSERT INTO `SiteTree` VALUES(1, 'HomePage', '2011-12-15 04:04:19', '2012-02-06 15:50:58', 'home', 'Home', NULL, '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem  accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab  illo inventore veritatis et quasi architecto beatae vitae dicta sunt  explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut  odit aut fugit, sed quia consequuntur magni dolores eos qui ratione  voluptatem sequi nesciunt.</p>\n<p>Neque porro quisquam est, qui dolorem ipsum  quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam  eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat  voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam  corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?  Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse  quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo  voluptas nulla pariatur</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 8, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(2, 'Page', '2011-12-15 04:04:19', '2012-02-06 15:51:17', 'about-demoville', 'About Demoville', NULL, '<p><img class=left src=assets/_resampled/resizedimage726266-PerthCityPanorama-943x345.jpg width=726 height=266 alt= title=/></p>\n<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu, vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula. Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis tellus consequat vel. Phasellus non consectetur diam. Aenean viverra, lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet, elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis. Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec accumsan eros sit amet massa tempus sit amet dignissim augue venenatis. Integer sit amet nibh at mauris ornare ultrices.</p>\n\n', 'About Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 14, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(3, 'ContactPage', '2011-12-15 04:04:19', '2012-10-10 16:00:45', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your requests and general enquiries or call us on <strong>1234554321</strong>.</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(4, 'ErrorPage', '2011-12-15 04:04:19', '2012-02-16 14:19:43', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 13, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(5, 'ErrorPage', '2011-12-15 04:04:20', '2012-02-16 14:20:10', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 14, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(7, 'NewsHolder', '2011-12-15 16:24:04', '2012-10-10 17:08:03', 'news', 'News', NULL, NULL, 'News', NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(8, 'NewsHolder', '2011-12-15 16:24:46', '2012-10-12 11:36:26', '2011', '2011', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 3, 7, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(9, 'NewsHolder', '2011-12-15 16:24:46', '2012-10-10 17:08:02', 'dec', 'Dec', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, 8, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(10, 'NewsArticle', '2011-12-15 16:24:46', '2012-07-31 17:36:31', 'open-space-strategy', 'Open Space Strategy', NULL, '<p><strong>Planning for future growth</strong></p>\n<p>The City of Melbourne manages over 500 hectares of open space. This  represents almost 15 percent of the total area of the City of Melbourne.</p>\n<p>To meet the needs of the growing and changing residential and worker  population, and to respond to issues such as climate change, we have  prepared our first draft Open Space Strategy for the entire  municipality.</p>\n<p>The draft Open Space Strategy provides the overarching framework and  strategic direction for open space planning in the City of Melbourne for  the next 15 years.</p>\n<p>A key objective of the strategy is to plan Melbourne’s open space  network to one that is within easy walking distance to the community,  particular in areas of forecasted population growth.</p>\n<p>What kind of issues does the strategy address?</p>\n<p><strong>The strategy will provide direction on these key issues:</strong></p>\n<p>the unprecedented demand for open space as Melbourne’s population continues to grow</p>\n<p>climate change – a decade of drought, water restrictions and extreme  weather and the predicted impacts of climate change provide additional  challenges in the management of parks and reserves and the role they can  play in climate change adaptation</p>\n<p>ensuring open spaces can provide for and adapt to differing needs and  uses. This includes providing people with the opportunity to connect  with nature.</p>', 'Open Space Strategy', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 8, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(11, 'NewsArticle', '2011-12-15 16:53:39', '2012-10-10 17:08:02', 'new-newsarticle', 'New NewsArticle', NULL, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla in leo tristique orci sagittis mattis. Proin mollis erat velit. Nam dignissim, magna sit amet rutrum tincidunt, arcu nunc porta arcu, non commodo nibh justo a eros. Curabitur euismod rutrum mauris, nec laoreet enim ullamcorper eu</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 7, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(12, 'NewsArticle', '2011-12-15 16:55:23', '2012-10-10 17:07:12', 'demoville-cake-factory-opening', 'Demoville cake factory opening', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 11, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(13, 'MemberProfilePage', '2011-12-15 17:31:11', '2012-02-16 14:20:03', 'your-account', 'Your Account', NULL, NULL, 'Your Account', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(14, 'SolrSearchPage', '2011-12-15 17:33:53', '2012-02-16 14:19:57', 'search', 'Search', NULL, NULL, 'Search', NULL, NULL, NULL, 0, 1, NULL, 0, 11, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(15, 'ListingPage', '2011-12-16 10:18:03', '2012-02-06 14:33:57', 'download-more-information', 'Download more Information', NULL, '<p>This is a listing page containing files that are only viewable by logged in users</p>\n<p>$Listing</p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 6, 0, 0, 'Published', NULL, 'OnlyTheseUsers', 'Inherit', NULL, 14, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(16, 'RedirectorPage', '2011-12-16 10:22:04', '2011-12-16 10:22:33', 'download-more-information-2', 'Download more information', NULL, NULL, 'Download more information', NULL, NULL, NULL, 1, 1, NULL, 0, 7, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(17, 'Page', '2011-12-16 13:51:45', '2012-02-06 15:51:05', 'city-maps', 'City Maps', NULL, '<p>Vestibulum porta risus eget nibh ullamcorper commodo. In lorem dolor,  aliquet vel sodales euismod, hendrerit id dolor. Pellentesque ut lacus  tincidunt ipsum fermentum aliquam. In hac habitasse platea dictumst. Sed  egestas lectus a dui ullamcorper sit amet auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'City Maps', NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 7, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(18, 'Page', '2011-12-16 14:07:55', '2012-02-06 15:51:07', 'history', 'History', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem  metus, molestie sed facilisis eget, placerat a quam. Sed aliquet laoreet  felis eu porta. Phasellus magna libero, lacinia non molestie vitae,  laoreet eu diam. Aenean ac ante quis quam fermentum consequat. Cras eget  justo non libero mollis lacinia eget in felis. Nam non enim tortor.  Vestibulum in ipsum et risus semper congue vel sed metus. Praesent sem  magna, tempus eget aliquet at, facilisis sit amet ligula.</p>\n<p>Fusce suscipit euismod enim ac tincidunt. Nullam a urna non erat  ullamcorper vestibulum. Fusce laoreet, dolor nec commodo rhoncus, erat  lorem mattis sem, nec porta ante urna pellentesque tellus. Vestibulum  vitae diam a mauris dictum ultrices. Cras id eros ut turpis tempor  dignissim a et est. Ut pulvinar dui erat, vel pharetra nibh. Fusce nisi  dolor, malesuada et placerat congue, ultricies a risus. Suspendisse  varius tortor a velit pharetra elementum auctor nec mi. Donec pretium  ultrices turpis, ac vulputate justo consequat dignissim. Proin sed ante  ipsum, in posuere mauris. Cras ultricies risus et neque blandit eget  faucibus lectus varius.</p>\n<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu,  vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis  auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel  libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper  nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut  felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula.  Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus  dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec  condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis  iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis  interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis  tellus consequat vel. Phasellus non consectetur diam. Aenean viverra,  lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo  eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet,  elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis.  Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec  accumsan eros sit amet massa tempus sit amet dignissim augue venenatis.  Integer sit amet nibh at mauris ornare ultrices.</p>', 'History', NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 7, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(19, 'Page', '2011-12-16 14:30:44', '2012-02-06 15:51:12', 'indigenous-demoville', 'Indigenous Demoville', NULL, '<p>Welcome to the City of Demoville. We respectfully acknowledge that we are meeting on the traditional land of the Kulin Nation. This special place is now known by its European name of Demoville.<br/><br/>Today, Demoville is one of the great multicultural cities of the world, and is a significant meeting place. For the Wurundjeri, Boonerwrung, Taungurong, Djajawurrung and the Wathaurung which make up the Kulin Nation, Demoville has always been an important meeting place and location for events of social, educational, sporting and cultural significance.<br/><br/>City of Demoville''s acknowledgement, City of Demoville Indigenous Framework 2007-2010<br/>Indigenous community<br/><br/>The City of Demoville collaborates with its Indigenous community in the development of its many strategies, agreements and protocols designed to celebrate, support and expand Indigenous culture throughout Demoville and beyond.<br/><br/>The City of Demoville’s approach to local and national Indigenous interests is to be open, active and alert to opportunities.<br/><br/>As a local government, the City of Demoville aims to provide high quality, responsive and innovative services for its local Indigenous community. Its Indigenous Unit offers a direct connection between the organisation and the local Indigenous community.<br/><br/>Demoville is regarded by many as the hub of the Victorian Indigenous community.<br/>Indigenous Demoville<br/><br/>To find out more about Indigenous Demoville and how the City of Demoville works with Indigenous communities, download the Celebrate Indigenous Demoville guide below, or visit that''s Demoville, our website for everything to do and see in the city.</p>', 'Indigenous Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 6, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(20, 'NewsArticle', '2011-12-16 15:09:15', '2012-07-31 17:37:39', 'demo-square-a-community-landmark', 'My city Square - a community landmark', NULL, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its next decade with the unveiling of a new civic place which is set to breathe fresh life into Victoria Harbour.</p>\n<p>Delivered by a unique partnership model comprising of City of Demoville, Lend Lease and Places Victoria, the centerpiece, to be known as Demo Square, will be a next generation library and community centre.</p>\n<p>Located at the intersection where Collins Street will meet Bourke, the library and community centre will commence construction in April 2012 and aim for completion in mid 2013.</p><p>So anything I enter here is all good to go<br/></p>\n<p>Demolands became a part of the City of Demoville in 2007. The suburb''s 200 hectares of land and water are on Victoria Harbour, west of the Central Business District (CBD). Its inclusion doubled the size of the Demoville’s CBD and returned the waterfront to the city.</p>\n<p>The area is close to Demoville''s main transport networks, including Southern Cross Station. Demolands is well known as home to the Etihad Stadium and a large number of modern buildings and public spaces and artworks.</p>\n<p>From the original development at New Quay, featuring apartments, restaurants, a marina and film studios, Demolands has grown into a thriving waterfront suburb offering a mix of inner city living, shopping, business, parks, entertainment, dining, sporting events, marine transport, community events and arts and culture.</p>\n<p>Demolands has also become the national headquarters for a number of major businesses, including the National Australia Bank, ANZ, Myer, AXA, Bendigo Bank, Medibank Private and the Bureau of Meteorology.</p>\n<p>It is estimated that by around 2020 Demolands will have 20 million visitors each year, a workplace for 40,000 people daily and a residential area for up to 17,000.</p>\n<h3>What’s on in Demolands</h3>\n<p>With its idyllic mix of waterfront location and CBD lifestyle, Demolands has attracted a selection of Demoville’s hottest new bars and restaurants, shopping and cultural and sporting events.</p>\n<p> </p>\n<p>To plan your day or evening at Demolands visit our ‘What’s on section’ and select the latest Demolands program.</p>', 'Demo Square - a community landmark', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 11, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(21, 'ListingPage', '2011-12-16 17:35:54', '2012-02-06 16:33:07', 'local-businesses', 'Local Businesses', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui  blanditiis praesentium voluptatum deleniti atque corrupti quos dolores  et quas molestias excepturi sint occaecati cupiditate non provident,  similique sunt in culpa qui officia deserunt mollitia animi, id est  laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita  distinctio. Nam libero tempore, cum soluta nobis est eligendi optio  cumque nihil impedit quo minus id quod maxime placeat facere possimus,  omnis voluptas assumenda est, omnis dolor repellendus.</p>\n<p>If you have a local business in Demoville, feel free to <a href=[sitetree_link id=27]>list it</a> here. Note that you must be <a href=[sitetree_link id=13]>registered</a> to do this.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'LoggedInUsers', NULL, 17, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(22, 'LocalBusinessPage', '2011-12-16 18:16:25', '2011-12-22 13:31:26', 'demosville-plumbing', 'Demosville Plumbing', NULL, '<p>No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those. No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those.</p>', 'Demo Plumbing', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 7, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(23, 'LocalBusinessPage', '2011-12-19 09:49:39', '2011-12-22 13:31:44', 'demosville-silverstripe', 'Demosville SilverStripe', NULL, '<p>Pastry bear claw tootsie roll apple pie icing bonbon. Chupa chups cookie  faworki jujubes tootsie roll jujubes cotton candy liquorice. Donut  cotton candy faworki topping marshmallow topping. Sesame snaps powder  lemon drops candy canes cupcake cotton candy icing Pastry bear claw tootsie roll apple pie icing bonbon. Chupa chups cookie  faworki jujubes tootsie roll jujubes cotton candy liquorice. Donut  cotton candy faworki topping marshmallow topping. Sesame snaps powder  lemon drops candy canes cupcake cotton candy icing</p>', 'Demosville SilverStripe', NULL, NULL, NULL, 0, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 4, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(24, 'Page', '2011-12-19 15:15:10', '2012-02-16 14:19:49', 'privacy-policy', 'Privacy Policy', NULL, '<div>\n<p>Below we set out our privacy policy which will govern the way in  which we process any personal information that you provide to us. We  will notify you if the way in which we process your information is to  change at any time.</p>\n<p>The LSIS Excellence Gateway website is provided and managed by the Learning and Skills Improvement Service (LSIS).</p>\n<p>In these terms and conditions, the terms we, us  our and “LSIS Excellence Gateway” are to be taken as referring to LSIS.</p>\n<p>LSIS is a company limited by guarantee registered in England with company number <strong>06454450</strong>. <br/> Registered charity number <strong>1123636</strong>.</p>\n<p>All written enquiries regarding this website should be addressed to:</p>\n<p>The Web Services Manager<br/> Learning and Skills Improvement Service<br/> Friars House<br/> Manor House Drive <br/> Coventry <br/> CV1 2TE</p>\n<p>To sign up to access the community based features of this website you  will be asked to submit information about you which is personally  identifiable. By entering your details in the fields requested, your  personal details to be used by both LSIS and its service providers to  enable LSIS and its service providers to supply you with the services  you select. Notwithstanding this you can access our home page and browse  our site without disclosing your personal data save information  collected by cookies that we use (see below) and subject to the terms of  our <a href=http://www.excellencegateway.org.uk/page.aspx?o=disclaimer>disclaimer</a>.</p>\n<h3>Who may process data</h3>\n<p>Your personal information (which includes your name, address and any  other details you provide to us which concern you as an individual) may  be processed both by LSIS, as the Data Controller,  and our business  partners.  Each of the companies authorised to process your information  as mentioned above will do so in accordance with this privacy policy.</p>\n<h3>Purpose of processing</h3>\n<p>We will use your information to provide you with access to the  community based features of this website, to allow you to post messages  on message boards or forums, to upload resources to the Knowledge Base,  LSIS’s repository of multimedia resources, materials, support and  examples of effective practice from across the further education system,  and to set up a personal profile. If you have given consent while  registering, we may process your information to keep you informed about  our services via email or by post and to give you the opportunity to be  involved in evaluation/improvement of LSIS programmes and services. Your  information may also be used to enable us and third parties acting on  our behalf to analyse your information, in a non-identifying form,  (generally in the form of statistics), so that we can identify trends  about usage of our website or services and improve them.</p>\n<h3>Disclosure of information</h3>\n<p>In the unlikely event that a liquidator, administrator or receiver is  appointed over us or all or any part of our assets that insolvency  practitioner may transfer your information to a third party purchaser of  the business provided that purchaser undertakes to use your information  for the same purposes as set out in this policy.  We undertake not to  provide your personal information to third parties save in accordance  with this policy.  Your information will not be disclosed to government  or local authorities or other government institutions save as required  by law or other binding regulations.</p>\n<h3>Cookies</h3>\n<p>We may send a small file to your computer when you visit our  website.  This will enable us to identify your computer, track your  behaviour on our website and to identify your particular areas of  interest so as to enhance your future visits to this website. We may use  cookies to collect and store personal data and we link information  stored by cookies with personal data you supply to us. Save for the use  of cookies, we do not automatically log data or collect data save for  information you specifically provide to us. You can set your computer  browser to reject cookies but this may preclude your use of certain  parts of this website.</p>\n<h3>Security measures</h3>\n<p>We have implemented security policies, rules and technical measures  to protect the personal data that we have under our control from  unauthorised access, improper use and disclosure, unauthorised  destruction or accidental loss.</p>\n<h3>Users under 16</h3>\n<p>If you are aged 16 or under, you must get your parent''s or guardian''s  permission beforehand if you wish to use this website and if you are  going to provide personal information to us.</p>\n<h3>Access to information</h3>\n<p>You may ask us whether we are storing personal information about you  by writing to us stating your full name and your address, at:</p>\n<p>Learning and Skills Improvement Service<br/> Friars House<br/> Manor House Drive<br/> Coventry<br/> CV1 2TE</p>\n<p>If you have a data protection enquiry please use the relevant option on our <a href=http://www.excellencegateway.org.uk/page.aspx?o=feedback target=_self>feedback form</a>.</p>\n<p>A small administrative charge not exceeding £10 may be made for  fulfilling this request.  We may ask for proof of your identity before  providing any information and reserve the right to refuse to provide  information requested if identity is not established.</p>\n<h3>GENERAL WEBSITE TERMS OF USE</h3>\n<h3>Intellectual Property</h3>\n<p>All website design, text, graphics, the selection and arrangement  thereof are  Copyright © Learning and Skills Improvement Service 2010,  ALL RIGHTS RESERVED.</p>\n<p>Ownership of certain materials on this site has been transferred to  LSIS under the terms of Public Sector Information (PSI) licence no.  C2006010400. Reasonable steps have been taken to check third party  rights and permissions for this work, but LSIS will not be held  responsible for any unintentional infringements. If you have any  comments or queries, please <a href=http://www.excellencegateway.org.uk/page.aspx?o=feedback>contact the Excellence Gateway team</a>.</p>\n<p>The names, images and logos identifying the LSIS, LSIS Excellence  Gateway, or any third parties are proprietary marks of the LSIS and/or  third parties. Nothing contained herein shall be construed as conferring  by implication or otherwise any licence or right under any trademark or  patent of the LSIS or any other third party.</p>\n<h3>Improvement services providers</h3>\n<p>By submitting an application to the directory of improvement services providers published on this website, You agree:</p>\n<p>(a) to confirm that the information given is correct.</p>\n<p>(b) to have read the code of practice for listed suppliers and agree to abide by it.</p>\n<p>(c) to authorise LSIS to publish the information in this application form to list the services you/your organisation offer</p>\n<p>(d) to accept that LSIS have the right to make the final decision  about listing you/your organisation and that LSIS will not necessarily  give reasons for its decisions in this respect.</p>\n<p>You also understand that:</p>\n<p>(a) these requirements apply to every listed organisation or individual consultant.</p>\n<p>(b) any advice offered to a provider shall not incur any liability or  legal responsibility for LSIS, whether such advice is accepted,  implemented or rejected by the provider.</p>\n<p>(c) the selection of the supplier is the sole responsibility of  providers; no guarantee can be given that work will be awarded to  you/your organisation and that neither LSIS nor the providers will give  reasons for their decisions.</p>\n<p>(d) LSIS will carry out spot checks on applications, requesting  evidence of information provided herewith, and any false information  supplied will automatically result in disqualification should this be  discovered subsequent to publication in the Directory.</p>\n<p>(e) the information you supply will be held on a database available  to anyone accessing the portal. The data will be shared if you/your  organisation is selected for the provision of any improvement service.</p>\n<p>(f) providers who select you/your organisation to deliver improvement  services will be invited to give feedback on the services you/your  organisation provided by rating and commenting on their level of  satisfaction.</p>\n<p>(g) the data you have provided in the application form will not be used for any other purpose than that stated above.</p>\n<h3>Disclaimer of Warranty and Liability</h3>\n<p>The following provisions may be curtailed or disallowed by the laws  of certain jurisdictions.  In such case, the terms hereof are to be read  as excluding or limiting such term so as to satisfy such law.</p>\n<p><strong>Accuracy and suitability of information</strong></p>\n<p>We do not represent or warrant that the information accessible via  this website is accurate, complete or current. We have no liability  whatsoever in respect of any use which you make of such information.</p>\n<p>The information provided on this website has not been written to meet  your individual requirements and it is your sole responsibility to  satisfy yourself prior to using information or services from us that  this information or these services are suitable for your purposes.</p>\n<p><strong>Virus protection</strong></p>\n<p>Whilst we make all reasonable attempts to exclude viruses from the  website, we cannot ensure such exclusion and no liability is accepted  for viruses.  Thus, you are recommended to take all appropriate  safeguards before downloading information or images from this website.</p>\n<p><strong>Warranties</strong></p>\n<p>All warranties, express or implied, statutory or otherwise are hereby excluded.</p>\n<p><strong>Liability for damages</strong></p>\n<p>Neither we nor any of our employees or affiliated entities will be  liable for any kind of damages and howsoever arising including, without  limitation, loss of profits, compensatory, consequential, direct,  exemplary, incidental, indirect, punitive or special, damages or any  liability which you may have to a third party, even if we have been  advised of the possibility of such loss.</p>\n<p><strong>Links</strong></p>\n<p>We are not responsible for the direct or indirect consequences of you linking to any other website from this website.</p>\n<h3>Governing Law</h3>\n<p>These terms and this disclaimer and any claim based on use of  information from this website shall be governed by the laws of England  and Wales and disputes arising herefrom shall be non-exclusively subject  to the jurisdiction of the courts of England and Wales.</p>\n<h3>Acceptance of Terms and Conditions</h3>\n<p>By entering this website you are accepting these terms and this  disclaimer. If for any reason you cannot accept these terms and this  disclaimer in full then you must leave this website immediately.</p>\n</div>', 'Privacy Policy', NULL, NULL, NULL, 0, 1, NULL, 0, 12, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(25, 'Page', '2011-12-19 17:20:40', '2012-02-16 14:25:08', 'business', 'Business', NULL, '<p>Consectetur adipiscing elit. Vivamus pharetra risus in orci tincidunt  vitae porttitor nulla laoreet. Vestibulum in diam urna, non bibendum  lectus. Aenean iaculis, erat a dignissim consectetur, purus lorem  ultricies lorem, quis interdum dui dolor non nibh. Vestibulum mi turpis,  ullamcorper ac aliquam a, porttitor eget massa. Quisque viverra ipsum  eget purus sollicitudin dapibus. Maecenas laoreet vehicula felis, et  interdum sapien sagittis suscipit. Curabitur sollicitudin volutpat ipsum  a condimentum. Donec quis massa felis. Integer vehicula dapibus massa,  sit amet hendrerit purus interdum in. Vivamus blandit nulla sit amet  sapien porta nec imperdiet arcu bibendum.</p>\n<p>Vestibulum et nibh orci. Mauris fringilla adipiscing mauris vitae  bibendum. Aenean pharetra suscipit pretium. In vel sem mauris, id porta  turpis. Integer a congue nisi. Nunc et congue metus. Praesent et est  purus, sit amet volutpat purus. Duis eget semper libero. Mauris molestie  bibendum quam eget posuere. Morbi vitae eros magna, ut consequat sem.  Cras pulvinar sapien id elit fringilla quis elementum nibh sollicitudin.  Maecenas vel libero orci. Donec a diam quis nunc sollicitudin tincidunt  ut ut elit. Duis nunc dolor, dictum ac condimentum eget, adipiscing id  tortor.</p>', 'Business', NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(26, 'LocalBusinessPage', '2011-12-20 12:47:48', '2011-12-22 13:31:49', 'andy-s-appliances', 'Andy''s Appliances', NULL, '<p>Fusce euismod consequat ante lorem ipsum dolor sit amet consectetuer  adipiscing elit pellentesque dolor aliquam congue fermentum nisl mauris  accumsan nulla veldiam sed lacus utenim <a>adipiscing aliquet nulla venenatis</a> inpede maliquet amet euismod nauctor ligula aliquam dapibus tincidunt  metus praesent justo dolor lobortis quis lobortisissim pulvinar aclorem  vestibulum sed ante. Donec sagittis euismod purus lorem ipsum dolor  samet consectetuer adipiscing elit praesent vestibulum.</p>', 'Andy''s Appliences', NULL, NULL, NULL, 0, 1, NULL, 0, 4, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 5, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(27, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-10-11 16:47:05', 'list-your-business', 'List your business', NULL, '<p>This page is an ObjectCreatorPage type. It allows a CMS user to configure a form, like the one below that lets front end users submit and create pages or any other types of content for the website. When used in conjuction with the Workflow module, submissions can be moderated prior to being published.</p>\n<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(29, 'LocalBusinessPage', '2011-12-20 17:32:59', '2011-12-22 13:31:52', 'demoville-wreckers', 'Demoville Wreckers', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium, purus a mattis vestibulum, purus elit dictum sem, quis imperdiet lacus risus in nisi. Proin ac augue tellus. Vestibulum tristique posuere semper. Nam vitae turpis arcu, condimentum facilisis enim. Donec pharetra ante a justo mattis auctor fringilla mauris feugiat. Nulla ornare metus in ipsum dapibus sit amet porta odio dictum. Sed porttitor massa non lectus euismod consectetur. Aliquam nisl massa, cursus sed laoreet porttitor, molestie placerat eros. Nunc non arcu eros. Morbi consequat nunc metus, at fringilla quam. Cras nec lacus augue. Mauris vehicula accumsan rhoncus. Nunc et ultricies ante. Aliquam erat volutpat. Ut aliquet mi quis sem iaculis lobortis vestibulum nulla volutpat.</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 5, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 3, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(47, 'LocalBusinessPage', '2011-12-21 12:41:06', '2011-12-22 13:32:45', 'demoyum-cafe', 'Demoyum Cafe', NULL, '<p>Lemon drops jelly beans topping jujubes candy lemon drops applicake dragée. Dragée danish jelly cupcake tart caramels sesame snaps. Dragée macaroon pie. Apple pie croissant liquorice tootsie roll chocolate bar gingerbread soufflé bear claw cookie. Toffee cake macaroon oat cake sweet roll jujubes cupcake tootsie roll pie. Candy oat cake cupcake halvah marzipan gummies toffee. Brownie gummies cheesecake carrot cake faworki gummi bears. Sesame snaps sweet oat cake topping jelly. Candy marzipan muffin. Donut soufflé candy canes cheesecake soufflé. Jujubes danish wafer. Wafer pie tiramisu marshmallow carrot cake sweet roll. Bonbon topping soufflé oat cake chocolate fruitcake chocolate bar donut. Caramels candy lollipop lollipop pie jelly pastry. Pudding bear claw caramels. Toffee chocolate icing. Liquorice cheesecake candy canes sweet roll apple pie carrot cake. Chocolate bar cookie cheesecake candy canes pie dragée halvah. Gummi bears icing macaroon fruitcake chocolate cake dragée. Biscuit pudding topping. Powder sesame snaps liquorice croissant candy canes. Oat cake muffin sweet roll caramels apple pie caramels applicake chocolate bar bear claw. Jelly applicake chocolate cake. Chocolate bar carrot cake jelly-o sesame snaps sweet tootsie roll biscuit. Marzipan chocolate cake chocolate bar jelly beans liquorice cotton candy cheesecake gingerbread cookie. Pastry faworki gingerbread.</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(51, 'CalendarEvent', '2011-12-22 12:08:30', '2012-02-06 15:31:07', 'christmas-in-the-park', 'Christmas in the park', NULL, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla  in leo tristique orci sagittis mattis. Proin mollis erat velit. Nam  dignissim, magna sit amet rutrum tincidunt, arcu nunc porta arcu, non  commodo nibh justo a eros. Curabitur euismod rutrum mauris, nec laoreet  enim ullamcorper eu. Sed interdum, felis eleifend tempor pulvinar, orci  massa aliquet enim, ut rutrum augue erat eu ante. Donec non ante enim.  Donec lectus magna, ultricies quis bibendum quis, ultrices a diam.  Nullam aliquam vulputate risus, a tempor elit imperdiet eu. Maecenas  tempor cursus ligula sit amet pellentesque. Nulla sagittis volutpat  eleifend.</p>\n<p>Suspendisse semper egestas suscipit. Donec non risus nunc. Mauris  ultricies odio vitae dolor fermentum ornare congue velit auctor. Donec  dapibus, massa non fermentum ultrices, massa libero condimentum tellus,  gravida fermentum ante dui eget lorem. Vivamus tincidunt euismod  malesuada. Proin urna purus, venenatis sed placerat in, consectetur ut  libero. Mauris lobortis vestibulum massa, vel aliquam purus rutrum at.  Duis sit amet dui et mi volutpat convallis quis at mauris. Ut dapibus  porta quam, quis sollicitudin libero tempor sed. Duis at quam sed leo  dictum faucibus sit amet porttitor dui. Cras accumsan aliquet  condimentum. Morbi suscipit iaculis luctus.</p>', 'Christmas in the park', NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 8, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(52, 'CalendarEvent', '2011-12-22 12:29:10', '2012-02-06 15:31:12', 'easter-in-the-park', 'Easter in the park', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Easter in the park', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 6, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(53, 'Page', '2011-12-22 12:55:55', '2012-10-12 11:34:34', 'cycle-tracks', 'Cycle Tracks', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p><a href="assets/PBNintegration.jpg" target="_blank"><img class="left" src="assets/_resampled/resizedimage302173-PBNintegration.jpg" width="302" height="173" alt="title=/" title=""/></a></p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Cycle Tracks', NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 7, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(54, 'Page', '2011-12-22 12:56:25', '2012-10-12 11:34:45', 'central-city-map', 'Central City Map', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui  blanditiis praesentium voluptatum deleniti atque corrupti quos dolores  et quas molestias excepturi sint occaecati cupiditate non provident,  similique sunt in culpa qui officia deserunt mollitia animi, id est  laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita  distinctio. Nam libero tempore, cum soluta nobis est eligendi optio  cumque nihil impedit quo minus id quod maxime placeat facere possimus,  omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem  quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet  ut et voluptates repudiandae sint et molestiae non recusandae. Itaque  earum rerum hic tenetur a sapiente delectus, ut aut reiciendis  voluptatibus maiores alias consequatur aut perferendis doloribus  asperiores repellat.</p>\n<p><a href="http://maps.google.com/maps?q=melbourne&amp;hl=en&amp;sll=37.0625,-95.677068&amp;sspn=50.111473,130.429688&amp;hnear=Melbourne+Victoria,+Australia&amp;t=m&amp;z=14" target="_blank"><img src="http://maps.google.com/staticmap?center=-37.81319,144.96298&amp;zoom=15&amp;size=726x420&amp;maptype=mobile&amp;markers=-37.81319,144.96298,red&amp;key=ABQIAAAAqQJ-gFBKUbBLaFN1HQF4KBQ_k2Fxd8XZtbWUsvz5Vrarxzf2SRSh7DRXLQmAZ-6XwtrmMhkINGT27A&amp;sensor=false/"/></a></p>', 'Central City Map', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 7, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(55, 'LocalBusinessPage', '2012-01-17 13:38:02', '2012-02-03 15:23:27', 'testing-workflow', 'Testing workflow', NULL, '<p>Testing workflow</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 11, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(57, 'SubscriptionPage', '2012-02-06 10:10:42', '2012-02-17 14:07:12', 'newsletter', 'Subscribe to our Newsletter', NULL, '<p>Please enter your email address below to receive monthly updates via email.</p>\n', 'Newsletter', NULL, NULL, NULL, 0, 1, NULL, 0, 9, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(58, 'ListingPage', '2012-02-06 11:10:39', '2012-10-10 16:19:38', 'have-your-say', 'Have your say', NULL, '<p>This is an example of a listing page. It lists a number of items in a template that is defined in the "Listings" section of the CMS. The listing content is also configurable in the CMS. We could list Files, DataObjects or Pages of a particular type or section in the site tree. In this case it is listing User Defined Form pages that are children of this page.</p>\n<p>$Listing</p>', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 12, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(60, 'RegisterableEvent', '2012-05-16 11:30:00', '2012-05-16 11:30:08', 'partay', 'Partay', NULL, NULL, 'Partay', NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(61, 'CalendarEvent', '2012-05-29 17:58:06', '2012-05-29 17:58:06', 'my-new-event', 'My new event', NULL, 'This is an event on a day here and now', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 1, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(62, 'CalendarEvent', '2012-05-29 17:58:50', '2012-05-29 17:58:50', 'my-new-event-2', 'My new event', NULL, 'This is an event on a day here and now', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(63, 'CalendarEvent', '2012-05-29 18:07:36', '2012-05-29 18:07:37', 'my-new-event-3', 'My new event', NULL, 'This is an event on a day here and now', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 6, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(64, 'CalendarEvent', '2012-05-30 10:37:56', '2012-05-30 10:37:56', 'my-new-event-4', 'My new event', NULL, 'This is an event on a day here and now', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 7, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(65, 'Calendar', '2012-10-10 11:44:25', '2012-10-10 12:53:41', 'events', 'Events', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(66, 'CalendarEvent', '2012-10-10 12:28:27', '2012-10-11 17:03:09', 'demo-event', 'Demo Event', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinction.</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 7, 65, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(67, 'UserDefinedForm', '2012-10-10 14:54:44', '2012-10-12 11:34:01', 'cyclists-have-your-say', 'Cyclists - Have your say', NULL, '<p>This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a user friendly interface in the CMS.</p>\n<p>$UserDefinedForm</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 12, 58, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(68, 'ZenGalleryPage', '2012-10-10 17:43:45', '2012-10-10 17:48:23', 'image-gallery', 'Image Gallery', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 4, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(69, 'ZenGalleryPage', '2012-10-11 10:29:20', '2012-10-12 11:30:51', 'gallery-one', 'Gallery one', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 5, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree` VALUES(70, 'ZenGalleryPage', '2012-10-11 10:44:03', '2012-10-12 11:31:09', 'gallery-two', 'Gallery Two', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 4, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_EditorGroups`
--

CREATE TABLE `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteTree_EditorGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ImageTracking`
--

CREATE TABLE `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `SiteTree_ImageTracking`
--

INSERT INTO `SiteTree_ImageTracking` VALUES(17, 2, 17, 'Content');
INSERT INTO `SiteTree_ImageTracking` VALUES(48, 53, 18, 'Content');

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_LinkTracking`
--

CREATE TABLE `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteTree_LinkTracking`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_Live`
--

CREATE TABLE `SiteTree_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('HomePage','Page','ContactPage','ErrorPage','NewsHolder','NewsArticle','MemberProfilePage','SolrSearchPage','ListingPage','RedirectorPage','LocalBusinessPage','ObjectCreatorPage','Calendar','CalendarEvent','SubscriptionPage','RegisterableEvent','UserDefinedForm','ZenGalleryPage','SiteTree','VirtualPage') CHARACTER SET utf8 DEFAULT 'HomePage',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `MetaKeywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HomepageForDomain` varchar(100) DEFAULT NULL,
  `ProvideComments` tinyint(1) NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Status` varchar(50) DEFAULT NULL,
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `ToDo` text,
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `WorkflowDefinitionID` int(11) NOT NULL DEFAULT '0',
  `ResultBoost` int(11) NOT NULL DEFAULT '0',
  `DesiredPublishDate` datetime DEFAULT NULL,
  `DesiredUnPublishDate` datetime DEFAULT NULL,
  `PublishOnDate` datetime DEFAULT NULL,
  `UnPublishOnDate` datetime DEFAULT NULL,
  `PublishJobID` int(11) NOT NULL DEFAULT '0',
  `UnPublishJobID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`),
  KEY `WorkflowDefinitionID` (`WorkflowDefinitionID`),
  KEY `PublishJobID` (`PublishJobID`),
  KEY `UnPublishJobID` (`UnPublishJobID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` VALUES(1, 'HomePage', '2011-12-15 04:04:19', '2012-02-06 13:11:54', 'home', 'Home', NULL, '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem  accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab  illo inventore veritatis et quasi architecto beatae vitae dicta sunt  explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut  odit aut fugit, sed quia consequuntur magni dolores eos qui ratione  voluptatem sequi nesciunt.</p>\n<p>Neque porro quisquam est, qui dolorem ipsum  quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam  eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat  voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam  corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?  Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse  quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo  voluptas nulla pariatur</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 7, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(2, 'Page', '2011-12-15 04:04:19', '2012-02-06 15:51:17', 'about-demoville', 'About Demoville', NULL, '<p><img class=left src=assets/_resampled/resizedimage726266-PerthCityPanorama-943x345.jpg width=726 height=266 alt= title=/></p>\n<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu, vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula. Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis tellus consequat vel. Phasellus non consectetur diam. Aenean viverra, lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet, elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis. Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec accumsan eros sit amet massa tempus sit amet dignissim augue venenatis. Integer sit amet nibh at mauris ornare ultrices.</p>\n\n', 'About Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 14, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(3, 'ContactPage', '2011-12-15 04:04:19', '2012-10-10 16:00:45', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your requests and general enquiries or call us on <strong>1234554321</strong>.</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(4, 'ErrorPage', '2011-12-15 04:04:19', '2011-12-15 04:04:19', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 13, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(5, 'ErrorPage', '2011-12-15 04:04:20', '2011-12-15 04:04:20', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 14, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(7, 'NewsHolder', '2011-12-15 16:24:04', '2012-10-10 17:08:03', 'news', 'News', NULL, NULL, 'News', NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(8, 'NewsHolder', '2011-12-15 16:24:46', '2012-10-12 11:36:26', '2011', '2011', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 3, 7, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(9, 'NewsHolder', '2011-12-15 16:24:46', '2012-10-10 17:08:02', 'dec', 'Dec', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, 8, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(10, 'NewsArticle', '2011-12-15 16:24:46', '2012-07-31 17:36:31', 'open-space-strategy', 'Open Space Strategy', NULL, '<p><strong>Planning for future growth</strong></p>\n<p>The City of Melbourne manages over 500 hectares of open space. This  represents almost 15 percent of the total area of the City of Melbourne.</p>\n<p>To meet the needs of the growing and changing residential and worker  population, and to respond to issues such as climate change, we have  prepared our first draft Open Space Strategy for the entire  municipality.</p>\n<p>The draft Open Space Strategy provides the overarching framework and  strategic direction for open space planning in the City of Melbourne for  the next 15 years.</p>\n<p>A key objective of the strategy is to plan Melbourne’s open space  network to one that is within easy walking distance to the community,  particular in areas of forecasted population growth.</p>\n<p>What kind of issues does the strategy address?</p>\n<p><strong>The strategy will provide direction on these key issues:</strong></p>\n<p>the unprecedented demand for open space as Melbourne’s population continues to grow</p>\n<p>climate change – a decade of drought, water restrictions and extreme  weather and the predicted impacts of climate change provide additional  challenges in the management of parks and reserves and the role they can  play in climate change adaptation</p>\n<p>ensuring open spaces can provide for and adapt to differing needs and  uses. This includes providing people with the opportunity to connect  with nature.</p>', 'Open Space Strategy', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 8, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(11, 'NewsArticle', '2011-12-15 16:53:39', '2012-10-10 17:08:03', 'new-newsarticle', 'New NewsArticle', NULL, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla in leo tristique orci sagittis mattis. Proin mollis erat velit. Nam dignissim, magna sit amet rutrum tincidunt, arcu nunc porta arcu, non commodo nibh justo a eros. Curabitur euismod rutrum mauris, nec laoreet enim ullamcorper eu</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 7, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(12, 'NewsArticle', '2011-12-15 16:55:23', '2012-10-10 17:07:12', 'demoville-cake-factory-opening', 'Demoville cake factory opening', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 11, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(13, 'MemberProfilePage', '2011-12-15 17:31:11', '2012-02-06 15:32:51', 'your-account', 'Your Account', NULL, NULL, 'Your Account', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(14, 'SolrSearchPage', '2011-12-15 17:33:53', '2011-12-21 15:50:35', 'search', 'Search', NULL, NULL, 'Search', NULL, NULL, NULL, 0, 1, NULL, 0, 11, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(15, 'ListingPage', '2011-12-16 10:18:03', '2012-02-06 14:33:57', 'download-more-information', 'Download more Information', NULL, '<p>This is a listing page containing files that are only viewable by logged in users</p>\n<p>$Listing</p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 6, 0, 0, 'Published', NULL, 'OnlyTheseUsers', 'Inherit', NULL, 14, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(16, 'RedirectorPage', '2011-12-16 10:22:04', '2012-02-06 14:33:57', 'download-more-information-2', 'Download more information', NULL, NULL, 'Download more information', NULL, NULL, NULL, 1, 1, NULL, 0, 7, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(17, 'Page', '2011-12-16 13:51:45', '2011-12-22 13:03:30', 'city-maps', 'City Maps', NULL, '<p>Vestibulum porta risus eget nibh ullamcorper commodo. In lorem dolor,  aliquet vel sodales euismod, hendrerit id dolor. Pellentesque ut lacus  tincidunt ipsum fermentum aliquam. In hac habitasse platea dictumst. Sed  egestas lectus a dui ullamcorper sit amet auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'City Maps', NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 4, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(18, 'Page', '2011-12-16 14:07:55', '2012-02-03 15:36:15', 'history', 'History', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem  metus, molestie sed facilisis eget, placerat a quam. Sed aliquet laoreet  felis eu porta. Phasellus magna libero, lacinia non molestie vitae,  laoreet eu diam. Aenean ac ante quis quam fermentum consequat. Cras eget  justo non libero mollis lacinia eget in felis. Nam non enim tortor.  Vestibulum in ipsum et risus semper congue vel sed metus. Praesent sem  magna, tempus eget aliquet at, facilisis sit amet ligula.</p>\n<p>Fusce suscipit euismod enim ac tincidunt. Nullam a urna non erat  ullamcorper vestibulum. Fusce laoreet, dolor nec commodo rhoncus, erat  lorem mattis sem, nec porta ante urna pellentesque tellus. Vestibulum  vitae diam a mauris dictum ultrices. Cras id eros ut turpis tempor  dignissim a et est. Ut pulvinar dui erat, vel pharetra nibh. Fusce nisi  dolor, malesuada et placerat congue, ultricies a risus. Suspendisse  varius tortor a velit pharetra elementum auctor nec mi. Donec pretium  ultrices turpis, ac vulputate justo consequat dignissim. Proin sed ante  ipsum, in posuere mauris. Cras ultricies risus et neque blandit eget  faucibus lectus varius.</p>\n<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu,  vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis  auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel  libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper  nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut  felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula.  Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus  dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec  condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis  iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis  interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis  tellus consequat vel. Phasellus non consectetur diam. Aenean viverra,  lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo  eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet,  elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis.  Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec  accumsan eros sit amet massa tempus sit amet dignissim augue venenatis.  Integer sit amet nibh at mauris ornare ultrices.</p>', 'History', NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 4, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(19, 'Page', '2011-12-16 14:30:44', '2011-12-20 14:18:31', 'indigenous-demoville', 'Indigenous Demoville', NULL, '<p>Welcome to the City of Demoville. We respectfully acknowledge that we are meeting on the traditional land of the Kulin Nation. This special place is now known by its European name of Demoville.<br/><br/>Today, Demoville is one of the great multicultural cities of the world, and is a significant meeting place. For the Wurundjeri, Boonerwrung, Taungurong, Djajawurrung and the Wathaurung which make up the Kulin Nation, Demoville has always been an important meeting place and location for events of social, educational, sporting and cultural significance.<br/><br/>City of Demoville''s acknowledgement, City of Demoville Indigenous Framework 2007-2010<br/>Indigenous community<br/><br/>The City of Demoville collaborates with its Indigenous community in the development of its many strategies, agreements and protocols designed to celebrate, support and expand Indigenous culture throughout Demoville and beyond.<br/><br/>The City of Demoville’s approach to local and national Indigenous interests is to be open, active and alert to opportunities.<br/><br/>As a local government, the City of Demoville aims to provide high quality, responsive and innovative services for its local Indigenous community. Its Indigenous Unit offers a direct connection between the organisation and the local Indigenous community.<br/><br/>Demoville is regarded by many as the hub of the Victorian Indigenous community.<br/>Indigenous Demoville<br/><br/>To find out more about Indigenous Demoville and how the City of Demoville works with Indigenous communities, download the Celebrate Indigenous Demoville guide below, or visit that''s Demoville, our website for everything to do and see in the city.</p>', 'Indigenous Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 3, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(20, 'NewsArticle', '2011-12-16 15:09:15', '2012-07-31 17:37:39', 'demo-square-a-community-landmark', 'My city Square - a community landmark', NULL, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its next decade with the unveiling of a new civic place which is set to breathe fresh life into Victoria Harbour.</p>\n<p>Delivered by a unique partnership model comprising of City of Demoville, Lend Lease and Places Victoria, the centerpiece, to be known as Demo Square, will be a next generation library and community centre.</p>\n<p>Located at the intersection where Collins Street will meet Bourke, the library and community centre will commence construction in April 2012 and aim for completion in mid 2013.</p><p>So anything I enter here is all good to go<br/></p>\n<p>Demolands became a part of the City of Demoville in 2007. The suburb''s 200 hectares of land and water are on Victoria Harbour, west of the Central Business District (CBD). Its inclusion doubled the size of the Demoville’s CBD and returned the waterfront to the city.</p>\n<p>The area is close to Demoville''s main transport networks, including Southern Cross Station. Demolands is well known as home to the Etihad Stadium and a large number of modern buildings and public spaces and artworks.</p>\n<p>From the original development at New Quay, featuring apartments, restaurants, a marina and film studios, Demolands has grown into a thriving waterfront suburb offering a mix of inner city living, shopping, business, parks, entertainment, dining, sporting events, marine transport, community events and arts and culture.</p>\n<p>Demolands has also become the national headquarters for a number of major businesses, including the National Australia Bank, ANZ, Myer, AXA, Bendigo Bank, Medibank Private and the Bureau of Meteorology.</p>\n<p>It is estimated that by around 2020 Demolands will have 20 million visitors each year, a workplace for 40,000 people daily and a residential area for up to 17,000.</p>\n<h3>What’s on in Demolands</h3>\n<p>With its idyllic mix of waterfront location and CBD lifestyle, Demolands has attracted a selection of Demoville’s hottest new bars and restaurants, shopping and cultural and sporting events.</p>\n<p> </p>\n<p>To plan your day or evening at Demolands visit our ‘What’s on section’ and select the latest Demolands program.</p>', 'Demo Square - a community landmark', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 11, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(21, 'ListingPage', '2011-12-16 17:35:54', '2012-10-11 14:33:18', 'local-businesses', 'Local Businesses', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui  blanditiis praesentium voluptatum deleniti atque corrupti quos dolores  et quas molestias excepturi sint occaecati cupiditate non provident,  similique sunt in culpa qui officia deserunt mollitia animi, id est  laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita  distinctio. Nam libero tempore, cum soluta nobis est eligendi optio  cumque nihil impedit quo minus id quod maxime placeat facere possimus,  omnis voluptas assumenda est, omnis dolor repellendus.</p>\n<p>If you have a local business in Demoville, feel free to <a href="[sitetree_link" id="27]">list it</a> here. Note that you must be <a href="[sitetree_link" id="13]">registered</a> to do this.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'LoggedInUsers', NULL, 18, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(22, 'LocalBusinessPage', '2011-12-16 18:16:25', '2011-12-22 13:31:27', 'demosville-plumbing', 'Demosville Plumbing', NULL, '<p>No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those. No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those.</p>', 'Demo Plumbing', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 7, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(23, 'LocalBusinessPage', '2011-12-19 09:49:39', '2011-12-22 13:31:44', 'demosville-silverstripe', 'Demosville SilverStripe', NULL, '<p>Pastry bear claw tootsie roll apple pie icing bonbon. Chupa chups cookie  faworki jujubes tootsie roll jujubes cotton candy liquorice. Donut  cotton candy faworki topping marshmallow topping. Sesame snaps powder  lemon drops candy canes cupcake cotton candy icing Pastry bear claw tootsie roll apple pie icing bonbon. Chupa chups cookie  faworki jujubes tootsie roll jujubes cotton candy liquorice. Donut  cotton candy faworki topping marshmallow topping. Sesame snaps powder  lemon drops candy canes cupcake cotton candy icing</p>', 'Demosville SilverStripe', NULL, NULL, NULL, 0, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 4, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(24, 'Page', '2011-12-19 15:15:10', '2011-12-21 16:01:44', 'privacy-policy', 'Privacy Policy', NULL, '<div>\n<p>Below we set out our privacy policy which will govern the way in  which we process any personal information that you provide to us. We  will notify you if the way in which we process your information is to  change at any time.</p>\n<p>The LSIS Excellence Gateway website is provided and managed by the Learning and Skills Improvement Service (LSIS).</p>\n<p>In these terms and conditions, the terms we, us  our and “LSIS Excellence Gateway” are to be taken as referring to LSIS.</p>\n<p>LSIS is a company limited by guarantee registered in England with company number <strong>06454450</strong>. <br/> Registered charity number <strong>1123636</strong>.</p>\n<p>All written enquiries regarding this website should be addressed to:</p>\n<p>The Web Services Manager<br/> Learning and Skills Improvement Service<br/> Friars House<br/> Manor House Drive <br/> Coventry <br/> CV1 2TE</p>\n<p>To sign up to access the community based features of this website you  will be asked to submit information about you which is personally  identifiable. By entering your details in the fields requested, your  personal details to be used by both LSIS and its service providers to  enable LSIS and its service providers to supply you with the services  you select. Notwithstanding this you can access our home page and browse  our site without disclosing your personal data save information  collected by cookies that we use (see below) and subject to the terms of  our <a href=http://www.excellencegateway.org.uk/page.aspx?o=disclaimer>disclaimer</a>.</p>\n<h3>Who may process data</h3>\n<p>Your personal information (which includes your name, address and any  other details you provide to us which concern you as an individual) may  be processed both by LSIS, as the Data Controller,  and our business  partners.  Each of the companies authorised to process your information  as mentioned above will do so in accordance with this privacy policy.</p>\n<h3>Purpose of processing</h3>\n<p>We will use your information to provide you with access to the  community based features of this website, to allow you to post messages  on message boards or forums, to upload resources to the Knowledge Base,  LSIS’s repository of multimedia resources, materials, support and  examples of effective practice from across the further education system,  and to set up a personal profile. If you have given consent while  registering, we may process your information to keep you informed about  our services via email or by post and to give you the opportunity to be  involved in evaluation/improvement of LSIS programmes and services. Your  information may also be used to enable us and third parties acting on  our behalf to analyse your information, in a non-identifying form,  (generally in the form of statistics), so that we can identify trends  about usage of our website or services and improve them.</p>\n<h3>Disclosure of information</h3>\n<p>In the unlikely event that a liquidator, administrator or receiver is  appointed over us or all or any part of our assets that insolvency  practitioner may transfer your information to a third party purchaser of  the business provided that purchaser undertakes to use your information  for the same purposes as set out in this policy.  We undertake not to  provide your personal information to third parties save in accordance  with this policy.  Your information will not be disclosed to government  or local authorities or other government institutions save as required  by law or other binding regulations.</p>\n<h3>Cookies</h3>\n<p>We may send a small file to your computer when you visit our  website.  This will enable us to identify your computer, track your  behaviour on our website and to identify your particular areas of  interest so as to enhance your future visits to this website. We may use  cookies to collect and store personal data and we link information  stored by cookies with personal data you supply to us. Save for the use  of cookies, we do not automatically log data or collect data save for  information you specifically provide to us. You can set your computer  browser to reject cookies but this may preclude your use of certain  parts of this website.</p>\n<h3>Security measures</h3>\n<p>We have implemented security policies, rules and technical measures  to protect the personal data that we have under our control from  unauthorised access, improper use and disclosure, unauthorised  destruction or accidental loss.</p>\n<h3>Users under 16</h3>\n<p>If you are aged 16 or under, you must get your parent''s or guardian''s  permission beforehand if you wish to use this website and if you are  going to provide personal information to us.</p>\n<h3>Access to information</h3>\n<p>You may ask us whether we are storing personal information about you  by writing to us stating your full name and your address, at:</p>\n<p>Learning and Skills Improvement Service<br/> Friars House<br/> Manor House Drive<br/> Coventry<br/> CV1 2TE</p>\n<p>If you have a data protection enquiry please use the relevant option on our <a href=http://www.excellencegateway.org.uk/page.aspx?o=feedback target=_self>feedback form</a>.</p>\n<p>A small administrative charge not exceeding £10 may be made for  fulfilling this request.  We may ask for proof of your identity before  providing any information and reserve the right to refuse to provide  information requested if identity is not established.</p>\n<h3>GENERAL WEBSITE TERMS OF USE</h3>\n<h3>Intellectual Property</h3>\n<p>All website design, text, graphics, the selection and arrangement  thereof are  Copyright © Learning and Skills Improvement Service 2010,  ALL RIGHTS RESERVED.</p>\n<p>Ownership of certain materials on this site has been transferred to  LSIS under the terms of Public Sector Information (PSI) licence no.  C2006010400. Reasonable steps have been taken to check third party  rights and permissions for this work, but LSIS will not be held  responsible for any unintentional infringements. If you have any  comments or queries, please <a href=http://www.excellencegateway.org.uk/page.aspx?o=feedback>contact the Excellence Gateway team</a>.</p>\n<p>The names, images and logos identifying the LSIS, LSIS Excellence  Gateway, or any third parties are proprietary marks of the LSIS and/or  third parties. Nothing contained herein shall be construed as conferring  by implication or otherwise any licence or right under any trademark or  patent of the LSIS or any other third party.</p>\n<h3>Improvement services providers</h3>\n<p>By submitting an application to the directory of improvement services providers published on this website, You agree:</p>\n<p>(a) to confirm that the information given is correct.</p>\n<p>(b) to have read the code of practice for listed suppliers and agree to abide by it.</p>\n<p>(c) to authorise LSIS to publish the information in this application form to list the services you/your organisation offer</p>\n<p>(d) to accept that LSIS have the right to make the final decision  about listing you/your organisation and that LSIS will not necessarily  give reasons for its decisions in this respect.</p>\n<p>You also understand that:</p>\n<p>(a) these requirements apply to every listed organisation or individual consultant.</p>\n<p>(b) any advice offered to a provider shall not incur any liability or  legal responsibility for LSIS, whether such advice is accepted,  implemented or rejected by the provider.</p>\n<p>(c) the selection of the supplier is the sole responsibility of  providers; no guarantee can be given that work will be awarded to  you/your organisation and that neither LSIS nor the providers will give  reasons for their decisions.</p>\n<p>(d) LSIS will carry out spot checks on applications, requesting  evidence of information provided herewith, and any false information  supplied will automatically result in disqualification should this be  discovered subsequent to publication in the Directory.</p>\n<p>(e) the information you supply will be held on a database available  to anyone accessing the portal. The data will be shared if you/your  organisation is selected for the provision of any improvement service.</p>\n<p>(f) providers who select you/your organisation to deliver improvement  services will be invited to give feedback on the services you/your  organisation provided by rating and commenting on their level of  satisfaction.</p>\n<p>(g) the data you have provided in the application form will not be used for any other purpose than that stated above.</p>\n<h3>Disclaimer of Warranty and Liability</h3>\n<p>The following provisions may be curtailed or disallowed by the laws  of certain jurisdictions.  In such case, the terms hereof are to be read  as excluding or limiting such term so as to satisfy such law.</p>\n<p><strong>Accuracy and suitability of information</strong></p>\n<p>We do not represent or warrant that the information accessible via  this website is accurate, complete or current. We have no liability  whatsoever in respect of any use which you make of such information.</p>\n<p>The information provided on this website has not been written to meet  your individual requirements and it is your sole responsibility to  satisfy yourself prior to using information or services from us that  this information or these services are suitable for your purposes.</p>\n<p><strong>Virus protection</strong></p>\n<p>Whilst we make all reasonable attempts to exclude viruses from the  website, we cannot ensure such exclusion and no liability is accepted  for viruses.  Thus, you are recommended to take all appropriate  safeguards before downloading information or images from this website.</p>\n<p><strong>Warranties</strong></p>\n<p>All warranties, express or implied, statutory or otherwise are hereby excluded.</p>\n<p><strong>Liability for damages</strong></p>\n<p>Neither we nor any of our employees or affiliated entities will be  liable for any kind of damages and howsoever arising including, without  limitation, loss of profits, compensatory, consequential, direct,  exemplary, incidental, indirect, punitive or special, damages or any  liability which you may have to a third party, even if we have been  advised of the possibility of such loss.</p>\n<p><strong>Links</strong></p>\n<p>We are not responsible for the direct or indirect consequences of you linking to any other website from this website.</p>\n<h3>Governing Law</h3>\n<p>These terms and this disclaimer and any claim based on use of  information from this website shall be governed by the laws of England  and Wales and disputes arising herefrom shall be non-exclusively subject  to the jurisdiction of the courts of England and Wales.</p>\n<h3>Acceptance of Terms and Conditions</h3>\n<p>By entering this website you are accepting these terms and this  disclaimer. If for any reason you cannot accept these terms and this  disclaimer in full then you must leave this website immediately.</p>\n</div>', 'Privacy Policy', NULL, NULL, NULL, 0, 1, NULL, 0, 12, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(25, 'Page', '2011-12-19 17:20:40', '2011-12-20 10:53:17', 'business', 'Business', NULL, '<p>Consectetur adipiscing elit. Vivamus pharetra risus in orci tincidunt  vitae porttitor nulla laoreet. Vestibulum in diam urna, non bibendum  lectus. Aenean iaculis, erat a dignissim consectetur, purus lorem  ultricies lorem, quis interdum dui dolor non nibh. Vestibulum mi turpis,  ullamcorper ac aliquam a, porttitor eget massa. Quisque viverra ipsum  eget purus sollicitudin dapibus. Maecenas laoreet vehicula felis, et  interdum sapien sagittis suscipit. Curabitur sollicitudin volutpat ipsum  a condimentum. Donec quis massa felis. Integer vehicula dapibus massa,  sit amet hendrerit purus interdum in. Vivamus blandit nulla sit amet  sapien porta nec imperdiet arcu bibendum.</p>\n<p>Vestibulum et nibh orci. Mauris fringilla adipiscing mauris vitae  bibendum. Aenean pharetra suscipit pretium. In vel sem mauris, id porta  turpis. Integer a congue nisi. Nunc et congue metus. Praesent et est  purus, sit amet volutpat purus. Duis eget semper libero. Mauris molestie  bibendum quam eget posuere. Morbi vitae eros magna, ut consequat sem.  Cras pulvinar sapien id elit fringilla quis elementum nibh sollicitudin.  Maecenas vel libero orci. Donec a diam quis nunc sollicitudin tincidunt  ut ut elit. Duis nunc dolor, dictum ac condimentum eget, adipiscing id  tortor.</p>', 'Business', NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(26, 'LocalBusinessPage', '2011-12-20 12:47:48', '2011-12-22 13:31:49', 'andy-s-appliances', 'Andy''s Appliances', NULL, '<p>Fusce euismod consequat ante lorem ipsum dolor sit amet consectetuer  adipiscing elit pellentesque dolor aliquam congue fermentum nisl mauris  accumsan nulla veldiam sed lacus utenim <a>adipiscing aliquet nulla venenatis</a> inpede maliquet amet euismod nauctor ligula aliquam dapibus tincidunt  metus praesent justo dolor lobortis quis lobortisissim pulvinar aclorem  vestibulum sed ante. Donec sagittis euismod purus lorem ipsum dolor  samet consectetuer adipiscing elit praesent vestibulum.</p>', 'Andy''s Appliences', NULL, NULL, NULL, 0, 1, NULL, 0, 4, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 5, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(27, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-10-11 16:47:05', 'list-your-business', 'List your business', NULL, '<p>This page is an ObjectCreatorPage type. It allows a CMS user to configure a form, like the one below that lets front end users submit and create pages or any other types of content for the website. When used in conjuction with the Workflow module, submissions can be moderated prior to being published.</p>\n<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(29, 'LocalBusinessPage', '2011-12-20 17:32:59', '2011-12-22 13:31:52', 'demoville-wreckers', 'Demoville Wreckers', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium, purus a mattis vestibulum, purus elit dictum sem, quis imperdiet lacus risus in nisi. Proin ac augue tellus. Vestibulum tristique posuere semper. Nam vitae turpis arcu, condimentum facilisis enim. Donec pharetra ante a justo mattis auctor fringilla mauris feugiat. Nulla ornare metus in ipsum dapibus sit amet porta odio dictum. Sed porttitor massa non lectus euismod consectetur. Aliquam nisl massa, cursus sed laoreet porttitor, molestie placerat eros. Nunc non arcu eros. Morbi consequat nunc metus, at fringilla quam. Cras nec lacus augue. Mauris vehicula accumsan rhoncus. Nunc et ultricies ante. Aliquam erat volutpat. Ut aliquet mi quis sem iaculis lobortis vestibulum nulla volutpat.</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 5, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 3, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(47, 'LocalBusinessPage', '2011-12-21 12:41:06', '2011-12-22 13:32:46', 'demoyum-cafe', 'Demoyum Cafe', NULL, '<p>Lemon drops jelly beans topping jujubes candy lemon drops applicake dragée. Dragée danish jelly cupcake tart caramels sesame snaps. Dragée macaroon pie. Apple pie croissant liquorice tootsie roll chocolate bar gingerbread soufflé bear claw cookie. Toffee cake macaroon oat cake sweet roll jujubes cupcake tootsie roll pie. Candy oat cake cupcake halvah marzipan gummies toffee. Brownie gummies cheesecake carrot cake faworki gummi bears. Sesame snaps sweet oat cake topping jelly. Candy marzipan muffin. Donut soufflé candy canes cheesecake soufflé. Jujubes danish wafer. Wafer pie tiramisu marshmallow carrot cake sweet roll. Bonbon topping soufflé oat cake chocolate fruitcake chocolate bar donut. Caramels candy lollipop lollipop pie jelly pastry. Pudding bear claw caramels. Toffee chocolate icing. Liquorice cheesecake candy canes sweet roll apple pie carrot cake. Chocolate bar cookie cheesecake candy canes pie dragée halvah. Gummi bears icing macaroon fruitcake chocolate cake dragée. Biscuit pudding topping. Powder sesame snaps liquorice croissant candy canes. Oat cake muffin sweet roll caramels apple pie caramels applicake chocolate bar bear claw. Jelly applicake chocolate cake. Chocolate bar carrot cake jelly-o sesame snaps sweet tootsie roll biscuit. Marzipan chocolate cake chocolate bar jelly beans liquorice cotton candy cheesecake gingerbread cookie. Pastry faworki gingerbread.</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(51, 'CalendarEvent', '2011-12-22 12:08:30', '2012-02-06 15:31:07', 'christmas-in-the-park', 'Christmas in the park', NULL, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla  in leo tristique orci sagittis mattis. Proin mollis erat velit. Nam  dignissim, magna sit amet rutrum tincidunt, arcu nunc porta arcu, non  commodo nibh justo a eros. Curabitur euismod rutrum mauris, nec laoreet  enim ullamcorper eu. Sed interdum, felis eleifend tempor pulvinar, orci  massa aliquet enim, ut rutrum augue erat eu ante. Donec non ante enim.  Donec lectus magna, ultricies quis bibendum quis, ultrices a diam.  Nullam aliquam vulputate risus, a tempor elit imperdiet eu. Maecenas  tempor cursus ligula sit amet pellentesque. Nulla sagittis volutpat  eleifend.</p>\n<p>Suspendisse semper egestas suscipit. Donec non risus nunc. Mauris  ultricies odio vitae dolor fermentum ornare congue velit auctor. Donec  dapibus, massa non fermentum ultrices, massa libero condimentum tellus,  gravida fermentum ante dui eget lorem. Vivamus tincidunt euismod  malesuada. Proin urna purus, venenatis sed placerat in, consectetur ut  libero. Mauris lobortis vestibulum massa, vel aliquam purus rutrum at.  Duis sit amet dui et mi volutpat convallis quis at mauris. Ut dapibus  porta quam, quis sollicitudin libero tempor sed. Duis at quam sed leo  dictum faucibus sit amet porttitor dui. Cras accumsan aliquet  condimentum. Morbi suscipit iaculis luctus.</p>', 'Christmas in the park', NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 8, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(52, 'CalendarEvent', '2011-12-22 12:29:10', '2012-02-06 15:31:12', 'easter-in-the-park', 'Easter in the park', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Easter in the park', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 6, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(53, 'Page', '2011-12-22 12:55:55', '2012-10-12 11:34:34', 'cycle-tracks', 'Cycle Tracks', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p><a href="assets/PBNintegration.jpg" target="_blank"><img class="left" src="assets/_resampled/resizedimage302173-PBNintegration.jpg" width="302" height="173" alt="title=/" title=""/></a></p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Cycle Tracks', NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 7, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(54, 'Page', '2011-12-22 12:56:25', '2012-10-12 11:34:45', 'central-city-map', 'Central City Map', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui  blanditiis praesentium voluptatum deleniti atque corrupti quos dolores  et quas molestias excepturi sint occaecati cupiditate non provident,  similique sunt in culpa qui officia deserunt mollitia animi, id est  laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita  distinctio. Nam libero tempore, cum soluta nobis est eligendi optio  cumque nihil impedit quo minus id quod maxime placeat facere possimus,  omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem  quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet  ut et voluptates repudiandae sint et molestiae non recusandae. Itaque  earum rerum hic tenetur a sapiente delectus, ut aut reiciendis  voluptatibus maiores alias consequatur aut perferendis doloribus  asperiores repellat.</p>\n<p><a href="http://maps.google.com/maps?q=melbourne&amp;hl=en&amp;sll=37.0625,-95.677068&amp;sspn=50.111473,130.429688&amp;hnear=Melbourne+Victoria,+Australia&amp;t=m&amp;z=14" target="_blank"><img src="http://maps.google.com/staticmap?center=-37.81319,144.96298&amp;zoom=15&amp;size=726x420&amp;maptype=mobile&amp;markers=-37.81319,144.96298,red&amp;key=ABQIAAAAqQJ-gFBKUbBLaFN1HQF4KBQ_k2Fxd8XZtbWUsvz5Vrarxzf2SRSh7DRXLQmAZ-6XwtrmMhkINGT27A&amp;sensor=false/"/></a></p>', 'Central City Map', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 7, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(55, 'LocalBusinessPage', '2012-01-17 13:38:02', '2012-02-03 15:23:28', 'testing-workflow', 'Testing workflow', NULL, '<p>Testing workflow</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 11, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(57, 'SubscriptionPage', '2012-02-06 10:10:42', '2012-02-17 14:07:12', 'newsletter', 'Subscribe to our Newsletter', NULL, '<p>Please enter your email address below to receive monthly updates via email.</p>\n', 'Newsletter', NULL, NULL, NULL, 0, 1, NULL, 0, 9, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(58, 'ListingPage', '2012-02-06 11:10:39', '2012-10-10 16:19:38', 'have-your-say', 'Have your say', NULL, '<p>This is an example of a listing page. It lists a number of items in a template that is defined in the "Listings" section of the CMS. The listing content is also configurable in the CMS. We could list Files, DataObjects or Pages of a particular type or section in the site tree. In this case it is listing User Defined Form pages that are children of this page.</p>\n<p>$Listing</p>', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 12, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(60, 'RegisterableEvent', '2012-05-16 11:30:00', '2012-05-16 11:30:08', 'partay', 'Partay', NULL, NULL, 'Partay', NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(62, 'CalendarEvent', '2012-05-29 17:58:50', '2012-05-29 17:58:50', 'my-new-event-2', 'My new event', NULL, 'This is an event on a day here and now', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(63, 'CalendarEvent', '2012-05-29 18:07:36', '2012-05-29 18:07:37', 'my-new-event-3', 'My new event', NULL, 'This is an event on a day here and now', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 6, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(64, 'CalendarEvent', '2012-05-30 10:37:56', '2012-05-30 10:37:56', 'my-new-event-4', 'My new event', NULL, 'This is an event on a day here and now', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 7, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(65, 'Calendar', '2012-10-10 11:44:25', '2012-10-10 12:53:42', 'events', 'Events', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(67, 'UserDefinedForm', '2012-10-10 14:54:44', '2012-10-12 11:34:02', 'cyclists-have-your-say', 'Cyclists - Have your say', NULL, '<p>This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a user friendly interface in the CMS.</p>\n<p>$UserDefinedForm</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 12, 58, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(68, 'ZenGalleryPage', '2012-10-10 17:43:45', '2012-10-10 17:48:23', 'image-gallery', 'Image Gallery', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 4, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(69, 'ZenGalleryPage', '2012-10-11 10:29:20', '2012-10-12 11:30:51', 'gallery-one', 'Gallery one', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 5, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_Live` VALUES(70, 'ZenGalleryPage', '2012-10-11 10:44:03', '2012-10-12 11:31:09', 'gallery-two', 'Gallery Two', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 4, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_versions`
--

CREATE TABLE `SiteTree_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('HomePage','Page','ContactPage','ErrorPage','NewsHolder','NewsArticle','MemberProfilePage','SolrSearchPage','ListingPage','RedirectorPage','LocalBusinessPage','ObjectCreatorPage','Calendar','CalendarEvent','SubscriptionPage','RegisterableEvent','UserDefinedForm','ZenGalleryPage','SiteTree','VirtualPage') CHARACTER SET utf8 DEFAULT 'HomePage',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `MetaKeywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HomepageForDomain` varchar(100) DEFAULT NULL,
  `ProvideComments` tinyint(1) NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Status` varchar(50) DEFAULT NULL,
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `ToDo` text,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `WorkflowDefinitionID` int(11) NOT NULL DEFAULT '0',
  `ResultBoost` int(11) NOT NULL DEFAULT '0',
  `DesiredPublishDate` datetime DEFAULT NULL,
  `DesiredUnPublishDate` datetime DEFAULT NULL,
  `PublishOnDate` datetime DEFAULT NULL,
  `UnPublishOnDate` datetime DEFAULT NULL,
  `PublishJobID` int(11) NOT NULL DEFAULT '0',
  `UnPublishJobID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`),
  KEY `WorkflowDefinitionID` (`WorkflowDefinitionID`),
  KEY `PublishJobID` (`PublishJobID`),
  KEY `UnPublishJobID` (`UnPublishJobID`),
  KEY `RecordID_Version` (`RecordID`,`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=368 ;

--
-- Dumping data for table `SiteTree_versions`
--

INSERT INTO `SiteTree_versions` VALUES(1, 1, 1, 1, 0, 0, 'Page', '2011-12-15 04:04:19', '2011-12-15 04:04:19', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=admin/>the CMS</a>. You can now access the <a href=http://doc.silverstripe.org>developer documentation</a>, or begin <a href=http://doc.silverstripe.org/doku.php?id=tutorials>the tutorials.</a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(2, 2, 1, 1, 0, 0, 'Page', '2011-12-15 04:04:19', '2011-12-15 04:04:19', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(3, 3, 1, 1, 0, 0, 'Page', '2011-12-15 04:04:19', '2011-12-15 04:04:19', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(4, 4, 1, 1, 0, 0, 'ErrorPage', '2011-12-15 04:04:19', '2011-12-15 04:04:19', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 4, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(5, 5, 1, 1, 0, 0, 'ErrorPage', '2011-12-15 04:04:20', '2011-12-15 04:04:20', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 5, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(6, 1, 2, 1, 1, 2, 'HomePage', '2011-12-15 04:04:19', '2011-12-15 14:25:10', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=admin/>the CMS</a>. You can now access the <a href=http://doc.silverstripe.org>developer documentation</a>, or begin <a href=http://doc.silverstripe.org/doku.php?id=tutorials>the tutorials.</a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(7, 6, 1, 0, 0, 0, 'SolrSearchPage', '2011-12-15 05:00:18', '2011-12-15 05:00:18', 'search', 'Search', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 6, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(8, 2, 2, 1, 2, 2, 'Page', '2011-12-15 04:04:19', '2011-12-15 15:29:10', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(9, 2, 3, 1, 2, 2, 'Page', '2011-12-15 04:04:19', '2011-12-15 15:29:17', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages. sdfsdfsdfsdf</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(10, 1, 3, 1, 1, 1, 'HomePage', '2011-12-15 04:04:19', '2011-12-15 15:32:22', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=admin/>the CMS</a>. You can now access the <a href=http://doc.silverstripe.org>developer documentation</a>, or begin <a href=http://doc.silverstripe.org/doku.php?id=tutorials>the tutorials.</a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(11, 2, 4, 1, 2, 2, 'Page', '2011-12-15 04:04:19', '2011-12-15 15:41:54', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages. sdfsdfsdfsdf ararara </p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(12, 1, 4, 1, 2, 2, 'HomePage', '2011-12-15 04:04:19', '2011-12-15 15:51:54', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=admin/>the CMS</a>. You can now access the <a href=http://doc.silverstripe.org>developer documentation</a>, or begin <a href=http://doc.silverstripe.org/doku.php?id=tutorials>the tutorials.</a> sdfsdf</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(13, 1, 5, 1, 2, 1, 'HomePage', '2011-12-15 04:04:19', '2011-12-15 15:56:11', 'home', 'Home', NULL, '<p>new pagep text</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(14, 3, 2, 1, 1, 1, 'Page', '2011-12-15 04:04:19', '2011-12-15 16:05:40', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(15, 3, 3, 0, 2, 0, 'Page', '2011-12-15 04:04:19', '2011-12-15 16:06:08', 'contact-us', 'Contact Us', NULL, '<p>Hey this is the new contact page content</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(16, 7, 1, 0, 1, 0, 'NewsHolder', '2011-12-15 16:24:04', '2011-12-15 16:24:04', 'new-newsholder', 'New NewsHolder', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 7, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(17, 7, 2, 1, 1, 4, 'NewsHolder', '2011-12-15 16:24:04', '2011-12-15 16:24:42', 'news', 'News', NULL, NULL, 'News', NULL, NULL, NULL, 1, 1, NULL, 0, 7, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(18, 8, 1, 0, 1, 0, 'NewsHolder', '2011-12-15 16:24:46', '2011-12-15 16:24:46', '2011', '2011', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 7, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(19, 9, 1, 0, 1, 0, 'NewsHolder', '2011-12-15 16:24:46', '2011-12-15 16:24:46', 'dec', 'Dec', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 8, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(20, 10, 1, 0, 1, 0, 'NewsArticle', '2011-12-15 16:24:46', '2011-12-15 16:24:46', 'new-newsarticle', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(21, 10, 2, 1, 1, 1, 'NewsArticle', '2011-12-15 16:24:46', '2011-12-15 16:27:38', 'open-space-strategy', 'Open Space Strategy', NULL, '<p><strong>Planning for future growth</strong></p>\n<p>The City of Melbourne manages over 500 hectares of open space. This  represents almost 15 percent of the total area of the City of Melbourne.</p>\n<p>To meet the needs of the growing and changing residential and worker  population, and to respond to issues such as climate change, we have  prepared our first draft Open Space Strategy for the entire  municipality.</p>\n<p>The draft Open Space Strategy provides the overarching framework and  strategic direction for open space planning in the City of Melbourne for  the next 15 years.</p>\n<p>A key objective of the strategy is to plan Melbourne’s open space  network to one that is within easy walking distance to the community,  particular in areas of forecasted population growth.</p>\n<p>What kind of issues does the strategy address?</p>\n<p><strong>The strategy will provide direction on these key issues:</strong></p>\n<p>the unprecedented demand for open space as Melbourne’s population continues to grow</p>\n<p>climate change – a decade of drought, water restrictions and extreme  weather and the predicted impacts of climate change provide additional  challenges in the management of parks and reserves and the role they can  play in climate change adaptation</p>\n<p>ensuring open spaces can provide for and adapt to differing needs and  uses. This includes providing people with the opportunity to connect  with nature.</p>', 'Open Space Strategy', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(22, 9, 2, 1, 1, 4, 'NewsHolder', '2011-12-15 16:24:46', '2011-12-15 16:27:38', 'dec', 'Dec', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 8, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(23, 8, 2, 1, 1, 4, 'NewsHolder', '2011-12-15 16:24:46', '2011-12-15 16:27:38', '2011', '2011', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 7, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(24, 11, 1, 0, 1, 0, 'NewsArticle', '2011-12-15 16:53:39', '2011-12-15 16:53:39', 'new-newsarticle', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(25, 12, 1, 0, 1, 0, 'NewsArticle', '2011-12-15 16:55:23', '2011-12-15 16:55:23', 'new-newsarticle', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(26, 13, 1, 0, 2, 0, 'MemberProfilePage', '2011-12-15 17:31:11', '2011-12-15 17:31:11', 'new-memberprofilepage', 'New MemberProfilePage', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(27, 13, 2, 1, 2, 1, 'MemberProfilePage', '2011-12-15 17:31:11', '2011-12-15 17:31:33', 'your-account', 'Your Account', NULL, NULL, 'Your Account', NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(28, 14, 1, 0, 1, 0, 'SolrSearchPage', '2011-12-15 17:33:53', '2011-12-15 17:33:53', 'new-solrsearchpage', 'New SolrSearchPage', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 9, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(29, 14, 2, 1, 1, 1, 'SolrSearchPage', '2011-12-15 17:33:53', '2011-12-15 17:34:35', 'search-2', 'Search', NULL, NULL, 'Search', NULL, NULL, NULL, 1, 1, NULL, 0, 9, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(30, 14, 3, 1, 1, 1, 'SolrSearchPage', '2011-12-15 17:33:53', '2011-12-15 17:34:49', 'search-2', 'Search', NULL, NULL, 'Search', NULL, NULL, NULL, 0, 1, NULL, 0, 9, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(31, 15, 1, 0, 1, 0, 'Page', '2011-12-16 10:18:03', '2011-12-16 10:18:03', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 10, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(32, 15, 2, 1, 1, 1, 'Page', '2011-12-16 10:18:03', '2011-12-16 10:18:21', 'download-more-information', 'Download more Information', NULL, '<p>This is the downlod page content</p>', 'Download more Information', NULL, NULL, NULL, 1, 1, NULL, 0, 10, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(33, 15, 3, 1, 1, 1, 'Page', '2011-12-16 10:18:03', '2011-12-16 10:19:31', 'download-more-information', 'Download more Information', NULL, '<p>This is the downlod page content</p>', 'Download more Information', NULL, NULL, NULL, 1, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(34, 16, 1, 0, 1, 0, 'RedirectorPage', '2011-12-16 10:22:04', '2011-12-16 10:22:04', 'new-redirectorpage', 'New RedirectorPage', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 11, 0, 1, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(35, 16, 2, 1, 1, 1, 'RedirectorPage', '2011-12-16 10:22:04', '2011-12-16 10:22:33', 'download-more-information-2', 'Download more information', NULL, NULL, 'Download more information', NULL, NULL, NULL, 1, 1, NULL, 0, 11, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(36, 15, 4, 1, 1, 1, 'Page', '2011-12-16 10:18:03', '2011-12-16 10:22:54', 'download-more-information', 'Download more Information', NULL, '<p>This is the downlod page content</p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(37, 15, 5, 1, 1, 1, 'ListingPage', '2011-12-16 10:18:03', '2011-12-16 10:29:07', 'download-more-information', 'Download more Information', NULL, '<p>This is the downlod page content</p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(38, 15, 6, 1, 1, 1, 'ListingPage', '2011-12-16 10:18:03', '2011-12-16 10:30:13', 'download-more-information', 'Download more Information', NULL, '<p>This is the downlod page content</p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(39, 15, 7, 1, 1, 1, 'ListingPage', '2011-12-16 10:18:03', '2011-12-16 10:36:03', 'download-more-information', 'Download more Information', NULL, '<p>$Listing</p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(40, 15, 8, 1, 1, 1, 'ListingPage', '2011-12-16 10:18:03', '2011-12-16 13:11:11', 'download-more-information', 'Download more Information', NULL, '<p>$Listing</p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(41, 15, 9, 1, 1, 1, 'ListingPage', '2011-12-16 10:18:03', '2011-12-16 13:11:53', 'download-more-information', 'Download more Information', NULL, '<p>$Listing</p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(42, 15, 10, 1, 1, 1, 'ListingPage', '2011-12-16 10:18:03', '2011-12-16 13:14:51', 'download-more-information', 'Download more Information', NULL, '<p>$Listing</p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(43, 15, 11, 1, 1, 1, 'ListingPage', '2011-12-16 10:18:03', '2011-12-16 13:39:18', 'download-more-information', 'Download more Information', NULL, '<p>$Listing</p>\n<p> </p>\n<p><img class=left src=assets/Downloads/Untitled.jpg width=240 height=320 alt= title=/></p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(44, 15, 12, 1, 1, 1, 'ListingPage', '2011-12-16 10:18:03', '2011-12-16 13:39:28', 'download-more-information', 'Download more Information', NULL, '<p>$Listing</p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(45, 2, 5, 1, 1, 1, 'Page', '2011-12-15 04:04:19', '2011-12-16 13:50:08', 'about-demoville', 'About Demoville', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages. sdfsdfsdfsdf ararara </p>', 'About Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(46, 17, 1, 0, 1, 0, 'Page', '2011-12-16 13:51:45', '2011-12-16 13:51:45', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(47, 17, 2, 1, 1, 1, 'Page', '2011-12-16 13:51:45', '2011-12-16 13:53:09', 'city-maps', 'City Maps', NULL, '<p>content here</p>', 'City Maps', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(48, 18, 1, 0, 1, 0, 'Page', '2011-12-16 14:07:55', '2011-12-16 14:07:55', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(49, 18, 2, 1, 1, 1, 'Page', '2011-12-16 14:07:55', '2011-12-16 14:08:01', 'history', 'History', NULL, NULL, 'History', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(50, 2, 6, 1, 1, 1, 'Page', '2011-12-15 04:04:19', '2011-12-16 14:30:41', 'about-demoville', 'About Demoville', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages. sdfsdfsdfsdf ararara </p>', 'About Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(51, 19, 1, 0, 1, 0, 'Page', '2011-12-16 14:30:44', '2011-12-16 14:30:44', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(52, 19, 2, 1, 1, 1, 'Page', '2011-12-16 14:30:44', '2011-12-16 14:31:55', 'indigenous-demoville', 'Indigenous Demoville', NULL, '<p>Welcome to the City of Demoville. We respectfully acknowledge that we are meeting on the traditional land of the Kulin Nation. This special place is now known by its European name of Demoville.<br/><br/>Today, Demoville is one of the great multicultural cities of the world, and is a significant meeting place. For the Wurundjeri, Boonerwrung, Taungurong, Djajawurrung and the Wathaurung which make up the Kulin Nation, Demoville has always been an important meeting place and location for events of social, educational, sporting and cultural significance.<br/><br/>City of Demoville''s acknowledgement, City of Demoville Indigenous Framework 2007-2010<br/>Indigenous community<br/><br/>The City of Demoville collaborates with its Indigenous community in the development of its many strategies, agreements and protocols designed to celebrate, support and expand Indigenous culture throughout Demoville and beyond.<br/><br/>The City of Demoville’s approach to local and national Indigenous interests is to be open, active and alert to opportunities.<br/><br/>As a local government, the City of Demoville aims to provide high quality, responsive and innovative services for its local Indigenous community. Its Indigenous Unit offers a direct connection between the organisation and the local Indigenous community.<br/><br/>Demoville is regarded by many as the hub of the Victorian Indigenous community.<br/>Indigenous Demoville<br/><br/>To find out more about Indigenous Demoville and how the City of Demoville works with Indigenous communities, download the Celebrate Indigenous Demoville guide below, or visit that''s Demoville, our website for everything to do and see in the city.</p>', 'Indigenous Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(53, 20, 1, 0, 1, 0, 'NewsArticle', '2011-12-16 15:09:15', '2011-12-16 15:09:15', 'new-newsarticle', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(54, 20, 2, 1, 1, 1, 'NewsArticle', '2011-12-16 15:09:15', '2011-12-16 15:13:32', 'demo-square-a-community-landmark', 'Demo Square - a community landmark', NULL, '<h3>Demo Square – a community landmark for Demolands </h3>\n<p>Demoville’s most progressive waterfront neighbourhood has commenced its next decade with the unveiling of a new civic place which is set to breathe fresh life into Victoria Harbour.</p>\n<p>Delivered by a unique partnership model comprising of City of Demoville, Lend Lease and Places Victoria, the centerpiece, to be known as Demo Square, will be a next generation library and community centre.</p>\n<p>Located at the intersection where Collins Street will meet Bourke, the library and community centre will commence construction in April 2012 and aim for completion in mid 2013.</p>\n<p>Demolands became a part of the City of Demoville in 2007. The suburb''s 200 hectares of land and water are on Victoria Harbour, west of the Central Business District (CBD). Its inclusion doubled the size of the Demoville’s CBD and returned the waterfront to the city.</p>\n<p>The area is close to Demoville''s main transport networks, including Southern Cross Station. Demolands is well known as home to the Etihad Stadium and a large number of modern buildings and public spaces and artworks.</p>\n<p>From the original development at New Quay, featuring apartments, restaurants, a marina and film studios, Demolands has grown into a thriving waterfront suburb offering a mix of inner city living, shopping, business, parks, entertainment, dining, sporting events, marine transport, community events and arts and culture.</p>\n<p>Demolands has also become the national headquarters for a number of major businesses, including the National Australia Bank, ANZ, Myer, AXA, Bendigo Bank, Medibank Private and the Bureau of Meteorology.</p>\n<p>It is estimated that by around 2020 Demolands will have 20 million visitors each year, a workplace for 40,000 people daily and a residential area for up to 17,000.</p>\n<h3>What’s on in Demolands</h3>\n<p>With its idyllic mix of waterfront location and CBD lifestyle, Demolands has attracted a selection of Demoville’s hottest new bars and restaurants, shopping and cultural and sporting events.</p>\n<p> </p>\n<p>To plan your day or evening at Demolands visit our ‘What’s on section’ and select the latest Demolands program.</p>', 'Demo Square - a community landmark', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(55, 20, 3, 1, 1, 1, 'NewsArticle', '2011-12-16 15:09:15', '2011-12-16 15:22:38', 'demo-square-a-community-landmark', 'Demo Square - a community landmark', NULL, '<h3>Demo Square – a community landmark for Demolands </h3>\n<p>Demoville’s most progressive waterfront neighbourhood has commenced its next decade with the unveiling of a new civic place which is set to breathe fresh life into Victoria Harbour.</p>\n<p>Delivered by a unique partnership model comprising of City of Demoville, Lend Lease and Places Victoria, the centerpiece, to be known as Demo Square, will be a next generation library and community centre.</p>\n<p>Located at the intersection where Collins Street will meet Bourke, the library and community centre will commence construction in April 2012 and aim for completion in mid 2013.</p>\n<p>Demolands became a part of the City of Demoville in 2007. The suburb''s 200 hectares of land and water are on Victoria Harbour, west of the Central Business District (CBD). Its inclusion doubled the size of the Demoville’s CBD and returned the waterfront to the city.</p>\n<p>The area is close to Demoville''s main transport networks, including Southern Cross Station. Demolands is well known as home to the Etihad Stadium and a large number of modern buildings and public spaces and artworks.</p>\n<p>From the original development at New Quay, featuring apartments, restaurants, a marina and film studios, Demolands has grown into a thriving waterfront suburb offering a mix of inner city living, shopping, business, parks, entertainment, dining, sporting events, marine transport, community events and arts and culture.</p>\n<p>Demolands has also become the national headquarters for a number of major businesses, including the National Australia Bank, ANZ, Myer, AXA, Bendigo Bank, Medibank Private and the Bureau of Meteorology.</p>\n<p>It is estimated that by around 2020 Demolands will have 20 million visitors each year, a workplace for 40,000 people daily and a residential area for up to 17,000.</p>\n<h3>What’s on in Demolands</h3>\n<p>With its idyllic mix of waterfront location and CBD lifestyle, Demolands has attracted a selection of Demoville’s hottest new bars and restaurants, shopping and cultural and sporting events.</p>\n<p> </p>\n<p>To plan your day or evening at Demolands visit our ‘What’s on section’ and select the latest Demolands program.</p>', 'Demo Square - a community landmark', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(56, 21, 1, 0, 1, 0, 'ListingPage', '2011-12-16 17:35:54', '2011-12-16 17:35:54', 'new-listingpage', 'New ListingPage', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 12, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(57, 21, 2, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2011-12-16 17:37:42', 'local-businesses', 'Local Businesses', NULL, '<p>Books are useless! I only ever read one book, To Kill A Mockingbird,  and it gave me absolutely no insight on how to kill mockingbirds! Sure  it taught me not to judge a man by the color of his skin…but what good  does *that* do me? I hope I didn''t brain my damage. Shoplifting is a  victimless crime. Like punching someone in the dark.</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 12, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(58, 21, 3, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2011-12-16 18:00:09', 'local-businesses', 'Local Businesses', NULL, '<p>Books are useless! I only ever read one book, To Kill A Mockingbird,  and it gave me absolutely no insight on how to kill mockingbirds! Sure  it taught me not to judge a man by the color of his skin…but what good  does *that* do me? I hope I didn''t brain my damage. Shoplifting is a  victimless crime. Like punching someone in the dark.</p>\n<p> </p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 12, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(59, 21, 4, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2011-12-16 18:01:47', 'local-businesses', 'Local Businesses', NULL, '<p>Books are useless! I only ever read one book, To Kill A Mockingbird,  and it gave me absolutely no insight on how to kill mockingbirds! Sure  it taught me not to judge a man by the color of his skin…but what good  does *that* do me? I hope I didn''t brain my damage. Shoplifting is a  victimless crime. Like punching someone in the dark.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 12, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(60, 21, 5, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2011-12-16 18:16:01', 'local-businesses', 'Local Businesses', NULL, '<p>Books are useless! I only ever read one book, To Kill A Mockingbird,  and it gave me absolutely no insight on how to kill mockingbirds! Sure  it taught me not to judge a man by the color of his skin…but what good  does *that* do me? I hope I didn''t brain my damage. Shoplifting is a  victimless crime. Like punching someone in the dark.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 12, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(61, 21, 6, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2011-12-16 18:16:14', 'local-businesses', 'Local Businesses', NULL, '<p>Books are useless! I only ever read one book, To Kill A Mockingbird,  and it gave me absolutely no insight on how to kill mockingbirds! Sure  it taught me not to judge a man by the color of his skin…but what good  does *that* do me? I hope I didn''t brain my damage. Shoplifting is a  victimless crime. Like punching someone in the dark.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 12, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(62, 22, 1, 0, 1, 0, 'LocalBusinessPage', '2011-12-16 18:16:25', '2011-12-16 18:16:25', 'new-localbusinesspage', 'New LocalBusinessPage', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(63, 22, 2, 1, 1, 1, 'LocalBusinessPage', '2011-12-16 18:16:25', '2011-12-16 18:16:45', 'demo-plumbing', 'Demo Plumbing', NULL, '<p>No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those. No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those.</p>', 'Demo Plumbing', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(64, 21, 7, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2011-12-16 18:16:57', 'local-businesses', 'Local Businesses', NULL, '<p>Books are useless! I only ever read one book, To Kill A Mockingbird,  and it gave me absolutely no insight on how to kill mockingbirds! Sure  it taught me not to judge a man by the color of his skin…but what good  does *that* do me? I hope I didn''t brain my damage. Shoplifting is a  victimless crime. Like punching someone in the dark.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 12, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(65, 22, 3, 1, 1, 1, 'LocalBusinessPage', '2011-12-16 18:16:25', '2011-12-19 09:46:41', 'demo-plumbing', 'Demo Plumbing', NULL, '<p>No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those. No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those.</p>', 'Demo Plumbing', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(66, 23, 1, 0, 1, 0, 'LocalBusinessPage', '2011-12-19 09:49:39', '2011-12-19 09:49:39', 'new-localbusinesspage', 'New LocalBusinessPage', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(67, 23, 2, 1, 1, 1, 'LocalBusinessPage', '2011-12-19 09:49:39', '2011-12-19 09:56:58', 'demosville-silverstripe', 'Demosville SilverStripe', NULL, '<p>Pastry bear claw tootsie roll apple pie icing bonbon. Chupa chups cookie  faworki jujubes tootsie roll jujubes cotton candy liquorice. Donut  cotton candy faworki topping marshmallow topping. Sesame snaps powder  lemon drops candy canes cupcake cotton candy icing Pastry bear claw tootsie roll apple pie icing bonbon. Chupa chups cookie  faworki jujubes tootsie roll jujubes cotton candy liquorice. Donut  cotton candy faworki topping marshmallow topping. Sesame snaps powder  lemon drops candy canes cupcake cotton candy icing</p>', 'Demosville SilverStripe', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(68, 22, 4, 1, 1, 1, 'LocalBusinessPage', '2011-12-16 18:16:25', '2011-12-19 09:57:22', 'demosville-plumbing', 'Demosville Plumbing', NULL, '<p>No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those. No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those.</p>', 'Demo Plumbing', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(69, 22, 5, 1, 1, 1, 'LocalBusinessPage', '2011-12-16 18:16:25', '2011-12-19 09:59:02', 'demosville-plumbing', 'Demosville Plumbing', NULL, '<p>No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those. No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those.</p>', 'Demo Plumbing', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(70, 13, 3, 1, 1, 1, 'MemberProfilePage', '2011-12-15 17:31:11', '2011-12-19 11:54:17', 'your-account', 'Your Account', NULL, NULL, 'Your Account', NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(71, 15, 13, 1, 1, 1, 'ListingPage', '2011-12-16 10:18:03', '2011-12-19 11:56:07', 'download-more-information', 'Download more Information', NULL, '<p>$Listing</p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'OnlyTheseUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(72, 24, 1, 0, 1, 0, 'Page', '2011-12-19 15:15:10', '2011-12-19 15:15:10', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 13, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(73, 24, 2, 1, 1, 1, 'Page', '2011-12-19 15:15:10', '2011-12-19 15:17:28', 'privacy-policy', 'Privacy Policy', NULL, '<div>\n<h3>PRIVACY POLICY</h3>\n<p>Below we set out our privacy policy which will govern the way in  which we process any personal information that you provide to us. We  will notify you if the way in which we process your information is to  change at any time.</p>\n<p>The LSIS Excellence Gateway website is provided and managed by the Learning and Skills Improvement Service (LSIS).</p>\n<p>In these terms and conditions, the terms we, us  our and “LSIS Excellence Gateway” are to be taken as referring to LSIS.</p>\n<p>LSIS is a company limited by guarantee registered in England with company number <strong>06454450</strong>. <br/> Registered charity number <strong>1123636</strong>.</p>\n<p>All written enquiries regarding this website should be addressed to:</p>\n<p>The Web Services Manager<br/> Learning and Skills Improvement Service<br/> Friars House<br/> Manor House Drive <br/> Coventry <br/> CV1 2TE</p>\n<p>To sign up to access the community based features of this website you  will be asked to submit information about you which is personally  identifiable. By entering your details in the fields requested, your  personal details to be used by both LSIS and its service providers to  enable LSIS and its service providers to supply you with the services  you select. Notwithstanding this you can access our home page and browse  our site without disclosing your personal data save information  collected by cookies that we use (see below) and subject to the terms of  our <a href=http://www.excellencegateway.org.uk/page.aspx?o=disclaimer>disclaimer</a>.</p>\n<h3>Who may process data</h3>\n<p>Your personal information (which includes your name, address and any  other details you provide to us which concern you as an individual) may  be processed both by LSIS, as the Data Controller,  and our business  partners.  Each of the companies authorised to process your information  as mentioned above will do so in accordance with this privacy policy.</p>\n<h3>Purpose of processing</h3>\n<p>We will use your information to provide you with access to the  community based features of this website, to allow you to post messages  on message boards or forums, to upload resources to the Knowledge Base,  LSIS’s repository of multimedia resources, materials, support and  examples of effective practice from across the further education system,  and to set up a personal profile. If you have given consent while  registering, we may process your information to keep you informed about  our services via email or by post and to give you the opportunity to be  involved in evaluation/improvement of LSIS programmes and services. Your  information may also be used to enable us and third parties acting on  our behalf to analyse your information, in a non-identifying form,  (generally in the form of statistics), so that we can identify trends  about usage of our website or services and improve them.</p>\n<h3>Disclosure of information</h3>\n<p>In the unlikely event that a liquidator, administrator or receiver is  appointed over us or all or any part of our assets that insolvency  practitioner may transfer your information to a third party purchaser of  the business provided that purchaser undertakes to use your information  for the same purposes as set out in this policy.  We undertake not to  provide your personal information to third parties save in accordance  with this policy.  Your information will not be disclosed to government  or local authorities or other government institutions save as required  by law or other binding regulations.</p>\n<h3>Cookies</h3>\n<p>We may send a small file to your computer when you visit our  website.  This will enable us to identify your computer, track your  behaviour on our website and to identify your particular areas of  interest so as to enhance your future visits to this website. We may use  cookies to collect and store personal data and we link information  stored by cookies with personal data you supply to us. Save for the use  of cookies, we do not automatically log data or collect data save for  information you specifically provide to us. You can set your computer  browser to reject cookies but this may preclude your use of certain  parts of this website.</p>\n<h3>Security measures</h3>\n<p>We have implemented security policies, rules and technical measures  to protect the personal data that we have under our control from  unauthorised access, improper use and disclosure, unauthorised  destruction or accidental loss.</p>\n<h3>Users under 16</h3>\n<p>If you are aged 16 or under, you must get your parent''s or guardian''s  permission beforehand if you wish to use this website and if you are  going to provide personal information to us.</p>\n<h3>Access to information</h3>\n<p>You may ask us whether we are storing personal information about you  by writing to us stating your full name and your address, at:</p>\n<p>Learning and Skills Improvement Service<br/> Friars House<br/> Manor House Drive<br/> Coventry<br/> CV1 2TE</p>\n<p>If you have a data protection enquiry please use the relevant option on our <a href=http://www.excellencegateway.org.uk/page.aspx?o=feedback target=_self>feedback form</a>.</p>\n<p>A small administrative charge not exceeding £10 may be made for  fulfilling this request.  We may ask for proof of your identity before  providing any information and reserve the right to refuse to provide  information requested if identity is not established.</p>\n<h3>GENERAL WEBSITE TERMS OF USE</h3>\n<h3>Intellectual Property</h3>\n<p>All website design, text, graphics, the selection and arrangement  thereof are  Copyright © Learning and Skills Improvement Service 2010,  ALL RIGHTS RESERVED.</p>\n<p>Ownership of certain materials on this site has been transferred to  LSIS under the terms of Public Sector Information (PSI) licence no.  C2006010400. Reasonable steps have been taken to check third party  rights and permissions for this work, but LSIS will not be held  responsible for any unintentional infringements. If you have any  comments or queries, please <a href=http://www.excellencegateway.org.uk/page.aspx?o=feedback>contact the Excellence Gateway team</a>.</p>\n<p>The names, images and logos identifying the LSIS, LSIS Excellence  Gateway, or any third parties are proprietary marks of the LSIS and/or  third parties. Nothing contained herein shall be construed as conferring  by implication or otherwise any licence or right under any trademark or  patent of the LSIS or any other third party.</p>\n<h3>Improvement services providers</h3>\n<p>By submitting an application to the directory of improvement services providers published on this website, You agree:</p>\n<p>(a) to confirm that the information given is correct.</p>\n<p>(b) to have read the code of practice for listed suppliers and agree to abide by it.</p>\n<p>(c) to authorise LSIS to publish the information in this application form to list the services you/your organisation offer</p>\n<p>(d) to accept that LSIS have the right to make the final decision  about listing you/your organisation and that LSIS will not necessarily  give reasons for its decisions in this respect.</p>\n<p>You also understand that:</p>\n<p>(a) these requirements apply to every listed organisation or individual consultant.</p>\n<p>(b) any advice offered to a provider shall not incur any liability or  legal responsibility for LSIS, whether such advice is accepted,  implemented or rejected by the provider.</p>\n<p>(c) the selection of the supplier is the sole responsibility of  providers; no guarantee can be given that work will be awarded to  you/your organisation and that neither LSIS nor the providers will give  reasons for their decisions.</p>\n<p>(d) LSIS will carry out spot checks on applications, requesting  evidence of information provided herewith, and any false information  supplied will automatically result in disqualification should this be  discovered subsequent to publication in the Directory.</p>\n<p>(e) the information you supply will be held on a database available  to anyone accessing the portal. The data will be shared if you/your  organisation is selected for the provision of any improvement service.</p>\n<p>(f) providers who select you/your organisation to deliver improvement  services will be invited to give feedback on the services you/your  organisation provided by rating and commenting on their level of  satisfaction.</p>\n<p>(g) the data you have provided in the application form will not be used for any other purpose than that stated above.</p>\n<h3>Disclaimer of Warranty and Liability</h3>\n<p>The following provisions may be curtailed or disallowed by the laws  of certain jurisdictions.  In such case, the terms hereof are to be read  as excluding or limiting such term so as to satisfy such law.</p>\n<p><strong>Accuracy and suitability of information</strong></p>\n<p>We do not represent or warrant that the information accessible via  this website is accurate, complete or current. We have no liability  whatsoever in respect of any use which you make of such information.</p>\n<p>The information provided on this website has not been written to meet  your individual requirements and it is your sole responsibility to  satisfy yourself prior to using information or services from us that  this information or these services are suitable for your purposes.</p>\n<p><strong>Virus protection</strong></p>\n<p>Whilst we make all reasonable attempts to exclude viruses from the  website, we cannot ensure such exclusion and no liability is accepted  for viruses.  Thus, you are recommended to take all appropriate  safeguards before downloading information or images from this website.</p>\n<p><strong>Warranties</strong></p>\n<p>All warranties, express or implied, statutory or otherwise are hereby excluded.</p>\n<p><strong>Liability for damages</strong></p>\n<p>Neither we nor any of our employees or affiliated entities will be  liable for any kind of damages and howsoever arising including, without  limitation, loss of profits, compensatory, consequential, direct,  exemplary, incidental, indirect, punitive or special, damages or any  liability which you may have to a third party, even if we have been  advised of the possibility of such loss.</p>\n<p><strong>Links</strong></p>\n<p>We are not responsible for the direct or indirect consequences of you linking to any other website from this website.</p>\n<h3>Governing Law</h3>\n<p>These terms and this disclaimer and any claim based on use of  information from this website shall be governed by the laws of England  and Wales and disputes arising herefrom shall be non-exclusively subject  to the jurisdiction of the courts of England and Wales.</p>\n<h3>Acceptance of Terms and Conditions</h3>\n<p>By entering this website you are accepting these terms and this  disclaimer. If for any reason you cannot accept these terms and this  disclaimer in full then you must leave this website immediately.</p>\n</div>', 'Privacy Policy', NULL, NULL, NULL, 1, 1, NULL, 0, 13, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(74, 24, 3, 1, 1, 1, 'Page', '2011-12-19 15:15:10', '2011-12-19 15:19:47', 'privacy-policy', 'Privacy Policy', NULL, '<div>\n<h3>PRIVACY POLICY</h3>\n<p>Below we set out our privacy policy which will govern the way in  which we process any personal information that you provide to us. We  will notify you if the way in which we process your information is to  change at any time.</p>\n<p>The LSIS Excellence Gateway website is provided and managed by the Learning and Skills Improvement Service (LSIS).</p>\n<p>In these terms and conditions, the terms we, us  our and “LSIS Excellence Gateway” are to be taken as referring to LSIS.</p>\n<p>LSIS is a company limited by guarantee registered in England with company number <strong>06454450</strong>. <br/> Registered charity number <strong>1123636</strong>.</p>\n<p>All written enquiries regarding this website should be addressed to:</p>\n<p>The Web Services Manager<br/> Learning and Skills Improvement Service<br/> Friars House<br/> Manor House Drive <br/> Coventry <br/> CV1 2TE</p>\n<p>To sign up to access the community based features of this website you  will be asked to submit information about you which is personally  identifiable. By entering your details in the fields requested, your  personal details to be used by both LSIS and its service providers to  enable LSIS and its service providers to supply you with the services  you select. Notwithstanding this you can access our home page and browse  our site without disclosing your personal data save information  collected by cookies that we use (see below) and subject to the terms of  our <a href=http://www.excellencegateway.org.uk/page.aspx?o=disclaimer>disclaimer</a>.</p>\n<h3>Who may process data</h3>\n<p>Your personal information (which includes your name, address and any  other details you provide to us which concern you as an individual) may  be processed both by LSIS, as the Data Controller,  and our business  partners.  Each of the companies authorised to process your information  as mentioned above will do so in accordance with this privacy policy.</p>\n<h3>Purpose of processing</h3>\n<p>We will use your information to provide you with access to the  community based features of this website, to allow you to post messages  on message boards or forums, to upload resources to the Knowledge Base,  LSIS’s repository of multimedia resources, materials, support and  examples of effective practice from across the further education system,  and to set up a personal profile. If you have given consent while  registering, we may process your information to keep you informed about  our services via email or by post and to give you the opportunity to be  involved in evaluation/improvement of LSIS programmes and services. Your  information may also be used to enable us and third parties acting on  our behalf to analyse your information, in a non-identifying form,  (generally in the form of statistics), so that we can identify trends  about usage of our website or services and improve them.</p>\n<h3>Disclosure of information</h3>\n<p>In the unlikely event that a liquidator, administrator or receiver is  appointed over us or all or any part of our assets that insolvency  practitioner may transfer your information to a third party purchaser of  the business provided that purchaser undertakes to use your information  for the same purposes as set out in this policy.  We undertake not to  provide your personal information to third parties save in accordance  with this policy.  Your information will not be disclosed to government  or local authorities or other government institutions save as required  by law or other binding regulations.</p>\n<h3>Cookies</h3>\n<p>We may send a small file to your computer when you visit our  website.  This will enable us to identify your computer, track your  behaviour on our website and to identify your particular areas of  interest so as to enhance your future visits to this website. We may use  cookies to collect and store personal data and we link information  stored by cookies with personal data you supply to us. Save for the use  of cookies, we do not automatically log data or collect data save for  information you specifically provide to us. You can set your computer  browser to reject cookies but this may preclude your use of certain  parts of this website.</p>\n<h3>Security measures</h3>\n<p>We have implemented security policies, rules and technical measures  to protect the personal data that we have under our control from  unauthorised access, improper use and disclosure, unauthorised  destruction or accidental loss.</p>\n<h3>Users under 16</h3>\n<p>If you are aged 16 or under, you must get your parent''s or guardian''s  permission beforehand if you wish to use this website and if you are  going to provide personal information to us.</p>\n<h3>Access to information</h3>\n<p>You may ask us whether we are storing personal information about you  by writing to us stating your full name and your address, at:</p>\n<p>Learning and Skills Improvement Service<br/> Friars House<br/> Manor House Drive<br/> Coventry<br/> CV1 2TE</p>\n<p>If you have a data protection enquiry please use the relevant option on our <a href=http://www.excellencegateway.org.uk/page.aspx?o=feedback target=_self>feedback form</a>.</p>\n<p>A small administrative charge not exceeding £10 may be made for  fulfilling this request.  We may ask for proof of your identity before  providing any information and reserve the right to refuse to provide  information requested if identity is not established.</p>\n<h3>GENERAL WEBSITE TERMS OF USE</h3>\n<h3>Intellectual Property</h3>\n<p>All website design, text, graphics, the selection and arrangement  thereof are  Copyright © Learning and Skills Improvement Service 2010,  ALL RIGHTS RESERVED.</p>\n<p>Ownership of certain materials on this site has been transferred to  LSIS under the terms of Public Sector Information (PSI) licence no.  C2006010400. Reasonable steps have been taken to check third party  rights and permissions for this work, but LSIS will not be held  responsible for any unintentional infringements. If you have any  comments or queries, please <a href=http://www.excellencegateway.org.uk/page.aspx?o=feedback>contact the Excellence Gateway team</a>.</p>\n<p>The names, images and logos identifying the LSIS, LSIS Excellence  Gateway, or any third parties are proprietary marks of the LSIS and/or  third parties. Nothing contained herein shall be construed as conferring  by implication or otherwise any licence or right under any trademark or  patent of the LSIS or any other third party.</p>\n<h3>Improvement services providers</h3>\n<p>By submitting an application to the directory of improvement services providers published on this website, You agree:</p>\n<p>(a) to confirm that the information given is correct.</p>\n<p>(b) to have read the code of practice for listed suppliers and agree to abide by it.</p>\n<p>(c) to authorise LSIS to publish the information in this application form to list the services you/your organisation offer</p>\n<p>(d) to accept that LSIS have the right to make the final decision  about listing you/your organisation and that LSIS will not necessarily  give reasons for its decisions in this respect.</p>\n<p>You also understand that:</p>\n<p>(a) these requirements apply to every listed organisation or individual consultant.</p>\n<p>(b) any advice offered to a provider shall not incur any liability or  legal responsibility for LSIS, whether such advice is accepted,  implemented or rejected by the provider.</p>\n<p>(c) the selection of the supplier is the sole responsibility of  providers; no guarantee can be given that work will be awarded to  you/your organisation and that neither LSIS nor the providers will give  reasons for their decisions.</p>\n<p>(d) LSIS will carry out spot checks on applications, requesting  evidence of information provided herewith, and any false information  supplied will automatically result in disqualification should this be  discovered subsequent to publication in the Directory.</p>\n<p>(e) the information you supply will be held on a database available  to anyone accessing the portal. The data will be shared if you/your  organisation is selected for the provision of any improvement service.</p>\n<p>(f) providers who select you/your organisation to deliver improvement  services will be invited to give feedback on the services you/your  organisation provided by rating and commenting on their level of  satisfaction.</p>\n<p>(g) the data you have provided in the application form will not be used for any other purpose than that stated above.</p>\n<h3>Disclaimer of Warranty and Liability</h3>\n<p>The following provisions may be curtailed or disallowed by the laws  of certain jurisdictions.  In such case, the terms hereof are to be read  as excluding or limiting such term so as to satisfy such law.</p>\n<p><strong>Accuracy and suitability of information</strong></p>\n<p>We do not represent or warrant that the information accessible via  this website is accurate, complete or current. We have no liability  whatsoever in respect of any use which you make of such information.</p>\n<p>The information provided on this website has not been written to meet  your individual requirements and it is your sole responsibility to  satisfy yourself prior to using information or services from us that  this information or these services are suitable for your purposes.</p>\n<p><strong>Virus protection</strong></p>\n<p>Whilst we make all reasonable attempts to exclude viruses from the  website, we cannot ensure such exclusion and no liability is accepted  for viruses.  Thus, you are recommended to take all appropriate  safeguards before downloading information or images from this website.</p>\n<p><strong>Warranties</strong></p>\n<p>All warranties, express or implied, statutory or otherwise are hereby excluded.</p>\n<p><strong>Liability for damages</strong></p>\n<p>Neither we nor any of our employees or affiliated entities will be  liable for any kind of damages and howsoever arising including, without  limitation, loss of profits, compensatory, consequential, direct,  exemplary, incidental, indirect, punitive or special, damages or any  liability which you may have to a third party, even if we have been  advised of the possibility of such loss.</p>\n<p><strong>Links</strong></p>\n<p>We are not responsible for the direct or indirect consequences of you linking to any other website from this website.</p>\n<h3>Governing Law</h3>\n<p>These terms and this disclaimer and any claim based on use of  information from this website shall be governed by the laws of England  and Wales and disputes arising herefrom shall be non-exclusively subject  to the jurisdiction of the courts of England and Wales.</p>\n<h3>Acceptance of Terms and Conditions</h3>\n<p>By entering this website you are accepting these terms and this  disclaimer. If for any reason you cannot accept these terms and this  disclaimer in full then you must leave this website immediately.</p>\n</div>', 'Privacy Policy', NULL, NULL, NULL, 0, 1, NULL, 0, 13, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(75, 25, 1, 0, 1, 0, 'Page', '2011-12-19 17:20:40', '2011-12-19 17:20:40', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 14, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(76, 25, 2, 1, 1, 1, 'Page', '2011-12-19 17:20:40', '2011-12-19 17:21:27', 'business', 'Business', NULL, '<p>Consectetur adipiscing elit. Vivamus pharetra risus in orci tincidunt  vitae porttitor nulla laoreet. Vestibulum in diam urna, non bibendum  lectus. Aenean iaculis, erat a dignissim consectetur, purus lorem  ultricies lorem, quis interdum dui dolor non nibh. Vestibulum mi turpis,  ullamcorper ac aliquam a, porttitor eget massa. Quisque viverra ipsum  eget purus sollicitudin dapibus. Maecenas laoreet vehicula felis, et  interdum sapien sagittis suscipit. Curabitur sollicitudin volutpat ipsum  a condimentum. Donec quis massa felis. Integer vehicula dapibus massa,  sit amet hendrerit purus interdum in. Vivamus blandit nulla sit amet  sapien porta nec imperdiet arcu bibendum.</p>\n<p>Vestibulum et nibh orci. Mauris fringilla adipiscing mauris vitae  bibendum. Aenean pharetra suscipit pretium. In vel sem mauris, id porta  turpis. Integer a congue nisi. Nunc et congue metus. Praesent et est  purus, sit amet volutpat purus. Duis eget semper libero. Mauris molestie  bibendum quam eget posuere. Morbi vitae eros magna, ut consequat sem.  Cras pulvinar sapien id elit fringilla quis elementum nibh sollicitudin.  Maecenas vel libero orci. Donec a diam quis nunc sollicitudin tincidunt  ut ut elit. Duis nunc dolor, dictum ac condimentum eget, adipiscing id  tortor.</p>', 'Business', NULL, NULL, NULL, 1, 1, NULL, 0, 14, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(77, 25, 3, 0, 1, 0, 'Page', '2011-12-19 17:20:40', '2011-12-19 17:21:38', 'business', 'Business', NULL, '<p>Consectetur adipiscing elit. Vivamus pharetra risus in orci tincidunt  vitae porttitor nulla laoreet. Vestibulum in diam urna, non bibendum  lectus. Aenean iaculis, erat a dignissim consectetur, purus lorem  ultricies lorem, quis interdum dui dolor non nibh. Vestibulum mi turpis,  ullamcorper ac aliquam a, porttitor eget massa. Quisque viverra ipsum  eget purus sollicitudin dapibus. Maecenas laoreet vehicula felis, et  interdum sapien sagittis suscipit. Curabitur sollicitudin volutpat ipsum  a condimentum. Donec quis massa felis. Integer vehicula dapibus massa,  sit amet hendrerit purus interdum in. Vivamus blandit nulla sit amet  sapien porta nec imperdiet arcu bibendum.</p>\n<p>Vestibulum et nibh orci. Mauris fringilla adipiscing mauris vitae  bibendum. Aenean pharetra suscipit pretium. In vel sem mauris, id porta  turpis. Integer a congue nisi. Nunc et congue metus. Praesent et est  purus, sit amet volutpat purus. Duis eget semper libero. Mauris molestie  bibendum quam eget posuere. Morbi vitae eros magna, ut consequat sem.  Cras pulvinar sapien id elit fringilla quis elementum nibh sollicitudin.  Maecenas vel libero orci. Donec a diam quis nunc sollicitudin tincidunt  ut ut elit. Duis nunc dolor, dictum ac condimentum eget, adipiscing id  tortor.</p>', 'Business', NULL, NULL, NULL, 1, 1, NULL, 0, 14, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(78, 25, 4, 0, 1, 0, 'Page', '2011-12-19 17:20:40', '2011-12-19 17:21:38', 'business', 'Business', NULL, '<p>Consectetur adipiscing elit. Vivamus pharetra risus in orci tincidunt  vitae porttitor nulla laoreet. Vestibulum in diam urna, non bibendum  lectus. Aenean iaculis, erat a dignissim consectetur, purus lorem  ultricies lorem, quis interdum dui dolor non nibh. Vestibulum mi turpis,  ullamcorper ac aliquam a, porttitor eget massa. Quisque viverra ipsum  eget purus sollicitudin dapibus. Maecenas laoreet vehicula felis, et  interdum sapien sagittis suscipit. Curabitur sollicitudin volutpat ipsum  a condimentum. Donec quis massa felis. Integer vehicula dapibus massa,  sit amet hendrerit purus interdum in. Vivamus blandit nulla sit amet  sapien porta nec imperdiet arcu bibendum.</p>\n<p>Vestibulum et nibh orci. Mauris fringilla adipiscing mauris vitae  bibendum. Aenean pharetra suscipit pretium. In vel sem mauris, id porta  turpis. Integer a congue nisi. Nunc et congue metus. Praesent et est  purus, sit amet volutpat purus. Duis eget semper libero. Mauris molestie  bibendum quam eget posuere. Morbi vitae eros magna, ut consequat sem.  Cras pulvinar sapien id elit fringilla quis elementum nibh sollicitudin.  Maecenas vel libero orci. Donec a diam quis nunc sollicitudin tincidunt  ut ut elit. Duis nunc dolor, dictum ac condimentum eget, adipiscing id  tortor.</p>', 'Business', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(79, 25, 5, 0, 1, 0, 'Page', '2011-12-19 17:20:40', '2011-12-19 17:21:54', 'business', 'Business', NULL, '<p>Consectetur adipiscing elit. Vivamus pharetra risus in orci tincidunt  vitae porttitor nulla laoreet. Vestibulum in diam urna, non bibendum  lectus. Aenean iaculis, erat a dignissim consectetur, purus lorem  ultricies lorem, quis interdum dui dolor non nibh. Vestibulum mi turpis,  ullamcorper ac aliquam a, porttitor eget massa. Quisque viverra ipsum  eget purus sollicitudin dapibus. Maecenas laoreet vehicula felis, et  interdum sapien sagittis suscipit. Curabitur sollicitudin volutpat ipsum  a condimentum. Donec quis massa felis. Integer vehicula dapibus massa,  sit amet hendrerit purus interdum in. Vivamus blandit nulla sit amet  sapien porta nec imperdiet arcu bibendum.</p>\n<p>Vestibulum et nibh orci. Mauris fringilla adipiscing mauris vitae  bibendum. Aenean pharetra suscipit pretium. In vel sem mauris, id porta  turpis. Integer a congue nisi. Nunc et congue metus. Praesent et est  purus, sit amet volutpat purus. Duis eget semper libero. Mauris molestie  bibendum quam eget posuere. Morbi vitae eros magna, ut consequat sem.  Cras pulvinar sapien id elit fringilla quis elementum nibh sollicitudin.  Maecenas vel libero orci. Donec a diam quis nunc sollicitudin tincidunt  ut ut elit. Duis nunc dolor, dictum ac condimentum eget, adipiscing id  tortor.</p>', 'Business', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(80, 25, 6, 0, 1, 0, 'Page', '2011-12-19 17:20:40', '2011-12-19 17:21:54', 'business', 'Business', NULL, '<p>Consectetur adipiscing elit. Vivamus pharetra risus in orci tincidunt  vitae porttitor nulla laoreet. Vestibulum in diam urna, non bibendum  lectus. Aenean iaculis, erat a dignissim consectetur, purus lorem  ultricies lorem, quis interdum dui dolor non nibh. Vestibulum mi turpis,  ullamcorper ac aliquam a, porttitor eget massa. Quisque viverra ipsum  eget purus sollicitudin dapibus. Maecenas laoreet vehicula felis, et  interdum sapien sagittis suscipit. Curabitur sollicitudin volutpat ipsum  a condimentum. Donec quis massa felis. Integer vehicula dapibus massa,  sit amet hendrerit purus interdum in. Vivamus blandit nulla sit amet  sapien porta nec imperdiet arcu bibendum.</p>\n<p>Vestibulum et nibh orci. Mauris fringilla adipiscing mauris vitae  bibendum. Aenean pharetra suscipit pretium. In vel sem mauris, id porta  turpis. Integer a congue nisi. Nunc et congue metus. Praesent et est  purus, sit amet volutpat purus. Duis eget semper libero. Mauris molestie  bibendum quam eget posuere. Morbi vitae eros magna, ut consequat sem.  Cras pulvinar sapien id elit fringilla quis elementum nibh sollicitudin.  Maecenas vel libero orci. Donec a diam quis nunc sollicitudin tincidunt  ut ut elit. Duis nunc dolor, dictum ac condimentum eget, adipiscing id  tortor.</p>', 'Business', NULL, NULL, NULL, 1, 1, NULL, 0, 12, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(81, 21, 8, 0, 1, 0, 'ListingPage', '2011-12-16 17:35:54', '2011-12-19 17:21:57', 'local-businesses', 'Local Businesses', NULL, '<p>Books are useless! I only ever read one book, To Kill A Mockingbird,  and it gave me absolutely no insight on how to kill mockingbirds! Sure  it taught me not to judge a man by the color of his skin…but what good  does *that* do me? I hope I didn''t brain my damage. Shoplifting is a  victimless crime. Like punching someone in the dark.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(82, 21, 9, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2011-12-19 17:21:57', 'local-businesses', 'Local Businesses', NULL, '<p>Books are useless! I only ever read one book, To Kill A Mockingbird,  and it gave me absolutely no insight on how to kill mockingbirds! Sure  it taught me not to judge a man by the color of his skin…but what good  does *that* do me? I hope I didn''t brain my damage. Shoplifting is a  victimless crime. Like punching someone in the dark.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(83, 1, 6, 1, 1, 1, 'HomePage', '2011-12-15 04:04:19', '2011-12-19 17:38:26', 'home', 'Home', NULL, '<p>Books are useless! I only ever read one book, To Kill A Mockingbird,   and it gave me absolutely no insight on how to kill mockingbirds! Sure   it taught me not to judge a man by the color of his skin…but what good   does *that* do me? I hope I didn''t brain my damage. Shoplifting is a   victimless crime. Like punching someone in the dark.</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(84, 10, 3, 1, 1, 1, 'NewsArticle', '2011-12-15 16:24:46', '2011-12-20 09:48:44', 'open-space-strategy', 'Open Space Strategy', NULL, '<p><strong>Planning for future growth</strong></p>\n<p>The City of Melbourne manages over 500 hectares of open space. This  represents almost 15 percent of the total area of the City of Melbourne.</p>\n<p>To meet the needs of the growing and changing residential and worker  population, and to respond to issues such as climate change, we have  prepared our first draft Open Space Strategy for the entire  municipality.</p>\n<p>The draft Open Space Strategy provides the overarching framework and  strategic direction for open space planning in the City of Melbourne for  the next 15 years.</p>\n<p>A key objective of the strategy is to plan Melbourne’s open space  network to one that is within easy walking distance to the community,  particular in areas of forecasted population growth.</p>\n<p>What kind of issues does the strategy address?</p>\n<p><strong>The strategy will provide direction on these key issues:</strong></p>\n<p>the unprecedented demand for open space as Melbourne’s population continues to grow</p>\n<p>climate change – a decade of drought, water restrictions and extreme  weather and the predicted impacts of climate change provide additional  challenges in the management of parks and reserves and the role they can  play in climate change adaptation</p>\n<p>ensuring open spaces can provide for and adapt to differing needs and  uses. This includes providing people with the opportunity to connect  with nature.</p>', 'Open Space Strategy', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(85, 25, 7, 1, 1, 1, 'Page', '2011-12-19 17:20:40', '2011-12-20 10:53:17', 'business', 'Business', NULL, '<p>Consectetur adipiscing elit. Vivamus pharetra risus in orci tincidunt  vitae porttitor nulla laoreet. Vestibulum in diam urna, non bibendum  lectus. Aenean iaculis, erat a dignissim consectetur, purus lorem  ultricies lorem, quis interdum dui dolor non nibh. Vestibulum mi turpis,  ullamcorper ac aliquam a, porttitor eget massa. Quisque viverra ipsum  eget purus sollicitudin dapibus. Maecenas laoreet vehicula felis, et  interdum sapien sagittis suscipit. Curabitur sollicitudin volutpat ipsum  a condimentum. Donec quis massa felis. Integer vehicula dapibus massa,  sit amet hendrerit purus interdum in. Vivamus blandit nulla sit amet  sapien porta nec imperdiet arcu bibendum.</p>\n<p>Vestibulum et nibh orci. Mauris fringilla adipiscing mauris vitae  bibendum. Aenean pharetra suscipit pretium. In vel sem mauris, id porta  turpis. Integer a congue nisi. Nunc et congue metus. Praesent et est  purus, sit amet volutpat purus. Duis eget semper libero. Mauris molestie  bibendum quam eget posuere. Morbi vitae eros magna, ut consequat sem.  Cras pulvinar sapien id elit fringilla quis elementum nibh sollicitudin.  Maecenas vel libero orci. Donec a diam quis nunc sollicitudin tincidunt  ut ut elit. Duis nunc dolor, dictum ac condimentum eget, adipiscing id  tortor.</p>', 'Business', NULL, NULL, NULL, 1, 1, NULL, 0, 12, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(86, 21, 10, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2011-12-20 10:55:38', 'local-businesses', 'Local Businesses', NULL, '<p>Books are useless! I only ever read one book, To Kill A Mockingbird,  and it gave me absolutely no insight on how to kill mockingbirds! Sure  it taught me not to judge a man by the color of his skin…but what good  does *that* do me? I hope I didn''t brain my damage. Shoplifting is a  victimless crime. Like punching someone in the dark.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(87, 22, 6, 1, 1, 1, 'LocalBusinessPage', '2011-12-16 18:16:25', '2011-12-20 10:56:16', 'demosville-plumbing', 'Demosville Plumbing', NULL, '<p>No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those. No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those.</p>', 'Demo Plumbing', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(88, 23, 3, 1, 1, 1, 'LocalBusinessPage', '2011-12-19 09:49:39', '2011-12-20 10:56:24', 'demosville-silverstripe', 'Demosville SilverStripe', NULL, '<p>Pastry bear claw tootsie roll apple pie icing bonbon. Chupa chups cookie  faworki jujubes tootsie roll jujubes cotton candy liquorice. Donut  cotton candy faworki topping marshmallow topping. Sesame snaps powder  lemon drops candy canes cupcake cotton candy icing Pastry bear claw tootsie roll apple pie icing bonbon. Chupa chups cookie  faworki jujubes tootsie roll jujubes cotton candy liquorice. Donut  cotton candy faworki topping marshmallow topping. Sesame snaps powder  lemon drops candy canes cupcake cotton candy icing</p>', 'Demosville SilverStripe', NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(89, 3, 4, 1, 1, 1, 'ContactPage', '2011-12-15 04:04:19', '2011-12-20 12:18:39', 'contact-us', 'Contact Us', NULL, '<p>Hey this is the new contact page content</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(90, 3, 5, 1, 1, 1, 'ContactPage', '2011-12-15 04:04:19', '2011-12-20 12:46:46', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your  requests and general enquiries or call us on <strong>1234554321</strong>.</p>\n<p><strong>Demoville Council</strong><br/>1 Cecil Place<br/> Prahran<br/> Victoria 3181<br/> Australia</p>\n<div>Phone: 1234512345<br/>Fax: 5432154321<br/>Email: demo@demoville.com.au<br/><a href=contact-us>Online enquiry form</a>\n<ul/></div>\n<ul/>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(91, 3, 6, 1, 1, 1, 'ContactPage', '2011-12-15 04:04:19', '2011-12-20 12:47:04', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your  requests and general enquiries or call us on <strong>1234554321</strong>.</p>\n<p><strong>Demoville Council</strong><br/>1 Cecil Place<br/> Prahran<br/> Victoria 3181<br/> Australia</p>\n<div>Phone: 1234512345<br/>Fax: 5432154321<br/>Email: demo@demoville.com.au<br/><a href=contact-us> </a></div>\n<div/>\n<div/>\n<div/>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(92, 26, 1, 0, 1, 0, 'LocalBusinessPage', '2011-12-20 12:47:48', '2011-12-20 12:47:48', 'new-localbusinesspage', 'New LocalBusinessPage', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(93, 26, 2, 1, 1, 1, 'LocalBusinessPage', '2011-12-20 12:47:48', '2011-12-20 12:55:32', 'andy-s-appliances', 'Andy''s Appliances', NULL, '<p>Fusce euismod consequat ante lorem ipsum dolor sit amet consectetuer  adipiscing elit pellentesque dolor aliquam congue fermentum nisl mauris  accumsan nulla veldiam sed lacus utenim <a>adipiscing aliquet nulla venenatis</a> inpede maliquet amet euismod nauctor ligula aliquam dapibus tincidunt  metus praesent justo dolor lobortis quis lobortisissim pulvinar aclorem  vestibulum sed ante. Donec sagittis euismod purus lorem ipsum dolor  samet consectetuer adipiscing elit praesent vestibulum.</p>', 'Andy''s Appliences', NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(94, 26, 3, 1, 1, 1, 'LocalBusinessPage', '2011-12-20 12:47:48', '2011-12-20 12:55:55', 'andy-s-appliances', 'Andy''s Appliances', NULL, '<p>Fusce euismod consequat ante lorem ipsum dolor sit amet consectetuer  adipiscing elit pellentesque dolor aliquam congue fermentum nisl mauris  accumsan nulla veldiam sed lacus utenim <a>adipiscing aliquet nulla venenatis</a> inpede maliquet amet euismod nauctor ligula aliquam dapibus tincidunt  metus praesent justo dolor lobortis quis lobortisissim pulvinar aclorem  vestibulum sed ante. Donec sagittis euismod purus lorem ipsum dolor  samet consectetuer adipiscing elit praesent vestibulum.</p>', 'Andy''s Appliences', NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(95, 26, 4, 1, 1, 1, 'LocalBusinessPage', '2011-12-20 12:47:48', '2011-12-20 12:56:37', 'andy-s-appliances', 'Andy''s Appliances', NULL, '<p>Fusce euismod consequat ante lorem ipsum dolor sit amet consectetuer  adipiscing elit pellentesque dolor aliquam congue fermentum nisl mauris  accumsan nulla veldiam sed lacus utenim <a>adipiscing aliquet nulla venenatis</a> inpede maliquet amet euismod nauctor ligula aliquam dapibus tincidunt  metus praesent justo dolor lobortis quis lobortisissim pulvinar aclorem  vestibulum sed ante. Donec sagittis euismod purus lorem ipsum dolor  samet consectetuer adipiscing elit praesent vestibulum.</p>', 'Andy''s Appliences', NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(96, 2, 7, 1, 1, 1, 'Page', '2011-12-15 04:04:19', '2011-12-20 14:14:43', 'about-demoville', 'About Demoville', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages. sdfsdfsdfsdf ararara </p>', 'About Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(97, 17, 3, 1, 1, 1, 'Page', '2011-12-16 13:51:45', '2011-12-20 14:18:24', 'city-maps', 'City Maps', NULL, '<p>content here</p>', 'City Maps', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(98, 18, 3, 1, 1, 1, 'Page', '2011-12-16 14:07:55', '2011-12-20 14:18:28', 'history', 'History', NULL, NULL, 'History', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(99, 19, 3, 1, 1, 1, 'Page', '2011-12-16 14:30:44', '2011-12-20 14:18:31', 'indigenous-demoville', 'Indigenous Demoville', NULL, '<p>Welcome to the City of Demoville. We respectfully acknowledge that we are meeting on the traditional land of the Kulin Nation. This special place is now known by its European name of Demoville.<br/><br/>Today, Demoville is one of the great multicultural cities of the world, and is a significant meeting place. For the Wurundjeri, Boonerwrung, Taungurong, Djajawurrung and the Wathaurung which make up the Kulin Nation, Demoville has always been an important meeting place and location for events of social, educational, sporting and cultural significance.<br/><br/>City of Demoville''s acknowledgement, City of Demoville Indigenous Framework 2007-2010<br/>Indigenous community<br/><br/>The City of Demoville collaborates with its Indigenous community in the development of its many strategies, agreements and protocols designed to celebrate, support and expand Indigenous culture throughout Demoville and beyond.<br/><br/>The City of Demoville’s approach to local and national Indigenous interests is to be open, active and alert to opportunities.<br/><br/>As a local government, the City of Demoville aims to provide high quality, responsive and innovative services for its local Indigenous community. Its Indigenous Unit offers a direct connection between the organisation and the local Indigenous community.<br/><br/>Demoville is regarded by many as the hub of the Victorian Indigenous community.<br/>Indigenous Demoville<br/><br/>To find out more about Indigenous Demoville and how the City of Demoville works with Indigenous communities, download the Celebrate Indigenous Demoville guide below, or visit that''s Demoville, our website for everything to do and see in the city.</p>', 'Indigenous Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(100, 27, 1, 0, 1, 0, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2011-12-20 16:44:52', 'new-objectcreatorpage', 'New ObjectCreatorPage', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(101, 27, 2, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2011-12-20 16:48:57', 'list-your-local-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(102, 27, 3, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2011-12-20 16:58:46', 'list-your-local-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(103, 27, 4, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2011-12-20 16:59:11', 'list-your-local-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 15, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(104, 27, 5, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2011-12-20 17:09:08', 'list-your-local-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 15, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(105, 27, 6, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2011-12-20 17:10:00', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 15, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(106, 27, 7, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2011-12-20 17:25:01', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 15, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(107, 28, 1, 0, 3, 0, 'LocalBusinessPage', '2011-12-20 17:29:58', '2011-12-20 17:29:58', 'demoville-wreckers', 'Demoville Wreckers', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium, purus a mattis vestibulum, purus elit dictum sem, quis imperdiet lacus risus in nisi. Proin ac augue tellus. Vestibulum tristique posuere semper. Nam vitae turpis arcu, condimentum facilisis enim. Donec pharetra ante a justo mattis auctor fringilla mauris feugiat. Nulla ornare metus in ipsum dapibus sit amet porta odio dictum. Sed porttitor massa non lectus euismod consectetur. Aliquam nisl massa, cursus sed laoreet porttitor, molestie placerat eros. Nunc non arcu eros. Morbi consequat nunc metus, at fringilla quam. Cras nec lacus augue. Mauris vehicula accumsan rhoncus. Nunc et ultricies ante. Aliquam erat volutpat. Ut aliquet mi quis sem iaculis lobortis vestibulum nulla volutpat.', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 25, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(108, 27, 8, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2011-12-20 17:32:10', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 15, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(109, 29, 1, 0, 3, 0, 'LocalBusinessPage', '2011-12-20 17:32:59', '2011-12-20 17:32:59', 'demoville-wreckers', 'Demoville Wreckers', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium, purus a mattis vestibulum, purus elit dictum sem, quis imperdiet lacus risus in nisi. Proin ac augue tellus. Vestibulum tristique posuere semper. Nam vitae turpis arcu, condimentum facilisis enim. Donec pharetra ante a justo mattis auctor fringilla mauris feugiat. Nulla ornare metus in ipsum dapibus sit amet porta odio dictum. Sed porttitor massa non lectus euismod consectetur. Aliquam nisl massa, cursus sed laoreet porttitor, molestie placerat eros. Nunc non arcu eros. Morbi consequat nunc metus, at fringilla quam. Cras nec lacus augue. Mauris vehicula accumsan rhoncus. Nunc et ultricies ante. Aliquam erat volutpat. Ut aliquet mi quis sem iaculis lobortis vestibulum nulla volutpat.', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(110, 30, 1, 0, 1, 0, 'LocalBusinessPage', '2011-12-21 09:56:47', '2011-12-21 09:56:47', '123', '123', NULL, '123', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 6, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(111, 31, 1, 0, 1, 0, 'LocalBusinessPage', '2011-12-21 09:58:05', '2011-12-21 09:58:05', '123-2', '123', NULL, '123', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 7, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(112, 21, 11, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2011-12-21 10:01:26', 'local-businesses', 'Local Businesses', NULL, '<p>Books are useless! I only ever read one book, To Kill A Mockingbird,  and it gave me absolutely no insight on how to kill mockingbirds! Sure  it taught me not to judge a man by the color of his skin…but what good  does *that* do me? I hope I didn''t brain my damage. Shoplifting is a  victimless crime. Like punching someone in the dark.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'LoggedInUsers', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(113, 32, 1, 0, 2, 0, 'Page', '2011-12-21 10:03:29', '2011-12-21 10:03:29', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 25, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(114, 27, 9, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2011-12-21 10:07:31', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 15, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(115, 33, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 10:07:52', '2011-12-21 10:07:52', 'shea', 'Shea', NULL, 'Shea', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(116, 34, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 10:10:33', '2011-12-21 10:10:33', 'new-localbusinesspage', 'New LocalBusinessPage', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 9, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(117, 34, 2, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 10:10:33', '2011-12-21 10:10:45', 'new-localbusinesspage', 'New LocalBusinessPage', NULL, '<p>sdfsdfsdfsf</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 9, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(118, 35, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 10:31:53', '2011-12-21 10:31:53', 'workflow-please', 'workflow please', NULL, 'workflow please', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 10, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(119, 36, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 10:45:03', '2011-12-21 10:45:03', 'workflow-nice', 'workflow nice', NULL, 'workflow nice', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 11, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(120, 37, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 10:47:35', '2011-12-21 10:47:35', 'adsfasdfa', 'adsfasdfa', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 12, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(121, 38, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 10:48:00', '2011-12-21 10:48:00', 'qq', 'qq', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 13, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(122, 39, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 10:49:19', '2011-12-21 10:49:19', 'qq-2', 'qq', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 14, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(123, 40, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 10:52:48', '2011-12-21 10:52:48', 'asdfasf', 'asdfasf', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(124, 41, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 10:54:29', '2011-12-21 10:54:29', 'asdfasdf', 'asdfasdf', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 16, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(125, 42, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 10:54:59', '2011-12-21 10:54:59', 'asdfasdf-2', 'asdfasdf', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 17, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(126, 29, 2, 1, 1, 1, 'LocalBusinessPage', '2011-12-20 17:32:59', '2011-12-21 10:56:25', 'demoville-wreckers', 'Demoville Wreckers', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium, purus a mattis vestibulum, purus elit dictum sem, quis imperdiet lacus risus in nisi. Proin ac augue tellus. Vestibulum tristique posuere semper. Nam vitae turpis arcu, condimentum facilisis enim. Donec pharetra ante a justo mattis auctor fringilla mauris feugiat. Nulla ornare metus in ipsum dapibus sit amet porta odio dictum. Sed porttitor massa non lectus euismod consectetur. Aliquam nisl massa, cursus sed laoreet porttitor, molestie placerat eros. Nunc non arcu eros. Morbi consequat nunc metus, at fringilla quam. Cras nec lacus augue. Mauris vehicula accumsan rhoncus. Nunc et ultricies ante. Aliquam erat volutpat. Ut aliquet mi quis sem iaculis lobortis vestibulum nulla volutpat.</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(127, 27, 10, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2011-12-21 11:23:46', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 15, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(128, 43, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 11:30:39', '2011-12-21 11:30:39', 'testing-message', 'testing message', NULL, 'testing message', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 6, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(129, 27, 11, 1, 2, 2, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2011-12-21 12:02:46', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 15, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(130, 44, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 12:20:06', '2011-12-21 12:20:06', 'shoould-be-great-now', 'Shoould be great now', NULL, 'Shoould be great now yeah yeah ', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 7, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(131, 45, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 12:29:32', '2011-12-21 12:29:32', 'testing-email-template', 'Testing email template', NULL, 'Testing email template', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(132, 46, 1, 0, 2, 0, 'LocalBusinessPage', '2011-12-21 12:30:26', '2011-12-21 12:30:26', 'testing-email-template-2', 'Testing email template', NULL, 'Testing email template', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 9, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(133, 47, 1, 1, 2, 1, 'LocalBusinessPage', '2011-12-21 12:41:06', '2011-12-21 12:41:06', 'demoyum-cafe', 'Demoyum Cafe', NULL, 'Lemon drops jelly beans topping jujubes candy lemon drops applicake dragée. Dragée danish jelly cupcake tart caramels sesame snaps. Dragée macaroon pie. Apple pie croissant liquorice tootsie roll chocolate bar gingerbread soufflé bear claw cookie. Toffee cake macaroon oat cake sweet roll jujubes cupcake tootsie roll pie. Candy oat cake cupcake halvah marzipan gummies toffee. Brownie gummies cheesecake carrot cake faworki gummi bears. Sesame snaps sweet oat cake topping jelly. Candy marzipan muffin. Donut soufflé candy canes cheesecake soufflé. Jujubes danish wafer. Wafer pie tiramisu marshmallow carrot cake sweet roll.\nBonbon topping soufflé oat cake chocolate fruitcake chocolate bar donut. Caramels candy lollipop lollipop pie jelly pastry. Pudding bear claw caramels. Toffee chocolate icing. Liquorice cheesecake candy canes sweet roll apple pie carrot cake. Chocolate bar cookie cheesecake candy canes pie dragée halvah. Gummi bears icing macaroon fruitcake chocolate cake dragée. Biscuit pudding topping. Powder sesame snaps liquorice croissant candy canes. Oat cake muffin sweet roll caramels apple pie caramels applicake chocolate bar bear claw. Jelly applicake chocolate cake. Chocolate bar carrot cake jelly-o sesame snaps sweet tootsie roll biscuit. Marzipan chocolate cake chocolate bar jelly beans liquorice cotton candy cheesecake gingerbread cookie. Pastry faworki gingerbread.', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 10, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(134, 48, 1, 0, 1, 0, 'SolrSearchPage', '2011-12-21 13:40:21', '2011-12-21 13:40:21', 'new-solrsearchpage', 'New SolrSearchPage', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 47, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(135, 48, 2, 1, 1, 1, 'SolrSearchPage', '2011-12-21 13:40:21', '2011-12-21 13:41:44', 'search', 'Search', NULL, NULL, 'Search', NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 47, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(136, 21, 12, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2011-12-21 14:00:40', 'local-businesses', 'Local Businesses', NULL, '<p>Books are useless! I only ever read one book, To Kill A Mockingbird,  and it gave me absolutely no insight on how to kill mockingbirds! Sure  it taught me not to judge a man by the color of his skin…but what good  does *that* do me? I hope I didn''t brain my damage. Shoplifting is a  victimless crime. Like punching someone in the dark.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'LoggedInUsers', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(137, 14, 4, 1, 1, 1, 'SolrSearchPage', '2011-12-15 17:33:53', '2011-12-21 15:02:06', 'search', 'Search', NULL, NULL, 'Search', NULL, NULL, NULL, 0, 1, NULL, 0, 9, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(138, 14, 5, 1, 1, 1, 'SolrSearchPage', '2011-12-15 17:33:53', '2011-12-21 15:50:35', 'search', 'Search', NULL, NULL, 'Search', NULL, NULL, NULL, 0, 1, NULL, 0, 9, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(139, 24, 4, 1, 1, 1, 'Page', '2011-12-19 15:15:10', '2011-12-21 16:01:44', 'privacy-policy', 'Privacy Policy', NULL, '<div>\n<p>Below we set out our privacy policy which will govern the way in  which we process any personal information that you provide to us. We  will notify you if the way in which we process your information is to  change at any time.</p>\n<p>The LSIS Excellence Gateway website is provided and managed by the Learning and Skills Improvement Service (LSIS).</p>\n<p>In these terms and conditions, the terms we, us  our and “LSIS Excellence Gateway” are to be taken as referring to LSIS.</p>\n<p>LSIS is a company limited by guarantee registered in England with company number <strong>06454450</strong>. <br/> Registered charity number <strong>1123636</strong>.</p>\n<p>All written enquiries regarding this website should be addressed to:</p>\n<p>The Web Services Manager<br/> Learning and Skills Improvement Service<br/> Friars House<br/> Manor House Drive <br/> Coventry <br/> CV1 2TE</p>\n<p>To sign up to access the community based features of this website you  will be asked to submit information about you which is personally  identifiable. By entering your details in the fields requested, your  personal details to be used by both LSIS and its service providers to  enable LSIS and its service providers to supply you with the services  you select. Notwithstanding this you can access our home page and browse  our site without disclosing your personal data save information  collected by cookies that we use (see below) and subject to the terms of  our <a href=http://www.excellencegateway.org.uk/page.aspx?o=disclaimer>disclaimer</a>.</p>\n<h3>Who may process data</h3>\n<p>Your personal information (which includes your name, address and any  other details you provide to us which concern you as an individual) may  be processed both by LSIS, as the Data Controller,  and our business  partners.  Each of the companies authorised to process your information  as mentioned above will do so in accordance with this privacy policy.</p>\n<h3>Purpose of processing</h3>\n<p>We will use your information to provide you with access to the  community based features of this website, to allow you to post messages  on message boards or forums, to upload resources to the Knowledge Base,  LSIS’s repository of multimedia resources, materials, support and  examples of effective practice from across the further education system,  and to set up a personal profile. If you have given consent while  registering, we may process your information to keep you informed about  our services via email or by post and to give you the opportunity to be  involved in evaluation/improvement of LSIS programmes and services. Your  information may also be used to enable us and third parties acting on  our behalf to analyse your information, in a non-identifying form,  (generally in the form of statistics), so that we can identify trends  about usage of our website or services and improve them.</p>\n<h3>Disclosure of information</h3>\n<p>In the unlikely event that a liquidator, administrator or receiver is  appointed over us or all or any part of our assets that insolvency  practitioner may transfer your information to a third party purchaser of  the business provided that purchaser undertakes to use your information  for the same purposes as set out in this policy.  We undertake not to  provide your personal information to third parties save in accordance  with this policy.  Your information will not be disclosed to government  or local authorities or other government institutions save as required  by law or other binding regulations.</p>\n<h3>Cookies</h3>\n<p>We may send a small file to your computer when you visit our  website.  This will enable us to identify your computer, track your  behaviour on our website and to identify your particular areas of  interest so as to enhance your future visits to this website. We may use  cookies to collect and store personal data and we link information  stored by cookies with personal data you supply to us. Save for the use  of cookies, we do not automatically log data or collect data save for  information you specifically provide to us. You can set your computer  browser to reject cookies but this may preclude your use of certain  parts of this website.</p>\n<h3>Security measures</h3>\n<p>We have implemented security policies, rules and technical measures  to protect the personal data that we have under our control from  unauthorised access, improper use and disclosure, unauthorised  destruction or accidental loss.</p>\n<h3>Users under 16</h3>\n<p>If you are aged 16 or under, you must get your parent''s or guardian''s  permission beforehand if you wish to use this website and if you are  going to provide personal information to us.</p>\n<h3>Access to information</h3>\n<p>You may ask us whether we are storing personal information about you  by writing to us stating your full name and your address, at:</p>\n<p>Learning and Skills Improvement Service<br/> Friars House<br/> Manor House Drive<br/> Coventry<br/> CV1 2TE</p>\n<p>If you have a data protection enquiry please use the relevant option on our <a href=http://www.excellencegateway.org.uk/page.aspx?o=feedback target=_self>feedback form</a>.</p>\n<p>A small administrative charge not exceeding £10 may be made for  fulfilling this request.  We may ask for proof of your identity before  providing any information and reserve the right to refuse to provide  information requested if identity is not established.</p>\n<h3>GENERAL WEBSITE TERMS OF USE</h3>\n<h3>Intellectual Property</h3>\n<p>All website design, text, graphics, the selection and arrangement  thereof are  Copyright © Learning and Skills Improvement Service 2010,  ALL RIGHTS RESERVED.</p>\n<p>Ownership of certain materials on this site has been transferred to  LSIS under the terms of Public Sector Information (PSI) licence no.  C2006010400. Reasonable steps have been taken to check third party  rights and permissions for this work, but LSIS will not be held  responsible for any unintentional infringements. If you have any  comments or queries, please <a href=http://www.excellencegateway.org.uk/page.aspx?o=feedback>contact the Excellence Gateway team</a>.</p>\n<p>The names, images and logos identifying the LSIS, LSIS Excellence  Gateway, or any third parties are proprietary marks of the LSIS and/or  third parties. Nothing contained herein shall be construed as conferring  by implication or otherwise any licence or right under any trademark or  patent of the LSIS or any other third party.</p>\n<h3>Improvement services providers</h3>\n<p>By submitting an application to the directory of improvement services providers published on this website, You agree:</p>\n<p>(a) to confirm that the information given is correct.</p>\n<p>(b) to have read the code of practice for listed suppliers and agree to abide by it.</p>\n<p>(c) to authorise LSIS to publish the information in this application form to list the services you/your organisation offer</p>\n<p>(d) to accept that LSIS have the right to make the final decision  about listing you/your organisation and that LSIS will not necessarily  give reasons for its decisions in this respect.</p>\n<p>You also understand that:</p>\n<p>(a) these requirements apply to every listed organisation or individual consultant.</p>\n<p>(b) any advice offered to a provider shall not incur any liability or  legal responsibility for LSIS, whether such advice is accepted,  implemented or rejected by the provider.</p>\n<p>(c) the selection of the supplier is the sole responsibility of  providers; no guarantee can be given that work will be awarded to  you/your organisation and that neither LSIS nor the providers will give  reasons for their decisions.</p>\n<p>(d) LSIS will carry out spot checks on applications, requesting  evidence of information provided herewith, and any false information  supplied will automatically result in disqualification should this be  discovered subsequent to publication in the Directory.</p>\n<p>(e) the information you supply will be held on a database available  to anyone accessing the portal. The data will be shared if you/your  organisation is selected for the provision of any improvement service.</p>\n<p>(f) providers who select you/your organisation to deliver improvement  services will be invited to give feedback on the services you/your  organisation provided by rating and commenting on their level of  satisfaction.</p>\n<p>(g) the data you have provided in the application form will not be used for any other purpose than that stated above.</p>\n<h3>Disclaimer of Warranty and Liability</h3>\n<p>The following provisions may be curtailed or disallowed by the laws  of certain jurisdictions.  In such case, the terms hereof are to be read  as excluding or limiting such term so as to satisfy such law.</p>\n<p><strong>Accuracy and suitability of information</strong></p>\n<p>We do not represent or warrant that the information accessible via  this website is accurate, complete or current. We have no liability  whatsoever in respect of any use which you make of such information.</p>\n<p>The information provided on this website has not been written to meet  your individual requirements and it is your sole responsibility to  satisfy yourself prior to using information or services from us that  this information or these services are suitable for your purposes.</p>\n<p><strong>Virus protection</strong></p>\n<p>Whilst we make all reasonable attempts to exclude viruses from the  website, we cannot ensure such exclusion and no liability is accepted  for viruses.  Thus, you are recommended to take all appropriate  safeguards before downloading information or images from this website.</p>\n<p><strong>Warranties</strong></p>\n<p>All warranties, express or implied, statutory or otherwise are hereby excluded.</p>\n<p><strong>Liability for damages</strong></p>\n<p>Neither we nor any of our employees or affiliated entities will be  liable for any kind of damages and howsoever arising including, without  limitation, loss of profits, compensatory, consequential, direct,  exemplary, incidental, indirect, punitive or special, damages or any  liability which you may have to a third party, even if we have been  advised of the possibility of such loss.</p>\n<p><strong>Links</strong></p>\n<p>We are not responsible for the direct or indirect consequences of you linking to any other website from this website.</p>\n<h3>Governing Law</h3>\n<p>These terms and this disclaimer and any claim based on use of  information from this website shall be governed by the laws of England  and Wales and disputes arising herefrom shall be non-exclusively subject  to the jurisdiction of the courts of England and Wales.</p>\n<h3>Acceptance of Terms and Conditions</h3>\n<p>By entering this website you are accepting these terms and this  disclaimer. If for any reason you cannot accept these terms and this  disclaimer in full then you must leave this website immediately.</p>\n</div>', 'Privacy Policy', NULL, NULL, NULL, 0, 1, NULL, 0, 14, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(140, 20, 4, 1, 1, 1, 'NewsArticle', '2011-12-16 15:09:15', '2011-12-21 16:02:09', 'demo-square-a-community-landmark', 'Demo Square - a community landmark', NULL, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its next decade with the unveiling of a new civic place which is set to breathe fresh life into Victoria Harbour.</p>\n<p>Delivered by a unique partnership model comprising of City of Demoville, Lend Lease and Places Victoria, the centerpiece, to be known as Demo Square, will be a next generation library and community centre.</p>\n<p>Located at the intersection where Collins Street will meet Bourke, the library and community centre will commence construction in April 2012 and aim for completion in mid 2013.</p>\n<p>Demolands became a part of the City of Demoville in 2007. The suburb''s 200 hectares of land and water are on Victoria Harbour, west of the Central Business District (CBD). Its inclusion doubled the size of the Demoville’s CBD and returned the waterfront to the city.</p>\n<p>The area is close to Demoville''s main transport networks, including Southern Cross Station. Demolands is well known as home to the Etihad Stadium and a large number of modern buildings and public spaces and artworks.</p>\n<p>From the original development at New Quay, featuring apartments, restaurants, a marina and film studios, Demolands has grown into a thriving waterfront suburb offering a mix of inner city living, shopping, business, parks, entertainment, dining, sporting events, marine transport, community events and arts and culture.</p>\n<p>Demolands has also become the national headquarters for a number of major businesses, including the National Australia Bank, ANZ, Myer, AXA, Bendigo Bank, Medibank Private and the Bureau of Meteorology.</p>\n<p>It is estimated that by around 2020 Demolands will have 20 million visitors each year, a workplace for 40,000 people daily and a residential area for up to 17,000.</p>\n<h3>What’s on in Demolands</h3>\n<p>With its idyllic mix of waterfront location and CBD lifestyle, Demolands has attracted a selection of Demoville’s hottest new bars and restaurants, shopping and cultural and sporting events.</p>\n<p> </p>\n<p>To plan your day or evening at Demolands visit our ‘What’s on section’ and select the latest Demolands program.</p>', 'Demo Square - a community landmark', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(144, 51, 1, 0, 1, 0, 'RegisterableEvent', '2011-12-22 12:08:30', '2011-12-22 12:08:30', 'new-registerableevent', 'New RegisterableEvent', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(145, 51, 2, 1, 1, 1, 'RegisterableEvent', '2011-12-22 12:08:30', '2011-12-22 12:09:33', 'christmas-in-the-park', 'Christmas in the park', NULL, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla  in leo tristique orci sagittis mattis. Proin mollis erat velit. Nam  dignissim, magna sit amet rutrum tincidunt, arcu nunc porta arcu, non  commodo nibh justo a eros. Curabitur euismod rutrum mauris, nec laoreet  enim ullamcorper eu. Sed interdum, felis eleifend tempor pulvinar, orci  massa aliquet enim, ut rutrum augue erat eu ante. Donec non ante enim.  Donec lectus magna, ultricies quis bibendum quis, ultrices a diam.  Nullam aliquam vulputate risus, a tempor elit imperdiet eu. Maecenas  tempor cursus ligula sit amet pellentesque. Nulla sagittis volutpat  eleifend.</p>\n<p>Suspendisse semper egestas suscipit. Donec non risus nunc. Mauris  ultricies odio vitae dolor fermentum ornare congue velit auctor. Donec  dapibus, massa non fermentum ultrices, massa libero condimentum tellus,  gravida fermentum ante dui eget lorem. Vivamus tincidunt euismod  malesuada. Proin urna purus, venenatis sed placerat in, consectetur ut  libero. Mauris lobortis vestibulum massa, vel aliquam purus rutrum at.  Duis sit amet dui et mi volutpat convallis quis at mauris. Ut dapibus  porta quam, quis sollicitudin libero tempor sed. Duis at quam sed leo  dictum faucibus sit amet porttitor dui. Cras accumsan aliquet  condimentum. Morbi suscipit iaculis luctus.</p>', 'Christmas in the park', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(146, 51, 3, 1, 1, 1, 'RegisterableEvent', '2011-12-22 12:08:30', '2011-12-22 12:10:40', 'christmas-in-the-park', 'Christmas in the park', NULL, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla  in leo tristique orci sagittis mattis. Proin mollis erat velit. Nam  dignissim, magna sit amet rutrum tincidunt, arcu nunc porta arcu, non  commodo nibh justo a eros. Curabitur euismod rutrum mauris, nec laoreet  enim ullamcorper eu. Sed interdum, felis eleifend tempor pulvinar, orci  massa aliquet enim, ut rutrum augue erat eu ante. Donec non ante enim.  Donec lectus magna, ultricies quis bibendum quis, ultrices a diam.  Nullam aliquam vulputate risus, a tempor elit imperdiet eu. Maecenas  tempor cursus ligula sit amet pellentesque. Nulla sagittis volutpat  eleifend.</p>\n<p>Suspendisse semper egestas suscipit. Donec non risus nunc. Mauris  ultricies odio vitae dolor fermentum ornare congue velit auctor. Donec  dapibus, massa non fermentum ultrices, massa libero condimentum tellus,  gravida fermentum ante dui eget lorem. Vivamus tincidunt euismod  malesuada. Proin urna purus, venenatis sed placerat in, consectetur ut  libero. Mauris lobortis vestibulum massa, vel aliquam purus rutrum at.  Duis sit amet dui et mi volutpat convallis quis at mauris. Ut dapibus  porta quam, quis sollicitudin libero tempor sed. Duis at quam sed leo  dictum faucibus sit amet porttitor dui. Cras accumsan aliquet  condimentum. Morbi suscipit iaculis luctus.</p>', 'Christmas in the park', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(148, 52, 1, 0, 1, 0, 'CalendarEvent', '2011-12-22 12:29:10', '2011-12-22 12:29:10', 'new-calendarevent', 'New CalendarEvent', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(149, 52, 2, 1, 1, 1, 'CalendarEvent', '2011-12-22 12:29:10', '2011-12-22 12:29:47', 'easter-in-the-park', 'Easter in the park', NULL, '<p>this is the content</p>', 'Easter in the park', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(150, 52, 3, 1, 1, 1, 'CalendarEvent', '2011-12-22 12:29:10', '2011-12-22 12:39:29', 'easter-in-the-park', 'Easter in the park', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Easter in the park', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(151, 51, 4, 1, 1, 1, 'CalendarEvent', '2011-12-22 12:08:30', '2011-12-22 12:39:59', 'christmas-in-the-park', 'Christmas in the park', NULL, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla  in leo tristique orci sagittis mattis. Proin mollis erat velit. Nam  dignissim, magna sit amet rutrum tincidunt, arcu nunc porta arcu, non  commodo nibh justo a eros. Curabitur euismod rutrum mauris, nec laoreet  enim ullamcorper eu. Sed interdum, felis eleifend tempor pulvinar, orci  massa aliquet enim, ut rutrum augue erat eu ante. Donec non ante enim.  Donec lectus magna, ultricies quis bibendum quis, ultrices a diam.  Nullam aliquam vulputate risus, a tempor elit imperdiet eu. Maecenas  tempor cursus ligula sit amet pellentesque. Nulla sagittis volutpat  eleifend.</p>\n<p>Suspendisse semper egestas suscipit. Donec non risus nunc. Mauris  ultricies odio vitae dolor fermentum ornare congue velit auctor. Donec  dapibus, massa non fermentum ultrices, massa libero condimentum tellus,  gravida fermentum ante dui eget lorem. Vivamus tincidunt euismod  malesuada. Proin urna purus, venenatis sed placerat in, consectetur ut  libero. Mauris lobortis vestibulum massa, vel aliquam purus rutrum at.  Duis sit amet dui et mi volutpat convallis quis at mauris. Ut dapibus  porta quam, quis sollicitudin libero tempor sed. Duis at quam sed leo  dictum faucibus sit amet porttitor dui. Cras accumsan aliquet  condimentum. Morbi suscipit iaculis luctus.</p>', 'Christmas in the park', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(152, 51, 5, 1, 1, 1, 'CalendarEvent', '2011-12-22 12:08:30', '2011-12-22 12:41:20', 'christmas-in-the-park', 'Christmas in the park', NULL, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla  in leo tristique orci sagittis mattis. Proin mollis erat velit. Nam  dignissim, magna sit amet rutrum tincidunt, arcu nunc porta arcu, non  commodo nibh justo a eros. Curabitur euismod rutrum mauris, nec laoreet  enim ullamcorper eu. Sed interdum, felis eleifend tempor pulvinar, orci  massa aliquet enim, ut rutrum augue erat eu ante. Donec non ante enim.  Donec lectus magna, ultricies quis bibendum quis, ultrices a diam.  Nullam aliquam vulputate risus, a tempor elit imperdiet eu. Maecenas  tempor cursus ligula sit amet pellentesque. Nulla sagittis volutpat  eleifend.</p>\n<p>Suspendisse semper egestas suscipit. Donec non risus nunc. Mauris  ultricies odio vitae dolor fermentum ornare congue velit auctor. Donec  dapibus, massa non fermentum ultrices, massa libero condimentum tellus,  gravida fermentum ante dui eget lorem. Vivamus tincidunt euismod  malesuada. Proin urna purus, venenatis sed placerat in, consectetur ut  libero. Mauris lobortis vestibulum massa, vel aliquam purus rutrum at.  Duis sit amet dui et mi volutpat convallis quis at mauris. Ut dapibus  porta quam, quis sollicitudin libero tempor sed. Duis at quam sed leo  dictum faucibus sit amet porttitor dui. Cras accumsan aliquet  condimentum. Morbi suscipit iaculis luctus.</p>', 'Christmas in the park', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(153, 53, 1, 0, 1, 0, 'Page', '2011-12-22 12:55:55', '2011-12-22 12:55:55', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(154, 53, 2, 1, 1, 1, 'Page', '2011-12-22 12:55:55', '2011-12-22 12:56:15', 'cycle-tracks', 'Cycle Tracks', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Cycle Tracks', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(155, 54, 1, 0, 1, 0, 'Page', '2011-12-22 12:56:25', '2011-12-22 12:56:25', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(156, 54, 2, 1, 1, 1, 'Page', '2011-12-22 12:56:25', '2011-12-22 12:56:41', 'central-city-map', 'Central City Map', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Central City Map', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(157, 17, 4, 1, 1, 1, 'Page', '2011-12-16 13:51:45', '2011-12-22 12:56:59', 'city-maps', 'City Maps', NULL, '<p>Vestibulum porta risus eget nibh ullamcorper commodo. In lorem dolor,  aliquet vel sodales euismod, hendrerit id dolor. Pellentesque ut lacus  tincidunt ipsum fermentum aliquam. In hac habitasse platea dictumst. Sed  egestas lectus a dui ullamcorper sit amet auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'City Maps', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(158, 22, 7, 1, 1, 1, 'LocalBusinessPage', '2011-12-16 18:16:25', '2011-12-22 13:31:26', 'demosville-plumbing', 'Demosville Plumbing', NULL, '<p>No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those. No! Don''t jump! When the lights go out, it''s nobody''s business what goes  on between two consenting adults. Now that the, uh, garbage ball is in  space, Doctor, perhaps you can help me with my sexual inhibitions? You  don''t know how to do any of those.</p>', 'Demo Plumbing', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(159, 23, 4, 1, 1, 1, 'LocalBusinessPage', '2011-12-19 09:49:39', '2011-12-22 13:31:44', 'demosville-silverstripe', 'Demosville SilverStripe', NULL, '<p>Pastry bear claw tootsie roll apple pie icing bonbon. Chupa chups cookie  faworki jujubes tootsie roll jujubes cotton candy liquorice. Donut  cotton candy faworki topping marshmallow topping. Sesame snaps powder  lemon drops candy canes cupcake cotton candy icing Pastry bear claw tootsie roll apple pie icing bonbon. Chupa chups cookie  faworki jujubes tootsie roll jujubes cotton candy liquorice. Donut  cotton candy faworki topping marshmallow topping. Sesame snaps powder  lemon drops candy canes cupcake cotton candy icing</p>', 'Demosville SilverStripe', NULL, NULL, NULL, 0, 1, NULL, 0, 3, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(160, 26, 5, 1, 1, 1, 'LocalBusinessPage', '2011-12-20 12:47:48', '2011-12-22 13:31:49', 'andy-s-appliances', 'Andy''s Appliances', NULL, '<p>Fusce euismod consequat ante lorem ipsum dolor sit amet consectetuer  adipiscing elit pellentesque dolor aliquam congue fermentum nisl mauris  accumsan nulla veldiam sed lacus utenim <a>adipiscing aliquet nulla venenatis</a> inpede maliquet amet euismod nauctor ligula aliquam dapibus tincidunt  metus praesent justo dolor lobortis quis lobortisissim pulvinar aclorem  vestibulum sed ante. Donec sagittis euismod purus lorem ipsum dolor  samet consectetuer adipiscing elit praesent vestibulum.</p>', 'Andy''s Appliences', NULL, NULL, NULL, 0, 1, NULL, 0, 4, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(161, 29, 3, 1, 1, 1, 'LocalBusinessPage', '2011-12-20 17:32:59', '2011-12-22 13:31:52', 'demoville-wreckers', 'Demoville Wreckers', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium, purus a mattis vestibulum, purus elit dictum sem, quis imperdiet lacus risus in nisi. Proin ac augue tellus. Vestibulum tristique posuere semper. Nam vitae turpis arcu, condimentum facilisis enim. Donec pharetra ante a justo mattis auctor fringilla mauris feugiat. Nulla ornare metus in ipsum dapibus sit amet porta odio dictum. Sed porttitor massa non lectus euismod consectetur. Aliquam nisl massa, cursus sed laoreet porttitor, molestie placerat eros. Nunc non arcu eros. Morbi consequat nunc metus, at fringilla quam. Cras nec lacus augue. Mauris vehicula accumsan rhoncus. Nunc et ultricies ante. Aliquam erat volutpat. Ut aliquet mi quis sem iaculis lobortis vestibulum nulla volutpat.</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 5, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(162, 47, 2, 1, 1, 1, 'LocalBusinessPage', '2011-12-21 12:41:06', '2011-12-22 13:32:45', 'demoyum-cafe', 'Demoyum Cafe', NULL, '<p>Lemon drops jelly beans topping jujubes candy lemon drops applicake dragée. Dragée danish jelly cupcake tart caramels sesame snaps. Dragée macaroon pie. Apple pie croissant liquorice tootsie roll chocolate bar gingerbread soufflé bear claw cookie. Toffee cake macaroon oat cake sweet roll jujubes cupcake tootsie roll pie. Candy oat cake cupcake halvah marzipan gummies toffee. Brownie gummies cheesecake carrot cake faworki gummi bears. Sesame snaps sweet oat cake topping jelly. Candy marzipan muffin. Donut soufflé candy canes cheesecake soufflé. Jujubes danish wafer. Wafer pie tiramisu marshmallow carrot cake sweet roll. Bonbon topping soufflé oat cake chocolate fruitcake chocolate bar donut. Caramels candy lollipop lollipop pie jelly pastry. Pudding bear claw caramels. Toffee chocolate icing. Liquorice cheesecake candy canes sweet roll apple pie carrot cake. Chocolate bar cookie cheesecake candy canes pie dragée halvah. Gummi bears icing macaroon fruitcake chocolate cake dragée. Biscuit pudding topping. Powder sesame snaps liquorice croissant candy canes. Oat cake muffin sweet roll caramels apple pie caramels applicake chocolate bar bear claw. Jelly applicake chocolate cake. Chocolate bar carrot cake jelly-o sesame snaps sweet tootsie roll biscuit. Marzipan chocolate cake chocolate bar jelly beans liquorice cotton candy cheesecake gingerbread cookie. Pastry faworki gingerbread.</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(163, 51, 6, 0, 1, 0, 'CalendarEvent', '2011-12-22 12:08:30', '2011-12-22 13:42:09', 'christmas-in-the-park', 'Christmas in the park', NULL, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla  in leo tristique orci sagittis mattis. Proin mollis erat velit. Nam  dignissim, magna sit amet rutrum tincidunt, arcu nunc porta arcu, non  commodo nibh justo a eros. Curabitur euismod rutrum mauris, nec laoreet  enim ullamcorper eu. Sed interdum, felis eleifend tempor pulvinar, orci  massa aliquet enim, ut rutrum augue erat eu ante. Donec non ante enim.  Donec lectus magna, ultricies quis bibendum quis, ultrices a diam.  Nullam aliquam vulputate risus, a tempor elit imperdiet eu. Maecenas  tempor cursus ligula sit amet pellentesque. Nulla sagittis volutpat  eleifend.</p>\n<p>Suspendisse semper egestas suscipit. Donec non risus nunc. Mauris  ultricies odio vitae dolor fermentum ornare congue velit auctor. Donec  dapibus, massa non fermentum ultrices, massa libero condimentum tellus,  gravida fermentum ante dui eget lorem. Vivamus tincidunt euismod  malesuada. Proin urna purus, venenatis sed placerat in, consectetur ut  libero. Mauris lobortis vestibulum massa, vel aliquam purus rutrum at.  Duis sit amet dui et mi volutpat convallis quis at mauris. Ut dapibus  porta quam, quis sollicitudin libero tempor sed. Duis at quam sed leo  dictum faucibus sit amet porttitor dui. Cras accumsan aliquet  condimentum. Morbi suscipit iaculis luctus.</p>', 'Christmas in the park', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(164, 51, 7, 1, 1, 1, 'CalendarEvent', '2011-12-22 12:08:30', '2011-12-22 13:42:11', 'christmas-in-the-park', 'Christmas in the park', NULL, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla  in leo tristique orci sagittis mattis. Proin mollis erat velit. Nam  dignissim, magna sit amet rutrum tincidunt, arcu nunc porta arcu, non  commodo nibh justo a eros. Curabitur euismod rutrum mauris, nec laoreet  enim ullamcorper eu. Sed interdum, felis eleifend tempor pulvinar, orci  massa aliquet enim, ut rutrum augue erat eu ante. Donec non ante enim.  Donec lectus magna, ultricies quis bibendum quis, ultrices a diam.  Nullam aliquam vulputate risus, a tempor elit imperdiet eu. Maecenas  tempor cursus ligula sit amet pellentesque. Nulla sagittis volutpat  eleifend.</p>\n<p>Suspendisse semper egestas suscipit. Donec non risus nunc. Mauris  ultricies odio vitae dolor fermentum ornare congue velit auctor. Donec  dapibus, massa non fermentum ultrices, massa libero condimentum tellus,  gravida fermentum ante dui eget lorem. Vivamus tincidunt euismod  malesuada. Proin urna purus, venenatis sed placerat in, consectetur ut  libero. Mauris lobortis vestibulum massa, vel aliquam purus rutrum at.  Duis sit amet dui et mi volutpat convallis quis at mauris. Ut dapibus  porta quam, quis sollicitudin libero tempor sed. Duis at quam sed leo  dictum faucibus sit amet porttitor dui. Cras accumsan aliquet  condimentum. Morbi suscipit iaculis luctus.</p>', 'Christmas in the park', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(165, 52, 4, 0, 1, 0, 'CalendarEvent', '2011-12-22 12:29:10', '2011-12-22 14:06:02', 'easter-in-the-park', 'Easter in the park', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Easter in the park', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(166, 52, 5, 1, 1, 1, 'CalendarEvent', '2011-12-22 12:29:10', '2011-12-22 14:06:04', 'easter-in-the-park', 'Easter in the park', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Easter in the park', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(167, 55, 1, 1, 2, 1, 'LocalBusinessPage', '2012-01-17 13:38:02', '2012-01-17 13:38:02', 'testing-workflow', 'Testing workflow', NULL, 'Testing workflow', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 11, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(168, 56, 1, 0, 1, 0, 'Page', '2012-01-24 14:05:14', '2012-01-24 14:05:14', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 17, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(169, 56, 2, 1, 1, 1, 'Page', '2012-01-24 14:05:14', '2012-01-24 14:05:19', 'new-page', 'New Page', NULL, '<p>asdf</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 17, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(170, 56, 3, 1, 1, 1, 'Page', '2012-01-24 14:05:14', '2012-01-24 14:05:24', 'new-page', 'New Page', NULL, '<p>asdf</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 17, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(171, 2, 8, 1, 1, 1, 'Page', '2011-12-15 04:04:19', '2012-02-03 13:39:33', 'about-demoville', 'About Demoville', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages. sdfsdfsdfsdf ararara </p>', 'About Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(172, 55, 2, 1, 1, 1, 'LocalBusinessPage', '2012-01-17 13:38:02', '2012-02-03 15:23:27', 'testing-workflow', 'Testing workflow', NULL, '<p>Testing workflow</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 11, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(173, 18, 4, 1, 1, 1, 'Page', '2011-12-16 14:07:55', '2012-02-03 15:36:15', 'history', 'History', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem  metus, molestie sed facilisis eget, placerat a quam. Sed aliquet laoreet  felis eu porta. Phasellus magna libero, lacinia non molestie vitae,  laoreet eu diam. Aenean ac ante quis quam fermentum consequat. Cras eget  justo non libero mollis lacinia eget in felis. Nam non enim tortor.  Vestibulum in ipsum et risus semper congue vel sed metus. Praesent sem  magna, tempus eget aliquet at, facilisis sit amet ligula.</p>\n<p>Fusce suscipit euismod enim ac tincidunt. Nullam a urna non erat  ullamcorper vestibulum. Fusce laoreet, dolor nec commodo rhoncus, erat  lorem mattis sem, nec porta ante urna pellentesque tellus. Vestibulum  vitae diam a mauris dictum ultrices. Cras id eros ut turpis tempor  dignissim a et est. Ut pulvinar dui erat, vel pharetra nibh. Fusce nisi  dolor, malesuada et placerat congue, ultricies a risus. Suspendisse  varius tortor a velit pharetra elementum auctor nec mi. Donec pretium  ultrices turpis, ac vulputate justo consequat dignissim. Proin sed ante  ipsum, in posuere mauris. Cras ultricies risus et neque blandit eget  faucibus lectus varius.</p>\n<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu,  vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis  auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel  libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper  nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut  felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula.  Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus  dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec  condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis  iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis  interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis  tellus consequat vel. Phasellus non consectetur diam. Aenean viverra,  lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo  eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet,  elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis.  Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec  accumsan eros sit amet massa tempus sit amet dignissim augue venenatis.  Integer sit amet nibh at mauris ornare ultrices.</p>', 'History', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(174, 2, 9, 1, 1, 1, 'Page', '2011-12-15 04:04:19', '2012-02-03 15:43:22', 'about-demoville', 'About Demoville', NULL, '<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu, vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula. Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis tellus consequat vel. Phasellus non consectetur diam. Aenean viverra, lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet, elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis. Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec accumsan eros sit amet massa tempus sit amet dignissim augue venenatis. Integer sit amet nibh at mauris ornare ultrices.</p>\n\n', 'About Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(175, 57, 1, 0, 1, 0, 'SubscriptionPage', '2012-02-06 10:10:42', '2012-02-06 10:10:42', 'new-subscriptionpage', 'New SubscriptionPage', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 17, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(176, 57, 2, 1, 1, 1, 'SubscriptionPage', '2012-02-06 10:10:42', '2012-02-06 10:12:04', 'newsletter', 'Newsletter', NULL, NULL, 'Newsletter', NULL, NULL, NULL, 0, 1, NULL, 0, 17, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(177, 57, 3, 1, 1, 1, 'SubscriptionPage', '2012-02-06 10:10:42', '2012-02-06 10:12:37', 'subscribe-to-our-newsletter', 'Subscribe to our Newsletter', NULL, NULL, 'Newsletter', NULL, NULL, NULL, 0, 1, NULL, 0, 17, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(178, 57, 4, 1, 1, 1, 'SubscriptionPage', '2012-02-06 10:10:42', '2012-02-06 10:12:44', 'newsletter', 'Subscribe to our Newsletter', NULL, NULL, 'Newsletter', NULL, NULL, NULL, 0, 1, NULL, 0, 17, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(179, 3, 7, 1, 1, 1, 'ContactPage', '2011-12-15 04:04:19', '2012-02-06 10:46:40', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your  requests and general enquiries or call us on <strong>1234554321</strong>.</p>\n<p><strong>Demoville Council</strong><br/>1 Cecil Place<br/> Prahran<br/> Victoria 3181<br/> Australia</p>\n<p>Phone: 1234512345<br/>Fax: 5432154321<br/>Email: demo@demoville.com.au<br/><a href=contact-us> </a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(180, 58, 1, 0, 1, 0, 'ListingPage', '2012-02-06 11:10:39', '2012-02-06 11:10:39', 'new-listingpage', 'New ListingPage', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(181, 58, 2, 1, 1, 1, 'ListingPage', '2012-02-06 11:10:39', '2012-02-06 11:17:14', 'have-your-say', 'Have your say', NULL, '<p>Nulla tempus neque ac dui rhoncus convallis. Nunc bibendum, tellus vitae dapibus vulputate, dui elit rutrum eros, vitae auctor risus urna a sapien. Sed a tellus nisl. In quam orci, faucibus vitae pellentesque non, cursus at augue. Vivamus blandit ipsum eget mi mollis id consequat velit suscipit. Praesent condimentum lacinia dignissim. Morbi ultrices, nulla sed sodales hendrerit, orci sapien condimentum purus, eu mollis nibh justo quis erat. Suspendisse pulvinar feugiat sem mattis pulvinar. Nam ullamcorper neque nec mi varius laoreet. Quisque non massa libero. Fusce eget ligula vel nunc scelerisque ultrices eu non ligula. Suspendisse potenti.</p>\n<p> </p>\n<p>$Listing</p>\n\n', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(204, 58, 3, 1, 1, 1, 'ListingPage', '2012-02-06 11:10:39', '2012-02-06 12:55:57', 'have-your-say', 'Have your say', NULL, '<p>Nulla tempus neque ac dui rhoncus convallis. Nunc bibendum, tellus vitae dapibus vulputate, dui elit rutrum eros, vitae auctor risus urna a sapien. Sed a tellus nisl. In quam orci, faucibus vitae pellentesque non, cursus at augue. Vivamus blandit ipsum eget mi mollis id consequat velit suscipit. Praesent condimentum lacinia dignissim. Morbi ultrices, nulla sed sodales hendrerit, orci sapien condimentum purus, eu mollis nibh justo quis erat. Suspendisse pulvinar feugiat sem mattis pulvinar. Nam ullamcorper neque nec mi varius laoreet. Quisque non massa libero. Fusce eget ligula vel nunc scelerisque ultrices eu non ligula. Suspendisse potenti.</p>\n<p> </p>\n<p>$Listing</p>\n\n', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(205, 58, 4, 1, 1, 1, 'ListingPage', '2012-02-06 11:10:39', '2012-02-06 12:56:08', 'have-your-say', 'Have your say', NULL, '<p>Nulla tempus neque ac dui rhoncus convallis. Nunc bibendum, tellus vitae dapibus vulputate, dui elit rutrum eros, vitae auctor risus urna a sapien. Sed a tellus nisl. In quam orci, faucibus vitae pellentesque non, cursus at augue. Vivamus blandit ipsum eget mi mollis id consequat velit suscipit. Praesent condimentum lacinia dignissim. Morbi ultrices, nulla sed sodales hendrerit, orci sapien condimentum purus, eu mollis nibh justo quis erat. Suspendisse pulvinar feugiat sem mattis pulvinar. Nam ullamcorper neque nec mi varius laoreet. Quisque non massa libero. Fusce eget ligula vel nunc scelerisque ultrices eu non ligula. Suspendisse potenti.</p>\n<p> </p>\n<p>$Listing</p>\n\n', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(206, 58, 5, 1, 1, 1, 'ListingPage', '2012-02-06 11:10:39', '2012-02-06 12:56:14', 'have-your-say', 'Have your say', NULL, '<p>Nulla tempus neque ac dui rhoncus convallis. Nunc bibendum, tellus vitae dapibus vulputate, dui elit rutrum eros, vitae auctor risus urna a sapien. Sed a tellus nisl. In quam orci, faucibus vitae pellentesque non, cursus at augue. Vivamus blandit ipsum eget mi mollis id consequat velit suscipit. Praesent condimentum lacinia dignissim. Morbi ultrices, nulla sed sodales hendrerit, orci sapien condimentum purus, eu mollis nibh justo quis erat. Suspendisse pulvinar feugiat sem mattis pulvinar. Nam ullamcorper neque nec mi varius laoreet. Quisque non massa libero. Fusce eget ligula vel nunc scelerisque ultrices eu non ligula. Suspendisse potenti.</p>\n<p> </p>\n<p>$Listing</p>\n\n', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(207, 58, 6, 1, 1, 1, 'ListingPage', '2012-02-06 11:10:39', '2012-02-06 12:57:57', 'have-your-say', 'Have your say', NULL, '<p>Nulla tempus neque ac dui rhoncus convallis. Nunc bibendum, tellus vitae dapibus vulputate, dui elit rutrum eros, vitae auctor risus urna a sapien. Sed a tellus nisl. In quam orci, faucibus vitae pellentesque non, cursus at augue. Vivamus blandit ipsum eget mi mollis id consequat velit suscipit. Praesent condimentum lacinia dignissim. Morbi ultrices, nulla sed sodales hendrerit, orci sapien condimentum purus, eu mollis nibh justo quis erat. Suspendisse pulvinar feugiat sem mattis pulvinar. Nam ullamcorper neque nec mi varius laoreet. Quisque non massa libero. Fusce eget ligula vel nunc scelerisque ultrices eu non ligula. Suspendisse potenti.</p>\n<p>$Listing</p>\n\n', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(208, 1, 7, 1, 1, 1, 'HomePage', '2011-12-15 04:04:19', '2012-02-06 13:11:54', 'home', 'Home', NULL, '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem  accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab  illo inventore veritatis et quasi architecto beatae vitae dicta sunt  explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut  odit aut fugit, sed quia consequuntur magni dolores eos qui ratione  voluptatem sequi nesciunt.</p>\n<p>Neque porro quisquam est, qui dolorem ipsum  quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam  eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat  voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam  corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?  Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse  quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo  voluptas nulla pariatur</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(209, 58, 7, 1, 1, 1, 'ListingPage', '2012-02-06 11:10:39', '2012-02-06 13:12:51', 'have-your-say', 'Have your say', NULL, '<p>Nulla tempus neque ac dui rhoncus convallis. Nunc bibendum, tellus vitae dapibus vulputate, dui elit rutrum eros, vitae auctor risus urna a sapien. Sed a tellus nisl. In quam orci, faucibus vitae pellentesque non, cursus at augue. Vivamus blandit ipsum eget mi mollis id consequat velit suscipit. Praesent condimentum lacinia dignissim. Morbi ultrices, nulla sed sodales hendrerit, orci sapien condimentum purus, eu mollis nibh justo quis erat. Suspendisse pulvinar feugiat sem mattis pulvinar. Nam ullamcorper neque nec mi varius laoreet. Quisque non massa libero. Fusce eget ligula vel nunc scelerisque ultrices eu non ligula. Suspendisse potenti.</p>\n<p>$Listing</p>\n\n', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(211, 21, 13, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2012-02-06 14:24:53', 'local-businesses', 'Local Businesses', NULL, '<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'LoggedInUsers', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(212, 27, 12, 0, 1, 0, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-02-06 14:25:40', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(213, 27, 13, 0, 1, 0, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-02-06 14:25:40', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(214, 27, 14, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-02-06 14:25:47', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(215, 27, 15, 0, 1, 0, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-02-06 14:26:15', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(216, 27, 16, 0, 1, 0, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-02-06 14:26:15', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(217, 27, 17, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-02-06 14:26:18', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(218, 27, 18, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-02-06 14:26:35', 'list-business', 'List your local business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(219, 15, 14, 1, 1, 1, 'ListingPage', '2011-12-16 10:18:03', '2012-02-06 14:33:57', 'download-more-information', 'Download more Information', NULL, '<p>This is a listing page containing files that are only viewable by logged in users</p>\n<p>$Listing</p>', 'Download more Information', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'OnlyTheseUsers', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(220, 3, 8, 0, 1, 0, 'ContactPage', '2011-12-15 04:04:19', '2012-02-06 14:59:34', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your  requests and general enquiries or call us on <strong>1234554321</strong>.</p>\n<p><strong>Demoville Council</strong><br/>1 Cecil Place<br/> Prahran<br/> Victoria 3181<br/> Australia</p>\n<p>Phone: 1234512345<br/>Fax: 5432154321<br/>Email: demo@demoville.com.au<br/><a href=contact-us> </a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(221, 58, 8, 0, 1, 0, 'ListingPage', '2012-02-06 11:10:39', '2012-02-06 14:59:34', 'have-your-say', 'Have your say', NULL, '<p>Nulla tempus neque ac dui rhoncus convallis. Nunc bibendum, tellus vitae dapibus vulputate, dui elit rutrum eros, vitae auctor risus urna a sapien. Sed a tellus nisl. In quam orci, faucibus vitae pellentesque non, cursus at augue. Vivamus blandit ipsum eget mi mollis id consequat velit suscipit. Praesent condimentum lacinia dignissim. Morbi ultrices, nulla sed sodales hendrerit, orci sapien condimentum purus, eu mollis nibh justo quis erat. Suspendisse pulvinar feugiat sem mattis pulvinar. Nam ullamcorper neque nec mi varius laoreet. Quisque non massa libero. Fusce eget ligula vel nunc scelerisque ultrices eu non ligula. Suspendisse potenti.</p>\n<p>$Listing</p>\n\n', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(222, 19, 4, 0, 1, 0, 'Page', '2011-12-16 14:30:44', '2012-02-06 14:59:34', 'indigenous-demoville', 'Indigenous Demoville', NULL, '<p>Welcome to the City of Demoville. We respectfully acknowledge that we are meeting on the traditional land of the Kulin Nation. This special place is now known by its European name of Demoville.<br/><br/>Today, Demoville is one of the great multicultural cities of the world, and is a significant meeting place. For the Wurundjeri, Boonerwrung, Taungurong, Djajawurrung and the Wathaurung which make up the Kulin Nation, Demoville has always been an important meeting place and location for events of social, educational, sporting and cultural significance.<br/><br/>City of Demoville''s acknowledgement, City of Demoville Indigenous Framework 2007-2010<br/>Indigenous community<br/><br/>The City of Demoville collaborates with its Indigenous community in the development of its many strategies, agreements and protocols designed to celebrate, support and expand Indigenous culture throughout Demoville and beyond.<br/><br/>The City of Demoville’s approach to local and national Indigenous interests is to be open, active and alert to opportunities.<br/><br/>As a local government, the City of Demoville aims to provide high quality, responsive and innovative services for its local Indigenous community. Its Indigenous Unit offers a direct connection between the organisation and the local Indigenous community.<br/><br/>Demoville is regarded by many as the hub of the Victorian Indigenous community.<br/>Indigenous Demoville<br/><br/>To find out more about Indigenous Demoville and how the City of Demoville works with Indigenous communities, download the Celebrate Indigenous Demoville guide below, or visit that''s Demoville, our website for everything to do and see in the city.</p>', 'Indigenous Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(223, 18, 5, 0, 1, 0, 'Page', '2011-12-16 14:07:55', '2012-02-06 14:59:34', 'history', 'History', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem  metus, molestie sed facilisis eget, placerat a quam. Sed aliquet laoreet  felis eu porta. Phasellus magna libero, lacinia non molestie vitae,  laoreet eu diam. Aenean ac ante quis quam fermentum consequat. Cras eget  justo non libero mollis lacinia eget in felis. Nam non enim tortor.  Vestibulum in ipsum et risus semper congue vel sed metus. Praesent sem  magna, tempus eget aliquet at, facilisis sit amet ligula.</p>\n<p>Fusce suscipit euismod enim ac tincidunt. Nullam a urna non erat  ullamcorper vestibulum. Fusce laoreet, dolor nec commodo rhoncus, erat  lorem mattis sem, nec porta ante urna pellentesque tellus. Vestibulum  vitae diam a mauris dictum ultrices. Cras id eros ut turpis tempor  dignissim a et est. Ut pulvinar dui erat, vel pharetra nibh. Fusce nisi  dolor, malesuada et placerat congue, ultricies a risus. Suspendisse  varius tortor a velit pharetra elementum auctor nec mi. Donec pretium  ultrices turpis, ac vulputate justo consequat dignissim. Proin sed ante  ipsum, in posuere mauris. Cras ultricies risus et neque blandit eget  faucibus lectus varius.</p>\n<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu,  vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis  auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel  libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper  nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut  felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula.  Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus  dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec  condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis  iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis  interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis  tellus consequat vel. Phasellus non consectetur diam. Aenean viverra,  lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo  eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet,  elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis.  Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec  accumsan eros sit amet massa tempus sit amet dignissim augue venenatis.  Integer sit amet nibh at mauris ornare ultrices.</p>', 'History', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(224, 17, 5, 0, 1, 0, 'Page', '2011-12-16 13:51:45', '2012-02-06 14:59:34', 'city-maps', 'City Maps', NULL, '<p>Vestibulum porta risus eget nibh ullamcorper commodo. In lorem dolor,  aliquet vel sodales euismod, hendrerit id dolor. Pellentesque ut lacus  tincidunt ipsum fermentum aliquam. In hac habitasse platea dictumst. Sed  egestas lectus a dui ullamcorper sit amet auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'City Maps', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(225, 2, 10, 0, 1, 0, 'Page', '2011-12-15 04:04:19', '2012-02-06 14:59:34', 'about-demoville', 'About Demoville', NULL, '<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu, vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula. Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis tellus consequat vel. Phasellus non consectetur diam. Aenean viverra, lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet, elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis. Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec accumsan eros sit amet massa tempus sit amet dignissim augue venenatis. Integer sit amet nibh at mauris ornare ultrices.</p>\n\n', 'About Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(226, 51, 8, 1, 1, 1, 'CalendarEvent', '2011-12-22 12:08:30', '2012-02-06 15:31:07', 'christmas-in-the-park', 'Christmas in the park', NULL, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla  in leo tristique orci sagittis mattis. Proin mollis erat velit. Nam  dignissim, magna sit amet rutrum tincidunt, arcu nunc porta arcu, non  commodo nibh justo a eros. Curabitur euismod rutrum mauris, nec laoreet  enim ullamcorper eu. Sed interdum, felis eleifend tempor pulvinar, orci  massa aliquet enim, ut rutrum augue erat eu ante. Donec non ante enim.  Donec lectus magna, ultricies quis bibendum quis, ultrices a diam.  Nullam aliquam vulputate risus, a tempor elit imperdiet eu. Maecenas  tempor cursus ligula sit amet pellentesque. Nulla sagittis volutpat  eleifend.</p>\n<p>Suspendisse semper egestas suscipit. Donec non risus nunc. Mauris  ultricies odio vitae dolor fermentum ornare congue velit auctor. Donec  dapibus, massa non fermentum ultrices, massa libero condimentum tellus,  gravida fermentum ante dui eget lorem. Vivamus tincidunt euismod  malesuada. Proin urna purus, venenatis sed placerat in, consectetur ut  libero. Mauris lobortis vestibulum massa, vel aliquam purus rutrum at.  Duis sit amet dui et mi volutpat convallis quis at mauris. Ut dapibus  porta quam, quis sollicitudin libero tempor sed. Duis at quam sed leo  dictum faucibus sit amet porttitor dui. Cras accumsan aliquet  condimentum. Morbi suscipit iaculis luctus.</p>', 'Christmas in the park', NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(227, 52, 6, 1, 1, 1, 'CalendarEvent', '2011-12-22 12:29:10', '2012-02-06 15:31:12', 'easter-in-the-park', 'Easter in the park', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Easter in the park', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(228, 13, 4, 1, 1, 1, 'MemberProfilePage', '2011-12-15 17:31:11', '2012-02-06 15:32:51', 'your-account', 'Your Account', NULL, NULL, 'Your Account', NULL, NULL, NULL, 0, 1, NULL, 0, 8, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(229, 2, 11, 1, 1, 1, 'Page', '2011-12-15 04:04:19', '2012-02-06 15:49:51', 'about-demoville', 'About Demoville', NULL, '<p><img class=left src=assets/_resampled/resizedimage726266-PerthCityPanorama-943x345.jpg width=726 height=266 alt= title=/></p>\n<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu, vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula. Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis tellus consequat vel. Phasellus non consectetur diam. Aenean viverra, lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet, elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis. Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec accumsan eros sit amet massa tempus sit amet dignissim augue venenatis. Integer sit amet nibh at mauris ornare ultrices.</p>\n\n', 'About Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 1, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(230, 2, 12, 0, 1, 0, 'Page', '2011-12-15 04:04:19', '2012-02-06 15:50:52', 'about-demoville', 'About Demoville', NULL, '<p><img class=left src=assets/_resampled/resizedimage726266-PerthCityPanorama-943x345.jpg width=726 height=266 alt= title=/></p>\n<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu, vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula. Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis tellus consequat vel. Phasellus non consectetur diam. Aenean viverra, lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet, elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis. Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec accumsan eros sit amet massa tempus sit amet dignissim augue venenatis. Integer sit amet nibh at mauris ornare ultrices.</p>\n\n', 'About Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 1, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(231, 2, 13, 0, 1, 0, 'Page', '2011-12-15 04:04:19', '2012-02-06 15:50:55', 'about-demoville', 'About Demoville', NULL, '<p><img class=left src=assets/_resampled/resizedimage726266-PerthCityPanorama-943x345.jpg width=726 height=266 alt= title=/></p>\n<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu, vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula. Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis tellus consequat vel. Phasellus non consectetur diam. Aenean viverra, lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet, elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis. Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec accumsan eros sit amet massa tempus sit amet dignissim augue venenatis. Integer sit amet nibh at mauris ornare ultrices.</p>\n\n', 'About Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(232, 1, 8, 0, 1, 0, 'HomePage', '2011-12-15 04:04:19', '2012-02-06 15:50:58', 'home', 'Home', NULL, '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem  accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab  illo inventore veritatis et quasi architecto beatae vitae dicta sunt  explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut  odit aut fugit, sed quia consequuntur magni dolores eos qui ratione  voluptatem sequi nesciunt.</p>\n<p>Neque porro quisquam est, qui dolorem ipsum  quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam  eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat  voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam  corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?  Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse  quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo  voluptas nulla pariatur</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(233, 17, 6, 0, 1, 0, 'Page', '2011-12-16 13:51:45', '2012-02-06 15:51:05', 'city-maps', 'City Maps', NULL, '<p>Vestibulum porta risus eget nibh ullamcorper commodo. In lorem dolor,  aliquet vel sodales euismod, hendrerit id dolor. Pellentesque ut lacus  tincidunt ipsum fermentum aliquam. In hac habitasse platea dictumst. Sed  egestas lectus a dui ullamcorper sit amet auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'City Maps', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 1, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(234, 17, 7, 0, 1, 0, 'Page', '2011-12-16 13:51:45', '2012-02-06 15:51:05', 'city-maps', 'City Maps', NULL, '<p>Vestibulum porta risus eget nibh ullamcorper commodo. In lorem dolor,  aliquet vel sodales euismod, hendrerit id dolor. Pellentesque ut lacus  tincidunt ipsum fermentum aliquam. In hac habitasse platea dictumst. Sed  egestas lectus a dui ullamcorper sit amet auctor dolor ornare.</p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'City Maps', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(235, 18, 6, 0, 1, 0, 'Page', '2011-12-16 14:07:55', '2012-02-06 15:51:07', 'history', 'History', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem  metus, molestie sed facilisis eget, placerat a quam. Sed aliquet laoreet  felis eu porta. Phasellus magna libero, lacinia non molestie vitae,  laoreet eu diam. Aenean ac ante quis quam fermentum consequat. Cras eget  justo non libero mollis lacinia eget in felis. Nam non enim tortor.  Vestibulum in ipsum et risus semper congue vel sed metus. Praesent sem  magna, tempus eget aliquet at, facilisis sit amet ligula.</p>\n<p>Fusce suscipit euismod enim ac tincidunt. Nullam a urna non erat  ullamcorper vestibulum. Fusce laoreet, dolor nec commodo rhoncus, erat  lorem mattis sem, nec porta ante urna pellentesque tellus. Vestibulum  vitae diam a mauris dictum ultrices. Cras id eros ut turpis tempor  dignissim a et est. Ut pulvinar dui erat, vel pharetra nibh. Fusce nisi  dolor, malesuada et placerat congue, ultricies a risus. Suspendisse  varius tortor a velit pharetra elementum auctor nec mi. Donec pretium  ultrices turpis, ac vulputate justo consequat dignissim. Proin sed ante  ipsum, in posuere mauris. Cras ultricies risus et neque blandit eget  faucibus lectus varius.</p>\n<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu,  vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis  auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel  libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper  nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut  felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula.  Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus  dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec  condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis  iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis  interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis  tellus consequat vel. Phasellus non consectetur diam. Aenean viverra,  lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo  eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet,  elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis.  Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec  accumsan eros sit amet massa tempus sit amet dignissim augue venenatis.  Integer sit amet nibh at mauris ornare ultrices.</p>', 'History', NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(236, 18, 7, 0, 1, 0, 'Page', '2011-12-16 14:07:55', '2012-02-06 15:51:07', 'history', 'History', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem  metus, molestie sed facilisis eget, placerat a quam. Sed aliquet laoreet  felis eu porta. Phasellus magna libero, lacinia non molestie vitae,  laoreet eu diam. Aenean ac ante quis quam fermentum consequat. Cras eget  justo non libero mollis lacinia eget in felis. Nam non enim tortor.  Vestibulum in ipsum et risus semper congue vel sed metus. Praesent sem  magna, tempus eget aliquet at, facilisis sit amet ligula.</p>\n<p>Fusce suscipit euismod enim ac tincidunt. Nullam a urna non erat  ullamcorper vestibulum. Fusce laoreet, dolor nec commodo rhoncus, erat  lorem mattis sem, nec porta ante urna pellentesque tellus. Vestibulum  vitae diam a mauris dictum ultrices. Cras id eros ut turpis tempor  dignissim a et est. Ut pulvinar dui erat, vel pharetra nibh. Fusce nisi  dolor, malesuada et placerat congue, ultricies a risus. Suspendisse  varius tortor a velit pharetra elementum auctor nec mi. Donec pretium  ultrices turpis, ac vulputate justo consequat dignissim. Proin sed ante  ipsum, in posuere mauris. Cras ultricies risus et neque blandit eget  faucibus lectus varius.</p>\n<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu,  vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis  auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel  libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper  nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut  felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula.  Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus  dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec  condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis  iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis  interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis  tellus consequat vel. Phasellus non consectetur diam. Aenean viverra,  lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo  eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet,  elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis.  Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec  accumsan eros sit amet massa tempus sit amet dignissim augue venenatis.  Integer sit amet nibh at mauris ornare ultrices.</p>', 'History', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(237, 3, 9, 0, 1, 0, 'ContactPage', '2011-12-15 04:04:19', '2012-02-06 15:51:09', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your  requests and general enquiries or call us on <strong>1234554321</strong>.</p>\n<p><strong>Demoville Council</strong><br/>1 Cecil Place<br/> Prahran<br/> Victoria 3181<br/> Australia</p>\n<p>Phone: 1234512345<br/>Fax: 5432154321<br/>Email: demo@demoville.com.au<br/><a href=contact-us> </a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(238, 3, 10, 0, 1, 0, 'ContactPage', '2011-12-15 04:04:19', '2012-02-06 15:51:09', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your  requests and general enquiries or call us on <strong>1234554321</strong>.</p>\n<p><strong>Demoville Council</strong><br/>1 Cecil Place<br/> Prahran<br/> Victoria 3181<br/> Australia</p>\n<p>Phone: 1234512345<br/>Fax: 5432154321<br/>Email: demo@demoville.com.au<br/><a href=contact-us> </a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(239, 19, 5, 0, 1, 0, 'Page', '2011-12-16 14:30:44', '2012-02-06 15:51:11', 'indigenous-demoville', 'Indigenous Demoville', NULL, '<p>Welcome to the City of Demoville. We respectfully acknowledge that we are meeting on the traditional land of the Kulin Nation. This special place is now known by its European name of Demoville.<br/><br/>Today, Demoville is one of the great multicultural cities of the world, and is a significant meeting place. For the Wurundjeri, Boonerwrung, Taungurong, Djajawurrung and the Wathaurung which make up the Kulin Nation, Demoville has always been an important meeting place and location for events of social, educational, sporting and cultural significance.<br/><br/>City of Demoville''s acknowledgement, City of Demoville Indigenous Framework 2007-2010<br/>Indigenous community<br/><br/>The City of Demoville collaborates with its Indigenous community in the development of its many strategies, agreements and protocols designed to celebrate, support and expand Indigenous culture throughout Demoville and beyond.<br/><br/>The City of Demoville’s approach to local and national Indigenous interests is to be open, active and alert to opportunities.<br/><br/>As a local government, the City of Demoville aims to provide high quality, responsive and innovative services for its local Indigenous community. Its Indigenous Unit offers a direct connection between the organisation and the local Indigenous community.<br/><br/>Demoville is regarded by many as the hub of the Victorian Indigenous community.<br/>Indigenous Demoville<br/><br/>To find out more about Indigenous Demoville and how the City of Demoville works with Indigenous communities, download the Celebrate Indigenous Demoville guide below, or visit that''s Demoville, our website for everything to do and see in the city.</p>', 'Indigenous Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(240, 19, 6, 0, 1, 0, 'Page', '2011-12-16 14:30:44', '2012-02-06 15:51:12', 'indigenous-demoville', 'Indigenous Demoville', NULL, '<p>Welcome to the City of Demoville. We respectfully acknowledge that we are meeting on the traditional land of the Kulin Nation. This special place is now known by its European name of Demoville.<br/><br/>Today, Demoville is one of the great multicultural cities of the world, and is a significant meeting place. For the Wurundjeri, Boonerwrung, Taungurong, Djajawurrung and the Wathaurung which make up the Kulin Nation, Demoville has always been an important meeting place and location for events of social, educational, sporting and cultural significance.<br/><br/>City of Demoville''s acknowledgement, City of Demoville Indigenous Framework 2007-2010<br/>Indigenous community<br/><br/>The City of Demoville collaborates with its Indigenous community in the development of its many strategies, agreements and protocols designed to celebrate, support and expand Indigenous culture throughout Demoville and beyond.<br/><br/>The City of Demoville’s approach to local and national Indigenous interests is to be open, active and alert to opportunities.<br/><br/>As a local government, the City of Demoville aims to provide high quality, responsive and innovative services for its local Indigenous community. Its Indigenous Unit offers a direct connection between the organisation and the local Indigenous community.<br/><br/>Demoville is regarded by many as the hub of the Victorian Indigenous community.<br/>Indigenous Demoville<br/><br/>To find out more about Indigenous Demoville and how the City of Demoville works with Indigenous communities, download the Celebrate Indigenous Demoville guide below, or visit that''s Demoville, our website for everything to do and see in the city.</p>', 'Indigenous Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(241, 58, 9, 0, 1, 0, 'ListingPage', '2012-02-06 11:10:39', '2012-02-06 15:51:14', 'have-your-say', 'Have your say', NULL, '<p>Nulla tempus neque ac dui rhoncus convallis. Nunc bibendum, tellus vitae dapibus vulputate, dui elit rutrum eros, vitae auctor risus urna a sapien. Sed a tellus nisl. In quam orci, faucibus vitae pellentesque non, cursus at augue. Vivamus blandit ipsum eget mi mollis id consequat velit suscipit. Praesent condimentum lacinia dignissim. Morbi ultrices, nulla sed sodales hendrerit, orci sapien condimentum purus, eu mollis nibh justo quis erat. Suspendisse pulvinar feugiat sem mattis pulvinar. Nam ullamcorper neque nec mi varius laoreet. Quisque non massa libero. Fusce eget ligula vel nunc scelerisque ultrices eu non ligula. Suspendisse potenti.</p>\n<p>$Listing</p>\n\n', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 6, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(242, 58, 10, 1, 1, 4, 'ListingPage', '2012-02-06 11:10:39', '2012-02-06 15:51:14', 'have-your-say', 'Have your say', NULL, '<p>Nulla tempus neque ac dui rhoncus convallis. Nunc bibendum, tellus vitae dapibus vulputate, dui elit rutrum eros, vitae auctor risus urna a sapien. Sed a tellus nisl. In quam orci, faucibus vitae pellentesque non, cursus at augue. Vivamus blandit ipsum eget mi mollis id consequat velit suscipit. Praesent condimentum lacinia dignissim. Morbi ultrices, nulla sed sodales hendrerit, orci sapien condimentum purus, eu mollis nibh justo quis erat. Suspendisse pulvinar feugiat sem mattis pulvinar. Nam ullamcorper neque nec mi varius laoreet. Quisque non massa libero. Fusce eget ligula vel nunc scelerisque ultrices eu non ligula. Suspendisse potenti.</p>\n<p>$Listing</p>\n\n', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(243, 2, 14, 1, 1, 1, 'Page', '2011-12-15 04:04:19', '2012-02-06 15:51:17', 'about-demoville', 'About Demoville', NULL, '<p><img class=left src=assets/_resampled/resizedimage726266-PerthCityPanorama-943x345.jpg width=726 height=266 alt= title=/></p>\n<p>Nam pretium erat dictum nulla tincidunt porttitor. Etiam eget orci arcu, vel laoreet elit. Quisque ultrices feugiat nisl, at rhoncus turpis auctor a. Mauris eget sem felis, at ultricies lacus. Phasellus vel libero ut dui laoreet posuere non non quam. Maecenas id ullamcorper nibh. Vestibulum augue ipsum, lacinia ut ullamcorper vel, interdum ut felis. Maecenas odio sapien, cursus at volutpat nec, pretium sed ligula. Ut feugiat aliquet ligula, quis porttitor diam feugiat nec. Phasellus dapibus ultrices pulvinar. Donec accumsan eros at felis dictum nec condimentum nibh pharetra. Vivamus vitae nulla justo, in viverra augue.</p>\n<p>Donec lobortis, arcu sed viverra sagittis, magna massa varius mi, quis iaculis lorem erat ac lacus. Integer tincidunt mollis nisl quis interdum. Pellentesque porttitor scelerisque sapien, vitae facilisis tellus consequat vel. Phasellus non consectetur diam. Aenean viverra, lorem id rhoncus ornare, dui metus semper felis, ac auctor nunc leo eleifend nisi. Donec libero neque, facilisis sed lobortis sit amet, elementum id arcu. Suspendisse sagittis massa at dolor faucibus mattis. Nullam tempor viverra quam, vel volutpat sapien convallis dictum. Donec accumsan eros sit amet massa tempus sit amet dignissim augue venenatis. Integer sit amet nibh at mauris ornare ultrices.</p>\n\n', 'About Demoville', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(244, 53, 3, 1, 1, 1, 'Page', '2011-12-22 12:55:55', '2012-02-06 15:53:19', 'cycle-tracks', 'Cycle Tracks', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p> </p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Cycle Tracks', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(245, 53, 4, 1, 1, 1, 'Page', '2011-12-22 12:55:55', '2012-02-06 15:53:36', 'cycle-tracks', 'Cycle Tracks', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p><img class=left src=assets/_resampled/resizedimage302173-PBNintegration.jpg width=302 height=173 alt= title=/></p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Cycle Tracks', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(246, 53, 5, 1, 1, 1, 'Page', '2011-12-22 12:55:55', '2012-02-06 15:58:14', 'cycle-tracks', 'Cycle Tracks', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p><a href=assets/PBNintegration.jpg target=_blank><img class=left src=assets/_resampled/resizedimage302173-PBNintegration.jpg width=302 height=173 alt= title=/></a></p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Cycle Tracks', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(247, 54, 3, 1, 1, 1, 'Page', '2011-12-22 12:56:25', '2012-02-06 16:02:02', 'central-city-map', 'Central City Map', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p><iframe src=http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=melbourne&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=50.111473,130.429688&amp;ie=UTF8&amp;hq=&amp;hnear=Melbourne+Victoria,+Australia&amp;t=m&amp;ll=-37.813174,144.962969&amp;spn=0.023733,0.062313&amp;z=14&amp;iwloc=A&amp;output=embed width=726 height=350 frameborder=0 marginwidth=0 marginheight=0 scrolling=no/><br/><a style=color:#0000FF;text-align:left href=http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=melbourne&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=50.111473,130.429688&amp;ie=UTF8&amp;hq=&amp;hnear=Melbourne+Victoria,+Australia&amp;t=m&amp;ll=-37.813174,144.962969&amp;spn=0.023733,0.062313&amp;z=14&amp;iwloc=A>View Larger Map</a></p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Central City Map', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(248, 54, 4, 1, 1, 1, 'Page', '2011-12-22 12:56:25', '2012-02-06 16:04:23', 'central-city-map', 'Central City Map', NULL, '<p><iframe src=http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=melbourne&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=50.111473,130.429688&amp;ie=UTF8&amp;hq=&amp;hnear=Melbourne+Victoria,+Australia&amp;ll=-37.813187,144.96298&amp;spn=0.049228,0.127373&amp;t=m&amp;z=14&amp;output=embed width=425 height=350 frameborder=0 marginwidth=0 marginheight=0 scrolling=no/><br/><a style=color:#0000FF;text-align:left href=http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=melbourne&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=50.111473,130.429688&amp;ie=UTF8&amp;hq=&amp;hnear=Melbourne+Victoria,+Australia&amp;ll=-37.813187,144.96298&amp;spn=0.049228,0.127373&amp;t=m&amp;z=14>View Larger Map</a></p>', 'Central City Map', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(249, 54, 5, 1, 1, 1, 'Page', '2011-12-22 12:56:25', '2012-02-06 16:16:42', 'central-city-map', 'Central City Map', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui  blanditiis praesentium voluptatum deleniti atque corrupti quos dolores  et quas molestias excepturi sint occaecati cupiditate non provident,  similique sunt in culpa qui officia deserunt mollitia animi, id est  laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita  distinctio. Nam libero tempore, cum soluta nobis est eligendi optio  cumque nihil impedit quo minus id quod maxime placeat facere possimus,  omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem  quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet  ut et voluptates repudiandae sint et molestiae non recusandae. Itaque  earum rerum hic tenetur a sapiente delectus, ut aut reiciendis  voluptatibus maiores alias consequatur aut perferendis doloribus  asperiores repellat.</p>\n<p><a href=http://maps.google.com/maps?q=melbourne&amp;hl=en&amp;sll=37.0625,-95.677068&amp;sspn=50.111473,130.429688&amp;hnear=Melbourne+Victoria,+Australia&amp;t=m&amp;z=14 target=_blank><img src=http://maps.google.com/staticmap?center=-37.81319,144.96298&amp;zoom=15&amp;size=726x420&amp;maptype=mobile&amp;markers=-37.81319,144.96298,red&amp;key=ABQIAAAAqQJ-gFBKUbBLaFN1HQF4KBQ_k2Fxd8XZtbWUsvz5Vrarxzf2SRSh7DRXLQmAZ-6XwtrmMhkINGT27A&amp;sensor=false/></a></p>', 'Central City Map', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(250, 27, 19, 1, 1, 1, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-02-06 16:28:14', 'list-your-business', 'List your business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Saved (update)', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(251, 21, 14, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2012-02-06 16:30:28', 'local-businesses', 'Local Businesses', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui  blanditiis praesentium voluptatum deleniti atque corrupti quos dolores  et quas molestias excepturi sint occaecati cupiditate non provident,  similique sunt in culpa qui officia deserunt mollitia animi, id est  laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita  distinctio. Nam libero tempore, cum soluta nobis est eligendi optio  cumque nihil impedit quo minus id quod maxime placeat facere possimus,  omnis voluptas assumenda est, omnis dolor repellendus.</p>\n<p>If you have a local business in Demoville, feel free to <a href=[sitetree_link id=13]>login</a> or <a href=[sitetree_link id=13]>register</a> to list it here.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'LoggedInUsers', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(252, 21, 15, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2012-02-06 16:31:53', 'local-businesses', 'Local Businesses', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui  blanditiis praesentium voluptatum deleniti atque corrupti quos dolores  et quas molestias excepturi sint occaecati cupiditate non provident,  similique sunt in culpa qui officia deserunt mollitia animi, id est  laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita  distinctio. Nam libero tempore, cum soluta nobis est eligendi optio  cumque nihil impedit quo minus id quod maxime placeat facere possimus,  omnis voluptas assumenda est, omnis dolor repellendus.</p>\n<p>If you have a local business in Demoville, feel free to<a href=[sitetree_link id=13]/> <a href=[sitetree_link id=27]>list it</a> here.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'LoggedInUsers', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(253, 21, 16, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2012-02-06 16:32:56', 'local-businesses', 'Local Businesses', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui  blanditiis praesentium voluptatum deleniti atque corrupti quos dolores  et quas molestias excepturi sint occaecati cupiditate non provident,  similique sunt in culpa qui officia deserunt mollitia animi, id est  laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita  distinctio. Nam libero tempore, cum soluta nobis est eligendi optio  cumque nihil impedit quo minus id quod maxime placeat facere possimus,  omnis voluptas assumenda est, omnis dolor repellendus.</p>\n<p>If you have a local business in Demoville, feel free to <a href=[sitetree_link id=27]>list it</a> here. Note that you must be registered to do this.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'LoggedInUsers', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(254, 21, 17, 1, 1, 1, 'ListingPage', '2011-12-16 17:35:54', '2012-02-06 16:33:07', 'local-businesses', 'Local Businesses', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui  blanditiis praesentium voluptatum deleniti atque corrupti quos dolores  et quas molestias excepturi sint occaecati cupiditate non provident,  similique sunt in culpa qui officia deserunt mollitia animi, id est  laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita  distinctio. Nam libero tempore, cum soluta nobis est eligendi optio  cumque nihil impedit quo minus id quod maxime placeat facere possimus,  omnis voluptas assumenda est, omnis dolor repellendus.</p>\n<p>If you have a local business in Demoville, feel free to <a href=[sitetree_link id=27]>list it</a> here. Note that you must be <a href=[sitetree_link id=13]>registered</a> to do this.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'LoggedInUsers', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(255, 4, 2, 0, 1, 0, 'ErrorPage', '2011-12-15 04:04:19', '2012-02-16 14:19:43', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 13, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(256, 24, 5, 0, 1, 0, 'Page', '2011-12-19 15:15:10', '2012-02-16 14:19:49', 'privacy-policy', 'Privacy Policy', NULL, '<div>\n<p>Below we set out our privacy policy which will govern the way in  which we process any personal information that you provide to us. We  will notify you if the way in which we process your information is to  change at any time.</p>\n<p>The LSIS Excellence Gateway website is provided and managed by the Learning and Skills Improvement Service (LSIS).</p>\n<p>In these terms and conditions, the terms we, us  our and “LSIS Excellence Gateway” are to be taken as referring to LSIS.</p>\n<p>LSIS is a company limited by guarantee registered in England with company number <strong>06454450</strong>. <br/> Registered charity number <strong>1123636</strong>.</p>\n<p>All written enquiries regarding this website should be addressed to:</p>\n<p>The Web Services Manager<br/> Learning and Skills Improvement Service<br/> Friars House<br/> Manor House Drive <br/> Coventry <br/> CV1 2TE</p>\n<p>To sign up to access the community based features of this website you  will be asked to submit information about you which is personally  identifiable. By entering your details in the fields requested, your  personal details to be used by both LSIS and its service providers to  enable LSIS and its service providers to supply you with the services  you select. Notwithstanding this you can access our home page and browse  our site without disclosing your personal data save information  collected by cookies that we use (see below) and subject to the terms of  our <a href=http://www.excellencegateway.org.uk/page.aspx?o=disclaimer>disclaimer</a>.</p>\n<h3>Who may process data</h3>\n<p>Your personal information (which includes your name, address and any  other details you provide to us which concern you as an individual) may  be processed both by LSIS, as the Data Controller,  and our business  partners.  Each of the companies authorised to process your information  as mentioned above will do so in accordance with this privacy policy.</p>\n<h3>Purpose of processing</h3>\n<p>We will use your information to provide you with access to the  community based features of this website, to allow you to post messages  on message boards or forums, to upload resources to the Knowledge Base,  LSIS’s repository of multimedia resources, materials, support and  examples of effective practice from across the further education system,  and to set up a personal profile. If you have given consent while  registering, we may process your information to keep you informed about  our services via email or by post and to give you the opportunity to be  involved in evaluation/improvement of LSIS programmes and services. Your  information may also be used to enable us and third parties acting on  our behalf to analyse your information, in a non-identifying form,  (generally in the form of statistics), so that we can identify trends  about usage of our website or services and improve them.</p>\n<h3>Disclosure of information</h3>\n<p>In the unlikely event that a liquidator, administrator or receiver is  appointed over us or all or any part of our assets that insolvency  practitioner may transfer your information to a third party purchaser of  the business provided that purchaser undertakes to use your information  for the same purposes as set out in this policy.  We undertake not to  provide your personal information to third parties save in accordance  with this policy.  Your information will not be disclosed to government  or local authorities or other government institutions save as required  by law or other binding regulations.</p>\n<h3>Cookies</h3>\n<p>We may send a small file to your computer when you visit our  website.  This will enable us to identify your computer, track your  behaviour on our website and to identify your particular areas of  interest so as to enhance your future visits to this website. We may use  cookies to collect and store personal data and we link information  stored by cookies with personal data you supply to us. Save for the use  of cookies, we do not automatically log data or collect data save for  information you specifically provide to us. You can set your computer  browser to reject cookies but this may preclude your use of certain  parts of this website.</p>\n<h3>Security measures</h3>\n<p>We have implemented security policies, rules and technical measures  to protect the personal data that we have under our control from  unauthorised access, improper use and disclosure, unauthorised  destruction or accidental loss.</p>\n<h3>Users under 16</h3>\n<p>If you are aged 16 or under, you must get your parent''s or guardian''s  permission beforehand if you wish to use this website and if you are  going to provide personal information to us.</p>\n<h3>Access to information</h3>\n<p>You may ask us whether we are storing personal information about you  by writing to us stating your full name and your address, at:</p>\n<p>Learning and Skills Improvement Service<br/> Friars House<br/> Manor House Drive<br/> Coventry<br/> CV1 2TE</p>\n<p>If you have a data protection enquiry please use the relevant option on our <a href=http://www.excellencegateway.org.uk/page.aspx?o=feedback target=_self>feedback form</a>.</p>\n<p>A small administrative charge not exceeding £10 may be made for  fulfilling this request.  We may ask for proof of your identity before  providing any information and reserve the right to refuse to provide  information requested if identity is not established.</p>\n<h3>GENERAL WEBSITE TERMS OF USE</h3>\n<h3>Intellectual Property</h3>\n<p>All website design, text, graphics, the selection and arrangement  thereof are  Copyright © Learning and Skills Improvement Service 2010,  ALL RIGHTS RESERVED.</p>\n<p>Ownership of certain materials on this site has been transferred to  LSIS under the terms of Public Sector Information (PSI) licence no.  C2006010400. Reasonable steps have been taken to check third party  rights and permissions for this work, but LSIS will not be held  responsible for any unintentional infringements. If you have any  comments or queries, please <a href=http://www.excellencegateway.org.uk/page.aspx?o=feedback>contact the Excellence Gateway team</a>.</p>\n<p>The names, images and logos identifying the LSIS, LSIS Excellence  Gateway, or any third parties are proprietary marks of the LSIS and/or  third parties. Nothing contained herein shall be construed as conferring  by implication or otherwise any licence or right under any trademark or  patent of the LSIS or any other third party.</p>\n<h3>Improvement services providers</h3>\n<p>By submitting an application to the directory of improvement services providers published on this website, You agree:</p>\n<p>(a) to confirm that the information given is correct.</p>\n<p>(b) to have read the code of practice for listed suppliers and agree to abide by it.</p>\n<p>(c) to authorise LSIS to publish the information in this application form to list the services you/your organisation offer</p>\n<p>(d) to accept that LSIS have the right to make the final decision  about listing you/your organisation and that LSIS will not necessarily  give reasons for its decisions in this respect.</p>\n<p>You also understand that:</p>\n<p>(a) these requirements apply to every listed organisation or individual consultant.</p>\n<p>(b) any advice offered to a provider shall not incur any liability or  legal responsibility for LSIS, whether such advice is accepted,  implemented or rejected by the provider.</p>\n<p>(c) the selection of the supplier is the sole responsibility of  providers; no guarantee can be given that work will be awarded to  you/your organisation and that neither LSIS nor the providers will give  reasons for their decisions.</p>\n<p>(d) LSIS will carry out spot checks on applications, requesting  evidence of information provided herewith, and any false information  supplied will automatically result in disqualification should this be  discovered subsequent to publication in the Directory.</p>\n<p>(e) the information you supply will be held on a database available  to anyone accessing the portal. The data will be shared if you/your  organisation is selected for the provision of any improvement service.</p>\n<p>(f) providers who select you/your organisation to deliver improvement  services will be invited to give feedback on the services you/your  organisation provided by rating and commenting on their level of  satisfaction.</p>\n<p>(g) the data you have provided in the application form will not be used for any other purpose than that stated above.</p>\n<h3>Disclaimer of Warranty and Liability</h3>\n<p>The following provisions may be curtailed or disallowed by the laws  of certain jurisdictions.  In such case, the terms hereof are to be read  as excluding or limiting such term so as to satisfy such law.</p>\n<p><strong>Accuracy and suitability of information</strong></p>\n<p>We do not represent or warrant that the information accessible via  this website is accurate, complete or current. We have no liability  whatsoever in respect of any use which you make of such information.</p>\n<p>The information provided on this website has not been written to meet  your individual requirements and it is your sole responsibility to  satisfy yourself prior to using information or services from us that  this information or these services are suitable for your purposes.</p>\n<p><strong>Virus protection</strong></p>\n<p>Whilst we make all reasonable attempts to exclude viruses from the  website, we cannot ensure such exclusion and no liability is accepted  for viruses.  Thus, you are recommended to take all appropriate  safeguards before downloading information or images from this website.</p>\n<p><strong>Warranties</strong></p>\n<p>All warranties, express or implied, statutory or otherwise are hereby excluded.</p>\n<p><strong>Liability for damages</strong></p>\n<p>Neither we nor any of our employees or affiliated entities will be  liable for any kind of damages and howsoever arising including, without  limitation, loss of profits, compensatory, consequential, direct,  exemplary, incidental, indirect, punitive or special, damages or any  liability which you may have to a third party, even if we have been  advised of the possibility of such loss.</p>\n<p><strong>Links</strong></p>\n<p>We are not responsible for the direct or indirect consequences of you linking to any other website from this website.</p>\n<h3>Governing Law</h3>\n<p>These terms and this disclaimer and any claim based on use of  information from this website shall be governed by the laws of England  and Wales and disputes arising herefrom shall be non-exclusively subject  to the jurisdiction of the courts of England and Wales.</p>\n<h3>Acceptance of Terms and Conditions</h3>\n<p>By entering this website you are accepting these terms and this  disclaimer. If for any reason you cannot accept these terms and this  disclaimer in full then you must leave this website immediately.</p>\n</div>', 'Privacy Policy', NULL, NULL, NULL, 0, 1, NULL, 0, 12, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(257, 14, 6, 0, 1, 0, 'SolrSearchPage', '2011-12-15 17:33:53', '2012-02-16 14:19:57', 'search', 'Search', NULL, NULL, 'Search', NULL, NULL, NULL, 0, 1, NULL, 0, 11, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(258, 13, 5, 0, 1, 0, 'MemberProfilePage', '2011-12-15 17:31:11', '2012-02-16 14:20:03', 'your-account', 'Your Account', NULL, NULL, 'Your Account', NULL, NULL, NULL, 0, 1, NULL, 0, 10, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(259, 5, 2, 0, 1, 0, 'ErrorPage', '2011-12-15 04:04:20', '2012-02-16 14:20:10', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 13, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(261, 3, 11, 0, 1, 0, 'ContactPage', '2011-12-15 04:04:19', '2012-02-16 14:22:38', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your  requests and general enquiries or call us on <strong>1234554321</strong>.</p>\n<p><strong>Demoville Council</strong><br/>1 Cecil Place<br/> Prahran<br/> Victoria 3181<br/> Australia</p>\n<p>Phone: 1234512345<br/>Fax: 5432154321<br/>Email: demo@demoville.com.au<br/><a href=contact-us> </a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(262, 3, 12, 1, 1, 1, 'ContactPage', '2011-12-15 04:04:19', '2012-02-16 14:22:39', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your  requests and general enquiries or call us on <strong>1234554321</strong>.</p>\n<p><strong>Demoville Council</strong><br/>1 Cecil Place<br/> Prahran<br/> Victoria 3181<br/> Australia</p>\n<p>Phone: 1234512345<br/>Fax: 5432154321<br/>Email: demo@demoville.com.au<br/><a href=contact-us> </a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(263, 25, 8, 0, 1, 0, 'Page', '2011-12-19 17:20:40', '2012-02-16 14:25:08', 'business', 'Business', NULL, '<p>Consectetur adipiscing elit. Vivamus pharetra risus in orci tincidunt  vitae porttitor nulla laoreet. Vestibulum in diam urna, non bibendum  lectus. Aenean iaculis, erat a dignissim consectetur, purus lorem  ultricies lorem, quis interdum dui dolor non nibh. Vestibulum mi turpis,  ullamcorper ac aliquam a, porttitor eget massa. Quisque viverra ipsum  eget purus sollicitudin dapibus. Maecenas laoreet vehicula felis, et  interdum sapien sagittis suscipit. Curabitur sollicitudin volutpat ipsum  a condimentum. Donec quis massa felis. Integer vehicula dapibus massa,  sit amet hendrerit purus interdum in. Vivamus blandit nulla sit amet  sapien porta nec imperdiet arcu bibendum.</p>\n<p>Vestibulum et nibh orci. Mauris fringilla adipiscing mauris vitae  bibendum. Aenean pharetra suscipit pretium. In vel sem mauris, id porta  turpis. Integer a congue nisi. Nunc et congue metus. Praesent et est  purus, sit amet volutpat purus. Duis eget semper libero. Mauris molestie  bibendum quam eget posuere. Morbi vitae eros magna, ut consequat sem.  Cras pulvinar sapien id elit fringilla quis elementum nibh sollicitudin.  Maecenas vel libero orci. Donec a diam quis nunc sollicitudin tincidunt  ut ut elit. Duis nunc dolor, dictum ac condimentum eget, adipiscing id  tortor.</p>', 'Business', NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(264, 3, 13, 1, 1, 1, 'ContactPage', '2011-12-15 04:04:19', '2012-02-17 10:37:14', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your  requests and general enquiries or call us on <strong>1234554321</strong>.</p>\n<p><strong>Demoville Council</strong><br/>1 Cecil Place<br/> Prahran<br/> Victoria 3181<br/> Australia</p>\n<p>Phone: 1234512345<br/>Fax: 5432154321<br/>Email: demo@demoville.com.au<br/><a href=contact-us> </a></p>\n<p> </p>\n<p> </p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(265, 57, 5, 1, 1, 1, 'SubscriptionPage', '2012-02-06 10:10:42', '2012-02-17 12:28:37', 'newsletter', 'Subscribe to our Newsletter', NULL, '<p>Please enter your email address below to receive monthly updates via email.</p>\n', 'Newsletter', NULL, NULL, NULL, 0, 1, NULL, 0, 9, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(266, 57, 6, 1, 1, 1, 'SubscriptionPage', '2012-02-06 10:10:42', '2012-02-17 14:05:51', 'newsletter', 'Subscribe to our Newsletter', NULL, '<p>Please enter your email address below to receive monthly updates via email.</p>\n<p> </p>\n<p><img class=left src=assets/news-articles/_resampled/resizedimage600450-Test-Image.jpg width=600 height=450 alt= title=/></p>\n<p> </p>\n', 'Newsletter', NULL, NULL, NULL, 0, 1, NULL, 0, 9, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(267, 57, 7, 1, 1, 1, 'SubscriptionPage', '2012-02-06 10:10:42', '2012-02-17 14:06:39', 'newsletter', 'Subscribe to our Newsletter', NULL, '<p>Please enter your email address below to receive monthly updates via email.</p>\n<p> </p>\n', 'Newsletter', NULL, NULL, NULL, 0, 1, NULL, 0, 9, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(268, 57, 8, 1, 1, 1, 'SubscriptionPage', '2012-02-06 10:10:42', '2012-02-17 14:07:12', 'newsletter', 'Subscribe to our Newsletter', NULL, '<p>Please enter your email address below to receive monthly updates via email.</p>\n', 'Newsletter', NULL, NULL, NULL, 0, 1, NULL, 0, 9, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(269, 60, 1, 0, 4, 0, 'RegisterableEvent', '2012-05-16 11:30:00', '2012-05-16 11:30:00', 'new-registerableevent', 'New RegisterableEvent', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(270, 60, 2, 1, 4, 4, 'RegisterableEvent', '2012-05-16 11:30:00', '2012-05-16 11:30:08', 'partay', 'Partay', NULL, NULL, 'Partay', NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(271, 61, 1, 0, 4, 0, 'CalendarEvent', '2012-05-29 17:58:06', '2012-05-29 17:58:06', 'my-new-event', 'My new event', NULL, 'This is an event on a day here and now', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(272, 62, 1, 1, 4, 4, 'CalendarEvent', '2012-05-29 17:58:50', '2012-05-29 17:58:50', 'my-new-event-2', 'My new event', NULL, 'This is an event on a day here and now', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(273, 63, 1, 1, 4, 4, 'CalendarEvent', '2012-05-29 18:07:36', '2012-05-29 18:07:36', 'my-new-event-3', 'My new event', NULL, 'This is an event on a day here and now', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 6, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(274, 64, 1, 1, 4, 4, 'CalendarEvent', '2012-05-30 10:37:56', '2012-05-30 10:37:56', 'my-new-event-4', 'My new event', NULL, 'This is an event on a day here and now', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 7, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 49, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(275, 20, 5, 0, 4, 0, 'NewsArticle', '2011-12-16 15:09:15', '2012-07-31 17:34:23', 'demo-square-a-community-landmark', 'Demo Square - a community landmark', NULL, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its next decade with the unveiling of a new civic place which is set to breathe fresh life into Victoria Harbour.</p>\n<p>Delivered by a unique partnership model comprising of City of Demoville, Lend Lease and Places Victoria, the centerpiece, to be known as Demo Square, will be a next generation library and community centre.</p>\n<p>Located at the intersection where Collins Street will meet Bourke, the library and community centre will commence construction in April 2012 and aim for completion in mid 2013.</p>\n<p>Demolands became a part of the City of Demoville in 2007. The suburb''s 200 hectares of land and water are on Victoria Harbour, west of the Central Business District (CBD). Its inclusion doubled the size of the Demoville’s CBD and returned the waterfront to the city.</p>\n<p>The area is close to Demoville''s main transport networks, including Southern Cross Station. Demolands is well known as home to the Etihad Stadium and a large number of modern buildings and public spaces and artworks.</p>\n<p>From the original development at New Quay, featuring apartments, restaurants, a marina and film studios, Demolands has grown into a thriving waterfront suburb offering a mix of inner city living, shopping, business, parks, entertainment, dining, sporting events, marine transport, community events and arts and culture.</p>\n<p>Demolands has also become the national headquarters for a number of major businesses, including the National Australia Bank, ANZ, Myer, AXA, Bendigo Bank, Medibank Private and the Bureau of Meteorology.</p>\n<p>It is estimated that by around 2020 Demolands will have 20 million visitors each year, a workplace for 40,000 people daily and a residential area for up to 17,000.</p>\n<h3>What’s on in Demolands</h3>\n<p>With its idyllic mix of waterfront location and CBD lifestyle, Demolands has attracted a selection of Demoville’s hottest new bars and restaurants, shopping and cultural and sporting events.</p>\n<p> </p>\n<p>To plan your day or evening at Demolands visit our ‘What’s on section’ and select the latest Demolands program.</p>', 'Demo Square - a community landmark', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(276, 12, 2, 0, 4, 0, 'NewsArticle', '2011-12-15 16:55:23', '2012-07-31 17:34:23', 'new-newsarticle-2', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(277, 11, 2, 0, 4, 0, 'NewsArticle', '2011-12-15 16:53:39', '2012-07-31 17:34:23', 'new-newsarticle', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(278, 10, 4, 0, 4, 0, 'NewsArticle', '2011-12-15 16:24:46', '2012-07-31 17:34:23', 'open-space-strategy', 'Open Space Strategy', NULL, '<p><strong>Planning for future growth</strong></p>\n<p>The City of Melbourne manages over 500 hectares of open space. This  represents almost 15 percent of the total area of the City of Melbourne.</p>\n<p>To meet the needs of the growing and changing residential and worker  population, and to respond to issues such as climate change, we have  prepared our first draft Open Space Strategy for the entire  municipality.</p>\n<p>The draft Open Space Strategy provides the overarching framework and  strategic direction for open space planning in the City of Melbourne for  the next 15 years.</p>\n<p>A key objective of the strategy is to plan Melbourne’s open space  network to one that is within easy walking distance to the community,  particular in areas of forecasted population growth.</p>\n<p>What kind of issues does the strategy address?</p>\n<p><strong>The strategy will provide direction on these key issues:</strong></p>\n<p>the unprecedented demand for open space as Melbourne’s population continues to grow</p>\n<p>climate change – a decade of drought, water restrictions and extreme  weather and the predicted impacts of climate change provide additional  challenges in the management of parks and reserves and the role they can  play in climate change adaptation</p>\n<p>ensuring open spaces can provide for and adapt to differing needs and  uses. This includes providing people with the opportunity to connect  with nature.</p>', 'Open Space Strategy', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(279, 10, 5, 0, 4, 0, 'NewsArticle', '2011-12-15 16:24:46', '2012-07-31 17:34:24', 'open-space-strategy', 'Open Space Strategy', NULL, '<p><strong>Planning for future growth</strong></p>\n<p>The City of Melbourne manages over 500 hectares of open space. This  represents almost 15 percent of the total area of the City of Melbourne.</p>\n<p>To meet the needs of the growing and changing residential and worker  population, and to respond to issues such as climate change, we have  prepared our first draft Open Space Strategy for the entire  municipality.</p>\n<p>The draft Open Space Strategy provides the overarching framework and  strategic direction for open space planning in the City of Melbourne for  the next 15 years.</p>\n<p>A key objective of the strategy is to plan Melbourne’s open space  network to one that is within easy walking distance to the community,  particular in areas of forecasted population growth.</p>\n<p>What kind of issues does the strategy address?</p>\n<p><strong>The strategy will provide direction on these key issues:</strong></p>\n<p>the unprecedented demand for open space as Melbourne’s population continues to grow</p>\n<p>climate change – a decade of drought, water restrictions and extreme  weather and the predicted impacts of climate change provide additional  challenges in the management of parks and reserves and the role they can  play in climate change adaptation</p>\n<p>ensuring open spaces can provide for and adapt to differing needs and  uses. This includes providing people with the opportunity to connect  with nature.</p>', 'Open Space Strategy', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(280, 20, 6, 0, 4, 0, 'NewsArticle', '2011-12-16 15:09:15', '2012-07-31 17:34:39', 'demo-square-a-community-landmark', 'Demo Square - a community landmark', NULL, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its next decade with the unveiling of a new civic place which is set to breathe fresh life into Victoria Harbour.</p>\n<p>Delivered by a unique partnership model comprising of City of Demoville, Lend Lease and Places Victoria, the centerpiece, to be known as Demo Square, will be a next generation library and community centre.</p>\n<p>Located at the intersection where Collins Street will meet Bourke, the library and community centre will commence construction in April 2012 and aim for completion in mid 2013.</p>\n<p>Demolands became a part of the City of Demoville in 2007. The suburb''s 200 hectares of land and water are on Victoria Harbour, west of the Central Business District (CBD). Its inclusion doubled the size of the Demoville’s CBD and returned the waterfront to the city.</p>\n<p>The area is close to Demoville''s main transport networks, including Southern Cross Station. Demolands is well known as home to the Etihad Stadium and a large number of modern buildings and public spaces and artworks.</p>\n<p>From the original development at New Quay, featuring apartments, restaurants, a marina and film studios, Demolands has grown into a thriving waterfront suburb offering a mix of inner city living, shopping, business, parks, entertainment, dining, sporting events, marine transport, community events and arts and culture.</p>\n<p>Demolands has also become the national headquarters for a number of major businesses, including the National Australia Bank, ANZ, Myer, AXA, Bendigo Bank, Medibank Private and the Bureau of Meteorology.</p>\n<p>It is estimated that by around 2020 Demolands will have 20 million visitors each year, a workplace for 40,000 people daily and a residential area for up to 17,000.</p>\n<h3>What’s on in Demolands</h3>\n<p>With its idyllic mix of waterfront location and CBD lifestyle, Demolands has attracted a selection of Demoville’s hottest new bars and restaurants, shopping and cultural and sporting events.</p>\n<p> </p>\n<p>To plan your day or evening at Demolands visit our ‘What’s on section’ and select the latest Demolands program.</p>', 'Demo Square - a community landmark', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(281, 12, 3, 0, 4, 0, 'NewsArticle', '2011-12-15 16:55:23', '2012-07-31 17:34:39', 'new-newsarticle-2', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(282, 12, 4, 0, 4, 0, 'NewsArticle', '2011-12-15 16:55:23', '2012-07-31 17:34:40', 'new-newsarticle-2', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(283, 11, 3, 0, 4, 0, 'NewsArticle', '2011-12-15 16:53:39', '2012-07-31 17:34:40', 'new-newsarticle', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(284, 10, 6, 0, 4, 0, 'NewsArticle', '2011-12-15 16:24:46', '2012-07-31 17:34:40', 'open-space-strategy', 'Open Space Strategy', NULL, '<p><strong>Planning for future growth</strong></p>\n<p>The City of Melbourne manages over 500 hectares of open space. This  represents almost 15 percent of the total area of the City of Melbourne.</p>\n<p>To meet the needs of the growing and changing residential and worker  population, and to respond to issues such as climate change, we have  prepared our first draft Open Space Strategy for the entire  municipality.</p>\n<p>The draft Open Space Strategy provides the overarching framework and  strategic direction for open space planning in the City of Melbourne for  the next 15 years.</p>\n<p>A key objective of the strategy is to plan Melbourne’s open space  network to one that is within easy walking distance to the community,  particular in areas of forecasted population growth.</p>\n<p>What kind of issues does the strategy address?</p>\n<p><strong>The strategy will provide direction on these key issues:</strong></p>\n<p>the unprecedented demand for open space as Melbourne’s population continues to grow</p>\n<p>climate change – a decade of drought, water restrictions and extreme  weather and the predicted impacts of climate change provide additional  challenges in the management of parks and reserves and the role they can  play in climate change adaptation</p>\n<p>ensuring open spaces can provide for and adapt to differing needs and  uses. This includes providing people with the opportunity to connect  with nature.</p>', 'Open Space Strategy', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(285, 20, 7, 0, 4, 0, 'NewsArticle', '2011-12-16 15:09:15', '2012-07-31 17:35:28', 'demo-square-a-community-landmark', 'Demo Square - a community landmark', NULL, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its next decade with the unveiling of a new civic place which is set to breathe fresh life into Victoria Harbour.</p>\n<p>Delivered by a unique partnership model comprising of City of Demoville, Lend Lease and Places Victoria, the centerpiece, to be known as Demo Square, will be a next generation library and community centre.</p>\n<p>Located at the intersection where Collins Street will meet Bourke, the library and community centre will commence construction in April 2012 and aim for completion in mid 2013.</p>\n<p>Demolands became a part of the City of Demoville in 2007. The suburb''s 200 hectares of land and water are on Victoria Harbour, west of the Central Business District (CBD). Its inclusion doubled the size of the Demoville’s CBD and returned the waterfront to the city.</p>\n<p>The area is close to Demoville''s main transport networks, including Southern Cross Station. Demolands is well known as home to the Etihad Stadium and a large number of modern buildings and public spaces and artworks.</p>\n<p>From the original development at New Quay, featuring apartments, restaurants, a marina and film studios, Demolands has grown into a thriving waterfront suburb offering a mix of inner city living, shopping, business, parks, entertainment, dining, sporting events, marine transport, community events and arts and culture.</p>\n<p>Demolands has also become the national headquarters for a number of major businesses, including the National Australia Bank, ANZ, Myer, AXA, Bendigo Bank, Medibank Private and the Bureau of Meteorology.</p>\n<p>It is estimated that by around 2020 Demolands will have 20 million visitors each year, a workplace for 40,000 people daily and a residential area for up to 17,000.</p>\n<h3>What’s on in Demolands</h3>\n<p>With its idyllic mix of waterfront location and CBD lifestyle, Demolands has attracted a selection of Demoville’s hottest new bars and restaurants, shopping and cultural and sporting events.</p>\n<p> </p>\n<p>To plan your day or evening at Demolands visit our ‘What’s on section’ and select the latest Demolands program.</p>', 'Demo Square - a community landmark', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(286, 12, 5, 1, 4, 4, 'NewsArticle', '2011-12-15 16:55:23', '2012-07-31 17:35:28', 'new-newsarticle-2', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(287, 11, 4, 1, 4, 4, 'NewsArticle', '2011-12-15 16:53:39', '2012-07-31 17:35:28', 'new-newsarticle', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(288, 10, 7, 1, 4, 4, 'NewsArticle', '2011-12-15 16:24:46', '2012-07-31 17:35:28', 'open-space-strategy', 'Open Space Strategy', NULL, '<p><strong>Planning for future growth</strong></p>\n<p>The City of Melbourne manages over 500 hectares of open space. This  represents almost 15 percent of the total area of the City of Melbourne.</p>\n<p>To meet the needs of the growing and changing residential and worker  population, and to respond to issues such as climate change, we have  prepared our first draft Open Space Strategy for the entire  municipality.</p>\n<p>The draft Open Space Strategy provides the overarching framework and  strategic direction for open space planning in the City of Melbourne for  the next 15 years.</p>\n<p>A key objective of the strategy is to plan Melbourne’s open space  network to one that is within easy walking distance to the community,  particular in areas of forecasted population growth.</p>\n<p>What kind of issues does the strategy address?</p>\n<p><strong>The strategy will provide direction on these key issues:</strong></p>\n<p>the unprecedented demand for open space as Melbourne’s population continues to grow</p>\n<p>climate change – a decade of drought, water restrictions and extreme  weather and the predicted impacts of climate change provide additional  challenges in the management of parks and reserves and the role they can  play in climate change adaptation</p>\n<p>ensuring open spaces can provide for and adapt to differing needs and  uses. This includes providing people with the opportunity to connect  with nature.</p>', 'Open Space Strategy', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(289, 20, 8, 1, 4, 4, 'NewsArticle', '2011-12-16 15:09:15', '2012-07-31 17:35:42', 'demo-square-a-community-landmark', 'City Square - a community landmark', NULL, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its next decade with the unveiling of a new civic place which is set to breathe fresh life into Victoria Harbour.</p>\n<p>Delivered by a unique partnership model comprising of City of Demoville, Lend Lease and Places Victoria, the centerpiece, to be known as Demo Square, will be a next generation library and community centre.</p>\n<p>Located at the intersection where Collins Street will meet Bourke, the library and community centre will commence construction in April 2012 and aim for completion in mid 2013.</p>\n<p>Demolands became a part of the City of Demoville in 2007. The suburb''s 200 hectares of land and water are on Victoria Harbour, west of the Central Business District (CBD). Its inclusion doubled the size of the Demoville’s CBD and returned the waterfront to the city.</p>\n<p>The area is close to Demoville''s main transport networks, including Southern Cross Station. Demolands is well known as home to the Etihad Stadium and a large number of modern buildings and public spaces and artworks.</p>\n<p>From the original development at New Quay, featuring apartments, restaurants, a marina and film studios, Demolands has grown into a thriving waterfront suburb offering a mix of inner city living, shopping, business, parks, entertainment, dining, sporting events, marine transport, community events and arts and culture.</p>\n<p>Demolands has also become the national headquarters for a number of major businesses, including the National Australia Bank, ANZ, Myer, AXA, Bendigo Bank, Medibank Private and the Bureau of Meteorology.</p>\n<p>It is estimated that by around 2020 Demolands will have 20 million visitors each year, a workplace for 40,000 people daily and a residential area for up to 17,000.</p>\n<h3>What’s on in Demolands</h3>\n<p>With its idyllic mix of waterfront location and CBD lifestyle, Demolands has attracted a selection of Demoville’s hottest new bars and restaurants, shopping and cultural and sporting events.</p>\n<p> </p>\n<p>To plan your day or evening at Demolands visit our ‘What’s on section’ and select the latest Demolands program.</p>', 'Demo Square - a community landmark', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(290, 20, 9, 1, 4, 4, 'NewsArticle', '2011-12-16 15:09:15', '2012-07-31 17:36:03', 'demo-square-a-community-landmark', 'City Square - a community landmark', NULL, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its next decade with the unveiling of a new civic place which is set to breathe fresh life into Victoria Harbour.</p>\n<p>Delivered by a unique partnership model comprising of City of Demoville, Lend Lease and Places Victoria, the centerpiece, to be known as Demo Square, will be a next generation library and community centre.</p>\n<p>Located at the intersection where Collins Street will meet Bourke, the library and community centre will commence construction in April 2012 and aim for completion in mid 2013.</p>\n<p>Demolands became a part of the City of Demoville in 2007. The suburb''s 200 hectares of land and water are on Victoria Harbour, west of the Central Business District (CBD). Its inclusion doubled the size of the Demoville’s CBD and returned the waterfront to the city.</p>\n<p>The area is close to Demoville''s main transport networks, including Southern Cross Station. Demolands is well known as home to the Etihad Stadium and a large number of modern buildings and public spaces and artworks.</p>\n<p>From the original development at New Quay, featuring apartments, restaurants, a marina and film studios, Demolands has grown into a thriving waterfront suburb offering a mix of inner city living, shopping, business, parks, entertainment, dining, sporting events, marine transport, community events and arts and culture.</p>\n<p>Demolands has also become the national headquarters for a number of major businesses, including the National Australia Bank, ANZ, Myer, AXA, Bendigo Bank, Medibank Private and the Bureau of Meteorology.</p>\n<p>It is estimated that by around 2020 Demolands will have 20 million visitors each year, a workplace for 40,000 people daily and a residential area for up to 17,000.</p>\n<h3>What’s on in Demolands</h3>\n<p>With its idyllic mix of waterfront location and CBD lifestyle, Demolands has attracted a selection of Demoville’s hottest new bars and restaurants, shopping and cultural and sporting events.</p>\n<p> </p>\n<p>To plan your day or evening at Demolands visit our ‘What’s on section’ and select the latest Demolands program.</p>', 'Demo Square - a community landmark', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(291, 12, 6, 0, 4, 0, 'NewsArticle', '2011-12-15 16:55:23', '2012-07-31 17:36:04', 'new-newsarticle-2', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(292, 12, 7, 0, 4, 0, 'NewsArticle', '2011-12-15 16:55:23', '2012-07-31 17:36:04', 'new-newsarticle-2', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(293, 11, 5, 1, 4, 4, 'NewsArticle', '2011-12-15 16:53:39', '2012-07-31 17:36:04', 'new-newsarticle', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(294, 10, 8, 1, 4, 4, 'NewsArticle', '2011-12-15 16:24:46', '2012-07-31 17:36:04', 'open-space-strategy', 'Open Space Strategy', NULL, '<p><strong>Planning for future growth</strong></p>\n<p>The City of Melbourne manages over 500 hectares of open space. This  represents almost 15 percent of the total area of the City of Melbourne.</p>\n<p>To meet the needs of the growing and changing residential and worker  population, and to respond to issues such as climate change, we have  prepared our first draft Open Space Strategy for the entire  municipality.</p>\n<p>The draft Open Space Strategy provides the overarching framework and  strategic direction for open space planning in the City of Melbourne for  the next 15 years.</p>\n<p>A key objective of the strategy is to plan Melbourne’s open space  network to one that is within easy walking distance to the community,  particular in areas of forecasted population growth.</p>\n<p>What kind of issues does the strategy address?</p>\n<p><strong>The strategy will provide direction on these key issues:</strong></p>\n<p>the unprecedented demand for open space as Melbourne’s population continues to grow</p>\n<p>climate change – a decade of drought, water restrictions and extreme  weather and the predicted impacts of climate change provide additional  challenges in the management of parks and reserves and the role they can  play in climate change adaptation</p>\n<p>ensuring open spaces can provide for and adapt to differing needs and  uses. This includes providing people with the opportunity to connect  with nature.</p>', 'Open Space Strategy', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(295, 12, 8, 1, 4, 4, 'NewsArticle', '2011-12-15 16:55:23', '2012-07-31 17:36:28', 'new-newsarticle-2', 'Missing the full article content here<br>', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(296, 20, 10, 0, 4, 0, 'NewsArticle', '2011-12-16 15:09:15', '2012-07-31 17:37:17', 'demo-square-a-community-landmark', 'City Square - a community landmark', NULL, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its next decade with the unveiling of a new civic place which is set to breathe fresh life into Victoria Harbour.</p>\n<p>Delivered by a unique partnership model comprising of City of Demoville, Lend Lease and Places Victoria, the centerpiece, to be known as Demo Square, will be a next generation library and community centre.</p>\n<p>Located at the intersection where Collins Street will meet Bourke, the library and community centre will commence construction in April 2012 and aim for completion in mid 2013.</p>\n<p>Demolands became a part of the City of Demoville in 2007. The suburb''s 200 hectares of land and water are on Victoria Harbour, west of the Central Business District (CBD). Its inclusion doubled the size of the Demoville’s CBD and returned the waterfront to the city.</p>\n<p>The area is close to Demoville''s main transport networks, including Southern Cross Station. Demolands is well known as home to the Etihad Stadium and a large number of modern buildings and public spaces and artworks.</p>\n<p>From the original development at New Quay, featuring apartments, restaurants, a marina and film studios, Demolands has grown into a thriving waterfront suburb offering a mix of inner city living, shopping, business, parks, entertainment, dining, sporting events, marine transport, community events and arts and culture.</p>\n<p>Demolands has also become the national headquarters for a number of major businesses, including the National Australia Bank, ANZ, Myer, AXA, Bendigo Bank, Medibank Private and the Bureau of Meteorology.</p>\n<p>It is estimated that by around 2020 Demolands will have 20 million visitors each year, a workplace for 40,000 people daily and a residential area for up to 17,000.</p>\n<h3>What’s on in Demolands</h3>\n<p>With its idyllic mix of waterfront location and CBD lifestyle, Demolands has attracted a selection of Demoville’s hottest new bars and restaurants, shopping and cultural and sporting events.</p>\n<p> </p>\n<p>To plan your day or evening at Demolands visit our ‘What’s on section’ and select the latest Demolands program.</p>', 'Demo Square - a community landmark', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(297, 20, 11, 1, 4, 4, 'NewsArticle', '2011-12-16 15:09:15', '2012-07-31 17:37:36', 'demo-square-a-community-landmark', 'My city Square - a community landmark', NULL, '<p>Demoville’s most progressive waterfront neighbourhood has commenced its next decade with the unveiling of a new civic place which is set to breathe fresh life into Victoria Harbour.</p>\n<p>Delivered by a unique partnership model comprising of City of Demoville, Lend Lease and Places Victoria, the centerpiece, to be known as Demo Square, will be a next generation library and community centre.</p>\n<p>Located at the intersection where Collins Street will meet Bourke, the library and community centre will commence construction in April 2012 and aim for completion in mid 2013.</p><p>So anything I enter here is all good to go<br/></p>\n<p>Demolands became a part of the City of Demoville in 2007. The suburb''s 200 hectares of land and water are on Victoria Harbour, west of the Central Business District (CBD). Its inclusion doubled the size of the Demoville’s CBD and returned the waterfront to the city.</p>\n<p>The area is close to Demoville''s main transport networks, including Southern Cross Station. Demolands is well known as home to the Etihad Stadium and a large number of modern buildings and public spaces and artworks.</p>\n<p>From the original development at New Quay, featuring apartments, restaurants, a marina and film studios, Demolands has grown into a thriving waterfront suburb offering a mix of inner city living, shopping, business, parks, entertainment, dining, sporting events, marine transport, community events and arts and culture.</p>\n<p>Demolands has also become the national headquarters for a number of major businesses, including the National Australia Bank, ANZ, Myer, AXA, Bendigo Bank, Medibank Private and the Bureau of Meteorology.</p>\n<p>It is estimated that by around 2020 Demolands will have 20 million visitors each year, a workplace for 40,000 people daily and a residential area for up to 17,000.</p>\n<h3>What’s on in Demolands</h3>\n<p>With its idyllic mix of waterfront location and CBD lifestyle, Demolands has attracted a selection of Demoville’s hottest new bars and restaurants, shopping and cultural and sporting events.</p>\n<p> </p>\n<p>To plan your day or evening at Demolands visit our ‘What’s on section’ and select the latest Demolands program.</p>', 'Demo Square - a community landmark', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(298, 65, 1, 0, 4, 0, 'Calendar', '2012-10-10 11:44:25', '2012-10-10 11:44:25', 'new-calendar', 'New Calendar', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(299, 65, 2, 1, 4, 4, 'Calendar', '2012-10-10 11:44:25', '2012-10-10 11:55:20', 'events', 'Events', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(300, 65, 3, 0, 4, 0, 'Calendar', '2012-10-10 11:44:25', '2012-10-10 11:55:41', 'events', 'Events', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(301, 65, 4, 1, 4, 4, 'Calendar', '2012-10-10 11:44:25', '2012-10-10 11:55:43', 'events', 'Events', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(302, 66, 1, 0, 4, 0, 'CalendarEvent', '2012-10-10 12:28:27', '2012-10-10 12:28:27', 'new-calendar-event', 'New Calendar Event', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 65, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(303, 66, 2, 1, 4, 4, 'CalendarEvent', '2012-10-10 12:28:27', '2012-10-10 12:31:08', 'demo-event', 'Demo Event', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinction.</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 65, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(304, 66, 3, 1, 4, 4, 'CalendarEvent', '2012-10-10 12:28:27', '2012-10-10 12:35:37', 'demo-event', 'Demo Event', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinction.</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 65, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(305, 65, 5, 1, 4, 4, 'Calendar', '2012-10-10 11:44:25', '2012-10-10 12:53:41', 'events', 'Events', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 4, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(306, 66, 4, 1, 4, 4, 'CalendarEvent', '2012-10-10 12:28:27', '2012-10-10 14:24:49', 'demo-event', 'Demo Event', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinction.</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 65, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(307, 67, 1, 0, 4, 0, '', '2012-10-10 14:54:44', '2012-10-10 14:54:44', 'new-survey-page', 'New Survey Page', NULL, '$UserDefinedForm', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(308, 67, 2, 1, 4, 4, 'SiteTree', '2012-10-10 14:54:44', '2012-10-10 15:08:54', 'new-survey-page', 'New Survey Page', NULL, '$UserDefinedForm', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(309, 67, 3, 1, 4, 4, 'SiteTree', '2012-10-10 14:54:44', '2012-10-10 15:09:38', 'new-survey-page', 'Cyclists - Have your say', NULL, '$UserDefinedForm', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(310, 67, 4, 1, 4, 4, 'UserDefinedForm', '2012-10-10 14:54:44', '2012-10-10 15:09:52', 'new-survey-page', 'Cyclists - Have your say', NULL, '$UserDefinedForm', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(311, 67, 5, 0, 4, 0, 'UserDefinedForm', '2012-10-10 14:54:44', '2012-10-10 15:18:45', 'new-survey-page', 'Cyclists - Have your say', NULL, '$UserDefinedForm', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 58, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(312, 67, 6, 1, 4, 4, 'UserDefinedForm', '2012-10-10 14:54:44', '2012-10-10 15:18:45', 'new-survey-page', 'Cyclists - Have your say', NULL, '$UserDefinedForm', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 58, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(313, 67, 7, 1, 4, 4, 'UserDefinedForm', '2012-10-10 14:54:44', '2012-10-10 15:22:18', 'new-survey-page', 'Cyclists - Have your say', NULL, '<p>This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a GUI in the CMS.</p>\n<p>$UserDefinedForm</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 58, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(314, 67, 8, 1, 4, 4, 'UserDefinedForm', '2012-10-10 14:54:44', '2012-10-10 15:22:49', 'new-survey-page', 'Cyclists - Have your say', NULL, '<p>This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a user friendly interface in the CMS.</p>\n<p>$UserDefinedForm</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 58, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(315, 67, 9, 1, 4, 4, 'UserDefinedForm', '2012-10-10 14:54:44', '2012-10-10 15:26:27', 'cyclists-have-your-say', 'Cyclists - Have your say', NULL, '<p>This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a user friendly interface in the CMS.</p>\n<p>$UserDefinedForm</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 58, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(316, 66, 5, 0, 4, 0, 'CalendarEvent', '2012-10-10 12:28:27', '2012-10-10 15:42:17', 'demo-event', 'Demo Event', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinction.</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 65, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(317, 66, 6, 1, 4, 4, 'CalendarEvent', '2012-10-10 12:28:27', '2012-10-10 15:42:49', 'demo-event', 'Demo Event', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinction.</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 65, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(318, 3, 14, 0, 4, 0, 'ContactPage', '2011-12-15 04:04:19', '2012-10-10 15:58:13', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your  requests and general enquiries or call us on <strong>1234554321</strong>.</p>\n<p><strong>Demoville Council</strong><br/>1 Cecil Place<br/> Prahran<br/> Victoria 3181<br/> Australia</p>\n<p>Phone: 1234512345<br/>Fax: 5432154321<br/>Email: demo@demoville.com.au<br/><a href="contact-us"> </a></p>\n<p> </p>\n<p> </p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(319, 3, 15, 1, 4, 4, 'ContactPage', '2011-12-15 04:04:19', '2012-10-10 15:58:13', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your requests and general enquiries or call us on <strong>1234554321</strong>.</p>\n<p><strong>Demoville Council</strong><br/>1 Cecil Place<br/> Prahran<br/> Victoria 3181<br/> Australia</p>\n<p>Phone: 1234512345<br/>Fax: 5432154321<br/>Email: demo@demoville.com.au<br/> </p>\n<p> </p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(320, 3, 16, 1, 4, 4, 'ContactPage', '2011-12-15 04:04:19', '2012-10-10 15:58:38', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your requests and general enquiries or call us on <strong>1234554321</strong>.</p>\n<p><strong>Demoville Council</strong><br/>1 Cecil Place<br/> Prahran<br/> Victoria 3181<br/> Australia</p>\n<p>Phone: 1234512345<br/>Fax: 5432154321<br/>Email: demo@demoville.com.au</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(321, 3, 17, 1, 4, 4, 'ContactPage', '2011-12-15 04:04:19', '2012-10-10 16:00:45', 'contact-us', 'Contact Us', NULL, '<p>Visit Demoville Council''s Customer Service Centres at Demoville, Demosly where our staff will assist with all your requests and general enquiries or call us on <strong>1234554321</strong>.</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 8, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(322, 67, 10, 1, 4, 4, 'UserDefinedForm', '2012-10-10 14:54:44', '2012-10-10 16:11:31', 'cyclists-have-your-say', 'Cyclists - Have your say', NULL, '<p>This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a user friendly interface in the CMS.</p>\n<p>$UserDefinedForm</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 58, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(323, 58, 11, 1, 4, 4, 'ListingPage', '2012-02-06 11:10:39', '2012-10-10 16:17:55', 'have-your-say', 'Have your say', NULL, '<p>This is an example of a listing page. It lists a number of items based on how it is configured in the CMS. It could list Files, DataObject or Pages of a particular type or section in the site tree. In this case it is listing User Defined Form pages that are children of this page.</p>\n<p>$Listing</p>', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(324, 58, 12, 1, 4, 4, 'ListingPage', '2012-02-06 11:10:39', '2012-10-10 16:19:38', 'have-your-say', 'Have your say', NULL, '<p>This is an example of a listing page. It lists a number of items in a template that is defined in the "Listings" section of the CMS. The listing content is also configurable in the CMS. We could list Files, DataObjects or Pages of a particular type or section in the site tree. In this case it is listing User Defined Form pages that are children of this page.</p>\n<p>$Listing</p>', 'Have your say', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Saved (update)', NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(325, 12, 9, 1, 4, 4, 'NewsArticle', '2011-12-15 16:55:23', '2012-10-10 16:51:28', 'missing-the-full-article-content-here', 'Missing the full article content here', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(326, 12, 10, 1, 4, 4, 'NewsArticle', '2011-12-15 16:55:23', '2012-10-10 16:52:08', 'demoville-cake-factory-opening', 'Demoville cake factory opening', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(327, 12, 11, 1, 4, 4, 'NewsArticle', '2011-12-15 16:55:23', '2012-10-10 17:07:09', 'demoville-cake-factory-opening', 'Demoville cake factory opening', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(328, 11, 6, 1, 4, 4, 'NewsArticle', '2011-12-15 16:53:39', '2012-10-10 17:07:25', 'new-newsarticle', 'New NewsArticle', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(329, 11, 7, 1, 4, 4, 'NewsArticle', '2011-12-15 16:53:39', '2012-10-10 17:08:02', 'new-newsarticle', 'New NewsArticle', NULL, '<p>Phasellus lacinia quam ut orci lacinia eu laoreet massa placerat. Nulla in leo tristique orci sagittis mattis. Proin mollis erat velit. Nam dignissim, magna sit amet rutrum tincidunt, arcu nunc porta arcu, non commodo nibh justo a eros. Curabitur euismod rutrum mauris, nec laoreet enim ullamcorper eu</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 9, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(330, 68, 1, 0, 4, 0, 'ZenGalleryPage', '2012-10-10 17:43:45', '2012-10-10 17:43:45', 'new-zen-gallery-page', 'New Zen Gallery Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(331, 68, 2, 0, 4, 0, 'ZenGalleryPage', '2012-10-10 17:43:45', '2012-10-10 17:43:55', 'new-zen-gallery-page', 'New Zen Gallery Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 15, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(332, 68, 3, 0, 4, 0, 'ZenGalleryPage', '2012-10-10 17:43:45', '2012-10-10 17:43:55', 'new-zen-gallery-page', 'New Zen Gallery Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(333, 68, 4, 1, 4, 4, 'ZenGalleryPage', '2012-10-10 17:43:45', '2012-10-10 17:48:23', 'image-gallery', 'Image Gallery', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 5, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(334, 69, 1, 0, 4, 0, 'ZenGalleryPage', '2012-10-11 10:29:20', '2012-10-11 10:29:20', 'new-zen-gallery-page', 'New Zen Gallery Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(335, 69, 2, 1, 4, 4, 'ZenGalleryPage', '2012-10-11 10:29:20', '2012-10-11 10:29:41', 'sub-gallery', 'Sub Gallery', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(336, 69, 3, 1, 4, 4, 'ZenGalleryPage', '2012-10-11 10:29:20', '2012-10-11 10:38:07', 'sub-gallery', 'Sub Gallery', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(337, 70, 1, 0, 4, 0, 'ZenGalleryPage', '2012-10-11 10:44:03', '2012-10-11 10:44:03', 'new-zen-gallery-page', 'New Zen Gallery Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(338, 70, 2, 1, 4, 4, 'ZenGalleryPage', '2012-10-11 10:44:03', '2012-10-11 10:45:07', 'sub-gallery-2', 'Sub Gallery 2', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(339, 69, 4, 1, 4, 4, 'ZenGalleryPage', '2012-10-11 10:29:20', '2012-10-11 13:13:27', 'gallery-one', 'Gallery one', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(340, 70, 3, 1, 4, 4, 'ZenGalleryPage', '2012-10-11 10:44:03', '2012-10-11 13:13:54', 'gallery-two', 'Gallery Two', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(341, 27, 20, 1, 4, 4, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-10-11 14:33:18', 'list-your-business', 'List your business', NULL, '<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(342, 21, 18, 0, 4, 0, 'ListingPage', '2011-12-16 17:35:54', '2012-10-11 14:33:18', 'local-businesses', 'Local Businesses', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui  blanditiis praesentium voluptatum deleniti atque corrupti quos dolores  et quas molestias excepturi sint occaecati cupiditate non provident,  similique sunt in culpa qui officia deserunt mollitia animi, id est  laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita  distinctio. Nam libero tempore, cum soluta nobis est eligendi optio  cumque nihil impedit quo minus id quod maxime placeat facere possimus,  omnis voluptas assumenda est, omnis dolor repellendus.</p>\n<p>If you have a local business in Demoville, feel free to <a href="[sitetree_link" id="27]">list it</a> here. Note that you must be <a href="[sitetree_link" id="13]">registered</a> to do this.</p>\n<p>$Listing</p>', 'Local Businesses', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'LoggedInUsers', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(343, 27, 21, 1, 4, 4, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-10-11 14:39:40', 'list-your-business', 'List your business', NULL, '<p>This page is an ObjectCreatorPage type. It allows a CMS user to configure a form, like the one below that lets front end users submit and create pages or any other types of content for the website. When used in conjuction with the Workflow module, submissions can be moderated prior to being published.</p>\n<p><br/>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(344, 27, 22, 1, 4, 4, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-10-11 14:39:54', 'list-your-business', 'List your business', NULL, '<p>This page is an ObjectCreatorPage type. It allows a CMS user to configure a form, like the one below that lets front end users submit and create pages or any other types of content for the website. When used in conjuction with the Workflow module, submissions can be moderated prior to being published.</p>\n<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(345, 71, 1, 1, 4, 4, 'LocalBusinessPage', '2012-10-11 14:42:46', '2012-10-11 14:42:46', 'ss3', 'SS3', NULL, 'A new CMS', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 12, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(346, 72, 1, 1, 1, 1, 'LocalBusinessPage', '2012-10-11 15:29:03', '2012-10-11 15:29:03', 'testing-workflow-2', 'Testing workflow', NULL, 'asdf', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 13, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(347, 27, 23, 1, 4, 4, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-10-11 16:02:42', 'list-your-business', 'List your business', NULL, '<p>This page is an ObjectCreatorPage type. It allows a CMS user to configure a form, like the one below that lets front end users submit and create pages or any other types of content for the website. When used in conjuction with the Workflow module, submissions can be moderated prior to being published.</p>\n<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(348, 73, 1, 1, 4, 4, 'LocalBusinessPage', '2012-10-11 16:03:27', '2012-10-11 16:03:27', 'workflow-integrated', 'Workflow integrated', NULL, 'adf adsf adfs adsf sfd', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 14, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 21, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(349, 27, 24, 1, 4, 4, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-10-11 16:03:51', 'list-your-business', 'List your business', NULL, '<p>This page is an ObjectCreatorPage type. It allows a CMS user to configure a form, like the one below that lets front end users submit and create pages or any other types of content for the website. When used in conjuction with the Workflow module, submissions can be moderated prior to being published.</p>\n<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(350, 74, 1, 0, 4, 0, 'LocalBusinessPage', '2012-10-11 16:06:44', '2012-10-11 16:06:44', 'one', 'One', NULL, 'asdf', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 15, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 21, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(351, 75, 1, 0, 4, 0, 'LocalBusinessPage', '2012-10-11 16:07:02', '2012-10-11 16:07:02', 'two', 'Two', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 16, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 21, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(352, 27, 25, 1, 4, 4, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-10-11 16:17:43', 'list-your-business', 'List your business', NULL, '<p>This page is an ObjectCreatorPage type. It allows a CMS user to configure a form, like the one below that lets front end users submit and create pages or any other types of content for the website. When used in conjuction with the Workflow module, submissions can be moderated prior to being published.</p>\n<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(353, 76, 1, 0, 4, 0, 'LocalBusinessPage', '2012-10-11 16:18:06', '2012-10-11 16:18:06', 'three', 'Three', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 17, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 21, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(354, 77, 1, 0, 4, 0, 'LocalBusinessPage', '2012-10-11 16:37:55', '2012-10-11 16:37:55', 'four', 'Four', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 18, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 21, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(355, 78, 1, 0, 4, 0, 'LocalBusinessPage', '2012-10-11 16:39:02', '2012-10-11 16:39:02', 'five', 'Five', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 19, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 21, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(356, 27, 26, 0, 4, 0, 'ObjectCreatorPage', '2011-12-20 16:44:52', '2012-10-11 16:46:48', 'list-your-business', 'List your business', NULL, '<p>This page is an ObjectCreatorPage type. It allows a CMS user to configure a form, like the one below that lets front end users submit and create pages or any other types of content for the website. When used in conjuction with the Workflow module, submissions can be moderated prior to being published.</p>\n<p>Complete the form below to have your local business listed here in the Demoville Council local business directory</p>', 'List your local business', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'LoggedInUsers', 'Inherit', NULL, 25, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(357, 79, 1, 1, 4, 4, 'LocalBusinessPage', '2012-10-11 16:47:18', '2012-10-11 16:47:18', 'six', 'Six', NULL, 'adfasdfasdf', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 20, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 21, 1, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(358, 66, 7, 1, 4, 4, 'CalendarEvent', '2012-10-10 12:28:27', '2012-10-11 16:58:47', 'demo-event', 'Demo Event', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinction.</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 65, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(359, 67, 11, 1, 4, 4, 'UserDefinedForm', '2012-10-10 14:54:44', '2012-10-12 11:19:18', 'cyclists-have-your-say', 'Cyclists - Have your say', NULL, '<p>This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a user friendly interface in the CMS.</p>\n<p>$UserDefinedForm</p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 58, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(360, 69, 5, 1, 4, 4, 'ZenGalleryPage', '2012-10-11 10:29:20', '2012-10-12 11:30:51', 'gallery-one', 'Gallery one', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(361, 70, 4, 1, 4, 4, 'ZenGalleryPage', '2012-10-11 10:44:03', '2012-10-12 11:31:09', 'gallery-two', 'Gallery Two', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 68, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(362, 67, 12, 1, 4, 4, 'UserDefinedForm', '2012-10-10 14:54:44', '2012-10-12 11:34:01', 'cyclists-have-your-say', 'Cyclists - Have your say', NULL, '<p>This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a user friendly interface in the CMS.</p>\n<p>$UserDefinedForm</p>', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, NULL, NULL, 'Inherit', 'Inherit', NULL, 58, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(363, 53, 6, 0, 4, 0, 'Page', '2011-12-22 12:55:55', '2012-10-12 11:34:34', 'cycle-tracks', 'Cycle Tracks', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p><a href="assets/PBNintegration.jpg" target="_blank"><img class="left" src="assets/_resampled/resizedimage302173-PBNintegration.jpg" width="302" height="173" alt="title=/" title=""/></a></p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Cycle Tracks', NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(364, 53, 7, 1, 4, 4, 'Page', '2011-12-22 12:55:55', '2012-10-12 11:34:34', 'cycle-tracks', 'Cycle Tracks', NULL, '<p>Fusce eget nisl quam. Praesent tortor urna, feugiat consequat  sollicitudin eget, adipiscing ut massa. Cum sociis natoque penatibus et  magnis dis parturient montes, nascetur ridiculus mus. In vehicula, diam  vitae euismod vulputate, purus massa dictum mi, id euismod urna enim a  dui. Duis ut sem sapien. Mauris mi arcu, iaculis nec aliquet vitae,  lobortis vel ipsum. Pellentesque euismod dignissim iaculis. Donec  rutrum, nibh in bibendum feugiat, urna massa interdum quam, et dignissim  sapien velit eu orci. Vestibulum porta risus eget nibh ullamcorper  commodo. In lorem dolor, aliquet vel sodales euismod, hendrerit id  dolor. Pellentesque ut lacus tincidunt ipsum fermentum aliquam. In hac  habitasse platea dictumst. Sed egestas lectus a dui ullamcorper sit amet  auctor dolor ornare.</p>\n<p><a href="assets/PBNintegration.jpg" target="_blank"><img class="left" src="assets/_resampled/resizedimage302173-PBNintegration.jpg" width="302" height="173" alt="title=/" title=""/></a></p>\n<p>Aliquam laoreet porttitor magna, eget porttitor libero ultricies nec.  Sed ornare, felis vitae commodo feugiat, elit dui elementum tellus, non  venenatis leo lorem vitae ipsum. Sed egestas orci a magna tristique  rhoncus. Proin sollicitudin, tellus sit amet consequat imperdiet, enim  lectus posuere libero, et viverra magna lectus ac est. Sed porttitor  urna ac odio laoreet non fringilla velit porttitor. Vestibulum neque  lectus, ultrices ut varius ornare, vehicula at risus. Duis egestas magna  non neque blandit vel facilisis tortor volutpat.</p>', 'Cycle Tracks', NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(365, 54, 6, 0, 4, 0, 'Page', '2011-12-22 12:56:25', '2012-10-12 11:34:45', 'central-city-map', 'Central City Map', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui  blanditiis praesentium voluptatum deleniti atque corrupti quos dolores  et quas molestias excepturi sint occaecati cupiditate non provident,  similique sunt in culpa qui officia deserunt mollitia animi, id est  laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita  distinctio. Nam libero tempore, cum soluta nobis est eligendi optio  cumque nihil impedit quo minus id quod maxime placeat facere possimus,  omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem  quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet  ut et voluptates repudiandae sint et molestiae non recusandae. Itaque  earum rerum hic tenetur a sapiente delectus, ut aut reiciendis  voluptatibus maiores alias consequatur aut perferendis doloribus  asperiores repellat.</p>\n<p><a href="http://maps.google.com/maps?q=melbourne&amp;hl=en&amp;sll=37.0625,-95.677068&amp;sspn=50.111473,130.429688&amp;hnear=Melbourne+Victoria,+Australia&amp;t=m&amp;z=14" target="_blank"><img src="http://maps.google.com/staticmap?center=-37.81319,144.96298&amp;zoom=15&amp;size=726x420&amp;maptype=mobile&amp;markers=-37.81319,144.96298,red&amp;key=ABQIAAAAqQJ-gFBKUbBLaFN1HQF4KBQ_k2Fxd8XZtbWUsvz5Vrarxzf2SRSh7DRXLQmAZ-6XwtrmMhkINGT27A&amp;sensor=false/"/></a></p>', 'Central City Map', NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(366, 54, 7, 1, 4, 4, 'Page', '2011-12-22 12:56:25', '2012-10-12 11:34:45', 'central-city-map', 'Central City Map', NULL, '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui  blanditiis praesentium voluptatum deleniti atque corrupti quos dolores  et quas molestias excepturi sint occaecati cupiditate non provident,  similique sunt in culpa qui officia deserunt mollitia animi, id est  laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita  distinctio. Nam libero tempore, cum soluta nobis est eligendi optio  cumque nihil impedit quo minus id quod maxime placeat facere possimus,  omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem  quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet  ut et voluptates repudiandae sint et molestiae non recusandae. Itaque  earum rerum hic tenetur a sapiente delectus, ut aut reiciendis  voluptatibus maiores alias consequatur aut perferendis doloribus  asperiores repellat.</p>\n<p><a href="http://maps.google.com/maps?q=melbourne&amp;hl=en&amp;sll=37.0625,-95.677068&amp;sspn=50.111473,130.429688&amp;hnear=Melbourne+Victoria,+Australia&amp;t=m&amp;z=14" target="_blank"><img src="http://maps.google.com/staticmap?center=-37.81319,144.96298&amp;zoom=15&amp;size=726x420&amp;maptype=mobile&amp;markers=-37.81319,144.96298,red&amp;key=ABQIAAAAqQJ-gFBKUbBLaFN1HQF4KBQ_k2Fxd8XZtbWUsvz5Vrarxzf2SRSh7DRXLQmAZ-6XwtrmMhkINGT27A&amp;sensor=false/"/></a></p>', 'Central City Map', NULL, NULL, NULL, 0, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 17, 0, 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `SiteTree_versions` VALUES(367, 8, 3, 1, 4, 4, 'NewsHolder', '2011-12-15 16:24:46', '2012-10-12 11:36:26', '2011', '2011', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 7, 0, 0, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ViewerGroups`
--

CREATE TABLE `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `SiteTree_ViewerGroups`
--

INSERT INTO `SiteTree_ViewerGroups` VALUES(1, 15, 1);
INSERT INTO `SiteTree_ViewerGroups` VALUES(2, 15, 3);
INSERT INTO `SiteTree_ViewerGroups` VALUES(3, 15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `SolrSearchPage`
--

CREATE TABLE `SolrSearchPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ResultsPerPage` int(11) NOT NULL DEFAULT '0',
  `SearchType` varchar(64) DEFAULT NULL,
  `SortBy` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `SortDir` enum('Ascending','Descending') CHARACTER SET utf8 DEFAULT 'Ascending',
  `QueryType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `StartWithListing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SearchOnFieldsValue` mediumtext CHARACTER SET utf8,
  `BoostFieldsValue` mediumtext CHARACTER SET utf8,
  `FacetFieldsValue` mediumtext CHARACTER SET utf8,
  `MinFacetCount` int(11) NOT NULL DEFAULT '0',
  `ListingTemplateID` int(11) NOT NULL DEFAULT '0',
  `SearchTypeValue` mediumtext CHARACTER SET utf8,
  `FacetMappingValue` mediumtext CHARACTER SET utf8,
  `FacetQueriesValue` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `SolrSearchPage`
--

INSERT INTO `SolrSearchPage` VALUES(14, 5, NULL, 'Created', 'Ascending', 'default', 0, 'a:2:{i:0;s:7:Content;i:1;s:5:Title;}', NULL, NULL, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SolrSearchPage_Live`
--

CREATE TABLE `SolrSearchPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ResultsPerPage` int(11) NOT NULL DEFAULT '0',
  `SearchType` varchar(64) DEFAULT NULL,
  `SortBy` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `SortDir` enum('Ascending','Descending') CHARACTER SET utf8 DEFAULT 'Ascending',
  `QueryType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `StartWithListing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SearchOnFieldsValue` mediumtext CHARACTER SET utf8,
  `BoostFieldsValue` mediumtext CHARACTER SET utf8,
  `FacetFieldsValue` mediumtext CHARACTER SET utf8,
  `MinFacetCount` int(11) NOT NULL DEFAULT '0',
  `ListingTemplateID` int(11) NOT NULL DEFAULT '0',
  `SearchTypeValue` mediumtext CHARACTER SET utf8,
  `FacetMappingValue` mediumtext CHARACTER SET utf8,
  `FacetQueriesValue` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `SolrSearchPage_Live`
--

INSERT INTO `SolrSearchPage_Live` VALUES(14, 5, NULL, 'Created', 'Ascending', 'default', 0, 'a:2:{i:0;s:7:Content;i:1;s:5:Title;}', NULL, NULL, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SolrSearchPage_SearchTrees`
--

CREATE TABLE `SolrSearchPage_SearchTrees` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SolrSearchPageID` int(11) NOT NULL DEFAULT '0',
  `PageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SolrSearchPageID` (`SolrSearchPageID`),
  KEY `PageID` (`PageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SolrSearchPage_SearchTrees`
--


-- --------------------------------------------------------

--
-- Table structure for table `SolrSearchPage_versions`
--

CREATE TABLE `SolrSearchPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ResultsPerPage` int(11) NOT NULL DEFAULT '0',
  `SearchType` varchar(64) DEFAULT NULL,
  `SortBy` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `SortDir` enum('Ascending','Descending') CHARACTER SET utf8 DEFAULT 'Ascending',
  `QueryType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `StartWithListing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SearchOnFieldsValue` mediumtext CHARACTER SET utf8,
  `BoostFieldsValue` mediumtext CHARACTER SET utf8,
  `FacetFieldsValue` mediumtext CHARACTER SET utf8,
  `MinFacetCount` int(11) NOT NULL DEFAULT '0',
  `ListingTemplateID` int(11) NOT NULL DEFAULT '0',
  `SearchTypeValue` mediumtext CHARACTER SET utf8,
  `FacetMappingValue` mediumtext CHARACTER SET utf8,
  `FacetQueriesValue` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `SolrSearchPage_versions`
--

INSERT INTO `SolrSearchPage_versions` VALUES(5, 48, 1, 0, NULL, NULL, 'Ascending', NULL, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL);
INSERT INTO `SolrSearchPage_versions` VALUES(6, 48, 2, 10, NULL, 'Created', 'Ascending', 'default', 0, 'a:2:{i:0;s:7:Content;i:1;s:5:Title;}', NULL, 'a:1:{i:0;s:5:Title;}', 0, 0, NULL, NULL, NULL);
INSERT INTO `SolrSearchPage_versions` VALUES(7, 14, 4, 5, 'Page', 'Created', 'Ascending', 'default', 0, 'a:2:{i:0;s:7:Content;i:1;s:5:Title;}', NULL, NULL, 0, 0, NULL, NULL, NULL);
INSERT INTO `SolrSearchPage_versions` VALUES(8, 14, 5, 5, NULL, 'Created', 'Ascending', 'default', 0, 'a:2:{i:0;s:7:Content;i:1;s:5:Title;}', NULL, NULL, 0, 0, NULL, NULL, NULL);
INSERT INTO `SolrSearchPage_versions` VALUES(9, 14, 6, 5, NULL, 'Created', 'Ascending', 'default', 0, 'a:2:{i:0;s:7:Content;i:1;s:5:Title;}', NULL, NULL, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SolrServerConfig`
--

CREATE TABLE `SolrServerConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SolrServerConfig') CHARACTER SET utf8 DEFAULT 'SolrServerConfig',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `RunLocal` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `InstanceID` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `LogPath` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `SolrServerConfig`
--

INSERT INTO `SolrServerConfig` VALUES(1, 'SolrServerConfig', '2011-12-15 05:00:18', '2011-12-21 15:52:42', 1, '31a8f1ad88b7b060e8bd12f9c0041c86', '/solr/solr/logs');

-- --------------------------------------------------------

--
-- Table structure for table `SolrTypeConfiguration`
--

CREATE TABLE `SolrTypeConfiguration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SolrTypeConfiguration') CHARACTER SET utf8 DEFAULT 'SolrTypeConfiguration',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `FieldMappingsValue` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SolrTypeConfiguration`
--


-- --------------------------------------------------------

--
-- Table structure for table `SubmittedFileField`
--

CREATE TABLE `SubmittedFileField` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UploadedFileID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `UploadedFileID` (`UploadedFileID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SubmittedFileField`
--


-- --------------------------------------------------------

--
-- Table structure for table `SubmittedForm`
--

CREATE TABLE `SubmittedForm` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SubmittedForm') CHARACTER SET utf8 DEFAULT 'SubmittedForm',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `SubmittedByID` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SubmittedByID` (`SubmittedByID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `SubmittedForm`
--

INSERT INTO `SubmittedForm` VALUES(1, 'SubmittedForm', '2012-02-06 13:09:57', '2012-02-06 13:09:57', 1, 59);
INSERT INTO `SubmittedForm` VALUES(2, 'SubmittedForm', '2012-10-10 15:24:32', '2012-10-10 15:24:32', 4, 67);

-- --------------------------------------------------------

--
-- Table structure for table `SubmittedFormField`
--

CREATE TABLE `SubmittedFormField` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SubmittedFormField','SubmittedFileField') CHARACTER SET utf8 DEFAULT 'SubmittedFormField',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Value` mediumtext CHARACTER SET utf8,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `SubmittedFormField`
--

INSERT INTO `SubmittedFormField` VALUES(1, 'SubmittedFormField', '2012-02-06 13:09:57', '2012-02-06 13:09:57', 'EditableTextField1', 'Shea', 'Name', 1);
INSERT INTO `SubmittedFormField` VALUES(2, 'SubmittedFormField', '2012-02-06 13:09:57', '2012-02-06 13:09:57', 'EditableEmailField3', 'shea@livesource.co.nz', 'Email', 1);
INSERT INTO `SubmittedFormField` VALUES(3, 'SubmittedFormField', '2012-02-06 13:09:57', '2012-02-06 13:09:57', 'EditableDropdown6', 'Once a week', 'How often do you bike', 1);
INSERT INTO `SubmittedFormField` VALUES(4, 'SubmittedFormField', '2012-02-06 13:09:57', '2012-02-06 13:09:57', 'EditableCheckboxGroupField8', 'Commuting, Leisure', 'Why do you ride', 1);
INSERT INTO `SubmittedFormField` VALUES(5, 'SubmittedFormField', '2012-02-06 13:09:57', '2012-02-06 13:09:57', 'EditableRadioField9', 'Not sufficient', 'How do you feel about Demoville''s cycle lanes and paths', 1);
INSERT INTO `SubmittedFormField` VALUES(6, 'SubmittedFormField', '2012-02-06 13:09:57', '2012-02-06 13:09:57', 'EditableTextField10', 'Test', 'Comments', 1);
INSERT INTO `SubmittedFormField` VALUES(7, 'SubmittedFormField', '2012-10-10 15:24:32', '2012-10-10 15:24:32', 'EditableTextField11', 'Shea', 'Name', 2);
INSERT INTO `SubmittedFormField` VALUES(8, 'SubmittedFormField', '2012-10-10 15:24:32', '2012-10-10 15:24:32', 'EditableEmailField12', 'shea@symbiote.com.au', 'Email', 2);
INSERT INTO `SubmittedFormField` VALUES(9, 'SubmittedFormField', '2012-10-10 15:24:32', '2012-10-10 15:24:32', 'EditableDropdown13', 'Every day', 'How often do you bike?', 2);
INSERT INTO `SubmittedFormField` VALUES(10, 'SubmittedFormField', '2012-10-10 15:24:32', '2012-10-10 15:24:32', 'EditableCheckboxGroupField14', 'Commuting, Leisure, Training', 'Why do you ride?', 2);
INSERT INTO `SubmittedFormField` VALUES(11, 'SubmittedFormField', '2012-10-10 15:24:32', '2012-10-10 15:24:32', 'EditableRadioField15', 'Very good', 'How do you feel about Demoville''s cycle lanes and paths', 2);
INSERT INTO `SubmittedFormField` VALUES(12, 'SubmittedFormField', '2012-10-10 15:24:32', '2012-10-10 15:24:32', 'EditableTextField17', 'Love riding in Demoville', 'Comments', 2);

-- --------------------------------------------------------

--
-- Table structure for table `SubscriptionPage`
--

CREATE TABLE `SubscriptionPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fields` mediumtext CHARACTER SET utf8,
  `Required` mediumtext CHARACTER SET utf8,
  `CustomisedLables` mediumtext CHARACTER SET utf8,
  `CustomisedErrors` mediumtext CHARACTER SET utf8,
  `NewsletterTypes` mediumtext CHARACTER SET utf8,
  `SubmissionButtonText` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `SendNotification` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NotificationEmailSubject` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `NotificationEmailFrom` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `SubscriptionPage`
--

INSERT INTO `SubscriptionPage` VALUES(57, 'Email', '{Email:1}', '[]', '[]', '1', 'Submit', 0, NULL, NULL, '<p>Thank you, you are now subscribed to our Newsletter</p>');

-- --------------------------------------------------------

--
-- Table structure for table `SubscriptionPage_Live`
--

CREATE TABLE `SubscriptionPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fields` mediumtext CHARACTER SET utf8,
  `Required` mediumtext CHARACTER SET utf8,
  `CustomisedLables` mediumtext CHARACTER SET utf8,
  `CustomisedErrors` mediumtext CHARACTER SET utf8,
  `NewsletterTypes` mediumtext CHARACTER SET utf8,
  `SubmissionButtonText` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `SendNotification` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NotificationEmailSubject` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `NotificationEmailFrom` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `SubscriptionPage_Live`
--

INSERT INTO `SubscriptionPage_Live` VALUES(57, 'Email', '{Email:1}', '[]', '[]', '1', 'Submit', 0, NULL, NULL, '<p>Thank you, you are now subscribed to our Newsletter</p>');

-- --------------------------------------------------------

--
-- Table structure for table `SubscriptionPage_versions`
--

CREATE TABLE `SubscriptionPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Fields` mediumtext CHARACTER SET utf8,
  `Required` mediumtext CHARACTER SET utf8,
  `CustomisedLables` mediumtext CHARACTER SET utf8,
  `CustomisedErrors` mediumtext CHARACTER SET utf8,
  `NewsletterTypes` mediumtext CHARACTER SET utf8,
  `SubmissionButtonText` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `SendNotification` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NotificationEmailSubject` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `NotificationEmailFrom` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `SubscriptionPage_versions`
--

INSERT INTO `SubscriptionPage_versions` VALUES(1, 57, 1, 'Email', NULL, NULL, NULL, NULL, 'Submit', 0, NULL, NULL, NULL);
INSERT INTO `SubscriptionPage_versions` VALUES(2, 57, 2, 'Email', '{Email:1}', '[]', '[]', '1', 'Submit', 0, NULL, NULL, '<p>Thank you, you are now subscribed to our Newsletter</p>');
INSERT INTO `SubscriptionPage_versions` VALUES(3, 57, 3, 'Email', '{Email:1}', '[]', '[]', '1', 'Submit', 0, NULL, NULL, '<p>Thank you, you are now subscribed to our Newsletter</p>');
INSERT INTO `SubscriptionPage_versions` VALUES(4, 57, 4, 'Email', '{Email:1}', '[]', '[]', '1', 'Submit', 0, NULL, NULL, '<p>Thank you, you are now subscribed to our Newsletter</p>');
INSERT INTO `SubscriptionPage_versions` VALUES(5, 57, 5, 'Email', '{Email:1}', '[]', '[]', '1', 'Submit', 0, NULL, NULL, '<p>Thank you, you are now subscribed to our Newsletter</p>');
INSERT INTO `SubscriptionPage_versions` VALUES(6, 57, 6, 'Email', '{Email:1}', '[]', '[]', '1', 'Submit', 0, NULL, NULL, '<p>Thank you, you are now subscribed to our Newsletter</p>');
INSERT INTO `SubscriptionPage_versions` VALUES(7, 57, 7, 'Email', '{Email:1}', '[]', '[]', '1', 'Submit', 0, NULL, NULL, '<p>Thank you, you are now subscribed to our Newsletter</p>');
INSERT INTO `SubscriptionPage_versions` VALUES(8, 57, 8, 'Email', '{Email:1}', '[]', '[]', '1', 'Submit', 0, NULL, NULL, '<p>Thank you, you are now subscribed to our Newsletter</p>');

-- --------------------------------------------------------

--
-- Table structure for table `SurveyPage`
--

CREATE TABLE `SurveyPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `Summary` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `SurveyPage`
--

INSERT INTO `SurveyPage` VALUES(67, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SurveyPage_Live`
--

CREATE TABLE `SurveyPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `Summary` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SurveyPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `SurveyPage_versions`
--

CREATE TABLE `SurveyPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `Summary` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `ImageID` (`ImageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `SurveyPage_versions`
--

INSERT INTO `SurveyPage_versions` VALUES(24, 67, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UnsubscribeRecord`
--

CREATE TABLE `UnsubscribeRecord` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('UnsubscribeRecord') CHARACTER SET utf8 DEFAULT 'UnsubscribeRecord',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `NewsletterTypeID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `NewsletterTypeID` (`NewsletterTypeID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `UnsubscribeRecord`
--


-- --------------------------------------------------------

--
-- Table structure for table `UserDefinedForm`
--

CREATE TABLE `UserDefinedForm` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SubmitButtonText` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8,
  `ShowClearButton` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DisableSaveSubmissions` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Summary` mediumtext CHARACTER SET utf8,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `UserDefinedForm`
--

INSERT INTO `UserDefinedForm` VALUES(67, NULL, '<p>Thanks, we''ve received your submission.</p>', 0, 0, 0, 'This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a user friendly interface in the CMS.', 16);

-- --------------------------------------------------------

--
-- Table structure for table `UserDefinedForm_EmailRecipient`
--

CREATE TABLE `UserDefinedForm_EmailRecipient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('UserDefinedForm_EmailRecipient') CHARACTER SET utf8 DEFAULT 'UserDefinedForm_EmailRecipient',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `EmailAddress` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `EmailSubject` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `EmailFrom` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `EmailBody` mediumtext CHARACTER SET utf8,
  `SendPlain` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HideFormData` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `FormID` int(11) NOT NULL DEFAULT '0',
  `SendEmailFromFieldID` int(11) NOT NULL DEFAULT '0',
  `SendEmailToFieldID` int(11) NOT NULL DEFAULT '0',
  `EmailReplyTo` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FormID` (`FormID`),
  KEY `SendEmailFromFieldID` (`SendEmailFromFieldID`),
  KEY `SendEmailToFieldID` (`SendEmailToFieldID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `UserDefinedForm_EmailRecipient`
--


-- --------------------------------------------------------

--
-- Table structure for table `UserDefinedForm_Live`
--

CREATE TABLE `UserDefinedForm_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SubmitButtonText` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8,
  `ShowClearButton` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DisableSaveSubmissions` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Summary` mediumtext CHARACTER SET utf8,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `UserDefinedForm_Live`
--

INSERT INTO `UserDefinedForm_Live` VALUES(67, NULL, '<p>Thanks, we''ve received your submission.</p>', 0, 0, 0, 'This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a user friendly interface in the CMS.', 16);

-- --------------------------------------------------------

--
-- Table structure for table `UserDefinedForm_versions`
--

CREATE TABLE `UserDefinedForm_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `SubmitButtonText` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8,
  `ShowClearButton` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DisableSaveSubmissions` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Summary` mediumtext CHARACTER SET utf8,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `ImageID` (`ImageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `UserDefinedForm_versions`
--

INSERT INTO `UserDefinedForm_versions` VALUES(24, 67, 1, NULL, '<p>Thanks, we''ve received your submission.</p>', 0, 0, NULL, 0);
INSERT INTO `UserDefinedForm_versions` VALUES(25, 67, 4, NULL, '<p>Thanks, we''ve received your submission.</p>', 0, 0, NULL, 0);
INSERT INTO `UserDefinedForm_versions` VALUES(26, 67, 5, NULL, '<p>Thanks, we''ve received your submission.</p>', 0, 0, NULL, 0);
INSERT INTO `UserDefinedForm_versions` VALUES(27, 67, 6, NULL, '<p>Thanks, we''ve received your submission.</p>', 0, 0, NULL, 0);
INSERT INTO `UserDefinedForm_versions` VALUES(28, 67, 7, NULL, '<p>Thanks, we''ve received your submission.</p>', 0, 0, NULL, 0);
INSERT INTO `UserDefinedForm_versions` VALUES(29, 67, 8, NULL, '<p>Thanks, we''ve received your submission.</p>', 0, 0, NULL, 0);
INSERT INTO `UserDefinedForm_versions` VALUES(30, 67, 9, NULL, '<p>Thanks, we''ve received your submission.</p>', 0, 0, NULL, 0);
INSERT INTO `UserDefinedForm_versions` VALUES(31, 67, 10, NULL, '<p>Thanks, we''ve received your submission.</p>', 0, 0, 'This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a user friendly interface in the CMS.', 0);
INSERT INTO `UserDefinedForm_versions` VALUES(32, 67, 11, NULL, '<p>Thanks, we''ve received your submission.</p>', 0, 0, 'This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a user friendly interface in the CMS.', 16);
INSERT INTO `UserDefinedForm_versions` VALUES(33, 67, 12, NULL, '<p>Thanks, we''ve received your submission.</p>', 0, 0, 'This is an example of a User Defined Form Page. The form, it''s fields and submissions can be configured and managed through a user friendly interface in the CMS.', 16);

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage`
--

CREATE TABLE `VirtualPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `VirtualPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_Live`
--

CREATE TABLE `VirtualPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `VirtualPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_versions`
--

CREATE TABLE `VirtualPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `VirtualPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `Widget`
--

CREATE TABLE `Widget` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Widget') CHARACTER SET utf8 DEFAULT 'Widget',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `Enabled` tinyint(1) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Widget`
--


-- --------------------------------------------------------

--
-- Table structure for table `WidgetArea`
--

CREATE TABLE `WidgetArea` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('WidgetArea') CHARACTER SET utf8 DEFAULT 'WidgetArea',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `WidgetArea`
--


-- --------------------------------------------------------

--
-- Table structure for table `WorkflowAction`
--

CREATE TABLE `WorkflowAction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PublishItemWorkflowAction','NotifyUsersWorkflowAction','CancelWorkflowAction','WorkflowAction','AssignUsersToWorkflowAction','SimpleApprovalWorkflowAction') CHARACTER SET utf8 DEFAULT 'PublishItemWorkflowAction',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Comment` mediumtext CHARACTER SET utf8,
  `Type` enum('Dynamic','Manual') CHARACTER SET utf8 DEFAULT 'Manual',
  `Executed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowEditing` enum('By Assignees','Content Settings','No') CHARACTER SET utf8 DEFAULT 'No',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `WorkflowDefID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  `AllowCommenting` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `WorkflowDefID` (`WorkflowDefID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `WorkflowAction`
--

INSERT INTO `WorkflowAction` VALUES(1, 'PublishItemWorkflowAction', '2011-12-15 15:25:34', '2011-12-15 15:36:06', 'Publish', NULL, 'Manual', 0, 'No', 2, 1, 0, 0);
INSERT INTO `WorkflowAction` VALUES(2, 'NotifyUsersWorkflowAction', '2011-12-15 15:26:27', '2012-10-11 17:36:36', 'Apply for approval', NULL, 'Manual', 0, 'By Assignees', 1, 1, 0, 0);
INSERT INTO `WorkflowAction` VALUES(4, 'CancelWorkflowAction', '2011-12-15 15:38:39', '2011-12-15 15:38:50', 'Reject', NULL, 'Manual', 0, 'No', 3, 1, 0, 0);
INSERT INTO `WorkflowAction` VALUES(5, 'NotifyUsersWorkflowAction', '2011-12-15 16:11:52', '2011-12-21 12:37:53', 'Approval Rejected', NULL, 'Manual', 0, 'By Assignees', 4, 1, 0, 0);
INSERT INTO `WorkflowAction` VALUES(6, 'NotifyUsersWorkflowAction', '2011-12-15 16:14:10', '2011-12-21 12:38:44', 'Approval Accepted', NULL, 'Manual', 0, 'By Assignees', 5, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowActionInstance`
--

CREATE TABLE `WorkflowActionInstance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('WorkflowActionInstance') CHARACTER SET utf8 DEFAULT 'WorkflowActionInstance',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Comment` mediumtext CHARACTER SET utf8,
  `Finished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `BaseActionID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `WorkflowID` (`WorkflowID`),
  KEY `BaseActionID` (`BaseActionID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `WorkflowActionInstance`
--

INSERT INTO `WorkflowActionInstance` VALUES(1, 'WorkflowActionInstance', '2011-12-15 15:44:14', '2011-12-15 15:54:29', 'Approved!', 1, 1, 2, 1);
INSERT INTO `WorkflowActionInstance` VALUES(2, 'WorkflowActionInstance', '2011-12-15 15:54:29', '2011-12-15 15:54:29', NULL, 1, 1, 1, 2);
INSERT INTO `WorkflowActionInstance` VALUES(3, 'WorkflowActionInstance', '2011-12-15 15:56:14', '2011-12-15 16:03:19', 'Sweet as', 1, 2, 2, 2);
INSERT INTO `WorkflowActionInstance` VALUES(4, 'WorkflowActionInstance', '2011-12-15 16:03:19', '2011-12-15 16:03:19', NULL, 1, 2, 1, 1);
INSERT INTO `WorkflowActionInstance` VALUES(5, 'WorkflowActionInstance', '2011-12-15 16:06:16', '2011-12-15 16:06:17', NULL, 1, 3, 2, 2);
INSERT INTO `WorkflowActionInstance` VALUES(6, 'WorkflowActionInstance', '2011-12-19 09:57:21', '2011-12-21 10:02:34', NULL, 1, 4, 2, 1);
INSERT INTO `WorkflowActionInstance` VALUES(7, 'WorkflowActionInstance', '2011-12-19 17:38:05', '2011-12-21 10:02:25', NULL, 1, 5, 2, 1);
INSERT INTO `WorkflowActionInstance` VALUES(8, 'WorkflowActionInstance', '2011-12-19 17:38:11', '2011-12-21 10:02:13', NULL, 1, 6, 2, 1);
INSERT INTO `WorkflowActionInstance` VALUES(9, 'WorkflowActionInstance', '2011-12-21 10:02:13', '2011-12-21 10:02:13', NULL, 1, 6, 1, 1);
INSERT INTO `WorkflowActionInstance` VALUES(10, 'WorkflowActionInstance', '2011-12-21 10:02:13', '2011-12-21 10:02:13', NULL, 1, 6, 6, 1);
INSERT INTO `WorkflowActionInstance` VALUES(11, 'WorkflowActionInstance', '2011-12-21 10:02:25', '2011-12-21 10:02:26', NULL, 1, 5, 1, 1);
INSERT INTO `WorkflowActionInstance` VALUES(12, 'WorkflowActionInstance', '2011-12-21 10:02:26', '2011-12-21 10:02:26', NULL, 1, 5, 6, 1);
INSERT INTO `WorkflowActionInstance` VALUES(13, 'WorkflowActionInstance', '2011-12-21 10:02:34', '2011-12-21 10:02:35', NULL, 1, 4, 1, 1);
INSERT INTO `WorkflowActionInstance` VALUES(14, 'WorkflowActionInstance', '2011-12-21 10:02:35', '2011-12-21 10:02:35', NULL, 1, 4, 6, 1);
INSERT INTO `WorkflowActionInstance` VALUES(15, 'WorkflowActionInstance', '2011-12-21 10:09:04', '2011-12-21 10:09:04', NULL, 1, 7, 2, 2);
INSERT INTO `WorkflowActionInstance` VALUES(16, 'WorkflowActionInstance', '2011-12-21 10:31:53', '2011-12-21 10:32:55', 'awesome business, happy to list it', 1, 8, 2, 2);
INSERT INTO `WorkflowActionInstance` VALUES(17, 'WorkflowActionInstance', '2011-12-21 10:32:55', '2011-12-21 10:32:55', NULL, 0, 8, 1, 0);
INSERT INTO `WorkflowActionInstance` VALUES(18, 'WorkflowActionInstance', '2011-12-21 10:54:59', '2011-12-21 10:54:59', NULL, 1, 9, 2, 2);
INSERT INTO `WorkflowActionInstance` VALUES(19, 'WorkflowActionInstance', '2011-12-21 11:30:39', '2011-12-21 11:30:39', NULL, 1, 10, 2, 2);
INSERT INTO `WorkflowActionInstance` VALUES(20, 'WorkflowActionInstance', '2011-12-21 12:20:06', '2011-12-21 12:20:06', NULL, 1, 11, 2, 2);
INSERT INTO `WorkflowActionInstance` VALUES(21, 'WorkflowActionInstance', '2011-12-21 12:29:33', '2011-12-21 12:29:33', NULL, 0, 12, 2, 0);
INSERT INTO `WorkflowActionInstance` VALUES(22, 'WorkflowActionInstance', '2011-12-21 12:30:26', '2011-12-21 12:30:26', NULL, 1, 13, 2, 2);
INSERT INTO `WorkflowActionInstance` VALUES(23, 'WorkflowActionInstance', '2011-12-21 12:41:06', '2011-12-21 12:52:56', NULL, 1, 14, 2, 2);
INSERT INTO `WorkflowActionInstance` VALUES(24, 'WorkflowActionInstance', '2011-12-21 12:52:56', '2011-12-21 12:52:56', NULL, 1, 14, 1, 1);
INSERT INTO `WorkflowActionInstance` VALUES(25, 'WorkflowActionInstance', '2011-12-21 12:52:56', '2011-12-21 12:52:56', NULL, 1, 14, 6, 1);
INSERT INTO `WorkflowActionInstance` VALUES(26, 'WorkflowActionInstance', '2012-01-17 13:38:02', '2012-01-17 13:39:07', 'sweet as aye', 1, 15, 2, 2);
INSERT INTO `WorkflowActionInstance` VALUES(27, 'WorkflowActionInstance', '2012-01-17 13:39:07', '2012-01-17 13:39:07', NULL, 1, 15, 1, 1);
INSERT INTO `WorkflowActionInstance` VALUES(28, 'WorkflowActionInstance', '2012-01-17 13:39:07', '2012-01-17 13:39:07', NULL, 1, 15, 6, 1);
INSERT INTO `WorkflowActionInstance` VALUES(29, 'WorkflowActionInstance', '2012-02-06 13:11:53', '2012-02-06 13:11:53', NULL, 1, 16, 2, 1);
INSERT INTO `WorkflowActionInstance` VALUES(30, 'WorkflowActionInstance', '2012-02-16 14:25:12', '2012-02-16 14:25:12', NULL, 1, 17, 2, 1);
INSERT INTO `WorkflowActionInstance` VALUES(31, 'WorkflowActionInstance', '2012-10-11 15:29:03', '2012-10-11 15:29:04', NULL, 1, 18, 2, 1);
INSERT INTO `WorkflowActionInstance` VALUES(32, 'WorkflowActionInstance', '2012-10-11 16:39:03', '2012-10-11 16:39:03', NULL, 1, 19, 2, 4);
INSERT INTO `WorkflowActionInstance` VALUES(33, 'WorkflowActionInstance', '2012-10-11 16:47:18', '2012-10-11 16:50:11', NULL, 1, 20, 2, 4);
INSERT INTO `WorkflowActionInstance` VALUES(34, 'WorkflowActionInstance', '2012-10-11 16:50:11', '2012-10-11 16:50:11', NULL, 1, 20, 1, 4);
INSERT INTO `WorkflowActionInstance` VALUES(35, 'WorkflowActionInstance', '2012-10-11 16:50:11', '2012-10-11 16:50:11', NULL, 1, 20, 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowDefinition`
--

CREATE TABLE `WorkflowDefinition` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('WorkflowDefinition') CHARACTER SET utf8 DEFAULT 'WorkflowDefinition',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8,
  `RemindDays` int(11) NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `WorkflowDefinition`
--

INSERT INTO `WorkflowDefinition` VALUES(1, 'WorkflowDefinition', '2011-12-15 15:19:58', '2012-10-11 17:36:39', 'Moderated Content', 'Test', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowDefinition_Groups`
--

CREATE TABLE `WorkflowDefinition_Groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowDefinitionID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `WorkflowDefinitionID` (`WorkflowDefinitionID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `WorkflowDefinition_Groups`
--

INSERT INTO `WorkflowDefinition_Groups` VALUES(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowDefinition_Users`
--

CREATE TABLE `WorkflowDefinition_Users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowDefinitionID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `WorkflowDefinitionID` (`WorkflowDefinitionID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `WorkflowDefinition_Users`
--


-- --------------------------------------------------------

--
-- Table structure for table `WorkflowInstance`
--

CREATE TABLE `WorkflowInstance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('WorkflowInstance') CHARACTER SET utf8 DEFAULT 'WorkflowInstance',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `WorkflowStatus` enum('Active','Paused','Complete','Cancelled') CHARACTER SET utf8 DEFAULT 'Active',
  `TargetClass` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `TargetID` int(11) NOT NULL DEFAULT '0',
  `DefinitionID` int(11) NOT NULL DEFAULT '0',
  `CurrentActionID` int(11) NOT NULL DEFAULT '0',
  `InitiatorID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `DefinitionID` (`DefinitionID`),
  KEY `CurrentActionID` (`CurrentActionID`),
  KEY `InitiatorID` (`InitiatorID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `WorkflowInstance`
--

INSERT INTO `WorkflowInstance` VALUES(18, 'WorkflowInstance', '2012-10-11 15:29:03', '2012-10-11 15:29:04', 'Instance #18 of Moderated Content', 'Paused', 'SiteTree', 72, 1, 31, 1);
INSERT INTO `WorkflowInstance` VALUES(19, 'WorkflowInstance', '2012-10-11 16:39:03', '2012-10-11 16:39:03', 'Instance #19 of Moderated Content', 'Paused', 'SiteTree', 78, 1, 32, 4);
INSERT INTO `WorkflowInstance` VALUES(20, 'WorkflowInstance', '2012-10-11 16:47:18', '2012-10-11 16:50:11', 'Instance #20 of Moderated Content', 'Complete', 'SiteTree', 79, 1, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowInstance_Groups`
--

CREATE TABLE `WorkflowInstance_Groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowInstanceID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `WorkflowInstanceID` (`WorkflowInstanceID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `WorkflowInstance_Groups`
--

INSERT INTO `WorkflowInstance_Groups` VALUES(1, 1, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(2, 1, 1);
INSERT INTO `WorkflowInstance_Groups` VALUES(3, 2, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(4, 3, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(5, 4, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(6, 5, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(7, 6, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(8, 7, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(9, 8, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(10, 9, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(11, 10, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(12, 11, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(13, 12, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(14, 13, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(15, 14, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(16, 15, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(17, 16, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(18, 17, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(19, 18, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(20, 19, 2);
INSERT INTO `WorkflowInstance_Groups` VALUES(21, 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowInstance_Users`
--

CREATE TABLE `WorkflowInstance_Users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowInstanceID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `WorkflowInstanceID` (`WorkflowInstanceID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `WorkflowInstance_Users`
--

INSERT INTO `WorkflowInstance_Users` VALUES(1, 1, 1);
INSERT INTO `WorkflowInstance_Users` VALUES(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowTransition`
--

CREATE TABLE `WorkflowTransition` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('WorkflowTransition') CHARACTER SET utf8 DEFAULT 'WorkflowTransition',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `ActionID` int(11) NOT NULL DEFAULT '0',
  `NextActionID` int(11) NOT NULL DEFAULT '0',
  `Type` enum('Active','Passive') CHARACTER SET utf8 DEFAULT 'Active',
  PRIMARY KEY (`ID`),
  KEY `ActionID` (`ActionID`),
  KEY `NextActionID` (`NextActionID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `WorkflowTransition`
--

INSERT INTO `WorkflowTransition` VALUES(1, 'WorkflowTransition', '2011-12-15 15:37:41', '2011-12-15 15:37:41', 'Approve', 1, 2, 1, 'Active');
INSERT INTO `WorkflowTransition` VALUES(2, 'WorkflowTransition', '2011-12-15 15:39:18', '2011-12-15 15:39:18', 'Reject', 2, 2, 4, 'Active');
INSERT INTO `WorkflowTransition` VALUES(3, 'WorkflowTransition', '2011-12-15 16:15:42', '2011-12-15 16:15:42', 'Send notification', 3, 1, 6, 'Active');
INSERT INTO `WorkflowTransition` VALUES(4, 'WorkflowTransition', '2011-12-15 16:16:06', '2011-12-15 16:16:06', 'Send notification', 4, 4, 6, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowTransition_Groups`
--

CREATE TABLE `WorkflowTransition_Groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowTransitionID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `WorkflowTransitionID` (`WorkflowTransitionID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `WorkflowTransition_Groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `WorkflowTransition_Users`
--

CREATE TABLE `WorkflowTransition_Users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowTransitionID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `WorkflowTransitionID` (`WorkflowTransitionID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `WorkflowTransition_Users`
--


-- --------------------------------------------------------

--
-- Table structure for table `ZenGalleryPage`
--

CREATE TABLE `ZenGalleryPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemsPerPage` int(11) NOT NULL DEFAULT '0',
  `ImageFolderID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageFolderID` (`ImageFolderID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `ZenGalleryPage`
--

INSERT INTO `ZenGalleryPage` VALUES(68, 16, 28);
INSERT INTO `ZenGalleryPage` VALUES(69, 8, 42);
INSERT INTO `ZenGalleryPage` VALUES(70, 16, 44);

-- --------------------------------------------------------

--
-- Table structure for table `ZenGalleryPage_Images`
--

CREATE TABLE `ZenGalleryPage_Images` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ZenGalleryPageID` int(11) NOT NULL DEFAULT '0',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ZenGalleryPageID` (`ZenGalleryPageID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `ZenGalleryPage_Images`
--

INSERT INTO `ZenGalleryPage_Images` VALUES(1, 68, 31);
INSERT INTO `ZenGalleryPage_Images` VALUES(2, 68, 32);
INSERT INTO `ZenGalleryPage_Images` VALUES(3, 68, 33);
INSERT INTO `ZenGalleryPage_Images` VALUES(4, 68, 34);
INSERT INTO `ZenGalleryPage_Images` VALUES(5, 68, 35);
INSERT INTO `ZenGalleryPage_Images` VALUES(6, 68, 36);
INSERT INTO `ZenGalleryPage_Images` VALUES(7, 68, 37);
INSERT INTO `ZenGalleryPage_Images` VALUES(8, 68, 38);
INSERT INTO `ZenGalleryPage_Images` VALUES(9, 68, 40);
INSERT INTO `ZenGalleryPage_Images` VALUES(10, 68, 41);
INSERT INTO `ZenGalleryPage_Images` VALUES(11, 69, 31);
INSERT INTO `ZenGalleryPage_Images` VALUES(12, 69, 33);
INSERT INTO `ZenGalleryPage_Images` VALUES(13, 69, 32);
INSERT INTO `ZenGalleryPage_Images` VALUES(14, 69, 34);
INSERT INTO `ZenGalleryPage_Images` VALUES(15, 69, 37);
INSERT INTO `ZenGalleryPage_Images` VALUES(16, 69, 38);
INSERT INTO `ZenGalleryPage_Images` VALUES(17, 69, 35);
INSERT INTO `ZenGalleryPage_Images` VALUES(18, 69, 36);
INSERT INTO `ZenGalleryPage_Images` VALUES(19, 69, 39);
INSERT INTO `ZenGalleryPage_Images` VALUES(20, 69, 40);
INSERT INTO `ZenGalleryPage_Images` VALUES(21, 70, 31);
INSERT INTO `ZenGalleryPage_Images` VALUES(22, 70, 33);
INSERT INTO `ZenGalleryPage_Images` VALUES(23, 70, 32);

-- --------------------------------------------------------

--
-- Table structure for table `ZenGalleryPage_Live`
--

CREATE TABLE `ZenGalleryPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemsPerPage` int(11) NOT NULL DEFAULT '0',
  `ImageFolderID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageFolderID` (`ImageFolderID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `ZenGalleryPage_Live`
--

INSERT INTO `ZenGalleryPage_Live` VALUES(68, 16, 28);
INSERT INTO `ZenGalleryPage_Live` VALUES(69, 8, 42);
INSERT INTO `ZenGalleryPage_Live` VALUES(70, 16, 44);

-- --------------------------------------------------------

--
-- Table structure for table `ZenGalleryPage_versions`
--

CREATE TABLE `ZenGalleryPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ItemsPerPage` int(11) NOT NULL DEFAULT '0',
  `ImageFolderID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `ImageFolderID` (`ImageFolderID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `ZenGalleryPage_versions`
--

INSERT INTO `ZenGalleryPage_versions` VALUES(1, 68, 1, 16, 0);
INSERT INTO `ZenGalleryPage_versions` VALUES(2, 68, 2, 16, 28);
INSERT INTO `ZenGalleryPage_versions` VALUES(3, 68, 3, 16, 28);
INSERT INTO `ZenGalleryPage_versions` VALUES(4, 68, 4, 16, 28);
INSERT INTO `ZenGalleryPage_versions` VALUES(5, 69, 1, 16, 0);
INSERT INTO `ZenGalleryPage_versions` VALUES(6, 69, 2, 16, 42);
INSERT INTO `ZenGalleryPage_versions` VALUES(7, 69, 3, 8, 42);
INSERT INTO `ZenGalleryPage_versions` VALUES(8, 70, 1, 16, 0);
INSERT INTO `ZenGalleryPage_versions` VALUES(9, 70, 2, 16, 44);
INSERT INTO `ZenGalleryPage_versions` VALUES(10, 69, 4, 8, 42);
INSERT INTO `ZenGalleryPage_versions` VALUES(11, 70, 3, 16, 44);
INSERT INTO `ZenGalleryPage_versions` VALUES(12, 69, 5, 8, 42);
INSERT INTO `ZenGalleryPage_versions` VALUES(13, 70, 4, 16, 44);

-- --------------------------------------------------------

--
-- Table structure for table `_obsolete_Image`
--

CREATE TABLE `_obsolete_Image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionKey` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `_obsolete_Image`
--

INSERT INTO `_obsolete_Image` VALUES(1, 'c7fb40c41dff6fefeb0c1cbaf217fafc');
INSERT INTO `_obsolete_Image` VALUES(6, '17c0a92d7539e0bd92b5bd065c1d7f42');
INSERT INTO `_obsolete_Image` VALUES(7, NULL);
INSERT INTO `_obsolete_Image` VALUES(10, NULL);
INSERT INTO `_obsolete_Image` VALUES(11, NULL);
INSERT INTO `_obsolete_Image` VALUES(13, NULL);
INSERT INTO `_obsolete_Image` VALUES(14, NULL);
INSERT INTO `_obsolete_Image` VALUES(16, NULL);
INSERT INTO `_obsolete_Image` VALUES(18, '6a2fe550d65fe6953e2d449130146533');
INSERT INTO `_obsolete_Image` VALUES(19, NULL);
INSERT INTO `_obsolete_Image` VALUES(20, '901b7e9c83a1b825d3d32843c93c68a2');
INSERT INTO `_obsolete_Image` VALUES(21, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `_obsolete_Page`
--

CREATE TABLE `_obsolete_Page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ShowChildrenMenu` tinyint(1) NOT NULL DEFAULT '0',
  `TidyHtml` tinyint(1) NOT NULL DEFAULT '0',
  `PurifyHtml` tinyint(1) NOT NULL DEFAULT '0',
  `CleanOnSave` tinyint(1) NOT NULL DEFAULT '0',
  `CreatorID` int(11) NOT NULL DEFAULT '0',
  `LockExpiry` datetime DEFAULT NULL,
  `LastEditor` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `_obsolete_Page`
--

INSERT INTO `_obsolete_Page` VALUES(1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(2, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(3, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(10, 0, 0, 0, 0, 0, '2012-07-31 17:38:04', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page` VALUES(11, 0, 0, 0, 0, 0, '2012-07-31 17:38:04', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page` VALUES(12, 0, 0, 0, 0, 0, '2012-07-31 17:38:04', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page` VALUES(13, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(14, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(15, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(17, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(18, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(19, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(20, 0, 0, 0, 0, 0, '2012-07-31 17:39:17', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page` VALUES(21, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(22, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(23, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(24, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(25, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(26, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(27, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(29, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(47, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(49, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(51, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(52, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(53, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(54, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(55, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(57, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(58, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(59, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(60, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(61, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(62, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(63, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page` VALUES(64, 0, 1, 0, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `_obsolete_Page_Live`
--

CREATE TABLE `_obsolete_Page_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ShowChildrenMenu` tinyint(1) NOT NULL DEFAULT '0',
  `TidyHtml` tinyint(1) NOT NULL DEFAULT '0',
  `PurifyHtml` tinyint(1) NOT NULL DEFAULT '0',
  `CleanOnSave` tinyint(1) NOT NULL DEFAULT '0',
  `CreatorID` int(11) NOT NULL DEFAULT '0',
  `LockExpiry` datetime DEFAULT NULL,
  `LastEditor` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `_obsolete_Page_Live`
--

INSERT INTO `_obsolete_Page_Live` VALUES(1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(2, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(3, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(10, 0, 0, 0, 0, 0, '2012-07-31 17:38:04', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_Live` VALUES(11, 0, 0, 0, 0, 0, '2012-07-31 17:38:04', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_Live` VALUES(12, 0, 0, 0, 0, 0, '2012-07-31 17:38:04', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_Live` VALUES(13, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(14, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(15, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(17, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(18, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(19, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(20, 0, 0, 0, 0, 0, '2012-07-31 17:39:17', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_Live` VALUES(21, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(22, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(23, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(24, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(25, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(26, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(27, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(29, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(47, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(49, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(51, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(52, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(53, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(54, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(55, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(57, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(58, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(59, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(60, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(62, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(63, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_Live` VALUES(64, 0, 1, 0, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `_obsolete_Page_versions`
--

CREATE TABLE `_obsolete_Page_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ShowChildrenMenu` tinyint(1) NOT NULL DEFAULT '0',
  `TidyHtml` tinyint(1) NOT NULL DEFAULT '0',
  `PurifyHtml` tinyint(1) NOT NULL DEFAULT '0',
  `CleanOnSave` tinyint(1) NOT NULL DEFAULT '0',
  `CreatorID` int(11) NOT NULL DEFAULT '0',
  `LockExpiry` datetime DEFAULT NULL,
  `LastEditor` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=214 ;

--
-- Dumping data for table `_obsolete_Page_versions`
--

INSERT INTO `_obsolete_Page_versions` VALUES(1, 25, 7, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(2, 21, 10, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(3, 22, 6, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(4, 23, 3, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(5, 3, 4, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(6, 3, 5, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(7, 3, 6, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(8, 26, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(9, 26, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(10, 26, 3, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(11, 26, 4, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(12, 2, 7, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(13, 17, 3, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(14, 18, 3, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(15, 19, 3, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(16, 27, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(17, 27, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(18, 27, 3, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(19, 27, 4, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(20, 27, 5, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(21, 27, 6, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(22, 27, 7, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(23, 28, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(24, 27, 8, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(25, 29, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(26, 30, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(27, 31, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(28, 21, 11, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(29, 32, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(30, 27, 9, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(31, 33, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(32, 34, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(33, 34, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(34, 35, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(35, 36, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(36, 37, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(37, 38, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(38, 39, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(39, 40, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(40, 41, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(41, 42, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(42, 29, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(43, 27, 10, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(44, 43, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(45, 27, 11, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(46, 44, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(47, 45, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(48, 46, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(49, 47, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(50, 48, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(51, 48, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(52, 21, 12, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(53, 14, 4, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(54, 14, 5, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(55, 24, 4, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(56, 20, 4, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(57, 49, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(58, 50, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(59, 49, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(60, 51, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(61, 51, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(62, 51, 3, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(63, 49, 3, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(64, 52, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(65, 52, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(66, 52, 3, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(67, 51, 4, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(68, 51, 5, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(69, 53, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(70, 53, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(71, 54, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(72, 54, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(73, 17, 4, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(74, 22, 7, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(75, 23, 4, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(76, 26, 5, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(77, 29, 3, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(78, 47, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(79, 51, 6, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(80, 51, 7, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(81, 52, 4, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(82, 52, 5, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(83, 55, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(84, 56, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(85, 56, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(86, 56, 3, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(87, 2, 8, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(88, 55, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(89, 18, 4, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(90, 2, 9, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(91, 57, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(92, 57, 2, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(93, 57, 3, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(94, 57, 4, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(95, 3, 7, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(96, 58, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(97, 58, 2, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(98, 59, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(99, 59, 2, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(100, 59, 3, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(101, 59, 4, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(102, 59, 5, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(103, 59, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(104, 59, 7, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(105, 59, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(106, 59, 9, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(107, 59, 10, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(108, 59, 11, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(109, 59, 12, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(110, 59, 13, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(111, 59, 14, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(112, 59, 15, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(113, 59, 16, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(114, 59, 17, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(115, 59, 18, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(116, 59, 19, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(117, 59, 20, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(118, 59, 21, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(119, 59, 22, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(120, 58, 3, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(121, 58, 4, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(122, 58, 5, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(123, 58, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(124, 1, 7, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(125, 58, 7, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(126, 59, 23, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(127, 21, 13, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(128, 27, 12, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(129, 27, 13, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(130, 27, 14, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(131, 27, 15, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(132, 27, 16, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(133, 27, 17, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(134, 27, 18, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(135, 15, 14, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(136, 3, 8, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(137, 58, 8, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(138, 19, 4, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(139, 18, 5, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(140, 17, 5, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(141, 2, 10, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(142, 51, 8, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(143, 52, 6, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(144, 13, 4, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(145, 2, 11, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(146, 2, 12, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(147, 2, 13, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(148, 1, 8, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(149, 17, 6, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(150, 17, 7, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(151, 18, 6, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(152, 18, 7, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(153, 3, 9, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(154, 3, 10, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(155, 19, 5, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(156, 19, 6, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(157, 58, 9, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(158, 58, 10, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(159, 2, 14, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(160, 53, 3, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(161, 53, 4, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(162, 53, 5, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(163, 54, 3, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(164, 54, 4, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(165, 54, 5, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(166, 27, 19, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(167, 21, 14, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(168, 21, 15, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(169, 21, 16, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(170, 21, 17, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(171, 4, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(172, 24, 5, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(173, 14, 6, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(174, 13, 5, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(175, 5, 2, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(176, 49, 4, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(177, 3, 11, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(178, 3, 12, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(179, 25, 8, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(180, 3, 13, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(181, 57, 5, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(182, 57, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(183, 57, 7, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(184, 57, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(185, 60, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(186, 60, 2, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(187, 61, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(188, 62, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(189, 63, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(190, 64, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `_obsolete_Page_versions` VALUES(191, 20, 5, 0, 0, 0, 0, 0, '2012-07-31 17:36:23', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(192, 12, 2, 0, 0, 0, 0, 0, '2012-07-31 17:36:23', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(193, 11, 2, 0, 0, 0, 0, 0, '2012-07-31 17:36:23', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(194, 10, 4, 0, 0, 0, 0, 0, '2012-07-31 17:36:23', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(195, 10, 5, 0, 0, 0, 0, 0, '2012-07-31 17:36:24', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(196, 20, 6, 0, 0, 0, 0, 0, '2012-07-31 17:36:39', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(197, 12, 3, 0, 0, 0, 0, 0, '2012-07-31 17:36:39', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(198, 12, 4, 0, 0, 0, 0, 0, '2012-07-31 17:36:40', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(199, 11, 3, 0, 0, 0, 0, 0, '2012-07-31 17:36:40', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(200, 10, 6, 0, 0, 0, 0, 0, '2012-07-31 17:36:40', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(201, 20, 7, 0, 0, 0, 0, 0, '2012-07-31 17:37:28', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(202, 12, 5, 0, 0, 0, 0, 0, '2012-07-31 17:37:28', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(203, 11, 4, 0, 0, 0, 0, 0, '2012-07-31 17:37:28', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(204, 10, 7, 0, 0, 0, 0, 0, '2012-07-31 17:37:28', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(205, 20, 8, 0, 0, 0, 0, 0, '2012-07-31 17:37:28', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(206, 20, 9, 0, 0, 0, 0, 0, '2012-07-31 17:38:03', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(207, 12, 6, 0, 0, 0, 0, 0, '2012-07-31 17:38:03', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(208, 12, 7, 0, 0, 0, 0, 0, '2012-07-31 17:38:04', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(209, 11, 5, 0, 0, 0, 0, 0, '2012-07-31 17:38:04', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(210, 10, 8, 0, 0, 0, 0, 0, '2012-07-31 17:38:04', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(211, 12, 8, 0, 0, 0, 0, 0, '2012-07-31 17:38:04', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(212, 20, 10, 0, 0, 0, 0, 0, '2012-07-31 17:39:17', 'admin@symbiote.com.au');
INSERT INTO `_obsolete_Page_versions` VALUES(213, 20, 11, 0, 0, 0, 0, 0, '2012-07-31 17:39:17', 'admin@symbiote.com.au');
