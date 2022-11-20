#!/bin/bash
if [ $# = 0 ]
then
	echo "cpp: Please provide a name for your .cpp class file";
	exit 1;
fi
for class in $@
do
	file="$class.cpp"
	if [ -e $file ]
	then
		echo "cpp: The file $file already exists!";
	else
		touch $file;
		echo "#include \"$1.hpp\"" > $file;
		echo -e "\n$1::$1(void)\n{\n\treturn ;\n}" >> $file;
		echo -e "\n$1::$1(/* args */)\n{\n\treturn ;\n}" >> $file;
		echo -e "\n$1::$1($1 const &src)\n{\n\t*this = src;\n}" >> $file;
		echo -e "\n$1::~$1(void)\n{\n\treturn ;\n}" >> $file;
	fi
done
