. $DIR/src/helpers

install (){
    log "Ensuring slack is installed"
    command -v slack >/dev/null 2>&1 || {
        deps
        fetch
        deb_install /tmp/slack.deb
    }
}

fetch() {
    wget -O /tmp/slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-2.9.0-amd64.deb
}

deps() {
    ensure_packages "gconf2 gconf-service libgtk2.0-0 libudev1 libgcrypt20 libnotify4 libxtst6 libnss3 python gvfs-bin xdg-utils apt-transport-https libxss1 libgnome-keyring0 gir1.2-gnomekeyring-1.0 libappindicator1 libcurl3 libsecret-1-0"
}
install