# This defines packages that should only be installed on a system with a GUI.
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

    # All other arguments come from the module system.
    config,
    ...
}:
with lib; let
  cfg = config.vr;
in {
  options.vr = {
    enable = mkEnableOption "vr";
  };

  config = mkIf cfg.enable {    
    home.packages = with pkgs; [
      pkgs.lighthouse-steamvr # Power management for SteamVR lighthouses
      pkgs.BeatSaberModManager
    ];
  };
}
