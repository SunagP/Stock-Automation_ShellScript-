#! bin/sh
# */10 10-16 * * 1-5 cd /home/yourname/projdir && /bin/bash update.sh

curl https://in.finance.yahoo.com/quote/%5ENSEI/components?p=%5ENSEI|html2text|awk '/^Currency in INR/{p=1}p'|sed '1,2d'|head -n -4 > nifty50.csv

# if [ $(ls|grep watchlist.csv) ];
# then
# 	while IFS= read -r line
# 	do
# 		#echo $line | sed 's/ .*//' >> tmp.csv
# 		echo $line | awk '{print $1,$3}'  >> tmp.csv
# 	done < watchlist.csv
# 
# 	rm watchlist.csv
# 	cat tmp.csv
# 
# 	while IFS= read -r line
# 	do
# 		grep -i $line nifty50.csv >> watchlist.csv
# 	done < tmp.csv
# 
# 	rm tmp.csv
# fi

if [ $(ls|grep watchlist.csv) ];
 then
awk '{print $1}'  watchlist.csv >> tmp.csv
rm watchlist.csv
while IFS= read -r line
 	do
 		grep -i $line nifty50.csv >> watchlist.csv
 	done < tmp.csv
 
 	rm tmp.csv
fi




if [ $(ls|grep stocks_bought.csv) ];
then
	awk '{print $1}' stocks_bought.csv >> tmp.csv
	awk '{print $1,$(NF-3)}'  stocks_bought.csv >> comp.csv
	rm stocks_bought.csv
	count=0
	while IFS= read -r line
	do   
	        
		grep -i $line nifty50.csv >> stocks_bought.csv
		((count=count+1))
		
	done < tmp.csv
	awk '{print $1,$(NF-3)}' stocks_bought.csv >> comp2.csv
	i=0
	msg1=""
	msg2=""
	check1=0
	check2=0
	while [ $count -gt 0 ]
	do 
	 price1=$(awk -v c=$count 'NR == c {print $2}' comp.csv)
	 price2=$(awk -v c=$count 'NR == c {print $2}' comp2.csv)
	 p1=$(echo "$price1" | sed 's/,//')
	 p2=$(echo "$price2" | sed 's/,//')
	 compare=$(echo "scale=3; $p2 / $p1" | bc -l)
	 if (( $( echo "$compare > 1.025"| bc -l) )); 
	      then
	      msg1+=$(awk -v c=$count 'NR == c {print $1}' comp2.csv)
	      msg1+=","
	      check1=1
	  fi 
	  
	  if (( $( echo "$compare < 0.975" | bc -l) ));
	  then
	  msg2+=$(awk -v c=$count 'NR == c {print $1}' comp2.csv)
	  msg2+=","
	  check2=1
	  fi
	  
	  ((count=count-1)) 
	done 
	msg1+="->stock_values_are_gaining"
	msg2+="->stock_values_are_crashing"
	
	if [ $check1 -eq 1 ];
	  then
	  	/usr/bin/python3 mail.py $msg1
	  	/usr/bin/python3 pytry.py $msg1
	  fi 
	if [ $check2 -eq 1 ];
	  then
	  	/usr/bin/python3 mail.py $msg2
	  	/usr/bin/python3 pytry.py $msg2
	  fi
	rm tmp.csv comp.csv comp2.csv
fi

