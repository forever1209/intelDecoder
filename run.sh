#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <parameter>"
    exit 1
fi
FILE=$1
cwd=$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}" )" &> /dev/null && pwd )
export LIBVA_DRIVER_NAME=iHD
# export LIBVA_DRIVERS_PATH=/usr/lib/x86_64-linux-gnu/dri/
export LD_LIBRARY_PATH=$cwd/lib:$LD_LIBRARY_PATH
export LIBVA_DRIVERS_PATH=$cwd/lib
$cwd/mach_decoder_intel $FILE
