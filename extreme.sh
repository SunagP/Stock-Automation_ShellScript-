#!bin/sh

awk '{ print $(NF-1)}' nifty50.csv | sort | head -n -7 >> sort.csv

grep "-" sort.csv | sort -r | head -n 5 >> losers.csv
grep "+" sort.csv | sort -r | head -n 5 >> gainers.csv

sed -i "s/-//" losers.csv

echo "*******TOP GAINERS********"
echo ""
while IFS= read -r line
 	do
 		grep -i $line nifty50.csv		
 	done < gainers.csv
 	
echo "*******TOP LOSERS*********"
echo ""

while IFS= read -r line
 	do
 	 grep -i $line nifty50.csv >> losers1.csv
 	 
 	done < losers.csv
 	grep -v "+" losers1.csv	
rm sort.csv gainers.csv losers.csv losers1.csv
