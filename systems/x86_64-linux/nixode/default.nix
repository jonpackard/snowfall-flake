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
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Enable Tailscale VPN module
  tailscale.enable = true;

  # Enable Flakes and the new command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # networking.hostName = "nixode"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  networking.useDHCP = false; # Disable DHCP globally as we will not need it.
  networking.interfaces.eth0.useDHCP = true; # Use DHCP just on eth0

  # Do not re-write NIC names
  networking.usePredictableInterfaceNames = false;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jonathan = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDD81PaVpMWLTJu/uvQsSSdsEn09Tdd//FluBGQHn+xYCAiyykl1JM0VfzphnSsNy04mRoOW99Mdvj2pUkXmoGCmF/ebpTymHZiuZBcWP/MIiWFDyM0Hdz56wG4WoqDr13wiAoI1YahwdlIwU+B8YVu6Pr6x2IilHxfzl79n9fYlVEsYZUcvZ3fAGt+ix8hNdyfcw0r/bIEFv2+D5IKhP16n3BwJUHHakDSTUBFumEjnbOf/sK2WNemzm9jgcinhfzG2WskOQR/Pt3VPUS4wK9MurFYg59MsPEa00EoraHeB6YnK8yWUmHD/veGmzDBK73crZrDrSaWQ5FbSh/Xatu3HzK2T5Y7Mn2HhajmYQFc5UgN41fF8O4Ft1dOmv5VeIH4y3mm00grmDcvvAU6fLUgWO/UBK0N0P1+3y0eRS30xaKQGDX1Ofn9l2CcVsAGeTHuq8ZTGLIA0UQ4tIMir47iVl2OTdY6RjcdSsZ9ikbdGJ64nh4dwc06/6bTck8Gw+0= jonathan@jon-tower"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDmyVo39UKS1lCS96iEeave2KhmcfyOAvnds70T4/S9uAtO0KBlLBnbZZdsEs7JVTekRt552sippBv/lVT9DH5F7sN34ERtRG21Pyv6WLlpL0hmMdW0oCMm5P7BG35x0CcbNWIqZSOlV1heociteFmiFcypETwTYaoq7LaLeaeI1vaHxkv+7OTh75CeNRFazSpm61NNv6OrW0TuclGKvbdU+94o2fVWSxIb2unt1s8nAhUvqPE0y7IXzc2PU3E5ls5Nt6/PfhmlA3VdCoXWOnlpxkaeYw/0fTE7fMfWtZhRs0MwziL64ptvz7Pm/FLuro3dwQdssbRe1/05Vu1fOp+V6S5RyPH/bIu3B1IYHyzLBeoAr5RHFkns8jecIAOPAnw9BYyvEgbKKGZRjQQ3FmAa3Id2YEQMiwv5zaRg6RD9pTJ/E499jNdlbKTY/rDfvDIya11lZw4QpTk59eZ6fzkSC5EVINedfLttszjcD76X4/Z1uxtOFY85KCm6LBM85wM= jonathan@Jonathans-MacBook-Pro.local"
    ];
  };

  users.users.direwolf = {
    isNormalUser = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git # Flakes use Git to pull dependencies from data sources, so Git must be installed first
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    # Start Linode specific packages
    inetutils
    mtr
    sysstat
    # End Linode specific packages
    neofetch # Just for fun!
    fortune # Just for fun!
    home-manager
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon with root login permitted.
  services.openssh = {
    enable = true;
    # Uncomment to allow SSH root login. Must be changed after initial setup!
    # settings.PermitRootLogin = "yes";
    # Require public key authentication for better security
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  # Enable fail2ban - helps prevent brute force attacks
  services.fail2ban.enable = true;
  services.fail2ban.bantime-increment.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Pihole Docker container (DNS server with ad and tracker blocking)
  # Ref: https://github.com/NixOS/nixpkgs/issues/61617#issuecomment-500793160
  docker-containers.pihole = {
    image = "pihole/pihole:latest";
    ports = [
      "100.99.87.141:53:53/tcp"
      "100.99.87.141:53:53/udp"
      "100.99.87.141:3080:80"
      "100.99.87.141:30443:443"
    ];
    volumes = [
      "/var/lib/pihole/:/etc/pihole/"
      "/var/lib/dnsmasq.d:/etc/dnsmasq.d/"
    ];
    extraDockerOptions = [
      "--cap-add=NET_ADMIN"
      "--dns=127.0.0.1"
      "--dns=1.1.1.1"
    ];
    workdir = "/var/lib/pihole/";
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
