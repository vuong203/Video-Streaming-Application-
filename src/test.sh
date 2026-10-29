#!/bin/sh
# Start the RTSP server in background, then launch the client on localhost.
cd "$(dirname "$0")"
python3 Server.py 1025 &
SERVER_PID=$!
trap 'kill $SERVER_PID 2>/dev/null' EXIT
sleep 1
python3 ClientLauncher.py 127.0.0.1 1025 5008 movie.mjpeg
