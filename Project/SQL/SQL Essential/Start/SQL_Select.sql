USE [C:\REPOSITORIES\SKILL\SKILLPROJECTC\PROJECT\SQL\SKILLDB.MDF];
GO
--------------------------------------------------------------------------
--                     ������� ������. ������ SELECT 
--------------------------------------------------------------------------

-- ���������� ������� ���� ������ �� ������� MyFriends.
SELECT * FROM MyFriends; 

-- ���������� ������� ������ �� ������� FstName, ������� MyFriends
SELECT FstName FROM MyFriends; 

-- ���������� ������� ������ �� ������� LstName, ������� MyFriends
SELECT LstName FROM MyFriends; 

SELECT BthDate FROM MyFriends; 

-- ���������� ������� ������ �� �������� FstName � LstName, ������� MyFriends
SELECT FstName, LstName FROM MyFriends; 

-- ���������� ������� ������ �� �������� FstName, LstName � BthDate, ������� MyFriends
SELECT FstName,LstName,BthDate FROM MyFriends; 

--------------------------------------------------------------------------
