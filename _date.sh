
e=0
e=$(($e + $?))

#if (($e == 0 )); then
date="`date '+%b %d, %Y; %H:%M:%S; %Z'`"
#>data_changed.txt
#$date > data_changed.txt
echo "Changes Date: $date"
#fi


echo $var
read -p "ERR:$e"