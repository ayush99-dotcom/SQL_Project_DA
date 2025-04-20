/*
Question: What are the optimal skills to learn for Data Analyst roles that are available remotely??
*/

/* use of CTE */
WITH demanding_skills AS
(
 SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS skills_count

FROM
job_postings_fact
INNER JOIN
    skills_job_dim
ON
    job_postings_fact.job_id= skills_job_dim.job_id
INNER JOIN
    skills_dim
ON
    skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short='Data Analyst'
    AND
    job_postings_fact.salary_year_avg IS NOT NULL
    AND
    job_postings_fact.job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
)
,highest_paying AS
(
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    ROUND(AVG(job_postings_fact.salary_year_avg),2) as Average_Salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
ON
    job_postings_fact.job_id= skills_job_dim.job_id
INNER JOIN
    skills_dim
ON
    skills_job_dim.skill_id= skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short='Data Analyst'
    AND
    job_postings_fact.salary_year_avg IS NOT NULL
    AND
    job_postings_fact.job_work_from_home= TRUE
GROUP BY 
    skills_dim.skill_id
)


SELECT
    demanding_skills.skill_id,
    demanding_skills.skills,
    demanding_skills.skills_count,
    highest_paying.Average_Salary
FROM
    demanding_skills
INNER JOIN
    highest_paying
ON
    demanding_skills.skill_id= highest_paying.skill_id
WHERE
    demanding_skills.skills_count>10
ORDER BY
    highest_paying.Average_Salary DESC,
     demanding_skills.skills_count DESC
LIMIT 10;


/*Alternative Method */


SELECT
  skills_dim.skill_id,
  skills_dim.skills,
  COUNT(job_postings_fact.job_id) AS skillss_count,
  ROUND(AVG(job_postings_fact.salary_year_avg),2) AS Averagee_Salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
ON
    skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short ='Data Analyst'
    AND
    job_postings_fact.salary_year_avg IS NOT NULL
    AND
    job_postings_fact.job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
   COUNT(job_postings_fact.job_id)>10
ORDER BY
    Averagee_Salary DESC,
    skillss_count DESC
LIMIT 10;