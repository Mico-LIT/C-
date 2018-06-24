USE[C:\REPO\PROJECT\SQL\SKILLDB.MDF]

--�������� ���������� �� ���������� �������� ������ ������.
SELECT p.ProdID, p.Description, 
  SUM(od.Qty) AS Qty, SUM(od.TotalPrice)  AS TotalSold
  FROM Products p 
  JOIN OrderDetails od ON p.ProdID = od.ProdID
  GROUP BY p.ProdID, p.Description

-- ������� ����� ���� ������ �� ����������.
  SELECT 
    e.FName,
    e.LName,
    e.MName,
    SUM(od.TotalPrice) AS [Total Sold]
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN OrderDetails od ON o.OrderID = od.OrderID

-- ������� ���� ���������� ����������� (��� ���� �����������)

  SELECT 
    e.FName,e.LName,e.MName,
    e1.FName,e1.LName,e1.MName
    
    FROM Employees e 
    JOIN Employees e1 ON e.EmployeeID = e1.ManagerEmpID

