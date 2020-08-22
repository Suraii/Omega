#!/bin/bash

#
# [!] THIS SCRIPT SHOULD BE COPIED INTO ONE OF YOUR BINARY FILES AND RENAMED "omega"
# [!] YOU SHOULDN'T EDIT THIS SCRIPT
# [!] IF THIS FILE IS NAMED "execution_script.sh" IT'S JUST A LOCAL COPY THAT SHOULD BE LOCATED
#     IN YOUR .omega.d
#

if [ -f $OMEGA_ROOT/omega_main ];
    then $OMEGA_ROOT/omega_main $@
    else echo "[!] There's something wrong with your omega installation, try to reinstall it and follow the insctructions
    And don't forget the export in your shell init file !"
fi
