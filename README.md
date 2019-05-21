# baremetal_install_avi_controller
install Avi Controller with Ansible Avi roles using from a container

# usage
1. clone on any linux host
2. fill ip address of the target host for controller install in `hosts`file
3. fill the ssh private key to enable ssh session to the target host 
2. type `sh run.sh`

# requirements

- client host can be any linux distribution supported by docker installer
- target host must meet the hardware requirement for running controller,
- client host and target host must be connected to internet, after installation internet acces is no longer needed
- 
# references
- https://github.com/avinetworks/ansible-role-avicontroller
- https://galaxy.ansible.com/avinetworks/avicontroller
- https://hub.docker.com/r/avinetworks/controller
- https://docs.ansible.com/ansible/latest/user_guide/playbooks.html
