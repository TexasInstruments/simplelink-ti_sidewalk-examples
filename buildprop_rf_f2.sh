#!/bin/bash
#
# Quick test build or clean f2 ti_sidewalk examples
#
cwd=`pwd`

compiler='gcc'  # gcc and freertos only option as of  simplelink_cc13xx_cc26xx_sdk_7_10_00_84_eng
rtos='freertos'

devices=(LP_CC1352P7_1 LP_CC2652R7)

echo "Compiler: $compiler"
echo "RTOS: $rtos"

for device in "${devices[@]}"
do
    cd examples/rtos/$device/ti_sidewalk
    examples=`ls -1`
    cd $cwd
    for example in $examples
    do 
        echo "$rtos $device $example"
        cd examples/rtos/$device/ti_sidewalk/$example/$rtos/$compiler 
        make -j 6 $1
        cd $cwd
    done
done
