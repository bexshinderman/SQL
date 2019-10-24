BEGIN TRAN;

  UPDATE Sales.OrderDetails
    SET discount = 0.05
  WHERE orderid = 10249;

  ROLLBACK TRAN;