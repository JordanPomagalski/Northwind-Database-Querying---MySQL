select *
from categories,shippers;
select *
from suppliers;

select customername,city,country
from customers;
select productid,productname
from products;

select distinct country from customers;
select distinct city from customers;
select count(distinct country)
from customers;

select * from customers where country="uk";

select * from products;

select * from products where price > 100;

select * from orders where orderdate > 1996-07-30;

select customername,city,country from customers where country <> "uk";

select *
from customers
where country = "germany" and city = "berlin" or city = "stuttgart";

select count(customerID)
from customers
where country = "USA";

select *
from customers
where customerID > 15;


select *
from customers
where country = "germany" and city = "berlin" or country = "UK" and city = "london";

select *
from customers
where country = "UK" and city = "London";

select *
from customers
where city = "Portland" or "Kirkland";

select *
from orders
where orderdate < "1996-08-27" or orderdate > "1997-02-21";

select *
from orders
where orderdate > "1997-02-21";

select *
from customers
where customername like "a%e";

select *
from suppliers
where country like "%land%";

select *
from employees
where firstname like "_n%";

SELECT * FROM Customers
WHERE Country not IN ('Germany', 'France', 'UK');

select *
from customers
where city in ("berlin", "paris", "madrid");

select *
from orders
where shipperid in (1, 3);

select *
from products
where price between 10 and 20;

select * from customers
order by country;

select * from products
order by price asc;

select * from customers
limit 3;

select * from customers
where country="germany"
limit 3;

select min(productname)
from products;

select sum(price)
from products;

select customername, concat_ws(", ", Address, PostalCode, City, Country) as Address
From Customers;

use northwind;

SELECT DISTINCT City FROM Customers;
SELECT * FROM Products WHERE Price > 50; 
SELECT * FROM Customers WHERE Country = "USA" OR Country = "UK";
SELECT * FROM Orders ORDER BY OrderDate DESC;
SELECT * FROM Products WHERE Price BETWEEN 20 AND 50 ORDER BY Price DESC;
SELECT * FROM Customers WHERE Country = "USA" AND City IN("Portland", "Kirkland");
SELECT * FROM Customers WHERE Country = "UK" OR City = "London" ORDER BY CustomerName DESC;
SELECT * FROM Products WHERE CategoryID IN(1, 2) ORDER BY ProductName ASC;

SELECT SupplierName, AVG(Price) FROM Products
inner join suppliers
on products.supplierid = suppliers.supplierid
GROUP BY SupplierName;

select *
from orders
inner join customers
on orders.customerid = customers.customerid;

select *
from employees
inner join orders
on employees.employeeid = orders.employeeid;

SELECT Orders.OrderID,Customers.CustomerName,Shippers.ShipperName
FROM((Orders
INNER JOIN Customers ON Orders.CustomerID =
Customers.CustomerID)
Inner JOIN Shippers ON Orders.ShipperID =
Shippers.ShipperID);

SELECT firstname, lastname, orders.orderid
from employees
inner join orders
on employees.employeeid = orders.employeeid
order by orderid;

select Productname, suppliername
from products
inner join suppliers
on products.supplierid = suppliers.supplierid
where suppliername = "G'Day, Mate";

select suppliername
from suppliers;

SELECT orderid, concat_ws(" ", firstname, lastname) as Name, orderdate
from employees
inner join orders
on employees.employeeid = orders.employeeid;

select *
from orders
inner join shippers
on orders.shipperid = shippers.shipperid;

select ProductName, CategoryName
from products
inner join categories
on products.categoryid = categories.categoryid;

select orderid, productname, quantity
from products
inner join order_details
on products.productid = order_details.productid;

select orders.orderid, concat_ws(", ", employees.lastname, employees.firstname) as Name
from orders
right join employees on orders.employeeid = employees.employeeid
order by orders.orderid;

select l.customername, r.orderid
from customers as l
left join orders as r on l.customerid = r.customerid
-- where orderid is null
order by l.customername;

select count(*)
from customers
cross join orders;
/* there are 91 rows in customers multiples by 96 rows in orders */

select count(customerid), country
from customers
group by country;

select *
from customers;

-- 1) combine shippers to orders details
-- 2) group by shippers
-- 3) count number of orders
select count(orderid) as totalorders, shippername
from shippers as s
inner join orders as o
on s.shipperid = o.shipperid
group by shippername;

SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalSales
FROM Order_Details as od
JOIN Products as p
ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;

select count(customerid), country
from customers
group by country;

 select concat_ws(", ",lastname, firstname) as Name, count(orderid)
 from employees
 left join orders
 on employees.employeeid = orders.employeeid
 group by employees.employeeid;
 
 select categoryname as Categories, count(orderid) as "OrderCount"
 from products
 join order_details
 on products.productid = order_details.productid
 join categories
 on products.categoryid = categories.categoryid
 group by categoryname;
 
 select categoryname as Categories, count(orderid) as "OrderCount"
 from categories
 left join products
 on categories.categoryid = products.categoryid
 join order_details
 on products.productid = order_details.productid
 group by categoryname;
 
 -- what
 SELECT A.CustomerName, B.CustomerName, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

select *
from employees emp1
join employees emp2
on emp1.employeeID = emp2.employeeID;

select productname Product, suppliername Supplier
from products p
join suppliers s
on p.supplierID = s.supplierid;

select productname Product, categoryname Categories
from products p
join categories c
on p.categoryID = c.categoryid;

select *
from categories;

select *
from products
where categoryid = 6;

select OrderID, OrderDate, CustomerName Customer, concat_ws(" ", firstname, lastname) Employee
from orders o
left join customers c on o.customerid = c.customerid
join employees e on o.employeeid = e.employeeid
order by orderid;

select productname, categoryname, suppliername
from products p
left join categories c on p.categoryid = c.categoryid
join suppliers s on p.supplierid = s.supplierid
order by productname;

select *
from orders o
join customers c on o.customerid = c.customerid
where orderdate >= "1996-01-01" and orderdate <= "1996-12-31";
-- where orderdate like "1996%";

select categoryname Categories, count(productid) "# of products"
from categories c
join products p on c.categoryid = p.categoryid
group by categoryname;

select productname, price, quantity 
from products p 
left join order_details od on p.productid = od.productid; 
-- how to calculate profit on above
select productname, price, quantity, sum(price * quantity) as profit
from products p
left join order_details od on p.productid = od.productid
group by productname, price, quantity;