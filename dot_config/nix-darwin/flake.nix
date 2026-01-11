# nix-darwin docs: https://mynixos.com/nix-darwin

{
  description = "🦝";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nix-darwin,
      home-manager,
      ...
    }:
    let
      configuration =
        { ... }:
        {
          system.primaryUser = "james";
          # environment.systemPackages = [ pkgs.vim ];
          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # set commit has for darwin-version
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";

          nixpkgs.config.allowUnfree = true;
        };
    in
    {
      system.hostname
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Jamess-MacBook-Pro
      darwinConfigurations."Jamess-MacBook-Pro-2" = nix-darwin.lib.darwinSystem {
        modules = [
          home-manager.darwinModules.home-manager
          configuration
          ./config.nix
          ./darwin.nix
          ./aerospace.nix # Setup windowmanager
        ];
      };
    };
}
