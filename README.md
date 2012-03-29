##About

[github-search.vim] is a [Vim] plugin to search [Github](http://github.com) within [Vim].

Here's the result of running `:GHSearchRepo ruby-kata`:

![Github-search.vim](https://lh3.googleusercontent.com/-GtFvhbkYQrg/TpDNt0e30pI/AAAAAAAAHT0/rGkpaxlCkD4/s875/gthub-search.vim.png)

## Why?

- It's faster than using the browser:

  1. search in browser
  2. copy/clone the url
  3. clone in terminal
  4. open in Vim

- I prefer Vim to study sources, so I made it easier.

## Installation

If you are a [Vundle] user:

1. run `:BundleInstall gmarik/github-search.vim` within [Vim]
2. add `Bundle 'gmarik/github-search.vim'` to your [Vundle] powered `.vimrc`

## How-To
Run in [Vim]

`:GHSearchRepo somethin` to search Github for `somethin`.

Pressing `C` over the selected repo will clone the repo to `~/src/github_user/github_repo`. To change the destination path, set the `g:github_search_path_format` variable in your vimfiles. There are three placeholders that will be replaced.:

  - `:repo`: the full Github repo path consisting of author/project, such as `gmarik/github-search.vim`
  - `:author`: the author of the repo, in this case `gmarik`
  - `:project`: the name of the project, `github-search.vim`

As an example, if you want to clone this repo to `~/projects/github-search.vim`, you can do that by adding the following to your vimfiles:

    let g:github_search_path_format = '~/projects/:project'

## Requirements

- [Curl] - to query github
- [Git] - to clone from Github

##TODO

- allow the user to specify the language for a faceted type of search
- integrate with [Vundle] to allow search for [Vim plugins]

[github-search.vim]:http://github.com/gmarik/github-search.vim
[Vim]:http://www.vim.org
[Vundle]:http://github.com/gmarik/vundle
[Vim plugins]:https://github.com/search?type=Repositories&language=VimL&q=vim
[Git]:http://git-scm.com/
[Curl]:http://curl.haxx.se/
[Vundle]:http://github.com/gmarik/vundle
