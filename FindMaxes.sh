#!/bin/bash

myConf=C_Ni
bnnFiles=(
    XPRcolli_48.bnn
    XPRcolli_49.bnn
    XPRcolli_53.bnn
    XPRcolli_54.bnn
)
outFileNames=(
    "AMB74_${myConf}_max_T%02i.dat"
    "ACTOMASS_${myConf}_max_T%02i.dat"
    "AMB74_${myConf}_max_fingerAll_T%02i.dat"
    "AMB74_${myConf}_max_fingerLep_T%02i.dat"
)

for ((jj=0;jj<${#outFileNames[@]};jj++)) ; do
    for ((ii=1;ii<=8;ii++)) ; do
        outFile=`printf "${outFileNames[$jj]}" "${ii}"`
        ${FLUKA}/flutil/usbmax -d ${ii} -a Z -o ${outFile} ../${myConf}/${bnnFiles[$jj]}
        # echo ${outFile}
    done
done
