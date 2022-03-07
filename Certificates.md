# File Types
## CER / CRT:

`.cer` and `.crt` files are essentially the same thing: a certificate. The certificates may be encoded as binary DER or as ASCII PEM. DER is a binary encoding that can be converted to PEM encoding by using a base64 encode function and surrounding it with the proper headers.

## PKCS7:

A `.p7b`/`.p7m` file consists of one or more `.cer` files.

## PKCS10:

Format of messages sent to a certification authority (CA) to request certification of a public key. Also known as a Certificate Signing Request (CSR). A successful CSR will return a `.p7b` file.

## PKCS12:

A `.p12`/`.pfx` file stores private keys with the corresponding public key certificate, protected by a password.

## How to view certificates in a human-readable format
[Website](https://redkestrel.co.uk/products/decoder/)

___

# Converting Certificates

## Convert a `.p7b` to PEM ([source](https://serverfault.com/a/417286/525626))
```
openssl pkcs7 -inform der -in a.p7b -out a.cer
```

## Export certificates from a `.p12`/`.pfx` ([source](https://unix.stackexchange.com/a/393484/340031))
```
openssl pkcs12 -in INPUT.p12 -clcerts -nokeys | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > OUTPUT.cer
```

## Export private keys from a `.p12`/`.pfx` ([source](https://unix.stackexchange.com/a/393484/340031))
```
openssl pkcs12 -in INPUT.p12 -nocerts -nodes | sed -ne '/-BEGIN PRIVATE KEY-/,/-END PRIVATE KEY-/p' > OUTPUT.key
```
