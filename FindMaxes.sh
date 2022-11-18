#!/bin/bash

bnnFile="../data_2022-11-11/P_W/P_W_48.bnn"
outFileName="AMB74_P_W_max_T%02i.dat"
# bnnFile="../data_2022-11-11/P_Cu/p_Cu_48.bnn"
# outFileName="AMB74_P_Cu_max_T%02i.dat"
# bnnFile="../data_2022-11-11/P_Ni/P_Ni_48.bnn"
# outFileName="AMB74_P_Ni_max_T%02i.dat"
# bnnFile="../data_2022-11-11/P_brass/P_brass_48.bnn"
# outFileName="AMB74_P_Brass_max_T%02i.dat"

for ((ii=1;ii<=8;ii++)) ; do
    outFile=`printf "${outFileName}" "${ii}"`
    /usr/local/FLUKA_INFN/2021.2.7/flutil/usbmax -d ${ii} -a Z -o ${outFile} ${bnnFile}
    # echo ${outFile}
done
