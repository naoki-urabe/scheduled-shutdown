#!/bin/bash

SHUTDOWN_TIME=$1
USER_ID=$(id -u)

# DISPLAYは不要なことが多いのでコメントアウト
# export DISPLAY=:0

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$USER_ID/bus"

CURRENT_TIME=$(date +%s)
NOTIFY_TIME=$(date -d "$SHUTDOWN_TIME today - 5 minutes" +%s)
SLEEP_SECONDS=$((NOTIFY_TIME - CURRENT_TIME))

if [ $SLEEP_SECONDS -gt 0 ]; then
  sleep $SLEEP_SECONDS
fi

zenity --warning --text "⚠️ シャットダウン予定\n5分後にシャットダウンします。キャンセルは shutdown -c"

shutdown -h $SHUTDOWN_TIME
