#!/usr/bin/env python3
import fileinput
for line in fileinput.input():
  for word in line.split():
     print(word)
