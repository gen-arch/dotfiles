local fn           = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'tomasr/molokai'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'scrooloose/nerdtree'
  use 'airblade/vim-gitgutter'
  use 'bronson/vim-trailing-whitespace'
  use 'Yggdroot/indentLine'
  use 'hashivim/vim-terraform'
  use 'tpope/vim-endwise'
  use 'tpope/vim-commentary'

  if packer_bootstrap then
    require("packer").sync()
  end
end)

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)

require('keys')
require('option')
require('lsp-cmp')
