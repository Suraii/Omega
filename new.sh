#!/bin/bash

source "$OMEGA_ROOT"/.omega-cfg
source "$OMEGA_ROOT"/error_handling.sh
source "$OMEGA_ROOT"/toolbox.sh
source "$OMEGA_ROOT"/data_saving.sh

# Introduction Speach

omega_speach "Hi back §pbud'§n§b !, let me build that repo !"

# Name prompt

omega_speach "Okay give me a §pgood name"
ask_for_name

# Repository creating

omega_log "Creating §prepository§o:...\n"
try create_repo $name

save_repository $name `pwd`"/$name"

# Accesses managment

omega_speach "Should I give §paccesses§n§b to your §pcorrecter §n§b? \
(§p$correcter_rights §n§bto §p$correcter_login§n§b) [Y/n]"
read -rs -n 1 access
case "$access" in
    "n") ;;
    *) omega_log "Giving §p$correcter_rights §orights to §p$correcter_login§o...\n" \
        ; try edit_access "$name" "$correcter_login" "$correcter_rights"
esac

ask_for_accesses

# Presets managment

omega_speach "Should I use a §ppreset§n to build the repository ? [y/N]"
read -rs -n 1 access
case "$access" in
    "y") ask_for_preset ;;
    *) ;;
esac

omega_endlog

omega_speach "Job Done !"
