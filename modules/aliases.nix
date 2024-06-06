{ config, pkgs, ... }:
{
  home.shellAliases = {
    cp = "cp -iv";
    mv = "mv -iv";
    rm = "trash-put";
    cat = "bat";
    ls = "eza --grid --icons";
    ll = "eza -l --grid --icons";
    la = "eza -a --grid --icons";
    lt = "eza --tree --grid --icons";
    lla = "eza -la --grid --icons";
    gst = "git status";
    gco = "git checkout";
    gcm = "git commit -m";
    gpull = "git pull";
    gpush = "git push";
    };
}

