set number		" always show line numbers
set ruler		" always show current position
set showmatch		" set show matching parenthesis
set ignorecase		" ignore case when searching
set smartcase		" ignore case if all lowercase
set nocompatible	" don't care about vi no more
set hlsearch		" highlight search
set incsearch		" highlight as you search
set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands
set backspace=indent,eol,start
scriptencoding utf-8
set encoding=utf-8
set t_Co=256
set termencoding=utf-8

" Set color for regular vim
if !has('nvim')
    set term=xterm-256color
endif

" Get config path
let s:path = expand('<sfile>:p:h')

" Centralized backup
exec 'set' 'backupdir=' . s:path . '/../local/backups'
set backup

exec 'set' 'undodir=' . s:path . '/../local/undo'
set undofile

" vim swap
exec 'set' 'directory=' . s:path . '/../local/swap'

" Buffer issues
set hidden		" hide the buffer, don't close
set title		" change the terminal's title
set laststatus=2	" always show status line

" Remember last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Folding
set foldnestmax=1
set foldmethod=syntax
set foldlevel=10

"" enable for large files
autocmd! BufReadPost * :if line('$') > 75 | set foldlevel=0 | endif

"" save folds
augroup save_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

"" create custom fold message
function! CustomFoldText(delim)

  "get first non-blank line
  let fs = nextnonblank(v:foldstart)

  if fs > v:foldend
      let line = getline(v:foldstart)
  else
      let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  " indent foldtext corresponding to foldlevel
  let foldLineHead = line . " "

  " size foldtext according to window width
  let w = winwidth(0) - &foldcolumn - (&number ? &numberwidth : 0) - (&l:signcolumn is# 'yes' ? 2 : 0)
  let foldSize = 1 + v:foldend - v:foldstart

  " estimate fold length
  let foldSizeStr = " " . foldSize . " lines "
  let lineCount = line("$")
  if has("float")
    try
      let foldPercentage = "[" . printf("%4s", printf("%.1f", (foldSize*1.0)/lineCount*100)) . "%] "
    catch /^Vim\%((\a\+)\)\=:E806/	" E806: Using Float as String
      let foldPercentage = printf("[of %d lines] ", lineCount)
    endtry
  endif

  " build up foldtext
  let foldLineTail = foldSizeStr . foldPercentage
  let lengthTail = strwidth(foldLineTail)
  let lengthHead = w - (lengthTail + indent)

  if strwidth(foldLineHead) > lengthHead
    let foldLineHead = strpart(foldLineHead, 0, lengthHead-2) . '..'
  endif

  let lengthMiddle = w - strwidth(foldLineHead.foldLineTail)

  " truncate foldtext according to window width
  let expansionString = repeat(a:delim, lengthMiddle)

  let foldLine = foldLineHead . expansionString . foldLineTail
  return foldLine
endfunction
set foldtext=CustomFoldText('\.')

" Reset terminal title to CWD
let &titleold=getcwd()
