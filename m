Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EA38E01358
	for <meta-ti@yoctoproject.org>; Mon, 26 Aug 2013 07:36:34 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id AA95B52A6C; Mon, 26 Aug 2013 14:36:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130826143632.AA95B52A6C@arago-project.org>
Date: Mon, 26 Aug 2013 14:36:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: add the latest integration tree in prep for 3.12 release
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
X-List-Received-Date: Mon, 26 Aug 2013 14:36:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2550014973c27721a128692ae75ab24d5cd94a57
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2550014973c27721a128692ae75ab24d5cd94a57

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Aug 23 15:46:07 2013 -0400

linux-ti-staging: add the latest integration tree in prep for 3.12 release

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |   42 ++++++++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
new file mode 100644
index 0000000..cb59dbb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -0,0 +1,42 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+KERNEL_IMAGETYPE = "uImage"
+
+inherit kernel
+
+require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/setup-defconfig.inc
+
+# Add a run-time dependency for the PM firmware to be installed
+# on the target file system.
+RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
+
+# Default is to package all dts files for ti33x devices unless building
+# for the specific beaglebone machine.
+KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
+KERNEL_DEVICETREE_am437x-evm = "arch/arm/boot/dts/am43x-epos-evm.dts"
+KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
+KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts arch/arm/boot/dts/omap5-uevm.dts"
+KERNEL_DEVICETREE_dra7xx-evm = "arch/arm/boot/dts/dra7-evm.dts"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+
+DEFAULT_PREFERENCE = "-1"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "ti-linux-3.12.y"
+
+SRCREV = "b36f4be3de1b123d8601de062e7dbfc904f305fb"
+PV = "3.10+3.11-rc6"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+
+SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
+           file://defconfig \
+          "


