Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6ABA9E015A8
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2013 15:05:44 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 27886529D3; Mon, 16 Sep 2013 22:05:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130916220543.27886529D3@arago-project.org>
Date: Mon, 16 Sep 2013 22:05:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ligles-omap3, omap3-sgx-modules: correct checksum assignment
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
X-List-Received-Date: Mon, 16 Sep 2013 22:05:45 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: c187c2c590a2557e58c1d4cf47584aa98695aabc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c187c2c590a2557e58c1d4cf47584aa98695aabc

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Sep 16 17:06:35 2013 -0400

ligles-omap3, omap3-sgx-modules: correct checksum assignment

Checksums are handled as var attributes and require immediate expansion,
so use := operation as in the original patches, that got lost in the update.
Otherwise do_fetch will fail to validate the checksums.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap3-sgx-modules-x11_4.09.00.01.bb            |    6 +++---
 .../omap3-sgx-modules_4.09.00.01.bb                |    6 +++---
 .../libgles/libgles-omap3-x11_4.09.00.01.bb        |    6 +++---
 .../libgles/libgles-omap3_4.09.00.01.bb            |    6 +++---
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
 


