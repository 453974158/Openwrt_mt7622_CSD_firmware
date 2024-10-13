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
#sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#cd package

#国内常用OpenWrt软件包源码合集
#git clone https://github.com/kenzok8/openwrt-packages

#luci-app-pushbot 全能推送
#git clone https://github.com/zzsj0928/luci-app-pushbot

#下载闭源驱动并覆盖
git clone https://github.com/hpx502766238/MT7622-mtkwifi
#cp -r MT7622-mtkwifi/package/mtk/ package/
#cp -r MT7622-mtkwifi/package/mtk/mt7622/ package/lean/mt/drivers/
#cp -rf MT7622-mtkwifi/target/* target/
#解决循环依赖
sed -i 's/depends on PACKAGE_kmod-hw_nat || PACKAGE_kmod-mtk-hnat/depends on PACKAGE_kmod-mtk-hnat/' MT7622-mtkwifi/package/mtk/mt7915/config.in
sed -i 's/depends on PACKAGE_kmod-hw_nat || PACKAGE_kmod-mtk-hnat/depends on PACKAGE_kmod-mtk-hnat/' MT7622-mtkwifi/package/mtk/mt7915/src/Kconfig
sed -i 's/depends on PACKAGE_kmod-hw_nat || PACKAGE_kmod-mtk-hnat/depends on PACKAGE_kmod-mtk-hnat/' MT7622-mtkwifi/package/mtk/mt7915/src/mt_wifi/embedded/Kconfig
sed -i 's/config-5.10/config-5.15/' MT7622-mtkwifi/patches/general/1_add_mtkhnat_modules.patch
sed -i 's/@@ -297,7 +297,7 @@/@@ -340,7 +340,7 @@/' MT7622-mtkwifi/patches/general/2_change_mt7622_device_packages.patch
sed -i 's/kmod-mt7915e/kmod-mt7915-firmware/' MT7622-mtkwifi/patches/general/2_change_mt7622_device_packages.patch
sed -i 's/ports="$device"/ports="$ifname"/' MT7622-mtkwifi/patches/luci_new/1_add_wifi_to_br-lan_by_default.patch
sed -i 's/\[ -n "\$ports" -a -z "\$bridge" \]/\[ -n "\$bridge" \]/' MT7622-mtkwifi/patches/luci_new/1_add_wifi_to_br-lan_by_default.patch
