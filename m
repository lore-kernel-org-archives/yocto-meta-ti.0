Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7891E00B77; Fri, 20 Nov 2015 19:28:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F32DE00B7D
	for <meta-ti@yoctoproject.org>; Fri, 20 Nov 2015 19:28:03 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D3E7E52A22; Sat, 21 Nov 2015 03:28:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151121032802.D3E7E52A22@arago-project.org>
Date: Sat, 21 Nov 2015 03:28:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ipc: ti-ipc, ti-ipc-rtos: Update to new version of IPC 3.41.0. 3_eng
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
X-List-Received-Date: Sat, 21 Nov 2015 03:28:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 52c5cc74e91db1483b517e5b2df7fc683ac23ac3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=52c5cc74e91db1483b517e5b2df7fc683ac23ac3

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Nov 20 09:54:59 2015 +0000

ipc: ti-ipc, ti-ipc-rtos: Update to new version of IPC 3.41.0.3_eng

- Update to new version of IPC: 3.41.0.3_eng
- Add recipe to build ti-ipc-rtos from git repo
- Remove K2G hack

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos.inc           |   19 ----------
 recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb |    9 -----
 recipes-ti/ipc/ti-ipc-rtos_git.bb        |   55 ++++++++++++++++++++++++++++++
 recipes-ti/ipc/ti-ipc.inc                |   26 ++++++++++++++
 recipes-ti/ipc/ti-ipc_git.bb             |   29 +++------------
 5 files changed, 87 insertions(+), 51 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
deleted file mode 100644
index d14c756..0000000
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
-HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
-
-LICENSE = "BSD"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${PV}/exports/ipc_${PV}.zip;name=ipczip"
-
-S = "${WORKDIR}/ipc_${PV}"
-
-do_install() {
-    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
-}
-
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN}-dev += "${IPC_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb b/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
deleted file mode 100644
index 7c93695..0000000
--- a/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ti-ipc-rtos.inc
-
-PV = "3_40_01_08"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
-
-SRC_URI[ipczip.md5sum] = "738e1d54da9fab94899ad162f1ad78de"
-SRC_URI[ipczip.sha256sum] = "8cc7d40ad7eab916eae109b355dc7e7876c6ab82e3b40bf5b6bf60474312d6cf"
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
new file mode 100644
index 0000000..2e9dba1
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -0,0 +1,55 @@
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+require ti-ipc.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "ti-xdctools ti-sysbios"
+DEPENDS_append_keystone += "ti-cgt6x-native gcc-arm-none-eabi-native"
+DEPENDS_append_omap-15 += "ti-cgt6x-native ti-ccsv6-native gcc-arm-none-eabi-native"
+
+PACKAGES =+ "${PN}-fw"
+FILES_${PN}-fw = "${libdir}/firmware/*"
+FILES_${PN}-dev += "${IPC_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-fw += "arch"
+INSANE_SKIP_${PN}-dev += "arch"
+
+ALLOW_EMPTY_${PN} = "1"
+
+IPC_TARGETS = ""
+IPC_TARGETS_omap-a15 = "\
+    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
+    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
+    ti.targets.arm.elf.M4F="${M4_TOOLCHAIN_INSTALL_DIR}" \
+"
+
+IPC_TARGETS_keystone = " \
+    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
+    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+"
+
+EXTRA_OEMAKE = "\
+    PLATFORM=${PLATFORM} \
+    XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
+    BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
+    ${IPC_TARGETS} -f ipc-bios.mak\
+"
+
+do_compile() {
+  oe_runmake clean
+  oe_runmake all
+}
+
+do_compile_append() {
+  sourceipk_do_create_srcipk
+}
+
+do_install() {
+    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
+
+    install -d ${D}${libdir}/firmware
+    find . -name "*.xe66" -type f | xargs -I {} install -m 0644 {} ${D}${libdir}/firmware/
+}
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
new file mode 100644
index 0000000..d41796d
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -0,0 +1,26 @@
+DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
+HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
+
+BRANCH = "ipc-next"
+
+SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
+
+#Corresponds to 3.41.00.03_eng
+SRCREV = "354db7d3b6aa397e6ab4b86fdbd312746fd46a07"
+
+S = "${WORKDIR}/git"
+PV = "3.41.00.03"
+INC_PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PLATFORM = "UNKNOWN"
+PLATFORM_omap5-evm = "OMAP54XX"
+PLATFORM_dra7xx = "DRA7XX"
+PLATFORM_k2hk-evm = "TCI6638"
+PLATFORM_k2l-evm = "TCI6630"
+PLATFORM_k2e-evm = "66AK2E"
+PLATFORM_k2g-evm = "66AK2G"
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index a6b6a90..f98df66 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -1,32 +1,15 @@
 DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
 HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
 
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
+require ti-ipc.inc
 
-DEPENDS += "virtual/kernel"
+PR = "${INC_PR}.0"
 
-PV = "3.41.00.02"
+DEPENDS += "virtual/kernel"
 
-BRANCH = "ipc-next"
-SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
-           file://tiipclad-daemon.sh \
-           file://0001-Add-kernel-build-dir.patch \
+SRC_URI += "file://tiipclad-daemon.sh \
+            file://0001-Add-kernel-build-dir.patch \
            "
-# Commit corresponds to 3.41.00.02-eng
-SRCREV = "b34c8ada4ed243cd52e504bf2c6fb3451dc730f8"
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PLATFORM = "UNKNOWN"
-PLATFORM_omap5-evm = "OMAP54XX"
-PLATFORM_dra7xx = "DRA7XX"
-PLATFORM_k2hk-evm = "TCI6638"
-PLATFORM_k2l-evm = "TCI6630"
-PLATFORM_k2e-evm = "66AK2E"
-PLATFORM_k2g-evm = "66AK2E"
 
 DAEMON = "UNKNOWN"
 DAEMON_omap5-evm = "lad_omap54xx_smp"
@@ -34,7 +17,7 @@ DAEMON_dra7xx = "lad_dra7xx"
 DAEMON_k2hk-evm = "lad_tci6638"
 DAEMON_k2l-evm = "lad_tci6630"
 DAEMON_k2e-evm = "lad_66ak2e"
-DAEMON_k2g-evm = "lad_66ak2e"
+DAEMON_k2g-evm = "lad_66ak2g"
 
 inherit autotools-brokensep pkgconfig update-rc.d
 


