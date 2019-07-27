# baremetal_install_avi_controller
install Avi Controller with Ansible Avi roles using from a container automatically installed with ansible, avi role and dependances.
Theses scripts will install the "linux server cloud" version of Avi controller, please refer to the link below for limitation, support and configuration: 
- https://avinetworks.com/docs/18.2/system-requirements-ecosystem/#bare-metal-linux-server-cloud/
- https://avinetworks.com/docs/18.2/cloud-lsc/

# usage
1. clone repo on any linux host
2. fill ip address of the target host for controller install in `hosts` file
3. fill the ssh private key to enable ssh session to the target host in the `id_rsa_priv`file 
2. type `sh run.sh` to run the script

Docker will be installed if needed, then building the container, running it then execute the two Avi Networks roles "docker" then "controller" on the target host, at the end of the script, controller may take up to 5 mn to boot. Then access the Avi Vantage GUI thru target host ip.

# requirements
- client host can be any linux distribution supported by docker installer
- target host must meet the hardware requirement for running controller,
- client host and target host must be connected to internet, after installation internet acces is no longer needed
- client and target host must be accessible at least on SSH port TCP/22 for installation
- Avi controller need opened ports TCP 22,80,8443,123,443
- tested with ubuntu 16.04 & 18.04 as client and centos 7 as target
- tested with photon 3.0 as client, just need to enable docker and install git first `systemctl start docker && systemctl enable docker && tdnf install git -y && reboot now` 

# references
- https://github.com/avinetworks/ansible-role-avicontroller
- https://galaxy.ansible.com/avinetworks/avicontroller
- https://hub.docker.com/r/avinetworks/controller
- https://docs.ansible.com/ansible/latest/user_guide/playbooks.html
