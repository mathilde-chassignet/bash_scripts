#!/bin/bash
if [ $# = 0 ]
then
	echo "class template: Please provide a name for your class template file";
	exit 1;
fi
for class in $@
do
	file="$class.hpp"
	if [ -e $file ]
	then
		echo "class template: The file $file already exists!";
	else
		touch $file;
		define_name=${file^^}
		define_name=${define_name//./_}

		echo -e "#ifndef $define_name
# define $define_name

# include <iostream>

template <typename T>
class $class
{
	private:

	public:

		$class(void)
		{
			std::cout << \"$class: Default constructor called\" << std::endl;
			return ;
		}

		$class(/* args */);
		{
			std::cout << \"$class: Parametric constructor called\" << std::endl;
			return ;
		}

		$class($class const &src);
		{
			std::cout << \"$class: Copy constructor called\" << std::endl;
			*this = src;
		}

		$class&	operator=($class const &src);
		{
			std::cout << \"$class: Copy assignement operator called\" << std::endl;
			if (this != &src)
			{
			}
			return (*this);
		}

		~$class(void);
		{
			std::cout << \"$class: Destructor called\" << std::endl;
			return ;
		}
};

#endif" > $file;
	fi
done
