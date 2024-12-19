# uv

- [GitHub Repo](https://github.com/astral-sh/uv)

## Add uv to an existing repository
```
$ uv init .
```

## Add packages
```
$ uv add ruff
```

## Run python using your uv environment
```
$ uv run python3 main.py
```

## Using uv in a container
[Using uv in Docker](https://docs.astral.sh/uv/guides/integration/docker/)

Example Containerfile:
```
FROM ghcr.io/astral-sh/uv:python3.12-alpine@sha256:9eeae5eaadeeefebe101a44d2321692f40542a864767ecaee4f57a7f1ee973d4
COPY --from=ghcr.io/astral-sh/uv:0.5.10 /uv /uvx /bin/

ADD . /code

WORKDIR /code
RUN uv sync --frozen

CMD ["uv", "run", "python3", "script.py"]
```
