##About

[github-search.vim] is a [Vim] plugin to search [Github](http://github.com) with [Vim].

here's the result of running `:GHSearch ruby-kata`

![Github-search.vim](https://lh3.googleusercontent.com/-GtFvhbkYQrg/TpDNt0e30pI/AAAAAAAAHT0/rGkpaxlCkD4/s875/gthub-search.vim.png)

To clone repo to `~/src/github_user/github_repo` press `C `

## Installation

If you're `Vundle` user run

`BundleInstall gmarik/github-search.vim`

also don't forget to add

`Bundle 'gmarik/github-search.vim'` to your [Vundle] powered `.vimrc` if you like it


## Howto
run in [Vim]

`:GHSearchRepo somethin` to search for `somethin`

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
