-- Знайти студента із найвищим середнім балом з певного предмета.

SELECT 
    s.id,
    s.fullname,
    sub.name AS subject_name,
    ROUND(AVG(g.grade)) AS average_grade
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
WHERE g.subject_id = 1
GROUP BY s.id, s.fullname, sub.name
ORDER BY average_grade DESC
LIMIT 1;
