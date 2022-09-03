#!/bin/env bash

if [ $(pidof redshift) ]
then
    redshift -x
    killall -q redshift
else
    # dunstify "4500K"
    redshift
fi
