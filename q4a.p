set output "4a.pdf"
set terminal pdf


set title "Histogram of Gender vs Number of People with Heart Disease"
set xlabel "Gender (1 = Male, 0 = Female)"
set ylabel "Number of People with Heart Disease"
set style data histogram
set style fill solid border -1
set boxwidth 0.8
set key out top box

plot "< awk -F' ' '$8 == 1 {print $2}' LAB15.dat | sort | uniq -c | awk '{print $2, $1}'" using 2:xtic(1) with boxes lc rgb "blue" title "People with Heart Disease"
 

