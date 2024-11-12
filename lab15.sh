#!/bin/bash


input_file="data.txt"
output_file="output.tex"


echo "\documentclass{article}" > "$output_file"
echo "\usepackage{longtable}" >> "$output_file"
echo "\begin{document}" >> "$output_file"
echo "\title{Data Table}" >> "$output_file"
echo "\maketitle" >> "$output_file"
echo "\section*{Data Table}" >> "$output_file"
echo "\begin{longtable}{|$(head -n1 $input_file | awk '{for (i=1; i<=NF; i++) printf "c|"}')}" >> "$output_file"
echo "\hline" >> "$output_file"

head -n1 "$input_file" | awk '{
    for (i=1; i<=NF; i++) {
        printf $i
        if (i < NF) printf " & "
    }
    print " \\\\ \\hline"
}' >> "$output_file"


tail -n +2 "$input_file" | while read -r line; do
    echo "$line" | awk '{
        for (i=1; i<=NF; i++) {
            printf $i
            if (i < NF) printf " & "
        }
        print " \\\\ \\hline"
    }' >> "$output_file"
done


echo "\end{longtable}" >> "$output_file"
echo "\end{document}" >> "$output_file"


echo "LaTeX file generated as $output_file. Compile it to create a PDF (e.g., pdflatex $output_file)."

