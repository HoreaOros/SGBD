-- user-ul de Windows trebuie sa existe local sau pe domeniu
create login [HOREA-TOSHIBA\horea]
FROM WINDOWS
WITH DEFAULT_DATABASE = AdventureWorks,
DEFAULT_LANGUAGE = English

-- se poate crea un login asociat unui grup
-- toti membri grupului Windows se vor putea conecta la SQL Server
CREATE LOGIN [HOREA-TOSHIBA\Familia]
FROM WINDOWS
WITH DEFAULT_DATABASE= AdventureWorks


