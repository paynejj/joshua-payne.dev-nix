{ pkgs, overlays, ... }:
let
  vars = import ../../vars.nix;
in
{
  # Home-manager Configuration
  home = {
    username = vars.username;
    homeDirectory = "/home/${vars.username}";
    stateVersion = "23.05";
    sessionVariables = {
      PAGER = "less";
      EDITOR = "nvim";
    };
    # User level installs from nixpkgs
    packages = with pkgs; [
      bottom
      fd
      gcc
      gdu
      luajitPackages.luarocks
      neovim-nightly
      nodejs_20
      nodePackages.neovim
      nodePackages.prettier
      python311Full
      python311Packages.pynvim
      python311Packages.pip
      ripgrep
      rustup
      unzip
      zellij
    ];
  };

  nixpkgs.overlays = overlays;
  # User level installs and configurations
  programs = import ./programs;
}
