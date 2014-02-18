Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94090E0085B
	for <meta-ti@yoctoproject.org>; Tue, 18 Feb 2014 08:42:36 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1IGgaG1014593
	for <meta-ti@yoctoproject.org>; Tue, 18 Feb 2014 10:42:36 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1IGgaHc015285
	for <meta-ti@yoctoproject.org>; Tue, 18 Feb 2014 10:42:36 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Feb 2014 10:42:35 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1IGgWE8006342;
	Tue, 18 Feb 2014 10:42:34 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Feb 2014 10:42:30 -0600
Message-ID: <1392741750-18725-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] Graphics SDK: Add version 05.01.01.01
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
X-List-Received-Date: Tue, 18 Feb 2014 16:42:37 -0000
Content-Type: text/plain

* Add latest version of the Graphics SDK that includes bug fixes.
* Fixed Suspend and Resume issue on AM43x.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...01.00.01.bb => omap3-sgx-modules_5.01.01.01.bb} |    6 +++---
 .../rc.pvr                                         |    0
 .../rc_dri.pvr                                     |    0
 ...3_5.01.00.01.bb => libgles-omap3_5.01.01.01.bb} |    8 ++++----
 4 files changed, 7 insertions(+), 7 deletions(-)
 copy recipes-bsp/powervr-drivers/{omap3-sgx-modules_5.01.00.01.bb => omap3-sgx-modules_5.01.01.01.bb} (92%)
 copy recipes-graphics/libgles/{libgles-omap3-5.00.00.01 => libgles-omap3-5.01.01.01}/rc.pvr (100%)
 copy recipes-graphics/libgles/{libgles-omap3-5.00.00.01 => libgles-omap3-5.01.01.01}/rc_dri.pvr (100%)
 copy recipes-graphics/libgles/{libgles-omap3_5.01.00.01.bb => libgles-omap3_5.01.01.01.bb} (87%)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
similarity index 92%
copy from recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.00.01.bb
copy to recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
index 162e4d5..40bf8c0 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://GPL-COPYING;md5=60422928ba677faaa13d6ab5f5baaa1e"
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
 require ../../recipes-ti/includes/ti-eula-unpack.inc
 
-SGXPV = "5_01_00_01"
+SGXPV = "5_01_01_01"
 IMGPV = "1.10.2359475"
 
 inherit module
@@ -14,8 +14,8 @@ MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
-MD5SUM_HARDFP = "0ee7d59808330d442a51c0990c2cb30e"
-SHA256SUM_HARDFP = "769daae439677a7a85bbbced14cee4f85b19823e0b99560078d0a864c525c128"
+MD5SUM_HARDFP = "94acdbd20152c905939c2448d5e80a72"
+SHA256SUM_HARDFP = "7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886d4460b76c9051ae"
 
 # For now we only have hardfp version
 python __anonymous() {
diff --git a/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr
similarity index 100%
copy from recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr
copy to recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr
diff --git a/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc_dri.pvr b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr
similarity index 100%
copy from recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc_dri.pvr
copy to recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr
diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
similarity index 87%
copy from recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
copy to recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
index a3b34fe..2d11317 100644
--- a/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
@@ -2,7 +2,7 @@ require libgles-omap3-no-x.inc
 
 LICENSE = "TSPA"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 BINLOCATION_omap3 = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
@@ -13,14 +13,14 @@ BINLOCATION_ti43x = "${S}/gfx_rel_es9.x"
 PLATFORM = "LinuxARMV7"
 PVR_INIT = "pvrsrvctl"
 
-SGXPV = "5_01_00_01"
+SGXPV = "5_01_01_01"
 IMGPV = "1.10.2359475"
 
 TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
 
 BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
-MD5SUM_HARDFP = "0ee7d59808330d442a51c0990c2cb30e"
-SHA256SUM_HARDFP = "769daae439677a7a85bbbced14cee4f85b19823e0b99560078d0a864c525c128"
+MD5SUM_HARDFP = "94acdbd20152c905939c2448d5e80a72"
+SHA256SUM_HARDFP = "7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886d4460b76c9051ae"
 
 # For now we only have hardfp version
 python __anonymous() {
-- 
1.7.0.4


