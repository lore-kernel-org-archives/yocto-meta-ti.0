Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF4E1E00B95
	for <meta-ti@yoctoproject.org>; Wed, 26 Mar 2014 12:58:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A066A52A7E; Wed, 26 Mar 2014 19:58:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140326195830.A066A52A7E@arago-project.org>
Date: Wed, 26 Mar 2014 19:58:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-mainline: add 3.14 mainline recipe
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
X-List-Received-Date: Wed, 26 Mar 2014 19:58:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: b5d21cb2f4f0ab9e898d208239867b0c5ea969bc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b5d21cb2f4f0ab9e898d208239867b0c5ea969bc

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Mar 27 00:11:23 2014 +0000

linux-mainline: add 3.14 mainline recipe

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-mainline/defconfig |    1 +
 recipes-kernel/linux/linux-mainline_3.14.bb   |   37 +++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-mainline/defconfig b/recipes-kernel/linux/linux-mainline/defconfig
new file mode 100644
index 0000000..926b35a
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline/defconfig
@@ -0,0 +1 @@
+use-kernel-config=omap2plus_defconfig
diff --git a/recipes-kernel/linux/linux-mainline_3.14.bb b/recipes-kernel/linux/linux-mainline_3.14.bb
new file mode 100644
index 0000000..559a79b
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline_3.14.bb
@@ -0,0 +1,37 @@
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
+# Corresponds to tag v3.14-rc8
+SRCREV = "b098d6726bbfb94c06d6e1097466187afddae61f"
+PV = "3.13+3.14rc8"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;branch=${BRANCH} \
+           file://defconfig \
+          "


