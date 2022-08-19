# PowerShell Output

## Store command output in a variable
```
$VERSION=$(python3 get_version.py)
echo $VERSION
> 1.0.0
```

## Print command output while storing it in a variable
Usually while storing command output in a variable, the result is _only_ stored in the variable. Sometimes it is useful to print that out to the console as well.

**Doesn't always work:**
```
$VERSION=$(python3 get_version.py)
echo $VERSION # this is never hit if the `python3 get_version.py` command returns a non-zero exit code
> 1.0.0
```

**Does always work:**
```
The way that I get around this on Linux doesn't seem to work on Windows. I have yet to find a solution. :(
```
