-- Sales by department and region
SELECT 
    e.department,
    s.region,
    COUNT(s.sale_id) AS sale_count,
    SUM(s.sale_amount) AS total_sales
FROM employees e
JOIN sales s ON e.id = s.employee_id
GROUP BY e.department, s.region;

-- Employee count by department and hire year
SELECT 
    department,
    YEAR(hire_date) AS hire_year,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department, YEAR(hire_date);
