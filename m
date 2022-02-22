Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8792.1645503200279382367
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AA6C140C2E
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_rJWIakLBY7 for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B0AF940C88
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6F3E017476D
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 12/19] recipes-bsp: remove Keystone1/2 LLDs
Date: Tue, 22 Feb 2022 04:13:07 +0000
Message-Id: <20220222041314.2840028-13-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Low Level Drivers (LLDs) were used by Keystone1/2 to access peripherals b=
y
RTOS and Linux. Remove due to deprecation.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb     |  16 --
 recipes-bsp/aif2-lld/aif2-lld-test_git.bb     |  18 --
 recipes-bsp/aif2-lld/aif2-lld.inc             |  14 --
 recipes-bsp/aif2-lld/aif2-lld_git.bb          |  20 --
 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb       |  23 --
 recipes-bsp/cal-lld/cal-lld-rtos_git.bb       |  76 -------
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb     |  10 -
 recipes-bsp/cppi-lld/cppi-lld-test_git.bb     |  29 ---
 recipes-bsp/cppi-lld/cppi-lld.inc             |  19 --
 recipes-bsp/cppi-lld/cppi-lld_git.bb          |  38 ----
 recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb       |  12 --
 recipes-bsp/dfe-lld/dfe-lld-test_git.bb       |  20 --
 recipes-bsp/dfe-lld/dfe-lld.inc               |  14 --
 recipes-bsp/dfe-lld/dfe-lld_git.bb            |  20 --
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb   | 145 -------------
 recipes-bsp/edma3-lld/edma3-lld.inc           |  17 --
 recipes-bsp/edma3-lld/edma3-lld_git.bb        |  78 -------
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb     |  30 ---
 recipes-bsp/emac-lld/emac-lld.inc             |   7 -
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb     |  22 --
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb     |  34 ---
 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb     |  32 ---
 recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb |  12 --
 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |  26 ---
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc         |  21 --
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |  36 ----
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb       |  45 ----
 .../icss-emac-lld/icss-emac-lld-rtos_git.bb   |  25 ---
 .../icss-emac-lld/icss-emac-lld-test_git.bb   |  30 ---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc   |  15 --
 .../icss-emac-lld/icss-emac-lld_git.bb        |  25 ---
 recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb |  33 ---
 .../ipc-lld/ipc-lld-examples-rtos_git.bb      | 162 ---------------
 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb         | 196 ------------------
 recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb       |  45 ----
 recipes-bsp/ipc-lld/ipc-lld.inc               |  29 ---
 recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb     |  12 --
 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb     |  18 --
 recipes-bsp/iqn2-lld/iqn2-lld.inc             |  13 --
 recipes-bsp/iqn2-lld/iqn2-lld_git.bb          |  25 ---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb   |  41 ----
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb   |  30 ---
 recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb     |  10 -
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb     |  44 ----
 recipes-bsp/mmap-lld/mmap-lld.inc             |  22 --
 recipes-bsp/mmap-lld/mmap-lld_git.bb          |  15 --
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb   |  41 ----
 recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb     |  19 --
 recipes-bsp/nwal-lld/nwal-lld-test_git.bb     |  27 ---
 recipes-bsp/nwal-lld/nwal-lld.inc             |  21 --
 recipes-bsp/nwal-lld/nwal-lld_git.bb          |  27 ---
 recipes-bsp/pa-lld/pa-lld-rtos_git.bb         |  12 --
 recipes-bsp/pa-lld/pa-lld-test_git.bb         |  30 ---
 recipes-bsp/pa-lld/pa-lld.inc                 |  24 ---
 recipes-bsp/pa-lld/pa-lld_git.bb              |  27 ---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb     |  28 ---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb         |  71 -------
 recipes-bsp/pruss-lld/pruss-lld-apps_git.bb   |  31 ---
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb   |  22 --
 recipes-bsp/pruss-lld/pruss-lld-test_git.bb   |  27 ---
 recipes-bsp/pruss-lld/pruss-lld.inc           |  15 --
 recipes-bsp/pruss-lld/pruss-lld_git.bb        |  21 --
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb     |   9 -
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb     |  30 ---
 recipes-bsp/qmss-lld/qmss-lld.inc             |  19 --
 recipes-bsp/qmss-lld/qmss-lld_git.bb          |  38 ----
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb         |  13 --
 recipes-bsp/rm-lld/rm-lld.inc                 |  15 --
 recipes-bsp/rm-lld/rm-lld_git.bb              |  33 ---
 recipes-bsp/sa-lld/sa-lld-rtos_git.bb         |  26 ---
 recipes-bsp/sa-lld/sa-lld-test_git.bb         |  46 ----
 recipes-bsp/sa-lld/sa-lld.inc                 |  21 --
 recipes-bsp/sa-lld/sa-lld_git.bb              |  26 ---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb       |  37 ----
 recipes-bsp/srio-lld/srio-lld-rtos_git.bb     |  17 --
 recipes-bsp/srio-lld/srio-lld-test_git.bb     |  30 ---
 recipes-bsp/srio-lld/srio-lld.inc             |  18 --
 recipes-bsp/srio-lld/srio-lld_git.bb          |  21 --
 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb   |  23 --
 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb     |  18 --
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb     |  41 ----
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb     |  65 ------
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb       |  29 ---
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb       |  56 -----
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

diff --git a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb b/recipes-bsp/aif2=
-lld/aif2-lld-rtos_git.bb
deleted file mode 100644
index 048a2430..00000000
--- a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for Antenna Interface"
-
-inherit ti-pdk
-
-require recipes-bsp/aif2-lld/aif2-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS:append =3D " qmss-lld-rtos \
-                   cppi-lld-rtos \
-"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "AIF2 LLD"
diff --git a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb b/recipes-bsp/aif2=
-lld/aif2-lld-test_git.bb
deleted file mode 100644
index 9180b953..00000000
--- a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION =3D "TI Antenna Interface peripheral module low level driver=
 test binaries"
-
-DEPENDS =3D "common-csl-ip aif2-lld qmss-lld cppi-lld"
-
-include aif2-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
 AIF2_SRC_DIR=3D${WORKDIR}/git"
-
-do_compile () {
-    oe_runmake clean DEVICE=3Dk2hk
-    oe_runmake tests DEVICE=3Dk2hk
-}
-
-do_install () {
-    oe_runmake installbin DEVICE=3Dk2hk AIF2_SRC_DIR=3D${WORKDIR}/git IN=
STALL_BIN_BASE_DIR=3D${D}/${bindir}
-}
diff --git a/recipes-bsp/aif2-lld/aif2-lld.inc b/recipes-bsp/aif2-lld/aif=
2-lld.inc
deleted file mode 100644
index 718f3a7f..00000000
--- a/recipes-bsp/aif2-lld/aif2-lld.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D5bdceac872dffdec915b81965=
4ee23ea"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.aif2"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
-
-COMPATIBLE_MACHINE =3D "k2hk"
-
diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb b/recipes-bsp/aif2-lld/=
aif2-lld_git.bb
deleted file mode 100644
index 4a640f1b..00000000
--- a/recipes-bsp/aif2-lld/aif2-lld_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "Antenna Interface low level driver"
-
-DEPENDS =3D "common-csl-ip qmss-lld cppi-lld"
-
-include aif2-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
"
-
-do_compile () {
-    oe_runmake lib DEVICE=3Dk2hk
-}
-
-do_install () {
-    oe_runmake install INSTALL_INC_BASE_DIR=3D${D}/${includedir} INSTALL=
_LIB_BASE_DIR=3D${D}${libdir}
-    chown -R root:root ${D}
-}
-
-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/libaif2.a"
diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb b/recipes-bsp/bcp-ll=
d/bcp-lld-rtos_git.bb
deleted file mode 100644
index d808267b..00000000
--- a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY =3D "TI Bit Coprocessor (BCP) low level driver"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.bcp"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://bcp.h;beginline=3D1;endline=3D40;md5=3D4f6e=
6128dd075a89548c0287a39b8896"
-
-COMPATIBLE_MACHINE =3D "k2hk|k2l|c667x-evm"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r0"
-
-
-DEPENDS:append =3D " qmss-lld-rtos \
-                   cppi-lld-rtos \
-"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "BCP LLD"
diff --git a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb b/recipes-bsp/cal-ll=
d/cal-lld-rtos_git.bb
deleted file mode 100644
index a91d85b6..00000000
--- a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
+++ /dev/null
@@ -1,76 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for CAL"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.cal"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://cal.h;beginline=3D1;endline=3D31;md5=3D83d1=
77cf3df55c16b27ae4102b6ade9a"
-
-COMPATIBLE_MACHINE =3D "k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-
-PR =3D "r0"
-
-DEPENDS:append =3D " osal-rtos \
-                   fvid2-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-CAL_PACKAGE_BASE   =3D "${WORKDIR}/cal_base"
-CAL_LLD_ROOTPATH =3D "${CAL_PACKAGE_BASE}/package/all/pdk_/packages/ti/d=
rv/cal"
-
-export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
-export PDK_CAL_ROOT_PATH =3D "${CAL_PACKAGE_BASE}/package/all/pdk_/packa=
ges"
-
-LIMSOCS =3D ""
-LIMSOCS:am65xx-evm =3D "am65xx"
-LIMSOCS:am65xx-hs-evm =3D "am65xx"
-
-LIMBOARDS =3D ""
-LIMBOARDS:am65xx-evm =3D "am65xx_evm"
-LIMBOARDS:am65xx-hs-evm =3D "am65xx_evm"
-
-BOARD_PACKAGE =3D ""
-BOARD_PACKAGE:am65xx-evm =3D "am65xx_evm"
-BOARD_PACKAGE:am65xx-hs-evm =3D "am65xx_evm"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "CAL"
-
-do_configure() {
-    rm -rf ${CAL_PACKAGE_BASE}
-    cd ${S}
-
-    # remove any previous package
-    rm -f ${CAL_PACKAGE_BASE}
-
-    # make the release package before building it
-    make package BOARD=3D${BOARD_PACKAGE} DEST_ROOT=3D${CAL_PACKAGE_BASE=
} PDK_CAL_COMP_PATH=3D${S}
-}
-
-do_compile() {
-    echo "cal lld root path is ${CAL_LLD_ROOTPATH}"
-    cd ${CAL_LLD_ROOTPATH}
-
-    # Build am65xx libraries
-    make clean lib xdc_meta doxygen LIMIT_SOCS=3D"${LIMSOCS}" LIMIT_BOAR=
DS=3D"${LIMBOARDS}"
-
-    #archive
-    tar -cf cal_lld.tar --exclude=3D'*.tar' ./*
-}
-
-do_install() {
-    cd ${CAL_LLD_ROOTPATH}
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/cal
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INST=
ALL_DIR_RECIPE}/packages/ti/drv/cal \;
-}
-
-FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INSANE_SKIP:${PN} =3D "arch ldflags"
diff --git a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb b/recipes-bsp/cppi=
-lld/cppi-lld-rtos_git.bb
deleted file mode 100644
index 49a99406..00000000
--- a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit ti-pdk
-require cppi-lld.inc
-
-PR =3D "${INC_PR}.1"
-
-COMPATIBLE_MACHINE:append =3D "|c66x"
-
-DEPENDS:append =3D " rm-lld-rtos \
-                   qmss-lld-rtos \
-"
diff --git a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb b/recipes-bsp/cppi=
-lld/cppi-lld-test_git.bb
deleted file mode 100644
index 0c630b4e..00000000
--- a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION =3D "TI CPPI low level driver unit test and example binaries=
"
-DEPENDS =3D "common-csl-ip rm-lld cppi-lld qmss-lld"
-
-include cppi-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-CHOICELIST =3D "yes no"
-
-CFLAGS +=3D "-fcommon"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVI=
CE=3D"$device" CPPI_SRC_DIR=3D${S}
-		for choice in ${CHOICELIST}
-		do
-			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=3D${STAGING_IN=
CDIR} DEVICE=3D"$device" CPPI_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D"$choice"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-do
-	make -f makefile_armv7 installbin PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
DEVICE=3D"$device" CPPI_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}${bindi=
r}
-	done
-}
diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cpp=
i-lld.inc
deleted file mode 100644
index 372fcecc..00000000
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/ti/drv/cppi/COPYING.txt;md5=3D=
e8f6789acdcda76d02ed9203fc2e603d"
-
-COMPATIBLE_MACHINE =3D "keystone"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.cppi"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
-
-DEVICELIST =3D "k2h k2k k2l k2e"
-DEVICELIST:k2hk =3D "k2h k2k"
-DEVICELIST:k2l  =3D "k2l"
-DEVICELIST:k2e  =3D "k2e"
-DEVICELIST:k2g  =3D "k2h"
diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/=
cppi-lld_git.bb
deleted file mode 100644
index 26919b3e..00000000
--- a/recipes-bsp/cppi-lld/cppi-lld_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION =3D "TI CPPI Module low level driver"
-
-DEPENDS =3D "common-csl-ip rm-lld qmss-lld"
-
-include cppi-lld.inc
-
-PR =3D "${INC_PR}.1"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR}
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 lib PDK_INSTALL_PATH=3D${STAGING_INCDIR}  DEVIC=
E=3D"${device}"
-	done
-}
-
-do_install () {
-    make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
INSTALL_INC_BASE_DIR=3D${D}/${includedir} INSTALL_LIB_BASE_DIR=3D${D}${li=
bdir}
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
-INHIBIT_PACKAGE_STRIP_FILES:k2hk =3D "${PKGD}${libdir}/libcppi_k2h.a ${P=
KGD}${libdir}/libcppi_k2k.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2e =3D "${PKGD}${libdir}/libcppi_k2e.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2l =3D "${PKGD}${libdir}/libcppi_k2l.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2g =3D "${PKGD}${libdir}/libcppi_k2h.a"
-INHIBIT_PACKAGE_STRIP_FILES:append =3D " ${PKGD}${libdir}/libcppi.a"
diff --git a/recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb b/recipes-bsp/dfe-ll=
d/dfe-lld-rtos_git.bb
deleted file mode 100644
index 5caa07ab..00000000
--- a/recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY =3D "TI RTOS level driver for Digital Radio Front End"
-
-inherit ti-pdk
-
-require recipes-bsp/dfe-lld/dfe-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "DFE LLD"
diff --git a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb b/recipes-bsp/dfe-ll=
d/dfe-lld-test_git.bb
deleted file mode 100644
index 34b90c7d..00000000
--- a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "TI Digital Radio Front End lld test application"
-
-DEPENDS =3D "common-csl-ip dfe-lld iqn2-lld"
-
-include dfe-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
 DFE_SRC_DIR=3D${S}"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	oe_runmake clean DEVICE=3Dk2l
-	oe_runmake tests DEVICE=3Dk2l
-	oe_runmake tests DEVICE=3Dk2l USEDYNAMIC_LIB=3Dyes
-}
-
-do_install () {
-	oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}/${bindir}
-}
diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-ll=
d.inc
deleted file mode 100644
index 9ac317d4..00000000
--- a/recipes-bsp/dfe-lld/dfe-lld.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D1f4217b705bf98762a302fd72=
0649dcc"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.dfe"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
-
-COMPATIBLE_MACHINE =3D "k2l"
-
diff --git a/recipes-bsp/dfe-lld/dfe-lld_git.bb b/recipes-bsp/dfe-lld/dfe=
-lld_git.bb
deleted file mode 100644
index 622da6fc..00000000
--- a/recipes-bsp/dfe-lld/dfe-lld_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "Digital Radio Front End low level driver"
-
-DEPENDS =3D "common-csl-ip"
-
-include dfe-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
"
-
-do_compile () {
-	oe_runmake lib DEVICE=3Dk2l
-}
-
-do_install () {
-	oe_runmake install INSTALL_INC_BASE_DIR=3D${D}/${includedir} INSTALL_LI=
B_BASE_DIR=3D${D}${libdir}
-	chown -R root:root ${D}
-}
-
-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/libdfe.a"
diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/ed=
ma3-lld/edma3-lld-rtos_git.bb
deleted file mode 100644
index 8d1fd7ca..00000000
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ /dev/null
@@ -1,145 +0,0 @@
-require edma3-lld.inc
-require recipes-ti/includes/ti-paths.inc
-
-PR =3D "${INC_PR}.1"
-
-DEPENDS =3D "ti-sysbios ti-xdctools-native gcc-arm-baremetal-native ti-c=
gt-arm-native ti-cgt6x-native"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PLATFORMLIST =3D ""
-TARGETLIST =3D ""
-
-PLATFORMLIST:ti33x =3D " \
-        am335x-evm \
-"
-
-TARGETLIST:ti33x =3D " \
-        a8 \
-"
-
-PLATFORMLIST:ti43x =3D " \
-        am437x-evm \
-"
-
-TARGETLIST:ti43x =3D " \
-        arm9 \
-"
-
-PLATFORMLIST:omap-a15 =3D " \
-        tda2xx-evm \
-"
-
-TARGETLIST:omap-a15 =3D " \
-        66 \
-        a15 \
-        m4 \
-"
-
-PLATFORMLIST:keystone =3D " \
-        tci6636k2h-evm \
-        tci6638k2k-evm \
-        tci6630k2l-evm \
-        c66ak2e-evm \
-        tci66ak2g02-evm \
-"
-
-TARGETLIST:keystone =3D " \
-        66 \
-        a15 \
-"
-
-PLATFORMLIST:append:dra7xx-evm =3D " \
-        tda3xx-evm \
-"
-
-TARGETLIST:c66x =3D " \
-        66 \
-"
-
-PLATFORMLIST_c665x-evm =3D " \
-        c6657-evm \
-"
-
-PLATFORMLIST_c667x-evm =3D " \
-        c6678-evm \
-"
-
-PLATFORMLIST:omapl1 =3D " \
-        omapl137-evm \
-        omapl138-evm \
-"
-
-TARGETLIST:omapl1 =3D " \
-        arm9 \
-        674 \
-"
-
-EXTRA_OEMAKE:remove =3D "TARGET=3D66"
-FORMAT=3D"ELF"
-
-S =3D "${WORKDIR}/git"
-
-PARALLEL_MAKE =3D ""
-
-export C6X_GEN_INSTALL_PATH =3D "${STAGING_DIR_NATIVE}/usr"
-export XDCCGROOT =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export CGTOOLS =3D "${XDCCGROOT}"
-export CGTOOLS_ELF =3D "${XDCCGROOT}"
-export CODEGEN_PATH_DSP =3D "${XDCCGROOT}"
-export CODEGEN_PATH_DSPELF =3D "${XDCCGROOT}"
-export TMS470_CGTOOLS =3D "${M4_TOOLCHAIN_INSTALL_DIR}"
-export UTILS_INSTALL_DIR =3D "${XDC_INSTALL_DIR}"
-export XDCPATH =3D "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${S=
YSBIOS_INSTALL_DIR}/packages"
-export PATH :=3D "${XDC_INSTALL_DIR}:${PATH}"
-export ROOTDIR=3D"${S}"
-export INTERNAL_SW_ROOT=3D"${S}"
-export CROSSCC=3D"${TARGET_PREFIX}gcc"
-export CROSSAR=3D"${TARGET_PREFIX}ar"
-export CROSSLNK=3D"${TARGET_PREFIX}gcc"
-
-do_configure () {
-    rm -rf ${S}/examples/edma3_driver/evmTCI6614
-    rm -rf ${S}/examples/edma3_driver/evmTCI6614BE
-    sed -i -e "s|_config.bld|config.bld|g" ${S}/makerules/env.mk
-    sed -i -e "s|^edma3_lld_PATH =3D.*$|edma3_lld_PATH =3D ${S}|g" ${S}/=
makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_M3 =3D.*$|CODEGEN_PATH_M3 =3D ${M4_TOOLCH=
AIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_M4 =3D.*$|CODEGEN_PATH_M4 =3D ${M4_TOOLCH=
AIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_A8 =3D.*$|CODEGEN_PATH_A8 =3D ${M4_TOOLCH=
AIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_A8_GCC =3D.*$|CODEGEN_PATH_A8_GCC =3D ${G=
CC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_ARM9 =3D.*$|CODEGEN_PATH_ARM9 =3D ${M4_TO=
OLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_A9_GCC =3D.*$|CODEGEN_PATH_A9_GCC =3D ${G=
CC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_A15 =3D.*$|CODEGEN_PATH_A15 =3D ${GCC_ARM=
_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_A15_GCC =3D.*$|CODEGEN_PATH_A15_GCC =3D $=
{GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^UTILS_INSTALL_DIR =3D.*$|UTILS_INSTALL_DIR =3D ${XDC_I=
NSTALL_DIR}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^bios_PATH =3D.*$|bios_PATH =3D ${SYSBIOS_INSTALL_DIR}|=
g" ${S}/makerules/env.mk
-    sed -i -e "s|^xdc_PATH =3D.*$|xdc_PATH =3D ${XDC_INSTALL_DIR}|g" ${S=
}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_DSP =3D.*$|CODEGEN_PATH_DSP =3D ${XDCCGRO=
OT}|g" ${S}/makerules/env.mk
-    sed -i -e "s|^CODEGEN_PATH_DSPELF =3D.*$|CODEGEN_PATH_DSPELF =3D ${X=
DCCGROOT}|g" ${S}/makerules/env.mk
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
-            make PLATFORM=3D${p} TARGET=3D${t} FORMAT=3D${FORMAT}
-        done
-    done
-}
-
-do_install () {
-    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
-    install -d ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS} ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
-}
-
-INSANE_SKIP:${PN}-dev =3D "arch ldflags file-rdeps"
-
-ALLOW_EMPTY:${PN} =3D "1"
-FILES:${PN}-dev +=3D "${EDMA3_LLD_INSTALL_DIR_RECIPE}"
diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/=
edma3-lld.inc
deleted file mode 100644
index 34d3170f..00000000
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION =3D "TI EDMA3 low level driver and test code"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D5bdceac872dffdec915b81965=
4ee23ea"
-
-EDMA3_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/edma3_lld.git"
-EDMA3_LLD_GIT_PROTOCOL =3D "git"
-EDMA3_LLD_GIT_BRANCH =3D "master"
-
-# Below commit ID corresponds to version 2.12.05.30E
-EDMA3_LLD_SRCREV =3D "ce5ced2ac5eb1e0f1515288d279f5690813b5413"
-
-BRANCH =3D "${EDMA3_LLD_GIT_BRANCH}"
-SRC_URI =3D "${EDMA3_LLD_GIT_URI};protocol=3D${EDMA3_LLD_GIT_PROTOCOL};b=
ranch=3D${BRANCH}"
-SRCREV =3D "${EDMA3_LLD_SRCREV}"
-
-PV =3D "2.12.05.30E"
-INC_PR =3D "r1"
diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-l=
ld/edma3-lld_git.bb
deleted file mode 100644
index f42d8965..00000000
--- a/recipes-bsp/edma3-lld/edma3-lld_git.bb
+++ /dev/null
@@ -1,78 +0,0 @@
-require edma3-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-COMPATIBLE_MACHINE =3D "keystone"
-
-DEPENDS =3D "common-csl-ip"
-
-PLATFORMLIST =3D "tci6636k2h-evm \
-	tci6636k2h-evm \
-	tci6638k2k-evm \
-	tci6630k2l-evm \
-	c66ak2e-evm \
-	tci66ak2g02-evm \
-	"
-
-PACKAGES =3D+ "${PN}-test"
-
-FILES:${PN}-test =3D "${bindir}/*"
-
-S =3D "${WORKDIR}/git"
-
-do_compile () {
-	cd ${S}/packages
-	for platform in ${PLATFORMLIST}
-	do
-		ROOTDIR=3D${S} CROSSCC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" CR=
OSSAR=3D"${TARGET_PREFIX}ar" \
-		CROSSLNK=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" INTERNAL_SW_ROOT=
=3D"${S}" make \
-		PLATFORM=3D"$platform" TARGET=3Da15 TOOLCHAIN_a15=3DGCC FORMAT=3DELF \
-		SONAME=3Dlibedma3.so all
-	done
-}
-
-do_install () {
-	CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
-
-	install -d ${D}/${libdir}
-
-	# Static Libraries
-	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/edma3_lld_=
drv.aa15fg \
-		${D}/${libdir}/libedma3.a
-	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/rele=
ase/edma3_lld_rm.aa15fg \
-		${D}/${libdir}/libedma3rm.a
-
-	# Shared Libraries
-	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/libedma* $=
{D}/${libdir}
-	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/rele=
ase/libedma* ${D}/${libdir}
-
-	# Copy Headers
-	install -d ${D}/${includedir}/ti/sdo/edma3/drv/
-	install -d ${D}/${includedir}/ti/sdo/edma3/rm
-	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/drv/*.h ${D}/${includedir}/ti/=
sdo/edma3/drv/
-	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/rm/*.h ${D}/${includedir}/ti/s=
do/edma3/rm/
-
-	# Copy Sample Config
-	install -d ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-	cp ${CP_ARGS} ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/evmTC=
I6636K2HSample.c \
-		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-	cp ${CP_ARGS} ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/evmTC=
I6638K2KSample.c \
-		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-	cp ${CP_ARGS} ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/evmTC=
I6630K2LSample.c \
-		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-	cp ${CP_ARGS} ${S}/examples/edma3_user_space_driver/evmC66AK2E/evmC66AK=
2ESample.c \
-		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-
-	install -d ${D}/${bindir}
-	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/b=
in/tci6636k2h-evm/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg \
-		${D}/${bindir}/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg
-	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/b=
in/tci6638k2k-evm/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg \
-		${D}/${bindir}/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg
-	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/b=
in/tci6630k2l-evm/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg \
-		${D}/${bindir}/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg
-	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmC66AK2E/bin/=
c66ak2e-evm/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg \
-		${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
-}
-
-INSANE_SKIP:${PN} +=3D "ldflags"
-INSANE_SKIP:${PN}-test +=3D "ldflags"
diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac=
-lld/emac-lld-rtos_git.bb
deleted file mode 100644
index cc8c2efe..00000000
--- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for Ethernet MAC (EMAC) peripheral=
"
-
-inherit ti-pdk
-
-require emac-lld.inc
-
-PR =3D "r0"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://emacver.h;beginline=3D1;endline=3D47;md5=3D=
f66bb3695972ca2a85d990a390f45d88"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|omapl1|c665x-evm|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-DEPENDS:append =3D " board-rtos osal-rtos"
-DEPENDS:append:ti33x =3D " starterware-rtos"
-DEPENDS:append:ti43x =3D " starterware-rtos"
-DEPENDS:append:k2g  =3D " cppi-lld-rtos qmss-lld-rtos"
-
-DEPENDS:remove:k3 =3D "board-rtos "
-DEPENDS:append:k3 =3D " udma-lld-rtos trace-rtos"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_EMAC_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "EMAC LLD"
diff --git a/recipes-bsp/emac-lld/emac-lld.inc b/recipes-bsp/emac-lld/ema=
c-lld.inc
deleted file mode 100644
index eea56b31..00000000
--- a/recipes-bsp/emac-lld/emac-lld.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.emac"
-
-PE =3D "1"
-
-# The LLD version
diff --git a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb b/recipes-bsp/fftc=
-lld/fftc-lld-rtos_git.bb
deleted file mode 100644
index 7e5db229..00000000
--- a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY =3D "TI FFT Coprocessor (FFTC) low level driver "
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.fftc"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://fftc.h;beginline=3D1;endline=3D39;md5=3D2f1=
010c47d364414644caf6d30a2b7df"
-
-COMPATIBLE_MACHINE =3D "k2hk|k2l"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r0"
-
-DEPENDS:append=3D " qmss-lld-rtos \
-                  cppi-lld-rtos \
-"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "FFTC LLD"
diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb b/recipes-bsp/gpio=
-lld/gpio-lld-rtos_git.bb
deleted file mode 100644
index 6f1ad1bf..00000000
--- a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY =3D "TI RTOS driver for General Purpose IO (GPIO)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.gpio"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://GPIO.h;beginline=3D1;endline=3D31;md5=3D858=
0f9c5c0de8d5d13518cf18a0122b8"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|omapl1|c667x-evm|c=
665x-evm|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r0"
-
-
-DEPENDS:append =3D " osal-rtos \
-"
-DEPENDS:append:ti33x =3D " starterware-rtos \
-"
-DEPENDS:append:ti43x =3D " starterware-rtos \
-"
-DEPENDS:append:k3 =3D " sciclient-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_GPIO_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "GPIO LLD"
diff --git a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb b/recipes-bsp/gpmc=
-lld/gpmc-lld-rtos_git.bb
deleted file mode 100644
index 808b00b4..00000000
--- a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for General Purpose Memory Control=
ler (GPMC)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.gpmc"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://GPMC.h;beginline=3D1;endline=3D31;md5=3D485=
ec97c36f809bf92323fde3e988c72"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-
-PR =3D "r0"
-
-DEPENDS:append =3D " osal-rtos \
-"
-DEPENDS:append:ti33x =3D " starterware-rtos \
-"
-DEPENDS:append:ti43x =3D " starterware-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "GPMC LLD"
-
-export PDK_GPMC_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb b/recipes-bsp/=
hyplnk-lld/hyplnk-lld-rtos_git.bb
deleted file mode 100644
index e86c1d4d..00000000
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for Hyperlink peripheral"
-
-inherit ti-pdk
-
-require recipes-bsp/hyplnk-lld/hyplnk-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-COMPATIBLE_MACHINE:append =3D "|c66x"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "HYPLNK LLD"
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-bsp/=
hyplnk-lld/hyplnk-lld-test_git.bb
deleted file mode 100644
index 31b69c26..00000000
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-include hyplnk-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS =3D "common-csl-ip hyplnk-lld"
-
-do_compile () {
-	make -f makefile_armv7 clean PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
-		HYPLNK_SRC_DIR=3D"${S}"
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 tests examples \
-			PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
-			DEVICE=3D"$device" HYPLNK_SRC_DIR=3D"${S}"
-	done
-}
-
-do_install () {
-    for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 installbin \
-			PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" DEVICE=3D"$device" \
-			HYPLNK_SRC_DIR=3D"${S}" \
-			INSTALL_BIN_BASE_DIR=3D"${D}/${bindir}"
-	done
-}
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-l=
ld/hyplnk-lld.inc
deleted file mode 100644
index 02f964bb..00000000
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION =3D "TI Hyperlink Low Level Driver"
-LICENSE =3D "BSD-3-Clause"
-
-COMPATIBLE_MACHINE =3D "k2hk|k2e"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-LLDNAME=3D"hyplnk"
-
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D623325cc19e613a4e770fbb74=
9922592"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.hyplnk"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
-
-DEVICELIST:k2hk =3D "k2h k2k"
-DEVICELIST:k2e  =3D "k2e"
-
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hypln=
k-lld/hyplnk-lld_git.bb
deleted file mode 100644
index 690ffac9..00000000
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-include hyplnk-lld.inc
-
-PR =3D "${INC_PR}.1"
-
-DEPENDS =3D "common-csl-ip"
-
-do_compile () {
-	make -f makefile_armv7 clean PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
-		HYPLNK_SRC_DIR=3D"${S}"
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 lib PDK_INSTALL_PATH=3D"${STAGING_INCDIR}"\
-			DEVICE=3D"$device" HYPLNK_SRC_DIR=3D"${S}"
-	done
-}
-
-do_install () {
-	make -f makefile_armv7 install PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
-		INSTALL_INC_BASE_DIR=3D"${D}/${includedir}" \
-		INSTALL_LIB_BASE_DIR=3D"${D}${libdir}" HYPLNK_SRC_DIR=3D"${S}"
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
-INHIBIT_PACKAGE_STRIP_FILES:k2hk =3D "${PKGD}${libdir}/libhyplnk_k2h.a $=
{PKGD}${libdir}/libhyplnk_k2k.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2e =3D "${PKGD}${libdir}/libhyplnk_k2e.a"
diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-ll=
d/i2c-lld-rtos_git.bb
deleted file mode 100644
index 2d06615a..00000000
--- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for Inter-IC module (I2C)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.i2c"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://I2C.h;beginline=3D1;endline=3D32;md5=3D5008=
4375278c1a2779571be134f98f7c"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-
-PR =3D "r0"
-
-DEPENDS:append =3D " osal-rtos \
-"
-DEPENDS:append:ti33x =3D " starterware-rtos \
-                         pruss-lld-rtos \
-"
-DEPENDS:append:ti43x =3D " starterware-rtos \
-                         pruss-lld-rtos \
-"
-DEPENDS:append:am57xx-evm =3D " pruss-lld-rtos \
-"
-
-DEPENDS:append:k2g =3D " pruss-lld-rtos \
-"
-
-DEPENDS:append:j7 =3D " sciclient-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-
-export PDK_I2C_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-INSANE_SKIP:${PN} =3D "arch"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "I2C LLD"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb b/recipe=
s-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
deleted file mode 100644
index 2cf2beae..00000000
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for ICSS-EMAC"
-
-inherit ti-pdk
-require icss-emac-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS:append =3D " osal-rtos \
-                   pruss-lld-rtos \
-"
-DEPENDS:append:ti33x =3D " starterware-rtos \
-"
-DEPENDS:append:ti43x =3D " starterware-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_ICSS_EMAC_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "ICSS-EMAC LLD"
-
-INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb b/recipe=
s-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
deleted file mode 100644
index 2aff00b6..00000000
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "TI ICSS-EMAC low level driver tests"
-
-DEPENDS=3D"common-csl-ip pruss-lld icss-emac-lld osal ti-pdk-build-rtos =
icss-emac-lld-rtos"
-
-DEPENDS:append:ti33x =3D " starterware"
-DEPENDS:append:ti43x =3D " starterware"
-
-include icss-emac-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
} PDK_PKG_PATH=3D${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMAC_SRC=
_DIR=3D${S}"
-
-DEVICE_LIST ?=3D "${TI_PDK_LIMIT_SOCS}"
-
-do_compile () {
-    # Build the tests
-    for device in ${DEVICE_LIST}
-    do
-        oe_runmake tests DEVICE=3D"$device"
-    done
-}
-
-do_install() {
-    # Install the binary
-    for device in ${DEVICE_LIST}
-    do
-        oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVIC=
E=3D"$device"
-    done
-}
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/ic=
ss-emac-lld/icss-emac-lld.inc
deleted file mode 100644
index e315c897..00000000
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D76cafd87d8495b42c2355f768=
1de15a2"
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.icss_emac"
-
-PE =3D "1"
-
-INC_PR =3D "r1"
-
-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/libicss_emac.a"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-bsp=
/icss-emac-lld/icss-emac-lld_git.bb
deleted file mode 100644
index ed7748da..00000000
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION =3D "TI ICSS-EMAC low level driver library"
-
-DEPENDS =3D "common-csl-ip pruss-lld osal"
-
-include icss-emac-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-TARGET_NAME:omap-a15 =3D "SOC_AM572x"
-TARGET_NAME:ti33x =3D "SOC_AM335x"
-TARGET_NAME:ti43x =3D "SOC_AM437x"
-TARGET_NAME:k2g =3D "SOC_K2G"
-
-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
} TARGET=3D${TARGET_NAME}"
-
-do_compile () {
-#   Build the lib
-    oe_runmake clean
-    oe_runmake lib
-}
-
-do_install () {
-#   Install the lib
-    oe_runmake install INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_=
LIB_BASE_DIR=3D${D}${libdir}
-}
diff --git a/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb b/recipes-bsp/=
iolink-lld/iolink-lld-rtos_git.bb
deleted file mode 100644
index f193cb8c..00000000
--- a/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for IO-Link Master"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.iolink"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://IOLINK.h;beginline=3D1;endline=3D32;md5=3Dd=
a669339a4b8594ed3edbe7ca30c726e"
-
-COMPATIBLE_MACHINE =3D "ti43x"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r2"
-
-DEPENDS:append =3D " osal-rtos \
-"
-DEPENDS:append:ti43x =3D " starterware-rtos \
-                         pruss-lld-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-
-export PDK_IOLINK_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-INSANE_SKIP:${PN} =3D "arch"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "IOLINK LLD"
diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-b=
sp/ipc-lld/ipc-lld-examples-rtos_git.bb
deleted file mode 100644
index 3fb6884f..00000000
--- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
+++ /dev/null
@@ -1,162 +0,0 @@
-SUMMARY =3D "echo_test for IPC-LLD"
-
-require ipc-lld.inc
-
-inherit update-alternatives
-
-DEPENDS +=3D " ipc-lld-rtos common-csl-ip-rtos sciclient-rtos board-rtos=
"
-
-REMOTE_FW_DIR =3D "${S}/examples/yocto_bin"
-REMOTE_FW_BIN_DIR =3D "${REMOTE_FW_DIR}/ipc_echo_test/bin"
-REMOTE_FWB_BIN_DIR =3D "${REMOTE_FW_DIR}/ipc_echo_testb/bin"
-RTOS_ALL_CORES_BIN_DIR =3D "${REMOTE_FW_DIR}/ex02_bios_multicore_echo_te=
st/bin"
-RTOS_2_CORES_BIN_DIR =3D "${REMOTE_FW_DIR}/ex01_bios_2core_echo_test/bin=
"
-LINUX_2_CORES_BIN_DIR =3D "${REMOTE_FW_DIR}/ex03_linux_bios_2core_echo_t=
est/bin"
-LINUX_2_CORES_BAREMETAL_BIN_DIR =3D "${REMOTE_FW_DIR}/ex04_linux_baremet=
al_2core_echo_test/bin"
-
-DST_BIN_PATH =3D "${base_libdir}/firmware/pdk-ipc"
-
-TI_PDK_LIMIT_BOARDS:j7 =3D "j721e_evm"
-
-do_configure[noexec] =3D "1"
-
-do_compile() {
-    cd "${PDK_INSTALL_PATH}/ti/build"
-
-    for board in ${TI_PDK_LIMIT_BOARDS}
-    do
-        for core in ${TI_PDK_LIMIT_CORES}
-        do
-            oe_runmake ipc_echo_test BOARD=3D"$board" CORE=3D"$core" DES=
T_ROOT=3D${REMOTE_FW_DIR}
-            oe_runmake ex02_bios_multicore_echo_test BOARD=3D"$board" CO=
RE=3D"$core" DEST_ROOT=3D${REMOTE_FW_DIR}
-            oe_runmake ex01_bios_2core_echo_test BOARD=3D"$board" CORE=3D=
"$core" DEST_ROOT=3D${REMOTE_FW_DIR}
-            oe_runmake ex03_linux_bios_2core_echo_test BOARD=3D"$board" =
CORE=3D"$core" DEST_ROOT=3D${REMOTE_FW_DIR}
-            oe_runmake ex04_linux_baremetal_2core_echo_test BOARD=3D"$bo=
ard" CORE=3D"$core" DEST_ROOT=3D${REMOTE_FW_DIR}
-            oe_runmake ipc_echo_testb BOARD=3D"$board" CORE=3D"$core" DE=
ST_ROOT=3D${REMOTE_FW_DIR}
-        done
-
-    done
-}
-
-do_install() {
-    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
-    install -d ${D}${DST_BIN_PATH}
-
-    cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex02_bios_multicore_echo_test/bin -d =
${D}/ex02_bios_multicore_echo_test
-    cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex01_bios_2core_echo_test/bin -d ${D}=
/ex01_bios_2core_echo_test
-    cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex03_linux_bios_2core_echo_test/bin -=
d ${D}/ex03_linux_bios_2core_echo_test
-
-    for board in ${TI_PDK_LIMIT_BOARDS}
-    do
-        for core in ${TI_PDK_LIMIT_CORES}
-        do
-            install -m 0644 ${REMOTE_FW_BIN_DIR}/$board/ipc_echo_test_${=
core}_release* ${D}${DST_BIN_PATH}
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
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_0_r=
elease.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_1_r=
elease.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_0_r=
elease.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_1_r=
elease.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_0_r=
elease.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_1_r=
elease.xer5f ${D}${DST_BIN_PATH}
-
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_0_r=
elease_strip.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_1_r=
elease_strip.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_0_r=
elease_strip.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_1_r=
elease_strip.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_0_r=
elease_strip.xer5f ${D}${DST_BIN_PATH}
-    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_1_r=
elease_strip.xer5f ${D}${DST_BIN_PATH}
-}
-
-do_install:append:am65xx() {
-    cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex04_linux_baremetal_2core_echo_test/=
bin -d ${D}/ex04_linux_baremetal_2core_echo_test
-}
-
-# Set up names for the firmwares
-ALTERNATIVE:${PN}:am65xx =3D "\
-                    am65x-mcu-r5f0_0-fw \
-                    am65x-mcu-r5f0_1-fw \
-                    "
-ALTERNATIVE:${PN}:j7 =3D "\
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
-TARGET_MCU_R5FSS0_0:am65xx =3D "am65x-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:am65xx =3D "am65x-mcu-r5f0_1-fw"
-
-TARGET_MCU_R5FSS0_0:j7 =3D "j7-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:j7 =3D "j7-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0:j7 =3D "j7-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1:j7 =3D "j7-main-r5f0_1-fw"
-TARGET_MAIN_R5FSS1_0:j7 =3D "j7-main-r5f1_0-fw"
-TARGET_MAIN_R5FSS1_1:j7 =3D "j7-main-r5f1_1-fw"
-TARGET_C66_0:j7 =3D "j7-c66_0-fw"
-TARGET_C66_1:j7 =3D "j7-c66_1-fw"
-TARGET_C7X:j7 =3D "j7-c71_0-fw"
-
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/=
${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/=
${TARGET_MCU_R5FSS0_1}"
-
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/${T=
ARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/${T=
ARGET_MCU_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS1_0}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS1_1}"
-ALTERNATIVE_LINK_NAME[j7-c66_0-fw] =3D "${base_libdir}/firmware/${TARGET=
_C66_0}"
-ALTERNATIVE_LINK_NAME[j7-c66_1-fw] =3D "${base_libdir}/firmware/${TARGET=
_C66_1}"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw] =3D "${base_libdir}/firmware/${TARGET=
_C7X}"
-
-# Create the firmware alternatives
-
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
-
-ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk-ip=
c/ipc_echo_testb_mcu1_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk-ip=
c/ipc_echo_test_mcu1_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk-i=
pc/ipc_echo_test_mcu2_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk-i=
pc/ipc_echo_test_mcu2_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] =3D "${base_libdir}/firmware/pdk-i=
pc/ipc_echo_test_mcu3_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] =3D "${base_libdir}/firmware/pdk-i=
pc/ipc_echo_test_mcu3_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-c66_0-fw] =3D "${base_libdir}/firmware/pdk-ipc/ipc=
_echo_test_c66xdsp_1_release_strip.xe66"
-ALTERNATIVE_TARGET[j7-c66_1-fw] =3D "${base_libdir}/firmware/pdk-ipc/ipc=
_echo_test_c66xdsp_2_release_strip.xe66"
-ALTERNATIVE_TARGET[j7-c71_0-fw] =3D "${base_libdir}/firmware/pdk-ipc/ipc=
_echo_test_c7x_1_release_strip.xe71"
-
-ALTERNATIVE_PRIORITY =3D "10"
-
-#add source and all rtos binaries package
-PACKAGES =3D+ "${PN}-rtos"
-
-# make sure that lib/firmware, and all its contents are part of the pack=
age
-FILES:${PN} +=3D "${base_libdir}/firmware"
-
-FILES:${PN}-rtos +=3D "ex02_bios_multicore_echo_test"
-FILES:${PN}-rtos +=3D "ex01_bios_2core_echo_test"
-FILES:${PN}-rtos +=3D "ex03_linux_bios_2core_echo_test"
-FILES:${PN}-rtos +=3D "ex04_linux_baremetal_2core_echo_test"
-
-INSANE_SKIP:${PN} =3D "arch ldflags file-rdeps"
-INSANE_SKIP:${PN}-rtos =3D "arch ldflags file-rdeps"
-
-INSANE_SKIP:${PN}-dbg =3D "arch"
diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/=
ipc-lld-fw_git.bb
deleted file mode 100644
index efc56562..00000000
--- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
+++ /dev/null
@@ -1,196 +0,0 @@
-SUMMARY =3D "R5 and DSP IPC Echo Test Firmware Binaries"
-
-LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7eae093f2b09fd39307f30028a068=
b91"
-
-inherit deploy
-inherit update-alternatives
-
-COMPATIBLE_MACHINE =3D "k3"
-
-PV =3D "1.0-git${SRCPV}"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PROTOCOL =3D "git"
-BRANCH =3D "master"
-SRCREV =3D "c9f7cfe61b67998a053fe145344ce0c9b5bb22aa"
-
-SRC_URI =3D "git://git.ti.com/keystone-rtos/ipc-lld.git;protocol=3D${PRO=
TOCOL};branch=3D${BRANCH}"
-
-S =3D "${WORKDIR}/git"
-
-AM65X_R5_FW_DIR =3D "${S}/examples/echo_test/binaries/am65xx"
-J721E_R5_DSP_FW_DIR =3D "${S}/examples/echo_test/binaries/j721e"
-
-PLATFORM:am65xx =3D "am65xx"
-PLATFORM:j7 =3D "j7-evm"
-
-# make sure that lib/firmware, and all its contents are part of the pack=
age
-FILES:${PN} +=3D "${base_libdir}/firmware"
-
-# install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, w=
ith softlinks up a level
-do_install() {
-    install -d ${D}${base_libdir}/firmware/pdk-ipc
-}
-
-do_install:append:am65xx() {
-    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5=
f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.stri=
p.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5=
f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.stri=
p.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-}
-
-do_install:append:j7() {
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.=
xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.=
strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release=
.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release=
.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.=
xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.=
strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release=
.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release=
.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.=
xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.=
strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release=
.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release=
.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.=
xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.=
strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release=
.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release=
.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.=
xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.=
strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release=
.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release=
.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.=
xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.=
strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release=
.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release=
.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_relea=
se.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_relea=
se.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_relea=
se.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_relea=
se.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.x=
e71 ${D}${base_libdir}/firmware/pdk-ipc/
-    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.s=
trip.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
-}
-
-# Set up names for the firmwares
-ALTERNATIVE:${PN}:am65xx =3D "\
-                    am65x-mcu-r5f0_0-fw \
-                    am65x-mcu-r5f0_1-fw \
-                    "
-ALTERNATIVE:${PN}:j7 =3D "\
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
-TARGET_MCU_R5FSS0_0:am65xx =3D "am65x-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:am65xx =3D "am65x-mcu-r5f0_1-fw"
-
-TARGET_MCU_R5FSS0_0:j7 =3D "j7-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:j7 =3D "j7-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0:j7 =3D "j7-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1:j7 =3D "j7-main-r5f0_1-fw"
-TARGET_MAIN_R5FSS1_0:j7 =3D "j7-main-r5f1_0-fw"
-TARGET_MAIN_R5FSS1_1:j7 =3D "j7-main-r5f1_1-fw"
-TARGET_C66_0:j7 =3D "j7-c66_0-fw"
-TARGET_C66_1:j7 =3D "j7-c66_1-fw"
-TARGET_C7X:j7 =3D "j7-c71_0-fw"
-
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/=
${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/=
${TARGET_MCU_R5FSS0_1}"
-
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/${T=
ARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/${T=
ARGET_MCU_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS1_0}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS1_1}"
-ALTERNATIVE_LINK_NAME[j7-c66_0-fw] =3D "${base_libdir}/firmware/${TARGET=
_C66_0}"
-ALTERNATIVE_LINK_NAME[j7-c66_1-fw] =3D "${base_libdir}/firmware/${TARGET=
_C66_1}"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw] =3D "${base_libdir}/firmware/${TARGET=
_C7X}"
-
-# Create the firmware alternatives
-
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_mcu1_0_release.strip.xer5f"
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_mcu1_1_release.strip.xer5f"
-
-ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk-ip=
c/ipc_echo_testb_mcu1_0_release.strip.xer5f"
-ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk-ip=
c/ipc_echo_test_mcu1_1_release.strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk-i=
pc/ipc_echo_test_mcu2_0_release.strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk-i=
pc/ipc_echo_test_mcu2_1_release.strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] =3D "${base_libdir}/firmware/pdk-i=
pc/ipc_echo_test_mcu3_0_release.strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] =3D "${base_libdir}/firmware/pdk-i=
pc/ipc_echo_test_mcu3_1_release.strip.xer5f"
-ALTERNATIVE_TARGET[j7-c66_0-fw] =3D "${base_libdir}/firmware/pdk-ipc/ipc=
_echo_test_c66xdsp_1_release.strip.xe66"
-ALTERNATIVE_TARGET[j7-c66_1-fw] =3D "${base_libdir}/firmware/pdk-ipc/ipc=
_echo_test_c66xdsp_2_release.strip.xe66"
-ALTERNATIVE_TARGET[j7-c71_0-fw] =3D "${base_libdir}/firmware/pdk-ipc/ipc=
_echo_test_c7x_1_release.strip.xe71"
-
-ALTERNATIVE_PRIORITY =3D "10"
-
-# copy the executables into the deploy directory
-
-do_deploy() {
-    :
-}
-
-do_deploy:am65xx() {
-    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPL=
OYDIR}/
-    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f =
${DEPLOYDIR}/
-    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPL=
OYDIR}/
-    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f =
${DEPLOYDIR}/
-}
-
-do_deploy:j7() {
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${=
DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xe=
r5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f $=
{DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.x=
er5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${=
DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xe=
r5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f $=
{DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.x=
er5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${=
DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xe=
r5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f $=
{DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.x=
er5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${=
DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xe=
r5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f $=
{DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.x=
er5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${=
DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xe=
r5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f $=
{DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.x=
er5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${=
DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xe=
r5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f $=
{DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.x=
er5f ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 =
${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip=
.xe66 ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 =
${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip=
.xe66 ${DEPLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${DE=
PLOYDIR}/
-    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe7=
1 ${DEPLOYDIR}/
-}
-
-addtask deploy after do_install before do_build
-
-# This is used to prevent the build system to strip the executables
-INHIBIT_PACKAGE_STRIP =3D "1"
-INHIBIT_SYSROOT_STRIP =3D "1"
-# This is used to prevent the build system to split the debug info in a =
separate file
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-# As it likely to be a different arch from the Yocto build, disable chec=
king by adding "arch" to INSANE_SKIP
-INSANE_SKIP:${PN} +=3D "arch"
-
-# we don't want to configure and build the source code
-do_compile[noexec] =3D "1"
-do_configure[noexec] =3D "1"
diff --git a/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb b/recipes-bsp/ipc-ll=
d/ipc-lld-rtos_git.bb
deleted file mode 100644
index 34f1f035..00000000
--- a/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for IPC"
-
-require ipc-lld.inc
-
-DEPENDS +=3D " osal-rtos common-csl-ip-rtos sciclient-rtos"
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
-        oe_runmake package BOARD=3D$board DEST_ROOT=3D${IPCLLD_PACKAGE_B=
ASE} PDK_IPC_COMP_PATH=3D${S}
-    done
-
-}
-
-do_compile() {
-    cd ${IPCLLD_ROOTPATH}
-
-    oe_runmake lib LIMIT_BOARDS=3D"${TI_PDK_LIMIT_BOARDS}" PDK_IPC_COMP_=
PATH=3D${IPCLLD_ROOTPATH}
-}
-
-do_install() {
-    cd ${IPCLLD_ROOTPATH}
-
-    #remove prebuilt binaries
-    rm -rf examples/echo_test/binaries
-
-    #archive
-    tar -cf ipc-lld.tar --exclude=3D'*.tar' ./*
-
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/ipc
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INST=
ALL_DIR_RECIPE}/packages/ti/drv/ipc \;
-}
-
-FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INSANE_SKIP:${PN} =3D "arch ldflags file-rdeps"
-
-INSANE_SKIP:${PN}-dbg =3D "arch"
diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-ll=
d.inc
deleted file mode 100644
index 6537f520..00000000
--- a/recipes-bsp/ipc-lld/ipc-lld.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.ipc"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7eae093f2b09fd39307f30028a068=
b91"
-
-COMPATIBLE_MACHINE =3D "k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r4"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-IPCLLD_PACKAGE_BASE   =3D "${WORKDIR}/ipclld_base"
-IPCLLD_ROOTPATH =3D "${IPCLLD_PACKAGE_BASE}/package/all/pdk_/packages/ti=
/drv/ipc"
-
-export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
-export PDK_IPC_ROOT_PATH =3D "${IPCLLD_PACKAGE_BASE}/package/all/pdk_/pa=
ckages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "IPCLLD"
-
-EXTRA_OEMAKE =3D "PDK_INSTALL_PATH=3D${PDK_INSTALL_PATH} "
-
-TI_PDK_LIMIT_CORES:append:am65xx-evm =3D " mcu1_1 "
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb b/recipes-bsp/iqn2=
-lld/iqn2-lld-rtos_git.bb
deleted file mode 100644
index 318f1cfe..00000000
--- a/recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for IQN2 peripheral module"
-
-inherit ti-pdk
-
-require recipes-bsp/iqn2-lld/iqn2-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "IQN2 LLD"
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb b/recipes-bsp/iqn2=
-lld/iqn2-lld-test_git.bb
deleted file mode 100644
index f276c4b3..00000000
--- a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION =3D "TI IQN2 peripheral module low level driver test binarie=
s"
-
-DEPENDS =3D "common-csl-ip iqn2-lld dfe-lld"
-
-include iqn2-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
 IQN2_SRC_DIR=3D${WORKDIR}/git"
-
-do_compile () {
-	oe_runmake clean DEVICE=3Dk2l
-	oe_runmake tests DEVICE=3Dk2l
-}
-
-do_install () {
-	oe_runmake installbin DEVICE=3Dk2l IQN2_SRC_DIR=3D${WORKDIR}/git INSTAL=
L_BIN_BASE_DIR=3D${D}/${bindir}
-}
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn=
2-lld.inc
deleted file mode 100644
index 078509fc..00000000
--- a/recipes-bsp/iqn2-lld/iqn2-lld.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D5bdceac872dffdec915b81965=
4ee23ea"
-LICENSE =3D "BSD-3-Clause"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.iqn2"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
-
-COMPATIBLE_MACHINE =3D "k2l"
-
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb b/recipes-bsp/iqn2-lld/=
iqn2-lld_git.bb
deleted file mode 100644
index a0c2ef87..00000000
--- a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION =3D "TI IQN2 peripheral module low level driver"
-
-DEPENDS =3D "common-csl-ip"
-
-include iqn2-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
"
-
-do_configure () {
-	sed -i -e 's/march=3Darmv7-a/march=3Darmv7ve/' build/armv7/libiqn2_aear=
mv7.mk
-}
-
-do_compile () {
-	oe_runmake clean
-	oe_runmake lib
-}
-
-do_install () {
-	oe_runmake install INSTALL_INC_BASE_DIR=3D${D}/${includedir} INSTALL_LI=
B_BASE_DIR=3D${D}${libdir}
-	chown -R root:root ${D}
-}
-
-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/libiqn2.a"
diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mc=
asp-lld/mcasp-lld-rtos_git.bb
deleted file mode 100644
index 9d45f0da..00000000
--- a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for Multi channel Audio Serial por=
t (McASP)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.mcasp"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://mcaspver.h;beginline=3D19;endline=3D47;md5=3D=
75a9adc782a6df0d3a5419743e9a9f18"
-
-COMPATIBLE_MACHINE =3D "ti43x|omap-a15|k2g|ti33x|omapl1|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-
-PR =3D "r0"
-
-
-DEPENDS:append =3D " edma3-lld-rtos \
-                   osal-rtos \
-"
-DEPENDS:append:ti43x =3D " starterware-rtos \
-"
-DEPENDS:append:ti33x =3D " starterware-rtos \
-"
-
-DEPENDS:remove:k3 =3D "edma3-lld-rtos "
-DEPENDS:append:k3 =3D " udma-lld-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_MCASP_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH:append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "MCASP LLD"
diff --git a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb b/recipes-bsp/mc=
bsp-lld/mcbsp-lld-rtos_git.bb
deleted file mode 100644
index f1eeccdd..00000000
--- a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for Multi-channel Buffered Serial =
Port (McBSP)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.mcbsp"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://mcbspver.h;beginline=3D1;endline=3D47;md5=3D=
a8a39efd13fa6fe66da5461b898d620e"
-
-COMPATIBLE_MACHINE =3D "k2g|c665x-evm|omapl1"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r0"
-
-
-DEPENDS:append =3D " edma3-lld-rtos \
-"
-
-export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH:append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"
-
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_MCBSP_ROOT_PATH =3D "${WORKDIR}/build"
-export DEST_ROOT =3D "${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "MCBSP LLD"
diff --git a/recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb b/recipes-bsp/mmap=
-lld/mmap-lld-rtos_git.bb
deleted file mode 100644
index faee5973..00000000
--- a/recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit ti-pdk
-
-require recipes-bsp/mmap-lld/mmap-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "MMAP LLD"
diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap=
-lld/mmap-lld-test_git.bb
deleted file mode 100644
index 0c3cedda..00000000
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION =3D "TI KEYSTONE MMAP driver test binaries "
-include mmap-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-DEPENDS=3D"common-csl-ip mmap-lld"
-RDEPENDS:${PN}=3D"uio-module-drv"
-
-DEVICELIST:k2hk =3D "k2h k2k"
-DEVICELIST:k2e =3D "k2e"
-DEVICELIST:k2l =3D "k2l"
-DEVICELIST:k2g =3D "k2g"
-
-CHOICELIST =3D " yes \
-               no \
-"
-
-do_compile () {
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 clean \
-			PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
-			DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}"
-		for choice in ${CHOICELIST}
-		do
-			make -f makefile_armv7 tests examples \
-				PDK_INSTALL_PATH=3D${STAGING_INCDIR} \
-				DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}" \
-				USEDYNAMIC_LIB=3D"$choice"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 installbin \
-		PDK_INSTALL_PATH=3D${STAGING_INCDIR} \
-		DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}" \
-		INSTALL_BIN_BASE_DIR=3D"${D}/${bindir}"
-	done
-}
diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mma=
p-lld.inc
deleted file mode 100644
index 7e11a4c5..00000000
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-
-COMPATIBLE_MACHINE =3D "keystone"
-
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Db3315b8190036fe1c6a8263d0=
2e15606"
-
-MMAP_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/mmap-lld.git"
-MMAP_LLD_GIT_PROTOCOL =3D "git"
-MMAP_LLD_GIT_BRANCH =3D "master"
-MMAP_LLD_GIT_DESTSUFFIX =3D "git/ti/runtime/mmap"
-
-# Commit correspond to DEV.MMAP.02.00.00.08C
-MMAP_LLD_SRCREV =3D "62e75191ab7144604102dabaa288c5fd5048fc49"
-
-BRANCH=3D"${MMAP_LLD_GIT_BRANCH}"
-SRC_URI =3D "${MMAP_LLD_GIT_URI};destsuffix=3D${MMAP_LLD_GIT_DESTSUFFIX}=
;protocol=3D${MMAP_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
-SRCREV =3D "${MMAP_LLD_SRCREV}"
-
-PV =3D "2.0.0.8C"
-INC_PR =3D "r0"
-
-S =3D "${WORKDIR}/git/ti/runtime/mmap"
diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-lld/=
mmap-lld_git.bb
deleted file mode 100644
index cfc5d4c9..00000000
--- a/recipes-bsp/mmap-lld/mmap-lld_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION =3D "TI KEYSTONE mmap driver using Keystone MPAX Programming=
"
-include mmap-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS=3D"common-csl-ip"
-
-do_compile () {
-	make -f makefile_armv7 clean lib PDK_INSTALL_PATH=3D${STAGING_INCDIR}
-}
-
-do_install () {
-	make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR} INS=
TALL_INC_BASE_DIR=3D${D}/${includedir} INSTALL_LIB_BASE_DIR=3D${D}${libdi=
r}
-	chown -R root:root ${D}
-}
diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb b/recipes-bsp/mm=
csd-lld/mmcsd-lld-rtos_git.bb
deleted file mode 100644
index 3be9f55d..00000000
--- a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY =3D "TI Multimedia card(MMC)/Secure Digital(SD) low level driver=
 for RTOS "
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.mmcsd"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://MMCSD.h;beginline=3D1;endline=3D32;md5=3Df7=
4069541d4d165a000a66b4043cb065"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|omapl1|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-
-PR =3D "r0"
-
-
-DEPENDS:append =3D " edma3-lld-rtos \
-                   osal-rtos \
-"
-DEPENDS:append:ti33x =3D " starterware-rtos \
-"
-DEPENDS:append:ti43x =3D " starterware-rtos \
-"
-DEPENDS:remove:k3 =3D "edma3-lld-rtos "
-
-DEPENDS:append:k3 =3D " sciclient-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_MMCSD_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH:append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "MMCSD LLD"
diff --git a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb b/recipes-bsp/nwal=
-lld/nwal-lld-rtos_git.bb
deleted file mode 100644
index 3153f08a..00000000
--- a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY =3D "TI Network abstraction layer RTOS LLD library "
-
-inherit ti-pdk
-
-require recipes-bsp/nwal-lld/nwal-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS:append =3D " cppi-lld-rtos \
-                   pa-lld-rtos \
-                   pktlib-rtos \
-                   qmss-lld-rtos \
-                   sa-lld-rtos \
-"
-
-COMPATIBLE_MACHINE =3D "k2hk|k2e|k2l|c667x-evm"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "NWAL LLD"
diff --git a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb b/recipes-bsp/nwal=
-lld/nwal-lld-test_git.bb
deleted file mode 100644
index 79528a0a..00000000
--- a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION =3D "TI Network Abstraction Layer unit test binaries"
-
-DEPENDS =3D "common-csl-ip rm-lld qmss-lld hplib pa-lld sa-lld pktlib nw=
al-lld"
-
-include nwal-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
}"
-
-do_compile () {
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake clean NWAL_INC_DIR=3D${BASEDIR} NWAL_SRC_DIR=3D${S} USEDYN=
AMIC_LIB=3D"$choice" DEVICE=3D"$device"
-			oe_runmake tests NWAL_INC_DIR=3D${BASEDIR} NWAL_SRC_DIR=3D${S} USEDYN=
AMIC_LIB=3D"$choice" DEVICE=3D"$device"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake installbin INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL=
_LIB_BASE_DIR=3D${D}${libdir} INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=
=3D"$device"
-	done
-}
diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwa=
l-lld.inc
deleted file mode 100644
index 8dd2c900..00000000
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Db7982a377c680ad71ca2fbb73=
5982462"
-
-COMPATIBLE_MACHINE =3D "keystone"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.nwal"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
-
-BASEDIR =3D "${WORKDIR}/git"
-
-DEVICELIST:k2hk =3D "k2h k2k"
-DEVICELIST:k2l  =3D "k2l"
-DEVICELIST:k2e  =3D "k2e"
-
-CHOICELIST =3D "yes no"
diff --git a/recipes-bsp/nwal-lld/nwal-lld_git.bb b/recipes-bsp/nwal-lld/=
nwal-lld_git.bb
deleted file mode 100644
index a9690cab..00000000
--- a/recipes-bsp/nwal-lld/nwal-lld_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION =3D "TI Network abstraction layer LLD library "
-
-DEPENDS =3D "common-csl-ip rm-lld qmss-lld hplib pa-lld sa-lld pktlib"
-
-include nwal-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
}"
-
-do_compile () {
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake clean NWAL_INC_DIR=3D${BASEDIR} NWAL_SRC_DIR=3D${S} USEDYN=
AMIC_LIB=3D"$choice" DEVICE=3D"$device"
-			oe_runmake lib NWAL_INC_DIR=3D${BASEDIR} NWAL_SRC_DIR=3D${S} USEDYNAM=
IC_LIB=3D"$choice" DEVICE=3D"$device"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake install INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LI=
B_BASE_DIR=3D${D}${libdir} INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D=
"$device"
-	done
-}
diff --git a/recipes-bsp/pa-lld/pa-lld-rtos_git.bb b/recipes-bsp/pa-lld/p=
a-lld-rtos_git.bb
deleted file mode 100644
index 046ec80e..00000000
--- a/recipes-bsp/pa-lld/pa-lld-rtos_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for Packet Accelerator (PA)"
-
-inherit ti-pdk
-
-require recipes-bsp/pa-lld/pa-lld.inc
-COMPATIBLE_MACHINE:append =3D "|c667x-evm"
-PR =3D "${INC_PR}.0"
-
-DEPENDS:append =3D " rm-lld-rtos"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "PA LLD"
diff --git a/recipes-bsp/pa-lld/pa-lld-test_git.bb b/recipes-bsp/pa-lld/p=
a-lld-test_git.bb
deleted file mode 100644
index 760f1882..00000000
--- a/recipes-bsp/pa-lld/pa-lld-test_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "TI PA LLD unit test and example binaries"
-
-DEPENDS =3D "common-csl-ip pa-lld cppi-lld qmss-lld sa-lld"
-
-include pa-lld.inc
-
-PR =3D "${INC_PR}.1"
-
-CHOICELIST =3D "yes no"
-
-CC +=3D "-fcommon"
-
-do_compile () {
-# Now build the lld unit test examples
-	for device in ${DEVICELIST}
-	do
-	make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVIC=
E=3D"$device" PA_SRC_DIR=3D${S}
-		for choice in ${CHOICELIST}
-		do
-			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=3D${STAGING_IN=
CDIR} DEVICE=3D"$device" PA_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D"$choice"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 installbin PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
 DEVICE=3D"$device" PA_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}${bindir=
}
-	done
-}
diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.in=
c
deleted file mode 100644
index e456ccb4..00000000
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-LICENSE =3D "BSD-3-Clause & TI-TFL"
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=3D=
cd04fb087063a2a82c4ce61983836871"
-
-COMPATIBLE_MACHINE =3D "k2hk|k2e|k2l"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.pa"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
-
-
-DEVICELIST =3D "k2h k2k k2l k2e"
-DEVICELIST:k2hk =3D "k2h k2k"
-DEVICELIST:k2l =3D "k2l"
-DEVICELIST:k2e =3D "k2e"
-
-LIBPA =3D "libpa"
-LIBPA:k2hk =3D "libpa"
-LIBPA:k2e =3D "libpa2"
-LIBPA:k2l =3D "libpa2"
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld=
_git.bb
deleted file mode 100644
index bd773b1e..00000000
--- a/recipes-bsp/pa-lld/pa-lld_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION =3D "TI PA LLD library"
-
-DEPENDS =3D "common-csl-ip rm-lld"
-
-include pa-lld.inc
-
-PR =3D "${INC_PR}.1"
-
-do_compile () {
-#   Now build the lld in the updated directory
-    for device in ${DEVICELIST}
-    do
-        make -f makefile_armv7 lib PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
DEVICE=3D"$device"
-    done
-}
-
-do_install () {
-    make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${lib=
dir}
-    chown -R root:root ${D}
-
-#   Set the generic device library symbolic link
-    ln -sf ${LIBPA}.so.1.0.0 ${D}${libdir}/libpa_device.so.1
-    ln -sf libpa_device.so.1 ${D}${libdir}/libpa_device.so
-}
-
-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/libpa2.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2hk =3D "${PKGD}${libdir}/libpa.a"
diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie=
-lld/pcie-lld-rtos_git.bb
deleted file mode 100644
index 22715709..00000000
--- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY =3D "TI RTOS low lever driver for Peripheral Interconnect Expres=
s (PCIE)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.pcie"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://pcie.h;beginline=3D1;endline=3D34;md5=3D232=
c0b07bdf7ab934b23c09e6c5279b0"
-
-COMPATIBLE_MACHINE =3D "omap-a15|keystone|c66x|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r1"
-
-DEPENDS:append:k3 =3D " udma-lld-rtos \
-"
-
-
-export PDK_PCIE_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "PCIe LLD"
diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/p=
m-lld-rtos_git.bb
deleted file mode 100644
index fd01c8ef..00000000
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ /dev/null
@@ -1,71 +0,0 @@
-SUMMARY =3D "TI RTOS driver for Power Management module (PM)"
-
-inherit ti-pdk
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://Power.h;beginline=3D1;endline=3D31;md5=3D52=
7b91fdcd26cd19ac07a754f45dedbe"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-
-PM_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/pm-lld.git"
-PM_LLD_GIT_PROTOCOL =3D "git"
-
-PM_LLD_GIT_BRANCH =3D "master"
-
-PM_LLD_GIT_BRANCH:ti33x =3D "int_pm_am335x"
-PM_LLD_GIT_BRANCH:ti43x =3D "int_pm_am335x"
-PM_LLD_GIT_BRANCH:k2g =3D "int_pm_am335x"
-
-PM_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/pm"
-
-# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.23A"
-PM_LLD_SRCREV =3D "59abc6ffb890d24b82de0248d204ad10c1bfc2af"
-
-# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05C"
-PM_LLD_SRCREV:ti33x =3D "dd1f8486e7738956631b7f4829c8238be2e49dd6"
-PM_LLD_SRCREV:ti43x =3D "dd1f8486e7738956631b7f4829c8238be2e49dd6"
-PM_LLD_SRCREV:k2g =3D "dd1f8486e7738956631b7f4829c8238be2e49dd6"
-
-BRANCH =3D "${PM_LLD_GIT_BRANCH}"
-SRC_URI =3D "${PM_LLD_GIT_URI};destsuffix=3D${PM_LLD_GIT_DESTSUFFIX};pro=
tocol=3D${PM_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
-
-SRCREV =3D "${PM_LLD_SRCREV}"
-PV =3D "01.08.00.23A"
-PR =3D "r0"
-
-S =3D "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
-
-DEPENDS:append =3D " ti-sysbios \
-            osal-rtos \
-"
-DEPENDS:append:ti33x =3D " starterware-rtos \
-"
-DEPENDS:append:ti43x =3D " starterware-rtos \
-"
-
-DEPENDS:append:k3 =3D " sciclient-rtos \
-"
-
-export PDK_PM_ROOT_PATH =3D "${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-do_compile:append() {
-    # Delete archive created by XDC release command since it does not co=
ntain all content
-    find -name "*.tar" -exec rm -f {} \;
-
-    # Archive from build/ to capture ti/drv/pm/ in archive
-    cd ${B}
-    tar -cf pm_lld.tar --exclude=3D'*.tar' ./*
-}
-
-
-# Workaround: dra7xx build requires am57xx pm libraries for opencl-monit=
or
-TI_PDK_LIMIT_SOCS:append:dra7xx =3D " am571x am572x am574x"
-TI_PDK_LIMIT_BOARDS:append:dra7xx =3D " evmAM571x evmAM572x idkAM574x"
-
-INSANE_SKIP:${PN} =3D "arch staticdev"
diff --git a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb b/recipes-bsp/pr=
uss-lld/pruss-lld-apps_git.bb
deleted file mode 100644
index 74ceb819..00000000
--- a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION =3D "TI PRUSS low level driver example applications"
-
-DEPENDS=3D"common-csl-ip pruss-lld osal ti-pdk-build-rtos pruss-lld-rtos=
"
-
-DEPENDS:append:ti33x =3D " starterware"
-DEPENDS:append:ti43x =3D " starterware"
-
-include pruss-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
} PDK_PKG_PATH=3D${STAGING_DATADIR}/ti/ti-pdk-tree/packages PRUSS_SRC_DIR=
=3D${S}"
-
-
-DEVICE_LIST ?=3D "${TI_PDK_LIMIT_SOCS}"
-
-do_compile () {
-#   Build the apps
-    for device in ${DEVICE_LIST}
-    do
-        oe_runmake apps DEVICE=3D"$device"
-    done
-}
-
-do_install () {
-#   Install the app binary
-    for device in ${DEVICE_LIST}
-    do
-        oe_runmake installapp INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVIC=
E=3D"$device"
-    done
-}
diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/pr=
uss-lld/pruss-lld-rtos_git.bb
deleted file mode 100644
index 9b6ec7a8..00000000
--- a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver library for PRUSS"
-
-inherit ti-pdk
-require recipes-bsp/pruss-lld/pruss-lld.inc
-
-COMPATIBLE_MACHINE:append =3D "|k3"
-PR =3D "${INC_PR}.0"
-
-DEPENDS:append =3D " osal-rtos"
-DEPENDS:append:ti33x =3D " starterware-rtos"
-DEPENDS:append:ti43x =3D " starterware-rtos"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_PRUSS_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${WORKDIR}/build"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "PRUSS LLD"
-
-INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb b/recipes-bsp/pr=
uss-lld/pruss-lld-test_git.bb
deleted file mode 100644
index 8007f652..00000000
--- a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION =3D "TI PRUSS low level driver tests"
-
-DEPENDS =3D "common-csl-ip pruss-lld osal"
-
-include pruss-lld.inc
-
-PR =3D "${INC_PR}.2"
-
-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
} PRUSS_SRC_DIR=3D${S}"
-
-DEVICE_LIST ?=3D "${TI_PDK_LIMIT_SOCS}"
-
-do_compile () {
-#   Build the tests
-    for device in ${DEVICE_LIST}
-    do
-        oe_runmake tests DEVICE=3D"$device"
-    done
-}
-
-do_install () {
-#   Install the binary
-    for device in ${DEVICE_LIST}
-    do
-        oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVIC=
E=3D"$device"
-    done
-}
diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/=
pruss-lld.inc
deleted file mode 100644
index fe5987a4..00000000
--- a/recipes-bsp/pruss-lld/pruss-lld.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://pruicss.h;beginline=3D1;endline=3D31;md5=3D=
315177aa03d58bcd124a6e799e2bd458"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.pruss"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
-
-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/libpruss.a"
diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bb b/recipes-bsp/pruss-l=
ld/pruss-lld_git.bb
deleted file mode 100644
index f1e93cd7..00000000
--- a/recipes-bsp/pruss-lld/pruss-lld_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION =3D "TI PRUSS low level driver library"
-
-DEPENDS =3D "common-csl-ip osal"
-
-include pruss-lld.inc
-
-PR =3D "${INC_PR}.2"
-
-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
}"
-
-do_compile () {
-#   Build the lib
-    oe_runmake clean
-    oe_runmake lib
-}
-
-do_install () {
-#   Install the lib
-    oe_runmake install INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_=
LIB_BASE_DIR=3D${D}${libdir}
-    chown -R root:root ${D}
-}
diff --git a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb b/recipes-bsp/qmss=
-lld/qmss-lld-rtos_git.bb
deleted file mode 100644
index d854e0bc..00000000
--- a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-inherit ti-pdk
-
-require qmss-lld.inc
-
-PR =3D "${INC_PR}.1"
-
-COMPATIBLE_MACHINE:append =3D "|c66x"
-
-DEPENDS:append =3D " rm-lld-rtos"
diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss=
-lld/qmss-lld-test_git.bb
deleted file mode 100644
index 53f6dcff..00000000
--- a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "TI QMSS low level driver unit test and example binaries=
"
-
-DEPENDS =3D "common-csl-ip rm-lld cppi-lld qmss-lld cmem uio-module-drv"
-
-include qmss-lld.inc
-
-PR =3D "${INC_PR}.2"
-
-CHOICELIST =3D "yes no"
-
-CFLAGS +=3D "-fcommon"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVI=
CE=3D"$device" QMSS_SRC_DIR=3D${S}
-		for choice in ${CHOICELIST}
-		do
-			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=3D${STAGING_IN=
CDIR} DEVICE=3D"$device" QMSS_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D"$choice"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 installbin PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
 DEVICE=3D"$device" QMSS_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}${bind=
ir}
-	done
-}
diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qms=
s-lld.inc
deleted file mode 100644
index 35a06af1..00000000
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-LICENSE =3D "BSD-3-Clause & TI-TFL"
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=3D=
cd04fb087063a2a82c4ce61983836871"
-
-COMPATIBLE_MACHINE =3D "keystone"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.qmss"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
-
-DEVICELIST =3D "k2h k2k k2l k2e"
-DEVICELIST:k2hk =3D "k2h k2k"
-DEVICELIST:k2l =3D "k2l"
-DEVICELIST:k2e =3D "k2e"
-DEVICELIST:k2g =3D "k2h"
diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/=
qmss-lld_git.bb
deleted file mode 100644
index 96c664a1..00000000
--- a/recipes-bsp/qmss-lld/qmss-lld_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION =3D "TI QMSS low level driver library"
-
-DEPENDS =3D "common-csl-ip rm-lld"
-
-include qmss-lld.inc
-
-PR =3D "${INC_PR}.1"
-
-do_compile () {
-#   Now build the lld
-    make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR}
-	for device in ${DEVICELIST}
-	do
-		make -f makefile_armv7 lib PDK_INSTALL_PATH=3D${STAGING_INCDIR}  DEVIC=
E=3D"${device}"
-	done
-}
-
-do_install () {
-    make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${lib=
dir}
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
-INHIBIT_PACKAGE_STRIP_FILES:k2hk =3D "${PKGD}${libdir}/libqmss_k2h.a ${P=
KGD}${libdir}/libqmss_k2k.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2e =3D "${PKGD}${libdir}/libqmss_k2e.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2l =3D "${PKGD}${libdir}/libqmss_k2l.a"
-INHIBIT_PACKAGE_STRIP_FILES:k2g =3D "${PKGD}${libdir}/libqmss_k2h.a"
-INHIBIT_PACKAGE_STRIP_FILES:append =3D " ${PKGD}${libdir}/libqmss.a"
diff --git a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb b/recipes-bsp/rm-lld/r=
m-lld-rtos_git.bb
deleted file mode 100644
index 2a279a0a..00000000
--- a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-inherit ti-pdk
-
-COMPATIBLE_MACHINE:append =3D "|c66x"
-
-require rm-lld.inc
-
-PR =3D "${INC_PR}.2"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "RM LLD"
-
diff --git a/recipes-bsp/rm-lld/rm-lld.inc b/recipes-bsp/rm-lld/rm-lld.in=
c
deleted file mode 100644
index e6e61af0..00000000
--- a/recipes-bsp/rm-lld/rm-lld.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION =3D "TI Resource Manager Low Level Driver"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=3D=
dc61631b65360e6beb73b6c337800afc"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.rm"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
-
-COMPATIBLE_MACHINE =3D "keystone"
-
-BASEDIR =3D "${WORKDIR}/git"
diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld=
_git.bb
deleted file mode 100644
index 86f7ec73..00000000
--- a/recipes-bsp/rm-lld/rm-lld_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require rm-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS =3D "ti-ipc libdaemon"
-
-PACKAGES =3D+ "${PN}-test"
-
-FILES:${PN}-test =3D "${bindir}/rmDspClientTest.out \
-                    ${bindir}/rmLinuxClientTest.out \
-                    ${bindir}/rmLinuxMtClientTest.out \
-                    ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
-
-CHOICELIST =3D "yes no"
-
-do_compile () {
-#   Now build the lld
-    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=3D${STAGING_INCDIR=
} RM_SRC_DIR=3D${S}
-    for choice in ${CHOICELIST}
-    do
-      make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=3D${STAGING_I=
NCDIR} PDK_INSTALL_PATH=3D${BASEDIR} USEDYNAMIC_LIB=3D"$choice"
-    done
-}
-
-do_install () {
-    install -d ${D}${includedir}/ti/drv/rm
-    install -d ${D}${libdir}
-    install -d ${D}${bindir}
-    make -f makefile_armv7 install installbin installbin_test INSTALL_IN=
C_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${libdir} INSTA=
LL_BIN_BASE_DIR=3D${D}${bindir}
-    chown -R root:root ${D}
-}
-
-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/librm.a"
diff --git a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb b/recipes-bsp/sa-lld/s=
a-lld-rtos_git.bb
deleted file mode 100644
index b7c0257c..00000000
--- a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for Security Accelerator (SA)"
-
-inherit ti-pdk
-
-require recipes-bsp/sa-lld/sa-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-COMPATIBLE_MACHINE:append =3D "|c667x-evm|k3"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE:k3 =3D "0"
-
-# SA promote/demote library depends on osal
-DEPENDS:append =3D " osal-rtos \
-"
-export PDK_SA_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-INSANE_SKIP:${PN} =3D "arch"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "SA LLD"
-
diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/s=
a-lld-test_git.bb
deleted file mode 100644
index b403aff7..00000000
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-DESCRIPTION =3D "TI Security Accelerator LLD (SA LLD) Examples"
-
-DEPENDS =3D "common-csl-ip cppi-lld qmss-lld pa-lld sa-lld"
-
-include sa-lld.inc
-
-PR =3D "${INC_PR}.1"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-DEVICELIST:k2hk =3D "k2h k2k"
-DEVICELIST:k2l  =3D "k2l"
-DEVICELIST:k2e  =3D "k2e"
-
-CHOICELIST =3D "no yes"
-
-CFLAGS +=3D "-fcommon"
-
-PARALLEL_MAKE =3D ""
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
 SA_SRC_DIR=3D${S}"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	for device in ${DEVICELIST}
-	do
-		oe_runmake clean DEVICE=3D"$device"
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake examples utils DEVICE=3D"$device" USEDYNAMIC_LIB=3D"$choic=
e"
-		done
-	done
-}
-
-do_install () {
-	install -d ${D}${bindir}/ti/drv/sa/example/SaBasicExample/vectors
-
-# copy all the test vectors
-	find example/SaBasicExample/vectors -name *.bin -type f | xargs -I {} c=
p --parents {} ${D}${bindir}/ti/drv/sa
-
-	for device in ${DEVICELIST}
-	do
-		oe_runmake installbin DEVICE=3D"$device" INSTALL_BIN_BASE_DIR=3D${D}${=
bindir}
-	done
-}
-
-INSANE_SKIP:${PN} =3D "ldflags"
diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.in=
c
deleted file mode 100644
index d4993cb9..00000000
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-LICENSE =3D "BSD-3-Clause & TI-TFL"
-COMPATIBLE_MACHINE =3D "k2hk|k2e|k2l"
-
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=3D=
cd04fb087063a2a82c4ce61983836871"
-
-SA_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/sa-lld.git"
-SA_LLD_GIT_PROTOCOL =3D "git"
-SA_LLD_GIT_BRANCH =3D "master"
-SA_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/sa"
-
-# Below commit ID corresponding to "DEV.SA_LLD.04.00.00.03D"
-SA_LLD_SRCREV =3D "506491b586c13c90f307b527df5eaacd35af6d02"
-
-BRANCH =3D "${SA_LLD_GIT_BRANCH}"
-SRC_URI =3D "${SA_LLD_GIT_URI};destsuffix=3D${SA_LLD_GIT_DESTSUFFIX};pro=
tocol=3D${SA_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
-SRCREV =3D "${SA_LLD_SRCREV}"
-
-PV =3D "04.00.00.03D"
-INC_PR =3D "r0"
-
-S =3D "${WORKDIR}/${SA_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/sa-lld/sa-lld_git.bb b/recipes-bsp/sa-lld/sa-lld=
_git.bb
deleted file mode 100644
index a45fe1f7..00000000
--- a/recipes-bsp/sa-lld/sa-lld_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION =3D "TI Security Accelerator LLD (SA LLD) Library"
-
-DEPENDS =3D "common-csl-ip"
-
-include sa-lld.inc
-
-PR =3D "${INC_PR}.1"
-
-PARALLEL_MAKE =3D ""
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	oe_runmake clean lib
-}
-
-do_install () {
-	oe_runmake install INSTALL_INC_BASE_DIR=3D${D}/${includedir} INSTALL_LI=
B_BASE_DIR=3D${D}${libdir}
-	chown -R root:root ${D}
-
-#   Set the generic device library symbolic link
-	ln -sf libsa.so.1.0.0 ${D}${libdir}/libsa_device.so.1
-	ln -sf libsa_device.so.1 ${D}${libdir}/libsa_device.so
-}
-
-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/libsa.a"
diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb b/recipes-bsp/spi-ll=
d/spi-lld-rtos_git.bb
deleted file mode 100644
index 43cf0c38..00000000
--- a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for Serial Peripheral Interface (S=
PI)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.spi"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://SPI.h;beginline=3D1;endline=3D31;md5=3D8580=
f9c5c0de8d5d13518cf18a0122b8"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|c66x|omapl1|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r0"
-
-DEPENDS:append =3D " osal-rtos \
-                   edma3-lld-rtos \
-"
-DEPENDS:append:ti33x =3D " starterware-rtos pruss-lld-rtos gpio-lld-rtos=
"
-DEPENDS:append:ti43x =3D " starterware-rtos pruss-lld-rtos gpio-lld-rtos=
"
-
-DEPENDS:remove:k3 =3D "edma3-lld-rtos "
-DEPENDS:append:k3 =3D " udma-lld-rtos"
-
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_SPI_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH:append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "SPI LLD"
diff --git a/recipes-bsp/srio-lld/srio-lld-rtos_git.bb b/recipes-bsp/srio=
-lld/srio-lld-rtos_git.bb
deleted file mode 100644
index 9c535759..00000000
--- a/recipes-bsp/srio-lld/srio-lld-rtos_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for Serial Rapid IO (SRIO)"
-
-inherit ti-pdk
-
-require recipes-bsp/srio-lld/srio-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS:append =3D " cppi-lld-rtos \
-                   qmss-lld-rtos \
-"
-COMPATIBLE_MACHINE:append =3D "|c66x"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "SRIO LLD"
diff --git a/recipes-bsp/srio-lld/srio-lld-test_git.bb b/recipes-bsp/srio=
-lld/srio-lld-test_git.bb
deleted file mode 100644
index ca22b7d5..00000000
--- a/recipes-bsp/srio-lld/srio-lld-test_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "TI SRIO peripheral low level driver unit test and examp=
le binaries"
-DEPENDS=3D"common-csl-ip rm-lld cppi-lld qmss-lld srio-lld cmem uio-modu=
le-drv"
-
-include srio-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-CHOICELIST =3D "yes no"
-
-CFLAGS +=3D "-fcommon"
-
-do_compile () {
-#   Now build the lld in the updated directory
-	for device in ${DEVICELIST}
-	do
-		oe_runmake clean DEVICE=3D"$device" SRIO_SRC_DIR=3D${S}
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake tests DEVICE=3D"$device" SRIO_SRC_DIR=3D${S} USEDYNAMIC_LI=
B=3D"$choice"
-			oe_runmake examples DEVICE=3D"$device" SRIO_SRC_DIR=3D${S} USEDYNAMIC=
_LIB=3D"$choice"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake installbin DEVICE=3D"$device" SRIO_SRC_DIR=3D${S} INSTALL_B=
IN_BASE_DIR=3D${D}${bindir}
-	done
-}
diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/sri=
o-lld.inc
deleted file mode 100644
index efe379ff..00000000
--- a/recipes-bsp/srio-lld/srio-lld.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/ti/drv/srio/srio_drv.h;begin=
line=3D1;endline=3D41;md5=3D469096088e072d883ff7eef301b34093"
-
-COMPATIBLE_MACHINE =3D "k2hk"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.srio"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
-
-DEVICELIST =3D "k2h k2k"
-
-BASEDIR =3D "${WORKDIR}/git"
-
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
"
diff --git a/recipes-bsp/srio-lld/srio-lld_git.bb b/recipes-bsp/srio-lld/=
srio-lld_git.bb
deleted file mode 100644
index 3797bef6..00000000
--- a/recipes-bsp/srio-lld/srio-lld_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION =3D "TI SRIO peripheral low level driver"
-
-DEPENDS=3D"common-csl-ip rm-lld cppi-lld"
-
-include srio-lld.inc
-
-PR =3D "${INC_PR}.0"
-
-do_compile () {
-#   Now build the lld
-	oe_runmake clean
-	for device in ${DEVICELIST}
-	do
-		oe_runmake lib DEVICE=3D"${device}"
-	done
-}
-
-do_install () {
-	oe_runmake install INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB=
_BASE_DIR=3D${D}${libdir}
-	chown -R root:root ${D}
-}
diff --git a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb b/recipes-bsp/tc=
p3d-lld/tcp3d-lld-rtos_git.bb
deleted file mode 100644
index db4421ee..00000000
--- a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY =3D "TI third generation Turbo Coprocessor (TCP3) low level driv=
er"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.tcp3d"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://tcp3dver.h;beginline=3D1;endline=3D47;md5=3D=
3fe46c6320fb9ca4ac6692961402beb7"
-
-COMPATIBLE_MACHINE =3D "k2hk|k2l|c66x"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r0"
-
-DEPENDS:append =3D " edma3-lld-rtos"
-
-export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH:append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "TCP3D LLD"
diff --git a/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb b/recipes-bsp/tsip=
-lld/tsip-lld-rtos_git.bb
deleted file mode 100644
index bd8a6e37..00000000
--- a/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for Telecom Serial Interface Port =
(TSIP)"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.tsip"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://tsip.h;beginline=3D1;endline=3D32;md5=3Ddab=
2257b0b8a3678c26915f6eb49b71e"
-
-COMPATIBLE_MACHINE =3D "k2e|c667x-evm"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r0"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "TSIP LLD"
diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart=
-lld/uart-lld-rtos_git.bb
deleted file mode 100644
index 8071e42b..00000000
--- a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for UART"
-DESCRIPTION =3D "TI RTOS low level driver for Universal Asynchronous Rec=
eiver/Transmitter (UART) module "
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.uart"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;beginline=3D1;endline=3D31;md5=3D=
94b6a199da1caf777f6756cb70aca4a7"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r0"
-
-DEPENDS:append =3D " edma3-lld-rtos \
-                   osal-rtos \
-"
-DEPENDS:append:ti33x =3D " starterware-rtos \
-                         pruss-lld-rtos \
-"
-DEPENDS:append:ti43x =3D " starterware-rtos"
-
-DEPENDS:remove:k3 =3D "edma3-lld-rtos "
-DEPENDS:append:k3 =3D " udma-lld-rtos "
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_UART_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH:append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "UART LLD"
-
-INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma=
-lld/udma-lld-rtos_git.bb
deleted file mode 100644
index 2e17770c..00000000
--- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for UDMA"
-DESCRIPTION =3D "TI RTOS low level driver for Universal DMA module "
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.udma"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://udma.h;beginline=3D1;endline=3D31;md5=3D83d=
177cf3df55c16b27ae4102b6ade9a"
-
-COMPATIBLE_MACHINE =3D "k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r1"
-
-DEPENDS:append =3D " osal-rtos \
-                   sciclient-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-UDMA_PACKAGE_BASE   =3D "${WORKDIR}/udma_base"
-UDMA_LLD_ROOTPATH =3D "${UDMA_PACKAGE_BASE}/package/all/pdk_/packages/ti=
/drv/udma"
-
-export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
-export PDK_UDMA_ROOT_PATH =3D "${UDMA_PACKAGE_BASE}/package/all/pdk_/pac=
kages"
-
-TI_PDK_LIMIT_BOARDS:am65xx =3D "am65xx_evm"
-
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "UDMA LLD"
-
-do_configure() {
-    # remove any previous package
-    rm -rf ${UDMA_PACKAGE_BASE}
-
-    cd ${S}
-
-    # make the release package before building it
-    make package BOARD=3D"${TI_PDK_LIMIT_BOARDS}" DEST_ROOT=3D${UDMA_PAC=
KAGE_BASE} PDK_UDMA_COMP_PATH=3D${S}
-}
-
-do_compile() {
-    cd ${UDMA_LLD_ROOTPATH}
-
-    # Build am65xx libraries
-    make clean lib xdc_meta doxygen LIMIT_SOCS=3D"${TI_PDK_LIMIT_SOCS}" =
LIMIT_BOARDS=3D"${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES=3D"${TI_PDK_LIMIT_COR=
ES}"
-
-    #archive
-    tar -cf udma_lld.tar --exclude=3D'*.tar' ./*
-}
-
-do_install() {
-    cd ${UDMA_LLD_ROOTPATH}
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/udma
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INST=
ALL_DIR_RECIPE}/packages/ti/drv/udma \;
-}
-
-FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INSANE_SKIP:${PN} =3D "arch ldflags"
diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-ll=
d/usb-lld-rtos_git.bb
deleted file mode 100644
index 77862706..00000000
--- a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY =3D "TI RTOS USB low level driver"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.usb"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://USBver.h;beginline=3D16;endline=3D46;md5=3D=
5394fa32763383d2c8e2aca5a1c67805"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|omapl1|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r0"
-
-DEPENDS:append =3D " osal-rtos"
-DEPENDS:append:ti33x =3D " starterware-rtos"
-DEPENDS:append:ti43x =3D " starterware-rtos"
-DEPENDS:append:k3 =3D " sciclient-rtos"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_USB_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "USB LLD"
diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-ll=
d/vps-lld-rtos_git.bb
deleted file mode 100644
index 7e0695ab..00000000
--- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-SUMMARY =3D "TI RTOS Low level driver for Video Processing Subsystem (VP=
S) "
-
-inherit ti-pdk
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;beginline=3D1;endline=3D32;md5=3D=
4303d306ea53eb66132983d6901c137d"
-
-COMPATIBLE_MACHINE =3D "omap-a15"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-VPS_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/vps.git"
-VPS_LLD_GIT_PROTOCOL =3D "git"
-VPS_LLD_GIT_BRANCH =3D "master"
-VPS_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/vps"
-
-# Below commit ID corresponds to "DEV.VPS_LLD.01.00.01.13A"
-VPS_LLD_SRCREV =3D "f6d7c1f9cee42da1368e6414b4feeb84227d620e"
-
-BRANCH =3D "${VPS_LLD_GIT_BRANCH}"
-SRC_URI =3D "${VPS_LLD_GIT_URI};destsuffix=3D${VPS_LLD_GIT_DESTSUFFIX};p=
rotocol=3D${VPS_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
-
-SRCREV =3D "${VPS_LLD_SRCREV}"
-PV =3D "01.00.01.13A"
-PR =3D "r0"
-
-S =3D "${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}"
-
-# Add to DEPENDS set in ti-pdk.bbclass
-DEPENDS:append =3D " \
-            ti-sysbios \
-            osal-rtos \
-            edma3-lld-rtos \
-            board-rtos \
-            uart-lld-rtos \
-            i2c-lld-rtos \
-            pm-lld-rtos \
-"
-export PDK_VPS_COMP_PATH =3D "${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-# The makefile will push these on the XDCPATH
-export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-
-do_compile:append() {
-    # Delete archive created by XDC release command since it does not co=
ntain all content
-    find -name "*.tar" -exec rm -f {} \;
-
-    # Archive from build/ to capture ti/drv/pm/ in archive
-    cd ${B}
-    tar -cf pm_lld.tar --exclude=3D'*.tar' ./*
-}
-
-INSANE_SKIP:${PN} =3D "arch ldflags"
--=20
2.25.1

