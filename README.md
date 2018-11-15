项目名：docker for lnmp

## 1. 如何运行

> cd service  
 ./service.sh build 构建基础镜像   
 ./service.sh start 构建容器  
 ./service.sh stop 停止并清除容器     

相关软件版本：  
>PHP 7.2  
 MySQL 5.6  
 Nginx 1.12  
 Redis 3.2

PHP 拓展：
>redis 3.1.4  
Phalcon 3.0.4
  
启动 ：http://127.0.0.1 

## 2. 目录

```shell
- config
--|-- mysql
--|-- nginx
--|--|-- conf.d
--|-- php
--|-- redis
- data
- logs 
- service 
--|-- docker-compose.yml
--|-- mysql
--|-- nginx
--|-- php
--|-- redis
- www


