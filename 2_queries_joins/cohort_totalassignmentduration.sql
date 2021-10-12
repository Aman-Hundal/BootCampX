SELECT SUM(assignment_submissions.duration) AS total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id -- joins assignment_submissions table to students table based on student id matches
JOIN cohorts ON cohort_id = cohorts.id -- joins cohorts table to student+assignment_submission table based on cohort id matches (which the assignemnt submission table got data on with the above joining.)
WHERE cohorts.name = 'FEB12';