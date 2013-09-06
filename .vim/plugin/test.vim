

function! Test(arg1)
python << end

from vim import *

print 'cursor', current.window.cursor
print current.buffer
arg = eval('a:arg1')

#current.buffer.append('hello %s' % arg)
import vim
current.buffer.append(dir(vim))
current.window.cursor = len(current.buffer), 0

import os
# shell out to use normal version of python rather than
# this old one tied to vim!
#print os.system('python /home/rlowe/test2.7.py')

command('return 1')
end
endfunction
