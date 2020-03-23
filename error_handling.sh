source ".omega"

error_exit() {
    omega_speach "Sorry, seems like something went §pwrong§n§b, better luck next time !";
    kill 0;
}

try() {
    $@\
        && echo -e "Success ! "$pale"✔ "\
        || (echo -e "Error :("$pale" ✘ " && error_exit)
}

try_ne() {
    $@\
        && echo -e "Success ! "$pale"✔ "\
        || echo -e "Error :("$pale" ✘ "
}
