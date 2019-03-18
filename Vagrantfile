Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "3072"
     vb.cpus = "2"
  end
   config.vm.provision "shell", inline: <<-SHELL
   sudo su
      curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
      sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
      sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
      sudo apt-get -y install apt-transport-https
      sudo apt-get update
      sudo apt-get -y install code-insiders

      curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
      sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
      sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
      sudo apt-get update
      sudo apt-get -y install dotnet-sdk-2.2

      sudo su
      apt-get clean
      apt-get update
      sudo apt-get -y install ubuntu-desktop
      # wget -qO- https://get.docker.com/ | sh
      # sudo usermod -aG docker $(whoami)
      apt-get update
      apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
      echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
      apt-get update
      apt-cache policy docker-engine
      apt-get install -y docker-engine
      systemctl status docker


      # startx
      reboot
   SHELL
end