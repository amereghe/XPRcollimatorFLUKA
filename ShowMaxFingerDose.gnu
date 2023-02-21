reset

myTitle='Carbon on W'
myCase='C_W'

# =============================================================================
set terminal qt 0 enhanced title myTitle.' - Dose to fingers (all)'
# =============================================================================

set title myTitle.' - Dose to fingers (all)'
set xlabel '[cm]' 
set ylabel '[{/Symbol m}Sv/h]' 
set logscale y
set yrange [2E3*3600/1E6:2E9*3600/1E6]
set format y "10^{%L}"
set key left bottom
set grid
plot \
     'AMB74_'.myCase.'_max_fingerAll_T01.dat' ind 0 us 1:($3*3600/1E6) w steps lw 1 lc rgb 'dark-red' t 't_{cool}=0 s',\
     '' ind 0 us (($1+$2)/2.0):($3*3600/1E6):($3*3600/1E6*$4/100.) w errorbars lw 1 lc rgb 'dark-red' pt 0 ps 1 notitle,\
     'AMB74_'.myCase.'_max_fingerAll_T02.dat' ind 0 us 1:($3*3600/1E6) w steps lw 1 lc rgb 'red' t 't_{cool}=2 min',\
     '' ind 0 us (($1+$2)/2.0):($3*3600/1E6):($3*3600/1E6*$4/100.) w errorbars lw 1 lc rgb 'red' pt 0 ps 1 notitle,\
     'AMB74_'.myCase.'_max_fingerAll_T03.dat' ind 0 us 1:($3*3600/1E6) w steps lw 1 lc rgb 'magenta' t 't_{cool}=5 min',\
     '' ind 0 us (($1+$2)/2.0):($3*3600/1E6):($3*3600/1E6*$4/100.) w errorbars lw 1 lc rgb 'magenta' pt 0 ps 1 notitle,\
     'AMB74_'.myCase.'_max_fingerAll_T04.dat' ind 0 us 1:($3*3600/1E6) w steps lw 1 lc rgb 'dark-blue' t 't_{cool}=10 min',\
     '' ind 0 us (($1+$2)/2.0):($3*3600/1E6):($3*3600/1E6*$4/100.) w errorbars lw 1 lc rgb 'dark-blue' pt 0 ps 1 notitle,\
     'AMB74_'.myCase.'_max_fingerAll_T05.dat' ind 0 us 1:($3*3600/1E6) w steps lw 1 lc rgb 'blue' t 't_{cool}=30 min',\
     '' ind 0 us (($1+$2)/2.0):($3*3600/1E6):($3*3600/1E6*$4/100.) w errorbars lw 1 lc rgb 'blue' pt 0 ps 1 notitle,\
     'AMB74_'.myCase.'_max_fingerAll_T06.dat' ind 0 us 1:($3*3600/1E6) w steps lw 1 lc rgb 'light-blue' t 't_{cool}=1 h',\
     '' ind 0 us (($1+$2)/2.0):($3*3600/1E6):($3*3600/1E6*$4/100.) w errorbars lw 1 lc rgb 'light-blue' pt 0 ps 1 notitle,\
     'AMB74_'.myCase.'_max_fingerAll_T07.dat' ind 0 us 1:($3*3600/1E6) w steps lw 1 lc rgb 'dark-green' t 't_{cool}=1 d',\
     '' ind 0 us (($1+$2)/2.0):($3*3600/1E6):($3*3600/1E6*$4/100.) w errorbars lw 1 lc rgb 'dark-green' pt 0 ps 1 notitle,\
     'AMB74_'.myCase.'_max_fingerAll_T08.dat' ind 0 us 1:($3*3600/1E6) w steps lw 1 lc rgb 'green' t 't_{cool}=1 w',\
     '' ind 0 us (($1+$2)/2.0):($3*3600/1E6):($3*3600/1E6*$4/100.) w errorbars lw 1 lc rgb 'green' pt 0 ps 1 notitle
     
# =============================================================================
set terminal qt 1 enhanced title myTitle.' - Dose to fingers (lepton contribution)'
# =============================================================================

set title myTitle.' - Dose to fingers (lepton contribution)'
set xlabel '[cm]' 
set ylabel '[%]' 
set yrange [0.1:100]
set key top right
set grid

system('paste AMB74_'.myCase.'_max_fingerAll_T01.dat AMB74_'.myCase.'_max_fingerLep_T01.dat > T01.dat')
system('paste AMB74_'.myCase.'_max_fingerAll_T02.dat AMB74_'.myCase.'_max_fingerLep_T02.dat > T02.dat')
system('paste AMB74_'.myCase.'_max_fingerAll_T03.dat AMB74_'.myCase.'_max_fingerLep_T03.dat > T03.dat')
system('paste AMB74_'.myCase.'_max_fingerAll_T04.dat AMB74_'.myCase.'_max_fingerLep_T04.dat > T04.dat')
system('paste AMB74_'.myCase.'_max_fingerAll_T05.dat AMB74_'.myCase.'_max_fingerLep_T05.dat > T05.dat')
system('paste AMB74_'.myCase.'_max_fingerAll_T06.dat AMB74_'.myCase.'_max_fingerLep_T06.dat > T06.dat')
system('paste AMB74_'.myCase.'_max_fingerAll_T07.dat AMB74_'.myCase.'_max_fingerLep_T07.dat > T07.dat')
system('paste AMB74_'.myCase.'_max_fingerAll_T08.dat AMB74_'.myCase.'_max_fingerLep_T08.dat > T08.dat')

plot \
     'T01.dat' ind 0 us 1:($7/$3*100) w steps lw 1 lc rgb 'dark-red' t 't_{cool}=0 s',\
     'T02.dat' ind 0 us 1:($7/$3*100) w steps lw 1 lc rgb 'red' t 't_{cool}=2 min',\
     'T03.dat' ind 0 us 1:($7/$3*100) w steps lw 1 lc rgb 'magenta' t 't_{cool}=5 min',\
     'T04.dat' ind 0 us 1:($7/$3*100) w steps lw 1 lc rgb 'dark-blue' t 't_{cool}=10 min',\
     'T05.dat' ind 0 us 1:($7/$3*100) w steps lw 1 lc rgb 'blue' t 't_{cool}=30 min',\
     'T06.dat' ind 0 us 1:($7/$3*100) w steps lw 1 lc rgb 'light-blue' t 't_{cool}=1 h',\
     'T07.dat' ind 0 us 1:($7/$3*100) w steps lw 1 lc rgb 'dark-green' t 't_{cool}=1 d',\
     'T08.dat' ind 0 us 1:($7/$3*100) w steps lw 1 lc rgb 'green' t 't_{cool}=1 w'
