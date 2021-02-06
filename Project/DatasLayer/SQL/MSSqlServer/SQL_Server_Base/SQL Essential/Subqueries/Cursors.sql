USE[C:\REPO\PROJECT\SQL\SKILLDB.MDF]

go
-- ������������ ������� ������ ��� ������� �������������!
-- ������ - ����� ������� ������ � ����������, ������� �������������� ������� ������.

  --------------------------- ����������� ������� -------------------------------------

  DECLARE OrdersDetails_cursor CURSOR -- ���������� �������
    FOR 
       SELECT * FROM OrderDetails -- ����� ����� ��� �������

    OPEN OrdersDetails_cursor           -- �������� �������
      CLOSE OrdersDetails_cursor        -- �������� �������
        DEALLOCATE OrdersDetails_cursor -- �������� �������
GO

-- FETCH ��������� ������ �� ������� 


 DECLARE BTree_cursor CURSOR
  SCROLL
  FOR
  SELECT * FROM dbo.BTree

  OPEN BTree_cursor

  DECLARE @FildOne VARCHAR(20),
          @FildTwo VARCHAR(20)
  FETCH NEXT FROM BTree_cursor  -- NEXT ��������� ������ 
    INTO @FildOne,@FildTwo
    SELECT @FildOne,@FildTwo

  FETCH PRIOR FROM BTree_cursor  -- PRIOR - � ��������� ��������
    INTO @FildOne,@FildTwo
    SELECT @FildOne,@FildTwo

  FETCH LAST FROM BTree_cursor --- LAST ��������� ��������� ������
    INTO @FildOne,@FildTwo
    SELECT @FildOne,@FildTwo
  
  FETCH FIRST FROM BTree_cursor -- FIRST ��������� ������ ������
    INTO @FildOne,@FildTwo
    SELECT @FildOne,@FildTwo

  FETCH ABSOLUTE 3 FROM BTree_cursor -- ABSOLUTE n ������� ������ ����� n
    INTO @FildOne,@FildTwo
    SELECT @FildOne,@FildTwo

      SELECT * FROM Btree
  FETCH RELATIVE 5 FROM BTree_cursor -- RELATIVE n ������� n-��� ������ ����� �������
    INTO @FildOne,@FildTwo
    SELECT @FildOne,@FildTwo
  
  CLOSE BTree_cursor
    DEALLOCATE BTree_cursor

GO

SELECT @FildOne,@FildTwo
-- LOCAL - ��������� ������������� ��������� � ������� ������ ����� ���������� �������.

 
DECLARE BTree_cursor CURSOR
  LOCAL
  FOR 
  SELECT * FROM BTree
  
  OPEN BTree_cursor

    DECLARE @FildOne VARCHAR(20),@FildTwo VARCHAR(20)

  FETCH NEXT FROM BTree_cursor
    INTO @FildOne,@FildTwo

    SELECT @FildOne,@FildTwo
 go
DEALLOCATE BTree_cursor -- ������, ��� ��� LOCAL ������ ������.
  go





