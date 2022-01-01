# These are global os settings
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, callPackage, ... }:

{
  networking.hostName = "dev"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Toronto";


  environment.pathsToLink = ["/libexec"];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.james = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.

     shell = pkgs.zsh;
  };

  home-manager.users.james = { pkgs, ... }: {
    home.packages = [ pkgs.curlie ];
    programs.bash.enable = true;
  };

  environment.systemPackages = with pkgs;  [
    # Base
    cmake
    curl
    curlie
    fd
    fzf
    gcc
    git
    glances
    gnumake
    gnutls
    htop
    jq
    less
    lesspipe
    ranger
    (ripgrep.override {withPCRE2 = true;})
    sqlite
    tldr
    imagemagick
    zstd                # for undo-fu-session/undo-tree compression
    tmux
    tree
    unzip
    wget
    zsh
    python3
    #DE
    font-manager
    alacritty
    nitrogen
    # Containers
    podman
    podman-compose
    # Editor(s)
    neovim
    vim
    # emacs    # no need for this, the next line includes emacs
    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))
    # for emacs
    binutils
    #
    # theming
    gtk-engine-murrine
    gtk_engines
    gsettings-desktop-schemas
    lxappearance
    # Other gui apps (include desc plz)
    #
    pcmanfm # file manager
    # Web browsers
    firefox
    brave
  ];

  # Pkg overrides
  nixpkgs.config = {
      packageOverrides = pkgs: rec {
        # Add i3 ipc support to polybar
        polybar = pkgs.polybar.override {
        i3GapsSupport = true;
        githubSupport = true;
      };
    };
  };

  # Fonts
  fonts.fonts = with pkgs; [
    hack-font
    fira-code
    fira-code-symbols
    ibm-plex
    emojione
    noto-fonts
    noto-fonts-emoji
  ];

  programs.qt5ct.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;
}
