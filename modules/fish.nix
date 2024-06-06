{ config, pkgs, ... }:
let
  omfInstall = ''
    if not command -v omf > /dev/null; then
      curl -L https://get.oh-my.fish | fish
    fi
  '';
in
{
  home.sessionVariables = {
    FISH_DEFAULT = "fish";
  };

  home.file.".config/fish/functions/fish_prompt.fish".text = omfInstall;
}

