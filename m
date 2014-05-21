Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A024E00BEF; Wed, 21 May 2014 12:57:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53B35E00B95
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 12:57:18 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1721C52A6F; Wed, 21 May 2014 19:57:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521195718.1721C52A6F@arago-project.org>
Date: Wed, 21 May 2014 19:57:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : ti-ipc: Consolidate IPC recipes with include file
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
X-List-Received-Date: Wed, 21 May 2014 19:57:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e36f2c3b78b5abffb36f1e82cf3dfe3953b0abba
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e36f2c3b78b5abffb36f1e82cf3dfe3953b0abba

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Tue May 20 01:19:42 2014 +0000

ti-ipc: Consolidate IPC recipes with include file

* Update the 3.00.00 and 3.21.00.07 versions of ti-ipc to use
  a common ti-ipc.inc file which combines the configuration and
  installation steps for both to be common.
* Modify the tiiipclad-daemon.sh script to have a replacement
  variable so that it can be used for more than a single device.
* Move the tiipclad-daemon script to the ti-ipc directory with
  the rest of the files used by this recipe.
* Fix the permissions for the tiipclad-daemon script

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc.inc                          |   58 ++++++++++++++++++++
 .../ipc/{files => ti-ipc}/tiipclad-daemon.sh       |    2 +-
 recipes-ti/ipc/ti-ipc_3.00.00.bb                   |   51 +----------------
 recipes-ti/ipc/ti-ipc_3.21.00.07.bb                |   31 +----------
 4 files changed, 64 insertions(+), 78 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
new file mode 100644
index 0000000..ee9feff
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -0,0 +1,58 @@
+DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
+HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=f2518e421e230f06fe6d449718d02edc"
+
+DEPENDS += "virtual/kernel"
+
+PR = "r1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PLATFORM = "UNKNOWN"
+PLATFORM_omap5-evm = "OMAP54XX"
+PLATFORM_dra7xx-evm = "DRA7XX"
+PLATFORM_keystone = "TCI6638"
+
+DAEMON = "UNKNOWN"
+DAEMON_omap5-evm = "lad_omap54xx_smp"
+DAEMON_dra7xx-evm = "lad_dra7xx"
+DAEMON_keystone = "lad_tci6638"
+
+inherit autotools pkgconfig update-rc.d
+
+SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git \
+           file://0002-ipc-Added-installation-prefix-feature-to-products.ma.patch \
+           file://tiipclad-daemon.sh \
+           "
+
+S = "${WORKDIR}/git"
+
+INITSCRIPT_NAME = "tiipclad-daemon.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
+EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_INSTALL_DIR=${TOOLCHAIN_PATH} TOOLCHAIN_LONGNAME=${TOOLCHAIN_SYS} PLATFORM=${PLATFORM} PREFIX=${prefix}"
+
+do_configure() {
+    oe_runmake -f ${S}/ipc-linux.mak config
+}
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/init.d/
+
+    # Modify the tiipclad-daemon.sh script to point to the right
+    # lad daemon executable.
+    sed -i -e "s/__LAD_DAEMON__/${DAEMON}/" ${WORKDIR}/tiipclad-daemon.sh
+    install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+}
+
+PACKAGES =+ "${PN}-test"
+RDEPENDS_${PN}-test += "${PN}"
+
+FILES_${PN}-test = " \
+    ${bindir}/NameServerApp \
+    ${bindir}/MessageQApp \
+    ${bindir}/MessageQMulti \
+    ${bindir}/ping_rpmsg"
+
diff --git a/recipes-ti/ipc/files/tiipclad-daemon.sh b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
old mode 100755
new mode 100644
similarity index 92%
rename from recipes-ti/ipc/files/tiipclad-daemon.sh
rename to recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
index 54b3888..97f870e
--- a/recipes-ti/ipc/files/tiipclad-daemon.sh
+++ b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
@@ -1,6 +1,6 @@
 #! /bin/sh
 
-tiipclad_daemon=/usr/bin/lad_tci6638
+tiipclad_daemon=/usr/bin/__LAD_DAEMON__
 tiipclad_params=lad.txt
 
 test -x "$tiipclad_daemon" || exit 0
diff --git a/recipes-ti/ipc/ti-ipc_3.00.00.bb b/recipes-ti/ipc/ti-ipc_3.00.00.bb
index c07b7f9..a6922c0 100644
--- a/recipes-ti/ipc/ti-ipc_3.00.00.bb
+++ b/recipes-ti/ipc/ti-ipc_3.00.00.bb
@@ -1,52 +1,7 @@
-DESCRIPTION="This support the communication between processors \
-in a multi-processor environment and communication to peripherals. \
-This communication includes message passing, streams, and linked lists. \
-These modules work transparently in both uni-processor and multi-processor \
-configurations."
+require ti-ipc.inc
 
-HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
+# For this version of IPC the PLATFORM value is lowercase
+PLATFORM_keystone = "tci6638"
 
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://products.mak;beginline=2;endline=30;md5=195feadf798bb4165bcb1a23ffd50dbb"
-SECTION = "console"
-COMPATIBLE_MACHINE = "keystone"
-TARGET_PLATFORM = "tci6638"
-
-PR = "r0"
-
-BRANCH ?= "master"
 # The following commit corresponds to 3.00.04.29
 SRCREV = "12794ea33870b782bffe1fe4398e86e93fb64396"
-
-SRC_URI = " \
-    git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
-    file://tiipclad-daemon.sh"
-
-S = "${WORKDIR}/git"
-
-export PLATFORM = "${TARGET_PLATFORM}"
-
-export PARALLEL_MAKE = ""
-
-PACKAGES =+ "${PN}-test"
-
-FILES_${PN}-test = " \
-    ${bindir}/NameServerApp \
-    ${bindir}/MessageQApp \
-    ${bindir}/MessageQMulti \
-    ${bindir}/ping_rpmsg"
-
-DEPENDS += "virtual/kernel"
-
-EXTRA_OECONF += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR}"
-inherit autotools
-
-INITSCRIPT_NAME = "tiipclad-daemon.sh"
-INITSCRIPT_PARAMS = "defaults 10"
-
-inherit update-rc.d
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
-}
diff --git a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb b/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
index 8131754..17cdab0 100644
--- a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
+++ b/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
@@ -1,31 +1,4 @@
-DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
-HOMEPAGE = "https://git.ti.com/ipc/pages/Home"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=f2518e421e230f06fe6d449718d02edc"
-
-DEPENDS += "virtual/kernel"
-
-PR = "r1"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PLATFORM_omap5-evm = "OMAP54XX"
-PLATFORM_dra7xx-evm = "DRA7XX"
-
-inherit autotools pkgconfig
-
-SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git \
-           file://0002-ipc-Added-installation-prefix-feature-to-products.ma.patch \
-           "
+require ti-ipc.inc
 
+# This commit corresponds to 3.21.00.07
 SRCREV = "c18fece0c9f0dc76361dc1ee11b7ee2417479847"
-
-S = "${WORKDIR}/git"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}:"
-
-EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_INSTALL_DIR=${TOOLCHAIN_PATH} TOOLCHAIN_LONGNAME=${TOOLCHAIN_SYS} PLATFORM=${PLATFORM} PREFIX=${prefix}"
-
-do_configure() {
-	oe_runmake -f ${S}/ipc-linux.mak config
-}


