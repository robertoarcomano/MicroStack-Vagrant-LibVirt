Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant"
  config.vm.box = "generic/ubuntu1804"
  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 16384
    libvirt.cpus   = 4
    libvirt.storage :file, :size => '50G', :type => 'raw'
  end
  config.vm.provision "shell" do |s|
    s.path = "provision_script.sh"
  end
  config.vm.define "microstack"
  config.vm.hostname = "microstack"
  config.vm.network :private_network, ip: "10.20.20.1",libvirt__host_ip: "10.20.20.2"
end
