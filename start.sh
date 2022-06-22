echo "Repo metadata file path:"
read filepath
mkdir -p /etc/apt-repo-tools/programs &&
mkdir -p /etc/apt-repo-tools/tools &&
mkdir -p /etc/apt-repo-tools/apt-repo/dists/stable/main/binary-amd64 &&
echo 'The repo will be located in the "/etc/" directory.' &&
echo '' > /etc/apt-repo-tools/tools/addpkg.sh &&
chmod +x /etc/apt-repo-tools/tools/addpkg.sh
#echo '' > /etc/apt-repo-tools/tools/addrepo.sh &&
echo 'alias addpkg="/etc/apt-repo-tools/tools/addpkg.sh"' >> /etc/bash.bashrc &&
#echo 'alias addrepo="/etc/apt-repo-tools/tools/addrepo"' >> /etc/bash.bashrc &&
echo "#!/bin/sh
set -e

do_hash() {
    HASH_NAME=\$1
    HASH_CMD=\$2
    echo \"\${HASH_NAME}:\"
    for f in \$(find -type f); do
        f=\$(echo $f | cut -c3-) # remove ./ prefix
        if [ \"$f\" = \"Release\" ]; then
            continue
        fi
        echo \" \$(\${HASH_CMD} \${f}  | cut -d\" \" -f1) \$(wc -c $f)\"
    done
}

cat << EOF
$(cat "$filepath")
Date: \$(date -Ru)
EOF
do_hash "MD5Sum" "md5sum"
do_hash "SHA1" "sha1sum"
do_hash "SHA256" "sha256sum"
' > /etc/apt-repo-tools/generate-release.sh && chmod +x /etc/apt-repo-tools/generate-release.sh
echo "Finished."
