# linux_Ip_changer
the linux Ip changer Tool is a script that automates the process of rotating your IP address while connected to the TOR network. This tool can be useful for maintaining anonymity and bypassing certain restrictions by frequently changing your IP address.
Before using this tool, you need:
```
* TOR installed
* curl
* netcat (nc)
* Git
```
Install TOR:
```
sudo apt install tor
```
Edit TOR config:
```
sudo nano /etc/tor/torrc
```
Add:
```
ControlPort 9051
CookieAuthentication 1
```

Start TOR:
```
sudo systemctl start tor
```

stop TOR:
```
sudo systemctl stop tor
```

How to install: 
```
git clone https://github.com/Medoo2611/linux_Ip_changer
cd linux_Ip_changer
chmod +x linux_Ip_changer.sh
```
Usage:
```
./linux_Ip_changer.sh
```
Enter the IP address to use (default 127.0.0.1):
Enter the port to use (default 9050):
Enter the IP address change time (default 120):

to stop the tool:
```
ctrl + c 
```
test Your TOR Connection
You can verify TOR connection manually:
```
curl -s --socks5 127.0.0.1:9050 https://httpbin.org/ip
```

