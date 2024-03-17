/*****************************************************************************************************************
NAME:    Isaac McIntire
PURPOSE: My script purpose...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2022   JJAUSSI       1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- Q1: What should go here?
-- A1: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT GETDATE() AS my_date;

-- question 1 Me - 1.	How many products are available?

	SELECT COUNT(*) AS TotalProducts
         FROM Production.Product;
--Question 2 Me - 	How many Employees are there?

	SELECT COUNT(*) AS TotalEmployees
FROM HumanResources.Employee;

--Question 3 Austin baker -  Which of our Territories sold the most last year?

Select name,
TerritoryID,
SalesLastYear
from Sales.SalesTerritory t1
inner join
(
select Max(SalesLastYear) maxsales
from Sales.SalesTerritory
) t2
on t1.SalesLastYear =  t2.maxsales

--Musharib Mazher 4. How many employees are currently working in the Sales department?
SELECT COUNT(Distinct BusinessEntityId)
FROM Sales.SalesPerson

-- 5.John Dapay savage -  Which three Road Bikes generate the least net revenue per unit sold?
Select Top 3  ProductNumber , StandardCost, ListPrice as t1
from production.product
where ProductNumber like 'bk-R%44'
order by StandardCost desc 

--6  Chris Weiss how many employees do we have that are married
Select count  (maritalstatus) as MaritalCount
 from humanresources.Employee
where MaritalStatus = 'm'

--7 Jeanna Kremer - What employees have been at this business for more than 5 years list them in ascending order ?
Select Hiredate, firstname, Lastname 
from humanresources.Employee d
join person.person p on d.BusinessEntityID=p.BusinessEntityID
where (year(CURRENT_TIMESTAMP) - year(HireDate)>1)
order by HireDate asc

--8. jeAnna kremer can you list the tables within the manufcturing schema
   Select * from INFORMATION_SCHEMA.tables
   where TABLE_SCHEMA = 'Production'


