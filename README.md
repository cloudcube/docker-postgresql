Docker-PostgreSQL
==========

Deploy Postgresql Server on Docker,You can build postgresql docker with this dockerfile  

## create a folder for postgresql data  
```
sudo mkdir ~/pgdata  
```
## run docker backend  
```
docker run -d -p 5432:5432 -v ~/pgdata:/var/lib/pgsql/9.3:rw -e POSTGRESQL_USER=<Your username> -e POSTGRESQL_PASS=<Your password> -e POSTGRESQL_DB=<Database name> &   
e.g:  
sudo docker run -d -p 5432:5432 -v ~/pgdata:/var/lib/pgsql/9.3:rw -e POSTGRESQL_USER=demo -e POSTGRESQL_PASS=demo -e POSTGRESQL_DB=demo 'cloudcube/postgresql' &  
```

note:  
-v 指定container卷存储，container的路径要和run脚本中的POSTGRESQL_DATA一致.  
postgresql openssl未配置成功.  


