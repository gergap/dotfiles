# I prefer intel asm format over AT&T
#set disassembly-flavor intel

# Source GNU Dashboard
source ~/.gdbinit_dashboard
# Redirect dashboard output to correct terminal
source ~/.dashboard.gdb

# disable source view in dashboard
dashboard source
dashboard history
dashboard registers

# dashboard aliases
alias w=dashboard expressions watch
alias uw=dashboard expressions unwatch

# save breakpoints
define bsave
	shell rm -f brestore.txt
	set logging file brestore.txt
	set logging on
	info break
	set logging off
	# reformat on-the-fly to a valid gdb command file
	shell perl -ne "print \"break \$1 \n\" if /at\s(.*:\d+)/" brestore.txt > brestore.gdb
end
document bsave
  store actual breakpoints
end

define brestore
  source brestore.gdb
end
document brestore
  restore breakpoints saved by bsave
end

set breakpoint pending on
set auto-load safe-path /

# configure build-id symbols
#set debug-file-directory /mnt/symbols:/usr/lib64/debug

# configure ascolab source fetch script
#set source-lookup /home/gergap/projects/source-id/hooks/fetch_source_cgit.example

# load my pretty printer
#python execfile("~/.gdb/uastring.py")

# Add this directory to the GDB auto-load scripts-directory and
# safe-path settings in your ~/.gdbinit
#set auto-load scrits-directory $debugdir:$datadir/auto-load:/home/gergap/.gdb-autoload
#set auto-load safe-path $debugdir:$datadir/auto-load:/home/gergap/.gdb-autoload

#source ~/.gdb/opcuaprinters/uastring.py
python
import sys
#sys.path.insert(0, '/home/gergap/gdb-ua-prettyprinter')
#from opcua import register_uaprinters
#register_uaprinters()

# Embedded Stack
sys.path.insert(0, '/home/gergap/work/embeddedstack/gdb/prettyprinter')
#from opcua import register_uaprinters
#register_uaprinters()
from noderef import register_printers
register_printers()

# install Qt4 pretty printers
#sys.path.insert(0, '/usr/share/apps/kdevgdb/printers')
#from qt4 import register_qt4_printers
#register_qt4_printers (None)

end

# FM4 commands
#target remote :2331

#target remote localhost:2331
#monitor speed 30
#monitor endian big
#monitor reset

# embos debugging via JLink
#target remote localhost:2331
#monitor flash device = XMC4700-2048
#monitor flash download = 1
#monitor reset
#file /home/gergap/work/devel/embeddedstack/distXMC4700/bin/xmc4700_demo_server
#load /home/gergap/work/devel/embeddedstack/distXMC4700/bin/xmc4700_demo_server
## Initializing PC and stack pointer
##monitor reg r13 = (0x00000000)
##monitor reg pc = (0x00000004)
#monitor reset

