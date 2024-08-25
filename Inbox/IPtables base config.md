#firewall #iptables 
```bash
# Default Filter chains rules
-A INPUT -j DROP
-A FORWARD -j DROP
-A OUTPUT -j ACCEPT
# Allow worked connection
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -m state --state INVALID -j DROP

-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -m state --state INVALID -j DROP

-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -m state --state INVALID -j DROP

# Allow loopback
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
-A FORWARD -i lo -o lo -j ACCEPT

```