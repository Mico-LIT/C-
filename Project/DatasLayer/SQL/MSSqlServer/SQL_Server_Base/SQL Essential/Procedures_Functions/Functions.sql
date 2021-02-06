USE [C:\REPO\PROJECT\SQL\SKILLDB.MDF] 
USE [ShopDB]
/*���������������� ������� ������������ ��������� �������� (�� ���������)*/

  CREATE FUNCTION Hello() -- ������� �������
    RETURNS VARCHAR(30)-- ��������� ��� ������������� ��������
    AS
    BEGIN 
    DECLARE @MyVar VARCHAR(20) = 'HI';
    RETURN @MyVar; -- ������������ �������� 
    END 

    PRINT dbo.Hello();

    DROP TABLE TestTable;
    GO
    
    CREATE TABLE TestTable
    (
    id int identity not null,
    name varchar(25) not null,
    CDate smalldatetime not null
    )
    GO

-------------------------------------------------------


  DECLARE @MyVar INT = 1;
  DECLARE @MyVcVar VARCHAR(10);

  WHILE @MyVar < 20
    BEGIN 
    SET @MyVcVar = 'Test ' + CAST(@MyVar AS VARCHAR)
    INSERT TestTable (name, CDate)
  VALUES (@MyVcVar, DATEADD(Mi, @MyVar, GETDATE()))
    SET @MyVar = @MyVar + 1;  
    
    END

/* ������ ������� ����� ������, ��� ��� ������� GETDATE() 
 ���������� �������� ���� datetime (���������� �� ������ 
 ���� �� � ������� ����� �� 3-� ����� �������)*/
SELECT * FROM TestTable
WHERE CDate = GETDATE(); 
GO
---------------------------------------------------------

CREATE FUNCTION DateOnly (@date DATETIME)-- ������� ������� ����� �� ��� � ��������
  RETURNS DATE--�������� ������������ ���
  AS
  BEGIN --���� �������
  RETURN CAST(@date AS DATE)-- �������� � ���� date ������������ ��������  
  END
GO

SELECT * FROM TestTable -- ������ ������� ������ 19 �������(��� �� ����������� ����
WHERE dbo.DateOnly(CDate)= dbo.DateOnly(GETDATE()); --����� ���� ��������� ����� ��� ������ ���������������� �������

--------------------------------------------------------


/*��������������� ������� ����������� �������*/


  CREATE FUNCTION fnCustomers()
    RETURNS TABLE
    AS
      RETURN (SELECT * FROM Customers c)
    GO

   SELECT * FROM dbo.fnCustomers(); 

  

--�������: ��������� ���������� ������ � ������� �������������
CREATE VIEW viCustomers
  AS
  SELECT * FROM Customers c

  SELECT * FROM viCustomers

--------------------------------------------------------

  CREATE FUNCTION fnCustomersSearch(@myVar VARCHAR)
    RETURNS TABLE
    AS
    RETURN (SELECT * FROM Customers c WHERE c.CustumerName LIKE @myVar + '%')

    SELECT * FROM fnCustomersSearch('Ale')













