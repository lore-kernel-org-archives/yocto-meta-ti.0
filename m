Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8170E019FF; Tue, 27 Jan 2015 17:02:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74C19E01A04
	for <meta-ti@yoctoproject.org>; Tue, 27 Jan 2015 17:02:40 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C97E252AF9; Wed, 28 Jan 2015 01:02:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150128010236.C97E252AF9@arago-project.org>
Date: Wed, 28 Jan 2015 01:02:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Nikhil Devshatwar : vpdma-fw: Separate vpdma-fw and vpe-tests recipe
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
X-List-Received-Date: Wed, 28 Jan 2015 01:02:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7cddc2a6d92d14164916d6cf303f4bdb38f47b4a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7cddc2a6d92d14164916d6cf303f4bdb38f47b4a

Author: Nikhil Devshatwar <nikhil.nd@ti.com>
Date:   Thu Jan 22 20:06:16 2015 +0000

vpdma-fw: Separate vpdma-fw and vpe-tests recipe

VPDMA firmware is published publicly as IPUMM firmware.
This patch creates a separate recipe for VPDMA firmware.
Also, it updates the package names in kernel dependencies.

The vpe-tests is an independent recipe which can be included
in the packagegroup if required.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb           |   25 ++++++++++++++++++++
 .../vpe-tests_git.bb}                              |   10 +-------
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |    2 +-
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |    2 +-
 4 files changed, 28 insertions(+), 11 deletions(-)

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
diff --git a/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb b/recipes-bsp/vpe-tests/vpe-tests_git.bb
similarity index 77%
rename from recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
rename to recipes-bsp/vpe-tests/vpe-tests_git.bb
index f7a63ab..a8ee7f8 100644
--- a/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
+++ b/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -1,15 +1,10 @@
-DESCRIPTION = "VPE VPDMA firmware and test program"
-
-DEPENDS += "virtual/kernel"
+DESCRIPTION = "VPE test program"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
-PV = "1b8"
-PR = "r2"
-
 SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
 BRANCH ?= "master"
 
@@ -26,6 +21,3 @@ do_install() {
     oe_runmake DESTDIR="${D}" install
 }
 
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
index 2192e3c..c8cbc93 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -22,7 +22,7 @@ RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
 
 # Add a run-time dependency for the VPE VPDMA firmware to be installed
 # on the target file system.
-RDEPENDS_kernel-base_append_dra7xx = " vpe-vpdma-fw"
+RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.


