SELECT cohorts.name, AVG(completed_at - started_at) AS avg_assistance_request_duartion
FROM assistance_requests
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY avg_assistance_request_duartion;