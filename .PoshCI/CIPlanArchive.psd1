[PSCustomObject]@{
	Steps = [Ordered]@{
		CreateNuGetPackage = [PSCustomObject]@{
			Name = [String]"CreateNuGetPackage"; 
			PackageId = [String]"CreateNuGetPackage"; 
			PackageVersion = [String]"0.0.1"
		}; 
		PushNupkg = [PSCustomObject]@{
			Name = [String]"PushNupkg"; 
			PackageId = [String]"PushNupkg"; 
			PackageVersion = [String]"0.0.6"; 
			Parameters = [Hashtable]@{
				IncludeNupkgFilePath = [String[]]@(
					[String]".\*"
				)
			}
		}
	}
}
