USE[C:\REPO\PROJECT\SQL\SKILLDB.MDF]

-------------------------------------------------------------------------
--                            UNION 
-------------------------------------------------------------------------

-- UNION ���������� ���������� ���� �������� SELECT � ������ �������������� �������.

-- ���� ���������� ����� �������� �������� ������ � ������������ ���������� �����,
-- ��, �������� UNION �������� � �������������� ������� ������ ���� ����� ������.

-- ���� � ���������� ������ �� �������� ������� ������ � ����������� ����������,
-- �� ������������ �� � ����� �� ����� ���������� ������� �������, �� ��� ������ 
-- ���-�� ���������� � �������������� �������.

-- �������� UNION ������� ������������� ����� ��������, ������ �� ������� ���������� 
-- ������� � ��������� �������������, ��� ����, ���� � ���������� �������� ������ ���������.

SELECT * FROM JoinTest1 
UNION 
SELECT * FROM JoinTest2 


-------------------------------------------------------------------------
--                            UNION ALL
-------------------------------------------------------------------------

-- UNION ALL ���������� ���������� ���� �������� SELECT � ������ �������������� �������.

-- ���� ���������� ����� �������� �������� ������ � ������������ ���������� �����,
-- ��, �������� UNION ALL �������� � �������������� ������� ��� ������������� ������.

-- ���� � ���������� ������ �� �������� ������� ������ � ����������� ����������,
-- �� ������������ �� � ����� �� ����� ���������� ������� �������, �� ��� ������ 
-- ���-�� ���������� � �������������� �������.

-- �������� UNION ALL ������� ������������� ����� ��������, ������ �� ������� ���������� 
-- ������� � ��������� �������������, ��� ����, ���� � ���������� �������� ������ ���������.

  SELECT * FROM JoinTest1 jt
    UNION ALL 
  SELECT* FROM JoinTest2 jt

    
-------------------------------------------------------------------------
--                            EXCEPT
-------------------------------------------------------------------------

-- �������� EXCEPT ��������� ���������� ������� �������. 

-- ���� ��������� ������ ������� �������� EXCEPT �������� ���������� ������, �� ����������� 
-- �� � ����� �� ����� ������� �������, ��, ������ ����� ������ ���������� � �������������� �������. 
-- ���������� ������ ������� ������� �������� EXCEPT, ������� �� ������ � �������������� �������.

-- ���� ���������� ����� �������� �������� ����������� ������, ��, �������� EXCEPT ���������� ��.

-- �������� EXCEPT ������� ������������� ����� ��������, ������ �� ������� ���������� 
-- ������� � ��������� �������������, ��� ����, ���� � ���������� �������� ������ ���������.
  
  SELECT * FROM JoinTest1 
  EXCEPT
  SELECT * FROM JoinTest2 

    
-------------------------------------------------------------------------
--                             INTERSECT 
-------------------------------------------------------------------------

-- INTERSECT ���������� ���������� ���� �������� SELECT � ������ �������������� �������.

-- ���� ���������� ����� �������� �������� ������ � ������������ ���������� �����,
-- ��, �������� INTERSECT �������� � �������������� ������� ������ ���� ����� ������.

-- ���� � ���������� ������ �� �������� ������� ���������� ������, 
-- �� ����������� �� � ����� �� ����� ���������� ������� �������, 
-- �� ����� ������ ������������ ��������� INTERSECT.

-- �������� INTERSECT ������� ������������� ����� ��������, ������ �� ������� ���������� 
-- ������� � ��������� �������������, ��� ����, ���� � ���������� �������� ������ ���������.

  SELECT * FROM JoinTest1 
  INTERSECT
  SELECT * FROM JoinTest2 
