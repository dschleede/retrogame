#!/bin/sh
#
# This startup script is run to start the boot of the retro game system and do updates
#
#####
# Code here to check for mandatory packages have been either installed, or will be installed
#
# Packages: git rdist emacs-nox
#

# This function will kick off the process
kickoff()
{
if [ -x /usr/bin/git ]; then
    # git exists, so lets pull the config info
    mkdir -p /root/game
    cd /root/game
    git clone https://github.com/dschleede/retrogame.git
    # Lets checkout the production branch
    #git checkout production
    cd retrogame
    cp startup.sh /etc/rc.local
    chmod 755 /etc/rc.local
else
    echo "Need to install git, aborting"
    exit
fi
}

#######################
# main code
kickoff
exit 0
#DLS
