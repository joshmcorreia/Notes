## Reactor
[Reactor System](https://docs.saltproject.io/en/latest/topics/reactor/index.html#reactor-system)

## Jinja with Reactors
[Source](https://docs.saltproject.io/en/latest/topics/reactor/index.html#reactor-system)

It is important to note that reactors are different from state files, mainly in that Grain and Pillar data is NOT available. If you need access to this data, you have to pass it in via a `data` field from the Beacon.

