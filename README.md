# `ctrlp-insert_from_systemlist`

Call a shell command, and propose to choose a line with CtrlP, insert the chosen one.


Example setup

```vim
Plug 'smondet/ctrlp-insert_from_systemlist'
fun! GetDates()
    let id = ctrlp#insert_from_systemlist#run_with_command('gdate -R ; gdate -I ; date ')
    call ctrlp#init(id)
endfun
nmap <leader>pid :call GetDates()<cr>
nmap <leader>pig :call call ctrlp#init(ctrlp#insert_from_systemlist#run_with_command('gdate -R ; gdate -I ; date '))<cr>
```
