. $DIR/src/helpers

install (){
    log "Ensuring Firefox nightly is installed"
    command -v firefox-trunk >/dev/null 2>&1 || { 
        add_repo
        ensure_packages firefox-trunk
    }
}

add_repo() {
    add_repo ppa:ubuntu-mozilla-daily/ppa
    apt_update
}

install