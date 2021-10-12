SELECT cohorts.name, COUNT(students.id) AS total_students
FROM students
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING COUNT(students.id) >= 18
ORDER BY total_students;