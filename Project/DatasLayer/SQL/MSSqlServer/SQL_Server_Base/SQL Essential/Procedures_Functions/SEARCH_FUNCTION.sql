USE ShopDB
GO	

  DROP TABLE MyEmployee
---------- ������� ������� �����������. ----------
CREATE TABLE MyEmployee
(
  EmployeeID int NOT NULL,
  ManagerID int NULL REFERENCES MyEmployee(EmployeeID), -- ��������� ���� ����������� ������ ���������.
  JobTitle nvarchar(50) NOT NULL,
  LastName nvarchar(50) NOT NULL,
  FirstName nvarchar(50) NOT NULL,
    CONSTRAINT PK_Employee2_EmployeeID PRIMARY KEY CLUSTERED (EmployeeID ASC)
);
GO

-- ������������� ������ (��� ��� ������� �������� ���������� � ����������� ������������� ����������� ���������� � ������� ��� �� �������� � ���� �������)
INSERT INTO MyEmployee(EmployeeID,ManagerID,JobTitle,LastName,FirstName)
VALUES
  (1, NULL, N'����������� ��������',N'�������', N'������'),
  (2, 1, N'���������� ��������', N'��������', N'�������'),	
  (3, 1, N'�������� ���������',N'��������',N'��������'),		
  (4, 1, N'�������������� ��������', N'����������', N'������'),
  (5, 4, N'�������', N'��������', N'�������'),			
  (8, 5, N'�������', N'�����', N'������'),			
  (9, 5, N'�����������', N'�����', N'�����'),				
  (10 ,5, N'Data Architect', N'������', N'������'),			
  (11 ,5, N'����������', N'��������', N'������'),				
  (6, 4, N'������������ ���������', N'��������', N'����'),	
  (7, 4, N'��������� ������',N'��������',N'�����');				

SELECT * FROM MyEmployee;

-- ������ ��� ����������� ��������������� ���������.
SELECT  sub.EmployeeID,
		sub.FirstName,
		sub.LastName
FROM
	MyEmployee as boss
	JOIN
	MyEmployee as sub
	ON boss.EmployeeID = sub.ManagerID
WHERE boss.JobTitle LIKE N'�������������� ��������';
GO

-- ����������� ������� ������ ���� �����������.

  DROP FUNCTION fnGetSub
  CREATE FUNCTION fnGetSub(@EmpID int) -- ������� ������� � ����� ����������.
    RETURNS @Sub TABLE(  -- �������� ������������ �������.
    EmployeeID INT,
    SubID INT,
    Name NVARCHAR(90)
    )
    AS
    BEGIN 
      DECLARE @_EmpID INT ;

      INSERT @Sub (EmployeeID, SubID, Name)-- �������� ������ � ������������ � �������� �������.
      SELECT EmployeeID, ManagerID ,FirstName+' '+LastName
        FROM MyEmployee me WHERE me.EmployeeID = @EmpID


      SELECT @_EmpID = (
        SELECT min(me.EmployeeID) FROM MyEmployee me WHERE -- ���������� ������� �����������.
                        me.ManagerID = @EmpID
        )
      WHILE @_EmpID IS NOT NULL-- ���� ���� ����������� ��������� ����.
        BEGIN 
          INSERT @Sub -- ��������� ������ � ����������� ������������ ���� ��������� ������������.
            SELECT * FROM dbo.fnGetSub(@_EmpID) gs  -- ��������.
          
      SET @_EmpID = 
        (
          SELECT MIN(me.EmployeeID) FROM MyEmployee me -- ���������� ���������� ������������.
          WHERE me.EmployeeID >@_EmpID
          AND me.ManagerID = @EmpID 
          )
        
        END
      RETURN;
      
      END
    GO

SELECT * FROM dbo.fnGetSub(4); -- ������������� ��� ������ �������� - fnGetSub.
SELECT * FROM MyEmployee;




