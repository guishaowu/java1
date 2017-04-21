#!/bin/sh
dir=`dirname $0`
dir=`cd $dir;pwd`

lib="$dir/lib"
src="$dir/src"

classpath=""
for dep in `ls $lib` 
do
classpath=${classpath}:${lib}/$dep
done
echo $classpath

java_file=""
for file in `find ${src} -name *.java`
do
  echo $file
  java_file="${java_file} $file"
done
echo $java_file
javac $java_file -cp $classpath
