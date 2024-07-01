# Snowfall Lib provides access to your current Nix channels and inputs.
#
# Channels are named after NixPkgs instances in your flake inputs. For example,
# with the input `nixpkgs` there will be a channel available at `channels.nixpkgs`.
# These channels are system-specific instances of NixPkgs that can be used to quickly
# pull packages into your overlay.
#
# All other arguments for this function are your flake inputs.
{ channels, ... }:

final: prev: {
    # For example, to pull a package from unstable NixPkgs make sure you have the
    # input `unstable = "github:nixos/nixpkgs/nixos-unstable"` in your flake.
    inherit (channels.nixpkgs22-11) pcloud;
}
