mkdir -p /etc/apt-repo/programs &&
mkdir -p /etc/apt-repo/tools &&
echo 'The repo will be located in the "/etc/" directory.' &&
echo '' > /etc/apt-repo/tools/addpkg.sh &&
chmod +x /etc/apt-repo/tools/addpkg.sh
#echo '' > /etc/apt-repo/tools/addrepo.sh &&
echo 'alias addpkg="/etc/apt-repo/tools/addpkg.sh"' >> /etc/bash.bashrc &&
#echo 'alias addrepo="/etc/apt-repo/tools/addrepo"' >> /etc/bash.bashrc &&
echo "Finished."
