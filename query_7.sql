-- Знайти оцінки студентів у окремій групі з певного предмета.

SELECT 
    s.id AS student_id,
    s.fullname AS student_name,
    g.name AS group_name,
    sub.name AS subject_name,
    gr.grade,
    gr.grade_date
FROM grades gr
JOIN students s ON gr.student_id = s.id
JOIN groups g ON s.group_id = g.id
JOIN subjects sub ON gr.subject_id = sub.id
WHERE s.group_id = 1
  AND gr.subject_id = 2
ORDER BY s.fullname, gr.grade_date;