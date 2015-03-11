-- se opreste accesul contului la MSSQL 
ALTER LOGIN [Horea-Toshiba\Horea]
DISABLE



ALTER LOGIN [Horea-Toshiba\Horea]
ENABLE


ALTER LOGIN [Horea-Toshiba\Familie]
WITH DEFAULT_DATABASE = master
