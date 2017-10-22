$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'rubberduck' # arbitrary name for the package, used in messages
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version = '2.1.0'
$url = "https://github.com/rubberduck-vba/Rubberduck/releases/download/v$version/Rubberduck.Setup.$version.exe"
$url64 = $url # 64bit URL here or remove - if installer is both, use $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url           = $url
  url64bit      = $url64
  registryUninstallerKey = '{979AFF96-DD9E-4FC2-802D-9E0C36A60D09}_is1' #ensure this is the value in the registry
  silentArgs = "/VERYSILENT"
}

Install-ChocolateyPackage @packageArgs
