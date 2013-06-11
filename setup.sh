#!/bin/bash
#setup.sh - this setup script installs proginit, which copies some skeleton
#           files over to whatever the working directory is at the time that
#           it's called.

. ~/.libs/colours

bldylw
echo -n "Installing "
bldblu
cat ./program_name
if [[ -e ./installation_status ]]
then
    if [[ `cat ./installation_status` == "0" ]]
    then
        bldylw
        echo "    Program aready installed"
        bldgrn
        echo "Installation Successful"
    else
        bldylw
        echo "    Adding alias to bashrc..."
        echo "alias proginit='cp -nr \$(find `pwd`/skeletonFiles -mindepth 1 -printf \"%p \") ./'" >> ~/.bashrc
        bldgrn
        echo "    Done"
        bldylw
        echo "    Updating installation status"
        echo 0 > ./installation_status
        bldgrn
        echo "Installation Successful"
    fi
else
    touch ./installation_status
    bldylw
    echo "    Adding alias to bashrc..."
    echo "alias proginit='cp -nr \$(find `pwd`/skeletonFiles -mindepth 1 -printf \"%p \") ./'" >> ~/.bashrc
    bldgrn
    echo "    Done"
    bldylw
    echo "    Updating installation status"
    echo 0 > ./installation_status
    bldgrn
    echo "Installation Successful"
fi
