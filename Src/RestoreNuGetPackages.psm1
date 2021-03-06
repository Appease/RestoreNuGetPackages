# halt immediately on any errors which occur in this module
$ErrorActionPreference = "Stop"

function Invoke(

[String]
[ValidateNotNullOrEmpty()]
[Parameter(
    Mandatory=$true,
    ValueFromPipelineByPropertyName=$true)]
$AppeaseProjectRootDirPath,

[String[]]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$IncludeSlnAndOrConfigFilePath,

[Switch]
[Parameter(
    ValueFromPipelineByPropertyName=$true)]
$Recurse){
        
    # default to recursively picking up any .sln files below the project root directory path
    if(!$IncludeSlnAndOrConfigFilePath){
    
        $SlnAndOrConfigFilePaths = gci -Path $AppeaseProjectRootDirPath -File -Recurse  -Filter '*.sln' | %{$_.FullName}
    
    }
    else{
        
        $SlnAndOrConfigFilePaths = gci -File -Path $IncludeSlnAndOrConfigFilePath -Recurse:$Recurse -Filter "Packages.config" | %{$_.FullName}   
        $SlnAndOrConfigFilePaths += gci -File -Path $IncludeSlnAndOrConfigFilePath -Recurse:$Recurse -Filter "*.sln" | %{$_.FullName}
               
    }

Write-Debug `
@"
`Located sln & or Packages.config files:
$($SlnAndOrConfigFilePaths | Out-String)
"@

    foreach($slnOrConfigFilePath in $SlnAndOrConfigFilePaths)
    {        
        # invoke restore
        nuget restore $slnOrConfigFilePath -NonInteractive

        # handle errors
        if ($LastExitCode -ne 0) {
            throw $Error
        }
    }

}

Export-ModuleMember -Function Invoke
