local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
    -- Self manage packer
    'wbthomason/packer.nvim';

    -- Search modal
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = {{'nvim-lua/plenary.nvim'}, {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make'
        }}
    };

    -- Basic stuff
    'tpope/vim-surround';
    'tpope/vim-commentary';
    'tpope/vim-repeat';

    -- Source Code Management
    'mhinz/vim-signify';
    'tpope/vim-fugitive';

    -- Syntax highlight
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({
                with_sync = true
            })
            ts_update()
        end
    };
    ---------------
    -- Technical Writing
    ---------------

    'christoomey/vim-titlecase';
    'junegunn/goyo.vim';
    'rhysd/vim-grammarous';

    ---------------
    -- Aesthetics
    ---------------

    -- Tree view
    {
        'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons'},
    };

    {
        'akinsho/bufferline.nvim',
        -- tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    };

    -- Theme
    'Shatur/neovim-ayu';
    {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true,
        },
    };
}