# mitmproxy

This is a great tool for debugging network traffic. I find it most useful for comparing traffic between my web browser and programs I'm writing that are attempting to replicate what's happening in the browser.

## Starting the web interface
[Docker instructions](https://hub.docker.com/r/mitmproxy/mitmproxy/)

To start the web interface, run the following command:
```
docker run --rm -it -p 8080:8080 -p 127.0.0.1:8081:8081 mitmproxy/mitmproxy mitmweb --web-host 0.0.0.0
```
Open a web browser and go to http://127.0.0.1:8081 to see the web UI

## Setting Firefox to use mitmproxy as a proxy
1. Open Firefox
2. Go to `about:preferences`
3. Type in "proxy" and select "Settings"
4. Select "Manual proxy configuration" and set the HTTP proxy to `127.0.0.1` and the port to `8080`
5. Toggle "Also use this proxy for HTTPS" to ON
6. Click "OK"

## Getting mitmproxy certificate
After setting mitmproxy as the proxy for Firefox you can navigate to http://mitm.it and download the mitmproxy certificate. This webpage has instructions on how to install the certificate either in the browser or on your computer.

## Routing Python traffic through mitmproxy
[How to pass all Python's traffics through a http proxy?](https://stackoverflow.com/questions/31639742/how-to-pass-all-pythons-traffics-through-a-http-proxy)

1. Open a terminal and run the following command:
    ```
    export https_proxy="http://127.0.0.1:8080"
    ```
2. Run your python script
    ```
    python3 script.y
    ```

If you get a `CERTIFICATE_VERIFY_FAILED` error then you need to make your Python script aware of the certificate. Here's an example:
```
r = requests.post(url, data=data, verify='/path/to/public_key.pem')
```

Source: [How to get Python requests to trust a self signed SSL certificate?](https://stackoverflow.com/questions/30405867/how-to-get-python-requests-to-trust-a-self-signed-ssl-certificate)
