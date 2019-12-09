Vagrant.configure("2") do |config|
  config.vm.box = "centos/6"
  config.vm.name = "vm-sandbox-gitlab.local"
  config.vm.hostname = "vm-sandbox-gitlab.local"
  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1"
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "2"
    vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SHELL
    yum update
    yum upgrade -y
    
    $gitlab=gitlab-ce-12.5.3-ce.0.el6.x86_64.rpm
    $src=/app/gitlab
    mkdir -p $src && cd $src
    wget --content-disposition https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/6/$gitlab/download.rpm
  SHELL
end
