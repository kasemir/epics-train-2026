#!/bin/sh

while true
do
    echo "Going to 3 ..."
    caput -c -w 20 DemoDevice 3
    echo "Going to 5 ..."
    caput -c -w 20 DemoDevice 5
done
