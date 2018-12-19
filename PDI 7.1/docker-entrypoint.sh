#!/bin/bash
echo "====================================================================================="
echo " PDI DOCKER START                                                                    "
echo "====================================================================================="

git_url=$1
project=$2
obj=$3
ext="${obj:(-4)}" #Расширение файла

echo "====================================================================================="
echo " GIT clone                                                                           "
echo "====================================================================================="

git clone $git_url $KETTLE_REPOSITORY

echo "====================================================================================="
echo " Start transformation                                                                "
echo "====================================================================================="

case $ext in
     .ktr)
         sh $KETTLE_HOME/pan.sh -file=$KETTLE_REPOSITORY/$project/$obj --norepo;; #Запуск трансформации
     .kjb)
         sh $KETTLE_HOME/kitchen.sh -file=$KETTLE_REPOSITORY/$project/$obj --norepo;; #Запуск задания
     *) 
         echo 'Error in start script';;
esac

