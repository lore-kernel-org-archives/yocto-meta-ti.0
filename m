Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 851DCE00942; Thu, 15 Jan 2015 18:57:50 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E7F8E00782
	for <meta-ti@yoctoproject.org>; Thu, 15 Jan 2015 18:57:40 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8878952A2E; Fri, 16 Jan 2015 02:57:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150116025740.8878952A2E@arago-project.org>
Date: Fri, 16 Jan 2015 02:57:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : sitara-linux-ti-staging: Create recipe for Sitara 3 .14 kernel tree
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
X-List-Received-Date: Fri, 16 Jan 2015 02:57:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 9e1ca2d9e169c7edd67e0839b838dc7bcf6ef6d1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9e1ca2d9e169c7edd67e0839b838dc7bcf6ef6d1

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Thu Jan 15 02:43:29 2015 +0000

sitara-linux-ti-staging: Create recipe for Sitara 3.14 kernel tree

* The Sitara 3.14 Kernel tree is based on the linux-ti-staging_3.14 recipe and
  kernel. However, the tree includes additional patches and configs.
* This tree is only meant for AM335x and AM437x

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/sitara-linux-ti-staging-3.14/defconfig   |    1 +
 .../linux/sitara-linux-ti-staging_3.14.bb          |   51 ++++++++++++++++++++
 2 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig b/recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig
new file mode 100644
index 0000000..98c4069
--- /dev/null
+++ b/recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig
@@ -0,0 +1 @@
+use-kernel-config=singlecore-omap2plus_defconfig
diff --git a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
new file mode 100644
index 0000000..f9c4641
--- /dev/null
+++ b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
@@ -0,0 +1,51 @@
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
+
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.14:"
+
+# Pull in the devicetree files into the rootfs
+RDEPENDS_kernel-base += "kernel-devicetree"
+
+# Add a run-time dependency for the PM firmware to be installed
+# on the target file system.
+RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
+RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
+
+
+# Default is to package all dtb files for ti33x devices unless building
+# for the specific beaglebone machine.
+KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
+KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb"
+KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "sitara-ti-linux-3.14.y"
+
+SRCREV = "2d7148a3a95a2811604611f6c66a8826a61b8b12"
+PV = "3.14.26"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+MULTI_CONFIG_BASE_SUFFIX = ""
+
+KERNEL_GIT_URI = "git://git.ti.com/sitara-linux/sitara-linux.git"
+KERNEL_GIT_PROTOCOL = "git"
+SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
+            file://defconfig \
+           "


