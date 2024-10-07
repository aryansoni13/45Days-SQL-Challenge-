# Write your MySQL query statement below
SELECT employee_id, department_id
FROM (
    SELECT e1.employee_id, e1.department_id
    FROM Employee e1
    WHERE e1.primary_flag = 'Y'
    
    UNION ALL
    
    SELECT e2.employee_id, e2.department_id
    FROM Employee e2
    WHERE e2.employee_id NOT IN (
        SELECT employee_id
        FROM Employee
        WHERE primary_flag = 'Y'
    )
    AND e2.primary_flag = 'N'
    AND (
        SELECT COUNT(*)
        FROM Employee e3
        WHERE e3.employee_id = e2.employee_id
    ) = 1  
) AS ResultSet
ORDER BY employee_id;
