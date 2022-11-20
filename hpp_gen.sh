#!/bin/bash
if [ $# = 0 ]
then
	echo "hpp: Please provide a name for your .hpp class file";
	exit 1;
fi
for class in $@
do
	file="$class.hpp"
	if [ -e $file ]
	then
		echo "hpp: The file $file already exists!";
	else
		touch $file
		define_name=${file^^}
		define_name=${define_name//./_}
		echo "#ifndef $define_name" > $file;
		echo "# define $define_name" >> $file;
		echo -e "\n# include <iostream>" >> $file;
		echo -e "\nclass $class\n{" >> $file;
		echo -e "\tpublic:" >> $file;
		echo -e "\t\t$class(void);" >> $file;
		echo -e "\t\t$class(/* args */);" >> $file;
		echo -e "\t\t$class($class const &src);" >> $file;
		echo -e "\t\t~$class(void);" >> $file;
		echo -e "\n\tprivate:" >> $file;
		echo -e "\n};" >> $file;
		echo -e "\n#endif" >> $file;
	fi
done
