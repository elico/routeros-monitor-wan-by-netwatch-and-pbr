/ip route
add disabled=no distance=10 dst-address=0.0.0.0/0 gateway=192.168.101.254 routing-table=WAN1 scope=30 \
    suppress-hw-offload=no target-scope=10
add disabled=no distance=20 dst-address=0.0.0.0/0 gateway=192.168.102.254 routing-table=WAN2 scope=30 \
    suppress-hw-offload=no target-scope=10
add disabled=no distance=30 dst-address=0.0.0.0/0 gateway=192.168.103.254 routing-table=WAN3 scope=30 \
    suppress-hw-offload=no target-scope=10
add disabled=no distance=40 dst-address=0.0.0.0/0 gateway=192.168.104.254 routing-table=WAN4 scope=30 \
    suppress-hw-offload=no target-scope=10

