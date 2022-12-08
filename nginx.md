# nginx Configurations

## Remove the default nginx homepage
```
sudo rm /etc/nginx/sites-enabled/default
```

## Redirect HTTP traffic to HTTPS
Add the following to `/etc/nginx/sites-available/mysite.com`
```
server {
    listen 80 default_server;

    server_name _;

    return 301 https://$host$request_uri;
}
```
