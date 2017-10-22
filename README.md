# Rubberduck-Choco

Chocolatey package for Rubberduck.  It's on the chocolately repo now so if you
have [chocolatey installed](https://chocolatey.org/install) already run in
powershell,

```
    PS> choco install rubberduck
```

## Packaging yourself
Clone the repo then package and install
```
    PS> git clone https://github.com/ptwales/Rubberduck-Choco
    PS> cd Rubberduck-Choco
    PS> choco pack
    PS> choco install rubberduck -s $pwd
```
