# PowerShell Basics

[Source](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_variables?view=powershell-7.2)

## Creating variables:
```
$my_age = 5
```

## Removing the value of a variable:
```
$my_age = 5
Clear-Variable -Name my_age
```
OR
```
$my_age = 5
$my_age = $null
```

## Printing out variables to the console:
```
$my_age = 5
$my_age
```
OR
```
$my_age = 5
echo $my_age
```

## Check that a file exists:
[Source](https://stackoverflow.com/a/31881297)
```
Test-Path /tmp/home/file.txt -PathType Leaf
> True
```

