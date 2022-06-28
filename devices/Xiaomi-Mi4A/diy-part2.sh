# =================================================================== #
#                                                                     #
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>                 #
# Copyright (c) 2022 SolomonRicky <http://firmware.download.yzyz.ga>  #
#                                                                     #
# This is free software, licensed under the GNU GPLv3 License.        #
# See /LICENSE for more information.                                  #
#                                                                     #
# =================================================================== #

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
./scripts/feeds update -a
./scripts/feeds install -a

rm feeds/luci/applications/luci-app-passwall

sed -i 's/1.5.8/1.5.0/g' feeds/packages/net/xray-core/Makefile
sed -i 's/1d1f7f3de0596c430fde6e3027b93c45f5fa340d291c05bc48216750dc77ca8f/54c6a687dd463b25afe8d8eb44d37e18b8177f58308207cd1d74f6cd04619854/g' feeds/packages/net/xray-core/Makefile
