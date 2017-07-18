#!/bin/sh
dir=`dirname $0`
dir=`cd $dir;pwd`

main=$1
lib="$dir/lib"
src="$dir/src"

classpath=""
for dep in `ls $lib` 
do
classpath=${classpath}:${lib}/$dep
done
echo $classpath
classpath=./src/${classpath}

java_file=""
for file in `find ${src} -name *.java`
do
  echo $file
  java_file="${java_file} $file"
done
echo $java_file
echo $classpath
java -cp $classpath $main

