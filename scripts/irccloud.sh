. $DIR/src/helpers

install (){
    log "Ensuring IrcCloud is installed"
    command -v IRCCloud >/dev/null 2>&1 || 
    command -v irccloud-desktop >/dev/null 2>&1 || {
        deps
        fetch
        deb_install /tmp/irccloud.deb
    }
}

fetch() {
    wget -O /tmp/irccloud.deb https://github.com/irccloud/irccloud-desktop/releases/download/v0.4.0/irccloud-desktop_0.4.0_amd64.deb
}

deps() {
    ensure_packages "gconf2 gconf-service libnotify4 libappindicator1 libxtst6 libnss3 libxss1"
}
install