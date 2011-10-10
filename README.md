##About

[github-search.vim] is a [Vim] plugin to search [Github](http://github.com) with [Vim].

here's the result of running `:GHSearchRepo ruby-kata`

![Github-search.vim](https://lh3.googleusercontent.com/-GtFvhbkYQrg/TpDNt0e30pI/AAAAAAAAHT0/rGkpaxlCkD4/s875/gthub-search.vim.png)

## Why

A. It's faster than doing it with browser 1) search in browser 2) copy clone url 3) clone in terminal 4) open in Vim
B. I prefer Vim to study sources, so I made it easier

## Installation

If you're [Vundle] user

1. run `:BundleInstall gmarik/github-search.vim` within [Vim]
2. add `Bundle 'gmarik/github-search.vim'` to your [Vundle] powered `.vimrc` 

## Howto
run in [Vim]

`:GHSearchRepo somethin` to search for `somethin`

Pressing `C` over selected repo will clone repo to `~/src/github_user/github_repo`

## Requirements

- [Curl] - to query github
- [Git] - to clone

##TODO

- allow specify language
- integrate with [Vundle] to allow search for [Vim plugins]

[github-search.vim]:http://github.com/gmarik/github-search.vim
[Vim]:http://www.vim.org
[Vundle]:http://github.com/gmarik/vundle
[Vim plugins]:https://github.com/search?type=Repositories&language=VimL&q=vim
[Git]:http://git-scm.com/
[Curl]:http://curl.haxx.se/
[Vundle]:http://github.com/gmarik/vundle
