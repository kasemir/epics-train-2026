#!/bin/bash

echo "Running all setup steps"
for step in [0-9]*
do
    echo "========================== $stepn =========================="
    sh $step
done
