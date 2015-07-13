$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'rubberduck' # arbitrary name for the package, used in messages
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/rubberduck-vba/Rubberduck/releases/download/v1.4/Rubberduck.Setup.1.4.0.0.exe' # download url
$url64 = $url # 64bit URL here or remove - if installer is both, use $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url           = $url
  url64bit      = $url64
  registryUninstallerKey = 'Rubberduck' #ensure this is the value in the registry
}

Install-ChocolateyPackage @packageArgs
