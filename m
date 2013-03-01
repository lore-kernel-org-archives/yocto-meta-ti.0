Return-Path: <denys@ti.com>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 623CBE002AB
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2013 17:08:12 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIY001ZTJ5NPYR3@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 28 Feb 2013 19:08:11 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EA7962008D; Thu,
	28 Feb 2013 20:08:10 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 28 Feb 2013 20:08:06 -0500
Message-id: <1362100086-2553-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] linux-ti-staging: add recipe for tracking TI latest staging tree
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
X-List-Received-Date: Fri, 01 Mar 2013 01:08:12 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...CK-avoid-race-conditions-in-modules_insta.patch | 38 +++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_git.bb       | 47 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0001-Makefile-HACK-avoid-race-conditions-in-modules_insta.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging_git.bb

diff --git a/recipes-kernel/linux/linux-ti-staging/0001-Makefile-HACK-avoid-race-conditions-in-modules_insta.patch b/recipes-kernel/linux/linux-ti-staging/0001-Makefile-HACK-avoid-race-conditions-in-modules_insta.patch
new file mode 100644
index 0000000..2179ad5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0001-Makefile-HACK-avoid-race-conditions-in-modules_insta.patch
@@ -0,0 +1,38 @@
+From 229f9813fb998eb25afc283b6cab29415eaf60e4 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 28 Feb 2013 19:13:02 -0500
+Subject: [PATCH] Makefile: HACK: avoid race conditions in modules_install with
+ dtbs
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ Makefile | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9f3f11d..ba0bf66 100644
+--- a/Makefile
++++ b/Makefile
+@@ -957,11 +957,7 @@ modules_prepare: prepare scripts
+ 
+ # Target to install modules
+ PHONY += modules_install
+-ifeq ($(ARCH), arm)
+-modules_install: _modinst_ _modinst_post dtbs
+-else
+ modules_install: _modinst_ _modinst_post
+-endif
+ 
+ PHONY += _modinst_
+ _modinst_:
+@@ -977,6 +973,7 @@ _modinst_:
+ 	@cp -f $(objtree)/modules.builtin $(MODLIB)/
+ 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
+ ifeq ($(ARCH), arm)
++	$(Q)$(MAKE) dtbs
+ 	@mkdir -p $(INSTALL_FW_PATH)/device-tree
+ 	@cp $(objtree)/arch/arm/boot/dts/*.dtb $(INSTALL_FW_PATH)/device-tree/
+ endif
+-- 
+1.8.1.4
+
diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
new file mode 100644
index 0000000..c6462b1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -0,0 +1,47 @@
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
+SRCREV = "3595805f275d9a9225f14b9863228e0f91fb58d0"
+PV = "3.8.1"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+
+SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
+
+# Fix DTB Makefile race issues
+SRC_URI += "file://0001-Makefile-HACK-avoid-race-conditions-in-modules_insta.patch"
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
-- 
1.8.1.4


