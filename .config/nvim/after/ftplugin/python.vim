" Py ftplugin file

" mappings
" comments
nnoremap <F2> i# <esc>
inoremap <F2> #
vnoremap <F2> I#

" logical operators
inoremap <buffer> !! !=


"*** Theme ***"
"   theming for conceals set inside of the
"   default theme file do not carry over and
"   must be set here
match Error /\%81v.\+/
