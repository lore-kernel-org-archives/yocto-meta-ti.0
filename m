Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B343E01494
	for <meta-ti@yoctoproject.org>; Tue,  2 Apr 2013 12:43:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2B05252A97; Tue,  2 Apr 2013 19:43:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130402194312.2B05252A97@arago-project.org>
Date: Tue,  2 Apr 2013 19:43:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : omap3-sgx-modules: Add version 4.08.00. 02 of the Graphics SDK kernel modules
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
X-List-Received-Date: Tue, 02 Apr 2013 19:43:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 372e20c5441e7fb8aebca869627410aac8b0593f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=372e20c5441e7fb8aebca869627410aac8b0593f

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Tue Mar 19 21:10:30 2013 -0500

omap3-sgx-modules: Add version 4.08.00.02 of the Graphics SDK kernel modules

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap3-sgx-modules_4.08.00.02.bb                |   56 ++++++++++++++++++++
 1 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb
new file mode 100644
index 0000000..793de14
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea5743acf520dd81ca172e69f818a3d4"
+
+TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+require ../../recipes-ti/includes/ti-eula-unpack.inc
+
+SGXPV = "4_08_00_02"
+IMGPV = "1.9.2188537"
+BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
+
+SRC_URI[md5sum] = "0efa3a38266e6f41f8cc4fad0187f0d6"
+SRC_URI[sha256sum] = "c732044b515a598e1fab661b7463aa9c53d4fa37f4980dfa85cd02b7468d0cd9"
+
+TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
+
+PVRBUILD = "release"
+export KERNELDIR = "${STAGING_KERNEL_DIR}"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+TI_PLATFORM_omap3 = "omap3630"
+TI_PLATFORM_ti814x = "ti81xx"
+TI_PLATFORM_ti816x = "ti81xx"
+TI_PLATFORM_ti33x = "ti335x"
+
+MODULESLOCATION_omap3 = "dc_omapfb3_linux"
+MODULESLOCATION_ti814x = "dc_ti81xx_linux"
+MODULESLOCATION_ti816x = "dc_ti81xx_linux"
+MODULESLOCATION_ti33x = "dc_ti335x_linux"
+
+export SUPPORT_XORG ?= "${@base_contains('DISTRO_FEATURES', 'x11', '1', '0', d)}"
+
+MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=${SUPPORT_XORG}"
+
+do_install() {
+    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+    cp  ${S}/pvrsrvkm.ko \
+        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
+        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
+        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+
+    if [ "${SUPPORT_XORG}" = "1" ]; then
+        cp ${S}/services4/3rdparty/linux_drm/drm.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+    fi
+}


