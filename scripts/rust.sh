. $DIR/src/helpers

install (){
    log "Ensuring Rust / rustup is installed"
    command -v rustup >/dev/null 2>&1 || {
        curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
        $HOME/.cargo/bin/rustup install beta nightly
    }
}

install