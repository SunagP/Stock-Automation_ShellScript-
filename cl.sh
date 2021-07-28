#! /bin/sh
banner Welcome_to CrazyStocks
echo ""
echo '			***** Top 30 components *****'
echo ""
cat nifty50.csv


while :
do

echo ""
echo "	***********************MAIN MENU*******************"
echo ""
echo "			1.EDIT WATCHLIST"	
echo "			2.BUY STOCKS"
echo "			3.VIEW STOCKS BOUGHT"
echo "			4.VIEW TOP GAINERS AND TOP LOSERS"
echo "			0.EXIT"
read option
case "$option" in
	0 )
	exit
	;;
   	1 )
   	while :
   	do
   	echo "			1.ADD STOCKS TO WATCHLIST"
   	echo "			2.REMOVE STOCKS FROM WATCHLIST"
	echo "			3.VIEW WATCHLIST"
	echo "			4.CLEAR WATCHLIST"
	echo "			5.MAIN MENU"
	read choice
	case "$choice" in
		1 )
		bash adding.sh
	      ;;
		
	      
	   	2 )
	      bash removing.sh
	      ;;
	      	3 )
	      	echo ""
	      if [ $(ls | grep watchlist.csv) ];
	      then 
	      	cat watchlist.csv
	      else
	      	echo "your watchlist is empty"
	      fi
	      ;;
	      4 )
	      rm watchlist.csv
      	      ;;
	      5 )
	      break
	      ;;
	      * )
     	     echo "PLEASE ENTER AN APPROPRIATE OPTION"
              ;;
         esac
         done
         ;;
   	2 )
      bash buying.sh
      ;;
      	3 )
      	echo ""
      	if [ $(ls | grep stocks_bought.csv) ];
      	then
      		cat stocks_bought.csv
      	else
      		echo "you don't own any stocks"
      	fi
      ;;
      	4 )
      bash extreme.sh
      ;;
      	 
      
   * )
     echo "PLEASE ENTER AN APPROPRIATE OPTION"
     ;;
esac
done
