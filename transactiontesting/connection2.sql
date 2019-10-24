SELECT orderid, productid, unitprice, qty, discount
FROM Sales.OrderDetails --WITH (READCOMMITTEDLOCK)
WHERE orderid = 10249;