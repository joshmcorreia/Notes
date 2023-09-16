# Python3 requests library

## Getting all cookies from a session
```
>>> import requests
>>> request_session = requests.Session()
>>> url = "https://www.target.com/"
>>> request_session.get(url)
<Response [200]>
>>> print(request_session.cookies)
<RequestsCookieJar[<Cookie TealeafAkaSid=EylBK3YK0DTbtkOr8r9MUb0pzqkNq2OD for .target.com/>, <Cookie sapphire=1 for .target.com/>, <Cookie visitorId=018A9FC531A40201AE1FB8B619C85C9F for .target.com/>, <Cookie GuestLocation=97229|45.540|-122.830|OR|US for www.target.com/>]>
```

## Accessing a specific cookie from a session
```
>>> import requests
>>> request_session = requests.Session()
>>> url = "https://www.target.com/"
>>> request_session.get(url)
<Response [200]>
>>> visitor_id = request_session.cookies.get("visitorId")
>>> print(visitor_id)
018A9FC531A40201AE1FB8B619C85C9F
```
