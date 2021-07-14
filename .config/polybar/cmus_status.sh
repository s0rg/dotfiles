#!/bin/bash

iconcolor=#5DA111

output=$(cmus-remote -C status)
cmusstatus=$(echo "$output"| grep "^status" | cut -c 8-)
duration=$(echo "$output" | grep -v "set " | grep -v "tag " | grep "duration " | cut -d ' ' -f 2)

case $cmusstatus in
    "playing")
        icon="%{F$iconcolor}契%{F-}"
        ;;
    "paused")
        icon="%{F$iconcolor}%{F-}"
        ;;
    "stopped")
        echo
        exit 0
esac

artist=$(echo "$output" | grep "^tag artist" | cut -c 12-)
path=$(echo "$output" | grep "^file" | cut -c 12-)
pos_info="--"

if [ "$duration" -ge 0 ]; then
    pos=$(echo "$output" | grep -v "set " | grep -v "tag " | grep "position " | cut -d ' ' -f 2)

	pm=$(printf "%02d" $((pos / 60)))
	ps=$(printf "%02d" $((pos % 60)))

	dm=$(printf "%02d" $((duration / 60)))
	ds=$(printf "%02d" $((duration % 60)))

	pos_info="$pm:$ps / $dm:$ds"
fi

if [[ $artist = *[!\ ]* ]]; then
    song=$(echo "$output" | grep "^tag title" | cut -c 11-)
    echo -n "$icon $artist / $song $pos_info"
elif [[ $path = *[!\ ]* ]]; then
    IFS="/"
    read -ra parts <<< "$path"
    for i in "${parts[@]}"; do
        file=$i
    done
    echo -n "$icon $file $pos_info"
else
    echo
fi
