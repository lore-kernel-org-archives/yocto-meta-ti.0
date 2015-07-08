Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 82AF0E009C5; Wed,  8 Jul 2015 15:01:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A88E7E009C8
	for <meta-ti@yoctoproject.org>; Wed,  8 Jul 2015 15:01:24 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2FD1E52A62; Wed,  8 Jul 2015 22:01:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150708220124.2FD1E52A62@arago-project.org>
Date: Wed,  8 Jul 2015 22:01:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: add version 4.1.1
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
X-List-Received-Date: Wed, 08 Jul 2015 22:01:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5a03a4c1a5e45d620793eca72cbf09a1d886e86d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5a03a4c1a5e45d620793eca72cbf09a1d886e86d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jul  9 01:52:36 2015 +0000

linux-ti-staging: add version 4.1.1

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti-staging-4.1/configs/systest     |    1 +
 .../linux/linux-ti-staging-4.1/defconfig           |    1 +
 recipes-kernel/linux/linux-ti-staging_4.1.bb       |   67 ++++++++++++++++++++
 3 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/configs/systest b/recipes-kernel/linux/linux-ti-staging-4.1/configs/systest
new file mode 100644
index 0000000..cfe4f99
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/configs/systest
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/defconfig b/recipes-kernel/linux/linux-ti-staging-4.1/defconfig
new file mode 100644
index 0000000..990e7f7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/defconfig
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
new file mode 100644
index 0000000..c8835c2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -0,0 +1,67 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+inherit kernel
+
+require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/setup-defconfig.inc
+require recipes-kernel/linux/multi-kernel.inc
+require recipes-kernel/linux/cmem.inc
+
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
+
+# Pull in the devicetree files into the rootfs
+RDEPENDS_kernel-base += "kernel-devicetree"
+
+# Add a run-time dependency for the PM firmware to be installed
+# on the target file system.
+RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
+RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
+
+# Add a run-time dependency for the VPE VPDMA firmware to be installed
+# on the target file system.
+RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
+
+# Default is to package all dtb files for ti33x devices unless building
+# for the specific beaglebone machine.
+KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
+KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb"
+KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
+KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
+KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd10.dtb dra72-evm.dtb dra72-evm-lcd10.dtb"
+KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-evm.dtb"
+KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
+KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
+KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
+KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3|omap4"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "ti-linux-4.1.y"
+
+SRCREV = "31ae2ddea8e0ef24a8d952d39f47b82c05c51a45"
+PV = "4.1.1+git${SRCPV}"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
+
+#KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
+#KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"
+
+MULTI_CONFIG_BASE_SUFFIX = ""
+
+KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "git"
+SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
+            file://defconfig \
+           "


