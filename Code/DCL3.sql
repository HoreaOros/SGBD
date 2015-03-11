USE [master]
GO
DENY CONNECT SQL TO [Horea-Toshiba\Horea]
GO


USE [master]
GO
GRANT CONNECT SQL TO [Horea-Toshiba\Horea]
GO

-- nu se poate
DENY CONNECT SQL TO [Horea-Toshiba\Administrator]