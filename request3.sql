set search_path=jobfinder;
SELECT
    DISTINCT employer.org_name AS organisation,
    COUNT(response.vacancy_id) OVER (PARTITION BY vacancy.employer_id) AS response_count
FROM employer
INNER JOIN vacancy ON vacancy.employer_id=employer.employer_id
INNER JOIN response ON vacancy.vacancy_id=response.vacancy_id
GROUP BY
    organisation,
    response.vacancy_id,
    vacancy.employer_id
ORDER BY
    response_count DESC,
    organisation ASC
LIMIT 5;