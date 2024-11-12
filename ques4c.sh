awk -F',' 'NR==1 || $14==0 {print $1","$5","$14}' heart.csv > no_heart_chol_data.csv

cat <<SCRIPT > no_heart_chol_plot.p
set term pdf
set output 'no_heart_chol_chart.pdf'
set title 'Age vs. Cholesterol for Non-Heart Disease Individuals'
set xlabel 'Age (years)'
set ylabel 'Cholesterol Level (mg/dL)'
set datafile separator ','
set key below

plot 'no_heart_chol_data.csv' using 1:2 with linespoints title 'Age to Cholesterol' 
SCRIPT

echo 'Generated data file no_heart_chol_data.csv and plot script no_heart_chol_plot.p'
gnuplot no_heart_chol_plot.p
echo 'Generated chart saved as no_heart_chol_chart.png'

