### Install

sudo apt-get install mailutils ssmtp

### ssmtp setup:

sudo nano /etc/ssmtp/ssmtp.conf
```
Debug=YES
root=<email>
mailhub=smtp.gmail.com:587
rewriteDomain=gmail.com
hostname=<localhost>
FromLineOverride=YES
UseSTARTTLS=YES
TLS_CA_File=/etc/ssl/certs/ca-certificates.crt
AuthUser=<email>
AuthPass=<passwd>
```

sudo nano /etc/ssmtp/revaliases
```
root:<email>:smtp.gmail.com:587
<username>:<email>:smtp.gmail.com:587
```

to monitor: sudo journalctl -f | grep -i ssmtp

helpful link: https://github.com/taw00/howto/blob/master/howto-configure-send-only-email-via-smtp-relay.md

### run from terminal:

./sendIP_infinite.sh \<target email> \<subject>
