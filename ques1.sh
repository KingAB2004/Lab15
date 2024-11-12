#!/bin/bash

CSV_FILE="$1"
LATEX_FILE="output_table.tex"

# Initialize the LaTeX file
echo "\\documentclass{article}" > "$LATEX_FILE"
echo "\\usepackage{csvsimple}" >> "$LATEX_FILE"
echo "\\usepackage{graphicx}" >> "$LATEX_FILE"
echo "\\title{SHELL SCRIPT TABLE}" >> "$LATEX_FILE"
echo "\\author{Ashish Ranjan}" >> "$LATEX_FILE"
echo "\\begin{document}" >> "$LATEX_FILE"
echo "\\maketitle" >> "$LATEX_FILE"

# Initialize counter for table number and row number
table_counter=1
row_counter=0

# Start the first table
echo "\\begin{table}[h!]" >> "$LATEX_FILE"
echo "\\centering" >> "$LATEX_FILE"
echo "\\resizebox{\\textwidth}{!}{" >> "$LATEX_FILE"
echo "\\begin{tabular}{|c|c|c|c|c|c|c|c|c|c|c|c|c|c|}" >> "$LATEX_FILE"
echo "\\hline" >> "$LATEX_FILE"


# Loop through CSV and process rows
while IFS=, read -r col1 col2 col3 col4 col5 col6 col7 col8 col9 col10 col11 col12 col13 col14; do
    # Write the row to the LaTeX file
    echo "$col1 & $col2 & $col3 & $col4 & $col5 & $col6 & $col7 & $col8 & $col9 & $col10 & $col11 & $col12 & $col13 & $col14 \\\\" >> "$LATEX_FILE"
    echo "\\hline" >> "$LATEX_FILE"
   
    # Increment the row counter
    ((row_counter++))

    # After every 40 rows, close the current table and start a new one
    if ((row_counter >= 40)); then
        # Close the current table
        echo "\\end{tabular}" >> "$LATEX_FILE"
        echo "}" >> "$LATEX_FILE"
        echo "\\caption{Sample Data (Part $table_counter)}" >> "$LATEX_FILE"
        echo "\\end{table}" >> "$LATEX_FILE"
       
        # Reset the row counter and increment table counter
        row_counter=0
        ((table_counter++))

        # Start a new table
        echo "\\begin{table}[h!]" >> "$LATEX_FILE"
        echo "\\centering" >> "$LATEX_FILE"
        echo "\\resizebox{\\textwidth}{!}{" >> "$LATEX_FILE"
        echo "\\begin{tabular}{|c|c|c|c|c|c|c|c|c|c|c|c|c|c|}" >> "$LATEX_FILE"
        echo "\\hline" >> "$LATEX_FILE"
        echo "age & sex & cp & trestbps & chol & fbs & restecg & thalach & exang & oldpeak & slope & ca & thal & target \\\\" >> "$LATEX_FILE"
        echo "\\hline" >> "$LATEX_FILE"
    fi
done < "$CSV_FILE"

# Close the last table after the loop ends
echo "\\end{tabular}" >> "$LATEX_FILE"
echo "}" >> "$LATEX_FILE"
echo "\\caption{Sample Data (Part $table_counter)}" >> "$LATEX_FILE"
echo "\\end{table}" >> "$LATEX_FILE"

# End the LaTeX document
echo "\\end{document}" >> "$LATEX_FILE"

# Notify user
echo "LaTeX file generated: $LATEX_FILE"

