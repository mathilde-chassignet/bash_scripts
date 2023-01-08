#!/bin/bash
if [ $# = 0 ]
then
	echo "class: Please provide a name for your class";
	exit 1;
fi
path="/mnt/nfs/homes/mchassig/Documents/bash_scripts/"
for class in $@
do
	bash "$path/cpp_gen.sh" $class;
	bash "$path/hpp_gen.sh" $class;
done
