/system scheduler
add interval=2s name=monIsp1 on-event="/system/script/run monIsp1Status;" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=1970-01-01 start-time=00:00:00
add interval=2s name=monIsp2 on-event="/system/script/run monIsp2Status;" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=1970-01-01 start-time=00:00:00
add interval=2s name=monIsp3 on-event="/system/script/run monIsp3Status;" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=1970-01-01 start-time=00:00:00
add interval=2s name=monIsp4 on-event="/system/script/run monIsp4Status;" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=1970-01-01 start-time=00:00:00
