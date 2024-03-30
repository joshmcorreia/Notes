# Event Monitoring

## List all event listeners on the page

### Chrome:
[List all event listeners on the entire page](https://devtoolstips.org/tips/en/list-all-event-listeners/)
```
$$("*").map(el => {
  return { el, listeners: getEventListeners(el) };
}).filter(data => {
  return Object.keys(data.listeners).length;
});
```
