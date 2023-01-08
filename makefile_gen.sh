#!/bin/bash
if [ -e Makefile ]
then
	echo "error: There's already a Makefile here";
	exit 1;
fi
touch Makefile
if [ $# = 1 ]
then
	echo "Creating Makefile with $1 as NAME..."
	echo "NAME = $1" > Makefile;
else	
	echo "Creating Makefile with undefined NAME..."
	echo "NAME = " > Makefile;
fi
echo '
CC = c++
CXX_FLAGS = -Wall -Wextra -Werror
CXX_FLAGS += -std=c++98
CPP_FLAGS = -MMD

CXX_ROOT = main
CXX_FILES = $(addsuffix .cpp, $(CXX_ROOT))

O_FILES = $(CXX_FILES:cpp=o)
D_FILES = $(O_FILES:o=d)

H_INCLUDES = -I .

all: $(NAME)

-include : $(D_FILES)

%.o: %.cpp
	$(CC) $(CXX_FLAGS) $(CPP_FLAGS) $(H_INCLUDES) -c $< -o $@

$(NAME): $(O_FILES)
	$(CC) $(CXX_FLAGS) $(O_FILES) -o $(NAME)

clean:
	rm -f $(O_FILES) $(D_FILES)

fclean: clean
	rm -f $(NAME)

re: fclean
	make all

.PHONY: all clean fclean re' >> Makefile;
