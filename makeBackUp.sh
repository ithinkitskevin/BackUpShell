#! /bin/bash

: '
This Bash Script it to copy a file in the current directory and copies all the files in the current directory into a file called backup(1/2/3 depends) that will still be on the curr file. There is not that much usage out of this but this was a nice practice...
'

x='0'

for dir in */
do
	if [ $dir == "klBackup"$x"/" ]
	then
		x=$[$x+1]
	fi
done

# echo "it worked, created the file called:klBackup"$x
mkdir "klBackup"$x

count='0'
for file in *
do
	if [ -f $file ]
	then
		# echo $file
		count=$[$count+1]
		cp $file klBackup$x
	fi
done

curr="$(pwd)"

echo "Copied $count files into directory klBackup$x that's located at $curr"

