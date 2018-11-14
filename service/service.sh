#!/bin/bash
#set -e
#set -x

cd `dirname $0`

script=$0
action=$1

case $action in
  "build")
    for file in "redis" "mysql" "nginx" "php"
    do
      cd $file 
      docker-compose up -d
      docker-compose down
      if [ $file == "mysql" ]
      then
      	docker rmi "${file}:5.6"
      elif [ $file == "php" ]
      then
	docker rmi "${file}:7.2-fpm"
      else
        docker rmi $file
      fi
      cd ../
    done
    echo "ready to start"
  ;;
  "start")
    docker-compose up -d
  ;;
  "stop")
    docker-compose down
  ;;
  *)
    echo "usage: $0 [start|stop]"
  ;;
esac
