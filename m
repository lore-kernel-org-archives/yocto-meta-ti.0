Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A39E8E00C20; Mon, 28 Nov 2016 07:34:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FBC2E00BF3
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2016 07:34:27 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id uASFYQav001132
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2016 09:34:26 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uASFYQUV020752
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2016 09:34:26 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 28 Nov 2016 09:34:25 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uASFYP73015900;	Mon, 28 Nov 2016 09:34:25 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 28 Nov 2016 10:34:23 -0500
Message-ID: <1480347263-52398-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-ipc: Reorganised recipes to help in adding ipc examples recipes
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
X-List-Received-Date: Mon, 28 Nov 2016 15:34:29 -0000
Content-Type: text/plain

Created ti-ipc-common.inc & ti-ipc-rtos.inc to gather common definitions
Updated commmit ids for ipcdev and ipc-examples

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc  | 14 ++++++++
 recipes-ti/ipc/ti-ipc-rtos.inc    | 65 +++++++++++++++++++++++++++++++++++++
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 67 ++-------------------------------------
 recipes-ti/ipc/ti-ipc.inc         | 16 +---------
 recipes-ti/ipc/ti-ipc_git.bb      |  1 +
 5 files changed, 83 insertions(+), 80 deletions(-)
 create mode 100644 recipes-ti/ipc/ti-ipc-common.inc
 create mode 100644 recipes-ti/ipc/ti-ipc-rtos.inc

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
new file mode 100644
index 0000000..39505e5
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -0,0 +1,14 @@
+PV = "3.44.00.00"
+INC_PR = "r1"
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
index 0000000..c960404
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
+# Corresponds to tag: 3.44.00.00B
+SRCREV_ipc-examples = "bc51211e9c2ce239e4aa56a5d74e0f48b242afa5"
+
+# Corresponds to tag: 3.44.00.00
+SRCREV_ipc-metadata = "07a745d47ecd7b4b64860e7c5d0fbe4e89524f2e"
+
+S_ipc-examples = "${WORKDIR}/git/ipc-examples"
+S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
+
+PR = "${INC_PR}.3"
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
index 5b0bed5..c3826dc 100644
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
 
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 488e0fc..3e6831a 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -9,24 +9,10 @@ TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "ipc-next"
 
 #Corresponds to 3.44.00.00
-TI_IPC_SRCREV = "a1852fc8b254ed207bd1c1c88f5b362c9b6cc454"
+TI_IPC_SRCREV = "39f4676ab809e8992c7598636cda0b8dd5956493"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
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
 
-- 
1.9.1


