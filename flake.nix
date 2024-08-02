# Quick reference:
## Snowfall examples https://github.com/jakehamilton/config
## Snowfall website: https://snowfall.org

{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
        unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        # nixpkgs22-11.url = "github:nixos/nixpkgs/nixos-22.11"; # Nix Packages from 22.11 release
        nur.url = "github:nix-community/NUR"; # Needed for darwin
		    nixos-wsl.url = "github:nix-community/nixos-wsl"; # Needed for WSL

        snowfall-lib = {
          url = "github:snowfallorg/lib";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
          url = "github:nix-community/home-manager/release-24.05";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        vscode-server = {
          url = "github:msteen/nixos-vscode-server";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        darwin = {
          url = "github:LnL7/nix-darwin/master";
          inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = inputs:
        inputs.snowfall-lib.mkFlake {
            # You must provide our flake inputs to Snowfall Lib.
            inherit inputs;

            # The `src` must be the root of the flake. See configuration
            # in the next section for information on how you can move your
            # Nix files to a separate directory.
            src = ./.;

            channels-config = {
              allowUnfree = true;
            };

            # Add modules to a specific home.
            homes.users."jonathan@jon-tower".modules = with inputs; [
              vscode-server.homeModules.default
            ];

            # Add modules to a specific system.
            systems.hosts.jwp-nixos-wsl.modules = with inputs; [
              nixos-wsl.nixosModules.default
            ];
        };
}
