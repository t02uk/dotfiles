augroup ghcmodcheck
  autocmd! BufWritePost <buffer> GhcModCheckAsync
  autocmd! filetype haskell nnoremap <F3> :GhcModType<CR>
augroup END
