{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    axel
    speedtest-cli
  ];
}

