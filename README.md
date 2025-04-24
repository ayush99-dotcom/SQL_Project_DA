## 🧼 SQL Project - Data Analysis on Remote Data Analyst Roles

This project involves analyzing job postings for Data Analyst roles available remotely, using SQL queries. The dataset includes various tables that provide detailed information about companies, job postings, and skills required for Data Analyst roles. The goal of the project is to extract valuable insights such as the highest-paying roles, the most common skills, and the companies offering remote Data Analyst positions.

## Project Overview

This project explores the top Data Analyst roles available remotely by analyzing job postings and the required skills using a PostgreSQL database. Key insights are derived by identifying the highest-paying roles, the most in-demand skills, and the companies hiring remote Data Analysts. The analysis focuses specifically on remote opportunities, aiming to provide a comprehensive view of the data analyst job market.

## Database Schema

The database is structured into the following tables:

- **company_dim**: Contains information about companies, including company ID, name, website link, and thumbnail image.
- **skills_dim**: Contains information about different skills required for various job positions, including skill ID, skill name, and type.
- **job_postings_fact**: Contains detailed job postings data such as job ID, company ID, job title, job location, salary details, and job requirements.
- **skills_job_dim**: A bridge table that links job postings to the required skills using job ID and skill ID as a composite primary key.

## SQL Queries

The following SQL queries were used to analyze the data:

1. **Top 10 Highest-Paying Data Analyst Roles Available Remotely**  
   This query retrieves the highest-paying Data Analyst roles that offer remote work opportunities.

2. **Top 10 Highest-Paying Data Analyst Roles Available Remotely with Company Name**  
   This query provides insights into the highest-paying remote Data Analyst roles along with the company offering the position.

3. **Skills Required for Top 10 Highest-Paying Data Analyst Roles Available Remotely**  
   This query identifies the skills required for the top 10 highest-paying remote Data Analyst roles.

4. **Top 5 Demanding Skills for Data Analyst Roles Available Remotely**  
   This query identifies the top 5 most commonly required skills for remote Data Analyst positions.

5. **Top 10 Highest-Paying Skills Required for Data Analyst Roles Available Remotely**  
   This query focuses on the highest-paying skills required for remote Data Analyst roles.

6. **Optimal Skills to Learn for Data Analyst Roles Available Remotely**  
   This query identifies the most frequently required skills for remote Data Analyst roles, suggesting the optimal skills to learn for job seekers.