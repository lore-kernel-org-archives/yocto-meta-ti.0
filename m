Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B022E00939
	for <meta-ti@yoctoproject.org>; Tue, 25 Mar 2014 14:19:21 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3000M4KGJCDA50@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 25 Mar 2014 16:19:03 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0ABF5201B7; Tue,
	25 Mar 2014 17:18:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 25 Mar 2014 17:18:47 -0400
Message-id: <1395782327-31514-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH v2] linux-mainline: add 3.14 mainline recipe
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
X-List-Received-Date: Tue, 25 Mar 2014 21:19:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - update to rc8, drop MACHINE_KERNEL_PR

 recipes-kernel/linux/linux-mainline/defconfig |  1 +
 recipes-kernel/linux/linux-mainline_3.14.bb   | 41 +++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-mainline/defconfig
 create mode 100644 recipes-kernel/linux/linux-mainline_3.14.bb

diff --git a/recipes-kernel/linux/linux-mainline/defconfig b/recipes-kernel/linux/linux-mainline/defconfig
new file mode 100644
index 0000000..926b35a
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline/defconfig
@@ -0,0 +1 @@
+use-kernel-config=omap2plus_defconfig
diff --git a/recipes-kernel/linux/linux-mainline_3.14.bb b/recipes-kernel/linux/linux-mainline_3.14.bb
new file mode 100644
index 0000000..ec7d7a7
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline_3.14.bb
@@ -0,0 +1,41 @@
+SECTION = "kernel"
+DESCRIPTION = "Mainline Linux kernel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+inherit kernel
+
+require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/setup-defconfig.inc
+
+# Pull in the devicetree files into the rootfs
+RDEPENDS_kernel-base += "kernel-devicetree"
+
+# Add a run-time dependency for the PM firmware to be installed
+# on the target file system.
+RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
+
+# Default is to package all dtb files for ti33x devices unless building
+# for the specific beaglebone machine.
+KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
+KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+
+COMPATIBLE_MACHINE = "ti33x"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "master"
+
+# Corresponds to tag v3.14-rc5
+SRCREV = "0414855fdc4a40da05221fc6062cccbc0c30f169"
+PV = "3.13+3.14rc5"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;branch=${BRANCH} \
+           file://defconfig \
+          "
-- 
1.8.3.2


