awk -F',' '
$14==1 {
    if ($1 >= 40 && $1 < 50) ageBracket["40-50"]++
    else if ($1 >= 50 && $1 < 60) ageBracket["50-60"]++
    else if ($1 >= 60 && $1 < 70) ageBracket["60-70"]++
    else if ($1 >= 70 && $1 < 80) ageBracket["70-80"]++
    else if ($1 >= 80 && $1 < 90) ageBracket["80-90"]++
    else if ($1 >= 90 && $1 < 100) ageBracket["90-100"]++
}
END {
    for (group in ageBracket) print group "," ageBracket[group]
}' heart.csv > age_distribution.csv

total_population=$(awk -F',' '{total += $2} END {print total}' age_distribution.csv)

start_angle=0
palette=("coral" "lightblue" "gold" "darkgreen" "royalblue" "violet")

cat <<PLOT > age_distribution_plot.p
set terminal pdf
set output 'age_distribution_pie.pdf'
set title 'Heart Disease Age Group Distribution'
set key outside top box
set style fill solid 1.0 border -1

set angles degrees
set xrange [-1:1]
set yrange [-1:1]
set size square
PLOT

counter=0
while IFS=, read -r age_range count; do
    angle_percent=$(awk "BEGIN {print ($count / $total_population) * 100}")
    end_angle=$(awk "BEGIN {print $start_angle + ($angle_percent * 3.6)}")
    
    echo "set obj $(($counter + 1)) circle at 0,0 size 1 front arc [$start_angle:$end_angle] fc rgb \"${palette[$counter]}\"" >> age_distribution_plot.p

    start_angle=$end_angle
    counter=$((counter+1))
done < age_distribution.csv

cat <<LEGEND >> age_distribution_plot.p
plot NaN title '40-50' with lines lc rgb "coral", \
     NaN title '50-60' with lines lc rgb "blue", \
     NaN title '60-70' with lines lc rgb "gold", \
     NaN title '70-80' with lines lc rgb "green", \
     NaN title '80-90' with lines lc rgb "black", \
     NaN title '90-100' with lines lc rgb "violet"
LEGEND

echo 'Data saved to age_distribution.csv and plot script age_distribution_plot.p created'
gnuplot age_distribution_plot.p
echo 'Pie chart saved as age_distribution_pie.png'

