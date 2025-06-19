-- Знайти середній бал, який ставить певний викладач зі своїх предметів.

-- -- за іменем
-- SELECT 
--     t.fullname AS teacher_name,
--     sub.id AS subject_id,
--     sub.name AS subject_name,
--     ROUND(AVG(gr.grade), 2) AS average_grade_per_subject, -- середній бал по предмету
--     ROUND(AVG(AVG(gr.grade)) OVER (), 2) AS overall_average_grade -- середній бал загально по всім педметам
-- FROM teachers t
-- JOIN subjects sub ON sub.teacher_id = t.id 
-- JOIN grades gr ON gr.subject_id = sub.id  
-- WHERE t.fullname = 'Sandra Duran'
-- GROUP BY t.fullname, sub.id, sub.name
-- ORDER BY average_grade_per_subject DESC;

-- по id викладача
SELECT 
    t.fullname AS teacher_name,
    sub.id AS subject_id,
    sub.name AS subject_name,
    ROUND(AVG(gr.grade), 2) AS average_grade_per_subject,
    ROUND(AVG(AVG(gr.grade)) OVER (), 2) AS overall_average_grade
FROM teachers t
JOIN subjects sub ON sub.teacher_id = t.id
JOIN grades gr ON gr.subject_id = sub.id
WHERE t.id = 2  -- вказати id викладача
GROUP BY t.fullname, sub.id, sub.name
ORDER BY average_grade_per_subject DESC;