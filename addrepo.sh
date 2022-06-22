printf 'Please respond in the form of "<package-name>_<version>-<release-number>_<architecture>"\ne. g. "hello-world_0.0.1-1_amd64"\n'
input dirname
printf 'Please enter the the path to the executable:\n'
input executablepath
printf 'Please enter the path to the control file:\n'
input controlpath
mkdir -p "/etc/apt-repo-tools/$dirname" &&
mkdir -p "/etc/apt-repo-tools/$dirname/usr/bin" &&
cp "$executablepath" "/etc/apt-repo-tools/$dirname/usr/bin" &&
mkdir -p "/etc/apt-repo-tools/$dirname/DEBIAN" &&
echo "$(cat "$controlpath")" > "/etc/apt-repo-tools/$dirname/DEBIAN/control" &&
dpkg --build "/etc/apt-repo-tools/$dirname" &&
cp "/etc/example/$dirname.deb" "/etc/apt-repo-tools/apt-repo/pool/main/." &&
dpkg-scanpackages --arch amd64 "/etc/apt-repo-tools/apt-repo/pool/" > "/etc/apt-repo-tools/apt-repo/dists/stable/main/binary-amd64/Packages" &&
echo "Please reboot to update changes!"
