. $DIR/src/helpers

install (){
    log "Ensuring Firefox nightly is installed"
    command -v firefox-trunk >/dev/null 2>&1 || { 
        add_repo
        apt_install firefox-trunk
    }
}

add_repo() {
    add-apt-repository -y ppa:ubuntu-mozilla-daily/ppa
    apt-get update
}

install