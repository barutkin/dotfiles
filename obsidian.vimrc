set tabstop=2

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. With line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more isually -- I want `down` to mean the next line on the screen
" nmap j gj
" nmap k gk
" to work with relative line numbers
" nnoremap <expr> j v:count ? 'j' : 'gj'
" nnoremap <expr> k v:count ? 'k' : 'gk'

nmap <silent> // :nohlsearch<CR>

map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map ё §
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map О J
map Л K
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
map Ё ±
map ; $
map [ ~
map ] `
map ! !
map @ @
map # #
map $ $
map % %
map ^ ^
map & &
map * *
map ( (
map ) )
map - _
map + +
