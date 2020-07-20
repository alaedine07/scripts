#!/bin/bash
if [ $# -eq 0 ]
then echo "how to use: ./sub_finder <domain>"
echo "Ex: ./sub_find www.corp.com"
else
wget $1 2> /dev/null && less index.html | grep "href=" | cut -d ":" -f 2 | cut -d "/" -f 3 | grep name | cut -d '"' -f 1 | grep -v "$i" | uniq > sub.txt
for sub in $(cat sub.txt)
do 
if [[$(ping -c 1 $sub 2> /dev/null )]]
then
echo "$sub +++++++ works"
echo $sub >> valid_sub.txt
else
echo "$sub -------- Error"
fi 
done 

for ip in $(cat valid_sub.txt)
do 
host $ip
host $ip | cut -d " " -f 4 | uniq >> ips.txt
done
echo "Done ......."
fi  