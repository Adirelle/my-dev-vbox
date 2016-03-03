CREATE_USER = (ENV['USER'] || ENV['USERNAME']).downcase
LOCAL_HOME = ENV['HOME'] || ENV['USERPROFILE']

Vagrant.configure(2) do |config|
  config.vm.box = "ogarcia/archlinux-x64"
  config.vm.box_check_update = true
  config.vm.hostname = "arch-dev"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "arch-dev"
    vb.gui = true
    vb.memory = 4096
  end

  config.vm.provision "shell", privileged: true, path: "setup-root.sh", env: {CREATE_USER: CREATE_USER}
  
  if File.directory?(LOCAL_HOME+"/.ssh")
    config.vm.provision "file", source: LOCAL_HOME+"/.ssh", destination: "~"+CREATE_USER+"/.ssh"
  end
end
# -*- mode: ruby -*-
# vi: set ft=ruby :
