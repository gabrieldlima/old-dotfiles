#!/usr/bin/env bash

### Audio notifications ###
#   ponymix increase 5 | notify audio
#   ponymix decrease 5 | notify audio
#   pulsemixer --toggle-mute --get-mute | notify muted

notifyMuted() {
    volume="$1"
    dunstify -h string:x-canonical-private-synchronous:audio "Muted" -h int:value:"$volume" -t 1500 --icon audio-volume-muted
}

notifyAudio() {
    volume="$1"
    ponymix is-muted && notifyMuted "$volume" && return

    if [ $volume -eq 0 ]; then
        notifyMuted "$volume"
    elif [ $volume -le 30 ]; then
        dunstify -h string:x-canonical-private-synchronous:audio "Volume: " -h int:value:"$volume" -t 1500 --icon audio-volume-low
    elif [ $volume -le 70 ]; then
        dunstify -h string:x-canonical-private-synchronous:audio "Volume: " -h int:value:"$volume" -t 1500 --icon audio-volume-medium
    else
        dunstify -h string:x-canonical-private-synchronous:audio "Volume: " -h int:value:"$volume" -t 1500 --icon audio-volume-high
    fi
}

input=`cat /dev/stdin`

case "$1" in
    muted)
        volume=`ponymix get-volume`
        if [ "$input" -eq 0 ]
        then
                notifyAudio "$volume"
        else
                notifyMuted "$volume"
        fi
        ;;
    audio)
        notifyAudio "$input"
        ;;
    *)
        echo "Not the right arguments"
        echo "$1"
        exit 2
esac