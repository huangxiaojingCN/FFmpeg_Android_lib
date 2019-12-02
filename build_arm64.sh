# 独立工具链
TOOLCHAIN=/Users/huangxiaojing/fullstack/standalone-toolchain/armv8-21-standalone-toolchain

export PATH=$PATH:$TOOLCHAIN/bin

target_host=aarch64-linux-android
export AR=$target_host-ar
export AS=$taret_host-clang
export CC=$target_host-clang++
export LD=$target_host-ld
export STRIP=$target_host-strip


# 安装路径
PREFIX=./android/arm64

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
--extra-cflags="-isysroot $TOOLCHAIN/sysroot -isystem $NDK_ROOT/sysroot/usr/include/$target_host -D__ANDROID_API__=$ANDROID_API -U_FILE_OFFSET_BITS" \
--arch=arm64 \
--target-os=android

make clean
make -j4
make install
