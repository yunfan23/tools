1. dpkg is the package manager for Debian

2. readlink - print resolved symbolic links or canonical file names

   readlink -f $(which cc) $(which gcc) $(which g++) /usr/bin/gcc-5 /usr/bin/gcc-5 /usr/bin/g++-5

   g++ will link libstdc++ by default, while gcc won't.