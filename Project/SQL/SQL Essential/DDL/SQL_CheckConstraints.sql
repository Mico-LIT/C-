
USE [C:\REPOSITORIES\SKILL\SKILLPROJECTC\PROJECT\SQL\SKILLDB.MDF] 

DROP TABLE Customers
  DROP TABLE Orders

CREATE TABLE Customers(
	CustomerNO int IDENTITY NOT NULL, 
	CustomerName varchar(25) NOT NULL,
	Address1 varchar(25) NOT NULL,
	City     varchar(15) NOT NULL,
	Contact  varchar(25) NOT NULL,
	Phone char(12)    
  )


-- �������� ����������������� ����������� �� ������������ �������	

ALTER TABLE Customers ADD CONSTRAINT CH_CustPhoneNo
  -- ����������� CHECK
  CHECK (Phone LIKE '([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
  GO

INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)1231212');

SELECT * FROM Customers

INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******'); -- ������ (�� ������������ �������).

-------------------------------------------------------------------------















