Docker-PostgreSQL
==========

Deploy Postgresql Server on Docker,You can build postgresql docker with this dockerfile  
```
docker run -d -p 5432:5432 -e POSTGRESQL_USER=<Your username> -e POSTGRESQL_PASS=<Your password> -e POSTGRESQL_DB=<Database name> POSTGRESQL_DATA=<Persistence Data>  
e.g:  
docker run -d -p 5432:5432 -e POSTGRESQL_USER=demo -e POSTGRESQL_PASS=demo -e POSTGRESQL_DB=demo -e POSTGRESQL_DATA=~/pgdata  
```

