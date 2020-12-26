SET search_path=jobfinder;
WITH vacancy_counter AS (
    SELECT
        vacancy.employer_id,
        count(vacancy.vacancy_id) AS vacancy_count
    FROM employer
    INNER JOIN vacancy ON vacancy.employer_id = employer.employer_id
    GROUP BY
             vacancy.employer_id
    ORDER BY
             vacancy_count
)
SELECT
    percentile_cont(0.5) WITHIN GROUP (ORDER BY vacancy_count) AS median_count
FROM vacancy_counter;
