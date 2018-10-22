#!/bin/sh

sudo cat << EOF >> $O_ServicePath
[Unit]
Description=Shadowsocks client
After=syslog.target network.target

[Service]
Type=forking

ExecStart=/usr/bin/sslocal -c ${O_ConfigPath} -d start
ExecStop=/usr/bin/sslocal -c ${O_ConfigPath} -d stop

Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

