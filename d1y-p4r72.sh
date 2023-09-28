#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.177.100/g' package/base-files/files/bin/config_generate

# Change ash to bash
sed -i 's/ash/bash/g' package/base-files/files/etc/passwd

# Change luci list name
sed -i 's/"Argone 主题设置"/"主题设置"/g' feeds/kenzo/luci-app-argone-config/po/zh-cn/argone-config.po
sed -i '/\t\trevert_dns/d' feeds/luci/applications/luci-app-turboacc/root/etc/init.d/turboacc
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' feeds/luci/applications/luci-app-turboacc/po/zh-cn/turboacc.po

# Boost UDP
echo '# optimize udp' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.netdev_max_backlog=2048' >>package/base-files/files/etc/sysctl.d/10-default.conf

# upgrade config
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/y0uku_yk-l1/main/zzz-default-settings -O package/lean/default-settings/files/zzz-default-settings

wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/y0uku_yk-l1/main/99-init-settings -O package/base-files/files/etc/uci-defaults/99-init-settings

echo "diy-part2.sh is done."
