#!/bin/bash
echo "====================================================================================="
echo " PDI DOCKER START  9.0                                                               "
echo "====================================================================================="

git_url=$1
project=$2
obj=$3
ext="${obj:(-4)}" #Расширение файла

echo "====================================================================================="
echo " GIT clone                                                                           "
echo "====================================================================================="

git clone $git_url $USER_KETTLE_REPOSITORY

echo "====================================================================================="
echo " Start PDI                                                                           "
echo "====================================================================================="

case $ext in
     .ktr)
         sh $USER_KETTLE_HOME/pan.sh -file=$USER_KETTLE_REPOSITORY/$project/$obj --norepo;; #Запуск трансформации
     .kjb)
         sh $USER_KETTLE_HOME/kitchen.sh -file=$USER_KETTLE_REPOSITORY/$project/$obj --norepo;; #Запуск задания
     *) 
         echo 'Error in start script';;
esac

