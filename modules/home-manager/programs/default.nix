{
  alacritty = import ./alacritty.nix;
  bat = import ./bat.nix;
  eza = import ./eza.nix;
  fzf = import ./fzf.nix;
  git = import ./git.nix;
  lazygit = import ./lazygit.nix;
  starship = import ./starship.nix;
  zsh = import ./zsh.nix;
  home-manager.enable = true;
}
