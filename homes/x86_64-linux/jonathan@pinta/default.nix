{
    # Snowfall Lib provides a customized `lib` instance with access to your flake's library
    # as well as the libraries available from your flake's inputs.
    lib,
    # An instance of `pkgs` with your overlays and packages applied is also available.
    pkgs,
    # You also have access to your flake's inputs.
    inputs,

    # Additional metadata is provided by Snowfall Lib.
    home, # The home architecture for this host (eg. `x86_64-linux`).
    target, # The Snowfall Lib target for this home (eg. `x86_64-home`).
    format, # A normalized name for the home target (eg. `home`).
    virtual, # A boolean to determine whether this home is a virtual target using nixos-generators.
    host, # The host name for this home.

    # All other arguments come from the home home.
    config,
    ...
}:
with lib;
{
  # Select home modules
  gui-apps-minimal.enable = true;
  cli-apps.enable = true;
  cli-apps-linux.enable = true;

  # Enable vscode-server service (external module)
  # services.vscode-server.enable = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jonathan";
  home.homeDirectory = "/home/jonathan";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jonathan/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
