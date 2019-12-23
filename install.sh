#!/bin/bash
LOG=./log.txt
echo "START: " `date` > $LOG
./microstack.sh 2>&1 | tee -a $LOG
echo "STOP: " `date` >> $LOG
