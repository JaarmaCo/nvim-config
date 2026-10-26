## Nvim configuration

This is my personal Neovim configuration that I have dediced to post because I keep
having to rewrite it as I swap between machines and operating systems.

The current configuration is adapted mainly for use in Java Spring projects.

### Requirements

This configuration is created for neovim `v0.12.5` and support for older versions is
not guaranteed.

The following features are presumed to be installed:

- ripgrep
- tree-sitter
- lua-language-server
- tar
- curl
- git
- A clipboard provider: xclip, wayclip, etc. (see `:help provider-clipboard`)
- Linux standard utilities (cd, grep, find, etc.)
- Terminal emulator font: JetBrainsNerdFont Mono (or another nerd font)

### Enabled plugins

Plugins in this configuration are managed using `vim.pack`, which I believe offers
a decent balance between ease of use and configurability (as opposed to `Lazy.nvim`
which tends to force a lot of defaults on you).

These are the plugins used by this configuration:

- `https://github.com/neovim/nvim-lspconfig` provides default configurations for a large set of LSP's.
- `https://github.com/catppuccin/nvim` provides the catppuccin colorscheme.
- `https://github.com/nvim-treesitter/nvim-treesitter` syntax highlighting support.
- `https://github.com/hrsh7th/nvim-cmp` autocompletion support.
- `https://github.com/hrsh7th/cmp-nvim-lsp` LSP sourced completions.
- `https://github.com/hrsh7th/cmp-buffer` buffer word completions.
- `https://github.com/hrsh7th/cmp-path` completion source for filesystem paths.
- `https://github.com/hrsh7th/cmp-cmdline` vim command line completion.
- `https://github.com/hrsh7th/vim-vsnip` snippet support.
- `https://github.com/hrsh7th/cmp-vsnip` completion source for vsnip snippets.
- `https://github.com/petertriho/cmp-git` git sourced completions.
- `https://github.com/nvim-tree/nvim-web-devicons` nerd font icon support.
- `https://github.com/nvim-tree/nvim-tree.lua` filesystem explorer.
- `https://github.com/folke/which-key.nvim` keybinding hints.
- `https://github.com/nvim-lua/plenary.nvim` utilities used by other plugins.
- `https://github.com/nvim-telescope/telescope-fzf-native.nvim` compiled fuzzy finder.
- `https://github.com/nvim-telescope/telescope.nvim` fuzzy finder and live grep.
- `https://github.com/mfussenegger/nvim-dap` debugger support.
- `https://github.com/nvim-java/nvim-java` preconfigured Java LSP and utilties.
- `https://github.com/JavaHello/spring-boot.nvim` port from VSCode that supplies various spring boot integrations (required by `nvim-java`).
- `https://github.com/MunifTanjim/nui.nvim` various UI components (required by `nvim-java`).
