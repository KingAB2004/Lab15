set term pdf
set output 'age_bp_relation.pdf'
set title 'Age and Blood Pressure Relationship'
set xlabel 'Age (years)'
set ylabel 'Blood Pressure (mm Hg)'
set style data points
set datafile separator ','

plot 'heart.csv' using 1:4 title 'Age vs. Blood Pressure Points' with points pointtype 9 pointsize 0.5 linecolor rgb 'red'

