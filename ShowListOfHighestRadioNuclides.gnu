reset

set title "W"
iFileName="highestPeaks_P_W.dat"
# set title "Cu"
# iFileName="highestPeaks_P_Cu.dat"
# set title "Ni"
# iFileName="highestPeaks_P_Ni.dat"
# set title "Brass"
# iFileName="highestPeaks_C_brass.dat"
nSeries=8.0+1
set style fill solid noborder
set boxwidth 1/nSeries
set logscale y
set format y "10^{%L}"
set grid
set ylabel "[Bq]"
LabelMe(x)=(x==75)?"Re":(x==74)?"W":(x==73)?"Ta":(x==72)?"Hf":(x==71)?"Lu":(x==31)?"Ga":(x==30)?"Zn":(x==29)?"Cu":(x==28)?"Ni":(x==27)?"Co":(x==26)?"Fe":(x==25)?"Mn":(x==24)?"Cr":(x==23)?"V":(x==6)?"C":(x==4)?"Be":x
set yrange [1E4:1E9]

plot \
     iFileName index 0 using (column(0)+1-3.5/nSeries):3 with boxes lc rgb "red" title "t_{cool}=0 s",\
     ""        index 0 using (column(0)+1-3.5/nSeries):3:(LabelMe($2)) with labels offset 0,char 1 tc rgb "red" rotate by 90 notitle,\
     ""        index 0 using (column(0)+1-3.5/nSeries):3:1 with labels offset 0,char 3 tc rgb "red" rotate by 90 notitle,\
     ""        index 1 using (column(0)+1-2.5/nSeries):3 with boxes lc rgb "blue" title "t_{cool}=2 m",\
     ""        index 1 using (column(0)+1-2.5/nSeries):3:(LabelMe($2)) with labels offset 0,char 1 tc rgb "blue" rotate by 90 notitle,\
     ""        index 1 using (column(0)+1-2.5/nSeries):3:1 with labels offset 0,char 3 tc rgb "blue" rotate by 90 notitle,\
     ""        index 2 using (column(0)+1-1.5/nSeries):3 with boxes lc rgb "dark-green" title "t_{cool}=5 m",\
     ""        index 2 using (column(0)+1-1.5/nSeries):3:(LabelMe($2)) with labels offset 0,char 1 tc rgb "dark-green" rotate by 90 notitle,\
     ""        index 2 using (column(0)+1-1.5/nSeries):3:1 with labels offset 0,char 3 tc rgb "dark-green" rotate by 90 notitle,\
     ""        index 3 using (column(0)+1-0.5/nSeries):3 with boxes lc rgb "dark-orange" title "t_{cool}=10 m",\
     ""        index 3 using (column(0)+1-0.5/nSeries):3:(LabelMe($2)) with labels offset 0,char 1 tc rgb "dark-orange" rotate by 90 notitle,\
     ""        index 3 using (column(0)+1-0.5/nSeries):3:1 with labels offset 0,char 3 tc rgb "dark-orange" rotate by 90 notitle,\
     ""        index 4 using (column(0)+1+0.5/nSeries):3 with boxes lc rgb "magenta" title "t_{cool}=30 m",\
     ""        index 4 using (column(0)+1+0.5/nSeries):3:(LabelMe($2)) with labels offset 0,char 1 tc rgb "magenta" rotate by 90 notitle,\
     ""        index 4 using (column(0)+1+0.5/nSeries):3:1 with labels offset 0,char 3 tc rgb "magenta" rotate by 90 notitle,\
     ""        index 5 using (column(0)+1+1.5/nSeries):3 with boxes lc rgb "green" title "t_{cool}=60 m",\
     ""        index 5 using (column(0)+1+1.5/nSeries):3:(LabelMe($2)) with labels offset 0,char 1 tc rgb "green" rotate by 90 notitle,\
     ""        index 5 using (column(0)+1+1.5/nSeries):3:1 with labels offset 0,char 3 tc rgb "green" rotate by 90 notitle,\
     ""        index 6 using (column(0)+1+2.5/nSeries):3 with boxes lc rgb "cyan" title "t_{cool}=1 d",\
     ""        index 6 using (column(0)+1+2.5/nSeries):3:(LabelMe($2)) with labels offset 0,char 1 tc rgb "cyan" rotate by 90 notitle,\
     ""        index 6 using (column(0)+1+2.5/nSeries):3:1 with labels offset 0,char 3 tc rgb "cyan" rotate by 90 notitle,\
     ""        index 7 using (column(0)+1+3.5/nSeries):3 with boxes lc rgb "orange" title "t_{cool}=1 w",\
     ""        index 7 using (column(0)+1+3.5/nSeries):3:(LabelMe($2)) with labels offset 0,char 1 tc rgb "orange" rotate by 90 notitle,\
     ""        index 7 using (column(0)+1+3.5/nSeries):3:1 with labels offset 0,char 3 tc rgb "orange" rotate by 90 notitle
