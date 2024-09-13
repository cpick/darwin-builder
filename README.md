# Darwin builder

Use `nix run` to start a
[nixpkgs#darwin.builder](https://nixos.org/manual/nixpkgs/stable/#sec-darwin-builder)
that's bound to localhost, uses 8 CPUs, and listens on port 2222.

## Rebuilding

If a new .iso needs to be generated then a x86_64-linux builder is required.
This also appears to need to be one of the `--builders` (haven't found a working way to set it as
a `--store` {with or without an `--eval-store`}).

## Missing `nix` command

The default darwin.linux-builder [has removed](https://github.com/NixOS/nixpkgs/pull/268574)  the
`nix` command.  Use [a separate VM](https://github.com/cpick/nix-vm) when that's needed.
