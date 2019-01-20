#!/bin/sh
# Created by: WestleyR
# Email: westleyr@nym.hush.com
# version-1.0.1
# Date: Jan 20, 2018
# https://github.com/WestleyR/day-timer
#
# The Clear BSD License
#
# Copyright (c) 2019 WestleyR
# All rights reserved.
#
# This software is licensed under a Clear BSD License.
#

TIME_FILE=".day-timer-hour-per-day.txt"

HUR=0
MIN=0
SEC=0

new_day() {

    echo "----------${DAY_TITLE}----------

Totall time:  ${HUR} Hours, ${MIN} Minutes, ${SEC} Seconds.

" >> "$TIME_FILE"


}

DAY_TITLE=` date "+%B %d, %Y, %I:%M:%S %p" `
DAY_STARTED=` date +%d `
TIME_START=` echo "$(date +%s) / 100" | bc `

while true; do
    SEC=$((SEC+30))
    if [ $SEC -ge 60 ]; then
        MIN=$((MIN+1))
        SEC=0
    fi
    if [ $MIN -ge 60 ]; then
        HUR=$((HUR+1))
        MIN=0
    fi
#    ecgo --info "$HUR hours, $MIN minutes, $SEC seconds."

    if [ $(date +%d) -ne $DAY_STARTED ]; then
        new_day
        MIN=0
        HUR=0
        SEC=0
        DAY_STARTED=` date +%d `
        DAY_TITLE=` date "+%B %d, %Y, %I:%M:%S %p" `
#        ecgo -d "timer reset!"
    fi
    sleep 30s

done


#
# End
#
