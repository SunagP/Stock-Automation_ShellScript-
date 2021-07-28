#!bin/sh

echo '***** YOUR WATCHLIST ******'
cat watchlist.csv

echo 'enter the stocks you want to buy(press END to exit):'
read bst
while [ $bst != 'END' ]
do
	grep -i $bst nifty50.csv >> stocks_bought.csv
	echo 'enter the stocks you want to buy(press END to exit):'
	read bst
done

if [ $(ls|grep "stocks_bought.csv") ];
then
	echo '****** YOUR BOUGHT STOCKS *******'
	cat stocks_bought.csv
fi
