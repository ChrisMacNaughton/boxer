. $DIR/src/helpers

install() {
    log "Ensuring VSCode is installed"
    command -v code >/dev/null 2>&1 || { 
        add_repo
        ensure_packages code
    }
    install_plugins
}

install_plugins() {
    # echo "Installing plugins: $VSCODE_PACKAGES"
    installed=$(code --list-extensions)
    for extension in $VSCODE_PACKAGES
    do
        echo $installed | grep $extension >/dev/null 2>&1 && {
             log "    Skipping $extension, already installed"
        }|| {
            log "Installing VSCode plugin: $extension"
            code --install-extension $extension
        }
    done
}

add_repo() {
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    apt_update
}

install