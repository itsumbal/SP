import psutil
from datetime import datetime
import os
import sys

if len(sys.argv) > 1:
    id1 = int(sys.argv[1])
    p = psutil.Process(id1)
else:
	print("No PID passed as argument")
	sys.exit(0)

parent = psutil.Process(p.ppid())
with parent.oneshot():
    ppid = parent.name()

pct = p.create_time()
pct = datetime.fromtimestamp(pct).strftime("%A, %B %d, %Y %I:%M:%S")

print "Process ID:  " , id1
print "Process Name:  " ,p.name()
print "Process Status:  ",p.status()
print "Process Parent ID:  ",p.ppid()  
print "Process Parent Name:  ",ppid 
print "Process Creation Time:  ",pct 
print "Files Opened By the Process Info:  ",p.open_files()
print "Memory Info:  ",p.memory_info().rss
