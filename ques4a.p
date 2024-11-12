set terminal pdf
set output 'gender_vs_disease.pdf'

set title "Gender vs Number of People with Heart Disease"
set style data histogram  
set style fill solid
set xlabel "Gender"
set ylabel "Count"


# Plot the histogram with offsets for non-diseased and diseased counts
plot 'gender_vs_disease.dat' using 2:xtic(1) ti "0" lc "blue" , '' using 3:xtic(1) ti "1" lc "red"

