{
  pkgs,
  ...
}:
{
  # Packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # core stuff
    coreutils
    chezmoi
    git
    git-extras
    nixd
    nixfmt-rfc-style
    kubectl
    kubectx
    k9s
    jsonnet
    libplist
    # other stuff
    fastfetch
    fd
    fzf
    gh
    glances
    go-task
    redli
    httpie
    jq
    lazygit
    lazyssh
    lnav
    lua
    neovim
    oh-my-posh
    ranger
    ripgrep
    tldr
    tree
    yq
    zellij
    zoxide
  ];

  homebrew.enable = true;
  homebrew.caskArgs = {
    appdir = "/Applications";
    require_sha = true;
  };
  homebrew.brews = [
    "mise"
  ];
  homebrew.casks = [
    "appcleaner"
    # window manager
#    "nikitabobko/tap/aerospace"
    "discord"
    # docker/containers
    "orbstack"
    "obsidian"
    "firefox"
    "ghostty"
    "hiddenbar"
    "insomnia"
    "signal"
    "scroll-reverser"
    "spotify"
    "windscribe"
    "vlc"
    "zed"
    "zoom"
  ];

  # Programs
  programs._1password.enable = true;
  programs.zsh = {
    enable = true;
    enableFastSyntaxHighlighting = true;
    enableFzfCompletion = true;
    enableFzfGit = true;
    enableFzfHistory = true;
  };

}
