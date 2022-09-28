" ============== Open Tid Under Cursor ================="
function! OpenTid()
py << EOF
import vim
import re

col_index = int(vim.eval("col('.')"))
# Get current line 
current_line = vim.current.line
left = col_index - 1
right = col_index - 1
is_found_mark = False
# <<ML 射击类>>

m = re.search(r"\<\<ML (.*)\>\>", current_line)
if m is not None:
    fn = m.group(1)
    file_name = '/home/lizhe/OriNote/OriWiki/tiddlers/' + fn + '.tid'
    print(file_name)
    vim.command('edit ' + file_name)
else:
    print('not found')
# exec normal
EOF
endfunction

" ============== Open Tid Under Cursor ================="
function! Fzf()
py << EOF
import vim
import re
import os

vim.command("Files")

EOF
endfunction


command! -nargs=0 OpenTid call OpenTid()


" ================= Example Code =================
"
" for line in vim.current.buffer:
"     print(line)
" vim.command("normal! yyppp") 
" print(vim.current.buffer.name)
" function! Test()
" py << EOF
" vim.command("normal! jjj")
" EOF
" endfunction

