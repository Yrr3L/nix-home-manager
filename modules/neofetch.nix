{ config, pkgs, ... }:
let
  fishConfig = ''
    function fish_greeting
      neofetch
    end
    alias cls='clear && neofetch'
  '';
in
{
  home.sessionVariables = {
    BASH_ENV = "${pkgs.neofetch}/etc/profile.d/neofetch.sh";
  };

  home.file.".config/fish/config.fish".text = fishConfig;
}

