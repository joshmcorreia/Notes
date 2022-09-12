# PowerShell Conditionals

## String Equality
[Source](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.2)
``` powershell
$name="josh"
if ($name -eq "josh") { echo "Hello Josh" }
> Hello Josh
```

## Combining Multiple If Statements
[Source](https://stackoverflow.com/a/564092)
``` powershell
$first="josh"
$last="correia"
if ($first -eq "josh" -and $last -eq "correia") { echo "Hello Josh Correia" }
> Hello Josh Correia
```
