git add .
e=$?

read -p "Enter message: " userInput
git commit -m "`date '+%Y-%m-%d %H:%M:%S'` => $userInput"
git push

e=$(($e + $?))

if (($e == 0 )); then
date="`date '+%b %d, %Y; %H:%M:%S; %Z'`"
echo $date>date
echo "Changes Date: $date"
fi

read -p "Press [Enter] to continue..."

