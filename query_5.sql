-- Знайти які курси читає певний викладач.

-- -- пошук за ім'ям викладача
-- SELECT 
--     t.fullname AS teacher_name,
--     sub.id AS subject_id,
--     sub.name AS subject_name
-- FROM subjects sub
-- JOIN teachers t ON sub.teacher_id = t.id
-- WHERE t.fullname = 'Amber Maynard'; -- обрати із таблиці teachers необхідне ім'я

-- пошук по id викладача

SELECT 
    t.fullname AS teacher_name,
    sub.id AS subject_id,
    sub.name AS subject_name
FROM subjects sub
JOIN teachers t ON sub.teacher_id = t.id
WHERE t.id = 2; -- вказати id викладача