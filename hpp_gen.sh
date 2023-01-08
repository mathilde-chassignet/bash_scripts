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

		echo -e "#ifndef $define_name
# define $define_name

# include <iostream>

class $class
{
	public:
		$class(void);
		$class(/* args */);
		$class($class const &src);
		$class&	operator=($class const &src);
		~$class(void);

	private:

};

#endif" > $file;

	fi
done
