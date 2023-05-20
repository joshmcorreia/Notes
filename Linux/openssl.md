# OpenSSL

## View a certificate in human-readable format
```
openssl x509 -in ca.pem -text
```

## View a CSR in human-readable format
```
openssl req -text -noout -verify -in server.csr
```

---

# Self-Signed Certificates
[YouTube - How to create a valid self signed SSL Certificate?](https://www.youtube.com/watch?v=VH4gXcvkmOY)

## Generate CA private key
**Note:** Make sure to store this passphrase in a secure location such as a password manager
```
openssl genrsa -aes256 -out ca-key.pem 4096
```

## Generate CA public key
Note: Pick a long time for the days because having to recreate your root CA is a pain. For this example I chose 20 years aka 7300 days
```
openssl req -new -x509 -sha256 -days 7300 -key ca-key.pem -out ca.pem
```

In the following example I chose to only provide the Organization Name:
```
$ openssl req -new -x509 -sha256 -days 7300 -key ca-key.pem -out ca.pem
Enter pass phrase for ca-key.pem:
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:
State or Province Name (full name) [Some-State]:
Locality Name (eg, city) []:
Organization Name (eg, company) [Internet Widgits Pty Ltd]:JoshCA
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:
Email Address []:
```

## Generate a private key for your server
```
openssl genrsa -out server-key.pem 4096
```

## Generate a CSR for your server
```
openssl req -new -sha256 -subj "/CN=joshserver.home" -addext "subjectAltName = DNS:joshserver.home" -key server-key.pem -out server.csr
```

## Accept the CSR for your server using the CA cert
```
openssl x509 -req -sha256 -days 3650 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server_cert.pem
```
