#selfhosted #doh
# DOH Server
- https://github.com/dnscrypt/doh-server

## Install
- With built-in support for HTTPS (default):
	- `cargo install doh-proxy`
- Example command-line:
	- `doh-proxy -H 'doh.example.com' -u 127.0.0.1:53 -g 233.252.0.5`


# Crypt DNS
-  encrypted-dns-server

## Install
- `curl -sSf https://sh.rustup.rs | bash -s -- -y --default-toolchain nightly source $HOME/.cargo/env`