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

  if File.directory?('pacman-cache')
    config.vm.synced_folder "pacman-cache", "/var/cache/pacman/pkg", onwer: "root", group:"root", type: "virtualbox"
  end

  config.vm.provision "shell", path: "setup-root.sh", env: {CREATE_USER: CREATE_USER}
end

# -*- mode: ruby -*-
# vi: set ft=ruby :
