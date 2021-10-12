SELECT students.name AS student, AVG(assignment_submissions.duration) AS avg_assignment_duration
FROM students
JOIN assignment_submissions ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY student
ORDER BY avg_assignment_duration DESC;