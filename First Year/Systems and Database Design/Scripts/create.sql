/* Name: Justin Homsi
   Student ID: 10373949
*/

/*	Database Creation & Population Script (8 marks)
	Produce a script to create the database you designed in Task 1 (incorporating any changes you have made since then).  
	Be sure to give your columns the same data types, properties and constraints specified in your data dictionary, and be sure to name tables and columns consistently.  
	Include any logical and correct default values and any check or unique constraints that you feel are appropriate.

	Make sure this script can be run multiple times without resulting in any errors (hint: drop the database if it exists before trying to create it).  
	You can use/adapt the code at the start of the creation scripts of the sample databases available in the unit materials to implement this.

	See the assignment brief for further information. 
*/

-- Write your creation script here

IF DB_ID('The_Firm') IS NOT NULL
	BEGIN
		PRINT 'Database Exists - Dropping.';
		
		USE master;
		ALTER DATABASE The_Firm SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE The_Firm;
	END

GO

PRINT 'Creating Database.';

CREATE DATABASE The_Firm

GO

USE The_Firm;

GO

CREATE TABLE Branch
(	branchID INT NOT NULL PRIMARY KEY IDENTITY,
	branchName VARCHAR(50) NOT NULL,
	branchAddress VARCHAR(100) NOT NULL,
	branchNo VARCHAR(20) NOT NULL
)
PRINT 'Creating Table - Branch';

CREATE TABLE pay_Level
(	pay_levelID TINYINT NOT NULL PRIMARY KEY IDENTITY,
	pay_levelName VARCHAR(20) NOT NULL,
	pay_levelAmount SMALLMONEY NOT NULL, 
	pay_levelExperience TINYINT NOT NULL
)
PRINT 'Creating Table - pay_Level';

CREATE TABLE Accountant
(	staffID INT NOT NULL PRIMARY KEY IDENTITY,
	staffFirstName VARCHAR(20) NOT NULL,
	staffLastName VARCHAR(20) NOT NULL,
	staffNo VARCHAR(20) NOT NULL,
	staffHireDate DATETIME NOT NULL,
	pay_levelID TINYINT NOT NULL FOREIGN KEY REFERENCES pay_Level(pay_levelID),
	branchID INT NOT NULL FOREIGN KEY REFERENCES Branch(branchID),
	Mentor INT NULL FOREIGN KEY REFERENCES Accountant(staffID)
)
PRINT 'Creating Table - Accountant';

CREATE TABLE Client
(	clientTaxFileNo INT NOT NULL PRIMARY KEY,
	clientFirstName VARCHAR(20) NOT NULL,
	clientLastName VARCHAR(20) NOT NULL,
	clientNo VARCHAR(20) NOT NULL,
	clientEmail VARCHAR(50) NOT NULL,
	staffID INT NULL FOREIGN KEY REFERENCES Accountant(staffID)
)
PRINT 'Creating Table - Client';

CREATE TABLE job_Type
(	job_typeID TINYINT NOT NULL PRIMARY KEY IDENTITY,
	job_typeName VARCHAR(25) NOT NULL,
	costPerMinute SMALLMONEY NOT NULL
)
PRINT 'Creating Table - job_Type';

CREATE TABLE Job
(	jobID INT NOT NULL PRIMARY KEY IDENTITY,
	jobDateTime DATETIME NOT NULL,
	jobDuration FLOAT NOT NULL,
	jobPaid CHAR(1) NOT NULL CHECK (jobPaid IN ('Y', 'N')),
	staffID INT NOT NULL FOREIGN KEY REFERENCES Accountant(staffID),
	clientTaxFileNo INT NOT NULL FOREIGN KEY REFERENCES Client(clientTaxFileNo),
	job_typeID TINYINT NOT NULL FOREIGN KEY REFERENCES job_Type(job_typeID),
)
PRINT 'Creating Table - Job';

CREATE TABLE job_Specialisation
(	job_typeID TINYINT NOT NULL FOREIGN KEY REFERENCES job_Type(job_typeID),
	staffID INT NULL FOREIGN KEY REFERENCES Accountant(staffID)
	
	CONSTRAINT job_spec_unique UNIQUE (job_typeID, staffID)
)	
PRINT 'Creating Table - job_Specialisation';	




/*  Database Population Statements
    Following the SQL statements to create your database and its tables, you must include statements to populate the database with sufficient test data.

    Add the INSERT statements you write to the end of the create.sql file as you work through the views and queries.  
    The final create.sql should be able to create your database and populate it with enough data to make sure that all views and queries return meaningful results.
*/

-- Write your insert statements here
INSERT INTO job_Type (job_typeName, costPerMinute)
VALUES ('Tax Return', $4.00),
	   ('Financial Planning', $5.00),
	   ('Retirement Planning', $5.00),
	   ('Litigation Support', $7.50),
	   ('Miscellaneous', $6.50);

INSERT INTO Branch (branchName, branchAddress, branchNo)
VALUES ('Springfield', '123 Fake Street', '8837263'),
	   ('Shelbyville', '529 Terror Lake', '8263651'),
	   ('Cypress Creek', '15201 Maple Systems Road', '8452312');

INSERT INTO pay_Level (pay_levelName, pay_levelAmount, pay_levelExperience)
VALUES ('Trainee', $45000, 0),
	   ('Junior Accountant', $60000, 1),
	   ('Accountant', $75000, 4),
	   ('Senior Accountant', $95000, 8);

INSERT INTO Accountant (staffFirstName, staffLastName, staffNo, staffHireDate, pay_levelID, branchID, Mentor)
VALUES ('Hank', 'Scorpio', '900', '1999-07-03', 4, 3, NULL),
	   ('Max', 'Power', '901', '1989-02-12', 4, 1, NULL),
	   ('Joe', 'Kickass', '902', '2013-05-29', 3, 1, NULL),
	   ('George', 'Cauldron', '903', '1995-09-13', 2, 2, NULL),
	   ('Rainier', 'Wolfcastle', '904', '1993-01-23', 1, 1, NULL),
	   ('Amanda', 'Hugginkiss', '905', '1988-04-04', 3, 2, NULL),
	   ('Hugh', 'Jass', '906', '1994-02-06', 2, 3, 1),
	   ('Guy', 'Incognito', '907', '1998-03-27', 1, 1, 2),
	   ('Haywood U.', 'Cuddleme', '908', '1996-06-29', 2, 3, NULL),
	   ('Seymour', 'Butz', '909', '2003-10-23', 1, 2, 4);

INSERT INTO Client (clientTaxFileNo, clientFirstName, clientLastName, clientNo, clientEmail, staffID)
VALUES (111111101, 'Hans', 'Moleman', '63728372', 'hmoleman@globexcorp.com', 8),
	   (111111102, 'Moe', 'Szyslak', '67826187', 'mszyslak@globexcorp.com', 6),
	   (111111103, 'Nick', 'Riviera', '65493827', 'nriviera@globexcorp.com', NULL),
	   (111111104, 'Homer', 'Simpson', '68590312', 'hsimpson@globexcorp.com', 1),
	   (111111105, 'Clancy', 'Wiggum', '65324567', 'cwiggum@globexcorp.com', 7),
	   (111111106, 'Ned', 'Flanders', '65357852', 'nflanders@globexcorp.com', 8),
	   (111111107, 'Lenny', 'Leonard', '64241278', 'lleonard@globexcorp.com', 1),
	   (111111108, 'Carl', 'Carlson', '67293726', 'ccarlson@globexcorp.com', 1),
	   (111111109, 'Suds', 'McDuff', '63729375', 'smcduff@globexcorp.com', 6),
	   (111111110, 'Al', 'Caholic', '69047382', 'rwolfcastle@globexcorp.com', NULL);

INSERT INTO job_Specialisation (job_typeID, staffID)
VALUES (4, 1),
	   (2, 2),
	   (1, 10),
	   (3, 4),
	   (3, 6),
	   (2, 3),
	   (1, 5),
	   (5, 7),
	   (4, 8),
	   (2, 9);
	   

/*  The following statement inserts the details of 100 jobs into a table named "job".  
    It specifies the following column data:
      1) Staff ID numbers between 1 and 10.
      2) Client Tax File Numbers between 111111101 and 111111110.
      3) Job Type ID numbers between 1 and 5.
      4) Job Date/Times roughly within business hours over the last couple of years.
      5) Job Durations between 15 and 360.
      6) Paid values of "Y" or "N".
  
    You will need to insert details of accountants, clients and job types before you can insert job details.
    Make sure that the IDs of your accountants, clients and job types match those specified above so that the foreign key relationships are upheld.
    Make sure that the data types of the columns in your job table are able to store the data being inserted.
    Change the column names in the statement below to match the column names in your job table if needed.
*/

INSERT INTO job (staffID, clientTaxFileNo, job_typeID, jobDateTime, jobDuration, jobPaid)
VALUES (3,  111111108, 5, '2014-11-02 14:40:00', 47,  'Y'),
       (6,  111111103, 2, '2014-06-28 13:15:00', 68,  'Y'),
       (4,  111111103, 5, '2016-01-14 14:36:00', 277, 'N'),
       (4,  111111102, 2, '2015-08-25 10:53:00', 119, 'N'),
       (5,  111111102, 4, '2014-07-24 13:10:00', 221, 'Y'),
       (10, 111111102, 1, '2015-10-08 15:28:00', 106, 'Y'),
       (1,  111111110, 3, '2014-11-02 16:21:00', 173, 'Y'),
       (5,  111111103, 2, '2014-03-26 11:35:00', 42,  'Y'),
       (5,  111111104, 4, '2014-11-24 10:52:00', 26,  'Y'),
       (3,  111111107, 4, '2015-10-05 11:19:00', 359, 'N'),
       (7,  111111101, 5, '2015-07-17 12:45:00', 253, 'Y'),
       (7,  111111108, 4, '2014-03-11 15:52:00', 216, 'Y'),
       (9,  111111109, 5, '2014-01-31 14:53:00', 118, 'Y'),
       (9,  111111110, 2, '2015-04-24 16:36:00', 180, 'Y'),
       (5,  111111101, 5, '2015-10-07 16:10:00', 342, 'Y'),
       (10, 111111103, 5, '2015-07-12 16:09:00', 126, 'Y'),
       (4,  111111108, 1, '2014-12-26 09:34:00', 298, 'Y'),
       (8,  111111107, 5, '2014-07-11 10:53:00', 25,  'Y'),
       (10, 111111108, 5, '2014-08-06 16:18:00', 272, 'Y'),
       (10, 111111106, 1, '2015-07-25 16:52:00', 87,  'Y'),
       (4,  111111104, 1, '2014-07-07 10:19:00', 136, 'Y'),
       (10, 111111109, 1, '2014-08-27 12:55:00', 48,  'Y'),
       (4,  111111110, 5, '2015-01-03 10:45:00', 339, 'Y'),
       (4,  111111105, 1, '2014-04-02 10:43:00', 330, 'N'),
       (7,  111111101, 5, '2014-04-05 10:04:00', 285, 'Y'),
       (7,  111111103, 1, '2014-11-02 11:13:00', 113, 'Y'),
       (1,  111111101, 4, '2016-04-29 13:14:00', 132, 'Y'),
       (8,  111111109, 1, '2014-07-06 11:02:00', 155, 'Y'),
       (7,  111111108, 3, '2014-11-19 16:35:00', 91,  'Y'),
       (6,  111111108, 3, '2015-02-01 10:50:00', 244, 'Y'),
       (6,  111111104, 1, '2014-07-09 13:09:00', 207, 'Y'),
       (4,  111111109, 2, '2015-01-09 13:20:00', 236, 'Y'),
       (10, 111111109, 2, '2014-07-29 12:25:00', 277, 'Y'),
       (3,  111111107, 3, '2015-07-17 15:00:00', 149, 'Y'),
       (10, 111111105, 2, '2015-12-23 10:55:00', 163, 'Y'),
       (10, 111111104, 2, '2016-04-21 16:53:00', 186, 'N'),
       (7,  111111109, 5, '2014-09-24 17:28:00', 176, 'Y'),
       (3,  111111102, 1, '2014-08-28 17:27:00', 341, 'Y'),
       (10, 111111107, 4, '2016-03-08 14:37:00', 341, 'N'),
       (4,  111111108, 5, '2015-08-18 13:14:00', 59,  'N'),
       (9,  111111108, 1, '2014-10-27 09:48:00', 91,  'Y'),
       (8,  111111110, 2, '2014-09-26 10:09:00', 318, 'Y'),
       (7,  111111105, 4, '2016-03-24 17:36:00', 295, 'N'),
       (5,  111111109, 2, '2014-01-04 12:59:00', 150, 'Y'),
       (4,  111111102, 1, '2014-07-27 11:51:00', 87,  'Y'),
       (3,  111111101, 5, '2014-01-06 15:50:00', 47,  'Y'),
       (9,  111111107, 1, '2015-05-07 11:12:00', 324, 'Y'),
       (7,  111111103, 3, '2015-07-31 17:25:00', 222, 'N'),
       (7,  111111110, 5, '2014-03-01 16:03:00', 236, 'Y'),
       (9,  111111110, 3, '2015-07-01 10:46:00', 48,  'Y'),
       (9,  111111102, 2, '2015-03-28 16:40:00', 245, 'Y'),
       (7,  111111110, 5, '2016-04-08 09:29:00', 294, 'Y'),
       (3,  111111110, 5, '2015-10-26 09:03:00', 293, 'N'),
       (10, 111111104, 5, '2015-09-13 10:08:00', 158, 'Y'),
       (10, 111111110, 1, '2015-11-08 12:41:00', 292, 'Y'),
       (1,  111111103, 5, '2016-03-23 13:48:00', 347, 'Y'),
       (10, 111111102, 3, '2015-12-02 17:08:00', 247, 'Y'),
       (9,  111111105, 1, '2016-04-04 10:19:00', 180, 'Y'),
       (4,  111111102, 2, '2014-03-16 15:49:00', 109, 'Y'),
       (1,  111111101, 5, '2016-01-12 12:42:00', 253, 'N'),
       (3,  111111107, 4, '2014-10-30 15:15:00', 289, 'Y'),
       (9,  111111101, 1, '2015-03-08 17:20:00', 155, 'Y'),
       (3,  111111104, 1, '2014-10-08 09:36:00', 225, 'Y'),
       (7,  111111107, 2, '2014-07-27 12:47:00', 294, 'Y'),
       (3,  111111108, 5, '2016-01-04 10:19:00', 265, 'Y'),
       (5,  111111105, 1, '2016-01-15 17:26:00', 38,  'N'),
       (7,  111111110, 3, '2015-01-20 10:29:00', 72,  'Y'),
       (4,  111111109, 2, '2015-06-25 15:11:00', 75,  'Y'),
       (8,  111111103, 3, '2014-10-23 12:59:00', 148, 'Y'),
       (3,  111111104, 2, '2014-09-04 15:01:00', 229, 'Y'),
       (7,  111111107, 2, '2014-02-22 10:30:00', 251, 'Y'),
       (9,  111111101, 5, '2014-04-29 12:32:00', 334, 'N'),
       (2,  111111109, 2, '2015-11-18 09:58:00', 150, 'Y'),
       (6,  111111107, 4, '2015-06-10 09:41:00', 133, 'Y'),
       (7,  111111107, 5, '2015-01-09 13:43:00', 38,  'Y'),
       (3,  111111109, 2, '2015-02-08 13:38:00', 313, 'Y'),
       (2,  111111108, 2, '2014-07-20 12:29:00', 74,  'Y'),
       (3,  111111104, 2, '2016-04-23 14:48:00', 22,  'Y'),
       (6,  111111109, 2, '2014-12-12 11:02:00', 337, 'Y'),
       (9,  111111104, 1, '2015-03-07 12:10:00', 308, 'Y'),
       (1,  111111108, 4, '2014-03-03 14:14:00', 240, 'Y'),
       (1,  111111102, 5, '2015-08-17 11:34:00', 237, 'Y'),
       (4,  111111107, 4, '2014-05-03 11:50:00', 321, 'Y'),
       (3,  111111107, 5, '2014-04-07 13:40:00', 15,  'N'),
       (4,  111111107, 1, '2015-02-01 11:47:00', 52,  'Y'),
       (9,  111111110, 3, '2016-04-21 13:07:00', 166, 'N'),
       (7,  111111106, 2, '2014-08-30 12:43:00', 15,  'Y'),
       (1,  111111102, 3, '2015-11-19 09:18:00', 150, 'Y'),
       (1,  111111102, 4, '2014-03-12 15:24:00', 112, 'Y'),
       (1,  111111110, 2, '2014-12-31 09:08:00', 141, 'Y'),
       (9,  111111105, 2, '2014-10-29 11:42:00', 270, 'N'),
       (5,  111111110, 2, '2014-01-17 10:54:00', 206, 'Y'),
       (1,  111111103, 3, '2015-02-26 09:50:00', 50,  'Y'),
       (6,  111111101, 1, '2015-07-23 09:58:00', 100, 'Y'),
       (1,  111111102, 5, '2015-10-18 15:41:00', 141, 'Y'),
       (9,  111111105, 2, '2014-09-25 13:44:00', 22,  'Y'),
       (6,  111111105, 2, '2016-02-08 09:16:00', 280, 'Y'),
       (5,  111111106, 1, '2016-04-07 13:34:00', 331, 'Y'),
       (8,  111111108, 3, '2014-12-13 12:27:00', 163, 'Y'),
       (4,  111111110, 5, '2016-02-23 11:52:00', 287, 'N');