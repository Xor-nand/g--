function compile {
	if g++ $1
	then
		if [-e a.out]
		then
			./a.out
		fi
	fi
}

function main {
	if diff $1 $1_
	then
		echo " < reloading file "
		if `echo $1 | grep -qE '.cpp'`
		then
			if [ -e a.out ]
			then
				mv a.out a.out.save
			fi
		else
		echo " > Error : filename is not *.cpp"
		return 1
		fi
	fi
	rm $1_
}

function update {
	cp $1 $1_
}

echo " > file is $1"

if [ -z "$1" ]
then
	echo " > Error : missing file operand"
	exit 1
else
	echo " > using $1"
fi

if [ -e $1 ]
then
	update $1
	main $1
else
	echo " > Error : file $1 doesnt exist"
	exit 1
fi
