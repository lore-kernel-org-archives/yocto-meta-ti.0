Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11A52E00C88; Tue,  6 Dec 2016 16:47:23 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9391CE00C93
	for <meta-ti@yoctoproject.org>; Tue,  6 Dec 2016 16:47:18 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 102F152AB4; Wed,  7 Dec 2016 00:47:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161207004717.102F152AB4@arago-project.org>
Date: Wed,  7 Dec 2016 00:47:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Reorganised recipes to help in adding ipc examples recipes
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
X-List-Received-Date: Wed, 07 Dec 2016 00:47:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 16bf3379a3428b93e7bf4282b9175f40c4509f21
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=16bf3379a3428b93e7bf4282b9175f40c4509f21

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Nov 29 20:28:10 2016 +0000

ti-ipc: Reorganised recipes to help in adding ipc examples recipes

Created ti-ipc-common.inc & ti-ipc-rtos.inc to gather common definitions
Updated commmit ids for ipc-examples
Update ti-ipc-rtos to add ALT_PLATFORM examples

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-common.inc  |   14 +++++++
 recipes-ti/ipc/ti-ipc-rtos.inc    |   65 +++++++++++++++++++++++++++++++++
 recipes-ti/ipc/ti-ipc-rtos_git.bb |   72 ++++---------------------------------
 recipes-ti/ipc/ti-ipc.inc         |   16 +--------
 recipes-ti/ipc/ti-ipc_git.bb      |    1 +
 5 files changed, 88 insertions(+), 80 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
new file mode 100644
index 0000000..ddb48bc
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -0,0 +1,14 @@
+PV = "3.44.00.00"
+INC_PR = "r2"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PLATFORM = "UNKNOWN"
+PLATFORM_omap5-evm = "OMAP54XX"
+PLATFORM_dra7xx = "DRA7XX"
+PLATFORM_k2hk-evm = "TCI6638"
+PLATFORM_k2l-evm = "TCI6630"
+PLATFORM_k2e = "66AK2E"
+PLATFORM_k2g = "66AK2G"
+
+ALT_PLATFORM_k2hk-evm = "TCI6636"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
new file mode 100644
index 0000000..e1abf36
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -0,0 +1,65 @@
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+TI_IPC_EXAMPLES_GIT_URI = "git://git.ti.com/ipc/ipc-examples.git"
+TI_IPC_EXAMPLES_DEST_SUFFIX = "git/ipc-examples"
+TI_IPC_EXAMPLES_GIT_PROTOCOL = "git"
+TI_IPC_EXAMPLES_GIT_BRANCH = "master"
+TI_IPC_EXAMPLES_NAME = "ipc-examples"
+
+SRC_URI += "${TI_IPC_EXAMPLES_GIT_URI};\
+destsuffix=${TI_IPC_EXAMPLES_DEST_SUFFIX};\
+protocol=${TI_IPC_EXAMPLES_GIT_PROTOCOL};\
+branch=${TI_IPC_EXAMPLES_GIT_BRANCH};\
+name=${TI_IPC_EXAMPLES_NAME}"
+
+TI_IPC_METADATA_GIT_URI = "git://git.ti.com/ipc/ipc-metadata.git"
+TI_IPC_METADATA_DEST_SUFFIX = "git/ipc-metadata"
+TI_IPC_METADATA_GIT_PROTOCOL = "git"
+TI_IPC_METADATA_GIT_BRANCH = "master"
+TI_IPC_METADATA_NAME = "ipc-metadata"
+
+SRC_URI += "${TI_IPC_METADATA_GIT_URI};\
+destsuffix=${TI_IPC_METADATA_DEST_SUFFIX};\
+protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
+branch=${TI_IPC_METADATA_GIT_BRANCH};\
+name=${TI_IPC_METADATA_NAME}"
+
+# Corresponds to tag: 3.44.00.00C
+SRCREV_ipc-examples = "1b73bc32c5bdd869b5121f86859afb122d286acc"
+
+# Corresponds to tag: 3.44.00.00
+SRCREV_ipc-metadata = "07a745d47ecd7b4b64860e7c5d0fbe4e89524f2e"
+
+S_ipc-examples = "${WORKDIR}/git/ipc-examples"
+S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
+
+PR = "${INC_PR}.4"
+
+DEPENDS_append_keystone = " ti-cgt6x-native \
+                            gcc-arm-none-eabi-native \
+"
+DEPENDS_append_omap-a15 = " ti-cgt6x-native \
+                            ti-ccsv6-native \
+                            gcc-arm-none-eabi-native \
+"
+IPC_TARGETS = ""
+IPC_TARGETS_omap-a15 = "\
+    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
+    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
+"
+
+IPC_TARGETS_keystone = " \
+    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
+    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+"
+
+EXTRA_OEMAKE = "\
+    PLATFORM=${PLATFORM} \
+    XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
+    BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
+    ${IPC_TARGETS} \
+"
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 5b0bed5..693a4e9 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -1,50 +1,8 @@
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
 require ti-ipc.inc
-
-TI_IPC_EXAMPLES_GIT_URI = "git://git.ti.com/ipc/ipc-examples.git"
-TI_IPC_EXAMPLES_DEST_SUFFIX = "git/ipc-examples"
-TI_IPC_EXAMPLES_GIT_PROTOCOL = "git"
-TI_IPC_EXAMPLES_GIT_BRANCH = "master"
-TI_IPC_EXAMPLES_NAME = "ipc-examples"
-
-SRC_URI += "${TI_IPC_EXAMPLES_GIT_URI};\
-destsuffix=${TI_IPC_EXAMPLES_DEST_SUFFIX};\
-protocol=${TI_IPC_EXAMPLES_GIT_PROTOCOL};\
-branch=${TI_IPC_EXAMPLES_GIT_BRANCH};\
-name=${TI_IPC_EXAMPLES_NAME}"
-
-TI_IPC_METADATA_GIT_URI = "git://git.ti.com/ipc/ipc-metadata.git"
-TI_IPC_METADATA_DEST_SUFFIX = "git/ipc-metadata"
-TI_IPC_METADATA_GIT_PROTOCOL = "git"
-TI_IPC_METADATA_GIT_BRANCH = "master"
-TI_IPC_METADATA_NAME = "ipc-metadata"
-
-SRC_URI += "${TI_IPC_METADATA_GIT_URI};\
-destsuffix=${TI_IPC_METADATA_DEST_SUFFIX};\
-protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
-branch=${TI_IPC_METADATA_GIT_BRANCH};\
-name=${TI_IPC_METADATA_NAME}"
-
-# Corresponds to tag: 3.44.00.00
-SRCREV_ipc-examples = "a934d057647af00401e4bfd1c6a4a0f6144441b7"
-
-# Corresponds to tag: 3.44.00.00
-SRCREV_ipc-metadata = "07a745d47ecd7b4b64860e7c5d0fbe4e89524f2e"
-
-S_ipc-examples = "${WORKDIR}/git/ipc-examples"
-S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
-
-PR = "${INC_PR}.3"
+require ti-ipc-common.inc
+require ti-ipc-rtos.inc
 
 DEPENDS = "ti-xdctools ti-sysbios doxygen-native zip-native"
-DEPENDS_append_keystone = " ti-cgt6x-native \
-                            gcc-arm-none-eabi-native \
-"
-DEPENDS_append_omap-a15 = " ti-cgt6x-native \
-                            ti-ccsv6-native \
-                            gcc-arm-none-eabi-native \
-"
 
 PACKAGES =+ "${PN}-fw"
 FILES_${PN}-fw = "${base_libdir}/firmware/*"
@@ -55,27 +13,6 @@ INSANE_SKIP_${PN}-dev += "arch"
 
 ALLOW_EMPTY_${PN} = "1"
 
-IPC_TARGETS = ""
-IPC_TARGETS_omap-a15 = "\
-    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
-    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
-    ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
-    ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
-"
-
-IPC_TARGETS_keystone = " \
-    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
-    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
-    ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
-"
-
-EXTRA_OEMAKE = "\
-    PLATFORM=${PLATFORM} \
-    XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
-    BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
-    ${IPC_TARGETS} \
-"
-
 RELEASE_TYPE = "GA"
 RELEASE_SUFFIX = ""
 
@@ -93,6 +30,11 @@ do_compile() {
   cd ${S_ipc-examples}/src
   oe_runmake .examples \
     IPCTOOLS="${S_ipc-metadata}/src/etc"
+  if [ ! -z ${ALT_PLATFORM} ]; then
+    oe_runmake .examples \
+      IPCTOOLS="${S_ipc-metadata}/src/etc" \
+      PLATFORM=${ALT_PLATFORM}
+  fi
 
   if [  "${PLATFORM}" != "UNKNOWN" ]; then
     oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${S}"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 488e0fc..2d38367 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "ipc-next"
+TI_IPC_GIT_BRANCH = "3.44"
 
 #Corresponds to 3.44.00.00
 TI_IPC_SRCREV = "a1852fc8b254ed207bd1c1c88f5b362c9b6cc454"
@@ -16,17 +16,3 @@ SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};na
 SRCREV = "${TI_IPC_SRCREV}"
 
 S = "${WORKDIR}/git"
-PV = "3.44.00.00"
-INC_PR = "r1"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PLATFORM = "UNKNOWN"
-PLATFORM_omap5-evm = "OMAP54XX"
-PLATFORM_dra7xx = "DRA7XX"
-PLATFORM_k2hk-evm = "TCI6638"
-PLATFORM_k2l-evm = "TCI6630"
-PLATFORM_k2e = "66AK2E"
-PLATFORM_k2g = "66AK2G"
-
-ALT_PLATFORM_k2hk-evm = "TCI6636"
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index cd844b4..6ccd2c4 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Mul
 HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
 
 require ti-ipc.inc
+require ti-ipc-common.inc
 
 PR = "${INC_PR}.0"
 


