Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C494E00C46; Wed, 21 May 2014 12:57:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D46BE00BEF
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 12:57:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 216AE52A6D; Wed, 21 May 2014 19:57:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521195725.216AE52A6D@arago-project.org>
Date: Wed, 21 May 2014 19:57:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : ti-ipc: Consolidate include file and old recipe
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
X-List-Received-Date: Wed, 21 May 2014 19:57:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 74b7fd994d0f5a30b0c1bab837810b20ebabe74f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=74b7fd994d0f5a30b0c1bab837810b20ebabe74f

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Tue May 20 01:19:40 2014 +0000

ti-ipc: Consolidate include file and old recipe

* The ti-ipc.inc file was for the legacy 1.24.00.16 version of
  ti-ipc.  So consolidate these files together since there is
  only one version of the ti-ipc recipe that needs that .inc
  file and there are no updates planned for it.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc.inc           |   36 ----------------------------------
 recipes-ti/ipc/ti-ipc_1.24.00.16.bb |   37 +++++++++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 38 deletions(-)

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


