USE university_devcamp;

SELECT *
FROM grades;

-- average grade by each professor
SELECT professors_name, AVG(grades_value)
FROM professors, grades g
JOIN courses c
ON g.grades_courses_id = c.courses_id
GROUP BY professors_name;

-- top grade for each student
SELECT students_name, MAX(grades_value)
FROM students s
JOIN grades g
ON grades_students_id = students_id
GROUP BY students_name;

-- courses: challenging to easy
SELECT courses_name, AVG(grades_value)
FROM courses c
JOIN grades g
ON g.grades_courses_id = c.courses_id
GROUP BY courses_name
ORDER BY AVG(grades_value) DESC;

SELECT *
FROM addresses
WHERE addresses_city IN (
 SELECT addresses_city
 FROM addresses
 WHERE addresses_state = 'NY'
);

-- students by courses they're enrolled in
SELECT
	courses_name,
	courses_students_id_1 AS 'Student 1 id',
	courses_students_id_2 AS 'Student 2 id',
    courses_students_id_3 AS 'Student 3 id',
    courses_students_id_4 AS 'Student 4 id',
    courses_students_id_5 AS 'Student 5 id',
    courses_students_id_6 AS 'Student 6 id'
FROM courses;

SELECT
  guides_title,
  CASE
    WHEN guides_revenue > 1000 THEN 'Best Seller'
    WHEN guides_revenue < 600  THEN 'Not Displayed'
    ELSE 'Average Seller'
  END AS 'Status'
FROM guides;

-- comprehensive list of professor-student combinations
SELECT
	students_name,
    professors_name
FROM professors p
JOIN courses c
ON p.professors_id = c. courses_professors_id
RIGHT JOIN students s
ON s.students_id = c.courses_students_id_1
OR s.students_id = c.courses_students_id_2
OR s.students_id = c.courses_students_id_3
OR s.students_id = c.courses_students_id_4
OR s.students_id = c.courses_students_id_5
OR s.students_id = c.courses_students_id_6;