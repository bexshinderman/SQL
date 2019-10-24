ALTER DATABASE shinrl1_TSQL2012 SET READ_COMMITTED_SNAPSHOT ON;


BEGIN TRAN;

  UPDATE Sales.OrderDetails
    SET discount += 0.05
  WHERE orderid = 10249;

  SELECT orderid, productid, unitprice, qty, discount
  FROM Sales.OrderDetails
  WHERE orderid = 10249;
COMMIT TRAN;