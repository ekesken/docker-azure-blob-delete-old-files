import sys
import os
from datetime import datetime, timedelta
mtime_threshold = float(os.environ.get('MTIME_THRESHOLD', 30.0))
mtime_threshold = timedelta(mtime_threshold)
now = datetime.utcnow()
since = now - mtime_threshold
for line in sys.stdin.readlines():
    file_name, last_modified = line.strip().split('\t')
    last_modified = datetime.strptime(last_modified, '%a, %d %b %Y %H:%M:%S %Z')
    if last_modified < since:
        print file_name, last_modified
