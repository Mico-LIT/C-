USE [C:\REPOSITORIES\SKILL\SKILLPROJECTC\PROJECT\SQL\SKILLDB.MDF]
GO
--------------------------------------------------------------------------
--				������������� ������. ����������� GROUP BY
--------------------------------------------------------------------------

-- ������������� - ������� ����������� ���������

-- WHERE �������� �� �����������, � HAVING �������� ������ � ������������.
  SELECT mf.LstName, COUNT(*) -- �������������� ������� COUNT()
  FROM MyFriends mf
    --WHERE mf.FrndId IN (1,2,3,4)
  GROUP BY mf.LstName
  HAVING count(*)>2
