Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1BCAE0077F; Wed,  8 Oct 2014 10:54:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: misformatted + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51FD8E00786
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 10:54:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1AA1752973; Wed,  8 Oct 2014 17:54:19 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141008175419.1AA1752973@arago-project.org>
Date: Wed,  8 Oct 2014 17:54:19 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-ipc: Upgrade to IPC 3.30.00.09
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
X-List-Received-Date: Wed, 08 Oct 2014 17:54:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 2f6b82450106f2e1a0042f884dc84f35dfc41e42
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2f6b82450106f2e1a0042f884dc84f35dfc41e42

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Oct  8 18:06:20 2014 +0000

ti-ipc: Upgrade to IPC 3.30.00.09

* Added new recipe for latest IPC
* Removed older recipe versions
* Latest recipe points to IPC 3.30.00.09

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...nstallation-prefix-feature-to-products.ma.patch |   38 ------------------
 recipes-ti/ipc/ti-ipc/ipc.pc                       |    8 ----
 recipes-ti/ipc/ti-ipc_1.24.00.16.bb                |   41 --------------------
 recipes-ti/ipc/ti-ipc_3.00.00.bb                   |    7 ---
 recipes-ti/ipc/ti-ipc_3.21.00.07.bb                |    4 --
 recipes-ti/ipc/{ti-ipc.inc => ti-ipc_git.bb}       |   26 +++++++-----
 6 files changed, 15 insertions(+), 109 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch b/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch
deleted file mode 100644
index 58d77c7..0000000
--- a/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 26d09063063593aec760151393226b96bc7ab9f8 Mon Sep 17 00:00:00 2001
-From: Mrinmayee Hingolikar <mrinmayee@ti.com>
-Date: Thu, 5 Sep 2013 17:01:15 +0530
-Subject: [PATCH] ipc: Added installation prefix feature to products.mak
-
-Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
----
- ipc-linux.mak |    1 +
- products.mak  |    1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/ipc-linux.mak b/ipc-linux.mak
-index 788a5a2..01579e4 100644
---- a/ipc-linux.mak
-+++ b/ipc-linux.mak
-@@ -38,6 +38,7 @@ include products.mak
- config:
- 	@echo "Configuring Linux Ipc ..."
- 	./configure --host=$(TOOLCHAIN_LONGNAME) \
-+            --prefix=$(PREFIX) \
-             CC=$(TOOLCHAIN_PREFIX)gcc \
-             PLATFORM=$(PLATFORM) \
-             CMEM_INSTALL_DIR=$(CMEM_INSTALL_DIR) \
-diff --git a/products.mak b/products.mak
-index e418d2f..4578a1e 100644
---- a/products.mak
-+++ b/products.mak
-@@ -55,6 +55,7 @@ PLATFORM ?=
- TOOLCHAIN_LONGNAME = arm-none-linux-gnueabi
- TOOLCHAIN_INSTALL_DIR = $(DEPOT)/_your_arm_code_gen_install_
- TOOLCHAIN_PREFIX = $(TOOLCHAIN_INSTALL_DIR)/bin/$(TOOLCHAIN_LONGNAME)-
-+PREFIX = /usr/local
- 
- # Optional: Path to Linux Kernel - needed to build the MmRpc user libraries
- # (for devices that support it)
--- 
-1.7.9.5
-
diff --git a/recipes-ti/ipc/ti-ipc/ipc.pc b/recipes-ti/ipc/ti-ipc/ipc.pc
deleted file mode 100644
index 1a8c52d..0000000
--- a/recipes-ti/ipc/ti-ipc/ipc.pc
+++ /dev/null
@@ -1,8 +0,0 @@
-prefix=/../../ipc_@VERSION@
-includedir=${prefix}/ti/ipc
-
-Name: TI IPC
-Description: TI ARM-DSP IPC (Inter Processor Communication) 
-Version: @VERSION@
-Requires: 
-Cflags: -I${includedir}
diff --git a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb b/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
deleted file mode 100644
index 420d0f7..0000000
--- a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "TI Inter Process Ccommunication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/index.html"
-SECTION = "devel"
-LICENSE = "BSD" 
-LIC_FILES_CHKSUM = "file://ipc_${PV}_manifest.html;md5=573f5a5c0448d28bf8db35f438244d7f"
-
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-eula-unpack.inc
-
-PV = "1_24_00_16"
-
-S = "${WORKDIR}/ipc_${PV}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${PV}/exports/ipc_setuplinux_${PV}.bin;name=ipcbin \
-           file://ipc.pc"
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
-
-SRC_URI[ipcbin.md5sum] = "d2f7cc82310d555ca039dcd353bd94c5"
-SRC_URI[ipcbin.sha256sum] = "96df7835e920c7dabcd63d30ec8bc2aea7cd0c6197c9fb9ca0f8a9b681aa5396"
diff --git a/recipes-ti/ipc/ti-ipc_3.00.00.bb b/recipes-ti/ipc/ti-ipc_3.00.00.bb
deleted file mode 100644
index a6922c0..0000000
--- a/recipes-ti/ipc/ti-ipc_3.00.00.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ti-ipc.inc
-
-# For this version of IPC the PLATFORM value is lowercase
-PLATFORM_keystone = "tci6638"
-
-# The following commit corresponds to 3.00.04.29
-SRCREV = "12794ea33870b782bffe1fe4398e86e93fb64396"
diff --git a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb b/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
deleted file mode 100644
index 17cdab0..0000000
--- a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ti-ipc.inc
-
-# This commit corresponds to 3.21.00.07
-SRCREV = "c18fece0c9f0dc76361dc1ee11b7ee2417479847"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc_git.bb
similarity index 75%
rename from recipes-ti/ipc/ti-ipc.inc
rename to recipes-ti/ipc/ti-ipc_git.bb
index 860f55f..185e58b 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -2,11 +2,22 @@ DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Mul
 HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=f2518e421e230f06fe6d449718d02edc"
+LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=abd112f156e5eb9b0f3e202e48747f9a"
 
 DEPENDS += "virtual/kernel"
 
-PR = "r1"
+PV = "3.30.00.09"
+
+# This is the first version of the 3.30.00.09 
+# PR = "r0"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
+           file://tiipclad-daemon.sh \
+           "
+SRCREV = "595bc3e3bbb2e7ec12a8287145d8e3929291e59d"
+
+S = "${WORKDIR}/git"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -22,20 +33,13 @@ DAEMON_keystone = "lad_tci6638"
 
 inherit autotools pkgconfig update-rc.d
 
-SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git \
-           file://0002-ipc-Added-installation-prefix-feature-to-products.ma.patch \
-           file://tiipclad-daemon.sh \
-           "
-
-S = "${WORKDIR}/git"
-
 INITSCRIPT_NAME = "tiipclad-daemon.sh"
 INITSCRIPT_PARAMS = "defaults 10"
 
-EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_INSTALL_DIR=${TOOLCHAIN_PATH} TOOLCHAIN_LONGNAME=${TOOLCHAIN_SYS} PLATFORM=${PLATFORM} PREFIX=${prefix}"
+EXTRA_OECONF += "PLATFORM=${PLATFORM} KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR}"
 
 do_configure() {
-    oe_runmake -f ${S}/ipc-linux.mak config
+    oe_runconf
 }
 
 do_install_append() {


