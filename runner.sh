#!/bin/sh
TIMEOUT=$1
shift
( $* ) & pid=$!
( sleep $TIMEOUT && kill -HUP $pid ) 2>/dev/null & watcher=$!
wait $pid 2>/dev/null && pkill -HUP -P $watcher

