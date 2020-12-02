#!/bin/bash

save_repository() { # "name" "path"
    echo [\"$1\"]=\"$2\" >> $OMEGA_ROOT/data/projects
}
#"
find_repository() { # "name"
    cat $OMEGA_ROOT/data/projects | grep "$name "
}

get_repository_path() { # "name"
    find_repository | cut -d' ' -f 2
}

list_repositories() {
    cat $OMEGA_ROOT/data/projects | sed s/"\[\"/"/g | sed s/"\"\]/"/g | sed s/"="/"§p: "/g | sed s/$/"§o"/g
}
