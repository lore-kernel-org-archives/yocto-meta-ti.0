Return-Path: <denys@ti.com>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FF6AE003D6
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 19:59:16 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MDM003I35QCPC70@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 16 Nov 2012 21:59:00 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 17BD220024; Fri,
	16 Nov 2012 22:59:00 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 16 Nov 2012 22:58:59 -0500
Message-id: <1353124739-28089-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] u-boot: add version 2012.07 for keystone machines
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
X-List-Received-Date: Sat, 17 Nov 2012 03:59:16 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/keystone-evm.conf       |  2 +-
 recipes-bsp/u-boot/u-boot_2012.07.bb | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/u-boot/u-boot_2012.07.bb

diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
index 188d53c..0b6d7ab 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/keystone-evm.conf
@@ -18,6 +18,6 @@ IMAGE_FSTYPES += "tar.bz2"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
-UBOOT_MACHINE = "keystone_config"
+UBOOT_MACHINE = "tci6638_evm_config"
 
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
diff --git a/recipes-bsp/u-boot/u-boot_2012.07.bb b/recipes-bsp/u-boot/u-boot_2012.07.bb
new file mode 100644
index 0000000..76dde3b
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2012.07.bb
@@ -0,0 +1,25 @@
+require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+
+DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+COMPATIBLE_MACHINE = "keystone"
+
+DEFAULT_PREFERENCE = "-1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r0+gitr${SRCPV}"
+
+SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "master"
+
+SRCREV = "6e710c61dba2665e01c900470a0a63743ff431c6"
+
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
+
+S = "${WORKDIR}/git"
+
+UBOOT_SUFFIX = "bin"
-- 
1.8.0


