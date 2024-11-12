set output "4c.pdf"
set terminal pdf

# Set labels for the plot
set xlabel "Age"
set ylabel "Cholesterol"
set title "Age vs Cholesterol (No Heart Disease)"

# Filter and plot data where HeartDisease == 0
plot 'data.txt' using 1:5 every ::1 with linespoints title "No Heart Disease"

