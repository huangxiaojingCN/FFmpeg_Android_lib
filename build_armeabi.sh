# 独立工具链路径, 根据 xx/android-ndk-r17c/build/tools/make_standalone_toolchain.py 生成
TOOLCHAIN=/Users/xxx/standalone-toolchain/armv7a-standalone-toolchain

export PATH=$PATH:$TOOLCHAIN/bin

# armeabi 架构, 32 位平台。如果需要编译 64 位平台需要更换为 aarch64-linux-android
target_host=arm-linux-androideabi
export AR=$target_host-ar
export AS=$taret_host-clang
export CC=$target_host-clang++
export LD=$target_host-ld
export STRIP=$target_host-strip


# 安装路径
PREFIX=./android1/armeabi-v7a

# 编译目标平台版本
ANDROID_API=21

./configure \
--prefix=$PREFIX \
--enable-small \
--disable-programs \
--disable-avdevice \
--disable-encoders \
--disable-muxers \
--disable-filters \
--enable-cross-compile \
--cross-prefix=$target_host- \
--disable-shared \
--enable-static \
--sysroot=$TOOLCHAIN/sysroot \
--extra-cflags="-isysroot $TOOLCHAIN/sysroot -isystem $NDK_ROOT/sysroot/usr/include/arm-linux-androideabi -D__ANDROID_API__=$ANDROID_API -U_FILE_OFFSET_BITS" \
--arch=arm \
--target-os=android

make clean
make -j4
make install

