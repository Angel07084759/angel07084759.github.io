if [ -n "$(git status --porcelain)" ]; then
  echo "there are changes";
else
  echo "no changes";
fi


git add .

read -p "Enter message: " userInput
git commit -m "`date '+%Y-%m-%d %H:%M:%S'` => $userInput"


#if (($e == 0 )); then
date="`date '+%b %d, %Y; %H:%M:%S; %Z'`"
#echo $date>date
#fi
git push
#echo `git status --porcelain`
var=`git status --porcelain`
echo "Changes Date:"
echo $var
read -p "Press [Enter] to continue..."

