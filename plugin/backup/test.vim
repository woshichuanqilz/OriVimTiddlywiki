" ============== Open Tid Under Cursor ================="
function! Test()
py << EOF
import vim
import re
import os
vim.command('echo "hi"')
EOF

endfunction
