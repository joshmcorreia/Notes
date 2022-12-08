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

## Redirect from a subdirectory to root
[Source](https://serverfault.com/a/816262)

Add the following inside of a server block in `/etc/nginx/sites-available/mysite.com`
```
# redirects all traffic on /dashboard back to root /
location = /dashboard {
      return 301 /;
 }
```
