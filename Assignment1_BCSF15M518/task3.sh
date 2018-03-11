#!/bin/bash

ls_lower() 
{
	var="IN FUNCTION"
	declare -l new=$var
	echo "Original String : "$var
	echo "Lower Case : " $new
}

is_root()
{
is_root=`whoami`
root="root"
if [ "$is_root" = "root" ]
then 
	return 0;
fi
}


is_user_exsist()
{
is_exsist=`cat /etc/passwd | grep $1`
if [ "$is_exsist" ]
then
	return 0
fi

}

#------main--------------------------------------------------------------------------------- 

ls_lower 

is_user_exsist "sumbal"
if [ $? -eq 0 ]
then 
	echo "Exsist"
else
	echo "Not Exsist"
fi

is_root 
if [ $? -eq 0 ]
then 
	echo "Executed by root"
else
	echo "Not executed by root"
fi
