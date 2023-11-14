#!/bin/bash

# Run the C++ executable and redirect its output to a file
./build/src/gs_main

# Run the Python script and redirect its output to a file
python3 -u simulation.py