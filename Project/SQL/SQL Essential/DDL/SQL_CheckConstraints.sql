
USE [C:\REPOSITORIES\SKILL\SKILLPROJECTC\PROJECT\SQL\SKILLDB.MDF] 

-------------------------------------------------------------------------
					 /*���������������� �����������*/
-------------------------------------------------------------------------
	

  DROP TABLE Customers
  GO
  DROP TABLE Orders
  GO


 CREATE TABLE Customers(
  CustomerNO INT NOT NULL IDENTITY,
  CustomerName VARCHAR(30) NOT NULL,
  Address1 VARCHAR(30) NOT NULL,
  City VARCHAR(30) NOT NULL,
  Contact VARCHAR(30) NOT NULL,
  -- ���������������� �����������	     
  Phone CHAR(12) CHECK(Phone LIKE('([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
  )
  GO

  INSERT INTO Customers																			   
  (CustomerName, Address1, City, Contact, Phone)
  VALUES
  ('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)1231212');

  INSERT INTO Customers
  (CustomerName, Address1, City, Contact, Phone)
  VALUES
  ('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******'); -- ������.

  SELECT * FROM Customers;

  DROP TABLE Customers;
  GO

  CREATE TABLE Customers(
    CustomerNO INT IDENTITY NOT NULL,
    CustomerName VARCHAR(30) NOT NULL,
    Address1 VARCHAR(30) NOT NULL,
    City VARCHAR(30) not NULL,
    Contact VARCHAR(30) NOT NULL,
    Phone CHAR(12) UNIQUE -- UNIQUE (������������� ����), �������� � ������ ������ ���� ����������
    )
  GO
  
  INSERT INTO Customers
  (CustomerName, Address1, City, Contact, Phone)
  VALUES
  ('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******');
  
  
  INSERT INTO Customers
  (CustomerName, Address1, City, Contact, Phone)
  VALUES
  ('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)1231213'); 
  
  
  SELECT * FROM Customers;
  DROP TABLE Customers;

  CREATE TABLE Customers                
    (                                      
  	CustomerNO int IDENTITY NOT NULL, 
  	CustomerName varchar(25) NOT NULL,
  	Address1 varchar(25) NOT NULL,
  	City     varchar(15) NOT NULL,
  	Contact  varchar(25) NOT NULL,
    Phone    CHAR(12) UNIQUE CHECK(Phone LIKE('([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
    )



  INSERT INTO Customers
  (CustomerName, Address1, City, Contact, Phone)
  VALUES
  ('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)1231212');
  
  INSERT INTO Customers
  (CustomerName, Address1, City, Contact, Phone)
  VALUES
  ('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******'); -- ������ (�� ������������ �������).
  
  INSERT INTO Customers
  (CustomerName, Address1, City, Contact, Phone)
  VALUES
  ('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)1231212'); -- ������ (������������� ��������).
  
  SELECT * FROM Customers;


  DROP TABLE Customers;
  GO
  
  CREATE TABLE Customers                
  (                                      
  	CustomerNO int IDENTITY NOT NULL, 
  	CustomerName varchar(25) NOT NULL,
  	Address1 varchar(25) NOT NULL,
  	City     varchar(15) NOT NULL,
  	Contact  varchar(25) NOT NULL,
  	Phone char(12)             
  )
  GO

  -- �������� ����������������� ����������� �� ������������ �������	
    ALTER TABLE Customers ADD CONSTRAINT CN_CustomersPhoneNo
  -- �����������
    CHECK(Phone LIKE('([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
    GO

    INSERT INTO Customers
    (CustomerName, Address1, City, Contact, Phone)
    VALUES
    ('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)1231212');
    
    INSERT INTO Customers
    (CustomerName, Address1, City, Contact, Phone)
    VALUES
    ('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******'); -- ������ (�� ������������ �������).
  
-----------------------------------------------------
    ALTER TABLE Customers
    NOCHECK CONSTRAINT CN_CustomersPhoneNo  -- ���������� ������ ����������� CHECK


    INSERT INTO Customers
    (CustomerName, Address1, City, Contact, Phone)
    VALUES
    ('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******');
-----------------------------------------------------

    ALTER TABLE Customers CHECK CONSTRAINT CN_CustomersPhoneNo --  ��������� ������ ����������� CHECK

      
    INSERT INTO Customers
    (CustomerName, Address1, City, Contact, Phone)
    VALUES
    ('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******'); -- ������ (�� ������������ �������).

-------------------------------------------------------
    ALTER TABLE Customers
    DROP CONSTRAINT	CN_CustomersPhoneNo;		--  �������� ����������� CHECK
    
    INSERT INTO Customers
    (CustomerName, Address1, City, Contact, Phone)
    VALUES
    ('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******');
    
    
    --  ����� �������� �� �������� ������� ����������� CHECK
    ALTER TABLE Customers
    CHECK CONSTRAINT CN_CustomersPhoneNo;	














