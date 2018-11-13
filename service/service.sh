#!/bin/bash
#set -e
#set -x

cd `dirname $0`

script=$0
action=$1
service=("mysql","redis","nginx","php")
case $action in
  "build")
    for file in $service
    do
      cd $file 
      docker-compose up -d
      docker-compose down 
      docker rm "${file}_service"
      docker rm "$file"
      cd ../
      echo "{$file}_service images is done"
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
