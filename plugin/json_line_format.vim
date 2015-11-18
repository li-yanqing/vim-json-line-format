python << EOF
import vim
import json
import base64
from collections import OrderedDict

def json_line_format_print():
    line_num = vim.current.window.cursor[0]
    try:
        formatted = json.dumps(
                        json.loads(vim.current.line, object_pairs_hook=OrderedDict),
                        ensure_ascii=False, indent=4)
        print formatted
    except Exception as e:
        print e


def json_line_format_write():
    line_num = vim.current.window.cursor[0]
    buff = vim.current.buffer
    try:
        formatted = json.dumps(
                        json.loads(vim.current.line, object_pairs_hook=OrderedDict),
                        ensure_ascii=False, indent=4)
        for i, line in enumerate(formatted.split('\n')):
            buff.append(line, line_num+i)
        vim.command('normal dd')
    except Exception as e:
        print e

def base64_encode_append():
    line_num = vim.current.window.cursor[0]
    buff = vim.current.buffer
    try:
        formatted = base64.b64encode(vim.current.line)
        for i, line in enumerate(formatted.split('\n')):
            buff.append(line, line_num+i+1)
    except Exception as e:
        print e

def base64_decode_append():
    line_num = vim.current.window.cursor[0]
    buff = vim.current.buffer
    try:
        formatted = base64.b64decode(vim.current.line)
        for i, line in enumerate(formatted.split('\n')):
            buff.append(line, line_num+i+1)
    except Exception as e:
        print e
EOF

"nnoremap <leader>jw :python json_line_format_write()<CR>
"nnoremap <leader>jp :python json_line_format_print()<CR>
"nnoremap <leader>jb :python base64_encode_append()<CR>
"nnoremap <leader>jd :python base64_decode_append()<CR>

