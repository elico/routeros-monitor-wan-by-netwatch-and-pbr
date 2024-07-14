{
        :do {
                :log info ("ppp on-up script for interface: " . $interface . " Started" );
                :log info ("ppp on-up script for interface: " . [/interface get $interface name] . " Started" );
                :log info "debug step 1";

                :local interfaceName [/interface get $interface name];
                :local routingTable "DEFAULTWAN";
                :local routeDistance;


                :if ($interfaceName ~"ISP1") do={
                        :set routingTable "ISP1";
                        :set routeDistance 10;
                }

                :if ($interfaceName ~"ISP2") do={
                        :set routingTable "ISP2";
                        :set routeDistance 20;
                }

                :if ($interfaceName ~"ISP3") do={
                        :set routingTable "ISP3";
                        :set routeDistance 30;                        
                }

                :if ($interfaceName ~"ISP4") do={
                        :set routingTable "ISP4";
                        :set routeDistance 40;
                }

                :if ($routingTable = "DEFAULTWAN") do={
                        :log info "There $interface doesn't match any known ROUTING TABLES";
                        break;
                }

                :log info "debug step 2";
                :local routingTableCount [/routing/table/print count-only where name="$routingTable"];

                :if ($routingTableCount = 0) do={
                        /routing/table/add name="$routingTable" fib;
                }
                :log info "debug step 3";

                :local rountesCount [/ip/route/print count-only where comment=($interfaceName . "-" . $routingTable) and routing-table=$routingTable];
                :log info "debug step 4";

                :if ($rountesCount = 0) do={
                        :log info "Count 0";
                        /ip/route/add distance=$routeDistance gateway=$interfaceName comment=($interfaceName . "-" . $routingTable) routing-table="$routingTable";
                } else={
                        :log info "Count more then 0";
                        :if ($count = 1) do={
                                :log info "Count 1";
                                :local test [/ip/route/find where comment=($interfaceName . "-" . $routingTable) and routing-table="$routingTable"]
                                :if ([/ip/route/get $test gateway] != $"interface") do={
                                        /ip/route/set $test gateway=$interfaceName distance=$routeDistance;
                                }
                        } else={
                                :log info "Count more then 1";
                                :log info "Multiple routes found for $routingTable, flushing and repopulating";
                                /ip/route/remove [ find where comment=($interfaceName . "-" . $routingTable) and routing-table="$routingTable"];
                                /ip/route/add distance=$routeDistance gateway=$interfaceName comment=($interfaceName . "-" . $routingTable) routing-table="$routingTable";
                        }
                }
                :log info ("ppp on-up script for interface: " . $interface . " finished Succesfuly" );
        } on-error={
                :log error ("ppp on-up script for interface: " . $interface . " ran into an error" );
        }
}
