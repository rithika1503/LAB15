set terminal pdf
set output "d.pdf"
set title "Total Sales Distribution by Product for the Year"

unset key
unset border
unset tics
set size square
set xrange [-1.2:1.2]
set yrange [-1.2:1.2]

color_40_50 = "#CC0000"     
color_50_60 = "#0033CC"      
color_60_70 = "#009900"    
color_70_80 = "#CCCC00"   
color_80_90 = "#6600CC"       
color_90_100 = "#CC6600"   

total_40_50 = 50.0
total_50_60 = 33.3
total_60_70 = 66.7
total_70_80 = 50.0
total_80_90 = 0.0
total_90_100 = 0.0

total_sales = total_40_50 + total_50_60 + total_60_70 + total_70_80 + total_80_90 + total_90_100

angle_40_50 = 360 * total_40_50 / total_sales
angle_50_60 = 360 * total_50_60 / total_sales
angle_60_70 = 360 * total_60_70 / total_sales
angle_70_80 = 360 * total_70_80 / total_sales
angle_80_90 = 360 * total_80_90 / total_sales
angle_90_100 = 360 * total_90_100 / total_sales

set object 1 circle at 0,0 size 1 fillcolor rgb color_40_50 fillstyle solid 1 arc [0:angle_40_50]
set object 2 circle at 0,0 size 1 fillcolor rgb color_50_60 fillstyle solid 1 arc [angle_40_50:(angle_40_50 + angle_50_60)]
set object 3 circle at 0,0 size 1 fillcolor rgb color_60_70 fillstyle solid 1 arc [(angle_40_50 + angle_50_60):(angle_40_50 + angle_50_60 + angle_60_70)]
set object 4 circle at 0,0 size 1 fillcolor rgb color_70_80 fillstyle solid 1 arc [(angle_40_50 + angle_50_60 + angle_60_70):(angle_40_50 + angle_50_60 + angle_60_70 + angle_70_80)]
set object 5 circle at 0,0 size 1 fillcolor rgb color_80_90 fillstyle solid 1 arc [(angle_40_50 + angle_50_60 + angle_60_70 + angle_70_80):(angle_40_50 + angle_50_60 + angle_60_70 + angle_70_80 + angle_80_90)]
set object 6 circle at 0,0 size 1 fillcolor rgb color_90_100 fillstyle solid 1 arc [(angle_40_50 + angle_50_60 + angle_60_70 + angle_70_80 + angle_80_90):360]

set label 1 sprintf("40-50\n%.1f%%", total_40_50) at -0.9,0.9 tc rgb color_40_50 font ",10"
set label 2 sprintf("50-60\n%.1f%%", total_50_60) at 0.9,0.9 tc rgb color_50_60 font ",10"
set label 3 sprintf("60-70\n%.1f%%", total_60_70) at -1.0,0 tc rgb color_60_70 font ",10"
set label 4 sprintf("70-80\n%.1f%%", total_70_80) at 1.0,0 tc rgb color_70_80 font ",10"
set label 5 sprintf("80-90\n%.1f%%", total_80_90) at -0.9,-0.9 tc rgb color_80_90 font ",10"
set label 6 sprintf("90-100\n%.1f%%", total_90_100) at 0.9,-0.9 tc rgb color_90_100 font ",10"

plot NaN notitle

