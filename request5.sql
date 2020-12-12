set search_path=jobfinder;
SELECT
    area.area_name AS city,
    MIN(response.created_at - vacancy.created_at) AS min_innterval,
    MAX(response.created_at - vacancy.created_at) AS max_interval
FROM vacancy
INNER JOIN response ON vacancy.vacancy_id = response.vacancy_id
INNER JOIN area ON vacancy.aria_id = area.area_id
GROUP BY city;