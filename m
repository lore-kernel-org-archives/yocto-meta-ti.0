Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7C1FE01419
	for <meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 20:13:27 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSF002XTFLXT780@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 31 Aug 2013 22:13:09 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E87EB2004C; Sat,
	31 Aug 2013 23:13:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sat, 31 Aug 2013 23:13:00 -0400
Message-id: <1378005180-30928-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1378005180-30928-1-git-send-email-denis@denix.org>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/5] libgles-omap3, omap3-sgx-modules: remove old 4.03.00.02 version
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
X-List-Received-Date: Sun, 01 Sep 2013 03:13:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../omap3-sgx-modules_1.6.16.3977.bb               | 45 ----------------------
 .../libgles/libgles-omap3_4.03.00.02.bb            | 30 ---------------
 2 files changed, 75 deletions(-)
 delete mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
 delete mode 100644 recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
deleted file mode 100644
index 4f9be7b..0000000
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=21228a42e27d1d104b31a83f7c9da935"
-
-TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
-require ../../recipes-ti/includes/ti-eula-unpack.inc
-
-SGXPV = "4_03_00_02"
-IMGPV = "1.6.16.3977"
-BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
-
-inherit module
-
-MACHINE_KERNEL_PR_append = "b"
-PR = "${MACHINE_KERNEL_PR}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
-           file://Compile-fixes-for-38-kernel.patch \
-           file://kernel-30.patch \
-          "
-SRC_URI[md5sum] = "ff8c1f2b8e4cb42f4ced6a613b081ada"
-SRC_URI[sha256sum] = "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036423458c8d75255"
-TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
-S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
-
-PVRBUILD = "release"
-export KERNELDIR = "${STAGING_KERNEL_DIR}"
-
-INHIBIT_PACKAGE_STRIP = "1"
-
-TI_PLATFORM_omap3 = "omap3630"
-TI_PLATFORM_ti816x = "ti81xx"
-
-MODULESLOCATION_omap3 = "dc_omap3430_linux"
-MODULESLOCATION_ti816x = "dc_ti81xx_linux"
-
-MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM}"
-
-do_install() {
-	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
-	cp ${S}/pvrsrvkm.ko \
-	   ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
-	   ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
-	   ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
-}
diff --git a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb b/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
deleted file mode 100644
index e98fe02..0000000
--- a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
-BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
-
-ES2LOCATION = "${S}/gfx_rel_es2.x"
-ES3LOCATION = "${S}/gfx_rel_es3.x"
-ES5LOCATION = "${S}/gfx_rel_es5.x"
-ES6LOCATION = "${S}/gfx_rel_es6.x"
-
-require libgles-omap3.inc
-
-# download required binary distribution from:
-# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
-# see libgles-omap3.inc for detailed installation instructions
-
-SGXPV = "4_03_00_02"
-IMGPV = "1.6.16.3977"
-BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
-TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
-                   file://cputype \
-                   file://rc.pvr \
-                   file://sample.desktop \
-                   file://99-bufferclass.rules  \
-"
-
-SRC_URI[md5sum] = "ff8c1f2b8e4cb42f4ced6a613b081ada"
-SRC_URI[sha256sum] = "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036423458c8d75255"
-
-S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
-- 
1.8.3.2


