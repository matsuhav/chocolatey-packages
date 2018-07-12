$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    softwareName   = ''
    fileType       = 'msi'
    file           = "$toolsDir\"
    silentArgs     = '/quiet /norestart ADDDEFAULT=ALL REMOVE=AddToPath,Icons'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

Install-BinFile gitex "$(Get-AppInstallLocation GitExtensions)\gitex.cmd"
