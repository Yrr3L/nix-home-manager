{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wtf
    nushell
    lazygit
    neofetch
    htop
    bat
    eza
    fish
    starship
    zoxide
    tmux
    neovim
  ];
}

