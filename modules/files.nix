{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    ranger
    trash-cli
    zstd
    restic
    fzf
  ];
}

