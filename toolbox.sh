#!/bin/bash

source "$OMEGA_ROOT"/.omega-cfg
source "$OMEGA_ROOT"/error_handling.sh


ask_for_name() {
    omega_log "Repository's name: §p"
    read -r name
    find_repository $name \
        && omega_speach "Sorry buddy but you already have a repo named '§p$name§n§b' :/" && ask_for_name \
        || omega_speach "§p$name§n§b ? That sounds good"
}

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


ask_for_preset() {
    omega_speach "Here's a list, which one should I use ?"
    omega_raw "§p"
    ls -1 "$OMEGA_ROOT"/presets
    omega_log "Enter the name of your choice: §p"
    read -r preset
    omega_endlog
    if [ -f "$OMEGA_ROOT"/presets/$preset ];
    then
        omega_speach "Applying §p$preset§n§b..."
        omega_raw ""
        cd $name
        try_ne "$OMEGA_ROOT"/presets/$preset
        cd ..
        omega_endlog
    else
        omega_speach "Couldn't find §ppresets/$preset§n§b, wanna try again ? [Y/n]"
        read -rs -n 1 answer
        case "$answer" in
            "n") ;;
            *) ask_for_preset;;
        esac
    fi
}

parse_colours() {
    echo "$@" | sed \
        -e s/§n/"\\$normal"/g \
        -e s/§p/"\\$pale"/g \
        -e s/§o/"\\$orange"/g \
        -e s/§b/"\\$bold"/g \
        -e s/§i/"\\$italic"/g;
}

omega_speach() { text=$(parse_colours "$@") && echo -e $chip $bold$text$normal; }
omega_log() { text=$(parse_colours "$@") && echo -ne $orange"> "$text; }
omega_raw() { text="$(parse_colours "$@")" && echo -ne $orange"$text"; }
omega_endlog() { echo -ne $normal; }
