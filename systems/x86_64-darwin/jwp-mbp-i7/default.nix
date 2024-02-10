# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  # Snowfall Lib provides a customized `lib` instance with access to your flake's library
  # as well as the libraries available from your flake's inputs.
  lib,
  # An instance of `pkgs` with your overlays and packages applied is also available.
  pkgs,
  # You also have access to your flake's inputs.
  inputs,

  # Additional metadata is provided by Snowfall Lib.
  system, # The system architecture for this host (eg. `x86_64-linux`).
  target, # The Snowfall Lib target for this system (eg. `x86_64-iso`).
  format, # A normalized name for the system target (eg. `iso`).
  virtual, # A boolean to determine whether this system is a virtual target using nixos-generators.
  systems, # An attribute map of your defined hosts.

  # All other arguments come from the system system.
  config,
  ...
}:

let
  username = "jonathan";
in {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../roles/defaults.nix
    ../roles/brew.nix
    # ../roles/yabai.nix
    ../roles/network.nix
  ];

  # Import nur as nixpkgs.overlays
  nixpkgs.overlays = [ 
    inputs.nur.overlay 
  ];
  
  # Define user settings
  users.users.${username} = {
    description = "Jonathan Packard";
    name = "jonathan";
    home = "/Users/jonathan";
    shell = pkgs.bash;
  };

  system.stateVersion = 4;
}
