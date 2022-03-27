#!/bin/bash

awk -v OFS="\n" '{$1=$1}1' $@
