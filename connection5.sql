SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT orderid, productid, unitprice, qty, discount
FROM Sales.OrderDetails
WHERE orderid = 10249;


SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT orderid, productid, unitprice, qty, discount
FROM Sales.OrderDetails -- WITH (READCOMMITTEDLOCK)
WHERE orderid = 10249;
UPDATE Sales.OrderDetails
  SET discount = 0.00
WHERE orderid = 10249;


INSERT INTO Sales.OrderDetails
    (orderid, productid, unitprice, qty, discount)
  VALUES(10249, 2, 19.00, 10, 0.00);

  DELETE FROM Sales.OrderDetails
WHERE orderid = 10249
  AND productid = 2;

  SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


  
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;

BEGIN TRAN;

  SELECT orderid, productid, unitprice, qty, discount
  FROM Sales.OrderDetails
  WHERE orderid = 10249;
  COMMIT TRAN;

  SELECT orderid, productid, unitprice, qty, discount
FROM Sales.OrderDetails
WHERE orderid = 10249;

UPDATE Sales.OrderDetails
  SET discount = 0.00
WHERE orderid = 10249;
