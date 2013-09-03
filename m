Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 220EFE00734
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 10:08:14 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id AB55D52A76; Tue,  3 Sep 2013 17:08:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130903170812.AB55D52A76@arago-project.org>
Date: Tue,  3 Sep 2013 17:08:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libgles-omap3, omap3-sgx-modules: remove old 4.03.00. 02 version
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
X-List-Received-Date: Tue, 03 Sep 2013 17:08:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 84576bfff1207eabe9479ab20fcdcc45a9d28763
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=84576bfff1207eabe9479ab20fcdcc45a9d28763

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Aug 31 23:11:32 2013 -0400

libgles-omap3, omap3-sgx-modules: remove old 4.03.00.02 version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap3-sgx-modules_1.6.16.3977.bb               |   45 --------------------
 .../libgles/libgles-omap3_4.03.00.02.bb            |   30 -------------
 2 files changed, 0 insertions(+), 75 deletions(-)

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


