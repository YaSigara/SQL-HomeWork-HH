set search_path=jobfinder;
SELECT
    AVG(
CASE WHEN(compensation_gross IS TRUE)
THEN compensation_from
ELSE compensation_from/87*100 END)
AS min_avg_compensation,
    AVG(
CASE WHEN (compensation_gross IS TRUE)
THEN compensation_to
ELSE compensation_to / 87 * 100 END) AS max_avg_compensation,
    AVG(
CASE WHEN(compensation_gross IS TRUE)
THEN ((compensation_to + compensation_from)/2)
ELSE ((compensation_to + compensation_from)/2)/87*100 END) AS mid_avg_compensation
FROM vacancy;