/*
Question: What are the top 10 highest-paying Data Analyst roles that are available remotely with the company name??
*/


SELECT 
    job_id,
    name AS Company_Name,
    job_title,
    job_work_from_home,
    job_posted_date,
    salary_year_avg
FROM
    job_postings_fact AS table1
LEFT JOIN
     company_dim AS table2
ON
    table1.company_id=table2.company_id
WHERE
    job_title_short= 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL 
    AND
    job_work_from_home= TRUE
ORDER BY
    salary_year_avg DESC
LIMIT 10;

