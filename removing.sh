#!bin/sh

echo '***** YOUR WATCHLIST ******'
cat watchlist.csv

echo 'enter the stock symbol to remove from your watchlist(press END to exit): '
read rst
while [ $rst != 'END' ]
do
	sed -i "/\\$rst/d" watchlist.csv
	echo 'enter the stock symbol to remove from your watchlist(press END to exit): '
	read rst
done
