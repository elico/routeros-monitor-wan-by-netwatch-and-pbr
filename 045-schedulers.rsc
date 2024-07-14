/system scheduler
add interval=2s name=monWan1 on-event="/system/script/run monWan1Status;" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=1970-01-01 start-time=00:00:00
add interval=2s name=monWan2 on-event="/system/script/run monWan2Status;" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=1970-01-01 start-time=00:00:00
add interval=2s name=monWan3 on-event="/system/script/run monWan3Status;" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=1970-01-01 start-time=00:00:00
add interval=2s name=monWan4 on-event="/system/script/run monWan4Status;" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=1970-01-01 start-time=00:00:00
