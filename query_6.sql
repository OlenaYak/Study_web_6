-- Знайти список студентів у певній групі.

-- -- по назві групи
-- SELECT 
--     s.id AS student_id,
--     s.fullname AS student_name,
--     g.name AS group_name
-- FROM students s
-- JOIN groups g ON s.group_id = g.id
-- WHERE g.name = 'case' -- назів із таблиці groups
-- ORDER BY s.fullname;

-- по group_id

SELECT 
    s.id AS student_id,
    s.fullname AS student_name,
    g.name AS group_name
FROM students s
JOIN groups g ON s.group_id = g.id
WHERE s.group_id = 1
ORDER BY s.fullname;