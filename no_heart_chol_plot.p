set term pdf
set output 'no_heart_chol_chart.pdf'
set title 'Age vs. Cholesterol for Non-Heart Disease Individuals'
set xlabel 'Age (years)'
set ylabel 'Cholesterol Level (mg/dL)'
set datafile separator ','
set key below

plot 'no_heart_chol_data.csv' using 1:2 with linespoints title 'Age to Cholesterol' 
