{
	:do {
		:log info ("dhcp-client for interface: " . $interface  . " script Started");

		:local routingTable;

        :local routeDistance;

        # the default "main" routing table has ISP1_ISP2_ISP3_ISP4 failover by default
        :local routingTables { "DEFAULT" };

        :if ($interface ~"^ether1") do={
            :set routeDistance 10;
            :set routingTables { "ISP1"; "ISP1_ISP2"; "ISP1_ISP3"; "ISP1_ISP2_ISP3"; "ISP1_ISP4"; "ISP1_ISP3_ISP4"; "ISP1_ISP2_ISP4" };
        }

        :if ($interface ~"^ether2") do={
            :set routeDistance 20;
            :set routingTables { "ISP2"; "ISP1_ISP2"; "ISP2_ISP3"; "ISP1_ISP2_ISP3"; "ISP2_ISP4"; "ISP2_ISP3_ISP4"; "ISP1_ISP2_ISP4" };
        }

        :if ($interface ~"^ether3") do={
            :set routeDistance 30;
            :set routingTables { "ISP3"; "ISP1_ISP3"; "ISP2_ISP3"; "ISP1_ISP2_ISP3"; "ISP3_ISP4";"ISP2_ISP3_ISP4"; "ISP1_ISP3_ISP4" };
        }

        :if ($interface ~"^ether4") do={
            :set routeDistance 40;
            :set routingTables { "ISP4"; "ISP1_ISP4"; "ISP2_ISP4"; "ISP1_ISP2_ISP4"; "ISP3_ISP4"; "ISP2_ISP3_ISP4"; "ISP1_ISP3_ISP4" };
        }

        :if ([:len $routingTables] = 1) do={
            :log info "Not one of the known interfaces"
            break;
        }     

        :foreach n in=$routingTables do={
            :set routingTable "$n";
          
            :local routingTableCount [/routing/table/print count-only where name="$routingTable"];

            :if ($routingTableCount = 0) do={
                /routing/table/add name="$routingTable" fib;
            }

            :local count [/ip route print count-only where comment=($routingTable,"-",$interface) and routing-table=$routingTable]

            :if ($bound=1) do={
                :if ($count = 0) do={
                    /ip route add gateway=$"gateway-address" comment=($routingTable,"-",$interface) routing-table=$routingTable distance=$routeDistance;
                } else={
                    :if ($count = 1) do={
                        :local test [/ip route find where comment=($routingTable,"-",$interface) and routing-table=$routingTable]
                        :if ([/ip route get $test gateway] != $"gateway-address") do={
                            /ip route set $test gateway=$"gateway-address";
                        }
                    } else={
                        :log info "Multiple routes found for $routingTable";
                    }
                }
            } else={
                /ip route remove [find comment=($routingTable,"-",$interface)];
            }  

        }

		:log info ("dhcp-client for interface: " . $interface  . " script Finished Succesfully");
	} on-error={
		:log info ("dhcp-client for interface: " . $interface  . " script Finished with error");
	}
}
