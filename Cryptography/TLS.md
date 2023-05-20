# TLS
All SSL certificates have a public key

## How does HTTPS work?
This is oversimplified but gets the point across:
1. Client sends a request to the server.
2. Server sends its SSL certificate (public key) back to the client.
3. Client starts the TLS handshake process and sends data encrypted with the server's public key. Since the server has the private key, only the server can decrypt these messages.
4. Once the TLS handshake process is done, the client and server exchange session keys and can then begin exchanging data.

## How are man in the middle attacks avoided?
TODO
