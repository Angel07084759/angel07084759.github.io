date="`date '+%b %d, %Y; %H:%M:%S; %Z'`"

if [ -n "$(git status --porcelain)" ]
then
	echo "There are changes!";
	echo $date>date
	
	git add .
	read -p "Enter message: " userInput
	git commit -m "`date '+%Y-%m-%d %H:%M:%S'` => $userInput"
	git push
	
	echo ""
	echo "Changes Date: $date"
else
	echo "There are NO changes!";
fi

read -p "Press [Enter] to continue..."

