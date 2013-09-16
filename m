Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A31D2E015A4
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2013 14:10:40 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MT800BJMLH9KTC1@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 16 Sep 2013 16:10:22 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9256D20091; Mon,
	16 Sep 2013 17:10:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 16 Sep 2013 17:10:20 -0400
Message-id: <1379365820-6369-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] ligles-omap3, omap3-sgx-modules: correct checksum assignment
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
X-List-Received-Date: Mon, 16 Sep 2013 21:10:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Checksums are handled as var attributes and require immediate expansion,
so use := operation as in the original patches, that got lost in the update.
Otherwise do_fetch will fail to validate the checksums.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb | 6 +++---
 recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb     | 6 +++---
 recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb        | 6 +++---
 recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb            | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
index fd79818..14f1860 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
@@ -10,7 +10,7 @@ IMGPV = "1.9.2188537"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "d"
 PR = "${MACHINE_KERNEL_PR}"
 
 DEFAULT_PREFERENCE = "-1"
@@ -28,8 +28,8 @@ BINFILE = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${BINFILE_H
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
 
-SRC_URI[md5sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
-SRC_URI[sha256sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
+SRC_URI[md5sum] := "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
+SRC_URI[sha256sum] := "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
 
 TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
 S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
index 1c8718c..4b97bbc 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
@@ -10,7 +10,7 @@ IMGPV = "1.9.2188537"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 DEFAULT_PREFERENCE = "-1"
@@ -28,8 +28,8 @@ BINFILE = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${BINFILE_H
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
 
-SRC_URI[md5sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
-SRC_URI[sha256sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
+SRC_URI[md5sum] := "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
+SRC_URI[sha256sum] := "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
 
 TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
 S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
diff --git a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
index df84f9b..f7b9d66 100644
--- a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
@@ -2,7 +2,7 @@ require libgles-omap3-x11.inc
 
 LICENSE = "TSPA"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -42,8 +42,8 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
            file://99-bufferclass.rules  \
 "
 
-SRC_URI[md5sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
-SRC_URI[sha256sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
+SRC_URI[md5sum] := "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
+SRC_URI[sha256sum] := "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
 
 S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
 
diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
index 6899cfc..d094b5c 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
@@ -2,7 +2,7 @@ require libgles-omap3-no-x.inc
 
 LICENSE = "TSPA"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -40,8 +40,8 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
            file://99-bufferclass.rules  \
 "
 
-SRC_URI[md5sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
-SRC_URI[sha256sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
+SRC_URI[md5sum] := "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
+SRC_URI[sha256sum] := "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
 
 S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
 
-- 
1.8.3.2


