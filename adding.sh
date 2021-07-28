#!bin/sh
echo ""
echo 'enter the stock symbol to add to your watchlist(press END to exit): '
read st
while [ $st != 'END' ]
do
	grep -i $st nifty50.csv >> watchlist.csv
	echo 'enter: '
	read st
done
