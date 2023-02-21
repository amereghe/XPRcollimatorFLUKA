#!/bin/bash

grepFiles=(
    highestPeaks_P_brass.dat
    highestPeaks_C_brass.dat
    highestPeaks_P_Ni.dat
    highestPeaks_C_Ni.dat
    highestPeaks_P_Cu.dat
    highestPeaks_C_Cu.dat
    highestPeaks_P_W.dat
    highestPeaks_C_W.dat
)

rm totActivities.csv

for ((ii=0;ii<${#grepFiles[@]};ii++)); do
    printf "%s" ${grepFiles[$ii]} >> totActivities.csv
    grep "tot activity" ${grepFiles[$ii]} | awk '{printf (",% 11.4E",$4/1E6)}' >> totActivities.csv
    printf "\n" >> totActivities.csv
done
