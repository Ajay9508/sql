-- CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
--  BEGIN RETURN (
--  SELECT DISTINCT salary FROM Employee
--   ORDER BY salary DESC 
--   LIMIT N-1, 1 
--   ); 
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    # Write your MySQL query statement below.
    SELECT salary FROM (
      SELECT salary,
             DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
      FROM Employee
    ) t
    WHERE rnk = N
    LIMIT 1
  );
END;