. $DIR/src/helpers

install (){
    log "Ensuring Chrome is installed"
    command -v /opt/google/chrome/chrome >/dev/null 2>&1 || {
        fetch
        deb_install /tmp/chrome.deb
    }
}

fetch() {
    wget -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
}

install