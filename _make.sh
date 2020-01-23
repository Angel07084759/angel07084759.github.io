git add .

#git commit -m "`date '+%Y-%m-%d %H:%M:%S'`"
read -p "Enter message: " userInput
git commit -m "`date '+%Y-%m-%d %H:%M:%S'` => $userInput"
git push

if [ "$e" -gt "0" ]; then
date="`date '+%b %d, %Y; %H:%M:%S; %Z'`"
>data_changed.txt
$date > data_changed.txt
echo "Changes Date: $date"
fi
read -p "Press [Enter] to continue..."

