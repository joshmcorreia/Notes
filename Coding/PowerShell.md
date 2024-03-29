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

## If statement:
```
$exit_code = 1
if ($exit_code -ne 0) { echo "ERROR"; return 1}
```

## Check that a file exists:
[Source](https://stackoverflow.com/a/31881297)
```
[System.IO.File]::Exists(/tmp/home/file.txt)
> True
```
OR
```
Test-Path /tmp/home/file.txt -PathType Leaf
> True
```

## Print out the current time:
```
Get-Date
> Friday, July 29, 2022 4:16:26 PM
```
OR
```
Get-Date -Format u
> 2022-07-29 16:16:58Z
```

## Zip a folder:
[Source](https://stackoverflow.com/a/29284372)
```
Compress-Archive -Path C:\stuff -DestinationPath stuff.zip
```

## Unzip a file:
[Source](https://stackoverflow.com/a/27771099)
```
Expand-Archive C:\stuff.zip -DestinationPath C:\stuff
```

## Time how long a command takes:
[Source](https://stackoverflow.com/a/4801509)
```
Measure-Command {echo hi}
> Days              : 0
> Hours             : 0
> Minutes           : 0
> Seconds           : 0
> Milliseconds      : 5
> Ticks             : 53395
> TotalDays         : 6.17997685185185E-08
> TotalHours        : 1.48319444444444E-06
> TotalMinutes      : 8.89916666666667E-05
> TotalSeconds      : 0.0053395
> TotalMilliseconds : 5.3395
```
The above command will eat the output of the command by default, so to keep the command output use the following:
```
Measure-Command {echo hi | Out-Default}
> hi
>
> Days              : 0
> Hours             : 0
> Minutes           : 0
> Seconds           : 0
> Milliseconds      : 5
> Ticks             : 53395
> TotalDays         : 6.17997685185185E-08
> TotalHours        : 1.48319444444444E-06
> TotalMinutes      : 8.89916666666667E-05
> TotalSeconds      : 0.0053395
> TotalMilliseconds : 5.3395
```
The output from the `Measure-Command` is quite ugly compared to the output from the `time` command on Linux, so [here's a command](https://stackoverflow.com/a/17815328) that provides more useful output:
```
Measure-Command {echo hi} | select @{n="time";e={$_.Hours,"Hours",$_.Minutes,"Minutes",$_.Seconds,"Seconds",$_.Milliseconds,"Milliseconds" -join " "}}
> time
> ----
> 0 Hours 0 Minutes 0 Seconds 10 Milliseconds
```

## Print out the PowerShell version:
```
echo $PSVersionTable
```

## Determine if you're in PowerShell or CMD:
[Source](https://stackoverflow.com/a/61469226)
```
(dir 2>&1 *`|echo CMD);&<# rem #>echo ($PSVersionTable).PSEdition
```
