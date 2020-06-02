#!/bin/bash

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo -e "\e[31mThis script must be run as root\e[39m" 1>&2
   exit 1
fi

# Show usage info if no argument was passed
if [ -z $1 ]
then
	echo -e "\e[33mUsage $0 name_of_application\e[39m"
	exit 0
fi

FILE_MANAGER_PATH=$(which $1)

# Show error if there is no application to set as an alternative
if [ -z $FILE_MANAGER_PATH ]
then
	echo -e "\e[31mThere is no application called \"$1\" in the system\e[39m"
	exit 1
fi

update-alternatives --install /usr/local/bin/file-manager file-manager $FILE_MANAGER_PATH 10
