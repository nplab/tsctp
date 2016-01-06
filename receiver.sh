#!/bin/sh
LOCAL_ADDR="fd68:9c38:be7e::13"
BUFFER="262144"
APPENDIX=""

mkdir -p results

if [ $# -eq 0 ]; then
    ./tsctp -L $LOCAL_ADDR -R $BUFFER -S $BUFFER
else
    ./tsctp -L $LOCAL_ADDR -R $BUFFER -S $BUFFER >> ./results/$(date +"%Y-%m-%d-%H-%M-%S").log
fi
