-- Exploratory Data Analysis

#viewing cleaned Data First
SELECT *
FROM layoffs_staging2;

#checking the maximum laid_off and percentage
SELECT MAX(total_laid_off),MAX(percentage_laid_off)
FROM layoffs_staging2;

#Checking 100% laid_off companies 
#seems unnecessary so total no of employees are not given 
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

#checking sum of laid_off for each company
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
Order By 2 DESC;

#checking the timespan of the data
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

#Checking which Sum of laid_off in each country 
SELECT country , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country 
ORDER BY 2 DESC;

#Checking some laid_off in each year
SELECT year(`date`) , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Year(`date`)
ORDER BY 2 DESC;

#Checking sum of laid_off for each stage
SELECT stage , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

#Checking sum of laid_off for every month
SELECT substring(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE substring(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
Order By 1 Asc;

#find rolling total for every year and its each month
WITH ROLLING_TOTAL AS 
(
SELECT substring(`date`,1,7) AS `MONTH`, SUM(total_laid_off) as total_off
FROM layoffs_staging2
WHERE substring(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
Order By 1 Asc
)
select `MONTH` , total_off,
sum(total_off) OVER(ORDER by `MONTH`) AS rolling
FROM ROLLING_TOTAL;

#Checking Sum of total laid_off of every company in each year
SELECT company,YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
ORDER BY 3 DESC;

#ranking of Company with the laid_off for every year
WITH Company_Year (company, years, total_laid_off) AS 
(
SELECT company,YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
),Company_ranking as 
(
SELECT *, 
DENSE_RANK() OVER(partition by years ORDER BY total_laid_off DESC) AS ranking
FROM Company_Year
WHERE years is not NULL
)
Select *
FROM Company_Ranking
WHERE ranking <=5;