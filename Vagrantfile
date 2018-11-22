Vagrant.configure("2") do |config|
  # one of the followers
	config.vm.box = "Name_Of_Machine"
	config.vm.box_url = "C:\\Users\\Test\\Downloads\\windows2016_vbox.box" #direct url || local path 
  	config.vm.communicator = "winrm"	#for windows guest

	#config.vm.synced_folder "../data_folder_on_host", "/vagrant_data_folder_on_guest"

	config.vm.provision "shell" do |s|
		s.inline = "echo I am provisioning choco"
		s.inline = "iex((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
		s.inline = "choco install visualstudiocode"
	end 
	#config.vm.provision "shell", inline: "v.3.ps1"



end