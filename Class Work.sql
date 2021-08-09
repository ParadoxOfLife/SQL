
use Northwind

--1) display shipper info for each order including : order id, order date, required date, shipperid, shippername, date order supplied, difference in days between requireddate and shippeddate.
select OD.OrderID, ltrim(OrderDate)'Order_Date',ltrim(RequiredDate)'Required_Date',S.SupplierID,S.CompanyName,ShippedDate,day(O.RequiredDate - O.ShippedDate) 'Date_Diff_In_Days'

from Orders O,[Order Details] OD,Products P,Suppliers S

where     O.OrderID = OD.OrderID 
	  and OD.ProductID = P.ProductID 
	  and P.SupplierID = S.SupplierID
order by OrderID


--Show the first name, last name and telephone number for all the employees, except those
--who live in UK. 
Select  S.ShipperID,S.CompanyName, count(S.ShipperID) 'Number_Of_Orders'

from Orders O,Shippers S

where O.ShipVia = S.ShipperID

group by S.ShipperID,S.CompanyName


--1. Show the first name, last name and telephone number for all the employees, except those
--who live in UK. 
select FirstName,LastName,Country,LTRIM(HomePhone)

from Employees

where Country != 'UK'

--2. Show all product details for products whose unit price is greater than $10 and quantity in
--stock greater than 2. Sort by product price. 
Select ProductID,ProductName,UnitPrice,UnitsInStock

from Products

where UnitPrice > 10 and UnitsInStock > 2

order by UnitPrice desc

--3. Show the first name, last name and telephone number for the employees who started
--working in the company in 1992-1993. 

Select FirstName,LastName,LTRIM(HomePhone),year(HireDate)

from Employees

where year(HireDate) = 1992 or year(HireDate) = 1993

--4. Show the product name, Company name of the supplier and stock quantity of the products
--that have 15 or more items in stock and the Product name starts with B or C or M. 

select ProductName,CompanyName,UnitsInStock

from Products P,Suppliers S

where P.SupplierID = S.SupplierID
		and P.Discontinued = 0 
		and UnitsInStock > 15 
		and( ProductName like 'B%' or ProductName like 'C%' or ProductName like 'M%')

--5. Show all details for products whose Category Name is ' Meat/Poultry ' Or 'Dairy Products '.
--Sort them by product name. 

Select * 

from Products P,Suppliers S, Categories C

where P.SupplierID = S.SupplierID and P.CategoryID = C.CategoryID
				and (CategoryName like '%meat%' or CategoryName like '%Dairy%')
order by ProductName

--6. Show Category name, Product name and profit for each product (how much money the
--company will earn if they sell all the units in stock). Sort by the profit

Select CategoryName,ProductName,UnitPrice,UnitsInStock,UnitPrice * UnitsInStock 'Profit',Discontinued

From Categories C,Products P

Where C.CategoryID = P.CategoryID and UnitsInStock > 0 

order by Profit desc

--7. Show the Employees' first name, last name and Category Name of the products which they
--have sold (show each category once).

Select FirstName,LastName,CategoryName

From Employees E,Orders O, [Order Details] OD,Products P,Categories C

Where E.EmployeeID = O.EmployeeID 
	  and O.OrderID = OD.OrderID 
	  and OD.ProductID = P.ProductID
	  and P.CategoryID = C.CategoryID
group by  FirstName,LastName,CategoryName
order by FirstName

--8. Show the first name, last name, telephone number and date of birth for the employees who
--are aged older than 35. Order them by last name in descending order. 

Select FirstName,LastName,Ltrim(HomePhone)'Home_Phone',year(GETDATE()) - year(BirthDate) 'Age_Of_Employee'

From Employees

where year(GETDATE()) - year(BirthDate) >= 35

order by LastName desc

--9. Show each employee’s name, the product name for the products that he has sold and
--quantity that he has sold. 

Select FirstName,ProductName,count(ProductName)'Sold_Quantity'

From Employees E,Orders O, [Order Details] OD, Products P

Where E.EmployeeID = O.EmployeeID and O.OrderID = OD.OrderID and OD.ProductID = P.ProductID

group by FirstName,ProductName

order by FirstName

--10. Show for each order item – the customer name and order id, product name, ordered
--quantity, product price and total price (Ordered quantity * product price) and gap between
--ordered date and shipped date (the gap in days). Order by order id. 

Select OD.ProductID,C.CompanyName,OD.OrderID,P.ProductName,OD.Quantity,OD.UnitPrice * OD.Quantity 'Total Price',DATEDIFF(day,ShippedDate,RequiredDate)'Gap_In_Days'

From Orders O,[Order Details] OD,Customers C,Products P

Where C.CustomerID = O.CustomerID and O.OrderID = OD.OrderID and OD.ProductID = P.ProductID

order by OD.OrderID

--11. How much each customer paid for all the orders he had committed together?

Select C.CompanyName,sum(OD.Quantity*OD.UnitPrice) 'Total_Price'

From Customers C,Orders O, [Order Details] OD

where C.CustomerID = O.CustomerID and O.OrderID = OD.OrderID

group by C.CompanyName

--12. In which order numbers was the ordered quantity greater than 10% of the quantity in stock?

Select OD.OrderID,Quantity,UnitsInStock

From  [Order Details] OD,Products P

Where OD.ProductID = P.ProductID and (OD.Quantity) > (P.UnitsInStock*0.10)

order by UnitsInStock desc

--Answer 12 Part 2 without Unitinstock that are 0 (Can you clarify if zeros are needed or not)
Select OD.OrderID,Quantity,UnitsInStock

From  [Order Details] OD,Products P

Where OD.ProductID = P.ProductID and (OD.Quantity) > (P.UnitsInStock*0.10) and UnitsInStock !=0 --and UnitsInStock is not null 

order by UnitsInStock desc

--13. Show how many Employees live in each country and their average age. 

Select Country,Count(Country)'Nubmer_Of_Emp',avg(year(getdate())-year(BirthDate)) 'Avg_Age'

From Employees

group by Country

--14. What would be the discount for all the London customers (together), if after 5 days of gap 
--between the order date and shipping date they get a 5% discount per item they bought?

Select  C.City 'all_the_London_customers',floor(SUM (OD.Quantity * OD.UnitPrice * (0.05))) 'Discount_$'

From Customers C

inner join Orders O on C.CustomerID = O.CustomerID
inner join [Order Details] OD on O.OrderID = Od.OrderID


where C.City  like 'Lo%' and DATEDIFF(day,O.OrderDate,O.ShippedDate) >= 5

group by C.City


--15. Show the product id, name, stock quantity, price and total value (product price * stock 
--quantity) for products whose total bought quantity is greater than 500 items. 

Select  P.ProductID,ProductName,UnitsInStock,P.UnitPrice,P.UnitPrice*P.UnitsInStock 'Total_Value'

from Products P 
	inner join [Order Details] OD on OD.ProductID = P.ProductID
	inner join Orders O on OD.OrderID = O.OrderID

where P.Discontinued =0
group by P.ProductID,ProductName,UnitsInStock,P.UnitPrice
Having Sum(OD.Quantity) >= 500
Order by ProductID

--16. For each employee display the total price paid on all of his orders that hasn’t shipped yet

Select E.EmployeeID,E.FirstName,E.LastName,floor(sum(OD.Quantity*OD.UnitPrice))'Total_Price_Not_Shipped_Orders'

From Employees E
		right outer Join Orders O on E.EmployeeID = O.EmployeeID	
		inner join [Order Details] OD on O.OrderID = OD.OrderID

where O.ShippedDate is Null

group by E.EmployeeID,E.FirstName,E.LastName


--17. For each category display the total sales revenue, every year

Select C.CategoryID,C.CategoryName,year(O.OrderDate)'Year',Floor(sum(OD.Quantity*OD.UnitPrice*(1-OD.Discount)))'Year_Revenue_With_Discount'

From Categories C
		inner Join Products P on C.CategoryID = P.CategoryID
		inner join [Order Details] OD on P.ProductID = OD.ProductID
		inner join Orders O on O.OrderID = OD.OrderID
Group by C.CategoryID,C.CategoryName,year(OrderDate)

order by C.CategoryName,Year
		

--18. Which Product is the most popular? (number of items)

Select top 1 P.ProductID,P.ProductName,P.UnitPrice,P.UnitsInStock,sum(OD.Quantity)'Total_Quantity_Sold'

From Products P
		Inner Join [Order Details] OD on P.ProductID = Od.ProductID
		inner Join Orders O on O.OrderID = OD.OrderID


group by P.ProductID,P.ProductName,P.UnitPrice,P.UnitsInStock
order by Total_Quantity_Sold desc

--19. Which Product is the most profitable? (income)

Select top 1 P.ProductID,P.ProductName,Floor(sum(OD.Quantity*OD.UnitPrice*(1-OD.Discount)))'most_profitable'

From Products P
		Inner Join [Order Details] OD on P.ProductID = Od.ProductID
		inner Join Orders O on O.OrderID = OD.OrderID

Group by P.ProductID,P.ProductName
order by most_profitable desc


--20. Display products that their price higher than the average price of their Category.

CREATE VIEW V_CategoryAvgPrice AS
select C.CategoryID,avg(UnitPrice)'AVG_PRICE'

from Categories C inner join Products P on P.CategoryID = C.CategoryID

group by C.CategoryID


select ProductID,ProductName,V_CategoryAvgPrice.CategoryID,UnitPrice

from Products
inner join V_CategoryAvgPrice on Products.CategoryID = V_CategoryAvgPrice.CategoryID

where V_CategoryAvgPrice.AVG_PRICE < UnitPrice

order by CategoryID
--21. For each city (in which our customers live), display the yearly income average.

select distinct C.City,year(O.OrderDate)as 'Year',avg((OD.UnitPrice*OD.Quantity)*(1+OD.Discount))

from Customers C
	Inner Join Orders O on C.CustomerID = O.CustomerID
	inner join [Order Details] OD on O.OrderID = OD.OrderID

group by C.City,Year(O.OrderDate)
order by Year


--22. For each month display the average sales in the same month all over the years.

select MONTH(o.OrderDate) as Months,count(*) as Avg_Income 
from Products P
		inner join [Order Details] OD on Od.ProductID = P.ProductID
		inner join Orders O on O.OrderID = OD.OrderID

where MONTH(o.OrderDate)=MONTH(o.OrderDate)
group by MONTH(o.OrderDate) 
Order by Months

--23. Display a list of products and OrderID of the largest order ever placed for each product.

with Someone as 
(

select P.ProductName,max(OD.Quantity) as maxQuantity

from [Order Details] OD
		inner join Products P on OD.ProductID = P.ProductID

group by P.ProductName

)
select distinct P.ProductName,OD.OrderID,maxQuantity

From Products P
		inner join [Order Details] OD on P.ProductID = OD.ProductID
		inner join Someone on P.ProductName = Someone.ProductName

where OD.Quantity >= Someone.maxQuantity and P.ProductName = Someone.ProductName

group by P.ProductName,maxQuantity,OD.OrderID
order by OrderID

