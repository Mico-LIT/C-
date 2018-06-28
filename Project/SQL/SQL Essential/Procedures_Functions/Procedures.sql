USE[C:\REPO\PROJECT\SQL\SKILLDB.MDF]

----------------------------------------------------------------------
  
  CREATE PROC spCustomers -- �������� �������� ���������. 
    AS
    SELECT * FROM Customers
GO

EXEC spEmployee
GO
----------------------------------------------------------

  ALTER PROCEDURE spCustomers
    AS
    SELECT c.CustumerNo, c.City FROM Customers c
    GO

EXEC spEmployee
  DROP PROC spEmployee
    EXEC spEmployee ---- ������, ��� ��� ������ ��������� �������.
GO

--------------------------------

/*�������� ��������� � �����������*/

  DROP PROCEDURE spCustomers

    CREATE PROC spCustomers
      @State CHAR(2)
      AS

      SELECT * FROM Customers c WHERE c.State = @State
GO

EXEC spCustomers '22'

EXEC spEmployeeByName -- ������ ���� �� �������� ������������ �������� �� ���������
GO
---------------------------------

DROP PROC spEmployeeByName;
GO

CREATE PROC spEmployeeByName
	@LastName nvarchar(25) = NULL -- ����� ������� ��� �������� �������� �� ������������, ��� ������������� ���������� ������ ��� ���� �������� �� ���������.

AS
IF @LastName IS NOT NULL  -- �������� ����������� IF ��� @LastName IS NOT NULL �������� ����������� ���������� ������������ TRUE ��� FALSE 
    
    SELECT pc.BusinessEntityID, pc.FirstName, pc.LastName, pc.ModifiedDate
    FROM Person.Person pc
    WHERE pc.LastName LIKE @LastName + '%'
    
ELSE
    
    SELECT pc.BusinessEntityID, pc.FirstName, pc.LastName, pc.ModifiedDate
    FROM Person.Person pc;
    
GO

EXEC spEmployeeByName     -- ����� ��� ���������.

EXEC spEmployeeByName 'Ca' --����� � ����������

EXEC spEmployeeByName 'Cao' 
GO
--------------------------------------------------------------------------

/*�������� ��������� � �������� ����������*/
DROP PROC spEmployeeCount;
GO

CREATE PROC spEmployeeCount
    @Info int = null OUTPUT -- ��� ���������� ��������� �������� ������������ �������� ����� OUTPUT
AS
BEGIN
    SET @Info =(SELECT Count(*) From Person.Person);
END
GO

DECLARE @MyInfo int;

EXEC  spEmployeeCount @MyInfo OUTPUT; -- ��� ������ �������� ���������� �������� ����� OUTPUT ������ �������������� ��� �� ��� � ��� ����������, �������� �������� ��� ������������� �������� ������� ����������

PRINT CAST (@MyInfo as varchar);
GO
------------------------

---   �������� �������� �������� RETURN   --- 

DROP PROC TestProc
  CREATE proc TestProc
    AS
    DECLARE @i INT = 12
    RETURN @i  -- �������� RETURN � ���������� ���������� ������ ������������� ��������!
 GO

DECLARE @fild INT
EXEC @fild = TestProc
SELECT CAST(@MyRTN as varchar)

  GO
-----------------------------------------------
--- �������� ----
-- ������������ ������� �������� 32 �������
DROP PROC spFactial

  CREATE PROC spFactial
    @ValueIn INT,
    @ValueOut INT OUT
    AS
BEGIN
    DECLARE @InWorking int;
    DECLARE @OutWorking int;

  IF @ValueIn != 1 BEGIN  
    SET @InWorking = @ValueIn - 1;
    EXEC spFactial @InWorking , @OutWorking OUTPUT  -- ����� ��������� �� ����� ���� (��������)
  	SET @ValueOut = @ValueIn * @OutWorking
  END
    ELSE
    SET @ValueOut = 1
  END
GO

DECLARE @OUT INT;
EXEC spFactial 4,@OUT OUTPUT
SELECT @OUT

----��������� ����������� ������ � ������� -----

DROP TABLE ErrorLog

CREATE TABLE ErrorLog
(
    ErrorId int IDENTITY,
    ErrorLine int,
    ErrorMessage nvarchar(200)
)
GO

-- ������� ��������� ����������� ������

  CREATE PROC uspLogError
    @ErrorLogId INT = 0 OUT
    AS

BEGIN 
    
  INSERT ErrorLog (ErrorLine,ErrorMessage)
  VALUES (ERROR_LINE(),ERROR_MESSAGE())
  set @ErrorLogId = @@identity
    
    
    END

------------------------------

BEGIN TRY
    
    CREATE TABLE OurTest
    (
        col int
    )
    
END TRY
BEGIN CATCH
    
    DECLARE @OutIdError int;
    
        PRINT N'������� ������� ������������ �������';
        EXEC uspLogError @OutIdError OUTPUT;
        PRINT N'������ �������� � ������ ����� ������: ' + CAST(@OutIdError as varchar);

        PRINT N'�� ��������� ������ ';
        
END CATCH

SELECT * FROM ErrorLog

