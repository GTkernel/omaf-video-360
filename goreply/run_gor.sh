#!/bin/bash

fname=$1
fnum=$2

for ((i=0; i<=${fnum}; i++))
do
    cat ${fname}_${i}.gor >> omaf_combined.gor
    #gor --input-file ${fname}_${i}.gor --output-http="http://143.215.128.191:9500"
done
