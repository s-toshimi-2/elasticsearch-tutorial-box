# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65-x86_64-puppet"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"

  config.vm.define :web1 do |web|
    web.vm.network "private_network", ip: "192.168.33.10"

    web.vm.provision "puppet" do |puppet|
      puppet.manifest_file  = "default.pp"
      puppet.module_path = "modules"
      puppet.facter = {
        "node_name" => "elasticsearch-web01",
      }
    end
  end

  config.vm.define :web2 do |web2|
    web2.vm.network "private_network", ip: "192.168.33.11"

    web2.vm.provision "puppet" do |puppet2|
      puppet2.manifest_file  = "default.pp"
      puppet2.module_path = "modules"
      puppet2.facter = {
        "node_name" => "elasticsearch-web02",
      }
    end
  end

  config.vm.define :web3 do |web3|
    web3.vm.network "private_network", ip: "192.168.33.12"

    web3.vm.provision "puppet" do |puppet3|
      puppet3.manifest_file  = "default.pp"
      puppet3.module_path = "modules"
      puppet3.facter = {
        "node_name" => "elasticsearch-web03",
      }
    end
  end
end
