{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    helix
    jq
    git-crypt
    tig
    tree-sitter
    php
    phpPackages.composer
    apacheHttpd
    mysql
    postgresql
  ];
}

