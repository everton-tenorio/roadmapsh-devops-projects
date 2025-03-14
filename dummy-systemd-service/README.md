# Dummy Systemd Service 

1 - `sudo su`
2 - `vim dummy.sh`

```bash
#!/bin/bash

while true; do
  echo "[OK]Dummy service is running..." >> /var/log/dummy-service.log
  sleep 10
done
```

3 - `cd /etc/systemd/system`
4 - `vim dummy.service`

```bash
[Unit]
Description=Dummy Service
After=network.target

[Service]
ExecStart=/home/ubuntu/dummy.sh
WorkingDirectory=/home/ubuntu
Restart=always

[Install]
WantedBy=multi-user.target

```

5 - `systemctl daemon-reload`
6 - `systemctl enable dummy.service`
7 - `systemctl start dummy.service`
8 - `systemctl status dummy.service`

```bash
● dummy.service - Dummy Service
     Loaded: loaded (/etc/systemd/system/dummy.service; enabled; preset: enabled)
     Active: active (running) since Fri 2025-03-14 19:47:10 UTC; 2s ago
   Main PID: 2201 (dummy.sh)
      Tasks: 2 (limit: 1129)
     Memory: 572.0K (peak: 1.2M)
        CPU: 4ms
     CGroup: /system.slice/dummy.service
             ├─2201 /bin/bash /home/ubuntu/dummy.sh
             └─2202 sleep 10

Mar 14 19:47:10 crf systemd[1]: Started dummy.service - Dummy Service.
Mar 14 19:47:10 crf dummy.sh[2201]: /home/ubuntu/dummy.sh: line 4: /var/log/dummy-service.log
```
9 - check the systemd service logs - `journalctl -u dummy -f`
10 - `systemctl stop dummy.service`
11 - `systemctl disable dummy.service`
12 - `cat /var/log/dummy-service.log`
