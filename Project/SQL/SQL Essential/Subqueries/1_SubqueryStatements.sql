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



