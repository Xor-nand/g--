function compile {
	if [ -e a.out ]
	then
		if [ -e a.out ]
		then
			rm a.out~
		fi
		mv a.out a.out~
	fi
	#clear
	echo "compiling files"
	if g++ $1
	then
		#clear
		echo " > done "
		sleep 2
		compare $1
	else
		echo " > ERROR can't compile "
		sleep 2
		compare $1
	fi
}

function compare {
	echo "comparing files"
	if [ -e $1_ ]
	then
		echo
	else
		echo "file copy"
		cp $1 $1_
		sleep 2
	fi

	if diff -q $1 $1_
	then
		echo "files are equal"
		sleep 2
		compare $1
	else
		echo "files are different"
		cp $1 $1_
		compile $1
	fi
}
echo " > $1"

if [ -z "$1" ]
then
	echo " > Error : missing file operand"
	exit 1
else
	echo " > using file $1"
	if [ -e $1 ]
	then
		if `echo $1 | grep -qE '.cpp'`
		then
			echo "starting compilement"
		else
			echo " > Error : filename is not *.cpp"
			exit 1
		fi
	else
		echo " > Error : file $1 doesn't exist"
		exit 1
	fi
fi
compile $1
