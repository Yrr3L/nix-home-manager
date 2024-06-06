{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    tmuxConfig = ''
      set -g mouse on
      set -g aggressive-resize on
      set -g base-index 1
      set -g prefix C-a
      set -g escape-time 500
      set -g terminal-overrides 'xterm*:smcup@:rmcup@'
      bind-key C-a send-prefix
      run -b 'tmux new-session'
      set -g status-interval 5
    '';
  };
}

