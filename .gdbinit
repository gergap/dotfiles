set auto-load safe-path /
source ~/.gdb_dashboard
source ~/.dashboard.gdb

dashboard registers
dashboard source
dashboard assembly
dashboard -style max_value_length 1000
dashboard variables -style compact False
dashboard variables -style arguments True
dashboard variables -style locals True
dashboard variables -style align True
dashboard variables -style sort True
dashboard expressions -style align True
alias ew=dashboard expressions watch
alias eu=dashboard expressions unwatch

# Qt5 pretty printer
python
import sys, os.path
sys.path.insert(0, os.path.expanduser('~/.gdb'))
import qt5printers
qt5printers.register_printers(gdb.current_objfile())
end

# embeddedstack
python
import sys
sys.path.insert(0, '/home/gergap/work/embeddedstack/gdb/prettyprinter')
from opcua import register_uaprinters
register_uaprinters()
end

# sources are references like ../crypto/..., so we need to add one more folder to the search path
dir ~/work/sources/openssl-1.1.1h/include

define xxd
dump binary memory dump.bin $arg0 $arg0+$arg1
shell hexdump -C dump.bin
end

