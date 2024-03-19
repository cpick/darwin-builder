# Darwin builder

Use `nix run` to start a
[nixpkgs#darwin.builder](https://nixos.org/manual/nixpkgs/stable/#sec-darwin-builder)
that's bound to localhost, uses 8 CPUs, and listens on port 2222.

## Rebuilding

If a new .iso needs to be generated then a x86_64-linux builder is required.
This also appears to need to be one of the `--builders` (haven't found a working way to set it as
a `--store` {with or without an `--eval-store`}).

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
