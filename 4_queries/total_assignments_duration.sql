SELECT day, COUNT(id), SUM(duration)
FROM assignments
GROUP BY day
ORDER BY day;