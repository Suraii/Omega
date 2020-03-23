#!/bin/bash

source ".omega"
source "error_handling.sh"
source "toolbox.sh"

omega_speach "Hi back §pbud'§n§b !, let me build that repo !"

omega_speach "Okay give me a §pgood name"
omega_log "Repository's name: §p"
read -r name
omega_speach "§p$name§n§b ? That sounds good"

omega_log "Creating §prepository§o:...\n"
try create_repo $name

omega_speach "Should I give §paccesses§n§b to your §pcorrecter §n§b? \
(§p$correcter_rights §n§bto §p$correcter_login§n§b) [Y/n]"
read -rs -n 1 access
case "$access" in
    "n") ;;
    *) omega_log "Giving §p$correcter_rights §orights to §p$correcter_login§o...\n" \
        ; try edit_access "$name" "$correcter_login" "$correcter_rights"
esac

ask_for_accesses

omega_endlog
