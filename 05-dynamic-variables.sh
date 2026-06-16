#!/bin/bash

START_TIME=$(date +%S)
echo "Start TIme is - $START_TIME"
sleep 10
END_TIME=$(date +%S)
echo "End TIme is - $END_TIME"

EXECUTION_TIME=$(($END_TIME - $START_TIME))

echo "Total process execution time is - $EXECUTION_TIME"