**What is it?**
A [Posh-CI](https://github.com/Posh-CI/Posh-CI) step that restores [NuGet](https://nuget.org) packages

**How do I use it?**

add an entry in your ci plans `Packages.config` file
```XML
<packages>
  <package id="posh-ci-restorenugetpackages" />
  <!-- other dependencies snipped -->
</packages>
```

then just pass variables to Invoke-CIPlan according to the following signature 
```POWERSHELL
function Invoke-CIStep(
[string[]][Parameter(Mandatory=$true)]$SlnAndOrConfigFilePaths){
  <# implementation snipped #>
}
```

**What's the build Status?**
![](https://ci.appveyor.com/api/projects/status/ss92f12pyng156lo?svg=true)

