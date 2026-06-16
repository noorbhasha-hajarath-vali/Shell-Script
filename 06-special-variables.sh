#!/bin/bash

echo "all arguments - $@"
echo "all arguments - $*"

echo "Executed Script/File Name - $0"

echo "Current directory - $PWD"

echo "Current user - $USER"

echo "Home directory of current user - $HOME"

echo "Current process-id/PID - $$"

sleep 50 &

echo "PID of the last command run in the background - $!"