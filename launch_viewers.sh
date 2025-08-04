#!/bin/bash

# File to store the launched process IDs
PID_FILE="webviewer_pids.txt"

# Clear any existing PIDs
> "$PID_FILE"

echo "Launching web viewers..."

launch_viewer() {
    CMD=$1
    echo "Running: $CMD"
    $CMD &                   # Run in background
    PID=$!
    echo "$PID" >> "$PID_FILE"
    echo "  → PID: $PID"
}

# Launch all viewers
launch_viewer "python3 -m src.webviewer data/json_files/nxp_boot.json --port 8080"
launch_viewer "python3 -m src.webviewer data/json_files/nxp_dmesg.json --port 8081"

launch_viewer "python3 -m src.webviewer data/json_files/ti_boot.json --port 8082"
launch_viewer "python3 -m src.webviewer data/json_files/ti_dmesg.json --port 8083"

launch_viewer "python3 -m src.webviewer data/json_files/coral_boot.json --port 8084"
launch_viewer "python3 -m src.webviewer data/json_files/coral_dmesg.json --port 8085"

echo "All web viewers launched in background."
echo "Use './launch_viewers.sh stop' to kill them."

# Stop option
if [[ $1 == "stop" ]]; then
    if [[ -f "$PID_FILE" ]]; then
        echo "Stopping all webviewer processes..."
        while read -r PID; do
            if kill -0 "$PID" 2>/dev/null; then
                kill "$PID"
                echo "  → Killed PID $PID"
            fi
        done < "$PID_FILE"
        rm -f "$PID_FILE"
        echo "All processes stopped."
    else
        echo "No PID file found. Nothing to stop."
    fi
    exit 0
fi
