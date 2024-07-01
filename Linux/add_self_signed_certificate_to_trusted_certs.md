# Add a self-signed certificate to trusted certs

## Ubuntu
[How do you add a certificate authority (CA) to Ubuntu?](https://superuser.com/questions/437330/how-do-you-add-a-certificate-authority-ca-to-ubuntu)
```
$ sudo cp root_cert.crt /usr/local/share/ca-certificates
$ sudo update-ca-certificates
```
