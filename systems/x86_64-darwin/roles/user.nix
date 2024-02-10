{ config, pkgs, ... }:

{
  description = "Jonathan Packard";
  name = "jonathan";
  home = "/Users/jonathan";
  shell = pkgs.bash;
  # These packages will only be installed for your user
  # The binaries will be available in the following path: /etc/profiles/per-user/$USER/bin
  packages = [
    pkgs.bash
    pkgs.gcc
    pkgs.git
    pkgs.gnupg
    pkgs.tmux
    pkgs.fortune
    pkgs.neofetch
    pkgs.tree
  ];
}
