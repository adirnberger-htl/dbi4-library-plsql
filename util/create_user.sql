CREATE USER lib
IDENTIFIED BY lib
DEFAULT tablespace USERS
TEMPORARY tablespace temp
quota unlimited ON USERS;

grant connect to lib;
grant resource to lib;
GRANT CREATE ANY VIEW TO lib;
GRANT DROP ANY VIEW TO lib;