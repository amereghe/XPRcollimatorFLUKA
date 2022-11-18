#!/bin/bash

iFile="../data_2022-11-11/P_brass/P_brass_47_tab.lis"
oFile="highestPeaks_P_brass.dat"
nHighest=5

rm ${oFile}

iStarts=`grep -n Detector ${iFile} | cut -d\: -f1` ; iStarts=( ${iStarts} )
# debug => for ((ii=0;ii<1;ii++)) ; do
for ((ii=0;ii<${#iStarts[@]};ii++)) ; do
    let jj=ii+1
    if [ $jj == ${#iStarts[@]} ] ; then
        iHead=`wc -l ${iFile} | cut -d\  -f1`
    else
        iHead=${iStarts[$jj]} ; let iHead=${iHead}-1
    fi
    let iTail=${iHead}-${iStarts[$ii]}+1
    numbers=`head -n${iHead} ${iFile} | tail -n${iTail} | grep -v '#'`
    tot=`echo "${numbers}" | awk '{tot=tot+$3}END{print (tot)}'`
    echo "# file: ${iFile} - detector: ${jj}" >> ${oFile}
    echo "# tot activity: ${tot}" >> ${oFile}
    echo "${numbers}" | sort -rg -k3 | head -n ${nHighest} >> ${oFile}
    echo "" >> ${oFile}
    echo "" >> ${oFile}
    # debug => echo ${iHead} ${iTail}
done
