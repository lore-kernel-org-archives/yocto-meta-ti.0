Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21288.1643238549509342728
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CE1A740CC9;
	Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJNlBRPIDzQn; Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 96A5D40CC0;
	Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7D63D174734;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 12/19] recipes-bsp: remove Keystone1/2 LLDs
Date: Wed, 26 Jan 2022 18:08:52 -0500
Message-Id: <1643238539-20686-13-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Low Level Drivers (LLDs) were used by Keystone1/2 to access peripherals by
RTOS and Linux. Remove due to deprecation.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb          |  16 --
 recipes-bsp/aif2-lld/aif2-lld-test_git.bb          |  18 --
 recipes-bsp/aif2-lld/aif2-lld.inc                  |  14 --
 recipes-bsp/aif2-lld/aif2-lld_git.bb               |  20 ---
 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb            |  23 ---
 recipes-bsp/cal-lld/cal-lld-rtos_git.bb            |  76 --------
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb          |  10 --
 recipes-bsp/cppi-lld/cppi-lld-test_git.bb          |  29 ---
 recipes-bsp/cppi-lld/cppi-lld.inc                  |  19 --
 recipes-bsp/cppi-lld/cppi-lld_git.bb               |  38 ----
 recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb            |  12 --
 recipes-bsp/dfe-lld/dfe-lld-test_git.bb            |  20 ---
 recipes-bsp/dfe-lld/dfe-lld.inc                    |  14 --
 recipes-bsp/dfe-lld/dfe-lld_git.bb                 |  20 ---
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb        | 145 ---------------
 recipes-bsp/edma3-lld/edma3-lld.inc                |  17 --
 recipes-bsp/edma3-lld/edma3-lld_git.bb             |  78 --------
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb          |  30 ----
 recipes-bsp/emac-lld/emac-lld.inc                  |   7 -
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb          |  22 ---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb          |  34 ----
 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb          |  32 ----
 recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb      |  12 --
 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb      |  26 ---
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc              |  21 ---
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb           |  36 ----
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb            |  45 -----
 .../icss-emac-lld/icss-emac-lld-rtos_git.bb        |  25 ---
 .../icss-emac-lld/icss-emac-lld-test_git.bb        |  30 ----
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc        |  15 --
 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb     |  25 ---
 recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb      |  33 ----
 recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb   | 162 -----------------
 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb              | 196 ---------------------
 recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb            |  45 -----
 recipes-bsp/ipc-lld/ipc-lld.inc                    |  29 ---
 recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb          |  12 --
 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb          |  18 --
 recipes-bsp/iqn2-lld/iqn2-lld.inc                  |  13 --
 recipes-bsp/iqn2-lld/iqn2-lld_git.bb               |  25 ---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb        |  41 -----
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb        |  30 ----
 recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb          |  10 --
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb          |  44 -----
 recipes-bsp/mmap-lld/mmap-lld.inc                  |  22 ---
 recipes-bsp/mmap-lld/mmap-lld_git.bb               |  15 --
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb        |  41 -----
 recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb          |  19 --
 recipes-bsp/nwal-lld/nwal-lld-test_git.bb          |  27 ---
 recipes-bsp/nwal-lld/nwal-lld.inc                  |  21 ---
 recipes-bsp/nwal-lld/nwal-lld_git.bb               |  27 ---
 recipes-bsp/pa-lld/pa-lld-rtos_git.bb              |  12 --
 recipes-bsp/pa-lld/pa-lld-test_git.bb              |  30 ----
 recipes-bsp/pa-lld/pa-lld.inc                      |  24 ---
 recipes-bsp/pa-lld/pa-lld_git.bb                   |  27 ---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb          |  28 ---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb              |  71 --------
 recipes-bsp/pruss-lld/pruss-lld-apps_git.bb        |  31 ----
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb        |  22 ---
 recipes-bsp/pruss-lld/pruss-lld-test_git.bb        |  27 ---
 recipes-bsp/pruss-lld/pruss-lld.inc                |  15 --
 recipes-bsp/pruss-lld/pruss-lld_git.bb             |  21 ---
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb          |   9 -
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb          |  30 ----
 recipes-bsp/qmss-lld/qmss-lld.inc                  |  19 --
 recipes-bsp/qmss-lld/qmss-lld_git.bb               |  38 ----
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb              |  13 --
 recipes-bsp/rm-lld/rm-lld.inc                      |  15 --
 recipes-bsp/rm-lld/rm-lld_git.bb                   |  33 ----
 recipes-bsp/sa-lld/sa-lld-rtos_git.bb              |  26 ---
 recipes-bsp/sa-lld/sa-lld-test_git.bb              |  46 -----
 recipes-bsp/sa-lld/sa-lld.inc                      |  21 ---
 recipes-bsp/sa-lld/sa-lld_git.bb                   |  26 ---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb            |  37 ----
 recipes-bsp/srio-lld/srio-lld-rtos_git.bb          |  17 --
 recipes-bsp/srio-lld/srio-lld-test_git.bb          |  30 ----
 recipes-bsp/srio-lld/srio-lld.inc                  |  18 --
 recipes-bsp/srio-lld/srio-lld_git.bb               |  21 ---
 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb        |  23 ---
 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb          |  18 --
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb          |  41 -----
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb          |  65 -------
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb            |  29 ---
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb            |  56 ------
 84 files changed, 2698 deletions(-)
 delete mode 100644 recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/aif2-lld/aif2-lld-test_git.bb
 delete mode 100644 recipes-bsp/aif2-lld/aif2-lld.inc
 delete mode 100644 recipes-bsp/aif2-lld/aif2-lld_git.bb
 delete mode 100644 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/cal-lld/cal-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/cppi-lld/cppi-lld-test_git.bb
 delete mode 100644 recipes-bsp/cppi-lld/cppi-lld.inc
 delete mode 100644 recipes-bsp/cppi-lld/cppi-lld_git.bb
 delete mode 100644 recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/dfe-lld/dfe-lld-test_git.bb
 delete mode 100644 recipes-bsp/dfe-lld/dfe-lld.inc
 delete mode 100644 recipes-bsp/dfe-lld/dfe-lld_git.bb
 delete mode 100644 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/edma3-lld/edma3-lld.inc
 delete mode 100644 recipes-bsp/edma3-lld/edma3-lld_git.bb
 delete mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/emac-lld/emac-lld.inc
 delete mode 100644 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
 delete mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld.inc
 delete mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
 delete mode 100644 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
 delete mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld.inc
 delete mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
 delete mode 100644 recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
 delete mode 100644 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
 delete mode 100644 recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/ipc-lld/ipc-lld.inc
 delete mode 100644 recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
 delete mode 100644 recipes-bsp/iqn2-lld/iqn2-lld.inc
 delete mode 100644 recipes-bsp/iqn2-lld/iqn2-lld_git.bb
 delete mode 100644 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/mmap-lld/mmap-lld-test_git.bb
 delete mode 100644 recipes-bsp/mmap-lld/mmap-lld.inc
 delete mode 100644 recipes-bsp/mmap-lld/mmap-lld_git.bb
 delete mode 100644 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/nwal-lld/nwal-lld-test_git.bb
 delete mode 100644 recipes-bsp/nwal-lld/nwal-lld.inc
 delete mode 100644 recipes-bsp/nwal-lld/nwal-lld_git.bb
 delete mode 100644 recipes-bsp/pa-lld/pa-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/pa-lld/pa-lld-test_git.bb
 delete mode 100644 recipes-bsp/pa-lld/pa-lld.inc
 delete mode 100644 recipes-bsp/pa-lld/pa-lld_git.bb
 delete mode 100644 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld-test_git.bb
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld.inc
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld_git.bb
 delete mode 100644 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/qmss-lld/qmss-lld-test_git.bb
 delete mode 100644 recipes-bsp/qmss-lld/qmss-lld.inc
 delete mode 100644 recipes-bsp/qmss-lld/qmss-lld_git.bb
 delete mode 100644 recipes-bsp/rm-lld/rm-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/rm-lld/rm-lld.inc
 delete mode 100644 recipes-bsp/rm-lld/rm-lld_git.bb
 delete mode 100644 recipes-bsp/sa-lld/sa-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/sa-lld/sa-lld-test_git.bb
 delete mode 100644 recipes-bsp/sa-lld/sa-lld.inc
 delete mode 100644 recipes-bsp/sa-lld/sa-lld_git.bb
 delete mode 100644 recipes-bsp/spi-lld/spi-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/srio-lld/srio-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/srio-lld/srio-lld-test_git.bb
 delete mode 100644 recipes-bsp/srio-lld/srio-lld.inc
 delete mode 100644 recipes-bsp/srio-lld/srio-lld_git.bb
 delete mode 100644 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/uart-lld/uart-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/udma-lld/udma-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/usb-lld/usb-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/vps-lld/vps-lld-rtos_git.bb

diff --git a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
deleted file mode 100644
index 048a243..0000000
--- a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "TI RTOS low level driver for Antenna Interface"
-
-inherit ti-pdk
-
-require recipes-bsp/aif2-lld/aif2-lld.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS:append = " qmss-lld-rtos \
-                   cppi-lld-rtos \
-"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "AIF2 LLD"
diff --git a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
deleted file mode 100644
index 9180b95..0000000
--- a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "TI Antenna Interface peripheral module low level driver test binaries"
-
-DEPENDS = "common-csl-ip aif2-lld qmss-lld cppi-lld"
-
-include aif2-lld.inc
-
-PR = "${INC_PR}.0"
-
-EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} AIF2_SRC_DIR=${WORKDIR}/git"
-
-do_compile () {
-    oe_runmake clean DEVICE=k2hk
-    oe_runmake tests DEVICE=k2hk
-}
-
-do_install () {
-    oe_runmake installbin DEVICE=k2hk AIF2_SRC_DIR=${WORKDIR}/git INSTALL_BIN_BASE_DIR=${D}/${bindir}
-}
diff --git a/recipes-bsp/aif2-lld/aif2-lld.inc b/recipes-bsp/aif2-lld/aif2-lld.inc
deleted file mode 100644
index 718f3a7..0000000
--- a/recipes-bsp/aif2-lld/aif2-lld.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.aif2"
-
-PE = "1"
-
-INC_PR = "r0"
-
-COMPATIBLE_MACHINE = "k2hk"
-
diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb b/recipes-bsp/aif2-lld/aif2-lld_git.bb
deleted file mode 100644
index 4a640f1..0000000
--- a/recipes-bsp/aif2-lld/aif2-lld_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Antenna Interface low level driver"
-
-DEPENDS = "common-csl-ip qmss-lld cppi-lld"
-
-include aif2-lld.inc
-
-PR = "${INC_PR}.0"
-
-EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
-
-do_compile () {
-    oe_runmake lib DEVICE=k2hk
-}
-
-do_install () {
-    oe_runmake install INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
-    chown -R root:root ${D}
-}
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libaif2.a"
diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
deleted file mode 100644
index d808267..0000000
--- a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "TI Bit Coprocessor (BCP) low level driver"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.bcp"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://bcp.h;beginline=1;endline=40;md5=4f6e6128dd075a89548c0287a39b8896"
-
-COMPATIBLE_MACHINE = "k2hk|k2l|c667x-evm"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0"
-
-
-DEPENDS:append = " qmss-lld-rtos \
-                   cppi-lld-rtos \
-"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "BCP LLD"
diff --git a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb b/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
deleted file mode 100644
index a91d85b..0000000
--- a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
+++ /dev/null
@@ -1,76 +0,0 @@
-SUMMARY = "TI RTOS low level driver for CAL"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.cal"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://cal.h;beginline=1;endline=31;md5=83d177cf3df55c16b27ae4102b6ade9a"
-
-COMPATIBLE_MACHINE = "k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-
-PR = "r0"
-
-DEPENDS:append = " osal-rtos \
-                   fvid2-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-CAL_PACKAGE_BASE   = "${WORKDIR}/cal_base"
-CAL_LLD_ROOTPATH = "${CAL_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/cal"
-
-export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
-export PDK_CAL_ROOT_PATH = "${CAL_PACKAGE_BASE}/package/all/pdk_/packages"
-
-LIMSOCS = ""
-LIMSOCS:am65xx-evm = "am65xx"
-LIMSOCS:am65xx-hs-evm = "am65xx"
-
-LIMBOARDS = ""
-LIMBOARDS:am65xx-evm = "am65xx_evm"
-LIMBOARDS:am65xx-hs-evm = "am65xx_evm"
-
-BOARD_PACKAGE = ""
-BOARD_PACKAGE:am65xx-evm = "am65xx_evm"
-BOARD_PACKAGE:am65xx-hs-evm = "am65xx_evm"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "CAL"
-
-do_configure() {
-    rm -rf ${CAL_PACKAGE_BASE}
-    cd ${S}
-
-    # remove any previous package
-    rm -f ${CAL_PACKAGE_BASE}
-
-    # make the release package before building it
-    make package BOARD=${BOARD_PACKAGE} DEST_ROOT=${CAL_PACKAGE_BASE} PDK_CAL_COMP_PATH=${S}
-}
-
-do_compile() {
-    echo "cal lld root path is ${CAL_LLD_ROOTPATH}"
-    cd ${CAL_LLD_ROOTPATH}
-
-    # Build am65xx libraries
-    make clean lib xdc_meta doxygen LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
-
-    #archive
-    tar -cf cal_lld.tar --exclude='*.tar' ./*
-}
-
-do_install() {
-    cd ${CAL_LLD_ROOTPATH}
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/cal
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/cal \;
-}
-
-FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INSANE_SKIP:${PN} = "arch ldflags"
diff --git a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
deleted file mode 100644
index 49a9940..0000000
--- a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit ti-pdk
-require cppi-lld.inc
-
-PR = "${INC_PR}.1"
-
-COMPATIBLE_MACHINE:append = "|c66x"
-
-DEPENDS:append = " rm-lld-rtos \
-                   qmss-lld-rtos \
-"
diff --git a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
deleted file mode 100644
index 0c630b4..0000000
--- a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "TI CPPI low level driver unit test and example binaries"
-DEPENDS = "common-csl-ip rm-lld cppi-lld qmss-lld"
-
-include cppi-lld.inc
-
-PR = "${INC_PR}.0"
-
-CHOICELIST = "yes no"
-
-CFLAGS += "-fcommon"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S}
-		for choice in ${CHOICELIST}
-		do
-			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-do
-	make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
-	done
-}
diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
deleted file mode 100644
index 372fcec..0000000
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/cppi/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
-
-COMPATIBLE_MACHINE = "keystone"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.cppi"
-
-PE = "1"
-
-INC_PR = "r0"
-
-DEVICELIST = "k2h k2k k2l k2e"
-DEVICELIST:k2hk = "k2h k2k"
-DEVICELIST:k2l  = "k2l"
-DEVICELIST:k2e  = "k2e"
-DEVICELIST:k2g  = "k2h"
diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cppi-lld_git.bb
deleted file mode 100644
index 26919b3..0000000
--- a/recipes-bsp/cppi-lld/cppi-lld_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION = "TI CPPI Module low level driver"
-
-DEPENDS = "common-csl-ip rm-lld qmss-lld"
-
-include cppi-lld.inc
-
-PR = "${INC_PR}.1"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}"
-	done
-}
-
-do_install () {
-    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
-    chown -R root:root ${D}
-
-#   Set the generic device library symbolic link to default k2h
-    cd ${D}${libdir}
-
-    # Link only the first device in the list
-    for device in ${DEVICELIST}
-    do
-        ln -sf libcppi_${device}.so.1.0.0 libcppi_device.so.1
-        break
-    done
-    ln -sf libcppi_device.so.1 libcppi_device.so
-}
-
-INHIBIT_PACKAGE_STRIP_FILES:k2hk = "${PKGD}${libdir}/libcppi_k2h.a ${PKGD}${libdir}/libcppi_k2k.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2e = "${PKGD}${libdir}/libcppi_k2e.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2l = "${PKGD}${libdir}/libcppi_k2l.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2g = "${PKGD}${libdir}/libcppi_k2h.a"
-INHIBIT_PACKAGE_STRIP_FILES:append = " ${PKGD}${libdir}/libcppi.a"
diff --git a/recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb b/recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb
deleted file mode 100644
index 5caa07a..0000000
--- a/recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "TI RTOS level driver for Digital Radio Front End"
-
-inherit ti-pdk
-
-require recipes-bsp/dfe-lld/dfe-lld.inc
-
-PR = "${INC_PR}.0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "DFE LLD"
diff --git a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
deleted file mode 100644
index 34b90c7..0000000
--- a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "TI Digital Radio Front End lld test application"
-
-DEPENDS = "common-csl-ip dfe-lld iqn2-lld"
-
-include dfe-lld.inc
-
-PR = "${INC_PR}.0"
-
-EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} DFE_SRC_DIR=${S}"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	oe_runmake clean DEVICE=k2l
-	oe_runmake tests DEVICE=k2l
-	oe_runmake tests DEVICE=k2l USEDYNAMIC_LIB=yes
-}
-
-do_install () {
-	oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}/${bindir}
-}
diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
deleted file mode 100644
index 9ac317d..0000000
--- a/recipes-bsp/dfe-lld/dfe-lld.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1f4217b705bf98762a302fd720649dcc"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.dfe"
-
-PE = "1"
-
-INC_PR = "r0"
-
-COMPATIBLE_MACHINE = "k2l"
-
diff --git a/recipes-bsp/dfe-lld/dfe-lld_git.bb b/recipes-bsp/dfe-lld/dfe-lld_git.bb
deleted file mode 100644
index 622da6f..0000000
--- a/recipes-bsp/dfe-lld/dfe-lld_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Digital Radio Front End low level driver"
-
-DEPENDS = "common-csl-ip"
-
-include dfe-lld.inc
-
-PR = "${INC_PR}.0"
-
-EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
-
-do_compile () {
-	oe_runmake lib DEVICE=k2l
-}
-
-do_install () {
-	oe_runmake install INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
-	chown -R root:root ${D}
-}
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libdfe.a"
diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
deleted file mode 100644
index 8d1fd7c..0000000
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ /dev/null
@@ -1,145 +0,0 @@
-require edma3-lld.inc
-require recipes-ti/includes/ti-paths.inc
-
-PR = "${INC_PR}.1"
-
-DEPENDS = "ti-sysbios ti-xdctools-native gcc-arm-baremetal-native ti-cgt-arm-native ti-cgt6x-native"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PLATFORMLIST = ""
-TARGETLIST = ""
-
-PLATFORMLIST:ti33x = " \
-        am335x-evm \
-"
-
-TARGETLIST:ti33x = " \
-        a8 \
-"
-
-PLATFORMLIST:ti43x = " \
-        am437x-evm \
-"
-
-TARGETLIST:ti43x = " \
-        arm9 \
-"
-
-PLATFORMLIST:omap-a15 = " \
-        tda2xx-evm \
-"
-
-TARGETLIST:omap-a15 = " \
-        66 \
-        a15 \
-        m4 \
-"
-
-PLATFORMLIST:keystone = " \
-        tci6636k2h-evm \
-        tci6638k2k-evm \
-        tci6630k2l-evm \
-        c66ak2e-evm \
-        tci66ak2g02-evm \
-"
-
-TARGETLIST:keystone = " \
-        66 \
-        a15 \
-"
-
-PLATFORMLIST:append:dra7xx-evm = " \
-        tda3xx-evm \
-"
-
-TARGETLIST:c66x = " \
-        66 \
-"
-
-PLATFORMLIST_c665x-evm = " \
-        c6657-evm \
-"
-
-PLATFORMLIST_c667x-evm = " \
-        c6678-evm \
-"
-
-PLATFORMLIST:omapl1 = " \
-        omapl137-evm \
-        omapl138-evm \
-"
-
-TARGETLIST:omapl1 = " \
-        arm9 \
-        674 \
-"
-
-EXTRA_OEMAKE:remove = "TARGET=66"
-FORMAT="ELF"
-
-S = "${WORKDIR}/git"
-
-PARALLEL_MAKE = ""
-
-export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr"
-export XDCCGROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export CGTOOLS = "${XDCCGROOT}"
-export CGTOOLS_ELF = "${XDCCGROOT}"
-export CODEGEN_PATH_DSP = "${XDCCGROOT}"
-export CODEGEN_PATH_DSPELF = "${XDCCGROOT}"
-export TMS470_CGTOOLS = "${M4_TOOLCHAIN_INSTALL_DIR}"
-export UTILS_INSTALL_DIR = "${XDC_INSTALL_DIR}"
-export XDCPATH = "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages"
-export PATH := "${XDC_INSTALL_DIR}:${PATH}"
-export ROOTDIR="${S}"
-export INTERNAL_SW_ROOT="${S}"
-export CROSSCC="${TARGET_PREFIX}gcc"
-export CROSSAR="${TARGET_PREFIX}ar"
-export CROSSLNK="${TARGET_PREFIX}gcc"
-
-do_configure () {
-    rm -rf ${S}/examples/edma3_driver/evmTCI6614
-    rm -rf ${S}/examples/edma3_driver/evmTCI6614BE
-    sed -i -e "s|_config.bld|config.bld|g" ${S}/makerules/env.mk
-    sed -i -e "s|^edma3_lld_PATH =.*$|edma3_lld_PATH = ${S}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_M3 =.*$|CODEGEN_PATH_M3 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_M4 =.*$|CODEGEN_PATH_M4 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_A8 =.*$|CODEGEN_PATH_A8 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_A8_GCC =.*$|CODEGEN_PATH_A8_GCC = ${GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_ARM9 =.*$|CODEGEN_PATH_ARM9 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_A9_GCC =.*$|CODEGEN_PATH_A9_GCC = ${GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_A15 =.*$|CODEGEN_PATH_A15 = ${GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_A15_GCC =.*$|CODEGEN_PATH_A15_GCC = ${GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^UTILS_INSTALL_DIR =.*$|UTILS_INSTALL_DIR = ${XDC_INSTALL_DIR}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^bios_PATH =.*$|bios_PATH = ${SYSBIOS_INSTALL_DIR}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^xdc_PATH =.*$|xdc_PATH = ${XDC_INSTALL_DIR}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_DSP =.*$|CODEGEN_PATH_DSP = ${XDCCGROOT}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_DSPELF =.*$|CODEGEN_PATH_DSPELF = ${XDCCGROOT}|g" ${S}/makerules/env.mk
-
-    cd ${S}/packages
-    ${XDC_INSTALL_DIR}/xdc .interfaces -PR .
-}
-
-do_compile () {
-    cd ${S}/packages
-    for p in ${PLATFORMLIST}
-    do
-        for t in ${TARGETLIST}
-        do
-            make PLATFORM=${p} TARGET=${t} FORMAT=${FORMAT}
-        done
-    done
-}
-
-do_install () {
-    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-    install -d ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS} ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
-}
-
-INSANE_SKIP:${PN}-dev = "arch ldflags file-rdeps"
-
-ALLOW_EMPTY:${PN} = "1"
-FILES:${PN}-dev += "${EDMA3_LLD_INSTALL_DIR_RECIPE}"
diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
deleted file mode 100644
index 34d3170..0000000
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "TI EDMA3 low level driver and test code"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
-
-EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
-EDMA3_LLD_GIT_PROTOCOL = "git"
-EDMA3_LLD_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to version 2.12.05.30E
-EDMA3_LLD_SRCREV = "ce5ced2ac5eb1e0f1515288d279f5690813b5413"
-
-BRANCH = "${EDMA3_LLD_GIT_BRANCH}"
-SRC_URI = "${EDMA3_LLD_GIT_URI};protocol=${EDMA3_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${EDMA3_LLD_SRCREV}"
-
-PV = "2.12.05.30E"
-INC_PR = "r1"
diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld/edma3-lld_git.bb
deleted file mode 100644
index f42d896..0000000
--- a/recipes-bsp/edma3-lld/edma3-lld_git.bb
+++ /dev/null
@@ -1,78 +0,0 @@
-require edma3-lld.inc
-
-PR = "${INC_PR}.0"
-
-COMPATIBLE_MACHINE = "keystone"
-
-DEPENDS = "common-csl-ip"
-
-PLATFORMLIST = "tci6636k2h-evm \
-	tci6636k2h-evm \
-	tci6638k2k-evm \
-	tci6630k2l-evm \
-	c66ak2e-evm \
-	tci66ak2g02-evm \
-	"
-
-PACKAGES =+ "${PN}-test"
-
-FILES:${PN}-test = "${bindir}/*"
-
-S = "${WORKDIR}/git"
-
-do_compile () {
-	cd ${S}/packages
-	for platform in ${PLATFORMLIST}
-	do
-		ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" CROSSAR="${TARGET_PREFIX}ar" \
-		CROSSLNK="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" INTERNAL_SW_ROOT="${S}" make \
-		PLATFORM="$platform" TARGET=a15 TOOLCHAIN_a15=GCC FORMAT=ELF \
-		SONAME=libedma3.so all
-	done
-}
-
-do_install () {
-	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-
-	install -d ${D}/${libdir}
-
-	# Static Libraries
-	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/edma3_lld_drv.aa15fg \
-		${D}/${libdir}/libedma3.a
-	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/release/edma3_lld_rm.aa15fg \
-		${D}/${libdir}/libedma3rm.a
-
-	# Shared Libraries
-	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/libedma* ${D}/${libdir}
-	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/release/libedma* ${D}/${libdir}
-
-	# Copy Headers
-	install -d ${D}/${includedir}/ti/sdo/edma3/drv/
-	install -d ${D}/${includedir}/ti/sdo/edma3/rm
-	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/drv/*.h ${D}/${includedir}/ti/sdo/edma3/drv/
-	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/rm/*.h ${D}/${includedir}/ti/sdo/edma3/rm/
-
-	# Copy Sample Config
-	install -d ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-	cp ${CP_ARGS} ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/evmTCI6636K2HSample.c \
-		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-	cp ${CP_ARGS} ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/evmTCI6638K2KSample.c \
-		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-	cp ${CP_ARGS} ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/evmTCI6630K2LSample.c \
-		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-	cp ${CP_ARGS} ${S}/examples/edma3_user_space_driver/evmC66AK2E/evmC66AK2ESample.c \
-		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-
-	install -d ${D}/${bindir}
-	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/bin/tci6636k2h-evm/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg \
-		${D}/${bindir}/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg
-	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/bin/tci6638k2k-evm/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg \
-		${D}/${bindir}/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg
-	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/bin/tci6630k2l-evm/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg \
-		${D}/${bindir}/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg
-	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmC66AK2E/bin/c66ak2e-evm/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg \
-		${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
-}
-
-INSANE_SKIP:${PN} += "ldflags"
-INSANE_SKIP:${PN}-test += "ldflags"
diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
deleted file mode 100644
index cc8c2ef..0000000
--- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "TI RTOS low level driver for Ethernet MAC (EMAC) peripheral"
-
-inherit ti-pdk
-
-require emac-lld.inc
-
-PR = "r0"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://emacver.h;beginline=1;endline=47;md5=f66bb3695972ca2a85d990a390f45d88"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|c665x-evm|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS:append = " board-rtos osal-rtos"
-DEPENDS:append:ti33x = " starterware-rtos"
-DEPENDS:append:ti43x = " starterware-rtos"
-DEPENDS:append:k2g  = " cppi-lld-rtos qmss-lld-rtos"
-
-DEPENDS:remove:k3 = "board-rtos "
-DEPENDS:append:k3 = " udma-lld-rtos trace-rtos"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_EMAC_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "EMAC LLD"
diff --git a/recipes-bsp/emac-lld/emac-lld.inc b/recipes-bsp/emac-lld/emac-lld.inc
deleted file mode 100644
index eea56b3..0000000
--- a/recipes-bsp/emac-lld/emac-lld.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.emac"
-
-PE = "1"
-
-# The LLD version
diff --git a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
deleted file mode 100644
index 7e5db22..0000000
--- a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "TI FFT Coprocessor (FFTC) low level driver "
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.fftc"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://fftc.h;beginline=1;endline=39;md5=2f1010c47d364414644caf6d30a2b7df"
-
-COMPATIBLE_MACHINE = "k2hk|k2l"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0"
-
-DEPENDS:append= " qmss-lld-rtos \
-                  cppi-lld-rtos \
-"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "FFTC LLD"
diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
deleted file mode 100644
index 6f1ad1b..0000000
--- a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "TI RTOS driver for General Purpose IO (GPIO)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.gpio"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://GPIO.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c667x-evm|c665x-evm|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0"
-
-
-DEPENDS:append = " osal-rtos \
-"
-DEPENDS:append:ti33x = " starterware-rtos \
-"
-DEPENDS:append:ti43x = " starterware-rtos \
-"
-DEPENDS:append:k3 = " sciclient-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_GPIO_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "GPIO LLD"
diff --git a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
deleted file mode 100644
index 808b00b..0000000
--- a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "TI RTOS low level driver for General Purpose Memory Controller (GPMC)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.gpmc"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://GPMC.h;beginline=1;endline=31;md5=485ec97c36f809bf92323fde3e988c72"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-
-PR = "r0"
-
-DEPENDS:append = " osal-rtos \
-"
-DEPENDS:append:ti33x = " starterware-rtos \
-"
-DEPENDS:append:ti43x = " starterware-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "GPMC LLD"
-
-export PDK_GPMC_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
deleted file mode 100644
index e86c1d4..0000000
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "TI RTOS low level driver for Hyperlink peripheral"
-
-inherit ti-pdk
-
-require recipes-bsp/hyplnk-lld/hyplnk-lld.inc
-
-PR = "${INC_PR}.0"
-
-COMPATIBLE_MACHINE:append = "|c66x"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "HYPLNK LLD"
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
deleted file mode 100644
index 31b69c2..0000000
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-include hyplnk-lld.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS = "common-csl-ip hyplnk-lld"
-
-do_compile () {
-	make -f makefile_armv7 clean PDK_INSTALL_PATH="${STAGING_INCDIR}" \
-		HYPLNK_SRC_DIR="${S}"
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 tests examples \
-			PDK_INSTALL_PATH="${STAGING_INCDIR}" \
-			DEVICE="$device" HYPLNK_SRC_DIR="${S}"
-	done
-}
-
-do_install () {
-    for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 installbin \
-			PDK_INSTALL_PATH="${STAGING_INCDIR}" DEVICE="$device" \
-			HYPLNK_SRC_DIR="${S}" \
-			INSTALL_BIN_BASE_DIR="${D}/${bindir}"
-	done
-}
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
deleted file mode 100644
index 02f964b..0000000
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "TI Hyperlink Low Level Driver"
-LICENSE = "BSD-3-Clause"
-
-COMPATIBLE_MACHINE = "k2hk|k2e"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-LLDNAME="hyplnk"
-
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=623325cc19e613a4e770fbb749922592"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.hyplnk"
-
-PE = "1"
-
-INC_PR = "r0"
-
-DEVICELIST:k2hk = "k2h k2k"
-DEVICELIST:k2e  = "k2e"
-
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
deleted file mode 100644
index 690ffac..0000000
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-include hyplnk-lld.inc
-
-PR = "${INC_PR}.1"
-
-DEPENDS = "common-csl-ip"
-
-do_compile () {
-	make -f makefile_armv7 clean PDK_INSTALL_PATH="${STAGING_INCDIR}" \
-		HYPLNK_SRC_DIR="${S}"
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 lib PDK_INSTALL_PATH="${STAGING_INCDIR}"\
-			DEVICE="$device" HYPLNK_SRC_DIR="${S}"
-	done
-}
-
-do_install () {
-	make -f makefile_armv7 install PDK_INSTALL_PATH="${STAGING_INCDIR}" \
-		INSTALL_INC_BASE_DIR="${D}/${includedir}" \
-		INSTALL_LIB_BASE_DIR="${D}${libdir}" HYPLNK_SRC_DIR="${S}"
-	chown -R root:root ${D}
-
-	# Set the generic device library symbolic link to default k2h
-	cd ${D}${libdir}
-
-	# Link only the first device in the list
-	for device in ${DEVICELIST}
-	do
-		ln -sf libhyplnk_${device}.so.1.0.0 libhyplnk_device.so.1
-		break
-	done
-	ln -sf libhyplnk_device.so.1 libhyplnk_device.so
-}
-
-INHIBIT_PACKAGE_STRIP_FILES:k2hk = "${PKGD}${libdir}/libhyplnk_k2h.a ${PKGD}${libdir}/libhyplnk_k2k.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2e = "${PKGD}${libdir}/libhyplnk_k2e.a"
diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
deleted file mode 100644
index 2d06615..0000000
--- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "TI RTOS low level driver for Inter-IC module (I2C)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.i2c"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://I2C.h;beginline=1;endline=32;md5=50084375278c1a2779571be134f98f7c"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-
-PR = "r0"
-
-DEPENDS:append = " osal-rtos \
-"
-DEPENDS:append:ti33x = " starterware-rtos \
-                         pruss-lld-rtos \
-"
-DEPENDS:append:ti43x = " starterware-rtos \
-                         pruss-lld-rtos \
-"
-DEPENDS:append:am57xx-evm = " pruss-lld-rtos \
-"
-
-DEPENDS:append:k2g = " pruss-lld-rtos \
-"
-
-DEPENDS:append:j7 = " sciclient-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-
-export PDK_I2C_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-INSANE_SKIP:${PN} = "arch"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "I2C LLD"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
deleted file mode 100644
index 2cf2bea..0000000
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "TI RTOS low level driver for ICSS-EMAC"
-
-inherit ti-pdk
-require icss-emac-lld.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS:append = " osal-rtos \
-                   pruss-lld-rtos \
-"
-DEPENDS:append:ti33x = " starterware-rtos \
-"
-DEPENDS:append:ti43x = " starterware-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_ICSS_EMAC_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "ICSS-EMAC LLD"
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
deleted file mode 100644
index 2aff00b..0000000
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "TI ICSS-EMAC low level driver tests"
-
-DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal ti-pdk-build-rtos icss-emac-lld-rtos"
-
-DEPENDS:append:ti33x = " starterware"
-DEPENDS:append:ti43x = " starterware"
-
-include icss-emac-lld.inc
-
-PR = "${INC_PR}.0"
-
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMAC_SRC_DIR=${S}"
-
-DEVICE_LIST ?= "${TI_PDK_LIMIT_SOCS}"
-
-do_compile () {
-    # Build the tests
-    for device in ${DEVICE_LIST}
-    do
-        oe_runmake tests DEVICE="$device"
-    done
-}
-
-do_install() {
-    # Install the binary
-    for device in ${DEVICE_LIST}
-    do
-        oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
-    done
-}
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
deleted file mode 100644
index e315c89..0000000
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=76cafd87d8495b42c2355f7681de15a2"
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.icss_emac"
-
-PE = "1"
-
-INC_PR = "r1"
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libicss_emac.a"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
deleted file mode 100644
index ed7748d..0000000
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "TI ICSS-EMAC low level driver library"
-
-DEPENDS = "common-csl-ip pruss-lld osal"
-
-include icss-emac-lld.inc
-
-PR = "${INC_PR}.0"
-
-TARGET_NAME:omap-a15 = "SOC_AM572x"
-TARGET_NAME:ti33x = "SOC_AM335x"
-TARGET_NAME:ti43x = "SOC_AM437x"
-TARGET_NAME:k2g = "SOC_K2G"
-
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} TARGET=${TARGET_NAME}"
-
-do_compile () {
-#   Build the lib
-    oe_runmake clean
-    oe_runmake lib
-}
-
-do_install () {
-#   Install the lib
-    oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
-}
diff --git a/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb b/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
deleted file mode 100644
index f193cb8..0000000
--- a/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "TI RTOS low level driver for IO-Link Master"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.iolink"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://IOLINK.h;beginline=1;endline=32;md5=da669339a4b8594ed3edbe7ca30c726e"
-
-COMPATIBLE_MACHINE = "ti43x"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r2"
-
-DEPENDS:append = " osal-rtos \
-"
-DEPENDS:append:ti43x = " starterware-rtos \
-                         pruss-lld-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-
-export PDK_IOLINK_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-INSANE_SKIP:${PN} = "arch"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "IOLINK LLD"
diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
deleted file mode 100644
index 3fb6884..0000000
--- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
+++ /dev/null
@@ -1,162 +0,0 @@
-SUMMARY = "echo_test for IPC-LLD"
-
-require ipc-lld.inc
-
-inherit update-alternatives
-
-DEPENDS += " ipc-lld-rtos common-csl-ip-rtos sciclient-rtos board-rtos"
-
-REMOTE_FW_DIR = "${S}/examples/yocto_bin"
-REMOTE_FW_BIN_DIR = "${REMOTE_FW_DIR}/ipc_echo_test/bin"
-REMOTE_FWB_BIN_DIR = "${REMOTE_FW_DIR}/ipc_echo_testb/bin"
-RTOS_ALL_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex02_bios_multicore_echo_test/bin"
-RTOS_2_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex01_bios_2core_echo_test/bin"
-LINUX_2_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex03_linux_bios_2core_echo_test/bin"
-LINUX_2_CORES_BAREMETAL_BIN_DIR = "${REMOTE_FW_DIR}/ex04_linux_baremetal_2core_echo_test/bin"
-
-DST_BIN_PATH = "${base_libdir}/firmware/pdk-ipc"
-
-TI_PDK_LIMIT_BOARDS:j7 = "j721e_evm"
-
-do_configure[noexec] = "1"
-
-do_compile() {
-    cd "${PDK_INSTALL_PATH}/ti/build"
-
-    for board in ${TI_PDK_LIMIT_BOARDS}
-    do
-        for core in ${TI_PDK_LIMIT_CORES}
-        do
-            oe_runmake ipc_echo_test BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
-            oe_runmake ex02_bios_multicore_echo_test BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
-            oe_runmake ex01_bios_2core_echo_test BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
-            oe_runmake ex03_linux_bios_2core_echo_test BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
-            oe_runmake ex04_linux_baremetal_2core_echo_test BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
-            oe_runmake ipc_echo_testb BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
-        done
-
-    done
-}
-
-do_install() {
-    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-    install -d ${D}${DST_BIN_PATH}
-
-    cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex02_bios_multicore_echo_test/bin -d ${D}/ex02_bios_multicore_echo_test
-    cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex01_bios_2core_echo_test/bin -d ${D}/ex01_bios_2core_echo_test
-    cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex03_linux_bios_2core_echo_test/bin -d ${D}/ex03_linux_bios_2core_echo_test
-
-    for board in ${TI_PDK_LIMIT_BOARDS}
-    do
-        for core in ${TI_PDK_LIMIT_CORES}
-        do
-            install -m 0644 ${REMOTE_FW_BIN_DIR}/$board/ipc_echo_test_${core}_release* ${D}${DST_BIN_PATH}
-
-            #removing map files copied in previous line
-            rm ${D}${DST_BIN_PATH}/*.map
-        done
-
-        #remove mpu binarires
-        rm ${D}${DST_BIN_PATH}/ipc_echo_test_mpu1_0_release.xa*
-
-    done
-}
-
-do_install:append:j7() {
-    #copy ipc_echo_testb binaries for J721
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_0_release.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_1_release.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_0_release.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_1_release.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_0_release.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_1_release.xer5f ${D}${DST_BIN_PATH}
-
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_0_release_strip.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_1_release_strip.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_0_release_strip.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_1_release_strip.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_0_release_strip.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_1_release_strip.xer5f ${D}${DST_BIN_PATH}
-}
-
-do_install:append:am65xx() {
-    cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex04_linux_baremetal_2core_echo_test/bin -d ${D}/ex04_linux_baremetal_2core_echo_test
-}
-
-# Set up names for the firmwares
-ALTERNATIVE:${PN}:am65xx = "\
-                    am65x-mcu-r5f0_0-fw \
-                    am65x-mcu-r5f0_1-fw \
-                    "
-ALTERNATIVE:${PN}:j7 = "\
-                    j7-mcu-r5f0_0-fw \
-                    j7-mcu-r5f0_1-fw \
-                    j7-main-r5f0_0-fw \
-                    j7-main-r5f0_1-fw \
-                    j7-main-r5f1_0-fw \
-                    j7-main-r5f1_1-fw \
-                    j7-c66_0-fw \
-                    j7-c66_1-fw \
-                    j7-c71_0-fw\
-                    "
-
-# Set up link names for the firmwares
-
-TARGET_MCU_R5FSS0_0:am65xx = "am65x-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:am65xx = "am65x-mcu-r5f0_1-fw"
-
-TARGET_MCU_R5FSS0_0:j7 = "j7-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:j7 = "j7-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0:j7 = "j7-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1:j7 = "j7-main-r5f0_1-fw"
-TARGET_MAIN_R5FSS1_0:j7 = "j7-main-r5f1_0-fw"
-TARGET_MAIN_R5FSS1_1:j7 = "j7-main-r5f1_1-fw"
-TARGET_C66_0:j7 = "j7-c66_0-fw"
-TARGET_C66_1:j7 = "j7-c66_1-fw"
-TARGET_C7X:j7 = "j7-c71_0-fw"
-
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
-
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
-ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
-ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X}"
-
-# Create the firmware alternatives
-
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
-
-ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-c66_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release_strip.xe66"
-ALTERNATIVE_TARGET[j7-c66_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66"
-ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
-
-ALTERNATIVE_PRIORITY = "10"
-
-#add source and all rtos binaries package
-PACKAGES =+ "${PN}-rtos"
-
-# make sure that lib/firmware, and all its contents are part of the package
-FILES:${PN} += "${base_libdir}/firmware"
-
-FILES:${PN}-rtos += "ex02_bios_multicore_echo_test"
-FILES:${PN}-rtos += "ex01_bios_2core_echo_test"
-FILES:${PN}-rtos += "ex03_linux_bios_2core_echo_test"
-FILES:${PN}-rtos += "ex04_linux_baremetal_2core_echo_test"
-
-INSANE_SKIP:${PN} = "arch ldflags file-rdeps"
-INSANE_SKIP:${PN}-rtos = "arch ldflags file-rdeps"
-
-INSANE_SKIP:${PN}-dbg = "arch"
diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
deleted file mode 100644
index efc5656..0000000
--- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
+++ /dev/null
@@ -1,196 +0,0 @@
-SUMMARY = "R5 and DSP IPC Echo Test Firmware Binaries"
-
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
-
-inherit deploy
-inherit update-alternatives
-
-COMPATIBLE_MACHINE = "k3"
-
-PV = "1.0-git${SRCPV}"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PROTOCOL = "git"
-BRANCH = "master"
-SRCREV = "c9f7cfe61b67998a053fe145344ce0c9b5bb22aa"
-
-SRC_URI = "git://git.ti.com/keystone-rtos/ipc-lld.git;protocol=${PROTOCOL};branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-AM65X_R5_FW_DIR = "${S}/examples/echo_test/binaries/am65xx"
-J721E_R5_DSP_FW_DIR = "${S}/examples/echo_test/binaries/j721e"
-
-PLATFORM:am65xx = "am65xx"
-PLATFORM:j7 = "j7-evm"
-
-# make sure that lib/firmware, and all its contents are part of the package
-FILES:${PN} += "${base_libdir}/firmware"
-
-# install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
-do_install() {
-    install -d ${D}${base_libdir}/firmware/pdk-ipc
-}
-
-do_install:append:am65xx() {
-    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-}
-
-do_install:append:j7() {
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
-}
-
-# Set up names for the firmwares
-ALTERNATIVE:${PN}:am65xx = "\
-                    am65x-mcu-r5f0_0-fw \
-                    am65x-mcu-r5f0_1-fw \
-                    "
-ALTERNATIVE:${PN}:j7 = "\
-                    j7-mcu-r5f0_0-fw \
-                    j7-mcu-r5f0_1-fw \
-                    j7-main-r5f0_0-fw \
-                    j7-main-r5f0_1-fw \
-                    j7-main-r5f1_0-fw \
-                    j7-main-r5f1_1-fw \
-                    j7-c66_0-fw \
-                    j7-c66_1-fw \
-                    j7-c71_0-fw\
-                    "
-
-# Set up link names for the firmwares
-
-TARGET_MCU_R5FSS0_0:am65xx = "am65x-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:am65xx = "am65x-mcu-r5f0_1-fw"
-
-TARGET_MCU_R5FSS0_0:j7 = "j7-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:j7 = "j7-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0:j7 = "j7-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1:j7 = "j7-main-r5f0_1-fw"
-TARGET_MAIN_R5FSS1_0:j7 = "j7-main-r5f1_0-fw"
-TARGET_MAIN_R5FSS1_1:j7 = "j7-main-r5f1_1-fw"
-TARGET_C66_0:j7 = "j7-c66_0-fw"
-TARGET_C66_1:j7 = "j7-c66_1-fw"
-TARGET_C7X:j7 = "j7-c71_0-fw"
-
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
-
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
-ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
-ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X}"
-
-# Create the firmware alternatives
-
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release.strip.xer5f"
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release.strip.xer5f"
-
-ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release.strip.xer5f"
-ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release.strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release.strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release.strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release.strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release.strip.xer5f"
-ALTERNATIVE_TARGET[j7-c66_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release.strip.xe66"
-ALTERNATIVE_TARGET[j7-c66_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release.strip.xe66"
-ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release.strip.xe71"
-
-ALTERNATIVE_PRIORITY = "10"
-
-# copy the executables into the deploy directory
-
-do_deploy() {
-    :
-}
-
-do_deploy:am65xx() {
-    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
-    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
-    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
-    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
-}
-
-do_deploy:j7() {
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.xer5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip.xe66 ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip.xe66 ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe71 ${DEPLOYDIR}/
-}
-
-addtask deploy after do_install before do_build
-
-# This is used to prevent the build system to strip the executables
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-# This is used to prevent the build system to split the debug info in a separate file
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
-INSANE_SKIP:${PN} += "arch"
-
-# we don't want to configure and build the source code
-do_compile[noexec] = "1"
-do_configure[noexec] = "1"
diff --git a/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb
deleted file mode 100644
index 34f1f03..0000000
--- a/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "TI RTOS low level driver for IPC"
-
-require ipc-lld.inc
-
-DEPENDS += " osal-rtos common-csl-ip-rtos sciclient-rtos"
-
-do_configure() {
-    # remove any previous package
-    rm -rf ${IPCLLD_PACKAGE_BASE}
-    cd ${S}
-
-    mkdir -p ${IPCLLD_ROOTPATH}
-
-    for board in ${TI_PDK_LIMIT_BOARDS}
-    do
-        # make the release package before building it
-        oe_runmake package BOARD=$board DEST_ROOT=${IPCLLD_PACKAGE_BASE} PDK_IPC_COMP_PATH=${S}
-    done
-
-}
-
-do_compile() {
-    cd ${IPCLLD_ROOTPATH}
-
-    oe_runmake lib LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" PDK_IPC_COMP_PATH=${IPCLLD_ROOTPATH}
-}
-
-do_install() {
-    cd ${IPCLLD_ROOTPATH}
-
-    #remove prebuilt binaries
-    rm -rf examples/echo_test/binaries
-
-    #archive
-    tar -cf ipc-lld.tar --exclude='*.tar' ./*
-
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/ipc
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/ipc \;
-}
-
-FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INSANE_SKIP:${PN} = "arch ldflags file-rdeps"
-
-INSANE_SKIP:${PN}-dbg = "arch"
diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-lld.inc
deleted file mode 100644
index 6537f52..0000000
--- a/recipes-bsp/ipc-lld/ipc-lld.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.ipc"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
-
-COMPATIBLE_MACHINE = "k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r4"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-IPCLLD_PACKAGE_BASE   = "${WORKDIR}/ipclld_base"
-IPCLLD_ROOTPATH = "${IPCLLD_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/ipc"
-
-export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
-export PDK_IPC_ROOT_PATH = "${IPCLLD_PACKAGE_BASE}/package/all/pdk_/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "IPCLLD"
-
-EXTRA_OEMAKE = "PDK_INSTALL_PATH=${PDK_INSTALL_PATH} "
-
-TI_PDK_LIMIT_CORES:append:am65xx-evm = " mcu1_1 "
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb
deleted file mode 100644
index 318f1cf..0000000
--- a/recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "TI RTOS low level driver for IQN2 peripheral module"
-
-inherit ti-pdk
-
-require recipes-bsp/iqn2-lld/iqn2-lld.inc
-
-PR = "${INC_PR}.0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "IQN2 LLD"
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
deleted file mode 100644
index f276c4b..0000000
--- a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "TI IQN2 peripheral module low level driver test binaries"
-
-DEPENDS = "common-csl-ip iqn2-lld dfe-lld"
-
-include iqn2-lld.inc
-
-PR = "${INC_PR}.0"
-
-EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} IQN2_SRC_DIR=${WORKDIR}/git"
-
-do_compile () {
-	oe_runmake clean DEVICE=k2l
-	oe_runmake tests DEVICE=k2l
-}
-
-do_install () {
-	oe_runmake installbin DEVICE=k2l IQN2_SRC_DIR=${WORKDIR}/git INSTALL_BIN_BASE_DIR=${D}/${bindir}
-}
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
deleted file mode 100644
index 078509f..0000000
--- a/recipes-bsp/iqn2-lld/iqn2-lld.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
-LICENSE = "BSD-3-Clause"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.iqn2"
-
-PE = "1"
-
-INC_PR = "r0"
-
-COMPATIBLE_MACHINE = "k2l"
-
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
deleted file mode 100644
index a0c2ef8..0000000
--- a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "TI IQN2 peripheral module low level driver"
-
-DEPENDS = "common-csl-ip"
-
-include iqn2-lld.inc
-
-PR = "${INC_PR}.0"
-
-EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
-
-do_configure () {
-	sed -i -e 's/march=armv7-a/march=armv7ve/' build/armv7/libiqn2_aearmv7.mk
-}
-
-do_compile () {
-	oe_runmake clean
-	oe_runmake lib
-}
-
-do_install () {
-	oe_runmake install INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
-	chown -R root:root ${D}
-}
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libiqn2.a"
diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
deleted file mode 100644
index 9d45f0d..0000000
--- a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "TI RTOS low level driver for Multi channel Audio Serial port (McASP)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.mcasp"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://mcaspver.h;beginline=19;endline=47;md5=75a9adc782a6df0d3a5419743e9a9f18"
-
-COMPATIBLE_MACHINE = "ti43x|omap-a15|k2g|ti33x|omapl1|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-
-PR = "r0"
-
-
-DEPENDS:append = " edma3-lld-rtos \
-                   osal-rtos \
-"
-DEPENDS:append:ti43x = " starterware-rtos \
-"
-DEPENDS:append:ti33x = " starterware-rtos \
-"
-
-DEPENDS:remove:k3 = "edma3-lld-rtos "
-DEPENDS:append:k3 = " udma-lld-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_MCASP_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH:append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "MCASP LLD"
diff --git a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
deleted file mode 100644
index f1eeccd..0000000
--- a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "TI RTOS low level driver for Multi-channel Buffered Serial Port (McBSP)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.mcbsp"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://mcbspver.h;beginline=1;endline=47;md5=a8a39efd13fa6fe66da5461b898d620e"
-
-COMPATIBLE_MACHINE = "k2g|c665x-evm|omapl1"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0"
-
-
-DEPENDS:append = " edma3-lld-rtos \
-"
-
-export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH:append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
-
-TI_PDK_XDCMAKE = "0"
-
-export PDK_MCBSP_ROOT_PATH = "${WORKDIR}/build"
-export DEST_ROOT = "${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "MCBSP LLD"
diff --git a/recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb b/recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb
deleted file mode 100644
index faee597..0000000
--- a/recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit ti-pdk
-
-require recipes-bsp/mmap-lld/mmap-lld.inc
-
-PR = "${INC_PR}.0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "MMAP LLD"
diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
deleted file mode 100644
index 0c3cedd..0000000
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION = "TI KEYSTONE MMAP driver test binaries "
-include mmap-lld.inc
-
-PR = "${INC_PR}.0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS="common-csl-ip mmap-lld"
-RDEPENDS:${PN}="uio-module-drv"
-
-DEVICELIST:k2hk = "k2h k2k"
-DEVICELIST:k2e = "k2e"
-DEVICELIST:k2l = "k2l"
-DEVICELIST:k2g = "k2g"
-
-CHOICELIST = " yes \
-               no \
-"
-
-do_compile () {
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 clean \
-			PDK_INSTALL_PATH="${STAGING_INCDIR}" \
-			DEVICE="$device" MPAX_SRC_DIR="${S}"
-		for choice in ${CHOICELIST}
-		do
-			make -f makefile_armv7 tests examples \
-				PDK_INSTALL_PATH=${STAGING_INCDIR} \
-				DEVICE="$device" MPAX_SRC_DIR="${S}" \
-				USEDYNAMIC_LIB="$choice"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 installbin \
-		PDK_INSTALL_PATH=${STAGING_INCDIR} \
-		DEVICE="$device" MPAX_SRC_DIR="${S}" \
-		INSTALL_BIN_BASE_DIR="${D}/${bindir}"
-	done
-}
diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
deleted file mode 100644
index 7e11a4c..0000000
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-LICENSE = "BSD-3-Clause"
-
-COMPATIBLE_MACHINE = "keystone"
-
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
-
-MMAP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git"
-MMAP_LLD_GIT_PROTOCOL = "git"
-MMAP_LLD_GIT_BRANCH = "master"
-MMAP_LLD_GIT_DESTSUFFIX = "git/ti/runtime/mmap"
-
-# Commit correspond to DEV.MMAP.02.00.00.08C
-MMAP_LLD_SRCREV = "62e75191ab7144604102dabaa288c5fd5048fc49"
-
-BRANCH="${MMAP_LLD_GIT_BRANCH}"
-SRC_URI = "${MMAP_LLD_GIT_URI};destsuffix=${MMAP_LLD_GIT_DESTSUFFIX};protocol=${MMAP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${MMAP_LLD_SRCREV}"
-
-PV = "2.0.0.8C"
-INC_PR = "r0"
-
-S = "${WORKDIR}/git/ti/runtime/mmap"
diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-lld/mmap-lld_git.bb
deleted file mode 100644
index cfc5d4c..0000000
--- a/recipes-bsp/mmap-lld/mmap-lld_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "TI KEYSTONE mmap driver using Keystone MPAX Programming"
-include mmap-lld.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS="common-csl-ip"
-
-do_compile () {
-	make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
-}
-
-do_install () {
-	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
-	chown -R root:root ${D}
-}
diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
deleted file mode 100644
index 3be9f55..0000000
--- a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "TI Multimedia card(MMC)/Secure Digital(SD) low level driver for RTOS "
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.mmcsd"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://MMCSD.h;beginline=1;endline=32;md5=f74069541d4d165a000a66b4043cb065"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-
-PR = "r0"
-
-
-DEPENDS:append = " edma3-lld-rtos \
-                   osal-rtos \
-"
-DEPENDS:append:ti33x = " starterware-rtos \
-"
-DEPENDS:append:ti43x = " starterware-rtos \
-"
-DEPENDS:remove:k3 = "edma3-lld-rtos "
-
-DEPENDS:append:k3 = " sciclient-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_MMCSD_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH:append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "MMCSD LLD"
diff --git a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb b/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
deleted file mode 100644
index 3153f08..0000000
--- a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "TI Network abstraction layer RTOS LLD library "
-
-inherit ti-pdk
-
-require recipes-bsp/nwal-lld/nwal-lld.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS:append = " cppi-lld-rtos \
-                   pa-lld-rtos \
-                   pktlib-rtos \
-                   qmss-lld-rtos \
-                   sa-lld-rtos \
-"
-
-COMPATIBLE_MACHINE = "k2hk|k2e|k2l|c667x-evm"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "NWAL LLD"
diff --git a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
deleted file mode 100644
index 79528a0..0000000
--- a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "TI Network Abstraction Layer unit test binaries"
-
-DEPENDS = "common-csl-ip rm-lld qmss-lld hplib pa-lld sa-lld pktlib nwal-lld"
-
-include nwal-lld.inc
-
-PR = "${INC_PR}.0"
-
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
-
-do_compile () {
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake clean NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice" DEVICE="$device"
-			oe_runmake tests NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice" DEVICE="$device"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake installbin INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
-	done
-}
diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
deleted file mode 100644
index 8dd2c90..0000000
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
-
-COMPATIBLE_MACHINE = "keystone"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.nwal"
-
-PE = "1"
-
-INC_PR = "r0"
-
-BASEDIR = "${WORKDIR}/git"
-
-DEVICELIST:k2hk = "k2h k2k"
-DEVICELIST:k2l  = "k2l"
-DEVICELIST:k2e  = "k2e"
-
-CHOICELIST = "yes no"
diff --git a/recipes-bsp/nwal-lld/nwal-lld_git.bb b/recipes-bsp/nwal-lld/nwal-lld_git.bb
deleted file mode 100644
index a9690ca..0000000
--- a/recipes-bsp/nwal-lld/nwal-lld_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "TI Network abstraction layer LLD library "
-
-DEPENDS = "common-csl-ip rm-lld qmss-lld hplib pa-lld sa-lld pktlib"
-
-include nwal-lld.inc
-
-PR = "${INC_PR}.0"
-
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
-
-do_compile () {
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake clean NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice" DEVICE="$device"
-			oe_runmake lib NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice" DEVICE="$device"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
-	done
-}
diff --git a/recipes-bsp/pa-lld/pa-lld-rtos_git.bb b/recipes-bsp/pa-lld/pa-lld-rtos_git.bb
deleted file mode 100644
index 046ec80..0000000
--- a/recipes-bsp/pa-lld/pa-lld-rtos_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "TI RTOS low level driver for Packet Accelerator (PA)"
-
-inherit ti-pdk
-
-require recipes-bsp/pa-lld/pa-lld.inc
-COMPATIBLE_MACHINE:append = "|c667x-evm"
-PR = "${INC_PR}.0"
-
-DEPENDS:append = " rm-lld-rtos"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "PA LLD"
diff --git a/recipes-bsp/pa-lld/pa-lld-test_git.bb b/recipes-bsp/pa-lld/pa-lld-test_git.bb
deleted file mode 100644
index 760f188..0000000
--- a/recipes-bsp/pa-lld/pa-lld-test_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "TI PA LLD unit test and example binaries"
-
-DEPENDS = "common-csl-ip pa-lld cppi-lld qmss-lld sa-lld"
-
-include pa-lld.inc
-
-PR = "${INC_PR}.1"
-
-CHOICELIST = "yes no"
-
-CC += "-fcommon"
-
-do_compile () {
-# Now build the lld unit test examples
-	for device in ${DEVICELIST}
-	do
-	make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S}
-		for choice in ${CHOICELIST}
-		do
-			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
-	done
-}
diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
deleted file mode 100644
index e456ccb..0000000
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-LICENSE = "BSD-3-Clause & TI-TFL"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
-
-COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.pa"
-
-PE = "1"
-
-INC_PR = "r0"
-
-
-DEVICELIST = "k2h k2k k2l k2e"
-DEVICELIST:k2hk = "k2h k2k"
-DEVICELIST:k2l = "k2l"
-DEVICELIST:k2e = "k2e"
-
-LIBPA = "libpa"
-LIBPA:k2hk = "libpa"
-LIBPA:k2e = "libpa2"
-LIBPA:k2l = "libpa2"
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
deleted file mode 100644
index bd773b1..0000000
--- a/recipes-bsp/pa-lld/pa-lld_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "TI PA LLD library"
-
-DEPENDS = "common-csl-ip rm-lld"
-
-include pa-lld.inc
-
-PR = "${INC_PR}.1"
-
-do_compile () {
-#   Now build the lld in the updated directory
-    for device in ${DEVICELIST}
-    do
-        make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device"
-    done
-}
-
-do_install () {
-    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
-    chown -R root:root ${D}
-
-#   Set the generic device library symbolic link
-    ln -sf ${LIBPA}.so.1.0.0 ${D}${libdir}/libpa_device.so.1
-    ln -sf libpa_device.so.1 ${D}${libdir}/libpa_device.so
-}
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libpa2.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2hk = "${PKGD}${libdir}/libpa.a"
diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
deleted file mode 100644
index 2271570..0000000
--- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "TI RTOS low lever driver for Peripheral Interconnect Express (PCIE)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.pcie"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://pcie.h;beginline=1;endline=34;md5=232c0b07bdf7ab934b23c09e6c5279b0"
-
-COMPATIBLE_MACHINE = "omap-a15|keystone|c66x|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r1"
-
-DEPENDS:append:k3 = " udma-lld-rtos \
-"
-
-
-export PDK_PCIE_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "PCIe LLD"
diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
deleted file mode 100644
index fd01c8e..0000000
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ /dev/null
@@ -1,71 +0,0 @@
-SUMMARY = "TI RTOS driver for Power Management module (PM)"
-
-inherit ti-pdk
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://Power.h;beginline=1;endline=31;md5=527b91fdcd26cd19ac07a754f45dedbe"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-
-PM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pm-lld.git"
-PM_LLD_GIT_PROTOCOL = "git"
-
-PM_LLD_GIT_BRANCH = "master"
-
-PM_LLD_GIT_BRANCH:ti33x = "int_pm_am335x"
-PM_LLD_GIT_BRANCH:ti43x = "int_pm_am335x"
-PM_LLD_GIT_BRANCH:k2g = "int_pm_am335x"
-
-PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
-
-# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.23A"
-PM_LLD_SRCREV = "59abc6ffb890d24b82de0248d204ad10c1bfc2af"
-
-# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05C"
-PM_LLD_SRCREV:ti33x = "dd1f8486e7738956631b7f4829c8238be2e49dd6"
-PM_LLD_SRCREV:ti43x = "dd1f8486e7738956631b7f4829c8238be2e49dd6"
-PM_LLD_SRCREV:k2g = "dd1f8486e7738956631b7f4829c8238be2e49dd6"
-
-BRANCH = "${PM_LLD_GIT_BRANCH}"
-SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${PM_LLD_SRCREV}"
-PV = "01.08.00.23A"
-PR = "r0"
-
-S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
-
-DEPENDS:append = " ti-sysbios \
-            osal-rtos \
-"
-DEPENDS:append:ti33x = " starterware-rtos \
-"
-DEPENDS:append:ti43x = " starterware-rtos \
-"
-
-DEPENDS:append:k3 = " sciclient-rtos \
-"
-
-export PDK_PM_ROOT_PATH = "${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-do_compile:append() {
-    # Delete archive created by XDC release command since it does not contain all content
-    find -name "*.tar" -exec rm -f {} \;
-
-    # Archive from build/ to capture ti/drv/pm/ in archive
-    cd ${B}
-    tar -cf pm_lld.tar --exclude='*.tar' ./*
-}
-
-
-# Workaround: dra7xx build requires am57xx pm libraries for opencl-monitor
-TI_PDK_LIMIT_SOCS:append:dra7xx = " am571x am572x am574x"
-TI_PDK_LIMIT_BOARDS:append:dra7xx = " evmAM571x evmAM572x idkAM574x"
-
-INSANE_SKIP:${PN} = "arch staticdev"
diff --git a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb b/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
deleted file mode 100644
index 74ceb81..0000000
--- a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "TI PRUSS low level driver example applications"
-
-DEPENDS="common-csl-ip pruss-lld osal ti-pdk-build-rtos pruss-lld-rtos"
-
-DEPENDS:append:ti33x = " starterware"
-DEPENDS:append:ti43x = " starterware"
-
-include pruss-lld.inc
-
-PR = "${INC_PR}.0"
-
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages PRUSS_SRC_DIR=${S}"
-
-
-DEVICE_LIST ?= "${TI_PDK_LIMIT_SOCS}"
-
-do_compile () {
-#   Build the apps
-    for device in ${DEVICE_LIST}
-    do
-        oe_runmake apps DEVICE="$device"
-    done
-}
-
-do_install () {
-#   Install the app binary
-    for device in ${DEVICE_LIST}
-    do
-        oe_runmake installapp INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
-    done
-}
diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
deleted file mode 100644
index 9b6ec7a..0000000
--- a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "TI RTOS low level driver library for PRUSS"
-
-inherit ti-pdk
-require recipes-bsp/pruss-lld/pruss-lld.inc
-
-COMPATIBLE_MACHINE:append = "|k3"
-PR = "${INC_PR}.0"
-
-DEPENDS:append = " osal-rtos"
-DEPENDS:append:ti33x = " starterware-rtos"
-DEPENDS:append:ti43x = " starterware-rtos"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_PRUSS_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${WORKDIR}/build"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "PRUSS LLD"
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
deleted file mode 100644
index 8007f65..0000000
--- a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "TI PRUSS low level driver tests"
-
-DEPENDS = "common-csl-ip pruss-lld osal"
-
-include pruss-lld.inc
-
-PR = "${INC_PR}.2"
-
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PRUSS_SRC_DIR=${S}"
-
-DEVICE_LIST ?= "${TI_PDK_LIMIT_SOCS}"
-
-do_compile () {
-#   Build the tests
-    for device in ${DEVICE_LIST}
-    do
-        oe_runmake tests DEVICE="$device"
-    done
-}
-
-do_install () {
-#   Install the binary
-    for device in ${DEVICE_LIST}
-    do
-        oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
-    done
-}
diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/pruss-lld.inc
deleted file mode 100644
index fe5987a..0000000
--- a/recipes-bsp/pruss-lld/pruss-lld.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://pruicss.h;beginline=1;endline=31;md5=315177aa03d58bcd124a6e799e2bd458"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.pruss"
-
-PE = "1"
-
-INC_PR = "r0"
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libpruss.a"
diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bb b/recipes-bsp/pruss-lld/pruss-lld_git.bb
deleted file mode 100644
index f1e93cd..0000000
--- a/recipes-bsp/pruss-lld/pruss-lld_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "TI PRUSS low level driver library"
-
-DEPENDS = "common-csl-ip osal"
-
-include pruss-lld.inc
-
-PR = "${INC_PR}.2"
-
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
-
-do_compile () {
-#   Build the lib
-    oe_runmake clean
-    oe_runmake lib
-}
-
-do_install () {
-#   Install the lib
-    oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
-    chown -R root:root ${D}
-}
diff --git a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
deleted file mode 100644
index d854e0b..0000000
--- a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-inherit ti-pdk
-
-require qmss-lld.inc
-
-PR = "${INC_PR}.1"
-
-COMPATIBLE_MACHINE:append = "|c66x"
-
-DEPENDS:append = " rm-lld-rtos"
diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
deleted file mode 100644
index 53f6dcf..0000000
--- a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "TI QMSS low level driver unit test and example binaries"
-
-DEPENDS = "common-csl-ip rm-lld cppi-lld qmss-lld cmem uio-module-drv"
-
-include qmss-lld.inc
-
-PR = "${INC_PR}.2"
-
-CHOICELIST = "yes no"
-
-CFLAGS += "-fcommon"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S}
-		for choice in ${CHOICELIST}
-		do
-			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
-	done
-}
diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
deleted file mode 100644
index 35a06af..0000000
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-LICENSE = "BSD-3-Clause & TI-TFL"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
-
-COMPATIBLE_MACHINE = "keystone"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.qmss"
-
-PE = "1"
-
-INC_PR = "r0"
-
-DEVICELIST = "k2h k2k k2l k2e"
-DEVICELIST:k2hk = "k2h k2k"
-DEVICELIST:k2l = "k2l"
-DEVICELIST:k2e = "k2e"
-DEVICELIST:k2g = "k2h"
diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/qmss-lld_git.bb
deleted file mode 100644
index 96c664a..0000000
--- a/recipes-bsp/qmss-lld/qmss-lld_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION = "TI QMSS low level driver library"
-
-DEPENDS = "common-csl-ip rm-lld"
-
-include qmss-lld.inc
-
-PR = "${INC_PR}.1"
-
-do_compile () {
-#   Now build the lld
-    make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}"
-	done
-}
-
-do_install () {
-    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
-    chown -R root:root ${D}
-
-    # Set the generic device library symbolic link to default k2h
-    cd ${D}${libdir}
-
-    # Link only the first device in the list
-    for device in ${DEVICELIST}
-    do
-        ln -sf libqmss_${device}.so.1.0.0 libqmss_device.so.1
-        break
-    done
-    ln -sf libqmss_device.so.1 libqmss_device.so
-}
-
-INHIBIT_PACKAGE_STRIP_FILES:k2hk = "${PKGD}${libdir}/libqmss_k2h.a ${PKGD}${libdir}/libqmss_k2k.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2e = "${PKGD}${libdir}/libqmss_k2e.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2l = "${PKGD}${libdir}/libqmss_k2l.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2g = "${PKGD}${libdir}/libqmss_k2h.a"
-INHIBIT_PACKAGE_STRIP_FILES:append = " ${PKGD}${libdir}/libqmss.a"
diff --git a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
deleted file mode 100644
index 2a279a0..0000000
--- a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-inherit ti-pdk
-
-COMPATIBLE_MACHINE:append = "|c66x"
-
-require rm-lld.inc
-
-PR = "${INC_PR}.2"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "RM LLD"
-
diff --git a/recipes-bsp/rm-lld/rm-lld.inc b/recipes-bsp/rm-lld/rm-lld.inc
deleted file mode 100644
index e6e61af..0000000
--- a/recipes-bsp/rm-lld/rm-lld.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "TI Resource Manager Low Level Driver"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.rm"
-
-PE = "1"
-
-INC_PR = "r0"
-
-COMPATIBLE_MACHINE = "keystone"
-
-BASEDIR = "${WORKDIR}/git"
diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
deleted file mode 100644
index 86f7ec7..0000000
--- a/recipes-bsp/rm-lld/rm-lld_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require rm-lld.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS = "ti-ipc libdaemon"
-
-PACKAGES =+ "${PN}-test"
-
-FILES:${PN}-test = "${bindir}/rmDspClientTest.out \
-                    ${bindir}/rmLinuxClientTest.out \
-                    ${bindir}/rmLinuxMtClientTest.out \
-                    ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
-
-CHOICELIST = "yes no"
-
-do_compile () {
-#   Now build the lld
-    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} RM_SRC_DIR=${S}
-    for choice in ${CHOICELIST}
-    do
-      make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} PDK_INSTALL_PATH=${BASEDIR} USEDYNAMIC_LIB="$choice"
-    done
-}
-
-do_install () {
-    install -d ${D}${includedir}/ti/drv/rm
-    install -d ${D}${libdir}
-    install -d ${D}${bindir}
-    make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir}
-    chown -R root:root ${D}
-}
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/librm.a"
diff --git a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
deleted file mode 100644
index b7c0257..0000000
--- a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "TI RTOS low level driver for Security Accelerator (SA)"
-
-inherit ti-pdk
-
-require recipes-bsp/sa-lld/sa-lld.inc
-
-PR = "${INC_PR}.0"
-
-COMPATIBLE_MACHINE:append = "|c667x-evm|k3"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE:k3 = "0"
-
-# SA promote/demote library depends on osal
-DEPENDS:append = " osal-rtos \
-"
-export PDK_SA_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-INSANE_SKIP:${PN} = "arch"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "SA LLD"
-
diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
deleted file mode 100644
index b403aff..0000000
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-DESCRIPTION = "TI Security Accelerator LLD (SA LLD) Examples"
-
-DEPENDS = "common-csl-ip cppi-lld qmss-lld pa-lld sa-lld"
-
-include sa-lld.inc
-
-PR = "${INC_PR}.1"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEVICELIST:k2hk = "k2h k2k"
-DEVICELIST:k2l  = "k2l"
-DEVICELIST:k2e  = "k2e"
-
-CHOICELIST = "no yes"
-
-CFLAGS += "-fcommon"
-
-PARALLEL_MAKE = ""
-EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} SA_SRC_DIR=${S}"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	for device in ${DEVICELIST}
-	do
-		oe_runmake clean DEVICE="$device"
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake examples utils DEVICE="$device" USEDYNAMIC_LIB="$choice"
-		done
-	done
-}
-
-do_install () {
-	install -d ${D}${bindir}/ti/drv/sa/example/SaBasicExample/vectors
-
-# copy all the test vectors
-	find example/SaBasicExample/vectors -name *.bin -type f | xargs -I {} cp --parents {} ${D}${bindir}/ti/drv/sa
-
-	for device in ${DEVICELIST}
-	do
-		oe_runmake installbin DEVICE="$device" INSTALL_BIN_BASE_DIR=${D}${bindir}
-	done
-}
-
-INSANE_SKIP:${PN} = "ldflags"
diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
deleted file mode 100644
index d4993cb..0000000
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-LICENSE = "BSD-3-Clause & TI-TFL"
-COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
-
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
-
-SA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/sa-lld.git"
-SA_LLD_GIT_PROTOCOL = "git"
-SA_LLD_GIT_BRANCH = "master"
-SA_LLD_GIT_DESTSUFFIX = "git/ti/drv/sa"
-
-# Below commit ID corresponding to "DEV.SA_LLD.04.00.00.03D"
-SA_LLD_SRCREV = "506491b586c13c90f307b527df5eaacd35af6d02"
-
-BRANCH = "${SA_LLD_GIT_BRANCH}"
-SRC_URI = "${SA_LLD_GIT_URI};destsuffix=${SA_LLD_GIT_DESTSUFFIX};protocol=${SA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${SA_LLD_SRCREV}"
-
-PV = "04.00.00.03D"
-INC_PR = "r0"
-
-S = "${WORKDIR}/${SA_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/sa-lld/sa-lld_git.bb b/recipes-bsp/sa-lld/sa-lld_git.bb
deleted file mode 100644
index a45fe1f..0000000
--- a/recipes-bsp/sa-lld/sa-lld_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "TI Security Accelerator LLD (SA LLD) Library"
-
-DEPENDS = "common-csl-ip"
-
-include sa-lld.inc
-
-PR = "${INC_PR}.1"
-
-PARALLEL_MAKE = ""
-EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	oe_runmake clean lib
-}
-
-do_install () {
-	oe_runmake install INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
-	chown -R root:root ${D}
-
-#   Set the generic device library symbolic link
-	ln -sf libsa.so.1.0.0 ${D}${libdir}/libsa_device.so.1
-	ln -sf libsa_device.so.1 ${D}${libdir}/libsa_device.so
-}
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libsa.a"
diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
deleted file mode 100644
index 43cf0c3..0000000
--- a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "TI RTOS low level driver for Serial Peripheral Interface (SPI)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.spi"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://SPI.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0"
-
-DEPENDS:append = " osal-rtos \
-                   edma3-lld-rtos \
-"
-DEPENDS:append:ti33x = " starterware-rtos pruss-lld-rtos gpio-lld-rtos"
-DEPENDS:append:ti43x = " starterware-rtos pruss-lld-rtos gpio-lld-rtos"
-
-DEPENDS:remove:k3 = "edma3-lld-rtos "
-DEPENDS:append:k3 = " udma-lld-rtos"
-
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_SPI_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH:append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "SPI LLD"
diff --git a/recipes-bsp/srio-lld/srio-lld-rtos_git.bb b/recipes-bsp/srio-lld/srio-lld-rtos_git.bb
deleted file mode 100644
index 9c53575..0000000
--- a/recipes-bsp/srio-lld/srio-lld-rtos_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "TI RTOS low level driver for Serial Rapid IO (SRIO)"
-
-inherit ti-pdk
-
-require recipes-bsp/srio-lld/srio-lld.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS:append = " cppi-lld-rtos \
-                   qmss-lld-rtos \
-"
-COMPATIBLE_MACHINE:append = "|c66x"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "SRIO LLD"
diff --git a/recipes-bsp/srio-lld/srio-lld-test_git.bb b/recipes-bsp/srio-lld/srio-lld-test_git.bb
deleted file mode 100644
index ca22b7d..0000000
--- a/recipes-bsp/srio-lld/srio-lld-test_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "TI SRIO peripheral low level driver unit test and example binaries"
-DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld srio-lld cmem uio-module-drv"
-
-include srio-lld.inc
-
-PR = "${INC_PR}.0"
-
-CHOICELIST = "yes no"
-
-CFLAGS += "-fcommon"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	for device in ${DEVICELIST}
-	do
-		oe_runmake clean DEVICE="$device" SRIO_SRC_DIR=${S}
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake tests DEVICE="$device" SRIO_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
-			oe_runmake examples DEVICE="$device" SRIO_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake installbin DEVICE="$device" SRIO_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
-	done
-}
diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-lld.inc
deleted file mode 100644
index efe379f..0000000
--- a/recipes-bsp/srio-lld/srio-lld.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/srio/srio_drv.h;beginline=1;endline=41;md5=469096088e072d883ff7eef301b34093"
-
-COMPATIBLE_MACHINE = "k2hk"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.srio"
-
-PE = "1"
-
-INC_PR = "r0"
-
-DEVICELIST = "k2h k2k"
-
-BASEDIR = "${WORKDIR}/git"
-
-EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
diff --git a/recipes-bsp/srio-lld/srio-lld_git.bb b/recipes-bsp/srio-lld/srio-lld_git.bb
deleted file mode 100644
index 3797bef..0000000
--- a/recipes-bsp/srio-lld/srio-lld_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "TI SRIO peripheral low level driver"
-
-DEPENDS="common-csl-ip rm-lld cppi-lld"
-
-include srio-lld.inc
-
-PR = "${INC_PR}.0"
-
-do_compile () {
-#   Now build the lld
-	oe_runmake clean
-	for device in ${DEVICELIST}
-	do
-		oe_runmake lib DEVICE="${device}"
-	done
-}
-
-do_install () {
-	oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
-	chown -R root:root ${D}
-}
diff --git a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
deleted file mode 100644
index db4421e..0000000
--- a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "TI third generation Turbo Coprocessor (TCP3) low level driver"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.tcp3d"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://tcp3dver.h;beginline=1;endline=47;md5=3fe46c6320fb9ca4ac6692961402beb7"
-
-COMPATIBLE_MACHINE = "k2hk|k2l|c66x"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0"
-
-DEPENDS:append = " edma3-lld-rtos"
-
-export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH:append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "TCP3D LLD"
diff --git a/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb b/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
deleted file mode 100644
index bd8a6e3..0000000
--- a/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "TI RTOS low level driver for Telecom Serial Interface Port (TSIP)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.tsip"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://tsip.h;beginline=1;endline=32;md5=dab2257b0b8a3678c26915f6eb49b71e"
-
-COMPATIBLE_MACHINE = "k2e|c667x-evm"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "TSIP LLD"
diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
deleted file mode 100644
index 8071e42..0000000
--- a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "TI RTOS low level driver for UART"
-DESCRIPTION = "TI RTOS low level driver for Universal Asynchronous Receiver/Transmitter (UART) module "
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.uart"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=31;md5=94b6a199da1caf777f6756cb70aca4a7"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0"
-
-DEPENDS:append = " edma3-lld-rtos \
-                   osal-rtos \
-"
-DEPENDS:append:ti33x = " starterware-rtos \
-                         pruss-lld-rtos \
-"
-DEPENDS:append:ti43x = " starterware-rtos"
-
-DEPENDS:remove:k3 = "edma3-lld-rtos "
-DEPENDS:append:k3 = " udma-lld-rtos "
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_UART_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH:append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "UART LLD"
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
deleted file mode 100644
index 2e17770..0000000
--- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-SUMMARY = "TI RTOS low level driver for UDMA"
-DESCRIPTION = "TI RTOS low level driver for Universal DMA module "
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.udma"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://udma.h;beginline=1;endline=31;md5=83d177cf3df55c16b27ae4102b6ade9a"
-
-COMPATIBLE_MACHINE = "k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r1"
-
-DEPENDS:append = " osal-rtos \
-                   sciclient-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-UDMA_PACKAGE_BASE   = "${WORKDIR}/udma_base"
-UDMA_LLD_ROOTPATH = "${UDMA_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/udma"
-
-export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
-export PDK_UDMA_ROOT_PATH = "${UDMA_PACKAGE_BASE}/package/all/pdk_/packages"
-
-TI_PDK_LIMIT_BOARDS:am65xx = "am65xx_evm"
-
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "UDMA LLD"
-
-do_configure() {
-    # remove any previous package
-    rm -rf ${UDMA_PACKAGE_BASE}
-
-    cd ${S}
-
-    # make the release package before building it
-    make package BOARD="${TI_PDK_LIMIT_BOARDS}" DEST_ROOT=${UDMA_PACKAGE_BASE} PDK_UDMA_COMP_PATH=${S}
-}
-
-do_compile() {
-    cd ${UDMA_LLD_ROOTPATH}
-
-    # Build am65xx libraries
-    make clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
-
-    #archive
-    tar -cf udma_lld.tar --exclude='*.tar' ./*
-}
-
-do_install() {
-    cd ${UDMA_LLD_ROOTPATH}
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/udma
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/udma \;
-}
-
-FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INSANE_SKIP:${PN} = "arch ldflags"
diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
deleted file mode 100644
index 7786270..0000000
--- a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "TI RTOS USB low level driver"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.usb"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://USBver.h;beginline=16;endline=46;md5=5394fa32763383d2c8e2aca5a1c67805"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0"
-
-DEPENDS:append = " osal-rtos"
-DEPENDS:append:ti33x = " starterware-rtos"
-DEPENDS:append:ti43x = " starterware-rtos"
-DEPENDS:append:k3 = " sciclient-rtos"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_USB_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "USB LLD"
diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
deleted file mode 100644
index 7e0695a..0000000
--- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-SUMMARY = "TI RTOS Low level driver for Video Processing Subsystem (VPS) "
-
-inherit ti-pdk
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=32;md5=4303d306ea53eb66132983d6901c137d"
-
-COMPATIBLE_MACHINE = "omap-a15"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-VPS_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/vps.git"
-VPS_LLD_GIT_PROTOCOL = "git"
-VPS_LLD_GIT_BRANCH = "master"
-VPS_LLD_GIT_DESTSUFFIX = "git/ti/drv/vps"
-
-# Below commit ID corresponds to "DEV.VPS_LLD.01.00.01.13A"
-VPS_LLD_SRCREV = "f6d7c1f9cee42da1368e6414b4feeb84227d620e"
-
-BRANCH = "${VPS_LLD_GIT_BRANCH}"
-SRC_URI = "${VPS_LLD_GIT_URI};destsuffix=${VPS_LLD_GIT_DESTSUFFIX};protocol=${VPS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${VPS_LLD_SRCREV}"
-PV = "01.00.01.13A"
-PR = "r0"
-
-S = "${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}"
-
-# Add to DEPENDS set in ti-pdk.bbclass
-DEPENDS:append = " \
-            ti-sysbios \
-            osal-rtos \
-            edma3-lld-rtos \
-            board-rtos \
-            uart-lld-rtos \
-            i2c-lld-rtos \
-            pm-lld-rtos \
-"
-export PDK_VPS_COMP_PATH = "${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-# The makefile will push these on the XDCPATH
-export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
-
-do_compile:append() {
-    # Delete archive created by XDC release command since it does not contain all content
-    find -name "*.tar" -exec rm -f {} \;
-
-    # Archive from build/ to capture ti/drv/pm/ in archive
-    cd ${B}
-    tar -cf pm_lld.tar --exclude='*.tar' ./*
-}
-
-INSANE_SKIP:${PN} = "arch ldflags"
-- 
2.7.4

