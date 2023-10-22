-- Используйте уже существующую базу данных HR.

-- 1.Вывести job_id тех сотрудников, которые зарабатывают больше своего менеджера(прием SELF join) - tablica prisoedinaetsia k samoj sebe

use hr;
SELECT * FROM employees;
SELECT 
crew.job_id,
crew.employee_id
FROM employees crew
JOIN employees mng ON crew.manager_id = mng.employee_id
WHERE crew.salary > mng.salary;

-- 2.Вывести имя, фамилию и город сотрудников, которые работают в Seattle или Toronto (участвуют три таблицы)
SELECT * FROM locations;
SELECT 
t1.first_name, 
t1.last_name, 
t3.city
FROM employees t1
JOIN departments t2 ON t1.department_id = t2.department_id
JOIN locations t3 ON t2.location_id = t3.location_id
WHERE t3.city IN ('Seattle', 'Toronto');

-- 3.Вывести имя, фамилию, название департамента и название должности сотрудника(участвуют три таблицы)
SELECT 
t1.first_name, 
t1.last_name, 
t2.department_name, 
t3.job_title
FROM employees t1
JOIN departments t2 ON t1.department_id = t2.department_id
JOIN jobs t3 ON t1.job_id = t3.job_id;