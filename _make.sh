git add .
e=$?

read -p "Enter message: " userInput
git commit -m "`date '+%Y-%m-%d %H:%M:%S'` => $userInput"

e=$(($e + $?))
if (($e == 0 )); then
date="`date '+%b %d, %Y; %H:%M:%S; %Z'`"
e=$date
echo $date>date
fi

git push

echo "Changes Date: $e"
read -p "Press [Enter] to continue..."

