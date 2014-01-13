Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0956FE00813
	for <meta-ti@yoctoproject.org>; Mon, 13 Jan 2014 14:12:53 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0DMCr7k025280
	for <meta-ti@yoctoproject.org>; Mon, 13 Jan 2014 16:12:53 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0DMCrrg016851
	for <meta-ti@yoctoproject.org>; Mon, 13 Jan 2014 16:12:53 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 13 Jan 2014 16:12:52 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0DMCjkr032472;
	Mon, 13 Jan 2014 16:12:51 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 13 Jan 2014 17:33:07 -0600
Message-ID: <1389655987-31349-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1389655987-31349-1-git-send-email-Chase.Maupin@ti.com>
References: <1389655987-31349-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] Graphics SDK: Add 5.01.00.01 version
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
X-List-Received-Date: Mon, 13 Jan 2014 22:12:54 -0000
Content-Type: text/plain

* Add the 5.01.00.01 version of the graphics SDK which supports
  suspend/resume operations for the v3.12 and later kernels.
* Set DEFAULT_PREFERENCE to -1 until this release is made publicly

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...00.00.01.bb => omap3-sgx-modules_5.01.00.01.bb} |   10 ++++++----
 .../rc.pvr                                         |    0
 .../rc_dri.pvr                                     |    0
 ...3_5.00.00.01.bb => libgles-omap3_5.01.00.01.bb} |   10 ++++++----
 4 files changed, 12 insertions(+), 8 deletions(-)
 copy recipes-bsp/powervr-drivers/{omap3-sgx-modules_5.00.00.01.bb => omap3-sgx-modules_5.01.00.01.bb} (88%)
 copy recipes-graphics/libgles/{libgles-omap3-5.00.00.01 => libgles-omap3-5.01.00.01}/rc.pvr (100%)
 copy recipes-graphics/libgles/{libgles-omap3-5.00.00.01 => libgles-omap3-5.01.00.01}/rc_dri.pvr (100%)
 copy recipes-graphics/libgles/{libgles-omap3_5.00.00.01.bb => libgles-omap3_5.01.00.01.bb} (83%)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.00.01.bb
similarity index 88%
copy from recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb
copy to recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.00.01.bb
index e18ce0c..9ffe832 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.00.01.bb
@@ -5,17 +5,19 @@ LIC_FILES_CHKSUM = "file://GPL-COPYING;md5=60422928ba677faaa13d6ab5f5baaa1e"
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
 require ../../recipes-ti/includes/ti-eula-unpack.inc
 
-SGXPV = "5_00_00_01"
+SGXPV = "5_01_00_01"
 IMGPV = "1.10.2359475"
 
+DEFAULT_PREFERENCE = "-1"
+
 inherit module
 
 MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
-BINFILE_HARDFP = "Graphics_SDK_setuplinux_${SGXPV}_alpha_hardfp_minimal_demos.bin"
-MD5SUM_HARDFP = "ae6125d7f8a313ea5c02afded893052d"
-SHA256SUM_HARDFP = "c2782a2f85024741722b936ec9dca66b858ae8561aa71b693f11e12d8c0385e0"
+BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
+MD5SUM_HARDFP = "0ee7d59808330d442a51c0990c2cb30e"
+SHA256SUM_HARDFP = "769daae439677a7a85bbbced14cee4f85b19823e0b99560078d0a864c525c128"
 
 # For now we only have hardfp version
 python __anonymous() {
diff --git a/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr b/recipes-graphics/libgles/libgles-omap3-5.01.00.01/rc.pvr
similarity index 100%
copy from recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr
copy to recipes-graphics/libgles/libgles-omap3-5.01.00.01/rc.pvr
diff --git a/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc_dri.pvr b/recipes-graphics/libgles/libgles-omap3-5.01.00.01/rc_dri.pvr
similarity index 100%
copy from recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc_dri.pvr
copy to recipes-graphics/libgles/libgles-omap3-5.01.00.01/rc_dri.pvr
diff --git a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb b/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
similarity index 83%
copy from recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
copy to recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
index e48ec63..97ccd54 100644
--- a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
@@ -13,14 +13,16 @@ BINLOCATION_ti43x = "${S}/gfx_rel_es9.x"
 PLATFORM = "LinuxARMV7"
 PVR_INIT = "pvrsrvctl"
 
-SGXPV = "5_00_00_01"
+SGXPV = "5_01_00_01"
 IMGPV = "1.10.2359475"
 
+DEFAULT_PREFERENCE = "-1"
+
 TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
 
-BINFILE_HARDFP = "Graphics_SDK_setuplinux_${SGXPV}_alpha_hardfp_minimal_demos.bin"
-MD5SUM_HARDFP = "ae6125d7f8a313ea5c02afded893052d"
-SHA256SUM_HARDFP = "c2782a2f85024741722b936ec9dca66b858ae8561aa71b693f11e12d8c0385e0"
+BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
+MD5SUM_HARDFP = "0ee7d59808330d442a51c0990c2cb30e"
+SHA256SUM_HARDFP = "769daae439677a7a85bbbced14cee4f85b19823e0b99560078d0a864c525c128"
 
 # For now we only have hardfp version
 python __anonymous() {
-- 
1.7.0.4


