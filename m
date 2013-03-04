Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 630D3E01498
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2013 08:31:17 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id CE70352A8E; Mon,  4 Mar 2013 16:31:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130304163115.CE70352A8E@arago-project.org>
Date: Mon,  4 Mar 2013 16:31:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: add recipe for tracking TI latest staging tree
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
X-List-Received-Date: Mon, 04 Mar 2013 16:31:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 39d1a0caa79ff270d0b838cd37250f5c58195de1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=39d1a0caa79ff270d0b838cd37250f5c58195de1

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar  4 11:12:29 2013 -0500

linux-ti-staging: add recipe for tracking TI latest staging tree

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |   44 ++++++++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
new file mode 100644
index 0000000..8cc7206
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -0,0 +1,44 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+KERNEL_IMAGETYPE = "uImage"
+
+inherit kernel
+require recipes-kernel/linux/linux-dtb.inc
+
+# Stage the power management firmware before building the kernel
+DEPENDS += "am33x-cm3"
+
+KERNEL_DEVICETREE_am335x-evm = "arch/arm/boot/dts/am335x-evm.dts"
+KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
+
+COMPATIBLE_MACHINE = "ti33x"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "ti-linux-3.8.y"
+
+SRCREV = "d26595a42220789b81a9d243e2fc0837c7776360"
+PV = "3.8.2"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+
+SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
+
+do_setup_defconfig() {
+        :
+}
+
+do_configure() {
+    oe_runmake omap2plus_defconfig
+}
+
+# Copy the am33x-cm3 firmware if it is available
+do_compile_prepend() {
+    if [ -e "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" ]
+    then
+        cp "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" "${S}/firmware"
+    fi
+}


