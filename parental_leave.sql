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

-- Which 10 countries have the most weeks of maternity leave in 2022?
SELECT TOP(10) *
FROM mat
WHERE TIME = '2022'
AND IND = 'EMP18_MAT'
ORDER BY Value DESC;

-- And which 10 countries have the lowest average pay disparity between the sexes in 2022?
SELECT TOP(10) Country, AVG(Value) AS avg_wage_disparity
FROM gender
WHERE TIME = '2022'
GROUP BY Country
ORDER BY avg_wage_disparity ASC;
-- Looks like there are only 3 overlapping countries here.

-- Let's look at which countries are spending the highest percentage of their GDP on family benefits.
SELECT TOP (10) f.COU, f.percent_GDP, g.Country
FROM family_spending AS f
JOIN gender AS g
ON f.COU = g.COU
WHERE f.TIME = '2020'
GROUP BY f.COU, f.percent_GDP, g.Country
ORDER BY percent_GDP DESC;

SELECT TOP(10)*
FROM gender
WHERE TIME = '2020'
ORDER BY Value ASC;
-- There are, again, 3 countries overlapping in these categories.