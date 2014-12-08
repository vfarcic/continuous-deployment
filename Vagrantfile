# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "yungsang/coreos"
  # config.vm.provision "shell", inline: "nohup etcd & >/dev/null 2>&1", run: "always"
  # config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.network :forwarded_port, host: 8000, guest: 80
  config.vm.network :forwarded_port, host: 9000, guest: 9000
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provider "virtualbox" do |v|
    v.name = "coreos"
    v.memory = 2048
  end
end
