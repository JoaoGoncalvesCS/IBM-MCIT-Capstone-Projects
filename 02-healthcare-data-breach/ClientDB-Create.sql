-- Create the database
CREATE DATABASE IF NOT EXISTS ClientData;
USE ClientData;


-- Create the table for client information
CREATE TABLE IF NOT EXISTS `Clients` (
  `ClientID` VARCHAR(10) NOT NULL PRIMARY KEY,
  `ServiceCodes` VARCHAR(10) NULL,
  `EngagementLevels` INT NULL,
  `ProgramAttendanceDates` DATE NULL,
  `FeedbackScores` INT NULL,
  `ServiceCompletionStatus` VARCHAR(45) NULL,
  `ResourceUtilizationIndicators` BOOLEAN NULL,
  `AnonymousCaseID` VARCHAR(10) NULL,
  `InteractionChannels` VARCHAR(45) NULL
 );


-- Insert the client information
INSERT INTO `clientdata`.`Clients` (`ClientID`,`ServiceCodes`,`EngagementLevels`,`ProgramAttendanceDates`,`FeedbackScores`,`ServiceCompletionStatus`,`ResourceUtilizationIndicators`,`AnonymousCaseID`,`InteractionChannels`) 
VALUES
('XYZ123', 'A1', '5', '2023-03-15', '4', 'Complete', TRUE, 'XYZ123', 'Phone'),
('ABC456', 'B2', '3', '2023-04-10', '5', 'In progress', FALSE, 'ABC456', 'Email'),
('LMN789', 'A1,B3', '7', '2023-05-20', '3', 'Completed', TRUE, 'LMN789', 'In-person'),
('DEF012', 'C1', '2', '2023-06-18', '4', 'Not started', TRUE, 'DEF012', 'Online'),
('GHI345', 'B2,C1', '4', '2023-07-22', '5', 'Completed', FALSE, 'GHI345', 'Phone');

-- Create system-level roles
CREATE ROLE IF NOT EXISTS crm_role;
CREATE ROLE IF NOT EXISTS pm_role;
CREATE ROLE IF NOT EXISTS da_role;
CREATE ROLE IF NOT EXISTS oe_role;
CREATE ROLE IF NOT EXISTS fs_role;
CREATE ROLE IF NOT EXISTS his_role;

-- Create department-level roles
CREATE ROLE IF NOT EXISTS it_role;
CREATE ROLE IF NOT EXISTS finance_role;
CREATE ROLE IF NOT EXISTS cs_role;
CREATE ROLE IF NOT EXISTS hr_role;
CREATE ROLE IF NOT EXISTS lc_role;
CREATE ROLE IF NOT EXISTS hpr_role;
CREATE ROLE IF NOT EXISTS coe_role;
CREATE ROLE IF NOT EXISTS fd_role;

-- Grant permissions to system-level roles
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO crm_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO pm_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO da_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO oe_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO fs_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO his_role;

-- Grant permissions to department-level roles
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO it_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO finance_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO cs_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO hr_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO lc_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO hpr_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO coe_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClientData.Clients TO fd_role;

-- Apply the role and permission changes
FLUSH PRIVILEGES;