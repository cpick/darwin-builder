# Darwin builder

Use `nix run` to start a
[nixpkgs#darwin.builder](https://nixos.org/manual/nixpkgs/stable/#sec-darwin-builder)
that's bound to localhost, uses 8 CPUs, and listens on port 2222.

## VM Configuration

Enable flakes:
```sh
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >>~/.config/nix/nix.conf
```

Use vi mode:
```sh
echo 'set -o vi' >>~/.bashrc
echo '. ~/.bashrc' >>~/.bash_profile
```
