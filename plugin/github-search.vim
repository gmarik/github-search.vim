" github-search.vim:   Vim plugin providing github searching functionality, so you can clone found repos
" Author:              gmarik
" HomePage:            http://github.com/gmarik/github-search.vim
" Readme:              http://github.com/gmarik/github-search.vim/blob/master/README.md
" Version:             0.1

com! -nargs=+         GHSearchRepo call GHSearchRepo(<q-args>)

func! GHcloneRepo(repo) abort
  let path = '~/src/'.a:repo
  exec '!git clone http://github.com/'.a:repo.' '.path
  wincmd s
  exec ':Explore'.path
endf

func! GHSearchRepo(query) abort
  call GHview(a:query, ['" Github Search: '.a:query, '" press C to clone'], map(GHfetch(a:query).repositories, 'GHformat(v:val)' ))
endf

func! GHfetch(query) abort
  let [true, false, null] = [1,0,"''"]
  return eval(readfile(GHquery(a:query),'b')[0])
endf

func! GHformat(repo)
  let desc = has_key(a:repo, 'description') ? '  " '.a:repo.description : ''
  return printf("Repo '%s/%s'%s", a:repo.username, a:repo.name, desc)
endf

func! GHview(title, headers, results)
  if exists('g:gh_view') && bufloaded(g:gh_view)
    exec g:gh_view.'bd!'
  endif

  exec 'silent pedit [GHSearch] '.a:title

  wincmd P | wincmd H

  let g:gh_view = bufnr('%')

  call append(0, a:headers + a:results)

  setl buftype=nofile
  setl noswapfile

  setl cursorline
  setl nonu ro noma ignorecase

  setl ft=vim
  setl syntax=vim
  syn keyword vimCommand Repo

  com! -buffer -nargs=1 -bar    GHcloneRepo call GHcloneRepo(<args>)

  nnoremap <buffer> q :silent bd!<CR>
  nnoremap <buffer> C :exec 'GHclone'.getline('.')<CR>

  exec ':'.(len(a:headers) + 1)
  redraw!
endf

func! GHquery(q)
  let l:to = tempname()
  let l:from = 'http://github.com/api/v2/json/repos/search/'.a:q

  if executable("curl")
    let cmd = 'curl --fail -s -o '.shellescape(l:to).' '.l:from
  elseif executable("wget")
    let temp = shellescape(tempname())
    let cmd = 'wget -q -O '.temp.' '.l:from. ' && mv -f '.temp.' '.shellescape(l:to)
    if (has('win32') || has('win64'))
      let cmd = substitute(cmd, 'mv -f ', 'mv /Y ') " change force flag
      let cmd = '"'.cmd.'"'                         " enclose in quotes so && joined cmds work
    end
  else
    throw 'Error curl or wget is not available!'
  endif

  silent exec '!'.cmd

  if (0 != v:shell_error)
    throw 'Error running cmd:$ '.cmd
  endif

  return l:to
endf
