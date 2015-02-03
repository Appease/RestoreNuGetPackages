try {

    . "$PSScriptRoot\Posh-CI-RestoreNuGetPackages\Uninstall.ps1"

    Write-ChocolateySuccess 'Posh-CI-RestoreNuGetPackages'

} catch {

    Write-ChocolateyFailure 'Posh-CI-RestoreNuGetPackages' $_.Exception.Message

    throw 
}
