#!/usr/bin/gnuplot
set terminal pngcairo size 640,480 enhanced font 'Arial, 11'
set output 'bcast-ci-filled.png'
#set terminal postscript eps enhanced color

set border linewidth 1.2
set key top left
set nogrid
set mytics 0
set style line 1 linecolor rgb 'red' linetype 1 linewidth 2
set style line 2 linecolor rgb 'blue' linetype 1 linewidth 1
set style line 3 linecolor rgb 'blue' linetype 1 linewidth 1
set ylabel 'Time (us)'
set xlabel 'Message size (bytes)'
set format y "%.1f"
set format x "%.0f"

set logscale x
set multiplot
set origin 0,0
set size 1,1
set xrange [4096:1024*1024]
set xtics 4
set mxtics 2
plot "bcast.dat" using 1:11:12 notitle with filledcurve ls 2,\
     "bcast.dat" using 1:5 title "Measured time" with lines ls 1, \
     "bcast.dat" using 1:11 title "Confidence interval" with lines ls 2, \
     "bcast.dat" using 1:12 notitle "CI UB" with lines ls 3

set origin 0.16,0.4
set size 0.5,0.4
set noxlabel 
set noylabel 
set nokey 
set nogrid
set xrange [1:4096]
replot
set nomultiplot

     

