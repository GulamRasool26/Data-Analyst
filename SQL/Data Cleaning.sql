-- Data Cleaning 

SELECT *
FROM layoffs;
#steps for Data Cleaning 
-- 1.Remove duplicate
-- 2. Standarize the Data
-- 3. Null Values or Blank Values
-- 4. Remove Any Columns

#don't make changes in raw data
CREATE TABLE layoff_staging
LIKE layoffs;
#checking Columns
SELECT *
FROM layoff_staging;
#Copying Data from original table
INSERT INTO layoff_staging
select * 
from layoffs;

-- 1. Removing Duplicates
SELECT *,
ROW_NUMBER () over(PARTITION BY company,industry,total_laid_off,percentage_laid_off,`date`) AS row_num
FROM layoff_staging;
#using CTE TO CHECK DUPLICATE
WITH duplicate_cte as 
(SELECT *,
ROW_NUMBER () over(PARTITION BY company,location,industry,
total_laid_off,percentage_laid_off,`date`
,stage,country,funds_raised_millions) AS row_num
FROM layoff_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;
#SEPARATE TABLE WITH ROW NUMBER
select * 
from layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER () over(PARTITION BY company,location,industry,
total_laid_off,percentage_laid_off,`date`
,stage,country,funds_raised_millions) AS row_num
FROM layoff_staging;

#FIND DUPLICATE IN THE NEW TABLE USING ROW NUM
select * 
from layoffs_staging2
WHERE row_num > 1;
#REMOVING DUPLIACTE
DELETE
from layoffs_staging2
WHERE row_num > 1;

-- 2.standarize VALUES 
#CHECKING COMPANY VALUES
SELECT company
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

#CHECKING INDUSTRY
SELECT distinct(industry)
FROM layoffs_staging2
order by 1;

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

#CHECKING Country
SELECT distinct(country)
FROM layoffs_staging2
order by 1;

UPDATE layoffs_staging2
SET country = TRIM(trailing  '.' FROM country)
WHERE country LIKE 'United States%';

#Checking Date format
SELECT `date`
FROM layoffs_staging2;

UPDATE layoffs_staging2
set `date` = str_to_date(`date`,'%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY column `date` DATE;

#updating NULL VALUES
SELECT *
FROM layoffs_staging2
WHERE industry is NULL 
OR industry = '';

SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	on t1.company = t2.company
WHERE (t1.industry IS NULL or t1.industry = '') 
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2
SET industry = NULL 
where industry = '';
UPDATE layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL) 
AND t2.industry IS NOT NULL;

-- 3. Removing Null Values
SELECT * 
FROM layoffs_staging2
WHERE total_laid_off is NULL
AND percentage_laid_off is null;

DELETE 
FROM layoffs_staging2
WHERE total_laid_off is NULL
AND percentage_laid_off is null;

-- 4. UNNECESSARY COLUMNS
alter table layoffs_staging2
DROP COLUMN row_num;

select *
from layoffs_staging2;

-- Data is Cleaned Now
