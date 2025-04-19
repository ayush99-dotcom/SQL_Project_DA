/*
Question: What are the top 10 highest-paying Data Analyst roles that are avaible remotely??
*/

 
SELECT 
    job_id,
    job_title_short,
    job_title,
    job_location,
    job_work_from_home,
    job_posted_date,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_title_short= 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL 
    AND
    job_work_from_home= TRUE
ORDER BY
    salary_year_avg DESC
LIMIT 10;