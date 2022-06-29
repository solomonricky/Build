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

svn export https://github.com/solomonricky/openwrt-passwall/branches/luci-nodns/luci-app-passwall feeds/luci/applications/luci-app-passwall

rm -rf feeds/packages/lang/golang/golang-build.sh
rm -rf feeds/packages/lang/golang/golang-package.mk
rm -rf feeds/packages/lang/golang/golang-values.mk
rm -rf feeds/packages/lang/golang/golang/Makefile
rm -rf feeds/packages/lang/golang/golang/patches/001-cmd-link-use-gold-on-ARM-ARM64-only-if-gold-is-available.patch

wget -P feeds/packages/lang/golang https://raw.githubusercontent.com/immortalwrt/packages/9704e900da348449bdbc76228a56da19936d605c/lang/golang/golang-build.sh
wget -P feeds/packages/lang/golang https://raw.githubusercontent.com/immortalwrt/packages/9704e900da348449bdbc76228a56da19936d605c/lang/golang/golang-package.mk
wget -P feeds/packages/lang/golang https://raw.githubusercontent.com/immortalwrt/packages/9704e900da348449bdbc76228a56da19936d605c/lang/golang/golang-values.mk
wget -P feeds/packages/lang/golang/golang https://raw.githubusercontent.com/immortalwrt/packages/9704e900da348449bdbc76228a56da19936d605c/lang/golang/golang/Makefile

sed -i 's/1.5.8/1.5.0/g' feeds/packages/net/xray-core/Makefile
sed -i 's/1d1f7f3de0596c430fde6e3027b93c45f5fa340d291c05bc48216750dc77ca8f/43f35c83902db9d1eba0210c0e27b7814d4caf198cd0424c8af9c97a3ce9a860/g' feeds/packages/net/xray-core/Makefile

./scripts/feeds update -a
./scripts/feeds install -a