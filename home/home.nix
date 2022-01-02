{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "james";
  home.homeDirectory = "/home/james";


  # Packages that should be installed for this user
  #home.packages = with pkgs; []; #DW idk how to approach splitting user/global packages up in a good way yet...

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.git = {
    enable = true;
    userEmail = "james.barzegar@gmail.com";
    userName = "James Barzegar";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.file.".git.scmbrc".source = ./.git.scmbrc;
  home.file.".profile".source = ./.profile;
  home.file.".zlogin".source = ./.zlogin;
  home.file.".zlogout".source = ./.zlogout;
  home.file.".zpreztorc".source = ./.zpreztorc;
  home.file.".zprofile".source = ./.zprofile;
  home.file.".zshenv".source = ./.zshenv;
  home.file.".zshrc".source = ./.zshrc;

  # Basically just using `home-manager` as a glorified symlinking script for now.
  # Ideally, I port each config to the nix/home-manager way but doing it this way, lets me tackle each config one at a time.
  xdg.configFile = {
    "alacritty/alacritty.yml".source = ./config/alacritty/alacritty.yml;
    "i3/config".source = ./config/i3/config;
    "polybar/config".source = ./config/polybar/config;
    "picom.conf".source = ./confg/picom.conf;
    "theming" = {
      source = ./config/theming;
      recursive = true;
    };
    "rofi" = {
      source = ./config/rofi;
      recursive = true;
    };
    "i3status" = {
      source = ./config/rofi;
      recursive = true;
    };
  };

  home.file.".doom.d" = {
    source = ./doom.d;
    recursive = true;
  };

  home.file.".local/bin" = {
    source = ./local/bin;
    executable = true;
    recursive = true;
  };
}
