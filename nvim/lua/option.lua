local fn  = vim.fn
local cmd = vim.cmd

cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])
cmd([[colorscheme molokai                                         ]])
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
cmd([[set fileformat=unix                                         ]])
cmd([[set list                                                    ]])
cmd([[syntax enable                                               ]])
cmd([[filetype plugin indent on                                   ]])
cmd([[map <C-n> :NERDTreeToggle<CR>                               ]])
cmd([[nmap <Esc><Esc> :nohlsearch<CR><Esc>                        ]])
cmd([[autocmd BufNewFile,BufRead *.ts         setlocal filetype=typescript]])
cmd([[autocmd BufNewFile,BufRead *.vue        setlocal filetype=vue]])
cmd([[autocmd BufNewFile,BufRead *.vue        setlocal filetype=vue]])
cmd([[autocmd BufNewFile,BufRead Vagrantfile  setlocal filetype=ruby]])
cmd([[autocmd BufNewFile,BufRead Capfile      setlocal filetype=ruby]])
cmd([[autocmd BufNewFile,BufRead *.tf         setlocal filetype=terraform]])
cmd([[autocmd BufNewFile,BufRead .envrc       setlocal filetype=bash]])
cmd([[autocmd BufNewFile,BufRead \*.{md,mdwn,mkd,mkdn,mark\*} set filetype=markdown]])
cmd([[autocmd BufNewFile,BufRead *.ssh_conf set filetype=sshconfig]])
cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

if fn.system({ "uname", "-a", "|", "grep", "-i", "microsoft" }) then
    cmd([[
    augroup myYank
      autocmd!
      autocmd TextYankPost * :call system('clip.exe', @")
    augroup END
  ]])
    cmd([[set clipboard&]])
    cmd([[set clipboard^=unnamedplus]])
end

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  --  underline = true,
  --  update_in_insert = false,
  --  severity_sort = false,
  --  severity = vim.diagnostic.severity.WARN,
})
