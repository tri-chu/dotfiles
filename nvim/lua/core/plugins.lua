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

require('pckr').add {
    -- Self manage packer
    'wbthomason/packer.nvim',

    -- Search modal
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' }, {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make'
        } }
    },

    -- Basic stuff
    'tpope/vim-surround',
    'tpope/vim-commentary',
    'tpope/vim-repeat',

    -- Source Code Management
    'mhinz/vim-signify',
    'tpope/vim-fugitive',

    -- Syntax highlight
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- Last release is way too old
        build = ":TSUpdate",
        -- event = { "BufReadPost", "BufNewFile" },
        lazy = false,                    -- Keep false to ensure loading for Neo-tree
        main = "nvim-treesitter.config", -- Lazy handles the require logic here
        branch = "master",               -- Explicitly force the stable branch
        opts = {
            ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "c", "cpp", "markdown", "markdown_inline", "csv", "json" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
        -- Fallback config to handle edge cases
        config = function(_, opts)
            -- Protective call: If treesitter fails to load, don't crash neovim
            local status_ok, configs = pcall(require, "nvim-treesitter.config")
            if not status_ok then
                return
            end
            configs.setup(opts)
        end,
    },
    ---------------
    -- Technical Writing
    ---------------

    'christoomey/vim-titlecase',
    -- 'junegunn/goyo.vim';
    'rhysd/vim-grammarous',

    -- Markdown Render
    {
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        -- requires = { 'nvim-mini/mini.nvim', opt = true }, -- if you use the mini.nvim suite
        -- requires = { 'nvim-mini/mini.icons', opt = true }, -- if you use standalone mini plugins
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
        config = function()
            require('render-markdown').setup({})
        end,
    },

    ---------------
    -- Aesthetics
    ---------------

    -- Tree view
    {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
    },

    {
        'akinsho/bufferline.nvim',
        -- tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    },

    -- Theme
    'Shatur/neovim-ayu',
    {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true,
        },
    },
}
