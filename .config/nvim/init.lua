-- Neovim configuration

-- Basic settings
vim.opt.compatible = false
vim.opt.fileencoding = 'utf-8'
vim.opt.undofile = true
--vim.opt.runtimepath:append("/usr/share/vim/vim82/syntax/")
vim.opt.undodir = vim.fn.expand('~/.config/nvim/undo')
vim.opt.regexpengine = 2

-- Plugin management with packer.nvim
-- Make sure to install packer.nvim first
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'kien/ctrlp.vim'
  use 'vim-ruby/vim-ruby'
  use 'tpope/vim-rails'
  use 'tpope/vim-surround'
  use 'vim-scripts/paredit.vim'
  use 'Shougo/neocomplcache.vim'
  use 'luochen1990/rainbow'
  use 'airblade/vim-gitgutter'
  use 'myusuf3/numbers.vim'
  use 'ahw/vim-pbcopy'
  use 'tpope/vim-fugitive'
  use 'justinmk/vim-sneak'
  use 'dockyard/vim-easydir'
  use 'guns/vim-clojure-static'
  use 'bling/vim-bufferline'
  use 'shaunsingh/solarized.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'ishan9299/nvim-solarized-lua'
  use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'
  use "stevearc/dressing.nvim"
  use {
    "yetone/avante.nvim",
    event = "VimEnter",  -- Optional: Change this to a more suitable event for your setup
    build = "make",  -- Optional: Build from source
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",  -- Optional: For autocompletion
      "nvim-tree/nvim-web-devicons",  -- Optional: For icons
      "zbirenbaum/copilot.lua",  -- Optional: For GitHub Copilot support
      "HakonHarnes/img-clip.nvim",  -- Optional: For image pasting support
      {
        "MeanderingProgrammer/render-markdown.nvim",  -- Optional: For markdown rendering support
        ft = { "markdown", "Avante" },  -- Specify file types
      },
    },
    config = function()
      -- Run the setup function for avante.nvim after installation
      require('avante_lib').load()
      require('avante').setup({
        provider = "claude",  -- Choose your AI provider
        -- Add any other configuration options as needed
      })
    end
  }

end)


--use {
--  "supermaven-inc/supermaven-nvim",
--  config = function()
--    require("supermaven-nvim").setup({})
--  end,
--}

-- Plugin configurations
vim.g.rainbow_active = 1
vim.g.acp_enableAtStartup = 0
vim.g.neocomplcache_force_overwrite_completefunc = 1
vim.g.neocomplcache_enable_at_startup = 1
vim.g.neocomplcache_enable_auto_select = 1
vim.g.neocomplcache_temporary_dir = vim.fn.expand('~/.config/nvim/tmp/neocomplcache')
vim.g.neocomplcache_auto_completion_start_length = 2
vim.g.neocomplete_max_list = 15
vim.g.sneak_label = 1
vim.g.clojure_align_multiline_strings = 1

-- Clipboard settings
vim.opt.clipboard = 'unnamed'

-- Key mappings
vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

vim.api.nvim_set_keymap('v', '<C-x>', ':!pbcopy<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-c>', ':w !pbcopy<CR><CR>', { noremap = true })

vim.g.solarized_termtrans = 1
vim.cmd("colorscheme solarized")

-- General settings
vim.opt.mouse = 'a'
vim.opt.history = 1000
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.wrapscan = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.magic = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.showmode = true
vim.opt.ruler = true
vim.opt.visualbell = true

-- Status line
-- vim.opt.statusline = '%<%f\\ %w%h%m%r%{FugitiveStatusline()}\ [%{&ff}/%Y]\ [%{getcwd()}]%=%-14.(%l,%c%V%)\ %p%%'

-- File type specific settings
vim.cmd('au BufRead,BufNewFile *.pde setf java')

-- Enable filetype detection and indent
vim.cmd('filetype plugin indent on')

-- Set line numbers
vim.opt.number = true
