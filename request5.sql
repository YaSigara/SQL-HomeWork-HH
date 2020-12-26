SET search_path=jobfinder;
WITH first_response AS (
    SELECT
        area.area_id AS city,
        MIN(response.created_at - vacancy.created_at) OVER (PARTITION BY vacancy.area_id) AS min_interval
    FROM vacancy
    INNER JOIN response ON vacancy.vacancy_id = response.vacancy_id
    RIGHT JOIN area ON vacancy.area_id = area.area_id
    GROUP BY city,
             response.created_at,
             vacancy.created_at,
             vacancy.area_id)
SELECT
        area.name as region,
        coalesce(MIN(first_response.min_interval),'0') AS min_interval,
        coalesce(MAX(first_response.min_interval),'0') AS max_interval
FROM first_response
RIGHT JOIN area ON area.area_id=first_response.city
GROUP BY
         region,
         city
ORDER BY
         region;
