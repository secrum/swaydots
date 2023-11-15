#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers/type-2"
theme='style'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
