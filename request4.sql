SET search_path=jobfinder;
SELECT
    employer.org_name AS company,
    percentile_cont(0.5) WITHIN GROUP ( ORDER BY vacancy_id ) AS median_count
FROM vacancy
INNER JOIN employer ON vacancy.employer_id = employer.employer_id
GROUP BY company;
