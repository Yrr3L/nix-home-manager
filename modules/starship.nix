{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true;
    promptOrder = ["user","dir","git_branch","git_status"];
  };
}

