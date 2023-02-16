#!/bin/bash
export KERNEL_DIR="/home/deepongi/Android/Singularity_Kernel"
export KBUILD_OUTPUT="/home/deepongi/Android/Singularity_Kernel/out"
export ZIP_DIR="/home/deepongi/Android/AnyKernel3"
export ZIP_OUT_DIR="/home/deepongi/Android/Out_Zips"
git submodule init
git submodule update
#make O=out mrproper
#rm -rf out
export PATH="/mnt/Hawai/toolchains/proton-clang-16/bin:$PATH"
export USE_CCACHE=1
export ARCH=arm64
DTBIMAGE="dtb"
export VARIANT="singularity-r02"
export HASH=`git rev-parse --short=4 HEAD`
export KERNEL_ZIP="$VARIANT-$HASH"
export LOCALVERSION="~singularity-r02"
make O=$KBUILD_OUTPUT CC=clang evo_defconfig
make -j64 O=$KBUILD_OUTPUT CC=clang CROSS_COMPILE=/mnt/Hawai/toolchains/gcc-linaro-12.2.1-2023.01-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu- CROSS_COMPILE_ARM32=/mnt/Hawai/toolchains/gcc-linaro-12.2.1-2023.01_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
cp -v $KBUILD_OUTPUT/arch/arm64/boot/Image $ZIP_DIR/Image
cd $ZIP_DIR
zip -r9 $VARIANT-$HASH.zip *
mv -v $VARIANT-$HASH.zip $ZIP_OUT_DIR/
echo -e "${green}"
echo "-------------------"
echo "Build Completed"
echo "-------------------"
echo -e "${restore}"
echo "                                                     "
echo "  _       __        _          _     _      _        "
echo " (_)_ _  / _|___ __| |_ ___ __| |___| |__ _| |__ ___ "
echo " | | ' \|  _/ -_) _|  _/ -_) _  |___| / _  | '_ (_-< "
echo " |_|_||_|_| \___\__|\__\___\__,_|   |_\__,_|_.__/__/ "
echo "                                                     "
echo "                                                     "
                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
