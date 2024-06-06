{ config, pkgs, ... }:
{
  home.sessionVariables = {
    BAT_PAGER = "less -FR";
    BAT_THEME = "Dracula";
  };
}

