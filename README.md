![](https://ci.appveyor.com/api/projects/status/09rv2imjqinysdsb?svg=true)

####What is it?

An [Appease](http://appease.io) task template that restores [NuGet](https://nuget.org) packages

####How do I install it?

```PowerShell
Add-AppeaseTask `
    -DevOpName YOUR-DEVOP-NAME `
    -Name YOUR-TASK-NAME `
    -TemplateId RestoreNuGetPackages
```

####What parameters are required?
none

####What parameters are optional?

#####IncludeSlnAndOrConfigFilePath
description: a `string[]` representing included .sln and/or .config file paths. Either literal or wildcard paths are allowed.  
default: all .sln files within the project root dir @ any depth.

#####Recurse
description: a `switch` representing whether to include .sln and/or .config files located in sub directories of $IncludeSlnAndOrConfigFilePath (at any depth)