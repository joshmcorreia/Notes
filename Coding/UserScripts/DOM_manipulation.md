# DOM Manipulation
- [Userscript to wait for page to load before executing code techniques?](https://stackoverflow.com/a/47406751)
- [Observe mutations on a target node that doesn't exist yet](https://stackoverflow.com/a/38882022)

# Wait for elements to load

When waiting for elements to load you want to use [MutationObserver](https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver).

# Detect how an element is changing
Detecting when elements change can be particularly challenging when elements change as soon as the page loads. One way that I've found to be able to monitor specific changes to an element is the following:

1. Create a userscript with the following code:
    ``` javascript
    (new MutationObserver(observe_price_loading)).observe(document, {childList: true, subtree: true});

    function observe_change(changes, observer) {
        if(document.querySelector('.element_to_monitor')) {
            observer.disconnect();
            alert();
        }
    }
    ```
1. Now that the alert paused the page, open up inspect element and find the element that you want. If you're having trouble finding the element you can open up the console and type `document.querySelector('.element_to_monitor');` then right click the output and click "Reveal in Inspector".
1. Right click the element you want to monitor and click "Break on..." then select all 3 options.
