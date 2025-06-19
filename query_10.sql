-- Список курсів, які певному студенту читає певний викладач.

SELECT DISTINCT
    s.fullname AS student_name,
    t.fullname AS teacher_name,
    sub.id AS subject_id,
    sub.name AS subject_name
FROM grades gr
JOIN students s ON gr.student_id = s.id
JOIN subjects sub ON gr.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
WHERE s.id = 5    -- id студента
  AND t.id = 2   -- id викладача
ORDER BY sub.name;
