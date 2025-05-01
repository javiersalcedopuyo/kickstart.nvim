-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Quick save and close
vim.keymap.set('n', '<Leader>w', ':w<CR>', {desc = '[W]rite'})
vim.keymap.set('n', '<Leader>q', ':q<CR>', {desc = '[Q]uit'})

-- Copy to system's cplipboard
vim.keymap.set('v', '<Leader>y', '*y', {desc = '[Y]ank to system cplipboard'})

-- Buffers as tabs
vim.keymap.set('n', 'tn', ':tabnew<Space><CR>')
vim.keymap.set('n', 'tk', 'gt')
vim.keymap.set('n', 'tj', 'gT')

vim.o.relativenumber = true
vim.o.colorcolumn = '80,100'

vim.o.autoindent        = true
vim.o.copyindent        = true
vim.o.preserveindent    = true

vim.o.expandtab     = true -- Replace Tab with spaces
vim.o.shiftwidth    = 4 -- Number of autoindent spaces
vim.o.softtabstop   = 4 -- Number of spaces replacing a Tab
vim.o.ts            = 4 -- Number of spaces a Tab is *displayed* as

vim.o.autoread = true -- Auto reload a file when it's changed outside nvim

vim.keymap.set(
    'n',
    '<Leader>ot',
    function()
        vim.cmd.new()
        vim.cmd.term()
        vim.cmd.wincmd("J") -- Move the new split to the bottom
        vim.api.nvim_win_set_height(0, 15)
    end,
    {desc = '[O]pen [T]erminal'})

-- Don't display the line numbers in terminal mode
vim.api.nvim_create_autocmd( 'TermOpen', {
    desc = '',
    group = vim.api.nvim_create_augroup('custom_term_open', { clear = true }),
    callback = function ()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end})


vim.api.nvim_create_user_command(
    "CopyFilePath",
    function ()
        local path = vim.fn.expand( "%:p" )
        vim.fn.setreg( "+", path )
    end,
    {})

vim.diagnostic.config({
    virtual_lines = true
})


vim.o.guifont = "Cascadia Code:h12"
if vim.g.neovide then
    vim.g.neovide_scroll_animation_length = 0.1
    vim.g.neovide_cursor_animation_length = 0.05
    vim.g.neovide_cursor_trail_size = 0.025
    vim.g.neovide_cursor_smooth_blink = true
end

-- More plugins
return {
    'dominikduda/vim_current_word',             -- Highlights instances of the word under cursor
    'nvim-treesitter/nvim-treesitter-context',  -- Show the current context on the top
    'mg979/vim-visual-multi',                   -- Multiple cursors using <C-n>
    -- 'karb94/neoscroll.nvim',                    -- Smooth scrolling
    -- 'luochen1990/rainbow',                      -- Colorize brackets
    -- Version control stuff
    {
        'mhinz/vim-signify',
        config = function()
            vim.g.signify_sign_change = '~'
            vim.keymap.set('n', '<Leader>vd', ':SignifyHunkDiff<CR>', {desc = '[V]ersion Control [D]iff'})
            vim.keymap.set('n', '<Leader>vu', ':SignifyHunkUndo<CR>', {desc = '[V]ersion Control [U]ndo'})
        end
    },
    -- Easymotion
    {
        'asvetliakov/vim-easymotion',
        config = function()
            vim.g.EasyMotion_smartcase = true
            vim.keymap.set('n', '<Leader>j', '<Plug>(easymotion-overwin-f)', {desc = '[J]ump to character'})
        end,
    },
    -- Zig syntax support
    {
        'ziglang/zig.vim',
        config = function()
            vim.g.zig_fmt_autosave = false
        end
    },
    -- THEMES
    -- Solarized
    {
        'maxmx03/solarized.nvim',
        name = 'solarized',
        priority = 1000,
        config = function ()
            -- vim.cmd.colorscheme 'solarized'
            -- vim.o.background = 'dark'
        end
    },
    -- Catppuccin
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function ()
            vim.cmd.colorscheme 'catppuccin-frappe'
            vim.o.background = 'dark'
        end
    },
}
