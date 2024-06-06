{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
    extraPackages = ps: with ps; [
      vim-airline
      vim-airline-themes
      vim-fugitive
      vim-gitgutter
      nvim-cmp
      cmp-nvim-lsp
      vim-commentary
      nvim-surround
      nvim-treesitter
      vim-vsnip
      cmp-vsnip
      lazy-lsp-nvim
      dracula-nvim
      vim-airline-clock
      vim-indent-guides
      nvim-lspconfig
      nvim-autopairs
      nvim-telescope
      nvim-telescope-fzf-native
      nvim-ts-autotag
      nvim-lspinstall
      lsp-installer
      lspconfig
      lspcontainers
      dockerfile-language-server-nodejs
      bash-language-server
      yaml-language-server
      html-language-server
      tailwindcss-language-server
    ];
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim/init.lua".text = ''
    -- Packer configuration
    require('packer').startup(function()
      use 'wbthomason/packer.nvim'
      use 'neovim/nvim-lspconfig'
      use 'hrsh7th/nvim-cmp'
      use 'hrsh7th/cmp-nvim-lsp'
      use 'hrsh7th/cmp-buffer'
      use 'hrsh7th/cmp-path'
      use 'hrsh7th/cmp-cmdline'
      use 'saadparwaiz1/cmp_luasnip'
      use 'L3MON4D3/LuaSnip'
      use 'hoob3rt/lualine.nvim'
      use 'nvim-treesitter/nvim-treesitter'
      use 'windwp/nvim-autopairs'
      use 'windwp/nvim-ts-autotag'
      use 'nvim-telescope/telescope.nvim'
      use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
      use 'folke/tokyonight.nvim'
      use 'dracula/vim'
      use 'tpope/vim-commentary'
      use 'tpope/vim-fugitive'
      use 'airblade/vim-gitgutter'
      use 'tpope/vim-surround'
      use 'vim-airline/vim-airline'
      use 'vim-airline/vim-airline-themes'
    end)

    -- General settings
    vim.o.syntax = 'on'
    vim.o.termguicolors = true
    vim.cmd 'colorscheme dracula'
    vim.o.cursorline = true
    vim.o.scrolloff = 5
    vim.g.airline_theme = 'wombat'

    -- LSP settings
    local lspconfig = require('lspconfig')
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      })
    })

    lspconfig.tsserver.setup{}
    lspconfig.intelephense.setup{}
    lspconfig.phpactor.setup{}
    lspconfig.html.setup{}
    lspconfig.cssls.setup{}
    lspconfig.bashls.setup{}
    lspconfig.dockerls.setup{}
    lspconfig.jsonls.setup{}
    lspconfig.vimls.setup{}
    lspconfig.yamlls.setup{}

    -- Treesitter configuration
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "javascript", "php", "html", "css", "json" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }

    -- Autopairs and autotag configuration
    require('nvim-autopairs').setup{}
    require('nvim-ts-autotag').setup{}

    -- Telescope configuration
    require('telescope').setup{
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = require('telescope.actions').move_selection_next,
            ["<C-p>"] = require('telescope.actions').move_selection_previous,
          },
        },
      },
    }
    require('telescope').load_extension('fzf')
  '';
}

