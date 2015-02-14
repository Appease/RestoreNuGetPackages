###What is it?
A [Posh-CI](https://github.com/Posh-CI/Posh-CI) step that restores [NuGet](https://nuget.org) packages

###How do I install it?
add an entry in your ci plans `Packages.config` file
```XML
<packages>
  <package id="posh-ci-restorenugetpackages" />
  <!-- other dependencies snipped -->
</packages>
```

###What parameters are available?
#####SlnFilePaths Parameter
explicit paths to .sln files you want packages restored for; default is all .sln files within your project root dir @ any depth
```PowerShell
[string[]][Parameter(ValueFromPipelineByPropertyName=$true)]$SlnAndOrConfigFilePaths
```

###What's the build Status?
![](https://ci.appveyor.com/api/projects/status/ss92f12pyng156lo?svg=true)

