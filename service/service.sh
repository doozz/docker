#!/bin/bash
#set -e
#set -x

cd `dirname $0`

script=$0
action=$1
service=("mysql" "redis" "nginx" "php")
case $action in
  "build")
    for file in "mysql" "redis" "nginx"
    do
      echo $file
    done
    echo "ready to start"
  ;;
  "start")
    docker-compose up -d
  ;;
  "stop")
    docker-compose stop
  ;;
  "login")
    docker exec -it redis_for_ttxs redis-cli
  ;;
  *)
    echo "usage: $0 [start|stop]"
  ;;
esac
