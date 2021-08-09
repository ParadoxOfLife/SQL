
--Question #1 Calculate the company's profits from all the brokerages done this year by house type. Profit is calculated by difference
	       -- Between the selling price of the company to the customer and the price asked by the customer selling his home. there is
		   -- Show for each type of house) for example: apartment in a building, penthouse, etc. (the total profits this year.

--Calculating only for 2020 (Last Year)
Select Year(O.[Date of Sale])'Year',HT.HouseTypeID,HT.Type,Sum([Price Shekels]*0.2) 'Company Earning'

From Company C
		inner join Employee E on E.CompanyID = C.CompanyID
		inner join [dbo].[Order] O on O.EmployeeID = E.EmployeeID
		inner join House H on H.HouseID = O.HouseID
		inner join [House Type] HT on HT.HouseTypeID = H.HouseTypeID

where Year(O.[Date of Sale]) = 2020

group by Year(O.[Date of Sale]),HT.HouseTypeID,HT.Type

--Question #2 View customers who sold through the services of the company and bought another house at a price higher than price
--            The sale.

Select C.CustumerID,C.[First Name],C.[Last Name], Max(H.[Price Shekels]) 'Max Price'

From Customer C
		inner join [dbo].[Order] O on C.CustumerID = O.CustomerID
		inner join House H on H.HouseID = O.HouseID

group by CustumerID,C.[First Name],C.[Last Name]
having count(C.CompanyID) > 1


--Question #3 What is the most prestigious neighborhood? Show the name of the neighborhood and the name of the city which is the average house price
--Sold in it the most expensive.
Select top 1 C.Name 'City',N.NeighborhoodID,Sum([Price Shekels]) 'Sum_Price', AVG([Price Shekels]) 'Avg_Sold_Price' 
from House H
		inner join Neighborhood n on N.NeighborhoodID = H.NeighborhoodID
		inner join City C on C.CityID = N.CityID
		
group by C.Name,N.NeighborhoodID
order by Avg_Sold_Price desc


--Question #4 View the outstanding employee for each year. An outstanding employee is an employee whose total profits from sales are the best
--High that year.

Select Year(O.[Date of Sale])'Year',E.EmployeeID,[First Name], sum(H.[Price Shekels])

from Employee E
		
		inner join [dbo].[Order] O on E.EmployeeID = O.EmployeeID
		inner join House H on H.HouseID = O.HouseID

group by Year(O.[Date of Sale]),E.EmployeeID,[First Name]

order by EmployeeID












