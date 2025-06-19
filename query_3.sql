-- Знайти середній бал у групах з певного предмета.

SELECT 
    g.id AS group_id,
    g.name AS group_name,
    ROUND(AVG(gr.grade), 2) AS average_grade
FROM grades gr
JOIN students s ON gr.student_id = s.id
JOIN groups g ON s.group_id = g.id
WHERE gr.subject_id = 1  -- Замінити на потрібний subject_id
GROUP BY g.id, g.name
ORDER BY average_grade DESC;