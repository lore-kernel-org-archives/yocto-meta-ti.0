Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8FAEE01536
	for <meta-ti@yoctoproject.org>; Thu, 12 Sep 2013 20:25:01 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MT100GN5O5O9X00@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 12 Sep 2013 22:25:01 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F297B2016B; Thu,
	12 Sep 2013 23:24:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 12 Sep 2013 23:24:47 -0400
Message-id: <1379042687-25413-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1379042687-25413-1-git-send-email-denis@denix.org>
References: <1379042687-25413-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] libgles-omap3: add automatic selection between softfp and hardfp binaries
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
X-List-Received-Date: Fri, 13 Sep 2013 03:25:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is based on the work by Franklin Cooper, with following changes:
* Cleanup and simplify the logic
* Reduce the number of Python calls
* Expand support from Raw to X11 variant

The original description:
* The Graphics SDK includes some binaries that are prebuilt.
* These prebuilt binaries come in two versions of the Graphics SDK. By default
  the prebuilt binaries are built using a softfp toolchain. A separate hardfp
  Graphics SDK exist that contains binaries that are prebuilt with a hardfp
  toolchain.
* Add support for both by checking to see if the toolchain used in the OE build
  is using a hardfp or softfp toolchain.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../libgles/libgles-omap3-x11_4.09.00.01.bb        | 23 +++++++++++++++++-----
 .../libgles/libgles-omap3_4.09.00.01.bb            | 23 +++++++++++++++++-----
 2 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
index 6b9c561..df84f9b 100644
--- a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
@@ -2,11 +2,11 @@ require libgles-omap3-x11.inc
 
 LICENSE = "TSPA"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
-BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
+BINLOCATION_omap3 = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
 BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
 BINLOCATION_ti33x = "${S}/gfx_rel_es8.x"
@@ -20,8 +20,20 @@ PVR_INIT = "pvrsrvctl"
 
 SGXPV = "4_09_00_01"
 IMGPV = "1.9.2188537"
-BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
+
 TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
+
+# Select the corresponding hardfp/softfp filename and checksums based on tune flags
+BINFILE_SOFTFP = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
+MD5SUM_SOFTFP = "bd35e9d8843aff3a2aca9d41e7db1c7d"
+SHA256SUM_SOFTFP = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+
+BINFILE_HARDFP = "Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos.bin"
+MD5SUM_HARDFP = "c9f656dce062d1ab10afffd4dfb71b67"
+SHA256SUM_HARDFP = "dbfeba8e1298f139495816334edec1455e6b49b1e11bd1b2aa0a888e5788bb6b"
+
+BINFILE = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${BINFILE_HARDFP}', '${BINFILE_SOFTFP}', d)}"
+
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
            file://cputype \
            file://rc.pvr \
@@ -29,8 +41,9 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
            file://sample.desktop \
            file://99-bufferclass.rules  \
 "
-SRC_URI[md5sum] = "bd35e9d8843aff3a2aca9d41e7db1c7d"
-SRC_URI[sha256sum] = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+
+SRC_URI[md5sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
+SRC_URI[sha256sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
 
 S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
 
diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
index a4da2f9..6899cfc 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
@@ -2,11 +2,11 @@ require libgles-omap3-no-x.inc
 
 LICENSE = "TSPA"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
-BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
+BINLOCATION_omap3 = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
 BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
 BINLOCATION_ti33x = "${S}/gfx_rel_es8.x"
@@ -20,15 +20,28 @@ PVR_INIT = "pvrsrvctl"
 
 SGXPV = "4_09_00_01"
 IMGPV = "1.9.2188537"
-BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
+
 TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
+
+# Select the corresponding hardfp/softfp filename and checksums based on tune flags
+BINFILE_SOFTFP = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
+MD5SUM_SOFTFP = "bd35e9d8843aff3a2aca9d41e7db1c7d"
+SHA256SUM_SOFTFP = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+
+BINFILE_HARDFP = "Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos.bin"
+MD5SUM_HARDFP = "c9f656dce062d1ab10afffd4dfb71b67"
+SHA256SUM_HARDFP = "dbfeba8e1298f139495816334edec1455e6b49b1e11bd1b2aa0a888e5788bb6b"
+
+BINFILE = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${BINFILE_HARDFP}', '${BINFILE_SOFTFP}', d)}"
+
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
            file://cputype \
            file://rc.pvr \
            file://99-bufferclass.rules  \
 "
-SRC_URI[md5sum] = "bd35e9d8843aff3a2aca9d41e7db1c7d"
-SRC_URI[sha256sum] = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+
+SRC_URI[md5sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
+SRC_URI[sha256sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
 
 S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
 
-- 
1.8.3.2


