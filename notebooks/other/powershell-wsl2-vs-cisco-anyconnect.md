# Problem
When connecting to Cisco Anyconnect VPN, usually a corporate vpn it usually leads to wsl failing to resolve DNS servers.

# Solution

**Start by connecting to Cisco Anyconnect VPN**

## On Powershell (as Admin) part 1
List the all the available DNS/nameservers.
```bash
Get-DnsClientServerAddress -AddressFamily IPv4 | Select-Object -ExpandProperty ServerAddresses
```
or check up the nameservers depending on the interface ethernet vs wi-fi. Should have 2 similar IP address on both interfaces, take a note on them.
```bash
Get-DnsClientServerAddress -AddressFamily IPv4
```

Get the search domain. Select the first one in the case of having serveral.
```bash
Get-DnsClientGlobalSetting | Select-Object -ExpandProperty SuffixSearchList
```

## On WSL2
First prevent wsl2 from overwritting the resolve.conf everytime wsl2 is started.

Unlink  the default wsl2 resolv.conf.
```bash
sudo unlink /etc/resolv.conf 
```
Write wsl.conf to stop wsl2 to rewrite resolv.conf.
```bash
cat <<EOF | sudo tee -a /etc/wsl.conf
[network]
generateResolvConf = false
EOF
```

Second, edit resolv.conf to add the corporate nameservers and domain.
Add also add other name servers to avoid having connection blocked. Option Google 8.8.8.8 or Cloudflare 1.1.1.1.
This list is used in the order presented, is recomended to set other nameserver first before the corporate. 
```bash
cat <<EOF | sudo tee -a /etc/resolv.conf
nameserver 8.8.8.8
nameserver 10.50... 
nameserver 10.50...
nameserver 8.8.4.4
search this.searchdomain.com
EOF
```

## On Powershell (as Admin) part 2

Change Cisco Anyconnect metric from default 1 to 6000 inside powershell.
```bash
Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect"} | Set-NetIPInterface -InterfaceMetric 6000
```
Restart wsl2.
```bash
Restart-Service LxssManager
```
