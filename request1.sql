SET search_path=jobfinder;
SELECT post.post_name,
       area.area_name,
       employer.org_name
FROM post
INNER JOIN vacancy ON post.post_id = vacancy.post_id
INNER JOIN area ON area.area_id=vacancy.aria_id
INNER JOIN employer ON employer.employer_id=vacancy.employer_id
WHERE vacancy.compensation_from IS NULL
AND vacancy.compensation_to IS NULL
ORDER BY vacancy.created_at
LIMIT 10;
