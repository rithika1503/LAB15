set output "4b.pdf"
set terminal pdf
set title "Correlation Between Age and Blood Pressure"
set xlabel "Age"
set ylabel "Blood Pressure "
plot "LAB15.dat" using 1:4 with points title "Age vs BP"
