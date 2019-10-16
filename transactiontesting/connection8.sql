
BEGIN TRAN;

  UPDATE Production.Products
    SET unitprice += 1.00
  WHERE productid = 2;

    SELECT productid, unitprice
  FROM Production.Products WITH (READCOMMITTEDLOCK)
  WHERE productid = 3;

COMMIT TRAN;
