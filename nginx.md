# nginx Configurations

## Remove the default nginx homepage
[Source](https://stackoverflow.com/a/44360897)

```
sudo rm /etc/nginx/sites-enabled/default
```

## Redirect HTTP traffic to HTTPS
[Source](https://serversforhackers.com/c/redirect-http-to-https-nginx)

Add the following to `/etc/nginx/sites-available/mysite.com`
```
server {
    listen 80 default_server;

    server_name _;

    return 301 https://$host$request_uri;
}
```

## Redirect from a subdirectory to root
[Source](https://serverfault.com/a/816262)

Add the following inside of a server block in `/etc/nginx/sites-available/mysite.com`
```
# redirects all traffic on /dashboard back to root /
location = /dashboard {
    return 301 /;
}
```
