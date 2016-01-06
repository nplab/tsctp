#!/bin/sh
echo "TSCTP BATCHRUN"

LOCAL_ADDR="fd68:9c38:be7e::13"
REMOTE_ADDR="fd68:9c38:be7e::14"
DURATION="60"
BUFFER="262144"
APPENDIX=""
LOOPS="1"

MSGLENGTH=0
LOOP=1

while [ $LOOP -le $LOOPS]; do
    while [ $MSGLENGTH -lt 1600 ]; do
        if [ $MSGLENGTH -lt 32 ]; then
            MSGLENGTH=$((MSGLENGTH + 1))
        elif [ $MSGLENGTH -lt 128 ]; then
            MSGLENGTH=$((MSGLENGTH + 4))
        else
            MSGLENGTH=$((MSGLENGTH + 16))
        fi

        echo "LENGTH: $MSGLENGTH"
        ./tsctp -T $DURATION -L $LOCAL_ADDR -l $MSGLENGTH -R $BUFFER -S $BUFFER $APPENDIX $REMOTE_ADDR
        sleep 5
    done
    $LOOP=$((LOOP + 1))
done
