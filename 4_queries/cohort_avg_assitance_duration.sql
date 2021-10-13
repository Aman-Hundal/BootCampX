SELECT AVG(total_duration) AS avg_total_duration
FROM (
SELECT cohorts.name, SUM(completed_at-started_at) AS total_duration
FROM assistance_requests
JOIN students ON student_id = students.id -- its accessing students taable from the join
JOIN cohorts ON cohort_id = cohorts.id -- its accessing cohorts table from the join
GROUP BY cohorts.name
ORDER BY total_duration
) AS total_durations; -- THIS CREATES A NEW TABLE WITH ALL THE SUMS of the cohort durations as rows with a total_duration column 
-- this is called total_durations which is passed into first select as a column summing the result of the avg
-- the code is saying SELECT AVG (total_durations) FROM (NEW TABLE COLUMN)


--use a select within a select when you want to modfiy/math the data two plus times. 

