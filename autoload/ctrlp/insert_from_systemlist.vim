" =============================================================================
" File:          autoload/ctrlp/insert_from_systemlist.vim
" Description:   CtrlP extension that inserts a line from systemlist()
" =============================================================================

" To load this extension into ctrlp, add this to your vimrc:
"
"     let g:ctrlp_extensions = ['insert_from_systemlist']
"
if ( exists('g:loaded_ctrlp_insert_from_systemlist') && g:loaded_ctrlp_insert_from_systemlist )
	\ || v:version < 700 || &cp
	finish
endif
let g:loaded_ctrlp_insert_from_systemlist = 1

call add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#insert_from_systemlist#init()',
	\ 'accept': 'ctrlp#insert_from_systemlist#accept',
	\ 'lname': 'Insert Command Result',
	\ 'sname': 'inssyslist',
	\ 'type': 'line',
	\ 'enter': 'ctrlp#insert_from_systemlist#enter()',
	\ 'exit': 'ctrlp#insert_from_systemlist#exit()',
	\ 'opts': 'ctrlp#insert_from_systemlist#opts()',
	\ 'sort': 0,
	\ 'specinput': 0,
	\ })

let s:ctrlp_insert_from_systemlist_command = 'ls -1'
function! ctrlp#insert_from_systemlist#command()
  return s:ctrlp_insert_from_systemlist_command
endfun
function! ctrlp#insert_from_systemlist#set_command(val)
  let s:ctrlp_insert_from_systemlist_command = a:val
endfun

" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#insert_from_systemlist#init()
	let input = systemlist(ctrlp#insert_from_systemlist#command())
	return input
endfunction

" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#insert_from_systemlist#accept(mode, str)
	" For this example, just exit ctrlp and run help
	call ctrlp#exit()
  exec "normal i" . a:str
	"help ctrlp-extensions
endfunction

" (optional) Do something before enterting ctrlp
function! ctrlp#insert_from_systemlist#enter()
  echomsg 'CtrlP Insert: ' . s:ctrlp_insert_from_systemlist_command
endfunction

" (optional) Do something after exiting ctrlp
function! ctrlp#insert_from_systemlist#exit()
endfunction

" (optional) Set or check for user options specific to this extension
function! ctrlp#insert_from_systemlist#opts()
endfunction

" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#insert_from_systemlist#id()
	return s:id
endfunction

function! ctrlp#insert_from_systemlist#run_with_command(cmd)
  call ctrlp#insert_from_systemlist#set_command(a:cmd)
	return ctrlp#insert_from_systemlist#id()
endfunction
" Create a command to directly call the new search type
"
" Put this in vimrc or plugin/insert_from_systemlist.vim
" command! CtrlPinsert_from_systemlist call ctrlp#init(ctrlp#insert_from_systemlist#id())


" vim:nofen:fdl=0:ts=2:sw=2:sts=2
