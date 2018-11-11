/* Name: Justin Homsi
   Student ID: 10373949
*/

USE The_Firm;

/* Query 1 – Accountant Search (2 marks)
   Write a query that selects all details of accountants who were hired before January 1st 2010, have a first name starting with “R”, and do not have a mentor.
*/

-- Write Query 1 here
SELECT * FROM Accountant
WHERE staffHireDate < '2010-01-01' AND staffFirstName LIKE 'R%' AND Mentor IS NULL;



/* Query 2 – Job Type Statistics (2.5 marks)
   Write a query that selects the job type name, average cost, total cost and number of jobs, grouped by job type name.  
   Order the results by total cost (highest to lowest) and be sure to give all columns appropriate aliases.  
   Using your job view in this query is strongly recommended.
*/

-- Write Query 2 here
SELECT j.job_typeName, AVG(jobDuration * costPerMinute) AS 'Average Cost', SUM(jobDuration * costPerMinute) AS 'Total Cost', COUNT(jobID) AS 'Number of Jobs'
FROM job_view AS j INNER JOIN job_Type
ON j.job_typeName = job_Type.job_typeName
GROUP BY j.job_typeName
ORDER BY 'Total Cost' DESC;

/* Query 3 – Jobs Per Accountant (3 marks)
   Write a query that selects the staff ID, accountant name and number of jobs done for all accountants.  
   Ensure that you results include accountants who have not done any jobs (they should have a count of 0).  
   Order the results by the number of jobs done, in descending order.
*/

-- Write Query 3 here
SELECT job_view.staffID, staffFirstName + ' ' + staffLastName AS 'Accountant Name', COUNT(*) AS 'Number of Jobs Done'
FROM job_view FULL OUTER JOIN Accountant
ON job_view.staffID = Accountant.staffID
GROUP BY job_view.staffID, Accountant.staffFirstName, Accountant.staffLastName
ORDER BY 'Number of Jobs Done' DESC;



/* Query 4 – Overpaid Accountants (3 marks)
   Write a query that selects the accountant name, hire date, pay level name and expected experience of any accountants who have been working at the firm for less than the number of years expected for their pay level.  
   For example, an accountant at the “Senior Accountant” pay level who was hired less than 8 years ago would appear in the results of this query.
*/

-- Write Query 4 here
SELECT staffID, staffFirstName + ' ' + staffLastName AS 'Accountant Name', staffHireDate AS 'Date Hired', pay_levelName AS 'Pay Level', pay_levelExperience AS 'Expected Experience'
FROM Accountant INNER JOIN pay_Level AS p
ON Accountant.pay_levelID = p.pay_levelID
WHERE DATEDIFF(year,staffHireDate,GETDATE()) < pay_levelExperience



/* Query 5 – Specialisations Available At Branch 2 (3.5 marks)
   Write a query that selects a distinct list of the job types specialised in by all accountants who work at branch number 2.  
   Since there are only 5 job types and accountants must specialise in at least 1 of them, your results should consist of between 1 and 5 job type names, depending on your data.  
   The same job type name should not appear multiple times in the results, even if multiple accountants specialise in it.  
   Order the results by job type name.
*/

-- Write Query 5 here
SELECT DISTINCT job_typeName
FROM job_Type INNER JOIN job_Specialisation
ON job_Type.job_typeID = job_Specialisation.job_typeID
INNER JOIN Accountant
ON job_Specialisation.staffID = Accountant.staffID
INNER JOIN Branch
ON Accountant.branchID = Branch.branchID
WHERE Branch.branchID = 2
ORDER BY job_typeName




/* Query 6 – Job Descriptions (3.5 marks)
  Write a query that concatenates text and data from various columns to produce a single column that describes all jobs in the following way (column data has been indicated [like this]):
    “The [job type name] job for [client name] on [job date] took [job duration in hours] hours.”
  The job duration should be shown in hours, rounded to one decimal place – e.g.  A duration of 90 minutes would be shown as 1.5 hours.  
  Order the results by the job date.  Using your job view in this query is strongly recommended.  You will need to CAST/CONVERT the data type of some columns.

*/

-- Write Query 6 here
SELECT 'The ' + job_typeName + ' ' + 'job for ' + clientFirstName + ' ' + clientLastName + ' ' + 'on ' + CAST(jobDateTime AS VARCHAR) + ' ' + 'took ' + CAST(ROUND(jobDuration / 60, 1) AS VARCHAR) + ' ' + 'hours' AS 'Job Description'
FROM job_view INNER JOIN Client
ON job_view.clientTaxFileNo = Client.clientTaxFileNo
ORDER BY jobDateTime;

/* Query 7 – Most Popular Accountants (4 marks)
   Write a query that selects the staff ID number and full name of the three most popular accountants, based upon how many clients prefer them 
   (i.e.  The three accountants who are most frequently listed by clients as their preferred accountant).  
   Your results should include the number of preferences they have received.
*/

-- Write Query 7 here
SELECT TOP (3) c.staffID, staffFirstName + ' ' + staffLastName AS 'Accountant Name', COUNT(c.staffID) AS 'Preferences'
FROM Client AS c INNER JOIN Accountant AS a
ON c.staffID = a.staffID
GROUP BY c.staffID, staffFirstName, staffLastName
ORDER BY 'Preferences' DESC;




/* Query 8 – Clients Owing Payment (4 marks)
   Write a query that selects the client names, phone numbers, email addresses and total unpaid job costs of any clients who have a total (sum) of at least $1000 in unpaid jobs.  
   Order the results so that the largest amount owing is at the top.  Using your job view in this query is strongly recommended.

   Optional:  For an extra challenge, only include jobs that occurred over 1 month ago when determining the sum of unpaid jobs.  You can receive full marks for this query without doing this.
*/

-- Write Query 8 here
SELECT j.[Client Name], clientNo AS 'Phone Number', clientEmail AS 'Email', SUM(j.[Job Cost]) AS 'Total Owing'
FROM job_view AS j INNER JOIN Client AS c
ON j.clientTaxFileNo = c.clientTaxFileNo
WHERE j.jobPaid = 'N'
GROUP BY [Client Name], clientNo, clientEmail
HAVING SUM(j.[Job Cost]) > 1000
ORDER BY 'Total Owing' DESC;

