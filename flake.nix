{
  description = "My Home Manager Flake";

  inputs = {
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      vars = import ./vars.nix;
      overlays = [
        inputs.neovim-nightly-overlay.overlay
      ];
    in
    {
      homeConfigurations = {
        "${vars.username}" = home-manager.lib.homeManagerConfiguration {
          # Note: I am sure this could be done better with flake-utils or something
          pkgs = import nixpkgs { system = vars.system; };

          modules = [ (./modules/home-manager) ];
          extraSpecialArgs = { inherit overlays; };
        };
      };
      # For `nix run .` later
      defaultPackage.${vars.system} = home-manager.defaultPackage.${vars.system};
    };
}
