#!/bin/sh
echo 0 | sudo tee /sys/class/leds/platform::micmute/brightness
