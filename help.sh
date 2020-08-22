#!/bin/bash

source "$OMEGA_ROOT"/.omega-cfg
source "$OMEGA_ROOT"/error_handling.sh
source "$OMEGA_ROOT"/toolbox.sh

omega_speach "Okay here's the list of the §pwords§n I understand :"

omega_raw "§bnew§n§p: Create a new project\n"
omega_raw "§blist§n§p: List all your current projects\n"
omega_raw "§bhelp/?§n§p: Display this\n"
omega_endlog
