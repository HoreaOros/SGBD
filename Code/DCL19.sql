-- login-ul Windows [JOEPROD\TestUser] primeste dreptul de a 
-- crea si vizualiza baze de date
USE master
GO
GRANT CREATE ANY DATABASE, VIEW ANY DATABASE TO [JOEPROD\TestUser]

-- dreptul de a efectua comanda SHUTDOWN este interzis 
DENY SHUTDOWN TO [JOEPROD\TestUser]

-- dreptul de a folosi SQL Profiler este revocat principalului Veronica si 
-- tuturor principalilor caraora le-a dat acest drept
USE master
GO
REVOKE ALTER TRACE FROM Veronica CASCADE

