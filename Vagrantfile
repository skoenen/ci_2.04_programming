Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"

  config.vm.define "slideserver" do |slideserver|
    slideserver.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbooks/slideserver.yml"
    end

    slideserver.vm.network :forwarded_port, guest: 4567, host: 4567
  end

  config.vm.define "development", primary: true do |dev_env|
    dev_env.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbooks/development_environment.yml"
    end
  end

end
