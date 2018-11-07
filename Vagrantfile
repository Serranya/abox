# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure("2") do |config|
	config.vm.box = "archlinux/archlinux"

	config.vm.box_check_update = false
	config.vbguest.auto_update = false

	config.vm.provider "virtualbox" do |vb|
		vb.gui = true
		vb.memory = "4096"
		vb.customize ["modifyvm", :id, "--vram", "128"]
		vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
		vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
#		vb.customize ["modifyvm", :id, "--monitorcount", "2"]
	end

	config.vm.provision "upgrade", type: "shell", run: "always" do |s|
		s.inline = "pacman -Syu --noconfirm"
	end

	config.vm.provision "provision-build-tools", type: "shell" do |s|
		s.inline = "pacman -S --noconfirm --needed sudo base-devel git; pacman -S --noconfirm --needed --asdeps jq pacutils devtools"
	end

	config.vm.provision "copy files", type: "file" , source: "root", destination: "root"
	config.vm.provision "move files", type: "shell" do |s|
		s.inline = "cp -TRv /home/vagrant/root /; rm -rf /home/vagrant/root"
	end

	config.vm.provision "build-aurutils", type: "shell", privileged: false do |s|
		s.path = "build-aurutils.sh"
	end
	
	config.vm.provision "install-aurutils", type: "shell" do |s|
		s.inline = "pacman -U --noconfirm /home/vagrant/aurutils/*.xz; rm -rf /home/vagrant/aurutils; echo \"Include = /etc/pacman.d/aurutils\" >> /etc/pacman.conf; install -d /var/cache/pacman/aurutils -o vagrant; repo-add /var/cache/pacman/aurutils/aurutils.db.tar; pacman -Syu"
	end

#	config.vm.provision "install-from-aur", type: "shell", privileged: false do |s|
#		s.inline = "aursync -c dropbox"
#	end

	config.vm.provision "provision", type: "shell" do |s|
	 s.path = "provision.sh"
	end
end
