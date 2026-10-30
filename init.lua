
vim.o.number = true
vim.o.clipboard = 'unnamedplus'
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.cursorline = true

vim.g.mapleader = ','
vim.g.loaded_netrw = 1
vim.g.loaded_netrw_plugin = 1

vim.keymap.set('n', '<leader>h', function ()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inlay hints' })

vim.keymap.set('n', '<leader>dt', function ()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle LSP diagnostics text' })

vim.keymap.set('n', '<leader>ds', vim.diagnostic.open_float, { desc = 'Show diagnostic at cursor location' })

vim.keymap.set('n', '[d', function()
    vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic' })

vim.keymap.set('n', ']d', function ()
    vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic' })

vim.pack.add {
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/catppuccin/nvim',
}

vim.cmd.colorscheme 'catppuccin-nvim'

vim.pack.add {
    'https://github.com/nvim-treesitter/nvim-treesitter'
}

require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install {
    'java',
    'lua',
    'c',
    'cpp',
    'rust',
    'javascript',
    'typescript',
    'zig',
    'go',
    'haskell',
    'bash',
}

vim.pack.add {
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/cmp-cmdline',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-vsnip',
    'https://github.com/hrsh7th/vim-vsnip',
    'https://github.com/petertriho/cmp-git',
}

local cmp = require 'cmp'

cmp.setup {

    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = {

        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-Up>'] = cmp.mapping.select_prev_item {},
        ['<C-Down>'] = cmp.mapping.select_next_item {},
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    }),
}

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' },
    }, {
        { name = 'buffer' },
    }),
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
  })

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.pack.add {
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/folke/which-key.nvim',
}
require('nvim-tree').setup {
    view = {
        width = 60,
    },
}

require('which-key').setup()

vim.keymap.set('n', '<leader>fe', function()
    vim.cmd 'NvimTreeToggle'
end, { desc = 'Nvim Tree toggle explorer' })

vim.pack.add {
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
}

require('telescope').setup {}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.lsp.config('luals', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc' },
    capabilities = capabilities,
})
vim.lsp.enable 'luals'

vim.pack.add {
    'https://github.com/mfussenegger/nvim-dap',
    {
        src = 'https://github.com/JavaHello/spring-boot.nvim',
        version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
    },
    'https://github.com/MunifTanjim/nui.nvim',
    'https://github.com/nvim-java/nvim-java',
}

require('java').setup()
vim.lsp.enable 'jdtls'

vim.pack.add {
    'https://github.com/folke/snacks.nvim',
    'https://github.com/coder/claudecode.nvim',
}

require('claudecode').setup {
    auto_start = false,
    log_level = 'error',
}

