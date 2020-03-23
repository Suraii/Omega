#!/bin/bash

source ".omega"
source "error_handling.sh"

ask_for_accesses() {
    omega_speach "Is there §panyone else §n§bI should give §prights§n§b to ? [y/N]"
    read -rs -n 1 access
    case "$access" in
        "y") omega_log "Enter §pcomma separated§o addresses\n"\
            "Example: '§i§pjohn.prodman@corpus.co§o,§psargas.ruk@grineer.us§n§o'\n"\
            "> Coworkers: §p" && read -r coworkers && echo -ne "$orange"\
            && omega_log "Enter §prights§o to give to these coworkers\n" \
            "> Rights: §p" && read -r crights\
            && for (( i=0; i<=$(echo "$coworkers" | tr -cd ',' | wc -c); i++ ));
            do coworker=$(echo "$coworkers" | cut -d, -f$(($i+1))) && omega_raw "§o$coworker:..." \
                && try_ne edit_access $name $coworker $crights;
            done && ask_for_accesses;;
        *) ;;
    esac
}
