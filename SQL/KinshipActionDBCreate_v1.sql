###################################################
#                                                 #
# Script to create KinshipAction database tables  #
#                                                 #
# You can run this straight through to create     #
# the database and all its tables or you can run  #
# specific pieces as needed.                      #
#                                                 #
###################################################

# Create database and switch to using it

DROP DATABASE IF EXISTS KinshipAction ;

CREATE DATABASE KinshipAction ;

USE KinshipAction ;


# First drop tables if they exist to start clean
# Drop the tables that have foreign keys first

DROP TABLE IF EXISTS GroupEvent ;

DROP TABLE IF EXISTS GroupIssue ;

DROP TABLE IF EXISTS EventIssue ;

DROP TABLE IF EXISTS KGroup ;

DROP TABLE IF EXISTS KEvent ;

DROP TABLE IF EXISTS Issue ;


# Create tables
# Create the child tables (the ones that have foreign keys)
# after the parent tables


CREATE TABLE KGroup (
Name   VARCHAR(255) NOT NULL ,
Description   VARCHAR(255) ,
Website   VARCHAR(255) ,
MissionStatement   TEXT ,
ResourcesNeeded   TEXT ,
OrgType   ENUM('Local', 'State-Province', 'Regional', 'National', 'International') ,
ContactPerson   VARCHAR(255) ,
ContactEmail   VARCHAR(255) ,
ContactPhone   VARCHAR(255) ,
TextOK   ENUM('Yes', 'No') ,
Address1   VARCHAR(255) ,
Address2   VARCHAR(255) ,
City   VARCHAR(255) ,
StateProvince   VARCHAR(255) ,
PostalCode   VARCHAR(255) ,
Country   VARCHAR(255) ,
Latitude   DECIMAL(10,7) ,
Longitude   DECIMAL(10,7) ,
PRIMARY KEY (Name)
) Engine=InnoDB ;



CREATE TABLE KEvent (
Name   VARCHAR(255) NOT NULL ,
Description   VARCHAR(255) ,
Begin   DATETIME ,
End   DATETIME ,
UTC_Offset   TINYINT ,
Zone   CHAR(5) ,
ContactPerson   VARCHAR(255) ,
ContactEmail   VARCHAR(255) ,
ContactPhone   VARCHAR(255) ,
TextOK   ENUM('Yes', 'No') ,
RegistrationLink   VARCHAR(255) ,
Location   VARCHAR(255) ,
Type   ENUM('In-person', 'Online', 'Hybrid') ,
Latitude   DECIMAL(10,7) ,
Longitude   DECIMAL(10,7) ,
PRIMARY KEY (Name)
) Engine=InnoDB ;


CREATE TABLE Issue (
Name   VARCHAR(255) NOT NULL ,
Description   VARCHAR(255) ,
PRIMARY KEY (Name)
) Engine=InnoDB ;



CREATE TABLE GroupEvent (
GroupName   VARCHAR(255) NOT NULL ,
EventName   VARCHAR(255) NOT NULL ,
PRIMARY KEY (GroupName, EventName) ,
FOREIGN KEY (GroupName) REFERENCES KGroup (Name)
	ON DELETE CASCADE
	ON UPDATE CASCADE ,
FOREIGN KEY (EventName) REFERENCES KEvent (Name) 
	ON DELETE CASCADE
	ON UPDATE CASCADE
) Engine=InnoDB ;



CREATE TABLE GroupIssue (
GroupName   VARCHAR(255) NOT NULL ,
IssueName   VARCHAR(255) NOT NULL ,
PRIMARY KEY (GroupName, IssueName) ,
CONSTRAINT GroupName_fk
FOREIGN KEY (GroupName) REFERENCES KGroup (Name)
	ON DELETE CASCADE
	ON UPDATE CASCADE ,
CONSTRAINT IssueName_fk
FOREIGN KEY (IssueName) REFERENCES Issue (Name) 
	ON DELETE CASCADE
	ON UPDATE CASCADE
) Engine=InnoDB ;


CREATE TABLE EventIssue (
EventName   VARCHAR(255) NOT NULL ,
IssueName   VARCHAR(255) NOT NULL ,
PRIMARY KEY (EventName, IssueName) ,
CONSTRAINT EventName_fk
FOREIGN KEY (EventName) REFERENCES KEvent (Name)
	ON DELETE CASCADE
	ON UPDATE CASCADE ,
CONSTRAINT IssueName1_fk
FOREIGN KEY (IssueName) REFERENCES Issue (Name) 
	ON DELETE CASCADE
	ON UPDATE CASCADE
) Engine=InnoDB ;

