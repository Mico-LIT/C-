USE[C:\REPO\PROJECT\SQL\SKILLDB.MDF]

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

