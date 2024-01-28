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

{
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
      pkgs.firefox
      pkgs.remmina
      pkgs.bitwarden
      pkgs.cryptomator
      pkgs.element
      pkgs.notepadqq
      pkgs.vscodium
      pkgs.element-desktop
      pkgs.prusa-slicer
      pkgs.cura
      pkgs.blender
      pkgs.freecad
      pkgs.appimage-run
      pkgs.anydesk
      pkgs.discord
      pkgs.jellyfin-mpv-shim
      pkgs.vlc
      pkgs.prismlauncher
      pkgs.virt-manager
      pkgs.pcloud
      pkgs.gimp
      pkgs.inkscape
      pkgs.gnome.gnome-tweaks
      pkgs.signal-desktop
      pkgs.freerdp
  ];
}
