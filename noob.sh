#!/bin/bash

# [ Create Directory File ]
mkdir -p /etc/noobzvpns

# [ Membuat Json Config yang di gunakan pada server ]
cat > /etc/noobzvpns/config.json <<-JSON
{
	"tcp_std": [
		8080
	],
	"tcp_ssl": [
		8443
	],
	"ssl_cert": "/etc/xray/xray.crt",
	"ssl_key": "/etc/xray/xray.key",
	"ssl_version": "AUTO",
	"conn_timeout": 60,
	"dns_resolver": "/etc/resolv.conf",
	"http_ok": "HTTP/1.1 101 Switching Protocols[crlf]Upgrade: websocket[crlf]"
}
JSON
# Port Dari tcp_std & tcp_ssl edit sesuai kemauan kalian agar tidak bentrok dengan service lain pada vps kalian


# [ wget ambil file ]
wget -O /usr/bin/noobzvpns "https://raw.githubusercontent.com/noobz-id/noobzvpns/master/noobzvpns.x86_64"

# [ Memberi Izin Exec pada file biner ]
chmod +x /usr/bin/noobzvpns

# [ Mengambil Service yang di perlukan ]
wget -O /etc/systemd/system/noobzvpns.service "https://raw.githubusercontent.com/noobz-id/noobzvpns/master/noobzvpns.service"

# [ Enable & Start Service ]
systemctl enable noobzvpns
systemctl restart noobzvpns

echo " DONE INSTALL NOOBZVPNS"
sleep 2
clear
