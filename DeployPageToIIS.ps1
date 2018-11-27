Import-Module ServerManager

Add-WindowsFeature -Name Web-Server,Web-Mgmt-Console -IncludeAllSubFeature

Import-Module webadministration

$SiteFolderPath = "C:\inetpub\wwwroot\3"                                      # Website Folder
$SiteAppPool = "MyAppPool"                                                    # Application Pool Name
$SiteName = "MySite"                                                          # IIS Site Name
$SiteHostName = "my-3-page.test"                                              # Host Header - address

if (! (Test-Path -path $SiteFolderPath))
{
    New-Item $SiteFolderPath -type Directory
    Set-Content $SiteFolderPath\Default.htm "<h1>Hello IIS</h1>"
}

if(!(Test-Path -path IIS:\AppPools\$SiteAppPool))
{
    New-Item IIS:\AppPools\$SiteAppPool #-force
}

if(!(Test-Path -path IIS:\Sites\$SiteName))
{ 
    New-Item IIS:\Sites\$SiteName  -bindings @{protocol="http";bindingInformation=":80:"+$SiteHostName} -physicalPath $SiteFolderPath
    Set-ItemProperty IIS:\Sites\$SiteName -name applicationPool -value $SiteAppPool
}