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

# embeddedstack
python
import sys
sys.path.insert(0, '/home/gergap/work/embeddedstack-master/gdb/prettyprinter')
from opcua import register_uaprinters
register_uaprinters()
end
