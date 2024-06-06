{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    extraPackages = ps: with ps; [
      vim-airline
      vim-airline-themes
      vim-fugitive
      vim-gitgutter
      vim-commantary
      nvim-surround
      nvim-treesitter
      vim-vsnip
      cmp-nvim-lsp
      dracula-nvim
      vim-airline-clock
      vim-indent-guides
    ];
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim/init.vim".text = ''
    call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'junegunn/fzf.vim'
    Plug 'dracula/vim'
    call plug#end()
    syntax enable
    colorscheme dracula
    set cursorline
    set scrolloff=5
    let g:airline_theme='wombat'
  '';
}

