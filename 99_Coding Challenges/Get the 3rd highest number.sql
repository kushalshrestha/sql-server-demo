-- Question: Find the 3rd highest record. Here's the input record
select Amount
from tblTransaction
where Amount <=100
order by Amount desc;

-- Solution 1
SELECT TOP 1 Amount
FROM (
  SELECT DISTINCT TOP 3 Amount
  FROM tblTransaction
  WHERE Amount <=100
  ORDER BY Amount DESC
) AS Subquery
ORDER BY Amount ASC;
-- 99.05

-- Solution 2
SELECT Amount
FROM (
  SELECT Amount, DENSE_RANK() OVER (ORDER BY Amount DESC) AS RowNum
  FROM tblTransaction
  WHERE Amount <= 100
) AS Subquery
WHERE RowNum = 3;
-- 99.05


-- Solution 3
SELECT DISTINCT e1.Amount
FROM (select * from tblTransaction where Amount <= 100) e1
LEFT JOIN (select * from tblTransaction where Amount <= 100) e2 ON e1.Amount <= e2.Amount
GROUP BY e1.Amount
HAVING COUNT(DISTINCT e2.Amount) = 3;


SELECT DISTINCT e1.Amount, count(DISTINCT e2.Amount)
FROM (select * from tblTransaction where Amount <= 100) e1
LEFT JOIN (select * from tblTransaction where Amount <= 100) e2 
ON e1.Amount <= e2.Amount
GROUP BY e1.Amount
HAVING COUNT(DISTINCT e2.Amount) = 3
ORDER BY e1.Amount DESC;


