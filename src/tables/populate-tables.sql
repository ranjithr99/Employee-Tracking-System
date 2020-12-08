-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

-- Populate lookup tables

INSERT INTO tblRole (RoleName, RoleDesc)
VALUES ('Software Engineer', 'Software Engineers leverage engeering principles to design, create
    and troubleshoot software'),
  ('Product Manager', 'Product Managers are point of people for a given product'),
  ('Program Manager', 'Program Manager ideate, implement, measure the impact of and optimize a
    given program within an organization'),
  ('Data Scientist', 'Data Scientists analyze data to derive meaning from it and ultimately, use
    that information to help meet organizational goals'),
  ('Business Analyst', 'Business Analysts study organizational operations to assess performance,
    identify problems and come up with creative solutions');
GO

INSERT INTO tblEmployee (FName, LName, DOB)
SELECT TOP 300000 CustomerFname, CustomerLname, DateOfBirth
FROM PEEPS.dbo.tblCUSTOMER
GO

INSERT INTO tblEvent_Type (EventTypeName, EventTypeDesc)
VALUES ('Hired', 'A person was hired to the company'),
  ('Fired', 'A person was fired from the company'),
  ('Salary Raise', 'Increase in paycheck'),
  ('Promotion', 'Employee moves up in hierarchy and recieves more responsibility'),
  ('Demotion', 'Employee moves down in hierarchy and recieves less responsibility/more management'),
  ('Transfer Location', 'Employee transfered to another office location'),
  ('Escalation', 'When there has been a complaint raised for an employee');
GO


INSERT INTO tblRating (RatingName, RatingNumeric)
VALUES ('Performance', 8),
  ('Performance', 10),
  ('Performance', 6.5);
GO

INSERT INTO tblOrganization (OrganizationName, OrganizationDesc)
VALUES ('Health Insurance', 'Deals with providing health insurance and coverage plans for American Individuals'),
  ('Banking', 'A banking service to safeguard money of customers for the world. '),
  ('Consulting Services', 'B2B management consulting for finance companies.');
GO

INSERT INTO tblDepartment
VALUES((SELECT OrganizationID FROM tblOrganization WHERE OrganizationName LIKE 'Health Insurance'), 'Marketing', 'Deals with the outreach of product to the general public'),
((SELECT OrganizationID FROM tblOrganization WHERE OrganizationName LIKE 'Health Insurance'), 'Development', 'Deals with producing and maintaining tech applications.'),
((SELECT OrganizationID FROM tblOrganization WHERE OrganizationName LIKE 'Health Insurance'), 'Legal', 'Deals legal and lawsuit activities for the company.'),
((SELECT OrganizationID FROM tblOrganization WHERE OrganizationName LIKE 'Health Insurance'), 'Finance', 'Responsible for maintaining financial assets and liabilities of the company.'),
((SELECT OrganizationID FROM tblOrganization WHERE OrganizationName LIKE 'Banking'), 'Marketing', 'Deals with the outreach of product to the general public'),
((SELECT OrganizationID FROM tblOrganization WHERE OrganizationName LIKE 'Banking'), 'Development', 'Deals with producing and maintaining tech applications.'),
((SELECT OrganizationID FROM tblOrganization WHERE OrganizationName LIKE 'Banking'), 'Legal', 'Deals legal and lawsuit activities for the company.'),
((SELECT OrganizationID FROM tblOrganization WHERE OrganizationName LIKE 'Banking'), 'Finance', 'Responsible for maintaining financial assets and liabilities of the company.'),
((SELECT OrganizationID FROM tblOrganization WHERE OrganizationName LIKE 'Consulting Services'), 'Marketing', 'Deals with the outreach of product to the general public'),
((SELECT OrganizationID FROM tblOrganization WHERE OrganizationName LIKE 'Consulting Services'), 'Development', 'Deals with producing and maintaining tech applications.'),
((SELECT OrganizationID FROM tblOrganization WHERE OrganizationName LIKE 'Consulting Services'), 'Legal', 'Deals legal and lawsuit activities for the company.'),
((SELECT OrganizationID FROM tblOrganization WHERE OrganizationName LIKE 'Consulting Services'), 'Finance', 'Responsible for maintaining financial assets and liabilities of the company.');