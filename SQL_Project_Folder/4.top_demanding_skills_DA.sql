/*
Question: What are the top 5 demanding skills required for Data Analyst roles that are available remotely??
*/

SELECT
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
    job_postings_fact.job_work_from_home = TRUE
GROUP BY
    skills_dim.skills
ORDER BY
    skills_count DESC
LIMIT 5;
