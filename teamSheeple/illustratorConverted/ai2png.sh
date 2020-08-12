#!/bin/sh
for i in $(ls *.ai) ; do convert ai:$i -resize '1000x' -density 300 $i.png; done;


