ALTER LOGIN Veronica
WITH PASSWORD = 'InfernoIII'
OLD_PASSWORD = 'InfernoII' 
-- membri rolului fixat de server sysadmin 
-- nu trebuie sa stie parola veche pentru a o schimba


ALTER LOGIN Veronica
WITH DEFAULT_DATABASE = [AdventureWorks]


-- se schimba numele login-ului dar permisiunile raman nemodificate
ALTER LOGIN Veronica
WITH NAME = Angela,
PASSWORD = 'BOS2004'


