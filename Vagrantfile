# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65-x86_64"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"

  config.vm.define :web1 do |web|
    web.vm.network "private_network", ip: "192.168.33.10"

    web.vm.provision "shell", inline: <<-EOT
      yum install -y puppet
    EOT

    web.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "default.pp"
      puppet.options = ["--templatedir","/tmp/vagrant-puppet-2/manifests/templates"]
      puppet.facter = {
        "node_name" => "elasticsearch-web01",
      }
    end
  end

  config.vm.define :web2 do |web2|
    web2.vm.network "private_network", ip: "192.168.33.20"

    web2.vm.provision "shell", inline: <<-EOT
      yum install -y puppet
    EOT

    web2.vm.provision "puppet" do |puppet2|
      puppet2.manifests_path = "manifests"
      puppet2.manifest_file  = "default.pp"
      puppet2.options = ["--templatedir","/tmp/vagrant-puppet-2/manifests/templates"]
      puppet2.facter = {
        "node_name" => "elasticsearch-web02",
      }
    end
  end
end
