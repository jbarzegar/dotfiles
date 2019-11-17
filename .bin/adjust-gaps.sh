#!/bin/bash

tiling_mode=$(chunkc tiling::query --desktop mode)

if [[ $tiling_mode == "float" ]]
then
    exit
fi


chunkc tiling::desktop --layout $tiling_mode --padding $1

chunkc tiling::desktop --gap $1
