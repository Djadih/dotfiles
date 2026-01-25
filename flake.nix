{
  description = "Portable Home Manager config (macOS Apple Silicon + Linux x86_64)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      username = "hdjadi";

      homeDirectoryFor = system:
        if builtins.match ".*-darwin" system != null
        then "/Users/${username}"
        else "/home/${username}";

      mkHome = system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [
            ./home/common.nix
            (if builtins.match ".*-darwin" system != null then ./home/darwin.nix else ./home/linux.nix)
            {
              home.username = username;
              home.homeDirectory = homeDirectoryFor system;

              home.stateVersion = "25.05";
              programs.home-manager.enable = true;
            }
          ];
        };
    in
    {
      homeConfigurations = {
        "${username}-mac" = mkHome "aarch64-darwin";
        "${username}-linux" = mkHome "x86_64-linux";
      };
    };
}

