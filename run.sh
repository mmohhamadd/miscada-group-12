#!/bin/bash

echo "Do you want to enter parameters manually? (yes/no)"
read response

if [ "$response" = "yes" ]; then
    while true; do
        echo "Enter <Du>: "
        read Du
        if [[ $Du =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then break; else echo "Du must be a float. Please try again."; fi
    done

    while true; do
        echo "Enter <Dv>: "
        read Dv
        if [[ $Dv =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then break; else echo "Dv must be a float. Please try again."; fi
    done

    while true; do
        echo "Enter <F>: "
        read F
        if [[ $F =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then break; else echo "F must be a float. Please try again."; fi
    done

    while true; do
        echo "Enter <K>: "
        read K
        if [[ $K =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then break; else echo "K must be a float. Please try again."; fi
    done

    while true; do
        echo "Enter <Threshold>: "
        read Threshold
        if [[ $Threshold =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then break; else echo "Threshold must be a float. Please try again."; fi
    done
else
    Du=$(awk -v min=0 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
    Dv=$(awk -v min=0 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
    F=$(awk -v min=0.01 -v max=0.1 'BEGIN{srand(); print min+rand()*(max-min)}')
    K=$(awk -v min=0.03 -v max=0.07 'BEGIN{srand(); print min+rand()*(max-min)}')
    Threshold=$(awk -v min=0 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
fi

# Run the C++ executable and redirect its output to a file
./build/src/gs_main $Du $Dv $F $K $Threshold

# Run the Python script and redirect its output to a file
python3 -u simulation.py