﻿$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'rubberduck'
$registryUninstallerKeyName = '{979AFF96-DD9E-4FC2-802D-9E0C36A60D09}_is1' #ensure this is the value in the registry
$msiProductCodeGuid = '{979AFF96-DD9E-4FC2-802D-9E0C36A60D09}'
$shouldUninstall = $true

$local_key       = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName"
$local_key6432   = "HKCU:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName" 
$machine_key     = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName"
$machine_key6432 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName"

$file = @($local_key, $local_key6432, $machine_key, $machine_key6432) `
    | ?{ Test-Path $_ } `
    | Get-ItemProperty `
    | Select-Object -ExpandProperty UninstallString

if ($file -eq $null -or $file -eq '') {
    Write-Host "$packageName has already been uninstalled by other means."
    $shouldUninstall = $false
}

# The below is somewhat naive and built for EXE installers
$installerType = 'EXE' 
$silentArgs = '/SILENT'
$validExitCodes = @(0)

if (!(Test-Path $file)) {
    Write-Host "$packageName has already been uninstalled by other means."
    $shouldUninstall = $false
}

if ($shouldUninstall) {
 Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $file
}

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{979AFF96-DD9E-4FC2-802D-9E0C36A60D09}_is1