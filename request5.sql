WITH first_response AS (
    SELECT
        area.area_id AS city,
        MIN(response.created_at - vacancy.created_at) OVER (PARTITION BY response.vacancy_id, area.area_id) AS min_response
    FROM vacancy
    INNER JOIN response ON vacancy.vacancy_id = response.vacancy_id
    RIGHT JOIN area ON vacancy.area_id = area.area_id
             )
SELECT
        city,
        coalesce(MIN(first_response.min_response),'0') AS min_interval,
        coalesce(MAX(first_response.min_response),'0') AS max_interval
FROM first_response
RIGHT JOIN area ON area.area_id=first_response.city
GROUP BY
         city
ORDER BY
         city;
