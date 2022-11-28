use northwind;


--- CONTANDO E ORDENANDO ----

select  customerid as CodigoCliente,
count(customerid) as QTDPedidos
from orders
group by customerid
order by customerid asc;


select categoryid, count(productid)
from products
group by categoryid;

-- EXERCICIO 1  -- 

select employeeid, count(orderid) as QTDPedidos
from orders
group by employeeid;


-- EXERCICIO 2  -- 

select orderid, count(orderid)
from order_details
group by orderid
order by orderid asc;


-- EXERCICIO 3  -- 

select shipvia, count(orderid)
from orders
group by shipvia;



-- EXERCICIO 4  -- 

select supplierid, count(supplierid)
from products
group by supplierid;

--------------------------------------

select orderid,
sum((quantity * unitprice))
from order_details
group by orderid;


----------- QUANTO CADA CLIENTE GASTOU NA LOJA --------------

select orders.customerid,
		
			sum((order_details.quantity * order_details.unitprice))
            
from orders inner join order_details
 on orders.orderid = order_details.orderid

group by orders.customerid;
	   
 ------------------------- INNER JOIN ---------------------------------------    
 
 select customers.CustomerId,
		customers.ContactName,
		orders.OrderId,
		orders.OrderDate,
		orders.ShipVia

	from orders inner join customers
	on orders.CustomerId = customers.CustomerId
        order by customers.ContactName;

-------------------------------------------------------------------

select products.ProductId,
       products.ProductName,
       order_details.OrderId
       
   from order_details right outer join products
   on products.ProductId = order_details.ProductId  
   order by order_details asc;
   
  ---------------------- RELATORIO CLIENTES SEM PEDIDOS ---------------------------------------------
  
  select ct.costumerId, ct.contactName,
			od.orderId, od.orderdate
  from customers as ct left outer join orders as od
  on ct.custumerId = od.customerId
  where od.orderId is null

union 

 select ct.costumerId, ct.contactName,
			od.orderId, od.orderdate
  from customers as ct right outer join orders as od
  on ct.custumerId = od.customerId
  where ct.costumerId is null
       
   ---------------------------RELATORIO PRODUTOS SEM CATEGORIA---------------------------------------

 select pd.productId, pd.productName,
			ct.categoryId, ct.categoryName
  from product as pd left outer join category as ct
  on pd.productId = ct.categoryId
  where pd.productId  is null

union 

 select pd.productId, pd.productName,
			ct.categoryId, ct.categoryName
  from product as ct right outer join category as od
 on pd.productId = ct.categoryId
  where ct.categoryId  is null


