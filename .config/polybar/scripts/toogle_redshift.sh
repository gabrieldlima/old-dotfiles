#!/bin/env bash

if [ $(pidof redshift) ]
then
    redshift -x
    killall -q redshift
else
    dunstify "Night Light: 4500K"
    redshift
fi
