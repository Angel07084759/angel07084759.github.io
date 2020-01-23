date="`date '+%b %d, %Y; %H:%M:%S; %Z'`"

if [ -n "$(git status --porcelain)" ]
then
	echo "there are changes!";
	echo $date>date  
	echo "Changes Date: $date"
else
	echo "no changes!";
fi

git add .
read -p "Enter message: " userInput
git commit -m "`date '+%Y-%m-%d %H:%M:%S'` => $userInput"
git push

read -p "Press [Enter] to continue..."

