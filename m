Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 061CEE004A1
	for <meta-ti@yoctoproject.org>; Sat,  1 Sep 2012 10:29:18 -0700 (PDT)
Received: by obbtb18 with SMTP id tb18so9413295obb.35
	for <meta-ti@yoctoproject.org>; Sat, 01 Sep 2012 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8EHwh9ZT/+cvwl9UFmQn13dlCH5QE5kVlPpKLilLGOM=;
	b=he7PyxUF7xxqzI2Vkd0AGsCctTpvZCs4K7iyiXc+SnmqihojNmM3a5dbGx02N00NO/
	LcELfsXIErW7X/SnOoGOQcAC7Yk3EjkgJ1t0IqC1iAnvbjf8FbzSZp7BIK6seo3UOogA
	mdtt13PlINTi//MOCIb+3FqENIVdw8ecPejQMK2SAx2V02dxhRjsYuMmOmfQM61fLUux
	UMdOeOgP4jWxjpal6ZFvHMzZfYLA/wuWl86c0lsc9HfySPbe7wgtvoeUFYIv0TjGCnHV
	IB4qvqMC68HdxSXNfarhO4++cRNumEMOcWv1TDW/qdNPSc81TUjiX5nx4xJT3c9cAVCg
	JSUQ==
Received: by 10.60.30.201 with SMTP id u9mr10305954oeh.51.1346520555929;
	Sat, 01 Sep 2012 10:29:15 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id hz6sm7091728obb.1.2012.09.01.10.29.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 01 Sep 2012 10:29:15 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sat,  1 Sep 2012 12:45:03 -0500
Message-Id: <1346521503-32331-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [PATCH] recipes: Fix ti-eula-unpack issue. Tweak sgx modules and libgles recipes.
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
X-List-Received-Date: Sat, 01 Sep 2012 17:29:19 -0000

* Commit d8fc4a686262c50fd0053afa7240020909ec430b addressed an issue where
  too many newlines characters were being sent since print by default already
  sends a newline character. This commit however resulted in bin files being
  installed in the WORKDIR and broke other recipes which commit
  a94f765b9867abefd5f0bd262b5dddb8782b3187 addressed. This lead to a very
  cluttered WORKDIR.
* This patch updates ti-eula-unpack.inc to switch from using a print to a write.
  Since write doesn't automatically send newlines it is a bit more obvious when
  newlines are sent.
* Part of the reason that bin files were being installed in the WORKDIR was
  due to TI_BIN_UNPK_WDEXT being blank for some recipes. For instance in the
  libgles-omap3 recipes, when the workdir command is set in TI_BIN_UNPK_CMDS the
  directory that the Graphics SDK will be installed into is
  workdir+TI_BIN_UNPK_WDEXT. A blank TI_BIN_UNPK_WDEXT means the SDK will be
  installed in WORKDIR. By setting TI_BIN_UNPK_WDEXT to a proper value the
  recipes can be sure it is installed in the proper directory.
* Determine which file to download based on the defined BINFILE and not a
  hardcoded value. This idea was taken from arago.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../omap3-sgx-modules_1.6.16.3977.bb               |    8 ++++----
 recipes-graphics/libgles/libgles-omap3.inc         |    4 ++--
 .../libgles/libgles-omap3_4.03.00.02.bb            |    6 +++---
 .../libgles/libgles-omap3_4.05.00.03.bb            |    6 +++---
 recipes-ti/includes/ti-eula-unpack.inc             |    4 ++--
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
index 0affee1..4f9be7b 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
@@ -11,17 +11,17 @@ BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
            file://Compile-fixes-for-38-kernel.patch \
            file://kernel-30.patch \
           "
 SRC_URI[md5sum] = "ff8c1f2b8e4cb42f4ced6a613b081ada"
 SRC_URI[sha256sum] = "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036423458c8d75255"
-
-S = "${WORKDIR}/Graphics_SDK_${SGXPV}/GFX_Linux_KM"
+TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
 
 PVRBUILD = "release"
 export KERNELDIR = "${STAGING_KERNEL_DIR}"
diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 18ee7ff..4525285 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r31"
+PR = "r32"
 
 COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
@@ -11,7 +11,7 @@ DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
 
 PROVIDES += "virtual/egl"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin \
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
 		   file://cputype \
 		   file://rc.pvr \
 		   file://sample.desktop \
diff --git a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb b/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
index 97a22fe..e98fe02 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
@@ -15,8 +15,9 @@ require libgles-omap3.inc
 SGXPV = "4_03_00_02"
 IMGPV = "1.6.16.3977"
 BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
+TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
                    file://cputype \
                    file://rc.pvr \
                    file://sample.desktop \
@@ -26,5 +27,4 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
 SRC_URI[md5sum] = "ff8c1f2b8e4cb42f4ced6a613b081ada"
 SRC_URI[sha256sum] = "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036423458c8d75255"
 
-S = "${WORKDIR}"
-
+S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
diff --git a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
index d55dd05..7795e2e 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
@@ -12,8 +12,9 @@ require libgles-omap3.inc
 SGXPV = "4_05_00_03"
 IMGPV = "1.6.16.4117"
 BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
+TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
                    file://cputype \
                    file://rc.pvr \
                    file://sample.desktop \
@@ -23,5 +24,4 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
 SRC_URI[md5sum] = "0e651eaa92bb91760f0b40a17697a7dc"
 SRC_URI[sha256sum] = "bfe764a8959556195545d6fff76f63a489642f345c105bbbc309a3f243c2dd0e"
 
-S = "${WORKDIR}"
-
+S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/ti-eula-unpack.inc
index 60f5558..aee88f1 100644
--- a/recipes-ti/includes/ti-eula-unpack.inc
+++ b/recipes-ti/includes/ti-eula-unpack.inc
@@ -14,7 +14,7 @@ python do_unpack () {
     bb.build.exec_func('ti_bin_do_unpack', d)
 }
 
-TI_BIN_UNPK_WDEXT += ""
+TI_BIN_UNPK_WDEXT ?= ""
 python ti_bin_do_unpack() {
 
     import os
@@ -60,7 +60,7 @@ python ti_bin_do_unpack() {
             wdext = bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
             wdext = bb.data.expand(wdext, localdata)
             cmd = workdir+wdext
-        print >>f, cmd
+        f.write(cmd+'\n');
     f.close()
 
     # Expand the tarball that was created if required
-- 
1.7.0.4


