## Vagrant box  

####    Overview

 In this project we generate a VM with:

 * Ubuntu 14 Server LTS

 that includes 

 * Docker
 * .Net Core 2.2 SDK 
 * Visual Studio Code

#
####    Setup

1. First of all, we need to configure Windows 10 to start without HyperX:
Open a CMD as elevated (not a PowerShell) and type:
```
$ bcdedit /export bootmaganer.bak
to backup the config. Then:
$ bcdedit /copy {current} /d "W10_wo_HYPERX"
and
$ bcdedit /set {the_guid_of_the_new_init} hypervisorlaunchtype off
```
That’s all. You will see something like this,
This is my bcdedit config:
 
 ![](https://github.com/carlgv/VagrantVM/blob/master/Images/1.png)
 	
2. In the VagrantFile, I’m provisioning a base Ubuntu Server v14 LTS with all the components from the vagrant file and a .sh script for some resources.
 
[VAGRANTFILE](https://github.com/carlgv/VagrantVM/blob/master/Vagrantfile)

[BOOTSTRAP.SH](https://github.com/carlgv/VagrantVM/blob/master/bootstrap.sh)
 
3. You can clone this repository or create your own files and put this two files in a folder, wherever you want.

4. On PowerShell or CMD as elevated, run:
```
$ vagrant up
```
It takes up to 15 minutes, and you will see on VirtualBox this:

![](https://github.com/carlgv/VagrantVM/blob/master/Images/virtualbox1.png)
 
5. Shut down the VM and go to properties (right click on the VM)
 
![](https://github.com/carlgv/VagrantVM/blob/master/Images/virtualbox2.png)

6. Configure the VM with at least 2Gb of RAM and 2 processors
 
![](https://github.com/carlgv/VagrantVM/blob/master/Images/virtualbox3.png)

7. And run again the VM

8. The default user/password are: vagrant/vagrant
 
9. You can see that VSCode is running and the version of Docker and .Net Core installed



#
#
#####Of course, other option, is configure a vagrant file with my box to download. Create a vagrantfile and paste this code:

```Ruby
Vagrant.configure("2") do |config|
  config.vm.box = "carlgv/ubuntudocker"
  config.vm.box_version = "1.0.0"
end
```


