/*
Question: What are the skills required for Top 10 highest-paying Data Analyst roles that are available remotely??
*/

WITH top_paying_jobs AS
(
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
LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN
    skills_job_dim
ON
    top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN
    skills_dim
ON
 skills_job_dim.skill_id= skills_dim.skill_id
 ;