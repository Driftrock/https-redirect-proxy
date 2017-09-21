#!/bin/sh

trap "echo SIGTERM trapped. Signalling nginx with QUIT.; kill -s QUIT \$(cat /var/run/nginx.pid)" 15

# Start the command in background - this causes shell to receive signals (otherwise it ignores signals)
"$@" &

CHILD_PID=$!
echo "Process started with PID $CHILD_PID"

# Wait for the child in loop - apparently QUIT signal from trap causes "wait" to release
# even if the process is still running.
# But quit eventually if the process is actually dead
while kill -s 0 $CHILD_PID; do wait $CHILD_PID; done

echo "Process $CHILD_PID stopped. Stopping too."
