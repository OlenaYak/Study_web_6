-- Знайти список курсів, які відвідує студент.

SELECT DISTINCT
    s.fullname AS student_name,
    sub.id AS subject_id,
    sub.name AS subject_name
FROM grades gr
JOIN subjects sub ON gr.subject_id = sub.id
JOIN students s ON gr.student_id = s.id
WHERE s.id = 5
ORDER BY sub.name;