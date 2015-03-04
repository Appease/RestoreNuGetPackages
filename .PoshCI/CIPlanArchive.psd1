[PSCustomObject]@{
	Steps = [Ordered]@{
		CreatePoshCIPackage = [PSCustomObject]@{
			Name = [String]"CreatePoshCIPackage"; 
			PackageId = [String]"CreatePoshCIPackage"; 
			PackageVersion = [String]"0.0.2"
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
