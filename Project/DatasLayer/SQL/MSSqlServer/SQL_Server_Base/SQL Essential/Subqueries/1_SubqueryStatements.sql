USE[C:\REPO\PROJECT\SQL\SKILLDB.MDF]



DROP TABLE SubTest1;
DROP TABLE SubTest2;

CREATE TABLE SubTest1
(id1 int,
 name varchar(50));
 GO

CREATE TABLE SubTest2
(id2 int,
 name varchar(50));
GO

INSERT SubTest1
VALUES  (1,'one'),
		(2,'two'),
		(3,'three'),
		(4,'four'),
		(5,'five'),
		(9,'nine'),
		(10,'ten');
GO

INSERT SubTest2
VALUES  (1,'one'),
		(2,'two'),
		(3,'three'),
		(4,'four'),
		(5,'five'),
		(6,'six'),
		(7,'seven'),
		(8,'eight');
GO
SELECT * FROM SubTest1;
SELECT * FROM SubTest2;
-------------------------------------------------------------------------------------------
--							        ��������� �������
-------------------------------------------------------------------------------------------

-- �������� ������ - ���������� ��������� ����� ������ 
-- ������� (������ ������ �������)
	
SELECT * FROM SubTest1 st
          WHERE st.id1 IN (SELECT st1.id2 FROM SubTest2 st1 )

  -- ���� ��������� ������ ���������� ������ ������ ��������, �� ������������ ������� ��������� IN;
-- ����	��������� ������ ���������� ���� ��������, �� ������������ ������� ��������� =;
	
SELECT * FROM SubTest1
WHERE id1 =	  -- ������
			(SELECT id2 FROM SubTest2); -- ��������� ������
			
-- ��������� ������ ����� ����� ��������� ����������� WHERE

SELECT * FROM SubTest1
WHERE id1 =	  
			(SELECT id2 FROM SubTest2 WHERE name = 'four'); 

-------------------------------------------------------------------------
--					��������� ��������� �������
-------------------------------------------------------------------------

--  ��������� ��������� �������
--	1. ������� ������ �������� ������ � ��� ���������� �� ���������� ������.
--	2. ���������� ������ ����������� � ������ ���������� ��������.
--	3. ���������� ������ �������� �� ������� �������������� ��������.
--	4. ������� ������ ���������� ��� �������� ��� ���������� ���������� ���������.


  SELECT * FROM SubTest1 st 
    WHERE st.name = (SELECT st1.name FROM SubTest2 st1 WHERE st1.id2=st.id1)

-- ����� ������ ����������� ��������� �������:

-- EXISTS - ���������� true, ���� ������� ���������� ���� �� ���� ��������.
-- ����� ���������� ������� �������� EXISTS, �� ���������� ����� �� �������.
SELECT * FROM SubTest1  AS ST1
WHERE EXISTS
    (SELECT * FROM SubTest2	ST2
     WHERE ST1.id1 = ST2.id2);


--  C�������� ��������� ������ � ������ �������
-- , (�������)
SELECT * ,(SELECT name	FROM SubTest2 AS ST2 WHERE ST1.id1 = ST2.id2) AS Name2 
FROM SubTest1 AS ST1;

SELECT *,
	   (SELECT id2 FROM SubTest2 AS ST2	WHERE ST1.id1 = ST2.id2) AS Id2,
	   (SELECT name	FROM SubTest2 AS ST2 WHERE ST1.id1 = ST2.id2) AS Name2
FROM SubTest1 AS ST1;
 
SELECT *,
	   (SELECT id2 FROM SubTest2 AS ST2	WHERE ST1.id1 = ST2.id2) AS Id2,
	   (SELECT name	FROM SubTest2 AS ST2 WHERE ST1.id1 = ST2.id2) AS Name2
FROM SubTest1 AS ST1
WHERE ST1.id1 = (SELECT id2 FROM SubTest2 AS ST2 
                  WHERE ST1.id1 = ST2.id2);

-- �������� ���������� �� ���������� ��������� ������ ������.

SELECT 
  od.ProdID
  ,p.Description
  ,od.Qty
  ,od.TotalPrice
  FROM Products p
  JOIN OrderDetails od ON p.ProdID = od.ProdID


SELECT (SELECT  ProdID FROM Products 
    WHERE Products.ProdID = OrderDetails.ProdID) AS ProdID,
   (SELECT  [Description] FROM Products 
    WHERE Products.ProdID = OrderDetails.ProdID) AS [Description], 
      Qty, 
      TotalPrice 
FROM OrderDetails

-- ������� ����� ����� ������ �� �����������

  SELECT  
    e.FName,
    e.LName,
    e.MName,
    SUM(od.TotalPrice) AS TotalSold    
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    GROUP BY e.FName,e.LName,e.MName

-- �������� ��������� ������� CREATE TABLE #TableName:
-- #TableName  - ��������� �������, ������ �������� ����� ������������ ������
--               ������� ������������
-- ##TableName - ���������� �������, ������ �������� ����� ������������ �����
--               ������������

CREATE TABLE #TmpTable
(FName varchar(50),
 LName varchar(50),
 MName varchar(50),
 TotalPrice money);
 GO


SELECT (SELECT FName FROM Employees 
          WHERE EmployeeID = (SELECT EmployeeID FROM Orders
                             WHERE Orders.OrderID = OrderDetails.OrderID)
          ) AS FName,
          (SELECT LName FROM Employees 
          WHERE EmployeeID = (SELECT EmployeeID FROM Orders
                             WHERE Orders.OrderID = OrderDetails.OrderID)
          ) AS LName,
          (SELECT MName FROM Employees 
          WHERE EmployeeID = (SELECT EmployeeID FROM Orders
                             WHERE Orders.OrderID = OrderDetails.OrderID)
          ) AS MName,
          TotalPrice
INTO TmpTable 
FROM OrderDetails;
GO
  
SELECT FName, LName, MName, SUM(TotalPrice) AS [Total Sold] FROM TmpTable
GROUP BY FName, LName, MName;
GO

WITH Managers (FName,LName,Mname,TotalPrice) AS
  (
SELECT (
        SELECT FName FROM Employees 
        WHERE EmployeeID = (
                            SELECT EmployeeID FROM Orders
                            WHERE Orders.OrderID = OrderDetails.OrderID
                            )
        ),
        (
        SELECT LName FROM Employees 
        WHERE EmployeeID = (
                             SELECT EmployeeID FROM Orders
                             WHERE Orders.OrderID = OrderDetails.OrderID
                             )
        ),
        (
        SELECT MName FROM Employees 
        WHERE EmployeeID = (
                             SELECT EmployeeID FROM Orders
                             WHERE Orders.OrderID = OrderDetails.OrderID
                             )
        ),
        TotalPrice 
FROM OrderDetails
  )
  SELECT FName, LName, MName, SUM(TotalPrice) AS [Total Sold] 
         FROM Managers GROUP BY FName, LName, MName;
