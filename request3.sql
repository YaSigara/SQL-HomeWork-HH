WITH response_counter AS (
    SELECT
        employer_id,
        count(response_id)  AS count
    FROM vacancy
RIGHT JOIN response ON response.vacancy_id = vacancy .vacancy_id
    GROUP BY vacancy .vacancy_id
)
SELECT
    org_name,
    coalesce(rc.count,0) AS count
FROM employer
LEFT JOIN response_counter AS rc ON rc.employer_id = employer.employer_id
ORDER BY
         count  DESC,
         org_name ASC
LIMIT 5;
