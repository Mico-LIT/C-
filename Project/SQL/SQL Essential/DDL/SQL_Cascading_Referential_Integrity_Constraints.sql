
USE [C:\REPOSITORIES\SKILL\SKILLPROJECTC\PROJECT\SQL\SKILLDB.MDF] 

DROP TABLE Customers
  DROP TABLE Orders

CREATE TABLE Customers(
  CustomerNo INT IDENTITY NOT NULL PRIMARY key,
  CustomerName VARCHAR(30) NOT NULL,
  Address1 VARCHAR(30) NOT NULL,
  City VARCHAR(30) NOT NULL,
  Contact VARCHAR(30) NOT NULL,
  Phone CHAR(12)
  )

  GO

CREATE TABLE Orders
  (
  OrderID INT IDENTITY NOT NULL PRIMARY KEY,
  CustomerNo INT NULL DEFAULT 2,
  OrderDate DATE NOT NULL,
  Employeeid INT NULL
  )
GO


ALTER TABLE Orders ADD CONSTRAINT FK_CustNo 
  FOREIGN KEY(CustomerNo) REFERENCES Customers(CustomerNo)


INSERT INTO Customers																			   
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Petrenko Petr Petrovich', '��������� 25', '�������', 'PetrPetrenko@mail.ru', '(093)1231212'),
('Ivanenko Ivan Ivanovich', '������������ 5', '��������', 'IvanenkoIvan@gmail.com', '(095)2313244');	


INSERT INTO Orders
(CustomerNo, OrderDate,	EmployeeId)
VALUES
(1, GETDATE(), 1);

SELECT * FROM Customers;
SELECT * FROM Orders;

-- ���������� ������� ������ �� ������������ �������, ��� ��� �� ��� ������� ������ �� �������� �������.

DELETE Customers
  WHERE CustomerName = 'Petrenko Petr Petrovich'


-------------------------------------------------------------------------
--              ����������� ��������� �����������
-------------------------------------------------------------------------

-- � ������� ����������� ��������� ����������� (ON DELETE, ON UPDATE) 
-- ����� ���������� ��������, ������� SQL Server ����� �����������
-- ��� �������� �������� �������, ����� ������������ ����������
-- ������� ��� �������� �������� ������� ������������ �������.

-- ��������:

-- 1. CASCADE -	��� UPDATE, DELETE � ������������ ������� ��������� ��������,
--				� �������� ������� ����� �����������  UPDATE �� ����� ��������, 
--				��� DELETE	����� �� �������� ������� ��������������

  ALTER TABLE Orders DROP CONSTRAINT FK_CustNo 

  ALTER TABLE Orders add CONSTRAINT FK_CustNo 
  FOREIGN KEY (CustomerNo) 
  REFERENCES Customers(CustomerNo) ON DELETE CASCADE
  GO

  DELETE Customers WHERE CustomerName = 'Petrenko Petr Petrovich';


  SELECT * FROM Customers;
  SELECT * FROM Orders;

  DBCC CHECKIDENT ("Customers",RESEED,0) -- ���������� �������� IDENTITY = 0

  INSERT INTO Customers																			   
  (CustomerName, Address1, City, Contact, Phone)
  VALUES
  ('�������� ���� ��������', '��������� 25', '�������', 'PetrPetrenko@mail.ru', '(093)1231212')

DBCC CHECKIDENT("Customers",RESEED,2) -- ���������� �������� IDENTITY = 2
GO

DBCC CHECKIDENT("Orders",RESEED,0); -- ���������� �������� IDENTITY = 0
GO

INSERT INTO Orders
(CustomerNo, OrderDate,	EmployeeId)
VALUES (1,GETDATE(),1);
GO

SELECT * FROM Customers;
SELECT * FROM Orders;
  
-- 2. SET NULL - ��� UPDATE, DELETE � ������������ ������� ��������� ��������,
--				 � �������� ������� ��� ��������, ������������ ��� ������� �����, 
--				 ����� �������� �� NULL


ALTER TABLE Orders DROP CONSTRAINT FK_CustNo

ALTER TABLE Orders ADD CONSTRAINT FK_ConstNo 
  FOREIGN KEY (CustomerNo) 
  REFERENCES Customers(CustomerNo) ON DELETE SET null

go

DELETE Customers
WHERE CustomerName = '�������� ���� ��������';
GO

SELECT * FROM Customers;
SELECT * FROM Orders;


DBCC CHECKIDENT("Customers",RESEED,0) -- ���������� �������� IDENTITY = 0


INSERT INTO Customers																			   
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Petrenko Petr Petrovich', '��������� 25', '�������', 'PetrPetrenko@mail.ru', '(093)1231212')


DBCC CHECKIDENT ("Customers",RESEED,2)-- ���������� �������� IDENTITY = 2


DELETE Orders WHERE OrderID=1

DBCC CHECKIDENT("Orders",RESEED,0); -- ���������� �������� IDENTITY = 0
GO

INSERT INTO Orders
(CustomerNo, OrderDate,	EmployeeId)
VALUES (1,GETDATE(),1);
GO

SELECT * FROM Customers;
SELECT * FROM Orders;


-- 3. SET DEFAULT - ��� UPDATE, DELETE � ������������ ������� ��������� ��������,
--					� �������� ������� ��� ��������, ������������ ��� ������� �����, 
--					����� �������� �� �������� �� ���������.

ALTER TABLE orders 
  DROP CONSTRAINT  FK_ConstNo
GO

 ALTER TABLE Orders ADD CONSTRAINT 
 FK_CustNo FOREIGN KEY (CustomerNo) REFERENCES Customers (CustomerNo)
 ON DELETE SET DEFAULT
  
DELETE Customers
WHERE CustomerName = 'Petrenko Petr Petrovich';
GO

SELECT * FROM Customers;
SELECT * FROM Orders;

DBCC CHECKIDENT("Customers",RESEED,0); -- ���������� �������� IDENTITY = 0
GO

INSERT INTO Customers																			   
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Petrenko Petr Petrovich', '��������� 25', '�������', 'PetrPetrenko@mail.ru', '(093)1231212')

DBCC CHECKIDENT("Customers",RESEED,2) -- ���������� �������� IDENTITY = 2
GO

DELETE Orders WHERE OrderID = 1;
GO

DBCC CHECKIDENT("Orders",RESEED,0); -- ���������� �������� IDENTITY = 0
GO

INSERT INTO Orders
(CustomerNo, OrderDate,	EmployeeId)
VALUES (1,GETDATE(),1);
GO

SELECT * FROM Customers;
SELECT * FROM Orders;

-- 4. NO ACTION (�� ���������) - ��������� ���������� UPDATE, DELETE!
ALTER TABLE orders DROP CONSTRAINT FK_CustNo


  ALTER TABLE Orders ADD CONSTRAINT FK_CustNo FOREIGN KEY(CustomerNo)
    REFERENCES Customers (CustomerNo) ON DELETE NO ACTION
GO

DELETE Customers
WHERE CustomerName = 'Petrenko Petr Petrovich';

SELECT * FROM Customers;
SELECT * FROM Orders;
