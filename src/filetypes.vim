" Defautocmdlt indent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8

" Python formatting
augroup ft_python
    autocmd!
    autocmd FileType python set cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd BufWritePre *.py :%s/\s\+$//e
    set foldmethod=indent
augroup END

" Puppet formatting
augroup ft_puppet
    autocmd!
    autocmd BufNewFile,BufRead *.pp set filetype=puppet
    autocmd FileType puppet set nowrap
    autocmd FileType puppet inoremap # .<c-h>#<space>
augroup END

" HTML formatting
augroup ft_html
    autocmd!
    autocmd FileType html set shiftwidth=2
    autocmd FileType html set softtabstop=2
augroup END

" Django templates
augroup ft_django
    autocmd!
    autocmd FileType htmldjango set shiftwidth=2
    autocmd FileType htmldjango set softtabstop=2
augroup END

" Golang
augroup ft_golang
    autocmd!
    autocmd FileType go set shiftwidth=4
    autocmd FileType go set softtabstop=4
    autocmd FileType go set tabstop=4
augroup END

" Markdown formatting
augroup ft_markdown
    autocmd!
    autocmd Filetype markdown setlocal spell spelllang=en_us
augroup END

" Plain text formatting
augroup ft_text
    autocmd!
    autocmd Filetype text setlocal spell spelllang=en_us
augroup END

" YAML formatting
augroup ft_yaml
    autocmd!
    autocmd BufRead,BufNewFile *.yaml.gotmpl set filetype=yaml
    autocmd BufNewFile,BufRead *.yaml.example set filetype=yaml
    autocmd BufNewFile,BufRead *.yml set filetype=yaml
    autocmd FileType yaml set shiftwidth=2
    autocmd FileType yaml set softtabstop=2
augroup END

" JSON formatting
augroup ft_json
    autocmd!
    autocmd FileType json set shiftwidth=2
    autocmd FileType json set softtabstop=2
augroup END

" rsnapshot config
augroup ft_rsnapshot_conf
    autocmd!
    autocmd BufNewFile,BufRead rsnapshot*.conf set filetype=rsnapshot_conf
    autocmd FileType rsnapshot_conf set noexpandtab
    autocmd FileType rsnapshot_conf set tabstop=4
    autocmd FileType rsnapshot_conf set shiftwidth=4
augroup END

" terraform
augroup ft_terraform
    autocmd!
    autocmd FileType terraform set shiftwidth=2
    autocmd FileType terraform set softtabstop=2
    autocmd Filetype terraform nmap <silent> <buffer> F :ALEFix<CR>:TerraformFmt<CR>
augroup END

" ruby
augroup ft_ruby
    autocmd!
    autocmd FileType ruby nmap ! :w<CR>:!ruby %<CR>
    autocmd FileType ruby set shiftwidth=2
    autocmd FileType ruby set softtabstop=2
augroup END

" chef
augroup ft_chef
    autocmd!
    autocmd BufRead,BufNewFile */cookbooks/*.rb set filetype=chef | set syntax=ruby.chef
    autocmd BufRead,BufNewFile */recipes/*.rb set filetype=chef | set syntax=ruby.chef
    autocmd FileType chef set shiftwidth=2
    autocmd FileType chef set softtabstop=2
augroup END

" gitconfig
augroup ft_gitconfig
    autocmd!
    autocmd BufRead,BufNewFile */.config/git/config set filetype=gitconfig
    autocmd BufRead,BufNewFile */.config/git/config.local set filetype=gitconfig
augroup END

" shell
augroup ft_shell
    autocmd!

    " For terraform shell templates
    autocmd BufRead,BufNewFile *.sh.tpl set filetype=sh

    " For ERB templates
    autocmd BufRead,BufNewFile *.sh.erb set filetype=sh

    " Should match shfmt in ale
    autocmd FileType sh set shiftwidth=2
    autocmd FileType sh set softtabstop=2
augroup END

" makefiles
augroup ft_makefile
    autocmd!
    autocmd FileType make set noexpandtab
    autocmd FileType make set tabstop=4
    autocmd FileType make set shiftwidth=4
    autocmd FileType make let b:tagbar_ignore = 1
augroup END

" sshconfig
augroup ft_sshconfig
    autocmd!
    autocmd BufRead,BufNewFile */.ssh/config.d/* set filetype=sshconfig
augroup END
