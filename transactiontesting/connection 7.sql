BEGIN TRAN;

  SELECT orderid, productid, unitprice, qty, discount
  FROM Sales.OrderDetails
  WHERE orderid = 10249;
  
COMMIT TRAN;

UPDATE Sales.OrderDetails
  SET discount = 0.00
WHERE orderid = 10249;