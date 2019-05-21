echo "===========installing docker in localhost if needed==============="
sleep 2
if ! [ -x "$(command -v docker)" ]; then
  echo 'installing docker'
  curl -sSL https://get.docker.com/ | sh
fi
echo "===========Now building ansible container==============="
sleep 2
docker build -t avibuilder .
echo "===========Now running container against target host using ssh key==============="
sleep 2
# set key file to read only
chmod 600 id_rsa_priv
# run the container with file mapping and execute the playbook to install docker then the controller on the target host
docker run -v "$PWD/id_rsa_priv:/ansible/playbooks/id_rsa_priv:ro" -v "$PWD/hosts:/ansible/playbooks/hosts:ro" -v "$PWD/bare_install.yaml:/ansible/playbooks/bare_install.yaml:ro" --rm -ti avibuilder ansible-playbook --private-key=id_rsa_priv -u root -i hosts bare_install.yaml -e "ansible_python_interpreter=/usr/bin/python"
