USE [C:\REPOSITORIES\SKILL\SKILLPROJECTC\PROJECT\SQL\SKILLDB.MDF]
GO

-------------------------------------------------------------------------
						/* �������� ������� */
-------------------------------------------------------------------------

  DROP TABLE Customers;
  GO

CREATE TABLE Customers(
  	-- �������� ����� IDENTITY ������� ������� �������������.(seed = 1, step = 2)     
  CustomerNo INT IDENTITY(1,2) NOT NULL,
  CustomerName VARCHAR(25) NOT null,
  Address1 VARCHAR(25) NOT NULL,
  Address2 VARCHAR(25) DEFAULT('DEFAULT'),-- �������� ����� DEFAULT ����������� �������� �� ���������.
  City VARCHAR(15) NOT NULL,
  State CHAR(2) NOT NULL,
	Zip varchar(10) NOT NULL,
  Contact VARCHAR(25) NOT NULL,
  Phone CHAR(10) NOT NULL,
  FedIDNo VARCHAR(10) NOT NULL,
  DateInSystem SMALLDATETIME NOT NULL DEFAULT GETDATE()  
  )

INSERT INTO Customers 
(CustomerName, Address1, City, [State], Zip, Contact, Phone, FedIDNo)
VALUES
('Jeremy', 'new str', 'NewCity', 'ds', 'newZIP', 'newContact', '0567878932', 'NewIDNO');
GO

SELECT * FROM Customers;
GO

-------------------------------------------------------------------------
						/* ��������� ������� */
-------------------------------------------------------------------------

-- �������� ������� Customers, 
-- ������� ������� NewFild

    ALTER TABLE Customers --�������� �������
    ADD                 
    NewFild INT NULL

    SELECT * FROM Customers c
    GO

-- �������� ������� Customers, 
-- ������ ������� NewFild		

    ALTER TABLE Customers
    DROP COLUMN NewFild
    GO

    SELECT * FROM Customers c
    GO

    ALTER TABLE Customers 
    ADD					 
    NewFild2 varchar(10) NOT NULL 
    -- ���������� �������� ������� � ������������ NOT NULL �� ��������� �������� �� ���������.
    GO

    ALTER TABLE Customers
    ADD NewFild2 VARCHAR(20) NOT NULL 
    DEFAULT 'DEFAULT'
    GO

    SELECT * FROM Customers
    GO

