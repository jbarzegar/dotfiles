# nix-darwin docs: https://mynixos.com/nix-darwin

{
  description = "🦝";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nix-darwin,
      ...
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          system.primaryUser = "james";
          # environment.systemPackages = [ pkgs.vim ];
          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";
          nix.package = pkgs.lixPackageSets.stable.lix;

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
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Jamess-MacBook-Pro
      darwinConfigurations."Jamess-MacBook-Pro-2" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          ./config.nix
          ./darwin.nix
          # ./aerospace.nix # Setup windowmanager
        ];
      };
    };
}
