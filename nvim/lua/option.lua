local fn  = vim.fn
local cmd = vim.cmd

cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])
cmd([[colorscheme molokai                                         ]])
cmd([[let g:molokai_original = 1                                  ]])
cmd([[let g:rehash256 = 1                                         ]])
cmd([[set number                                                  ]])
cmd([[set scrolloff=5                                             ]])
cmd([[set fenc=utf-8                                              ]])
cmd([[set autoread                                                ]])
cmd([[set cursorcolumn                                            ]])
cmd([[set cursorline                                              ]])
cmd([[set expandtab                                               ]])
cmd([[set tabstop=2                                               ]])
cmd([[set shiftwidth=2                                            ]])
cmd([[set laststatus=2                                            ]])
cmd([[set smartindent                                             ]])
cmd([[syntax enable                                               ]])
cmd([[filetype plugin indent on                                   ]])
cmd([[map <C-n> :NERDTreeToggle<CR>                               ]])

if fn.system({"uname","-a","|","grep", "-i", "microsoft"}) then
  cmd([[
    augroup myYank
      autocmd!
      autocmd TextYankPost * :call system('clip.exe', @")
    augroup END
  ]])
  cmd([[set clipboard&]])
  cmd([[set clipboard^=unnamedplus]])
end
