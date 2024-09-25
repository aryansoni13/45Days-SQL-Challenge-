# Write your MySQL query statement below
SELECT first_input.machine_id, ROUND(AVG(end_output.timestamp - first_input.timestamp), 3) AS processing_time FROM Activity AS first_input 
JOIN Activity AS end_output ON first_input.machine_id = end_output.machine_id 
AND first_input.process_id  = end_output.process_id 
AND first_input.activity_type != end_output.activity_type 
AND end_output.activity_type = 'end'
GROUP BY first_input.machine_id