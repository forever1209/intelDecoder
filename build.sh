#!/bin/bash
cwd=$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}" )" &> /dev/null && pwd )
if [ "$#" -eq 1 ]; then
    rm -rf $cwd/output
    rm -rf $cwd/build
fi
rm -rf $cwd/output/img
echo "cwd is $cwd"
export LD_LIBRARY_PATH=$cwd/TPL/ffmpeg_intel/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$cwd/TPL/opencv/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$cwd/TPL/yaml-cpp/lib:$LD_LIBRARY_PATH

mkdir -p $cwd/build
mkdir -p $cwd/output
mkdir -p $cwd/output/img
mkdir -p $cwd/output/lib
cd  $cwd/build && cmake .. && make -j12
cd -

exec="$cwd/build/mach_decoder_intel"
cp $exec $cwd/output/ 
cp -r $cwd/config $cwd/output/
DESTINATION_DIR="$cwd/output/lib"
# 查找可执行文件的所有依赖
DEPENDENCIES=$(ldd "$exec" | awk '{print $3}' | grep -v '^$')
for LIB in $DEPENDENCIES; do
    if [ -f "$LIB" ]; then
        echo "Copying $LIB to $DESTINATION_DIR"
        cp "$LIB" "$DESTINATION_DIR"
    else
        echo "Warning: $LIB not found."
    fi
done
cp $cwd/TPL/IntelSDK/* $cwd/output/lib
cp $cwd/run.sh $cwd/output/
cp $cwd/tool/mem.py $cwd/output/

