# `ctrlp-insert_from_systemlist`

Call a shell command, pick a line with CtrlP, insert it.


Example setup:

```vim
Plug 'smondet/ctrlp-insert_from_systemlist'
let g:ctrlp_extensions = [ 'insert_from_systemlist'] " Add it to the list of CtrlP extensions
fun! GetDates()
    let id = ctrlp#insert_from_systemlist#run_with_command('gdate -R ; gdate -I ; date ')
    call ctrlp#init(id)
endfun
nmap <leader>pid :call GetDates()<cr>
nmap <leader>pig :call ctrlp#init(ctrlp#insert_from_systemlist#run_with_command('git ls-files'))<cr>
```
