# halt immediately on any errors which occur in this module
$ErrorActionPreference = "Stop"

function EnsureNuGetCommandLineInstalled(){
    # install nuget-commandline
    try{
        Get-Command nuget -ErrorAction Stop | Out-Null
    }
    catch{             
        cinst 'nuget.commandline'
    }    
}

function Invoke-CIStep(

[String]
[ValidateNotNullOrEmpty()]
[Parameter(
    Mandatory=$true,
    ValueFromPipelineByPropertyName=$true)]
$PoshCIProjectRootDirPath,

[String[]]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$IncludeSlnAndOrConfigFilePath,

[Switch]
[Parameter(
    ValueFromPipelineByPropertyName=$true)]
$Recurse){

    EnsureNuGetCommandLineInstalled
    
    # default to recursively picking up any .sln files below the project root directory path
    if(!$IncludeSlnAndOrConfigFilePath){
    
        $SlnAndOrConfigFilePath = gci -Path "$PoshCIProjectRootDirPath" -File -Recurse  -Filter '*.sln' | %{$_.FullName}
    
    }
    else{
        
        $SlnAndOrConfigFilePath = gci -File -Path $IncludeSlnAndOrConfigFilePath -Recurse:$Recurse -Filter "Packages.config" | %{$_.FullName}   
        $SlnAndOrConfigFilePath += gci -File -Path $IncludeSlnAndOrConfigFilePath -Recurse:$Recurse -Filter "*.sln" | %{$_.FullName}
               
    }

Write-Debug `
@"
`Located sln & or Packages.config files:
$($SlnAndOrConfigFilePath | Out-String)
"@

    foreach($slnOrConfigFilePath in $SlnAndOrConfigFilePaths)
    {        
        # invoke restore
        nuget restore $slnOrConfigFilePath

        # handle errors
        if ($LastExitCode -ne 0) {
            throw $Error
        }
    }

}

Export-ModuleMember -Function Invoke-CIStep
