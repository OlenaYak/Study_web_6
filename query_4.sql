-- Знайти середній бал на потоці (по всій таблиці оцінок).

SELECT 
    ROUND(AVG(grade), 2) AS average_grade_overall
FROM grades;