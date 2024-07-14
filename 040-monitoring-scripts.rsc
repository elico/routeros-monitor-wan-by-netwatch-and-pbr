/system script
add dont-require-permissions=yes name=monIsp1Status owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\r\
    \n\t:local interfaceName1 \"ether1\";\r\
    \n\t:local intrfaceSrcAdress1 \"10.1.1.1\"\r\
    \n\t:local routeDistance1 10;\r\
    \n\r\
    \n\t:local interfaceName2 \"ether2\";\r\
    \n\t:local intrfaceSrcAdress2 \"10.2.2.2\"\r\
    \n\t:local routeDistance2 20;\r\
    \n\t\r\
    \n\t:local interfaceName3 \"ether3\";\r\
    \n\t:local intrfaceSrcAdress3 \"10.3.3.3\"\r\
    \n\t:local routeDistance3 30;\r\
    \n\r\
    \n\t:local interfaceName4 \"ether4\";\r\
    \n\t:local intrfaceSrcAdress4 \"10.4.4.4\"\r\
    \n\t:local routeDistance4 40;\r\
    \n\t\r\
    \n\t:local ispInterfaceName;\r\
    \n\t:local srcAdress;\r\
    \n\t:local routeDistance;\r\
    \n\t:local badRouteDistance;\r\
    \n\r\
    \n\t:set ispInterfaceName \$interfaceName1;\r\
    \n\t:set srcAdress \$intrfaceSrcAdress1;\r\
    \n              :set routeDistance \$routeDistance1;\r\
    \n              :set badRouteDistance (\$routeDistance1+100);\r\
    \n\t\r\
    \n\t:local test1Address \"1.1.1.1\";\r\
    \n\t:local test2Address \"8.8.8.8\";\r\
    \n\t:local test3Address \"208.67.222.222\";\r\
    \n\r\
    \n\t:local ispTest1 ([/tool/netwatch/get [find where host=\$test1Address and src-address=\$srcAdress] status]);\r\
    \n\t:local ispTest2 ([/tool/netwatch/get [find where host=\$test2Address and src-address=\$srcAdress] status]);\r\
    \n\t:local ispTest3 ([/tool/netwatch/get [find where host=\$test3Address and src-address=\$srcAdress] status]);\r\
    \n\t:local worksCounter 0;\r\
    \n\r\
    \n              :if (\$ispTest1 = \"up\") do={\r\
    \n\t\t:set worksCounter (\$worksCounter +1);\t\r\
    \n\t}\r\
    \n\r\
    \n              :if (\$ispTest2 = \"up\") do={\r\
    \n\t\t:set worksCounter (\$worksCounter+1);\t\r\
    \n\t}\r\
    \n\r\
    \n\t:if (\$ispTest3 = \"up\") do={\r\
    \n\t\t:set worksCounter (\$worksCounter+1);\t\r\
    \n\t}\r\
    \n\r\
    \n\t:if (\$worksCounter > 0) do={\r\
    \n\t\t:log info (\"There is internet connectivity on Interface \" . \$ispInterfaceName .\", Nothing should be done\
    \");\r\
    \n                             /ip/dhcp-client/set [find where interface=\"\$ispInterfaceName\" and default-route-d\
    istance>100] default-route-distance=\$routeDistance; \r\
    \n\t} else={\r\
    \n\t\t:log info (\"There is no internet connectivity on Interface \". \$ispInterfaceName .\", The Metric of the int\
    erface should be changed\");\r\
    \n                            /ip/dhcp-client/set [find where interface=\"\$ispInterfaceName\" and default-route-di\
    stance<100] default-route-distance=\$badRouteDistance  ;\r\
    \n\t}\r\
    \n}"
add dont-require-permissions=yes name=monIsp2Status owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\r\
    \n\t:local interfaceName1 \"ether1\";\r\
    \n\t:local intrfaceSrcAdress1 \"10.1.1.1\"\r\
    \n\t:local routeDistance1 10;\r\
    \n\r\
    \n\t:local interfaceName2 \"ether2\";\r\
    \n\t:local intrfaceSrcAdress2 \"10.2.2.2\"\r\
    \n\t:local routeDistance2 20;\r\
    \n\t\r\
    \n\t:local interfaceName3 \"ether3\";\r\
    \n\t:local intrfaceSrcAdress3 \"10.3.3.3\"\r\
    \n\t:local routeDistance3 30;\r\
    \n\r\
    \n\t:local interfaceName4 \"ether4\";\r\
    \n\t:local intrfaceSrcAdress4 \"10.4.4.4\"\r\
    \n\t:local routeDistance4 40;\r\
    \n\t\r\
    \n\t:local ispInterfaceName;\r\
    \n\t:local srcAdress;\r\
    \n\t:local routeDistance;\r\
    \n\t:local badRouteDistance;\r\
    \n\r\
    \n\t:set ispInterfaceName \$interfaceName2;\r\
    \n\t:set srcAdress \$intrfaceSrcAdress2;\r\
    \n              :set routeDistance \$routeDistance2;\r\
    \n              :set badRouteDistance (\$routeDistance2+100);\r\
    \n\t\r\
    \n\t:local test1Address \"1.1.1.1\";\r\
    \n\t:local test2Address \"8.8.8.8\";\r\
    \n\t:local test3Address \"208.67.222.222\";\r\
    \n\r\
    \n\t:local ispTest1 ([/tool/netwatch/get [find where host=\$test1Address and src-address=\$srcAdress] status]);\r\
    \n\t:local ispTest2 ([/tool/netwatch/get [find where host=\$test2Address and src-address=\$srcAdress] status]);\r\
    \n\t:local ispTest3 ([/tool/netwatch/get [find where host=\$test3Address and src-address=\$srcAdress] status]);\r\
    \n\t:local worksCounter 0;\r\
    \n\r\
    \n              :if (\$ispTest1 = \"up\") do={\r\
    \n\t\t:set worksCounter (\$worksCounter +1);\t\r\
    \n\t}\r\
    \n\r\
    \n              :if (\$ispTest2 = \"up\") do={\r\
    \n\t\t:set worksCounter (\$worksCounter+1);\t\r\
    \n\t}\r\
    \n\r\
    \n\t:if (\$ispTest3 = \"up\") do={\r\
    \n\t\t:set worksCounter (\$worksCounter+1);\t\r\
    \n\t}\r\
    \n\r\
    \n\t:if (\$worksCounter > 0) do={\r\
    \n\t\t:log info (\"There is internet connectivity on Interface \" . \$ispInterfaceName .\", Nothing should be done\
    \");\r\
    \n                             /ip/dhcp-client/set [find where interface=\"\$ispInterfaceName\" and default-route-d\
    istance>100] default-route-distance=\$routeDistance; \r\
    \n\t} else={\r\
    \n\t\t:log info (\"There is no internet connectivity on Interface \". \$ispInterfaceName .\", The Metric of the int\
    erface should be changed\");\r\
    \n                            /ip/dhcp-client/set [find where interface=\"\$ispInterfaceName\" and default-route-di\
    stance<100] default-route-distance=\$badRouteDistance  ;\r\
    \n\t}\r\
    \n}"
add dont-require-permissions=yes name=monIsp3Status owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\r\
    \n\t:local interfaceName1 \"ether1\";\r\
    \n\t:local intrfaceSrcAdress1 \"10.1.1.1\"\r\
    \n\t:local routeDistance1 10;\r\
    \n\r\
    \n\t:local interfaceName2 \"ether2\";\r\
    \n\t:local intrfaceSrcAdress2 \"10.2.2.2\"\r\
    \n\t:local routeDistance2 20;\r\
    \n\t\r\
    \n\t:local interfaceName3 \"ether3\";\r\
    \n\t:local intrfaceSrcAdress3 \"10.3.3.3\"\r\
    \n\t:local routeDistance3 30;\r\
    \n\r\
    \n\t:local interfaceName4 \"ether4\";\r\
    \n\t:local intrfaceSrcAdress4 \"10.4.4.4\"\r\
    \n\t:local routeDistance4 40;\r\
    \n\t\r\
    \n\t:local ispInterfaceName;\r\
    \n\t:local srcAdress;\r\
    \n\t:local routeDistance;\r\
    \n\t:local badRouteDistance;\r\
    \n\r\
    \n\t:set ispInterfaceName \$interfaceName3;\r\
    \n\t:set srcAdress \$intrfaceSrcAdress3;\r\
    \n              :set routeDistance \$routeDistance3;\r\
    \n              :set badRouteDistance (\$routeDistance3+100);\r\
    \n\t\r\
    \n\t:local test1Address \"1.1.1.1\";\r\
    \n\t:local test2Address \"8.8.8.8\";\r\
    \n\t:local test3Address \"208.67.222.222\";\r\
    \n\r\
    \n\t:local ispTest1 ([/tool/netwatch/get [find where host=\$test1Address and src-address=\$srcAdress] status]);\r\
    \n\t:local ispTest2 ([/tool/netwatch/get [find where host=\$test2Address and src-address=\$srcAdress] status]);\r\
    \n\t:local ispTest3 ([/tool/netwatch/get [find where host=\$test3Address and src-address=\$srcAdress] status]);\r\
    \n\t:local worksCounter 0;\r\
    \n\r\
    \n              :if (\$ispTest1 = \"up\") do={\r\
    \n\t\t:set worksCounter (\$worksCounter +1);\t\r\
    \n\t}\r\
    \n\r\
    \n              :if (\$ispTest2 = \"up\") do={\r\
    \n\t\t:set worksCounter (\$worksCounter+1);\t\r\
    \n\t}\r\
    \n\r\
    \n\t:if (\$ispTest3 = \"up\") do={\r\
    \n\t\t:set worksCounter (\$worksCounter+1);\t\r\
    \n\t}\r\
    \n\r\
    \n\t:if (\$worksCounter > 0) do={\r\
    \n\t\t:log info (\"There is internet connectivity on Interface \" . \$ispInterfaceName .\", Nothing should be done\
    \");\r\
    \n                             /ip/dhcp-client/set [find where interface=\"\$ispInterfaceName\" and default-route-d\
    istance>100] default-route-distance=\$routeDistance; \r\
    \n\t} else={\r\
    \n\t\t:log info (\"There is no internet connectivity on Interface \". \$ispInterfaceName .\", The Metric of the int\
    erface should be changed\");\r\
    \n                            /ip/dhcp-client/set [find where interface=\"\$ispInterfaceName\" and default-route-di\
    stance<100] default-route-distance=\$badRouteDistance  ;\r\
    \n\t}\r\
    \n}"
add dont-require-permissions=yes name=monIsp4Status owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\r\
    \n\t:local interfaceName1 \"ether1\";\r\
    \n\t:local intrfaceSrcAdress1 \"10.1.1.1\"\r\
    \n\t:local routeDistance1 10;\r\
    \n\r\
    \n\t:local interfaceName2 \"ether2\";\r\
    \n\t:local intrfaceSrcAdress2 \"10.2.2.2\"\r\
    \n\t:local routeDistance2 20;\r\
    \n\t\r\
    \n\t:local interfaceName3 \"ether3\";\r\
    \n\t:local intrfaceSrcAdress3 \"10.3.3.3\"\r\
    \n\t:local routeDistance3 30;\r\
    \n\r\
    \n\t:local interfaceName4 \"ether4\";\r\
    \n\t:local intrfaceSrcAdress4 \"10.4.4.4\"\r\
    \n\t:local routeDistance4 40;\r\
    \n\t\r\
    \n\t:local ispInterfaceName;\r\
    \n\t:local srcAdress;\r\
    \n\t:local routeDistance;\r\
    \n\t:local badRouteDistance;\r\
    \n\r\
    \n\t:set ispInterfaceName \$interfaceName4;\r\
    \n\t:set srcAdress \$intrfaceSrcAdress4;\r\
    \n              :set routeDistance \$routeDistance4;\r\
    \n              :set badRouteDistance (\$routeDistance4+100);\r\
    \n\t\r\
    \n\t:local test1Address \"1.1.1.1\";\r\
    \n\t:local test2Address \"8.8.8.8\";\r\
    \n\t:local test3Address \"208.67.222.222\";\r\
    \n\r\
    \n\t:local ispTest1 ([/tool/netwatch/get [find where host=\$test1Address and src-address=\$srcAdress] status]);\r\
    \n\t:local ispTest2 ([/tool/netwatch/get [find where host=\$test2Address and src-address=\$srcAdress] status]);\r\
    \n\t:local ispTest3 ([/tool/netwatch/get [find where host=\$test3Address and src-address=\$srcAdress] status]);\r\
    \n\t:local worksCounter 0;\r\
    \n\r\
    \n              :if (\$ispTest1 = \"up\") do={\r\
    \n\t\t:set worksCounter (\$worksCounter +1);\t\r\
    \n\t}\r\
    \n\r\
    \n              :if (\$ispTest2 = \"up\") do={\r\
    \n\t\t:set worksCounter (\$worksCounter+1);\t\r\
    \n\t}\r\
    \n\r\
    \n\t:if (\$ispTest3 = \"up\") do={\r\
    \n\t\t:set worksCounter (\$worksCounter+1);\t\r\
    \n\t}\r\
    \n\r\
    \n\t:if (\$worksCounter > 0) do={\r\
    \n\t\t:log info (\"There is internet connectivity on Interface \" . \$ispInterfaceName .\", Nothing should be done\
    \");\r\
    \n                             /ip/dhcp-client/set [find where interface=\"\$ispInterfaceName\" and default-route-d\
    istance>100] default-route-distance=\$routeDistance; \r\
    \n\t} else={\r\
    \n\t\t:log info (\"There is no internet connectivity on Interface \". \$ispInterfaceName .\", The Metric of the int\
    erface should be changed\");\r\
    \n                            /ip/dhcp-client/set [find where interface=\"\$ispInterfaceName\" and default-route-di\
    stance<100] default-route-distance=\$badRouteDistance  ;\r\
    \n\t}\r\
    \n}"

