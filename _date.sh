var=var
git clone alsklkl
e=$?
git clone alsklkl

#e=`echo "$? + $e" | bc`
e=$(($e + $?))

#var="`date '+%b %d, %Y; %H:%M:%S; %Z'`"
#>data_changed.txt
#$var > data_changed.txt
echo $var
read -p "ERR:$e"