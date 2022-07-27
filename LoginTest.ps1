<#
    A simple login test script, launches powershell with the given username and password
#>

Param (
    [Parameter(Mandatory=$True,Position=1)]
    [String]$username
)

runas /user:$username "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"