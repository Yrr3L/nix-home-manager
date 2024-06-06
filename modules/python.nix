{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    python3Packages.python-language-server
    python3Packages.black
    python3Packages.isort
    python301Packages.bpython
  ];
}

