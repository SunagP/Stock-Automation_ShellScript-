import smtplib
import sys
sender="sunagp.is19@bmsce.ac.in"
reciever=["sumithhegde.is19@bmsce.ac.in"]
msg="there is some fluctuations in your stocks "+ sys.argv[1]
try:
    x=smtplib.SMTP('smtp.gmail.com',587)
    x.starttls()
    x.login(sender,"pannag@2707")
    x.sendmail(sender,reciever,msg)
    print("sent")
except:
    print("not sent")
