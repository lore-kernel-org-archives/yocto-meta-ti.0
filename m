Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66CDCE012F1
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2013 07:27:34 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2KERW5P001198
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2013 09:27:33 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2KERVja021765
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2013 19:57:32 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 19:57:30 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2KERSba002599;
	Wed, 20 Mar 2013 19:57:30 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 20 Mar 2013 09:27:26 -0500
Message-ID: <1363789646-25275-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 2/2 v2] libgles-omap3: Add version 4.08.00.02 of the Graphics SDK
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
X-List-Received-Date: Wed, 20 Mar 2013 14:27:34 -0000
Content-Type: text/plain

---

Version 2 changes:
Use find-copies-harder argument for git format-patch.

 .../rc.pvr                                         |    0
 .../rc_dri.pvr                                     |    0
 ...3_4.08.00.01.bb => libgles-omap3_4.08.00.02.bb} |   11 ++++++-----
 3 files changed, 6 insertions(+), 5 deletions(-)
 copy recipes-graphics/libgles/{libgles-omap3-4.08.00.01 => libgles-omap3-4.08.00.02}/rc.pvr (100%)
 copy recipes-graphics/libgles/{libgles-omap3-4.08.00.01 => libgles-omap3-4.08.00.02}/rc_dri.pvr (100%)
 copy recipes-graphics/libgles/{libgles-omap3_4.08.00.01.bb => libgles-omap3_4.08.00.02.bb} (90%)

diff --git a/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc.pvr b/recipes-graphics/libgles/libgles-omap3-4.08.00.02/rc.pvr
similarity index 100%
copy from recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc.pvr
copy to recipes-graphics/libgles/libgles-omap3-4.08.00.02/rc.pvr
diff --git a/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc_dri.pvr b/recipes-graphics/libgles/libgles-omap3-4.08.00.02/rc_dri.pvr
similarity index 100%
copy from recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc_dri.pvr
copy to recipes-graphics/libgles/libgles-omap3-4.08.00.02/rc_dri.pvr
diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb b/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
similarity index 90%
copy from recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
copy to recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
index a24da0e..98cfcc5 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
@@ -16,9 +16,9 @@ PVR_INIT = "pvrsrvctl"
 # http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
 # see libgles-omap3.inc for detailed installation instructions
 
-SGXPV = "4_08_00_01"
-IMGPV = "1.9.2139099"
-BINFILE = "Graphics_SDK_setuplinux_${SGXPV}.bin"
+SGXPV = "4_08_00_02"
+IMGPV = "1.9.2188537"
+BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
 TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
            file://cputype \
@@ -28,13 +28,14 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
            file://99-bufferclass.rules  \
 "
 
-SRC_URI[md5sum] = "dd0d994a48ecc4293f272a1fddddf159"
-SRC_URI[sha256sum] = "fd721288c95314e0d676dd89462e1dec994e185cb608bcb8ac4a4b5809f9693a"
+SRC_URI[md5sum] = "0efa3a38266e6f41f8cc4fad0187f0d6"
+SRC_URI[sha256sum] = "c732044b515a598e1fab661b7463aa9c53d4fa37f4980dfa85cd02b7468d0cd9"
 
 S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
 
 LIBGLESWINDOWSYSTEM ?= "${@base_contains('DISTRO_FEATURES', 'x11',"libpvrPVR2D_DRIWSEGL.so" ,"libpvrPVR2D_FRONTWSEGL.so.1", d)}"
 
+
 do_configure_append() {
 
     # Change PVR server's user mode library to point to DRI
-- 
1.7.0.4


