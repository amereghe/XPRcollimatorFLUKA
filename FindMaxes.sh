#!/bin/bash

myConf=P_Ni
bnnFiles=(
    XPRcolli_48.bnn
    XPRcolli_53.bnn
    XPRcolli_54.bnn
)
outFileNames=(
    "AMB74_${myConf}_max_T%02i.dat"
    "AMB74_${myConf}_max_fingerAll_T%02i.dat"
    "AMB74_${myConf}_max_fingerLep_T%02i.dat"
)

for ((ii=1;ii<=8;ii++)) ; do
    for ((jj=0;jj<${#outFileNames[@]};jj++)) ; do
        outFile=`printf "${outFileNames[$jj]}" "${ii}"`
        ${FLUKA}/flutil/usbmax -d ${ii} -a Z -o ${outFile} ${bnnFiles[$jj]}
        # echo ${outFile}
    done
done
