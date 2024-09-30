/*
Question 1: Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
The CITY table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/
SELECT *
FROM CITY
WHERE POPULATION > 100000
AND COUNTRYCODE = 'USA';

/*
Question 2: Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
The CITY table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/
SELECT name
FROM CITY
WHERE population >120000
AND CountryCode = 'USA';

/*
Question 3: Query all columns (attributes) for every row in the CITY table.
The CITY table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/
SELECT * FROM CITY;

/*
Question 4: Query all columns for a city in CITY with the ID 1661.
The CITY table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/
SELECT * FROM CITY WHERE ID = 1661;

/*
Question 5: Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
The CITY table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/
SELECT * FROM CITY WHERE CountryCode = 'JPN';

/*
Question 6: Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
The CITY table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/
SELECT name FROM CITY WHERE CountryCode = 'JPN';

/*
Question 7: Query a list of CITY and STATE from the STATION table.
The STATION table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT CITY, STATE FROM STATION;

/*
Question 8: Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
The STATION table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT DISTINCT CITY FROM STATION WHERE MOD(ID, 2) = 0;

/*
Question 9: Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
The STATION table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT (COUNT(CITY) - COUNT(DISTINCT(CITY))) cn FROM STATION;

/*
Question 10: Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
The STATION table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT q1.CITY, q1.citylength
FROM
(SELECT CITY, LENGTH(CITY) AS citylength,
RANK() OVER(PARTITION BY LENGTH(CITY) ORDER BY LENGTH(CITY), CITY) AS actualrank
FROM STATION) AS q1
WHERE q1.actualrank = 1
    AND q1.citylength = (SELECT MIN(LENGTH(CITY)) FROM STATION)
    OR q1.citylength = (SELECT MAX(LENGTH(CITY)) FROM STATION);

/*
Question 11: Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
Input Format
The STATION table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT DISTINCT CITY
FROM STATION
WHERE lower(substr(CITY,1,1)) in ('a','e','i','o','u');

/*
Question 12: Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
Input Format
The STATION table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT DISTINCT city FROM   station 
WHERE  city  LIKE '%a' 
or  city  LIKE '%e' 
or city  LIKE '%i' 
or city  LIKE '%o' 
or city  LIKE '%u';

/*
Question 13: Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
Input Format
The STATION table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT DISTINCT 
CITY 
FROM STATION 
WHERE lower(substr(CITY,1,1)) in ('a','e','i','o','u') 
AND RIGHT(CITY,1) IN ('a', 'e', 'i', 'o', 'u');

/*
Question 14: Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
Input Format
The STATION table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT distinct CITY
from STATION 
WHERE lower(substr(city,1,1) NOT IN ('a','e','i','o','u'));

/*
Question 15: Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
Input Format
The STATION table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT DISTINCT CITY
FROM STATION 
WHERE LOWER(SUBSTR(CITY, LENGTH(CITY), LENGTH(CITY)) NOT IN ('a','e','i','o','u'));

/*
Question 16: Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
Input Format
The STATION table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT DISTINCT 
CITY 
FROM STATION 
WHERE lower(substr(CITY,1,1)) NOT in ('a','e','i','o','u') 
OR RIGHT(CITY,1) NOT IN ('a', 'e', 'i', 'o', 'u');

/*
Question 17: Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
Input Format
The STATION table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT DISTINCT 
CITY 
FROM STATION 
WHERE lower(substr(CITY,1,1)) NOT in ('a','e','i','o','u') 
AND RIGHT(CITY,1) NOT IN ('a', 'e', 'i', 'o', 'u');

/*
Question 18: Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
Input Format
The STUDENTS table is described as follows:
The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.
https://s3.amazonaws.com/hr-challenge-images/12896/1443815243-94b941f556-1.png
*/
SELECT NAME 
FROM STUDENTS 
WHERE MARKS > 75 
ORDER BY RIGHT(NAME, 3), ID ASC;

/*
Question 19: Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
Input Format
The Employee table containing employee data for a company is described as follows:
where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.
https://s3.amazonaws.com/hr-challenge-images/19629/1458557872-4396838885-ScreenShot2016-03-21at4.27.13PM.png
*/
SELECT name
FROM Employee
ORDER BY name ASC;

/*
Question 20: Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months.
Sort your result by ascending employee_id.
Input Format
The Employee table containing employee data for a company is described as follows:
where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.
https://s3.amazonaws.com/hr-challenge-images/19629/1458557872-4396838885-ScreenShot2016-03-21at4.27.13PM.png
*/
SELECT name 
FROM Employee
WHERE salary > 2000 AND months < 10;

/*
Question 21: Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
Input Format
The TRIANGLES table is described as follows:
Each row in the table denotes the lengths of each of a triangle's three sides.
https://s3.amazonaws.com/hr-challenge-images/12887/1443815629-ac2a843fb7-1.png
*/
SELECT 
    CASE 
        WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
    END AS TriangleType
FROM TRIANGLES;

/*
Question 22: Query a count of the number of cities in CITY having a Population larger than 100,000.
Input Format
The CITY table is described as follows: 
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/
SELECT COUNT(Name)
FROM CITY
WHERE Population > 100000;

/*
Question 23: Query the total population of all cities in CITY where District is California.
Input Format
The CITY table is described as follows: 
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/
SELECT SUM(Population)
FROM CITY
WHERE District = 'California';

/*
Question 24: Query the average population of all cities in CITY where District is California.
Input Format
The CITY table is described as follows: 
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/
SELECT AVG(Population)
FROM CITY
WHERE District = 'California';

/*
Question 25: Query the average population for all cities in CITY, rounded down to the nearest integer.
Input Format
The CITY table is described as follows: 
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/
SELECT ROUND(AVG(Population))
FROM CITY;

/*
Question 26: Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
Input Format
The CITY table is described as follows: 
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/
SELECT SUM(Population)
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/*
Question 27: Query the difference between the maximum and minimum populations in CITY.
Input Format
The CITY table is described as follows: 
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/
SELECT (MAX(Population) - MIN(Population)) AS Difference
FROM CITY;

/*
Question 28: Query the following two values from the STATION table:
1. The sum of all values in LAT_N rounded to a scale of 2 decimal places.
2. The sum of all values in LONG_W rounded to a scale of 2 decimal places.
Input Format
The STATION table is described as follows:
where LAT_N is the northern latitude and LONG_W is the western longitude.
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT ROUND(SUM(LAT_N),2) AS Lat_N, ROUND(SUM(LONG_W),2) AS Long_N
FROM STATION;

/*
Question 29: Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38,7880 and less than 137,2345. Truncate your answer to 4 decimal places.
Input Format
The STATION table is described as follows:
where LAT_N is the northern latitude and LONG_W is the western longitude.
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT TRUNCATE(SUM(LAT_N),4) 
FROM STATION 
WHERE LAT_N < 137.2345 AND LAT_N > 38.7880;

/*
Question 30: Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137,2345. Truncate your answer to 4 decimal places.
Input Format
The STATION table is described as follows:
where LAT_N is the northern latitude and LONG_W is the western longitude.
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

/*
Question 31: Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137,2345. Round your answer to 4 decimal places.
Input Format
The STATION table is described as follows:
where LAT_N is the northern latitude and LONG_W is the western longitude.
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

/*
Question 32: Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38,7880. Round your answer to 4 decimal places.
Input Format
The STATION table is described as follows:
where LAT_N is the northern latitude and LONG_W is the western longitude.
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT ROUND(LAT_N, 4)
FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N
LIMIT 1;

/*
Question 33: Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38,7880. Round your answer to 4 decimal places.
Input Format
The STATION table is described as follows:
where LAT_N is the northern latitude and LONG_W is the western longitude.
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N
LIMIT 1;

/*
Question 34: Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
Input Format
The CITY and COUNTRY tables are described as follows: 
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
https://s3.amazonaws.com/hr-challenge-images/8342/1449769013-e54ce90480-Country.jpg
*/
SELECT SUM(CITY.population)
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
WHERE CONTINENT = 'Asia';

/*
Question 35: Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
Input Format
The CITY and COUNTRY tables are described as follows: 
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
https://s3.amazonaws.com/hr-challenge-images/8342/1449769013-e54ce90480-Country.jpg
*/
SELECT CITY.name
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
WHERE CONTINENT = 'Africa';

/*
Question 36: Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
Input Format
The CITY and COUNTRY tables are described as follows: 
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
https://s3.amazonaws.com/hr-challenge-images/8342/1449769013-e54ce90480-Country.jpg
*/
SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population))
FROM COUNTRY
JOIN CITY ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;

/*
Question 37: Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after completing the calculation. 
She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.
Input Format
The EMPLOYEES table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/12893/1443817108-adc2235c81-1.png
*/
SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', ''))) AS MisCalSalary
FROM EMPLOYEES;

/*
Question 38: We define an employee's total earnings to be their monthly salary*months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table.
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.
Input Format
The Employee table containing employee data for a company is described as follows:
where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is the their monthly salary.
https://s3.amazonaws.com/hr-challenge-images/19629/1458557872-4396838885-ScreenShot2016-03-21at4.27.13PM.png
*/
SELECT salary*months, COUNT(*)
FROM Employee
GROUP BY salary*months
ORDER BY salary*months DESC
LIMIT 1;

/*
Question 39: P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
* * * * * 
* * * * 
* * * 
* * 
*
Write a query to print the pattern P(20).
*/
DECLARE @var int
SELECT @var = 20
WHILE @var > 0
    BEGIN
     PRINT replicate('* ', @var)
     SET @var = @var - 1
    END

/*
Question 40: P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20).
*/
DECLARE @var int
SELECT @var = 1
WHILE @var < 21
    BEGIN 
        PRINT replicate('* ', @var)
        SET @var += 1
    END

/*
Question 41: Generate the following two result sets:
Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name.
If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.
Input Format
The OCCUPATIONS table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/12889/1443816414-2a465532e7-1.png
Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.
*/
SELECT CONCAT(name, '(', UPPER(LEFT(occupation, 1)), ')') AS NameOccupation
FROM OCCUPATIONS
ORDER BY name ASC;
SELECT CONCAT('There are a total of ', COUNT(occupation), ' ', LOWER(occupation), 's.') AS OccupationCount
FROM OCCUPATIONS
GROUP BY occupation
ORDER BY COUNT(occupation) ASC, occupation ASC;

/*
Question 42: Consider P1(a.b) and P2(c,d) to be two points on a 2D plane.

 a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 b happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.
Input Format
The STATION table is described as follows:
where LAT_N is the northern latitude and LONG_W is the western longitude.
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT ROUND(ABS((MIN(LAT_N)-MAX(LAT_N))+(MIN(LONG_W)-MAX(LONG_W))), 4)
FROM STATION;

/*
Question 43: Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the
respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

Input Format
The STATION table is described as follows:
where LAT_N is the northern latitude and LONG_W is the western longitude.
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg
*/
SELECT ROUND(SQRT(POWER(MIN(LAT_N)-MAX(LAT_N), 2)+POWER(MIN(LONG_W)-MAX(LONG_W), 2)), 4)
FROM STATION;
