#!/bin/bash

source "$OMEGA_ROOT"/.omega-cfg
source "$OMEGA_ROOT"/toolbox.sh
source "$OMEGA_ROOT"/data_saving.sh

omega_speach "Here's your §pstuff§n§b partner !"

omega_raw "$(list_repositories)\n"


#omega_raw "$repos"

omega_endlog
