import pywhatkit as kit
import sys
from datetime import datetime

now = datetime.now()

current_time = now.strftime("%H:%M")
#print("Current Time =", current_time,current_time[0:2],current_time[3:])
mssg = "there is some fluctuation "+sys.argv[1]
print(mssg)
kit.sendwhatmsg("+916366278120",mssg,int(current_time[0:2]),int(current_time[3:])+1)
