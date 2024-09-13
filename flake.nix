{
  description = "Local-only, beefier Darwin builder";

  inputs = {
    nixpkgs.url = "github:cpick/nixpkgs/macos-builder-options";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-darwin";
      pkgs = nixpkgs.legacyPackages."${system}";
      linuxSystem = builtins.replaceStrings [ "darwin" ] [ "linux" ] system;

      nixos = import "${nixpkgs}/nixos" {
        configuration = {
          imports = [
            "${nixpkgs}/nixos/modules/profiles/macos-builder.nix"
          ];

          virtualisation.host = { inherit pkgs; };
          virtualisation.darwin-builder.cores = nixpkgs.lib.mkForce 8;
          virtualisation.darwin-builder.hostAddress = nixpkgs.lib.mkForce "127.0.0.1";
          virtualisation.darwin-builder.hostPort = nixpkgs.lib.mkForce 2222;
        };

        system = linuxSystem;
      };

    in {
      packages.${system} = {
        builder = nixos.config.system.build.macos-builder-installer;
        default = self.packages.${system}.builder;
      };
    };
}
