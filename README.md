####What is it?

A [Posh-CI](https://github.com/Posh-CI/Posh-CI) step that restores [NuGet](https://nuget.org) packages

####How do I install it?

```PowerShell
Add-CIStep -Name "YOUR-CISTEP-NAME" -ModulePackageId "Posh-CI-RestoreNuGetPackages"
```

####What parameters are available?

#####SlnAndOrConfigFilePaths
explicit paths to .sln and/or .config files you want packages restored for; default is all .sln files within your project root dir @ any depth
```PowerShell
[string[]][Parameter(ValueFromPipelineByPropertyName=$true)]$SlnAndOrConfigFilePaths
```

####What's the build status?
![](https://ci.appveyor.com/api/projects/status/ss92f12pyng156lo?svg=true)
