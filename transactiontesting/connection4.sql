BEGIN TRAN;

  UPDATE Sales.OrderDetails
    SET discount += 0.05
  WHERE orderid = 10249;

  SELECT orderid, productid, unitprice, qty, discount
  FROM Sales.OrderDetails
  WHERE orderid = 10249;

ROLLBACK TRAN;

BEGIN TRAN;

  UPDATE Sales.OrderDetails
    SET discount += 0.05
  WHERE orderid = 10249;

  SELECT orderid, productid, unitprice, qty, discount
  FROM Sales.OrderDetails
  WHERE orderid = 10249;

  COMMIT TRAN;

  
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

BEGIN TRAN;

  SELECT orderid, productid, unitprice, qty, discount
  FROM Sales.OrderDetails
  WHERE orderid = 10249;

  SELECT orderid, productid, unitprice, qty, discount
  FROM Sales.OrderDetails
  WHERE orderid = 10249;

COMMIT TRAN;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

ALTER DATABASE shinrl1_TSQL2012 SET ALLOW_SNAPSHOT_ISOLATION ON;

BEGIN TRAN;

  UPDATE Sales.OrderDetails
    SET discount += 0.05
  WHERE orderid = 10249;

  SELECT orderid, productid, unitprice, qty, discount
  FROM Sales.OrderDetails
  WHERE orderid = 10249;

  COMMIT TRAN;

  UPDATE Sales.OrderDetails
  SET discount = 0.00
WHERE orderid = 10249;


