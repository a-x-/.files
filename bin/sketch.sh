#!/bin/bash

sudo date 0102030405
sleep 1

#open /Applications/Sketch.app
open /Users/mxtnr/Desktop/Sketch.app

sleep 5

# sudo ntpdate -u time.apple.com
sudo sntp -sS time.apple.com
