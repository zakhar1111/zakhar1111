Import-Module webadministration

#Create-AppPool ---->just create directory
	echo "3) created phisical Site folder"
	$SiteFolderPath = "C:\inetpub\wwwroot\2"              
	if (! (Test-Path -path $SiteFolderPath))
	{
		New-Item $SiteFolderPath -type Directory
        Set-Content $SiteFolderPath\Default.htm "<h1>Hello IIS</h1>"
	}

$iisAppPoolName = "NewAppPool"
$iisAppName = "my-2-page.test"

echo "Creating new website"
	new-website -name $iisAppName -port 81 -physicalpath $SiteFolderPath -ApplicationPool ".NET v4.5" -force 
    Set-ItemProperty IIS:\Sites\$SiteName -Name "Bindings" @{protocol="http";bindingInformation=":80:" + $iisAppName}
    #Name 

echo "Adding application pools TestApplication1"
	New-Item IIS:\Sites\$iisAppName -physicalPath $SiteFolderPath -type Application


