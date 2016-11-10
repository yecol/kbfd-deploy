#!/bin/bash
file=$1
des=$2
for ((i=1;i<10;i++)); do
	scp -r ${file} aws0$i:${des}
done

for ((i=10;i<=21;i++)); do
	scp -r ${file} aws$i:${des}
done
