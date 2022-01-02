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

#  home.file.".zshrc".source = ./.zshrc;
#

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

  xdg.configFile = {
    "alacritty/alacritty.yml".source = ./config/alacritty/alacritty.yml;
    "i3/config".source = ./config/i3/config;
    "polybar/config".source = ./config/polybar/config;
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
