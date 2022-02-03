# Why does CORS exist?

* [What is the issue CORS is trying to solve?](https://stackoverflow.com/a/27365346])
* [same-origin policy and CORS - what's the point?](https://stackoverflow.com/questions/29167428/same-origin-policy-and-cors-whats-the-point)

In simple terms, browsers enforce this to prevent malicious websites from performing requests on other websites using your cookies. An example of this would be a malicious website using JavaScript to log you out of stackoverflow. If the stackoverflow server enabled CORS for a specific website, say `stackoverflow-extension.com`, then a user could access stackoverflow APIs from `stackoverflow-extension.com`.

# The Basics:
1. CORS stands for [Cross-Origin Resource Sharing](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)
2. CORS is required for the browser to send HTTP requests to another domain. An example of this is dashboard.acme.mil attempting to talk with rhcs.acme.mil
3. There are two types of requests: [simple requests](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS#simple_requests), and [preflighted requests](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS#preflighted_requests)
    * Simple requests are either GET/HEAD/POST and they must follow specific Content-Types
    * Preflighted requests cover all requests that don’t fall under the “simple requests” category and are a bit more convoluted
4. CORS configurations are set up server-side, so if you don’t have control of the server, there’s nothing you can do to make the server accept CORS requests.

# Understanding Preflighted Requests:
1. Preflighted requests are automatically sent by the browser if the browser detects that your CORS request is not a simple request.
2. There is nothing you can do to modify the preflight request since it is controlled by the browser.
3. You can’t ignore the preflight request response because if it fails, the browser won’t even send the subsequent HTTP request.

# The Chrome Problem:
Part of the reason why the preflight request CORS problem is so annoying to debug is because **different browsers have different behavior**. [Chrome has been violating the Fetch spec for years](https://bugs.chromium.org/p/chromium/issues/detail?id=775438) so just because it works in Chrome doesn’t mean that it will work in other browsers. Firefox has correctly been following the spec so to make sure that everything is working correctly you need to make a CORS request from Firefox.

# The Enterprise Application Authentication Problem:
To make matters worse, **some enterprise applications violate the spec**. Firefox had to introduce an option just to allow users to force Firefox to violate the spec so that Firefox would work with some enterprise authentication services.
* See `network.cors_preflight.allow_client_cert`
