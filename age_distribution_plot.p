set terminal pdf
set output 'age_distribution_pie.pdf'
set title 'Heart Disease Age Group Distribution'
set key outside top box
set style fill solid 1.0 border -1

set angles degrees
set xrange [-1:1]
set yrange [-1:1]
set size square
set obj 1 circle at 0,0 size 1 front arc [0:14.1177] 
set obj 2 circle at 0,0 size 1 front arc [14.1177:131.765] fc rgb "blue"
set obj 3 circle at 0,0 size 1 front arc [131.765:284.706] fc rgb "gold"
set obj 4 circle at 0,0 size 1 front arc [284.706:360] fc rgb "green"
plot NaN title '40-50' with lines lc rgb "coral",      NaN title '50-60' with lines lc rgb "blue",      NaN title '60-70' with lines lc rgb "gold",      NaN title '70-80' with lines lc rgb "green",      NaN title '80-90' with lines lc rgb "black",      NaN title '90-100' with lines lc rgb "violet"
