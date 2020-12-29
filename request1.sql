SELECT post AS vacancy_name,
       area.name AS area,
       employer.org_name AS employer
FROM vacancy
INNER JOIN area ON area.area_id=vacancy.area_id
INNER JOIN employer ON employer.employer_id=vacancy.employer_id
WHERE vacancy.compensation_from IS NULL
AND vacancy.compensation_to IS NULL
ORDER BY
         vacancy.created_at
LIMIT 10;
