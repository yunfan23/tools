# Mitsuba Installation
- clone repo from official repo
```
    git clone --recursive https://github.com/mitsuba-renderer/mitsuba2
```
- install dependencies
```
    sudo apt install -y clang-9 libc++-9-dev libc++abi-9-dev cmake ninja-build
    sudo apt install -y libz-dev libpng-dev libjpeg-dev libxrandr-dev libxinerama-dev libxcursor-dev
    sudo apt install -y python3-dev python3-distutils python3-setuptools
```

- install openexr
```
    conda install -c conda-forge openexr
    sudo apt-get install libopenexr-dev
    sudo apt-get install openexr
    pip install OpenEXR --user
    pip install imath
```

- problem solving
```
    pip uninstall openexr
    conda uninstall openexr
    sudo apt-get remove -y openexr
    sudo apt-get install -y openexr
    pip install git+https://github.com/jamesbowman/openexrpython.git
```

- build the system
```
    mkdir build
    cd build
    cmake -GNinja ..
    ninja