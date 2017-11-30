. $DIR/src/helpers

install (){
    log "Ensuring IrcCloud is installed"
    command -v IRCCloud >/dev/null 2>&1 || {
        fetch
        deb_install /tmp/irccloud.deb
    }
}

fetch() {
    curl -o /tmp/irccloud.deb http://desktop.irccloud.com/
}

install