#------------------------------------------------------------------------------------------------------------------------
# inline scripts
#------------------------------------------------------------------------------------------------------------------------
# Test PowerShell script installs web server on guest machine.
$TestWebInstall = <<SCRIPT
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
SCRIPT
#------------------------------------------------------------------------------------------------------------------------
$Test2WebInstall = <<SCRIPT
echo 'Creating github.com\elastic in the GOPATH'
SCRIPT
#------------------------------------------------------------------------------------------------------------------------
Vagrant.configure("2") do |config|

	config.vm.box = "Name_Of_Machine"
	config.vm.box_url = "C:\\Users\\Test\\Downloads\\windows2016_vbox.box" #direct url || local path 
	#config.vm.box_url = "jacqinthebox/windowsserver2016"
 	
	config.vm.provider "virtualbox" do |vmconfig|
		vmconfig.name = "TTTT"
	end
	#config.vm.synced_folder 'C:\Users\Test\SharedForVirtual', '/vagrant' SharedFoldersEnabledSymlinksCreate: true
	#config.vm.synced_folder "../data_folder_on_host", "/vagrant_data_folder_on_guest"

	config.vm.communicator = "winrm"	#for windows guest	
				#config.vm.provision "shell", inline: $TestWebInstall		dont work
				#config.vm.provision "shell", path: $env:\\vboxsvr\vagrant\v.3.ps1 dont work
#OK	config.vm.provision "shell", path:  "C:\\Users\\Test\\555\\v.3.ps1"  #OK
	config.vm.provision "shell", path: "C:\\Users\\Test\\555\\installChocoSql.ps1"	
	config.vm.provision "shell", path: "C:\\Users\\Test\\555\\DeployPageToIIS.ps1"
	#config.vm.provision "shell" do |s|
		#s.inline = "echo I am provisioning choco"
		#s.inline = "iex((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"	#-OK
		#s.inline = "choco install visualstudiocode -y"	#-OK
		#s.inline = "choco install sql-server-express -y" #-OK
	#end 
end
