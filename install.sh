# link files
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/core/autocmds.lua ~/.config/nvim/lua/core/autocmds.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/core/keymaps.lua ~/.config/nvim/lua/core/keymaps.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/core/options.lua ~/.config/nvim/lua/core/options.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/core/plugins.lua ~/.config/nvim/lua/core/plugins.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/core/utils.lua ~/.config/nvim/lua/core/utils.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/alpha.lua ~/.config/nvim/lua/plugin/alpha.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/galaxyline.lua ~/.config/nvim/lua/plugin/galaxyline.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/nvim-autopairs.lua ~/.config/nvim/lua/plugin/nvim-autopairs.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/pretty-fold.lua ~/.config/nvim/lua/plugin/pretty-fold.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/vim-tidal.lua ~/.config/nvim/lua/plugin/vim-tidal.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/comment.lua ~/.config/nvim/lua/plugin/comment.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/indent-blankline.lua ~/.config/nvim/lua/plugin/indent-blankline.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/nvim-cmp.lua ~/.config/nvim/lua/plugin/nvim-cmp.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/scnvim.lua ~/.config/nvim/lua/plugin/scnvim.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/vimwiki.lua ~/.config/nvim/lua/plugin/vimwiki.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/dap.lua ~/.config/nvim/lua/plugin/dap.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/jdtls.lua ~/.config/nvim/lua/plugin/jdtls.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/telescope.lua ~/.config/nvim/lua/plugin/telescope.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/fm-nvim.lua ~/.config/nvim/lua/plugin/fm-nvim.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/lualine.lua ~/.config/nvim/lua/plugin/lualine.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/nvim-tree.lua ~/.config/nvim/lua/plugin/nvim-tree.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/toggleterm.lua ~/.config/nvim/lua/plugin/toggleterm.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/formatter.lua ~/.config/nvim/lua/plugin/formatter.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/null-ls.lua ~/.config/nvim/lua/plugin/null-ls.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/nvim-treesitter.lua ~/.config/nvim/lua/plugin/nvim-treesitter.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/ufo.lua ~/.config/nvim/lua/plugin/ufo.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/nvim-lspconfig/capabilities.lua ~/.config/nvim/lua/plugin/nvim-lspconfig/capabilities.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/nvim-lspconfig/handlers.lua ~/.config/nvim/lua/plugin/nvim-lspconfig/handlers.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/nvim-lspconfig/init.lua ~/.config/nvim/lua/plugin/nvim-lspconfig/init.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/nvim-lspconfig/on-attach.lua ~/.config/nvim/lua/plugin/nvim-lspconfig/on-attach.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/nvim-lspconfig/on-init.lua ~/.config/nvim/lua/plugin/nvim-lspconfig/on-init.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/nvim-lspconfig/server-configs/jdtls.lua ~/.config/nvim/lua/plugin/nvim-lspconfig/server-configs/jdtls.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/nvim-lspconfig/server-configs/sumneko.lua ~/.config/nvim/lua/plugin/nvim-lspconfig/server-configs/sumneko.lua
ln -s ~/Documents/GitHub/dotfiles/.config/nvim/lua/plugin/nvim-lspconfig/server-configs/tsserver.lua ~/.config/nvim/lua/plugin/nvim-lspconfig/server-configs/tsserver.lua


mkdir ~/tools
git clone https://github.com/zsh-git-prompt/zsh-git-prompt.git ~/tools/zsh-git-prompt/
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/tools/zsh-autosuggestions/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/tools/zsh-syntax-highlighting/

# lua-lsp
git clone https://github.com/sumneko/lua-language-server.git ~/tools/lua-language-server/
cd ~/tools/lua-language-server/
git submodule update --depth 1 --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

# formatter for lua
brew install stylua

# javascript and typescript lsp
npm install --save typescript

asdlfj
