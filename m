Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3D73E01481
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:33:57 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV00EVOQRPUME1@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:33:36 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1FDCC20077; Mon,
	18 Mar 2013 19:33:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:08 -0400
Message-id: <1363649547-4693-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH 00/19] u-boot: major rework and cleanup
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 23:33:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Rework u-boot recipes to clean up old versions and introduce support for namespaces.

Denys Dmytriyenko (19):
  u-boot-git: remove a very old no longer used version
  u-boot 2011.06: remove an older no longer used version
  u-boot 2011.09-psp: remove an older no longer used version
  u-boot.inc: refactor local include file to base off core with TI
    customizations
  u-boot-ti-staging: add new recipe for TI unified staging tree
  u-boot-keystone: modify keystone specific version to use new namespace
    feature
  u-boot-am180x: modify am180x specific version to use new namespace
    feature
  u-boot-beagleboard: modify beagleboard specific version to use new
    namespace feature
  u-boot-am33x: modify am33x specific version to use new namespace
    feature
  u-boot 2011.12: modify multi-machine version for the new .inc file
  u-boot-am37x: modify am37x specific version to use new namespace
    feature
  u-boot-am33x: modify am33x specific version to use new namespace
    feature
  u-boot: modify mainline version to use the new .inc file
  ti33x: switch default u-boot preference to ti-staging tree
  keystone: switch default u-boot preference to machine-specific tree
  am180x: switch default u-boot preference to machine-specific tree
  am37x-evm: switch default u-boot preference to machine-specific tree
  am3517-evm: switch default u-boot preference to machine-specific tree
  beagleboard: switch default u-boot preference to machine-specific tree

 conf/machine/am180x-evm.conf                       |   2 +
 conf/machine/am3517-evm.conf                       |   4 +
 conf/machine/am37x-evm.conf                        |   2 +
 conf/machine/beagleboard.conf                      |   2 +
 conf/machine/include/davinci.inc                   |   2 +-
 conf/machine/include/keystone.inc                  |   5 +-
 conf/machine/include/omap3.inc                     |   2 +-
 conf/machine/include/ti33x.inc                     |   5 +-
 ...hange-default-memory-to-not-limit-at-32MB.patch |   0
 ...03.21.00.04.sdk.bb => u-boot-am180x_2010.12.bb} |  16 +-
 ...boot_2011.10rc.bb => u-boot-am33x_2011.10rc.bb} |  12 +-
 .../{u-boot_2012.10.bb => u-boot-am33x_2012.10.bb} |  19 +-
 ...3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch |   0
 .../0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch     |   0
 ...e-add-usbethaddr-setting-to-enable-networ.patch |   0
 ...dded-function-calls-to-set-volts-speed-on.patch |   0
 ...17evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch |   0
 ...2-omap3evm-Make-the-board-start-at-800MHz.patch |   0
 ...gleboard-Load-uImage-from-VFAT-by-default.patch |   0
 ...03-beagleboard-Make-xM-rev-C-go-to-800MHz.patch |   0
 ...-Load-uImage-to-the-default-kernel-linux-.patch |   0
 ...ot_2012.04.01.bb => u-boot-am37x_2012.04.01.bb} |  18 +-
 ...ot_2011.09.bb => u-boot-beagleboard_2011.09.bb} |  11 +-
 ...-boot_2013.01.bb => u-boot-keystone_2013.01.bb} |  13 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb |  13 +
 ...oot_2011.09-psp04.06.00.08.bb => u-boot-ti.inc} |  24 +-
 recipes-bsp/u-boot/u-boot.inc                      |  68 --
 ...-Beagle-Pin-Mux-initialization-glitch-fix.patch |  46 -
 ...-omapfb.debug-y-from-Beagle-and-Overo-env.patch |  56 --
 ...agle-pass-expansionboard-name-in-bootargs.patch |  57 --
 ...beagleboard-add-support-for-xM-revision-C.patch |  47 -
 ...-for-SMSC95XX-USB-2.0-10-100MBit-Ethernet.patch | 989 ---------------------
 ...t-hardware-MAC-address-framework-to-usbne.patch | 245 -----
 ...Add-documentation-for-USB-Host-Networking.patch | 188 ----
 .../u-boot/2011.06/0008-dm3730-enable-dpll5.patch  |  31 -
 ...beagleboard-enable-HUB-power-on-XM-boards.patch |  40 -
 ...-beagleboard-turn-off-clocks-in-ehci_stop.patch |  32 -
 .../0011-beagleboard-enable-networking.patch       |  45 -
 ...12-beagleboard-switch-to-ttyO2-as-console.patch |  26 -
 ...gleboard-load-kernel-from-MMC-ext-not-FAT.patch |  27 -
 ...4-beagleboard-enable-asix-driver-and-dhcp.patch |  34 -
 ...-hardcode-MAC-for-onboard-SMSC-and-use-uI.patch |  26 -
 ...agleboard-decrease-bootdelay-to-2-seconds.patch |  26 -
 ...__attribute__-packed-for-struct-ehci_hccr.patch |  58 --
 ...sb-Some-EHCI-chipsets-are-slow-to-respond.patch |  29 -
 .../0019-OMAP3-Add-DSS-driver-for-OMAP3.patch      | 349 --------
 .../2011.06/0020-video-DSS-makefile-update.patch   |  30 -
 .../0021-BeagleBoard-Configure-DVI-S-video.patch   | 170 ----
 .../0022-BeagleBoard-config-enable-DSS.patch       |  25 -
 ...0023-BeagleBoard-Added-userbutton-command.patch | 107 ---
 ...ED-name-match-finding-avoiding-extraneous.patch |  44 -
 .../0025-BeagleBoard-fix-LED-0-1-in-driver.patch   |  31 -
 .../0026-led-added-cmd_led-to-Makefile.patch       |  29 -
 ...led-correct-off-on-locations-in-structure.patch |  36 -
 .../0028-BeagleBoard-config-make-mtest-run.patch   |  36 -
 ...-config-increase-command-line-functionali.patch |  42 -
 ...agleBoard-config-add-optargs-buddy-camera.patch |  51 --
 .../2011.06/0031-omap4-add-support-for-gpios.patch | 306 -------
 .../2011.06/0032-omap4-add-support-for-EHCI.patch  | 322 -------
 .../0033-omap4_panda-add-support-for-EHCI.patch    |  97 --
 ...nda-adding-support-for-smsc-and-tftp-boot.patch |  66 --
 ...035-omap4_panda-use-uImage.panda-for-tftp.patch |  26 -
 .../u-boot/u-boot/omap3-touchbook/fw_env.config    |   6 -
 recipes-bsp/u-boot/u-boot/touchbook-config.patch   |  25 -
 recipes-bsp/u-boot/u-boot_2011.06.bb               |  51 --
 recipes-bsp/u-boot/u-boot_2011.12.bb               |  16 +-
 recipes-bsp/u-boot/u-boot_2013.01.01.bb            |   9 +-
 recipes-bsp/u-boot/u-boot_git.bb                   |  61 --
 68 files changed, 57 insertions(+), 4098 deletions(-)
 rename recipes-bsp/u-boot/{u-boot-2010.12-psp03.21.00.04.sdk => u-boot-am180x-2010.12}/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch (100%)
 rename recipes-bsp/u-boot/{u-boot_2010.12-psp03.21.00.04.sdk.bb => u-boot-am180x_2010.12.bb} (51%)
 rename recipes-bsp/u-boot/{u-boot_2011.10rc.bb => u-boot-am33x_2011.10rc.bb} (82%)
 rename recipes-bsp/u-boot/{u-boot_2012.10.bb => u-boot-am33x_2012.10.bb} (31%)
 rename recipes-bsp/u-boot/{u-boot-2012.04.01 => u-boot-am37x-2012.04.01}/0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch (100%)
 rename recipes-bsp/u-boot/{u-boot-2012.04.01 => u-boot-am37x-2012.04.01}/0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch (100%)
 rename recipes-bsp/u-boot/{u-boot-2012.04.01 => u-boot-am37x-2012.04.01}/0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.patch (100%)
 rename recipes-bsp/u-boot/{u-boot-2012.04.01 => u-boot-am37x-2012.04.01}/0001-omap3_evm-Added-function-calls-to-set-volts-speed-on.patch (100%)
 rename recipes-bsp/u-boot/{u-boot-2012.04.01 => u-boot-am37x-2012.04.01}/0002-am335x-am3517evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch (100%)
 rename recipes-bsp/u-boot/{u-boot-2012.04.01 => u-boot-am37x-2012.04.01}/0002-omap3evm-Make-the-board-start-at-800MHz.patch (100%)
 rename recipes-bsp/u-boot/{u-boot-2012.04.01 => u-boot-am37x-2012.04.01}/0003-beagleboard-Load-uImage-from-VFAT-by-default.patch (100%)
 rename recipes-bsp/u-boot/{u-boot-2012.04.01 => u-boot-am37x-2012.04.01}/0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch (100%)
 rename recipes-bsp/u-boot/{u-boot-2012.04.01 => u-boot-am37x-2012.04.01}/0004-beagleboard-Load-uImage-to-the-default-kernel-linux-.patch (100%)
 rename recipes-bsp/u-boot/{u-boot_2012.04.01.bb => u-boot-am37x_2012.04.01.bb} (78%)
 rename recipes-bsp/u-boot/{u-boot_2011.09.bb => u-boot-beagleboard_2011.09.bb} (89%)
 rename recipes-bsp/u-boot/{u-boot_2013.01.bb => u-boot-keystone_2013.01.bb} (43%)
 create mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
 rename recipes-bsp/u-boot/{u-boot_2011.09-psp04.06.00.08.bb => u-boot-ti.inc} (28%)
 delete mode 100644 recipes-bsp/u-boot/u-boot.inc
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0001-OMAP3-Beagle-Pin-Mux-initialization-glitch-fix.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0002-OMAP-Remove-omapfb.debug-y-from-Beagle-and-Overo-env.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0003-OMAP3-beagle-pass-expansionboard-name-in-bootargs.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0004-beagleboard-add-support-for-xM-revision-C.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0005-Add-support-for-SMSC95XX-USB-2.0-10-100MBit-Ethernet.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0006-Add-Ethernet-hardware-MAC-address-framework-to-usbne.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0007-Add-documentation-for-USB-Host-Networking.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0008-dm3730-enable-dpll5.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0009-beagleboard-enable-HUB-power-on-XM-boards.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0010-beagleboard-turn-off-clocks-in-ehci_stop.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0011-beagleboard-enable-networking.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0012-beagleboard-switch-to-ttyO2-as-console.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0013-beagleboard-load-kernel-from-MMC-ext-not-FAT.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0014-beagleboard-enable-asix-driver-and-dhcp.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0015-beagleboard-hardcode-MAC-for-onboard-SMSC-and-use-uI.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0016-beagleboard-decrease-bootdelay-to-2-seconds.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0017-USB-Remove-__attribute__-packed-for-struct-ehci_hccr.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0018-usb-Some-EHCI-chipsets-are-slow-to-respond.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0019-OMAP3-Add-DSS-driver-for-OMAP3.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0020-video-DSS-makefile-update.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0021-BeagleBoard-Configure-DVI-S-video.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0022-BeagleBoard-config-enable-DSS.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0023-BeagleBoard-Added-userbutton-command.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0024-Corrected-LED-name-match-finding-avoiding-extraneous.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0025-BeagleBoard-fix-LED-0-1-in-driver.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0026-led-added-cmd_led-to-Makefile.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0027-led-correct-off-on-locations-in-structure.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0028-BeagleBoard-config-make-mtest-run.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0029-BeagleBoard-config-increase-command-line-functionali.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0030-BeagleBoard-config-add-optargs-buddy-camera.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0031-omap4-add-support-for-gpios.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0032-omap4-add-support-for-EHCI.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0033-omap4_panda-add-support-for-EHCI.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0034-omap4_panda-adding-support-for-smsc-and-tftp-boot.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.06/0035-omap4_panda-use-uImage.panda-for-tftp.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/omap3-touchbook/fw_env.config
 delete mode 100644 recipes-bsp/u-boot/u-boot/touchbook-config.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot_2011.06.bb
 delete mode 100644 recipes-bsp/u-boot/u-boot_git.bb

-- 
1.8.1.5


