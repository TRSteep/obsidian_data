#security 

# Info
- https://denyhosts.sourceforge.net/
	- https://sourceforge.net/projects/denyhosts/files/latest/download
- Install
	- https://www.howtoforge.com/preventing_ssh_dictionary_attacks_with_denyhosts

# Install
- go to script path
	- `cd /usr/local/bin`
- create folder
	- `mkdir blacklist`
	- `cd blacklist`
- create script
	- `sudo nano /usr/local/bin/blacklist/blacklist_updater.sh`

## Script
```bash
#!/bin/bash
# Create dir if not exist
sudo mkdir -p /usr/local/bin/blacklist/
# Copy to OLD
sudo mv /usr/local/bin/blacklist/blacklist.txt /usr/local/bin/blacklist/old_blacklist.txt

# Load new blacklist
if ! sudo wget -O /usr/local/bin/blacklist/blacklist.txt https://github.com/C24Be/AS_Network_List/raw/main/blacklists/blacklist.txt; then
echo "Cann't load new blacklist"
echo "$(date +"%Y-%m-%d %H:%M:%S") - Blacklist without change." >> /usr/local/bin/blacklist/blacklist_updater.log
exit 1
fi

# IP address files
OLD_IP_FILE="/usr/local/bin/blacklist/old_blacklist.txt"
NEW_IP_FILE="/usr/local/bin/blacklist/blacklist.txt"
# Get IP from OLD
old_addresses=()
while IFS= read -r ip || [[ -n "$ip" ]]; do
old_addresses+=("$ip")
done < "$OLD_IP_FILE"
# GET IP from NEW
new_addresses=()
while IFS= read -r ip || [[ -n "$ip" ]]; do
new_addresses+=("$ip")
done < "$NEW_IP_FILE"

# Add new IP and Del OLD
added=0
removed=0
for addr in "${new_addresses[@]}"; do
if ! sudo iptables -t raw -C PREROUTING -s "$addr" -j DROP &>/dev/null; then
sudo iptables -t raw -A PREROUTING -s "$addr" -j LOG --log-prefix "Blocked IP attempt: "
sudo iptables -t raw -A PREROUTING -s "$addr" -j DROP
((added++))
fi
done
for addr in "${old_addresses[@]}"; do
if ! grep -q "$addr" "$NEW_IP_FILE"; then
sudo iptables -t raw -D PREROUTING -s "$addr" -j LOG --log-prefix "Blocked IP attempt: "
sudo iptables -t raw -D PREROUTING -s "$addr" -j DROP
((removed++))
fi
done

# Save rules for iptables
sudo sh -c "iptables-save > /etc/iptables/rules.v4"

# Show Info
echo "Added: $added"
echo "Removed: $removed"

# Logging
echo "$(date +"%Y-%m-%d %H:%M:%S") - Added: $added, Removed: $removed" >> /usr/local/bin/blacklist/blacklist_updater.log
```

### Change permission to launch
`sudo chmod +x /usr/local/bin/blacklist/blacklist_updater.sh`

## Launch script 
`sudo /usr/local/bin/blacklist/blacklist_updater.sh`

## 