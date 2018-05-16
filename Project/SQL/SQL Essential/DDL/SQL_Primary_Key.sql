USE [C:\REPOSITORIES\SKILL\SKILLPROJECTC\PROJECT\SQL\SKILLDB.MDF]
GO

--ALTER DATABASE [C:\REPOSITORIES\SKILL\SKILLPROJECTC\PROJECT\SQL\SKILLDB.MDF] -- ��������� 
--COLLATE Cyrillic_General_CI_AS


--DROP TABLE Customers

-------------------------------------------------------------------------
--                  �������� ���������� �����
-------------------------------------------------------------------------
-- PRIMARY KEY (��������� ����, ����������� ���������� �����)


-- �������� ����� �������(-��) � ������������ PRIMARY KEY 
-- ���������� ���������� (-��) ������ ������ � �������.

CREATE TABLE CustomersV2(
  CustomerNo INT PRIMARY KEY NOT NULL,
  CustomerName NVARCHAR(25) NOT NULL,
  Address1 NVARCHAR(25) NOT NULL,
  City NVARCHAR(15) NOT NULL,
  Contact NVARCHAR(25) NOT NULL,
  Phone NCHAR(12) 
  )

  GO

SELECT * FROM Customers c
SELECT * FROM CustomersV2 c
GO

--DROP TABLE CustomersV2

INSERT INTO CustomersV2																			   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(1,'������', '��������� 25', '�������', 'PetrPetrenko@mail.ru', '(093)1231212'),
(2,'�������� ���� ��������', '������������ 5', '��������', 'IvanenkoIvan@gmail.com', '(095)2313244'); 
GO

SELECT * FROM CustomersV2
GO

-- ������� �������� ������������.
INSERT INTO CustomersV2																			   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(1,'������� ����� ���������', '�������� 12', '�������', 'SemSem@mail.ru', '(063)4533272'); -- ������!
GO


DROP TABLE CustomersV2
GO

-- ���� ��������� ���� ������� �� ���� � ����� ��������,
-- ��� �������� ��������� ��������� ������. 
-- ������� �������� ������ ��������� ���� � ������� �������� � ������.
-- ��������� ���� � ������� ����� ���� ������ ���� (������� ��� ���������)


CREATE TABLE CustomersV2(
    
  CustomerNo INT NOT NULL,
  CustomerName NVARCHAR(25) NOT NULL,
  Address1 NVARCHAR(25) NOT NULL,
  City NVARCHAR(15) NOT NULL,
  Contact NVARCHAR(25) NOT NULL,
  Phone NCHAR(12) 
  PRIMARY KEY (CustomerNo,CustomerName) -- ������ ��������� ��������� ���� �� �������� CustomerNo, CustomerName
  )



INSERT INTO CustomersV2																	   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(1,'�������� ���� ��������', '��������� 25', '�������', 'PetrPetrenko@mail.ru', '(093)1231212'),
(2,'�������� ���� ��������', '������������ 5', '��������', 'IvanenkoIvan@gmail.com', '(095)2313244'); 
GO

INSERT INTO CustomersV2																			   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(1,'������� ����� ���������', '�������� 12', '�������', 'SemSem@mail.ru', '(063)4533272'); 

INSERT INTO CustomersV2																			   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(2,'�������� ���� ��������', '������ 32', '����', 'IvanenkoIvan@mail.ru', '(050)1752124'); -- ������!

SELECT * FROM CustomersV2;

-- �������� ����������� ���������� ����� �� ������������ �������
DROP TABLE CustomersV2;
GO

CREATE TABLE CustomersV2               
(                                      
	CustomerNO int IDENTITY NOT NULL, 
	CustomerName varchar(25) NOT NULL,
	Address1 varchar(25) NOT NULL,
	City     varchar(15) NOT NULL,
	Contact  varchar(25) NOT NULL,
	Phone char(12)             
)
GO


-- �������� �������	Customers ����� ����������� ���������� ����� �� �������	CustomerNo
  ALTER TABLE CustomersV2
  ADD CONSTRAINT PK_CustomersV2 
  PRIMARY KEY (CustomerNo)

  
  INSERT INTO CustomersV2																			   
  (CustomerName, Address1, City, Contact, Phone)
  VALUES
  ('�������� ���� ��������', '��������� 25', '�������', 'PetrPetrenko@mail.ru', '(093)1231212'),
  ('�������� ���� ��������', '������������ 5', '��������', 'IvanenkoIvan@gmail.com', '(095)2313244'); 
  GO

  SELECT * FROM CustomersV2;

  DROP TABLE CustomersV2;
  GO

  CREATE TABLE CustomersV2             
  (                                      
  	CustomerNO int NOT NULL, 
  	CustomerName varchar(25) NOT NULL,
  	Address1 varchar(25) NOT NULL,
  	City     varchar(15) NOT NULL,
  	Contact  varchar(25) NOT NULL,
  	Phone char(12)             
  )
  GO

  ALTER TABLE CustomersV2
    ADD 
    PRIMARY KEY (CustomerNo,CustomerName) 


  INSERT INTO CustomersV2																			   
  (CustomerNO, CustomerName, Address1, City, Contact, Phone)
  VALUES
  (1,'�������� ���� ��������', '��������� 25', '�������', 'PetrPetrenko@mail.ru', '(093)1231212'),
  (2,'�������� ���� ��������', '������������ 5', '��������', 'IvanenkoIvan@gmail.com', '(095)2313244'); 
  GO
  
  INSERT INTO CustomersV2																			   
  (CustomerNO, CustomerName, Address1, City, Contact, Phone)
  VALUES
  (1,'������� ����� ���������', '�������� 12', '�������', 'SemSem@mail.ru', '(063)4533272'); 
  
  INSERT INTO CustomersV2																			   
  (CustomerNO, CustomerName, Address1, City, Contact, Phone)
  VALUES
  (2,'�������� ���� ��������', '������ 32', '����', 'IvanenkoIvan@mail.ru', '(050)1752124'); 
  
  SELECT * FROM CustomersV2;



