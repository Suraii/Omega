#!/bin/bash

source "$OMEGA_ROOT"/.omega-cfg
source "$OMEGA_ROOT"/error_handling.sh
source "$OMEGA_ROOT"/toolbox.sh

omega_speach "Okay here's the list of the §pwords§n I understand :"

omega_raw "§bnew§n§p\t- Create a new project\n"
omega_raw "§bdelete§n§p\t- Delete the given repository\n"
omega_raw "§blist§n§p\t- List all your current projects\n"
omega_raw "§bhelp/?§n§p\t- Display this\n"
omega_endlog
