#!/bin/bash

# Ensure the source file path is correct
INPUT_FILE="heart.csv"

# Check if the input file exists
if [[ ! -f $INPUT_FILE ]]; then
    echo "File $INPUT_FILE not found!"
    exit 1
fi

# 1. Gender vs Number of People with Heart Disease (Histogram)
# This calculates the number of diseased (1) and non-diseased (0) for each gender
awk -F',' '
{
    # Column $2 is sex (1 = male, 0 = female), column $14 is target (heart disease)
    if ($2 == 1) {  # Male
        if ($14 == 1) {
            gender["male_1"]++
        } else if ($14 == 0) {
            gender["male_0"]++
        }
    } else if ($2 == 0) {  # Female
        if ($14 == 1) {
            gender["female_1"]++
        } else if ($14 == 0) {
            gender["female_0"]++
        }
    }
}
END {
    # Ensure all categories are initialized if missing
    if (!( "male_0" in gender )) gender["male_0"]=0
    if (!( "male_1" in gender )) gender["male_1"]=0
    if (!( "female_0" in gender )) gender["female_0"]=0
    if (!( "female_1" in gender )) gender["female_1"]=0
    
    # Print the results with column headers
	print "0", gender["female_0"], gender["female_1"]
    print "1", gender["male_0"], gender["male_1"]
    
}
' $INPUT_FILE > gender_vs_disease.dat

# Output results to the user
echo "Data preparation completed!"

