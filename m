Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8D2FE0073D; Mon, 19 May 2014 12:20:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from devils.ext.ti.com (unknown [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3945BE006EC
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 12:19:57 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJJuqw031387
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:19:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJJuJm016499
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:19:56 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:19:55 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJJog3019914;	Mon, 19 May 2014 14:19:54 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 May 2014 14:19:40 -0500
Message-ID: <1400527188-16951-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] ti-ipc: Consolidate include file and old recipe
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
X-List-Received-Date: Mon, 19 May 2014 19:20:00 -0000
Content-Type: text/plain

* The ti-ipc.inc file was for the legacy 1.24.00.16 version of
  ti-ipc.  So consolidate these files together since there is
  only one version of the ti-ipc recipe that needs that .inc
  file and there are no updates planned for it.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-ti/ipc/ti-ipc.inc           |   36 ----------------------------------
 recipes-ti/ipc/ti-ipc_1.24.00.16.bb |   37 +++++++++++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 38 deletions(-)
 delete mode 100644 recipes-ti/ipc/ti-ipc.inc

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
deleted file mode 100644
index 7f4b919..0000000
--- a/recipes-ti/ipc/ti-ipc.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-DESCRIPTION = "TI Inter Process Ccommunication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/index.html"
-
-SECTION = "devel"
-LICENSE = "BSD" 
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-eula-unpack.inc
-
-S = "${WORKDIR}/ipc_${PV}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${PV}/exports/ipc_setuplinux_${PV}.bin;name=ipcbin"
-
-SRC_URI =+ "file://ipc.pc"
-
-DEPENDS = "ti-sysbios ti-cgt6x ti-xdctools"
-
-BINFILE="ipc_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
-
-do_configure() {
-    sed -i -e s:@VERSION@:${PV}:g ${WORKDIR}/ipc.pc
-    
-    cp ${WORKDIR}/ipc.pc ${S}
-}
-
-do_install() {
-    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
-   
-    install -d ${D}/${libdir}/pkgconfig
-    install ${S}/ipc.pc ${D}/${libdir}/pkgconfig/
-}
-
-FILES_${PN}-dev = "${libdir}/*"
diff --git a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb b/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
index e7ae7ef..420d0f7 100644
--- a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
+++ b/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
@@ -1,8 +1,41 @@
-require ti-ipc.inc
+DESCRIPTION = "TI Inter Process Ccommunication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
+HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/index.html"
+SECTION = "devel"
+LICENSE = "BSD" 
+LIC_FILES_CHKSUM = "file://ipc_${PV}_manifest.html;md5=573f5a5c0448d28bf8db35f438244d7f"
+
+
+require ../includes/ti-paths.inc
+require ../includes/ti-staging.inc
+require ../includes/ti-eula-unpack.inc
 
 PV = "1_24_00_16"
 
-LIC_FILES_CHKSUM = "file://ipc_${PV}_manifest.html;md5=573f5a5c0448d28bf8db35f438244d7f"
+S = "${WORKDIR}/ipc_${PV}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${PV}/exports/ipc_setuplinux_${PV}.bin;name=ipcbin \
+           file://ipc.pc"
+
+DEPENDS = "ti-sysbios ti-cgt6x ti-xdctools"
+
+BINFILE="ipc_setuplinux_${PV}.bin"
+TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
+
+do_configure() {
+    sed -i -e s:@VERSION@:${PV}:g ${WORKDIR}/ipc.pc
+    
+    cp ${WORKDIR}/ipc.pc ${S}
+}
+
+do_install() {
+    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
+   
+    install -d ${D}/${libdir}/pkgconfig
+    install ${S}/ipc.pc ${D}/${libdir}/pkgconfig/
+}
+
+FILES_${PN}-dev = "${libdir}/*"
 
 SRC_URI[ipcbin.md5sum] = "d2f7cc82310d555ca039dcd353bd94c5"
 SRC_URI[ipcbin.sha256sum] = "96df7835e920c7dabcd63d30ec8bc2aea7cd0c6197c9fb9ca0f8a9b681aa5396"
-- 
1.7.9.5


