#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#cd package

#国内常用OpenWrt软件包源码合集
#git clone https://github.com/kenzok8/openwrt-packages

#luci-app-pushbot 全能推送
#git clone https://github.com/zzsj0928/luci-app-pushbot

#下载闭源驱动并覆盖

git clone https://github.com/bricco1981/MT7622-mtkwifi
cp -r MT7622-mtkwifi/package/* package/
cp -rf MT7622-mtkwifi/target/* target/
