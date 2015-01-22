Return-Path: <nikhil.nd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5398DE00902; Thu, 22 Jan 2015 06:06:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19DA4E007C1
	for <meta-ti@yoctoproject.org>; Thu, 22 Jan 2015 06:06:31 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0ME6VMv023752
	for <meta-ti@yoctoproject.org>; Thu, 22 Jan 2015 08:06:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0ME6T0s023745
	for <meta-ti@yoctoproject.org>; Thu, 22 Jan 2015 08:06:29 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 22 Jan 2015 08:06:29 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0ME6ScR020354;
	Thu, 22 Jan 2015 08:06:28 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 Jan 2015 19:36:16 +0530
Message-ID: <1421935576-13505-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: karthik.ramanan@ti.com
Subject: [PATCH] vpdma-fw: Separate vpdma-fw and vpe-tests recipe
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
X-List-Received-Date: Thu, 22 Jan 2015 14:06:43 -0000
Content-Type: text/plain

VPDMA firmware is published publicly as IPUMM firmware.
This patch creates a separate recipe for VPDMA firmware.
Also, it updates the package names in kernel dependencies.

The vpe-tests is an independent recipe which can be included
in the packagegroup if required.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb      |   25 ++++++++++++++++++++
 recipes-bsp/vpe-tests/vpe-tests_git.bb        |   23 ++++++++++++++++++
 recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb        |   31 -------------------------
 recipes-kernel/linux/linux-ti-staging_3.12.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_3.14.bb |    2 +-
 5 files changed, 50 insertions(+), 33 deletions(-)
 create mode 100644 recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
 create mode 100644 recipes-bsp/vpe-tests/vpe-tests_git.bb
 delete mode 100644 recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb

diff --git a/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
new file mode 100644
index 0000000..4707f17
--- /dev/null
+++ b/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "VPDMA firmware for Video Input Port and Video Processing Engine"
+
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fd463c9500441ed91d07a0331baa635c"
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS += "virtual/kernel"
+
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vpdma-fw/03-2012/exports/vpdma-fw_03-2012.tar.gz;protocol=http;name=dra7xx-evm"
+SRC_URI[dra7xx-evm.md5sum] = "80176df1350c21d9efa90171789c546e"
+SRC_URI[dra7xx-evm.sha256sum] = "a0b254ffd0c7f481cb3989e632088f5e4a233c73a1c676faa3061721ea60dc90"
+
+S = "${WORKDIR}/vpdma-fw-${PV}"
+TARGET = "vpdma-1b8.bin"
+
+do_install() {
+    mkdir -p ${D}${base_libdir}/firmware
+    cp ${S}/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+}
+
+FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
+
+PR = "r1"
diff --git a/recipes-bsp/vpe-tests/vpe-tests_git.bb b/recipes-bsp/vpe-tests/vpe-tests_git.bb
new file mode 100644
index 0000000..a8ee7f8
--- /dev/null
+++ b/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "VPE test program"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
+
+COMPATIBLE_MACHINE = "dra7xx"
+
+SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
+BRANCH ?= "master"
+
+SRC_URI = "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
+
+# The test application needs additional include headers from the kernel
+EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOATABI}" KDIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include"'
+
+do_install() {
+    oe_runmake DESTDIR="${D}" install
+}
+
diff --git a/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb b/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
deleted file mode 100644
index f7a63ab..0000000
--- a/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "VPE VPDMA firmware and test program"
-
-DEPENDS += "virtual/kernel"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
-
-COMPATIBLE_MACHINE = "dra7xx"
-
-PV = "1b8"
-PR = "r2"
-
-SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
-BRANCH ?= "master"
-
-SRC_URI = "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
-
-# The test application needs additional include headers from the kernel
-EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOATABI}" KDIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include"'
-
-do_install() {
-    oe_runmake DESTDIR="${D}" install
-}
-
-# Separate the firmware into it's own package.
-PACKAGES =+ "${PN}-fw"
-FILES_${PN}-fw += "${base_libdir}/firmware"
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 27a3f35..358bd1b 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -21,7 +21,7 @@ RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
 
 # Add a run-time dependency for the VPE VPDMA firmware to be installed
 # on the target file system.
-RDEPENDS_kernel-base_append_dra7xx = " vpe-vpdma-fw"
+RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index d762be8..4bcbee5 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -22,7 +22,7 @@ RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
 
 # Add a run-time dependency for the VPE VPDMA firmware to be installed
 # on the target file system.
-RDEPENDS_kernel-base_append_dra7xx = " vpe-vpdma-fw"
+RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
-- 
1.7.9.5


