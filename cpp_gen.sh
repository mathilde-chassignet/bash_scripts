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
		
		echo -e "#include \"$class.hpp\"

$class::$class(void)
{
	std::cout << \"$class: Default constructor called\" << std::endl;
	return ;
}

$class::$class(/* args */)
{
	std::cout << \"$class: Parametric constructor called\" << std::endl;
	return ;
}

$class::$class($class const &src)
{
	std::cout << \"$class: Copy constructor called\" << std::endl;
	*this = src;
}

$class&	$class::operator=($class const &src)
{
	std::cout << \"$class: Copy assignement operator called\" << std::endl;
	if (this != &src)
	{
	}
	return (*this);
}

$class::~$class(void)
{
	std::cout << \"$class: Destructor called\" << std::endl;
	return ;
}" > $file;

	fi
done
