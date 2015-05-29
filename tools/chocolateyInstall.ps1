$packageName = 'Rubberduck'
$fileType = 'exe'

$urlx64 = 'https://github.com/retailcoder/Rubberduck/releases/download/v1.22/Rubberduck.1.22.Setup.x64.exe'
$urlx86 = 'https://github.com/retailcoder/Rubberduck/releases/download/v1.22/Rubberduck.1.22.Setup.x86.exe'
# this check OS version not office version...
$url = if ([Environment]::Is64BitOperatingSystem) { $urlx64 } else { $urlx86 }
$silentArgs = ''
Write-Output $url
#Install-ChocolateyPackage $packageName $fileType "$silentArgs" "$url"