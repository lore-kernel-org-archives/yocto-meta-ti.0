Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5626E00569
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 07:58:12 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJFwCux007892
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 09:58:12 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJFwB8V020535
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 09:58:11 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 19 Nov 2013 09:58:11 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJFw35A006410;
	Tue, 19 Nov 2013 09:58:10 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Nov 2013 10:59:10 -0600
Message-ID: <1384880351-6571-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1384880351-6571-1-git-send-email-fcooper@ti.com>
References: <1384880351-6571-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] omap3-sgx-modules: Add new Graphics SDK 05.00.00.01
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
X-List-Received-Date: Tue, 19 Nov 2013 15:58:12 -0000
Content-Type: text/plain

* This new Graphics SDK support 3.12 kernel for am335x and adds initial
  support for am43x.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...0.01.bb => omap3-sgx-modules-x11_5.00.00.01.bb} |   26 +++++++++----------
 ...08.00.02.bb => omap3-sgx-modules_5.00.00.01.bb} |   20 ++++++++++----
 2 files changed, 26 insertions(+), 20 deletions(-)
 copy recipes-bsp/powervr-drivers/{omap3-sgx-modules-x11_4.09.00.01.bb => omap3-sgx-modules-x11_5.00.00.01.bb} (67%)
 copy recipes-bsp/powervr-drivers/{omap3-sgx-modules_4.08.00.02.bb => omap3-sgx-modules_5.00.00.01.bb} (69%)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_5.00.00.01.bb
similarity index 67%
copy from recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
copy to recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_5.00.00.01.bb
index 14f1860..f1befdc 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_5.00.00.01.bb
@@ -5,31 +5,27 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea5743acf520dd81ca172e69f818a3d4"
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
 require ../../recipes-ti/includes/ti-eula-unpack.inc
 
-SGXPV = "4_09_00_01"
+SGXPV = "5_00_00_01"
 IMGPV = "1.9.2188537"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "d"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 DEFAULT_PREFERENCE = "-1"
 
-# Select the corresponding hardfp/softfp filename and checksums based on tune flags
-BINFILE_SOFTFP = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
-MD5SUM_SOFTFP = "bd35e9d8843aff3a2aca9d41e7db1c7d"
-SHA256SUM_SOFTFP = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+BINFILE_HARDFP = "Graphics_SDK_setuplinux_${SGXPV}_alpha_hardfp_minimal_demos.bin"
+MD5SUM_HARDFP = "ae6125d7f8a313ea5c02afded893052d"
+SHA256SUM_HARDFP = "c2782a2f85024741722b936ec9dca66b858ae8561aa71b693f11e12d8c0385e0"
 
-BINFILE_HARDFP = "Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos.bin"
-MD5SUM_HARDFP = "c9f656dce062d1ab10afffd4dfb71b67"
-SHA256SUM_HARDFP = "dbfeba8e1298f139495816334edec1455e6b49b1e11bd1b2aa0a888e5788bb6b"
+# For now we only have hardfp version
+BINFILE := "${BINFILE_HARDFP}"
 
-BINFILE = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${BINFILE_HARDFP}', '${BINFILE_SOFTFP}', d)}"
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports/${BINFILE}"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
-
-SRC_URI[md5sum] := "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
-SRC_URI[sha256sum] := "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
+SRC_URI[md5sum] := "${MD5SUM_HARDFP}"
+SRC_URI[sha256sum] := "${SHA256SUM_HARDFP}"
 
 TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
 S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
@@ -43,11 +39,13 @@ TI_PLATFORM_omap3 = "omap3630"
 TI_PLATFORM_ti814x = "ti81xx"
 TI_PLATFORM_ti816x = "ti81xx"
 TI_PLATFORM_ti33x = "ti335x"
+TI_PLATFORM_ti43x = "ti43xx"
 
 MODULESLOCATION_omap3 = "dc_omapfb3_linux"
 MODULESLOCATION_ti814x = "dc_ti81xx_linux"
 MODULESLOCATION_ti816x = "dc_ti81xx_linux"
 MODULESLOCATION_ti33x = "dc_ti335x_linux"
+MODULESLOCATION_ti43x = "dc_ti43xx_linux"
 
 export SUPPORT_XORG ?= "1"
 
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb
similarity index 69%
copy from recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb
copy to recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb
index 793de14..46eb11d 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb
@@ -1,13 +1,12 @@
 DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea5743acf520dd81ca172e69f818a3d4"
+LIC_FILES_CHKSUM = "file://GPL-COPYING;md5=60422928ba677faaa13d6ab5f5baaa1e"
 
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
 require ../../recipes-ti/includes/ti-eula-unpack.inc
 
-SGXPV = "4_08_00_02"
+SGXPV = "5_00_00_01"
 IMGPV = "1.9.2188537"
-BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
 
 inherit module
 
@@ -16,10 +15,17 @@ PR = "${MACHINE_KERNEL_PR}"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
+BINFILE_HARDFP = "Graphics_SDK_setuplinux_${SGXPV}_alpha_hardfp_minimal_demos.bin"
+MD5SUM_HARDFP = "ae6125d7f8a313ea5c02afded893052d"
+SHA256SUM_HARDFP = "c2782a2f85024741722b936ec9dca66b858ae8561aa71b693f11e12d8c0385e0"
 
-SRC_URI[md5sum] = "0efa3a38266e6f41f8cc4fad0187f0d6"
-SRC_URI[sha256sum] = "c732044b515a598e1fab661b7463aa9c53d4fa37f4980dfa85cd02b7468d0cd9"
+# For now we only have hardfp version
+BINFILE := "${BINFILE_HARDFP}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports/${BINFILE}"
+
+SRC_URI[md5sum] := "${MD5SUM_HARDFP}"
+SRC_URI[sha256sum] := "${SHA256SUM_HARDFP}"
 
 TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
 S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
@@ -33,11 +39,13 @@ TI_PLATFORM_omap3 = "omap3630"
 TI_PLATFORM_ti814x = "ti81xx"
 TI_PLATFORM_ti816x = "ti81xx"
 TI_PLATFORM_ti33x = "ti335x"
+TI_PLATFORM_ti43x = "ti43xx"
 
 MODULESLOCATION_omap3 = "dc_omapfb3_linux"
 MODULESLOCATION_ti814x = "dc_ti81xx_linux"
 MODULESLOCATION_ti816x = "dc_ti81xx_linux"
 MODULESLOCATION_ti33x = "dc_ti335x_linux"
+MODULESLOCATION_ti43x = "dc_ti43xx_linux"
 
 export SUPPORT_XORG ?= "${@base_contains('DISTRO_FEATURES', 'x11', '1', '0', d)}"
 
-- 
1.7.0.4


