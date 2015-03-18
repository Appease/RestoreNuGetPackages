####What is it?

A [PoshDevOps](https://github.com/PoshDevOps/PoshDevOps) step that restores [NuGet](https://nuget.org) packages

####How do I install it?

```PowerShell
Add-PoshDevOpsTask -Name "YOUR-CISTEP-NAME" -PackageId "RestoreNuGetPackages"
```

####What parameters are available?

#####IncludeSlnAndOrConfigFilePath
A String[] representing included .sln and/or .config file paths. Either literal or wildcard paths are allowed; Default is all .sln files within the project root dir @ any depth
```PowerShell
[String[]]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$IncludeSlnAndOrConfigFilePath
```

#####Recurse
a Switch representing whether to include .sln and/or .config files located in sub directories of $IncludeSlnAndOrConfigFilePath (at any depth)
```PowerShell
[Switch]
[Parameter(
    ValueFromPipelineByPropertyName=$true)]
$Recurse
```

####What's the build status?
![](https://ci.appveyor.com/api/projects/status/09rv2imjqinysdsb?svg=true)
