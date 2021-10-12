SELECT students.name AS student, AVG(assignment_submissions.duration) AS avg_assignment_duration, AVG(assignments.duration) AS avg_est_duration
FROM students
JOIN assignment_submissions ON students.id = student_id -- this will help access avg assignment completion time for submitted assignments by each student
JOIN assignments ON assignment_submissions.assignment_id = assignments.id -- this will help access AVG expected duration for assignements for each submittied assignment by each student
WHERE students.end_date IS NULL
GROUP BY student
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY avg_assignment_duration ASC;