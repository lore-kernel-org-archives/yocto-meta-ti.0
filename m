Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37691E006F1; Wed,  2 Jul 2014 13:03:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DD11E006F1
	for <meta-ti@yoctoproject.org>; Wed,  2 Jul 2014 13:03:23 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EC14852AB8; Wed,  2 Jul 2014 20:03:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140702200315.EC14852AB8@arago-project.org>
Date: Wed,  2 Jul 2014 20:03:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : Update dra7xx-evm settings to use dra7xx SOC_FAMILY
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
X-List-Received-Date: Wed, 02 Jul 2014 20:03:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f4f82f787cb684ca4129729dbcfe34ee596b74c5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f4f82f787cb684ca4129729dbcfe34ee596b74c5

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Tue Jul  1 19:36:09 2014 +0000

Update dra7xx-evm settings to use dra7xx SOC_FAMILY

* Update to use the dra7xx SOC_FAMILY instead of the specific
  dra7xx-evm machine type.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb   |   20 +++++++++++++++++---
 recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb        |    2 +-
 recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++--
 recipes-kernel/linux/linux-ti-staging_3.14.bb |    4 ++--
 recipes-ti/ipc/ti-ipc.inc                     |    4 ++--
 5 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
index c3017fe..7f67c39 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
@@ -1,13 +1,27 @@
+python __anonymous() {
+    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
+    if not features:
+        return
+    if "mmip" not in features:
+        raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
+}
+
 DESCRIPTION = "Firmware for IPU "
 
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM_dra7xx-evm = "file://MMIP-${PV}-Manifest.doc;md5=64ca6f9d7e5243b8a4084eb918a543bc"
+LIC_FILES_CHKSUM_dra7xx = "file://MMIP-${PV}-Manifest.doc;md5=64ca6f9d7e5243b8a4084eb918a543bc"
 LIC_FILES_CHKSUM_omap5-evm = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679ed329c45"
 
 COMPATIBLE_MACHINE = "omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-3.00.04.02.tar.gz;protocol=http;name=${MACHINE}"
+# Need to set the PLATFORM variable since now multiple MACHINEs are sharing
+# a common named tarball
+PLATFORM = "UNKNOWN"
+PLATFORM_dra7xx = "dra7xx-evm"
+PLATFORM_omap5-evm = "omap5-evm"
+
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${PLATFORM}-3.00.04.02.tar.gz;protocol=http;name=${PLATFORM}"
 
 # DRA7xx checksums
 SRC_URI[dra7xx-evm.md5sum] = "da04c03b0fd57901e8283afa80f81379"
@@ -19,7 +33,7 @@ SRC_URI[omap5-evm.sha256sum] = "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da
 
 S = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
 
-TARGET_dra7xx-evm = "dra7-ipu2-fw.xem4"
+TARGET_dra7xx = "dra7-ipu2-fw.xem4"
 TARGET_omap5-evm = "ducati-m3-core0.xem3"
 
 do_install() {
diff --git a/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb b/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
index fb3012a..14f059b 100644
--- a/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
+++ b/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
@@ -5,7 +5,7 @@ DEPENDS += "virtual/kernel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
 
-COMPATIBLE_MACHINE = "dra7xx-evm"
+COMPATIBLE_MACHINE = "dra7xx"
 
 PV = "1b8"
 PR = "r1"
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 90dab23..e288a6d 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -21,7 +21,7 @@ RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
 
 # Add a run-time dependency for the VPE VPDMA firmware to be installed
 # on the target file system.
-RDEPENDS_kernel-base_append_dra7xx-evm = " vpe-vpdma-fw"
+RDEPENDS_kernel-base_append_dra7xx = " vpe-vpdma-fw"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -29,7 +29,7 @@ KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335
 KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
+KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 5c8022b..8c12bad 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -23,7 +23,7 @@ RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
 
 # Add a run-time dependency for the VPE VPDMA firmware to be installed
 # on the target file system.
-RDEPENDS_kernel-base_append_dra7xx-evm = " vpe-vpdma-fw"
+RDEPENDS_kernel-base_append_dra7xx = " vpe-vpdma-fw"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -31,7 +31,7 @@ KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335
 KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
+KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb"
 KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
 KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
 KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index ee9feff..860f55f 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -12,12 +12,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PLATFORM = "UNKNOWN"
 PLATFORM_omap5-evm = "OMAP54XX"
-PLATFORM_dra7xx-evm = "DRA7XX"
+PLATFORM_dra7xx = "DRA7XX"
 PLATFORM_keystone = "TCI6638"
 
 DAEMON = "UNKNOWN"
 DAEMON_omap5-evm = "lad_omap54xx_smp"
-DAEMON_dra7xx-evm = "lad_dra7xx"
+DAEMON_dra7xx = "lad_dra7xx"
 DAEMON_keystone = "lad_tci6638"
 
 inherit autotools pkgconfig update-rc.d


