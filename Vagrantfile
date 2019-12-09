Vagrant.configure("2") do |config|
  config.vm.box = "centos/6"
  # config.vm.name = "vm-sandbox-gitlab"
  config.vm.hostname = "vm-sandbox-gitlab.local"
  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 443, host: 443 

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "2"
    vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SHELL
    yum update
    yum upgrade -y

    sudo yum install -y curl policycoreutils-python openssh-server cronie
    sudo lokkit -s http -s ssh
    
    sudo yum install postfix
    sudo service postfix start
    sudo chkconfig postfix on

    curl -k https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
    sudo EXTERNAL_URL="https://vm-sandbox-gitlab.local" yum -y install gitlab-ce
  SHELL
end
