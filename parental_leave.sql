--SELECT TOP(10)*
--FROM gender;

SELECT TOP(10)*
FROM mat;

-- Which country has the greatest pay disparity, historically?
SELECT TOP(1) Country, AVG(Value) AS avg_value
FROM gender
GROUP BY Country
ORDER BY avg_value DESC;
-- Korea

-- The smallest disparity?
SELECT TOP(1) Country, AVG(Value) AS avg_value
FROM gender
GROUP BY Country
ORDER BY avg_value ASC;
-- Slovenia

-- And which country has the most weeks of maternity leave in 2022?
SELECT TOP(1)*
FROM mat
WHERE IND = 'EMP18_MAT'
AND TIME = '2022'
ORDER BY Value DESC;
-- The UK has a whole year!

--And which country has the least?
SELECT TOP(1)*
FROM mat
WHERE IND = 'EMP18_MAT'
AND TIME = '2022'
ORDER BY Value ASC;
-- The US has none.

-- Let's look at the pay disparity among the top 10 countries for maternity leave in 2022.
SELECT TOP(10) g.Country, AVG(g.Value) AS wage_gap_pct, mat.Value AS wks_leave
FROM gender AS g
JOIN mat
ON g.Country = mat.Country
WHERE g.TIME = '2022'
AND g.IND = 'EMP9_5'
AND mat.IND = 'EMP18_MAT'
GROUP BY g.Country, mat.Value
ORDER BY mat.Value DESC;

SELECT TOP(10) *
FROM mat
WHERE TIME = '2022'
AND IND = 'EMP18_MAT'
ORDER BY Value DESC;

SELECT TOP(10)*
FROM mat;