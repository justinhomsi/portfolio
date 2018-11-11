/* Name: Justin Homsi
   Student ID: 10373949
*/

USE The_Firm;
GO

/* Accountant View (2 marks)
   Create a view which shows all details of all accountants.  
   The view should include the full name of their mentor (if they have one), as well as the name of the branch they work in, the name of their pay level and their annual salary.
*/

-- Write your Accountant View here

CREATE VIEW accountant_info
AS SELECT a.staffID, a.staffFirstName, a.staffLastName, a.staffNo, a.staffHireDate, e.staffFirstName + ' ' + e.staffLastName AS 'Mentor Name', p.pay_levelName, p.pay_levelAmount, b.branchName
FROM Accountant AS a INNER JOIN pay_Level AS p 
ON a.pay_levelID = p.pay_levelID
FULL OUTER JOIN Accountant AS e
ON a.Mentor = e.staffID
INNER JOIN Branch AS b
ON a.branchID = b.branchID





GO
/* Job View (2.5 marks)
   Create a view which shows all details of all jobs.  As well as all details of jobs, the view should contain the following columns:
     • The full name of the accountant and the full name of the client.  (Concatenate the first name and last name into one column, e.g. “Joe Bloggs”.)
     • The name of the job type
     • A column named “job_cost”, which multiplies the job duration by the Cost Per Minute in the job type table.
*/

-- Write your Job View here

CREATE VIEW job_view
AS SELECT jobID, a.staffID, c.clientTaxFileNo, Job.jobDateTime, Job.jobDuration, Job.jobPaid, j.job_typeID, staffFirstName + ' ' + staffLastName AS 'Accountant Name', clientFirstName + ' ' + clientLastName AS 'Client Name', job_typeName, jobDuration * costPerMinute AS 'Job Cost'
FROM Job INNER JOIN Accountant AS a
ON job.staffID = a.staffID
INNER JOIN Client AS c
ON Job.clientTaxFileNo = c.clientTaxFileNo
INNER JOIN job_Type AS j
ON Job.job_typeID = j.job_typeID




/* Additional Information:
   The views essentially create “flat” versions of the main tables of the database, giving you a convenient way to access all details, including those that are stored in other tables.  
   You are encouraged to use the views to simplify the queries which follow - You can use a view in a SELECT statement in exactly the same way as you can use a table – often avoiding the need to write the same JOINs over and over.  

   If you wish to create additional views to simplify the queries which follow, include them in this file.
*/