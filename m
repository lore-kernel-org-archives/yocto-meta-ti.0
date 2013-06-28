Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8C85E01408
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2013 10:16:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 66E635298D; Fri, 28 Jun 2013 17:16:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130628171659.66E635298D@arago-project.org>
Date: Fri, 28 Jun 2013 17:16:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Siddharth Heroor : recipes-kernel: Add GLSDK specific kernel tree for omap-a15
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
X-List-Received-Date: Fri, 28 Jun 2013 17:16:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: ef124402251d9d9eadb177784c6c0c1371adbc16
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ef124402251d9d9eadb177784c6c0c1371adbc16

Author: Siddharth Heroor <heroor@ti.com>
Date:   Fri Jun 28 13:15:54 2013 -0400

recipes-kernel: Add GLSDK specific kernel tree for omap-a15

* Machine compatible with only omap-a15 devices.
* The TI Staging tree will not be used to maintain K3.8. Instead,
  this new tree is set up as a production tree. Pending features
  for 3.8 will be implemented on this tree.
  - Backported features from linux mainline
  - Backported bug-fixes from linux mainline and linux-stable.
  - Features implemented by the GLSDK team which maybe product
    specific.
  This is the tree on which GLSDK kernel releases will be made.
* This recipe is based off the Core SDK 2013.04.02 released kernel
  recipe - recipes-kernel/linux/linux-ti-staging_3.8.bb

Signed-off-by: Siddharth Heroor <heroor@ti.com>
cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-glsdk/defconfig |    1 +
 recipes-kernel/linux/linux-ti-glsdk_3.8.bb    |   31 +++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-glsdk/defconfig b/recipes-kernel/linux/linux-ti-glsdk/defconfig
new file mode 100644
index 0000000..926b35a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-glsdk/defconfig
@@ -0,0 +1 @@
+use-kernel-config=omap2plus_defconfig
diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
new file mode 100644
index 0000000..2746188
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -0,0 +1,31 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI devices supported by the GLSDK product"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+KERNEL_IMAGETYPE = "uImage"
+
+inherit kernel
+
+require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/setup-defconfig.inc
+
+KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts arch/arm/boot/dts/omap5-uevm.dts"
+KERNEL_DEVICETREE_dra7xx-evm = "arch/arm/boot/dts/dra7-evm.dts"
+
+COMPATIBLE_MACHINE = "omap-a15"
+
+DEFAULT_PREFERENCE = "-1"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "master"
+
+SRCREV = "4e8193eb3b7465d7f67cd8c7e6c2ed99dad1a483"
+PV = "3.8.13"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+
+SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-kernel.git;protocol=git;branch=${BRANCH} \
+           file://defconfig \
+          "


