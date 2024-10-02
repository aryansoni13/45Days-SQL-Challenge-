# Write your MySQL query statement below
SELECT Employee.name, Bonus.bonus FROM Employee 
LEFT JOIN Bonus on Employee.empID = Bonus.empID
WHERE bonus < 1000 OR bonus IS NULL