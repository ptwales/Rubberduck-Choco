# Rubberduck-Choco
Chocolatey package for Rubberduck
  - Have Chocolatey installed
```
    `PS> iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))` 
```
  - Clone this repo
  - Inside the cloned repo, build the package 
```
    `PS> cpack`
```
  - Install the local package
```
    `PS> choco install rubberduck -s $pwd`
```
  - Uninstall rubberduck with `choco uninstall rubberduck`
  - Eventually I will push this to chocolately and then you can just use
```
    PS> choco install rubberduck
```
