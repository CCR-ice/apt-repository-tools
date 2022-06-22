mkdir -p /etc/apt-repo-tools/programs &&
mkdir -p /etc/apt-repo-tools/tools &&
mkdir -p /etc/apt-repo-tools/apt-repo/dists/stable/main/binary-amd64 &&
echo 'The repo will be located in the "/etc/" directory.' &&
echo '' > /etc/apt-repo-tools/tools/addpkg.sh &&
chmod +x /etc/apt-repo-tools/tools/addpkg.sh
#echo '' > /etc/apt-repo-tools/tools/addrepo.sh &&
echo 'alias addpkg="/etc/apt-repo-tools/tools/addpkg.sh"' >> /etc/bash.bashrc &&
#echo 'alias addrepo="/etc/apt-repo-tools/tools/addrepo"' >> /etc/bash.bashrc &&
echo "Finished."
