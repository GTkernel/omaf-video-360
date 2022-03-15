#!/bin/bash

logfile=$1

awk '{ print $7 }' $logfile | sed 's/^\"//g' | sed 's/\"$//g' > ${logfile}_out

tr "\n" "\0" < ${logfile}_out > ${logfile}_out2

mv ${logfile}_out2 ${logfile}_out
