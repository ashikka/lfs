ln -s /dev/null /etc/systemd/network/99-default.link

cat > /etc/systemd/network/10-ether0.link << "EOF"
[Match]
# Change the MAC address as appropriate for your network device
MACAddress=12:34:45:78:90:AB

[Link]
Name=ether0
EOF

cat > /etc/systemd/network/10-eth-static.network << "EOF"
[Match]
Name=ether0

[Network]
Address=192.168.0.2/24
Gateway=192.168.0.1
EOF

cat > /etc/systemd/network/10-eth-dhcp.network << "EOF"
[Match]
Name=<ether0

[Network]
DHCP=ipv4

[DHCP]
UseDomains=true
EOF

ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

cat > /etc/resolv.conf << "EOF"
# Begin /etc/resolv.conf

domain <Your Domain Name>
nameserver <IP address of your primary nameserver>
nameserver <IP address of your secondary nameserver>

# End /etc/resolv.conf
EOF

cat > /etc/resolv.conf << "EOF"
# Begin /etc/resolv.conf

nameserver 8.8.8.8 
nameserver 8.8.4.4
nameserver 2001:4860:4860::8888
nameserver 2001:4860:4860::8844

# End /etc/resolv.conf
EOF

echo "localhost" > /etc/hostname

cat > /etc/hosts << "EOF"
# Begin /etc/hosts

127.0.0.1 localhost
127.0.1.1 <FQDN> <HOSTNAME>
::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts
EOF